import { useState, useEffect } from "react";
import { useNavigate } from "react-router-dom";
import { useSelector, useDispatch } from "react-redux";
import PageLayout from "../Layout/pageLayout.jsx";
import { BarChart, Plus, X } from "lucide-react";
import { logout } from "../Redux/authSlice";
import api from "../services/api";
import toast, { Toaster } from "react-hot-toast";

function Prediction() {
  const navigate = useNavigate();
  const dispatch = useDispatch();

  // Get user data from Redux store
  const { user, loader } = useSelector((state) => state.auth);
  const [availableCoals, setAvailableCoals] = useState([]);

  // State for managing multiple blend panels
  const [panels, setPanels] = useState([
    {
      id: 1,
      numCoals: "",
      coalSelections: [{ id: 1, coalId: "", percentage: "" }],
      totalPercentage: 0,
      boilerParams: {
        load: 100,
        feed_water_temp: 245,
        running_plant_load_factor: 100,
        air_to_fuel_ratio: 2.2,
      },
      results: null,
    },
  ]);

  const [isPanelLoading, setIsPanelLoading] = useState({});

  // Add state for search input and filtered coals
  const [searchInputs, setSearchInputs] = useState({});
  const [filteredCoals, setFilteredCoals] = useState({});

  // Check authentication and redirect if needed
  useEffect(() => {
    if (!loader && !user) {
      navigate("/login");
    }
  }, [loader, user, navigate]);

  // If loading or not authenticated, show loading state
  if (loader || !user) {
    return (
      <PageLayout title="Prediction">
        <div className="flex items-center justify-center h-full">
          <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-yellow-500"></div>
        </div>
      </PageLayout>
    );
  }


  // Fetch available coals on component mount
  useEffect(() => {
    const fetchCoals = async () => {
      try {
        const response = await api.get("/coals/available");
        setAvailableCoals(response.data.coals);
      } catch (error) {
        console.error("Error fetching coals:", error);
        // Fallback to empty array or show error
        setAvailableCoals([]);
      }
    };

    fetchCoals();
  }, []);

  // Add a new blend panel
  const addPanel = () => {
    const newId = panels.length > 0 ? Math.max(...panels.map((p) => p.id)) + 1 : 1;
    setPanels([
      ...panels,
      {
        id: newId,
        numCoals: "",
        coalSelections: [{ id: 1, coalId: "", percentage: "" }],
        totalPercentage: 0,
        boilerParams: {
          load: 100,
          feed_water_temp: 245,
          running_plant_load_factor: 100,
          air_to_fuel_ratio: 2.2,
        },
        results: null,
      },
    ]);
  };

  // Remove a blend panel
  const removePanel = (panelId) => {
    if (panels.length > 1) {
      setPanels(panels.filter((panel) => panel.id !== panelId));
    }
  };

  // Handle changing the number of coals for a specific panel
  const handleNumCoalsChange = (panelId, e) => {
    const num = Number.parseInt(e.target.value) || "";

    // Clear search inputs for added/removed coals to prevent stuck values
    setSearchInputs((prev) => {
      const next = { ...prev };
      const panel = panels.find((p) => p.id === panelId);

      if (panel) {
        // Determine range of indices to clear (from current count + 1 up to new count, or vice versa)
        const start = Math.min(panel.coalSelections.length, num) + 1;
        const end = Math.max(panel.coalSelections.length, num);

        for (let i = start; i <= end; i++) {
          delete next[`${panelId}-${i}`];
        }
      }
      return next;
    });

    setPanels(
      panels.map((panel) => {
        if (panel.id === panelId) {
          let newCoalSelections = [...panel.coalSelections];

          if (num > panel.coalSelections.length) {
            // Add new empty coal selections
            for (let i = panel.coalSelections.length + 1; i <= num; i++) {
              newCoalSelections.push({ id: i, coalId: "", percentage: "" });
            }
          } else if (num < panel.coalSelections.length) {
            // Remove excess coal selections
            newCoalSelections = panel.coalSelections.slice(0, num);
          }

          // Recalculate total percentage
          const total = newCoalSelections.reduce(
            (sum, coal) => sum + (Number.parseFloat(coal.percentage) || 0),
            0
          );

          return {
            ...panel,
            numCoals: num,
            coalSelections: newCoalSelections,
            totalPercentage: total,
          };
        }
        return panel;
      })
    );
  };

  // Handle coal selection change for a specific panel
  const handleCoalChange = (panelId, coalId, field, value) => {
    setPanels(
      panels.map((panel) => {
        if (panel.id === panelId) {
          const updatedSelections = panel.coalSelections.map((coal) =>
            coal.id === coalId ? { ...coal, [field]: value } : coal
          );

          // Update total percentage if the percentage field was changed
          let totalPercentage = panel.totalPercentage;
          if (field === "percentage") {
            totalPercentage = updatedSelections.reduce(
              (sum, coal) => sum + (Number.parseFloat(coal.percentage) || 0),
              0
            );
          }

          return {
            ...panel,
            coalSelections: updatedSelections,
            totalPercentage,
          };
        }
        return panel;
      })
    );
  };

  // Handle search input change
  const handleSearchChange = (panelId, coalId, value) => {
    setSearchInputs((prev) => ({
      ...prev,
      [`${panelId}-${coalId}`]: value,
    }));

    // Filter coals based on input
    const filtered = availableCoals.filter((coal) =>
      coal.name.toLowerCase().includes(value.toLowerCase())
    );
    setFilteredCoals((prev) => ({
      ...prev,
      [`${panelId}-${coalId}`]: filtered,
    }));
  };

  // Handle coal selection
  const handleCoalSelect = (panelId, coalId, selectedCoal) => {
    handleCoalChange(panelId, coalId, "coalId", selectedCoal.id);
    setSearchInputs((prev) => ({
      ...prev,
      [`${panelId}-${coalId}`]: selectedCoal.name,
    }));
    setFilteredCoals((prev) => ({
      ...prev,
      [`${panelId}-${coalId}`]: [],
    }));
  };

  // Add a function to check if any coal is unselected but has percentage
  const hasUnselectedCoalWithPercentage = (panel) => {
    return panel.coalSelections.some((coal) => coal.percentage && !coal.coalId);
  };

  // Handle Boiler Param Change for a specific panel
  const handleBoilerParamChange = (panelId, field, value) => {
    setPanels(
      panels.map((panel) => {
        if (panel.id === panelId) {
          return {
            ...panel,
            boilerParams: {
              ...panel.boilerParams,
              [field]: Number(value),
            },
          };
        }
        return panel;
      })
    );
  };

  // Handle run button click for a specific panel
  const handleRun = async (panelId) => {
    const panel = panels.find((p) => p.id === panelId);
    if (!panel || panel.totalPercentage !== 100) {
      toast.error("Total percentage must equal 100% to run");
      return;
    }

    // Check for unselected coals with percentages
    if (hasUnselectedCoalWithPercentage(panel)) {
      toast.error("Please select a coal for all percentage entries");
      return;
    }

    setIsPanelLoading((prev) => ({ ...prev, [panelId]: true }));

    try {
      // Prepare the request payload
      const payload = {
        blends: panel.coalSelections.map((coal) => ({
          coal_name: availableCoals.find((c) => c.id === Number(coal.coalId))?.name,
          percentage: Number(coal.percentage),
        })),
        boiler_params: panel.boilerParams,
      };

      // Make the API call with credentials
      const response = await api.post("/predict", payload);

      // Update the results for the specific panel
      setPanels(
        panels.map((panel) => {
          if (panel.id === panelId) {
            return {
              ...panel,
              results: {
                blendProperties: response.data.blend_properties,
                predictedCoalProperties: response.data.predicted_coal_properties,
                cokeProperties: response.data.predicted_coke_properties,
                boilerPredictions: response.data.boiler_predictions,
              },
            };
          }
          return panel;
        })
      );
    } catch (error) {
      console.error("Error getting prediction:", error);
      if (error.response?.status === 401) {
        // Handle unauthorized error by logging out
        dispatch(logout());
        navigate("/login");
      } else {
        toast.error(error.response?.data?.detail || "Failed to get prediction. Please try again.");
      }
    } finally {
      setIsPanelLoading((prev) => ({ ...prev, [panelId]: false }));
    }
  };

  return (
    <PageLayout title="Prediction">
      <Toaster position="top-right" />

      {/* Add Blend Button at the top - Modern */}
      <div className="flex justify-between items-center mb-6 bg-gradient-to-r from-blue-50 to-indigo-50 p-4 rounded-xl border border-blue-200 shadow-sm">
        <div>
          <h2 className="text-2xl font-bold text-gray-800 flex items-center gap-2">
            <BarChart className="h-6 w-6 text-blue-600" />
            Efficiency Predictions
          </h2>
          <p className="text-sm text-gray-600 mt-1">Create and analyze multiple Efficiencys</p>
        </div>
        <button
          onClick={addPanel}
          className="flex items-center px-6 py-3 bg-gradient-to-r from-blue-600 to-blue-500 text-white rounded-xl hover:from-blue-700 hover:to-blue-600 transition-all shadow-lg hover:shadow-xl transform hover:scale-105 font-semibold"
        >
          <Plus size={18} className="mr-2" />
          Add Blend
        </button>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
        {panels.map((panel) => (
          <div key={panel.id} className="flex flex-col">
            {/* Coal Selection Panel - Enhanced */}
            <div className="bg-white rounded-2xl border-2 border-blue-200 overflow-visible mb-6 shadow-xl hover:shadow-2xl transition-shadow">
              <div className="bg-gradient-to-r from-blue-600 to-blue-500 px-6 py-4 flex justify-between items-center">
                <h2 className="font-bold text-white text-lg">Blend {panel.id}</h2>
                {panels.length > 1 && (
                  <button
                    onClick={() => removePanel(panel.id)}
                    className="text-white hover:bg-white/20 p-1.5 rounded-lg transition-colors"
                  >
                    <X size={20} />
                  </button>
                )}
              </div>
              <div className="p-6 bg-gradient-to-br from-blue-50/50 to-indigo-50/50">
                {/* Boiler Parameters - Per Blend */}

                <div className="mb-5">
                  <label className="block text-sm font-semibold text-gray-700 mb-2">
                    Number of Coals
                  </label>
                  <input
                    type="number"
                    min="1"
                    max="10"
                    value={panel.numCoals}
                    onChange={(e) => handleNumCoalsChange(panel.id, e)}
                    className="w-full p-3 text-sm text-gray-900 font-medium border-2 border-blue-200 rounded-xl focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500 transition-all duration-200 bg-white hover:border-blue-300 shadow-sm placeholder-gray-400"
                  />
                </div>


                <div className="space-y-4 mb-5">
                  {panel.coalSelections.map((coal) => (
                    <div key={coal.id} className="grid grid-cols-2 gap-3">
                      <div>
                        <label
                          className={
                            coal.id === 1
                              ? "block text-sm font-semibold text-gray-700 mb-2"
                              : "sr-only"
                          }
                        >
                          Coal Name
                        </label>
                        <div className="relative">
                          <div className="flex gap-2">
                            <input
                              type="text"
                              value={searchInputs[`${panel.id}-${coal.id}`] || ""}
                              onChange={(e) =>
                                handleSearchChange(panel.id, coal.id, e.target.value)
                              }
                              className="flex-1 p-3 text-sm text-gray-900 font-medium border-2 border-blue-200 rounded-xl focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500 transition-all duration-200 bg-white hover:border-blue-300 shadow-sm placeholder-gray-400"
                              placeholder="Search coal"
                            />
                            <button
                              type="button"
                              onClick={() => {
                                setFilteredCoals((prev) => {
                                  const currentList = prev[`${panel.id}-${coal.id}`];
                                  const isListVisible = currentList && currentList.length > 0;

                                  return {
                                    ...prev,
                                    [`${panel.id}-${coal.id}`]: isListVisible ? [] : availableCoals,
                                  };
                                });
                              }}
                              className="px-3 py-2 border-2 border-blue-600 rounded-xl bg-blue-600 text-white hover:bg-blue-700 hover:border-blue-700 transition-all font-bold shadow-md"
                            >
                              ▼
                            </button>
                          </div>
                          {filteredCoals[`${panel.id}-${coal.id}`]?.length > 0 && (
                            <div className="absolute z-10 w-full mt-2 bg-white border-2 border-blue-300 rounded-xl shadow-2xl max-h-48 overflow-auto">
                              {filteredCoals[`${panel.id}-${coal.id}`].map((availableCoal) => (
                                <div
                                  key={availableCoal.id}
                                  onClick={() => handleCoalSelect(panel.id, coal.id, availableCoal)}
                                  className="px-4 py-2.5 text-sm text-gray-800 hover:bg-blue-50 cursor-pointer border-b border-gray-100 last:border-0 transition-colors font-medium"
                                >
                                  {availableCoal.name}
                                </div>
                              ))}
                            </div>
                          )}
                        </div>
                      </div>
                      <div>
                        <label
                          className={
                            coal.id === 1
                              ? "block text-sm font-semibold text-gray-700 mb-2"
                              : "sr-only"
                          }
                        >
                          Percentage
                        </label>
                        <input
                          type="number"
                          min="0"
                          max="100"
                          value={coal.percentage}
                          onChange={(e) =>
                            handleCoalChange(
                              panel.id,
                              coal.id,
                              "percentage",
                              Number.parseFloat(e.target.value) || ""
                            )
                          }
                          className="w-full p-3 text-sm text-gray-900 font-medium border-2 border-blue-200 rounded-xl focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500 transition-all duration-200 bg-white hover:border-blue-300 shadow-sm placeholder-gray-400"
                          placeholder="%"
                        />
                      </div>
                    </div>
                  ))}
                </div>

                <div className="bg-white rounded-xl p-4 mb-5 border-2 border-blue-100 shadow-sm">
                  <div className="flex justify-between items-center">
                    <span className="text-sm font-semibold text-gray-700">Total Percentage:</span>
                    <span
                      className={`text-lg font-bold ${panel.totalPercentage === 100 ? "text-green-600" : "text-red-600"}`}
                    >
                      {panel.totalPercentage}%
                    </span>
                  </div>
                  {panel.totalPercentage > 100 && (
                    <div className="text-sm text-red-600 mt-2 font-medium">⚠️ Total cannot exceed 100%</div>
                  )}
                </div>

                <button
                  onClick={() => handleRun(panel.id)}
                  disabled={
                    isPanelLoading[panel.id] ||
                    panel.totalPercentage !== 100 ||
                    hasUnselectedCoalWithPercentage(panel)
                  }
                  className={`w-full py-3 px-4 rounded-xl font-bold text-white transition-all shadow-lg ${isPanelLoading[panel.id] ||
                    panel.totalPercentage !== 100 ||
                    hasUnselectedCoalWithPercentage(panel)
                    ? "bg-gray-300 cursor-not-allowed"
                    : "bg-gradient-to-r from-green-600 to-emerald-600 hover:from-green-700 hover:to-emerald-700 hover:shadow-xl transform hover:scale-105"
                    }`}
                >
                  {isPanelLoading[panel.id] ? "⏳ Running..." : "▶️ Run Prediction"}
                </button>
              </div>
            </div>

            {/* Results for this panel - Enhanced */}
            {panel.results && (
              <div className="space-y-4">

                {/* Boiler Predictions */}
                {panel.results.boilerPredictions && (
                  <div className="bg-white rounded-2xl border-2 border-orange-200 overflow-hidden shadow-xl">
                    <div className="bg-gradient-to-r from-orange-500 to-red-500 px-6 py-4 flex justify-between items-center">
                      <h2 className="font-bold text-white text-lg">Boiler Performance</h2>
                      <span className="text-white text-xl">🔥</span>
                    </div>
                    <div className="p-6 bg-gradient-to-br from-orange-50/50 to-red-50/50">
                      <div className="space-y-2">
                        <div className="flex justify-between py-3 px-4 bg-white rounded-lg border border-orange-100 shadow-sm">
                          <span className="text-sm font-semibold text-gray-700">Efficiency</span>
                          <span className="text-lg font-bold text-orange-700">
                            {panel.results.boilerPredictions.boiler_efficiency?.toFixed(2)}%
                          </span>
                        </div>
                        <div className="flex justify-between py-3 px-4 bg-white rounded-lg border border-orange-100 shadow-sm">
                          <span className="text-sm font-semibold text-gray-700">NOx</span>
                          <span className="text-sm font-bold text-red-700">
                            {panel.results.boilerPredictions.nox?.toFixed(2)}
                          </span>
                        </div>
                        <div className="grid grid-cols-2 gap-2">
                          <div className="flex flex-col p-3 bg-white rounded-lg border border-orange-100 shadow-sm">
                            <span className="text-xs text-gray-500 mb-1">UBC (Bottom Ash)</span>
                            <span className="font-bold text-gray-800">
                              {panel.results.boilerPredictions.ubc_ba?.toFixed(3)}
                            </span>
                          </div>
                          <div className="flex flex-col p-3 bg-white rounded-lg border border-orange-100 shadow-sm">
                            <span className="text-xs text-gray-500 mb-1">UBC (Fly Ash)</span>
                            <span className="font-bold text-gray-800">
                              {panel.results.boilerPredictions.ubc_fa?.toFixed(3)}
                            </span>
                          </div>
                        </div>
                        <div className="grid grid-cols-2 gap-2">
                          <div className="flex flex-col p-3 bg-white rounded-lg border border-orange-100 shadow-sm">
                            <span className="text-xs text-gray-500 mb-1">GCV</span>
                            <span className="font-bold text-gray-800">
                              {panel.results.boilerPredictions.gcv_wa?.toFixed(3)}
                            </span>
                          </div>
                          <div className="flex flex-col p-3 bg-white rounded-lg border border-orange-100 shadow-sm">
                            <span className="text-xs text-gray-500 mb-1">GCV (ARB)</span>
                            <span className="font-bold text-gray-800">
                              {panel.results.boilerPredictions.gcv_arb_wa?.toFixed(3)}
                            </span>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                )}


              </div>
            )}
          </div>
        ))}
      </div>
    </PageLayout>
  );
}

export default Prediction;

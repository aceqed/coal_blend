import PageLayout from "../Layout/pageLayout.jsx";
import {
  Upload,
  FileText,
  Save,
  X,
  CheckCircle,
  Edit,
  Eye,
} from "lucide-react";
import { useState, useEffect } from "react";
import api from "../services/api";

// Updated fields to match backend `VendorCoalBase` / `CoalProperties`
const COAL_PROPERTIES = [
  { id: "coal_name", label: "Coal Name", type: "text", required: true },

  // Proximate & Ultimate Analysis
  { id: "IM", label: "IM %", type: "number", step: "0.01" },
  { id: "Ash", label: "Ash %", type: "number", step: "0.01" },
  { id: "VM", label: "Volatile Matter %", type: "number", step: "0.01" },
  { id: "FC", label: "Fixed Carbon %", type: "number", step: "0.01" },
  { id: "S", label: "Sulfur %", type: "number", step: "0.01" },
  { id: "P", label: "Phosphorus %", type: "number", step: "0.01" },

  // Oxides
  { id: "SiO2", label: "SiO2 %", type: "number", step: "0.01" },
  { id: "Al2O3", label: "Al2O3 %", type: "number", step: "0.01" },
  { id: "Fe2O3", label: "Fe2O3 %", type: "number", step: "0.01" },
  { id: "CaO", label: "CaO %", type: "number", step: "0.01" },
  { id: "MgO", label: "MgO %", type: "number", step: "0.01" },
  { id: "Na2O", label: "Na2O %", type: "number", step: "0.01" },
  { id: "K2O", label: "K2O %", type: "number", step: "0.01" },
  { id: "TiO2", label: "TiO2 %", type: "number", step: "0.01" },
  { id: "Mn3O4", label: "Mn3O4 %", type: "number", step: "0.01" },
  { id: "SO3", label: "SO3 %", type: "number", step: "0.01" },
  { id: "P2O5", label: "P2O5 %", type: "number", step: "0.01" },
  { id: "BaO", label: "BaO %", type: "number", step: "0.01" },
  { id: "SrO", label: "SrO %", type: "number", step: "0.01" },
  { id: "ZnO", label: "ZnO %", type: "number", step: "0.01" },

  // Coke Properties
  { id: "CRI", label: "CRI", type: "number", step: "0.01" },
  { id: "CSR", label: "CSR", type: "number", step: "0.01" },
  { id: "HGI", label: "HGI", type: "number", step: "0.01" },

  // Elemental
  { id: "N", label: "Nitrogen %", type: "number", step: "0.01" },
  { id: "C", label: "Carbon %", type: "number", step: "0.01" },
  { id: "H", label: "Hydrogen %", type: "number", step: "0.01" },
  { id: "O", label: "Oxygen %", type: "number", step: "0.01" },

  // Rank and Categories
  { id: "Rank", label: "Rank", type: "text" },
  { id: "coal_category", label: "Coal Category", type: "text" },

  // Petrography
  { id: "Vitrinite", label: "Vitrinite %", type: "number", step: "0.01" },
  { id: "Liptinite", label: "Liptinite %", type: "number", step: "0.01" },
  {
    id: "Semi_Fusinite",
    label: "Semi Fusinite %",
    type: "number",
    step: "0.01",
  },
  { id: "Inertinite", label: "Inertinite %", type: "number", step: "0.01" },
  { id: "Minerals", label: "Minerals %", type: "number", step: "0.01" },

  // Coking Indices
  { id: "CSN_FSI", label: "CSN/FSI", type: "number", step: "0.01" },
  {
    id: "Initial_Softening_Temp",
    label: "Initial Softening Temp (°C)",
    type: "number",
    step: "0.01",
  },
  { id: "MBI", label: "MBI", type: "number", step: "0.01" },
  { id: "CBI", label: "CBI", type: "number", step: "0.01" },
  {
    id: "Log_Max_Fluidity",
    label: "Log Max Fluidity",
    type: "number",
    step: "0.01",
  },
  { id: "MaxFluidity", label: "Max Fluidity", type: "number", step: "0.01" },

  // Extra Variables V7–V19
  { id: "ss", label: "ss", type: "number", step: "0.01" },
  { id: "V7", label: "V7", type: "number", step: "0.01" },
  { id: "V8", label: "V8", type: "number", step: "0.01" },
  { id: "V9", label: "V9", type: "number", step: "0.01" },
  { id: "V10", label: "V10", type: "number", step: "0.01" },
  { id: "V11", label: "V11", type: "number", step: "0.01" },
  { id: "V12", label: "V12", type: "number", step: "0.01" },
  { id: "V13", label: "V13", type: "number", step: "0.01" },
  { id: "V14", label: "V14", type: "number", step: "0.01" },
  { id: "V15", label: "V15", type: "number", step: "0.01" },
  { id: "V16", label: "V16", type: "number", step: "0.01" },
  { id: "V17", label: "V17", type: "number", step: "0.01" },
  { id: "V18", label: "V18", type: "number", step: "0.01" },
  { id: "V19", label: "V19", type: "number", step: "0.01" },
];
function VendorDataUpload() {
  const [activeTab, setActiveTab] = useState("upload"); // upload | list
  const [formData, setFormData] = useState({});
  const [file, setFile] = useState(null);
  const [isLoading, setIsLoading] = useState(false);
  const [message, setMessage] = useState({ type: "", text: "" });
  const [isManualEntry, setIsManualEntry] = useState(false);
  // Vendor coal list
  const [coalList, setCoalList] = useState([]);
  const [selectedCoal, setSelectedCoal] = useState(null);

  const fetchCoals = async () => {
    try {
      const res = await api.get("/api/vendor_coals");
      setCoalList(res.data["data"] || []);
    } catch (err) {
      console.error("Error fetching coals:", err);
    }
  };

  useEffect(() => {
    if (activeTab === "list") fetchCoals();
  }, [activeTab]);

  const handleInputChange = (e) => {
    const { name, value, type } = e.target;
    setFormData((prev) => ({
      ...prev,
      [name]: type === "number" ? parseFloat(value) || "" : value,
    }));
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    setIsLoading(true);
    try {
      const response = await api.post(
        "/api/vendor-coal/manual",
        formData
      );

      if (response.data) {
        setMessage({ type: "success", text: "Coal uploaded successfully" });
        setFormData({});
        setFile(null);
      } else {
        throw new Error("Unexpected error");
      }
    } catch (err) {
      setMessage({ type: "error", text: err.message });
    } finally {
      setIsLoading(false);
    }
  };

  const handleApprove = async (coal_id) => {
    try {
      await api.post(
        `/api/vendor_coals/${coal_id}/approve/`
      );
      setMessage({
        type: "success",
        text: "Coal approved and moved to master",
      });
      fetchCoals();
      setSelectedCoal(null);
    } catch (err) {
      setMessage({ type: "error", text: err.message });
    }
  };

  const handleUpdate = async () => {
    try {
      await api.patch(
        `/api/vendor_coals/${selectedCoal.id}`,
        selectedCoal
      );
      setMessage({ type: "success", text: "Coal updated" });
      fetchCoals();
    } catch (err) {
      setMessage({ type: "error", text: err.message });
    }
  };

  return (
    <PageLayout title="Vendor Coal Data">
      <div className="max-w-5xl mx-auto p-6">
        {/* Tabs */}
        <div className="flex space-x-4 mb-6">
          <button
            onClick={() => setActiveTab("upload")}
            className={`px-4 py-2 rounded-md ${
              activeTab === "upload"
                ? "bg-blue-600 text-white"
                : "bg-gray-100 text-black"
            }`}
          >
            Upload Coal
          </button>
          <button
            onClick={() => setActiveTab("list")}
            className={`px-4 py-2 rounded-md ${
              activeTab === "list"
                ? "bg-blue-600 text-white"
                : "bg-gray-100 text-black"
            }`}
          >
            Vendor Coal List
          </button>
        </div>

        {message.text && (
          <div
            className={`p-3 mb-6 rounded-md ${
              message.type === "error"
                ? "bg-red-100 text-red-700"
                : "bg-green-100 text-green-700"
            }`}
          >
            {message.text}
          </div>
        )}

        {activeTab === "upload" && (
          <>
            {/* Toggle between PDF and Manual */}
            <div className="flex space-x-4 mb-6 text-black">
              <button
                onClick={() => setIsManualEntry(false)}
                className={`px-4 py-2 rounded-md ${
                  !isManualEntry ? "bg-blue-600 text-white" : "bg-gray-100"
                }`}
              >
                Upload PDF
              </button>
              <button
                onClick={() => setIsManualEntry(true)}
                className={`px-4 py-2 rounded-md ${
                  isManualEntry ? "bg-blue-600 text-white" : "bg-gray-100"
                }`}
              >
                Manual Entry
              </button>
            </div>

            {/* Manual Entry Form */}
            {isManualEntry ? (
              <form onSubmit={handleSubmit} className="space-y-4">
                <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                  {COAL_PROPERTIES.map((prop) => (
                    <div key={prop.id}>
                      <label className="block text-sm font-medium text-gray-700">
                        {prop.label}
                      </label>
                      <input
                        type={prop.type}
                        name={prop.id}
                        value={formData[prop.id] || ""}
                        onChange={handleInputChange}
                        step={prop.step}
                        className="w-full px-3 py-2 border bg-white text-black border-gray-300 rounded-md focus:ring-2 focus:ring-blue-500"
                      />
                    </div>
                  ))}
                </div>
                <div className="flex justify-end space-x-3 mt-6">
                  <button
                    type="submit"
                    disabled={isLoading}
                    className="px-4 py-2 bg-blue-600 text-white rounded-md hover:bg-blue-700 flex items-center"
                  >
                    <Save className="h-4 w-4 mr-2" /> Save Coal Data
                  </button>
                </div>
              </form>
            ) : (
              // PDF Upload Section
              <div className="border-2 border-dashed border-gray-300 rounded-lg p-8 text-center flex flex-col items-center text-black">
                <Upload className="h-12 w-12 mx-auto text-gray-400 mb-4" />
                <p className="text-gray-600 mb-2">
                  Upload a PDF containing coal property data
                </p>
                <label className="px-4 py-2 bg-blue-600 text-white rounded-md hover:bg-blue-700 cursor-pointer">
                  <input
                    type="file"
                    accept=".pdf"
                    onChange={(e) => setFile(e.target.files[0])}
                    className="hidden"
                  />
                  <span>Select PDF File</span>
                </label>

                {file && (
                  <div className="mt-4 p-3 bg-blue-50 text-blue-700 rounded-md inline-flex items-center">
                    <FileText className="h-5 w-5 mr-2" />
                    {file.name}
                  </div>
                )}

                <button
                  onClick={async () => {
                    if (!file)
                      return setMessage({ type: "error", text: "Select PDF" });
                    setIsLoading(true);
                    try {
                      const formData = new FormData();
                      formData.append("file", file);
                      const res = await api.post(
                        "/api/coal/upload",
                        formData,
                        {
                          headers: {
                            "Content-Type": "multipart/form-data",
                          },
                        }
                      );
                      const result = res.data;
                      if (!result.success)
                        throw new Error(result.error || "Parse failed");

                      setFormData((prev) => ({
                        ...prev,
                        ...result.coal_data, // 👈 match schema
                        coal_name:
                          result.coal_data?.coal_name ||
                          prev.coal_name ||
                          file.name.replace(/\.pdf$/i, "").trim(),
                      }));
                      setMessage({
                        type: "success",
                        text: "PDF processed successfully",
                      });
                    } catch (err) {
                      setMessage({ type: "error", text: err.message });
                    } finally {
                      setIsLoading(false);
                    }
                  }}
                  disabled={!file || isLoading}
                  className={`mt-6 px-4 py-2 rounded-md flex items-center ${
                    !file || isLoading
                      ? "bg-gray-300 text-gray-500 cursor-not-allowed"
                      : "bg-green-600 text-white hover:bg-green-700"
                  }`}
                >
                  <Upload className="h-4 w-4 mr-1" /> Upload & Extract
                </button>
              </div>
            )}
          </>
        )}

        {activeTab === "list" && (
          <div>
            <table className="w-full border border-gray-200 text-left text-black">
              <thead className="bg-gray-50">
                <tr>
                  <th className="px-4 py-2 border">Coal Name</th>
                  <th className="px-4 py-2 border">Vendor</th>
                  <th className="px-4 py-2 border">Status</th>
                  <th className="px-4 py-2 border">Actions</th>
                </tr>
              </thead>
              <tbody>
                {coalList.map((coal) => (
                  <tr key={coal.id}>
                    <td className="px-4 py-2 border">{coal?.coal_name}</td>
                    <td className="px-4 py-2 border">{coal?.vendor_name}</td>
                    <td className="px-4 py-2 border">
                      {coal.is_approved ? "Approved" : "Pending"}
                    </td>
                    <td className="px-4 py-2 border space-x-2">
                      <button
                        onClick={() => setSelectedCoal(coal)}
                        className="px-2 py-1 text-sm bg-gray-100 rounded flex items-center"
                      >
                        <Eye className="h-4 w-4 mr-1" /> View/Edit
                      </button>
                      {!coal.is_approved && (
                        <button
                          onClick={() => handleApprove(coal.id)}
                          className="px-2 py-1 text-sm bg-green-600 text-white rounded flex items-center"
                        >
                          <CheckCircle className="h-4 w-4 mr-1" /> Approve
                        </button>
                      )}
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>

            {selectedCoal && (
              <div className="mt-6 p-4 border rounded bg-gray-50 text-black">
                <h3 className="font-semibold mb-4">
                  Editing: {selectedCoal.coal_name}
                </h3>
                <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                  {COAL_PROPERTIES.map((prop) => (
                    <div key={prop.id}>
                      <label className="block text-sm font-medium text-gray-700">
                        {prop.label}
                      </label>
                      <input
                        type={prop.type}
                        name={prop.id}
                        value={selectedCoal[prop.id] || ""}
                        onChange={(e) =>
                          setSelectedCoal((prev) => ({
                            ...prev,
                            [e.target.name]:
                              e.target.type === "number"
                                ? parseFloat(e.target.value) || ""
                                : e.target.value,
                          }))
                        }
                        step={prop.step}
                        className="w-full px-3 py-2 border bg-white text-black border-gray-300 rounded-md"
                      />
                    </div>
                  ))}
                </div>

                <div className="flex justify-end space-x-3 mt-6">
                  <button
                    onClick={handleUpdate}
                    className="px-4 py-2 bg-blue-600 text-white rounded-md"
                  >
                    <Edit className="h-4 w-4 mr-2 inline" /> Update
                  </button>
                  <button
                    onClick={() => setSelectedCoal(null)}
                    className="px-4 py-2 border rounded-md"
                  >
                    <X className="h-4 w-4 mr-2 inline" /> Close
                  </button>
                </div>
              </div>
            )}
          </div>
        )}
      </div>
    </PageLayout>
  );
}

export default VendorDataUpload;

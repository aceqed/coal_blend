import PageLayout from "../Layout/pageLayout.jsx";
import {
  Upload,
  FileText,
  Save,
  X,
  CheckCircle,
  Edit,
  Eye,
  Trash2,
  ArrowUpDown,
} from "lucide-react";
import { useState, useEffect } from "react";
import api from "../services/api";
import Modal from "../components/Modal";
import CoalDataForm from "../components/CoalDataForm";

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
  const [masterCoals, setMasterCoals] = useState([]);
  const [selectedCoal, setSelectedCoal] = useState(null);

  // New state for edit modal
  const [isEditModalOpen, setIsEditModalOpen] = useState(false);
  const [isViewModalOpen, setIsViewModalOpen] = useState(false);
  const [sortOrder, setSortOrder] = useState("desc"); // desc = newest first

  const fetchCoals = async () => {
    try {
      const res = await api.get("/api/vendor_coals");
      setCoalList(res.data["data"] || []);
    } catch (err) {
      console.error("Error fetching coals:", err);
    }
  };

  const fetchMasterCoals = async () => {
    try {
      const res = await api.get("/api/master_coals");
      setMasterCoals(res.data["data"] || []);
    } catch (err) {
      console.error("Error fetching master coals:", err);
    }
  };

  useEffect(() => {
    if (activeTab === "list") fetchCoals();
    if (activeTab === "manage") fetchMasterCoals();
  }, [activeTab]);

  const sortedCoals = [...coalList].sort((a, b) => {
    const dateA = new Date(a.uploaded_at || 0);
    const dateB = new Date(b.uploaded_at || 0);
    return sortOrder === "desc" ? dateB - dateA : dateA - dateB;
  });

  const toggleSort = () => setSortOrder((prev) => (prev === "desc" ? "asc" : "desc"));

  const handleInputChange = (e) => {
    const { name, value, type } = e.target;
    setFormData((prev) => ({
      ...prev,
      [name]: type === "number" ? (value === "" ? "" : parseFloat(value)) : value,
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
        setIsEditModalOpen(false); // Close modal on success
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
      setIsViewModalOpen(false);
    } catch (err) {
      setMessage({ type: "error", text: err.message });
    }
  };

  const handleDelete = async (id) => {
    if (!window.confirm("Are you sure you want to delete this coal?")) return;
    try {
      await api.delete(`/api/vendor_coals/${id}`);
      setMessage({ type: "success", text: "Coal deleted successfully" });
      fetchCoals();
    } catch (err) {
      setMessage({ type: "error", text: err.message });
    }
  };

  return (
    <PageLayout title="Vendor Coal Data">
      <div className="max-w-7xl mx-auto p-6">
        {/* Tabs - Modern Design */}
        <div className="flex space-x-2 mb-8 bg-gray-100 p-1.5 rounded-xl shadow-inner">
          <button
            onClick={() => setActiveTab("upload")}
            className={`flex-1 px-6 py-3 rounded-lg font-semibold transition-all duration-200 ${activeTab === "upload"
              ? "bg-gradient-to-r from-blue-600 to-blue-500 text-white shadow-lg shadow-blue-500/50 scale-105"
              : "bg-transparent text-gray-600 hover:bg-white hover:text-gray-900"
              }`}
          >
            📤 Upload Coal
          </button>
          <button
            onClick={() => setActiveTab("list")}
            className={`flex-1 px-6 py-3 rounded-lg font-semibold transition-all duration-200 ${activeTab === "list"
              ? "bg-gradient-to-r from-emerald-600 to-emerald-500 text-white shadow-lg shadow-emerald-500/50 scale-105"
              : "bg-transparent text-gray-600 hover:bg-white hover:text-gray-900"
              }`}
          >
            📋 Vendor Coal List
          </button>
          <button
            onClick={() => setActiveTab("manage")}
            className={`flex-1 px-6 py-3 rounded-lg font-semibold transition-all duration-200 ${activeTab === "manage"
              ? "bg-gradient-to-r from-purple-600 to-purple-500 text-white shadow-lg shadow-purple-500/50 scale-105"
              : "bg-transparent text-gray-600 hover:bg-white hover:text-gray-900"
              }`}
          >
            🏭 Manage Coals
          </button>
        </div>

        {message.text && (
          <div
            className={`p-4 mb-6 rounded-lg shadow-md border-l-4 font-medium ${message.type === "error"
              ? "bg-red-50 text-red-700 border-red-500"
              : "bg-green-50 text-green-700 border-green-500"
              }`}
          >
            {message.text}
          </div>
        )}

        {activeTab === "upload" && (
          <>
            {/* Toggle between PDF and Manual - Modern */}
            <div className="flex space-x-3 mb-8 p-1.5 bg-gradient-to-r from-gray-100 to-gray-50 rounded-xl shadow-inner">
              <button
                onClick={() => setIsManualEntry(false)}
                className={`flex-1 px-6 py-3 rounded-lg font-semibold transition-all duration-200 ${!isManualEntry
                  ? "bg-white text-blue-600 shadow-md"
                  : "text-gray-600 hover:text-gray-900"
                  }`}
              >
                📄 Upload PDF
              </button>
              <button
                onClick={() => setIsManualEntry(true)}
                className={`flex-1 px-6 py-3 rounded-lg font-semibold transition-all duration-200 ${isManualEntry
                  ? "bg-white text-blue-600 shadow-md"
                  : "text-gray-600 hover:text-gray-900"
                  }`}
              >
                ✍️ Manual Entry
              </button>
            </div>

            {/* Manual Entry Form */}
            {isManualEntry ? (
              <CoalDataForm
                formData={formData}
                onChange={handleInputChange}
                onSubmit={handleSubmit}
                isLoading={isLoading}
              />
            ) : (
              // PDF Upload Section - Modern Card
              <div className="bg-gradient-to-br from-blue-50 to-indigo-50 border-2 border-dashed border-blue-300 rounded-2xl p-12 text-center shadow-lg hover:shadow-xl transition-shadow">
                <div className="bg-white rounded-full w-20 h-20 mx-auto mb-6 flex items-center justify-center shadow-md">
                  <Upload className="h-10 w-10 text-blue-600" />
                </div>
                <h3 className="text-xl font-bold text-gray-800 mb-2">Upload PDF Document</h3>
                <p className="text-gray-600 mb-6">
                  Upload a PDF containing coal property data for automatic extraction
                </p>
                <label className="inline-block px-6 py-3 bg-gradient-to-r from-blue-600 to-blue-500 text-white rounded-xl hover:from-blue-700 hover:to-blue-600 cursor-pointer shadow-lg hover:shadow-xl transition-all duration-200 transform hover:scale-105 font-semibold">
                  <input
                    type="file"
                    accept=".pdf"
                    onChange={(e) => setFile(e.target.files[0])}
                    className="hidden"
                  />
                  <span className="flex items-center gap-2">
                    <FileText className="h-5 w-5" />
                    Select PDF File
                  </span>
                </label>

                {file && (
                  <div className="mt-6 p-4 bg-white border border-blue-200 text-blue-700 rounded-xl inline-flex items-center shadow-md">
                    <FileText className="h-5 w-5 mr-2 text-blue-600" />
                    <span className="font-medium">{file.name}</span>
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
                        ...result.coal_data,
                        coal_name:
                          result.coal_data?.coal_name ||
                          prev.coal_name ||
                          file.name.replace(/\.pdf$/i, "").trim(),
                      }));
                      setMessage({
                        type: "success",
                        text: "PDF processed successfully. Please review the extracted data.",
                      });
                      setIsEditModalOpen(true);
                    } catch (err) {
                      setMessage({ type: "error", text: err.message });
                    } finally {
                      setIsLoading(false);
                    }
                  }}
                  disabled={!file || isLoading}
                  className={`mt-8 px-6 py-3 rounded-xl font-semibold flex items-center gap-2 mx-auto transition-all duration-200 ${!file || isLoading
                    ? "bg-gray-300 text-gray-500 cursor-not-allowed"
                    : "bg-gradient-to-r from-green-600 to-emerald-600 text-white hover:from-green-700 hover:to-emerald-700 shadow-lg hover:shadow-xl transform hover:scale-105"
                    }`}
                >
                  <Upload className="h-5 w-5" />
                  {isLoading ? "Processing..." : "Upload & Extract"}
                </button>
              </div>
            )}
          </>
        )}

        {activeTab === "list" && (
          <div className="bg-white rounded-2xl shadow-xl overflow-hidden border border-gray-100">
            <div className="bg-gradient-to-r from-emerald-600 to-green-600 px-6 py-4">
              <h2 className="text-xl font-bold text-white">Vendor Coal Database</h2>
              <p className="text-emerald-100 text-sm mt-1">Review and approve vendor submissions</p>
            </div>

            <div className="overflow-x-auto">
              <table className="w-full text-left text-black">
                <thead className="bg-gradient-to-r from-gray-50 to-gray-100 border-b-2 border-emerald-200">
                  <tr>
                    <th className="px-6 py-4 font-semibold text-gray-700">Coal Name</th>
                    <th className="px-6 py-4 font-semibold text-gray-700 cursor-pointer hover:bg-gray-200 transition-colors" onClick={toggleSort}>
                      <div className="flex items-center gap-2">
                        Uploaded Date
                        <ArrowUpDown className="h-4 w-4" />
                      </div>
                    </th>
                    <th className="px-6 py-4 font-semibold text-gray-700">Status</th>
                    <th className="px-6 py-4 font-semibold text-gray-700">Actions</th>
                  </tr>
                </thead>
                <tbody>
                  {sortedCoals.map((coal, idx) => (
                    <tr
                      key={coal.id}
                      className={`border-b border-gray-100 hover:bg-emerald-50 transition-colors ${idx % 2 === 0 ? 'bg-white' : 'bg-gray-50/50'
                        }`}
                    >
                      <td className="px-6 py-4 font-medium text-gray-900">{coal?.coal_name}</td>
                      <td className="px-6 py-4 text-gray-600">
                        {coal.uploaded_at ? new Date(coal.uploaded_at).toLocaleString() : "N/A"}
                      </td>
                      <td className="px-6 py-4">
                        {coal.is_approved ? (
                          <span className="inline-flex items-center px-3 py-1 rounded-full text-xs font-semibold bg-green-100 text-green-700 border border-green-200">
                            <span className="w-2 h-2 bg-green-500 rounded-full mr-2"></span>
                            Approved
                          </span>
                        ) : (
                          <span className="inline-flex items-center px-3 py-1 rounded-full text-xs font-semibold bg-yellow-100 text-yellow-700 border border-yellow-200">
                            <span className="w-2 h-2 bg-yellow-500 rounded-full mr-2"></span>
                            Pending
                          </span>
                        )}
                      </td>
                      <td className="px-6 py-4">
                        <div className="flex items-center gap-2">
                          <button
                            onClick={() => {
                              setSelectedCoal(coal);
                              setIsViewModalOpen(true);
                            }}
                            className="px-3 py-2 text-sm bg-gradient-to-r from-blue-600 to-blue-500 text-white rounded-lg hover:from-blue-700 hover:to-blue-600 flex items-center gap-1.5 shadow-md hover:shadow-lg transition-all"
                          >
                            <Eye className="h-4 w-4" /> View/Edit
                          </button>
                          {!coal.is_approved && (
                            <>
                              <button
                                onClick={() => handleApprove(coal.id)}
                                className="px-3 py-2 text-sm bg-gradient-to-r from-green-600 to-emerald-600 text-white rounded-lg hover:from-green-700 hover:to-emerald-700 flex items-center gap-1.5 shadow-md hover:shadow-lg transition-all"
                              >
                                <CheckCircle className="h-4 w-4" /> Approve
                              </button>
                              <button
                                onClick={() => handleDelete(coal.id)}
                                className="px-3 py-2 text-sm bg-red-500 text-white rounded-lg hover:bg-red-600 flex items-center gap-1.5 shadow-md hover:shadow-lg transition-all"
                              >
                                <Trash2 className="h-4 w-4" /> Delete
                              </button>
                            </>
                          )}
                        </div>
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>

            {/* View/Edit Modal */}
            <Modal
              isOpen={isViewModalOpen}
              onClose={() => setIsViewModalOpen(false)}
              title={`Editing Coal: ${selectedCoal?.coal_name || ""}`}
            >
              {selectedCoal && (
                <div className="p-4">
                  <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
                    {COAL_PROPERTIES.map((prop) => (
                      <div key={prop.id}>
                        <label className="block text-sm font-semibold text-gray-700 mb-1.5">
                          {prop.label}
                        </label>
                        <input
                          type={prop.type}
                          name={prop.id}
                          value={
                            selectedCoal[prop.id] !== undefined &&
                              selectedCoal[prop.id] !== null
                              ? selectedCoal[prop.id]
                              : ""
                          }
                          onChange={(e) =>
                            setSelectedCoal((prev) => ({
                              ...prev,
                              [e.target.name]:
                                e.target.type === "number"
                                  ? e.target.value === ""
                                    ? null
                                    : parseFloat(e.target.value)
                                  : e.target.value,
                            }))
                          }
                          step={prop.step}
                          className="w-full px-3 py-2.5 border-2 bg-white text-black border-gray-200 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500 transition-all"
                        />
                      </div>
                    ))}
                  </div>
                  <div className="flex justify-end gap-3 mt-6">
                    <button
                      onClick={() => setIsViewModalOpen(false)}
                      className="px-6 py-3 border-2 border-gray-300 text-gray-700 rounded-xl hover:bg-white hover:border-gray-400 flex items-center gap-2 font-semibold transition-all"
                    >
                      <X className="h-4 w-4" /> Cancel
                    </button>
                    <button
                      onClick={handleUpdate}
                      className="px-6 py-3 bg-gradient-to-r from-blue-600 to-blue-500 text-white rounded-xl hover:from-blue-700 hover:to-blue-600 flex items-center gap-2 font-semibold shadow-lg hover:shadow-xl transition-all transform hover:scale-105"
                    >
                      <Save className="h-4 w-4" /> Save Changes
                    </button>
                  </div>
                </div>
              )}
            </Modal>
          </div>
        )}

        {activeTab === "manage" && (
          <div className="bg-white rounded-2xl shadow-xl overflow-hidden border border-gray-100">
            <div className="bg-gradient-to-r from-purple-600 to-indigo-600 px-6 py-4">
              <h2 className="text-xl font-bold text-white">Master Coal Database</h2>
              <p className="text-purple-100 text-sm mt-1">View and manage approved coals</p>
            </div>

            <div className="overflow-x-auto">
              <table className="w-full text-left text-black">
                <thead className="bg-gradient-to-r from-gray-50 to-gray-100 border-b-2 border-purple-200">
                  <tr>
                    <th className="px-6 py-4 font-semibold text-gray-700">Coal Name</th>
                    <th className="px-6 py-4 font-semibold text-gray-700">Category</th>
                    <th className="px-6 py-4 font-semibold text-gray-700">Ash %</th>
                    <th className="px-6 py-4 font-semibold text-gray-700">VM %</th>
                    <th className="px-6 py-4 font-semibold text-gray-700">FC %</th>
                    <th className="px-6 py-4 font-semibold text-gray-700">Actions</th>
                  </tr>
                </thead>
                <tbody>
                  {masterCoals.map((coal, idx) => (
                    <tr
                      key={coal.coal_name}
                      className={`border-b border-gray-100 hover:bg-purple-50 transition-colors ${idx % 2 === 0 ? 'bg-white' : 'bg-gray-50/50'
                        }`}
                    >
                      <td className="px-6 py-4 font-medium text-gray-900">{coal?.coal_name}</td>
                      <td className="px-6 py-4 text-gray-600">{coal?.coal_category || "-"}</td>
                      <td className="px-6 py-4 text-gray-600">{coal?.Ash}</td>
                      <td className="px-6 py-4 text-gray-600">{coal?.VM}</td>
                      <td className="px-6 py-4 text-gray-600">{coal?.FC}</td>
                      <td className="px-6 py-4">
                        <button
                          onClick={() => {
                            setSelectedCoal(coal);
                            setIsViewModalOpen(true);
                          }}
                          className="px-3 py-2 text-sm bg-gradient-to-r from-blue-600 to-blue-500 text-white rounded-lg hover:from-blue-700 hover:to-blue-600 flex items-center gap-1.5 shadow-md hover:shadow-lg transition-all"
                        >
                          <Eye className="h-4 w-4" /> View Details
                        </button>
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>

            {/* Reuse the same edit/view modal logic since selectedCoal is shared */}
            {selectedCoal && activeTab === "manage" && (
              <Modal
                isOpen={isViewModalOpen}
                onClose={() => setIsViewModalOpen(false)}
                title={`Coal Details: ${selectedCoal?.coal_name || ""}`}
              >
                <div className="p-4">
                  <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
                    {COAL_PROPERTIES.map((prop) => (
                      <div key={prop.id}>
                        <label className="block text-sm font-semibold text-gray-700 mb-1.5">
                          {prop.label}
                        </label>
                        <div className="w-full px-3 py-2.5 border-2 bg-gray-50 text-black border-gray-200 rounded-lg">
                          {selectedCoal[prop.id] !== undefined && selectedCoal[prop.id] !== null ? selectedCoal[prop.id] : "-"}
                        </div>
                      </div>
                    ))}
                  </div>
                  <div className="flex justify-end gap-3 mt-6">
                    <button
                      onClick={() => setIsViewModalOpen(false)}
                      className="px-6 py-3 bg-gray-600 text-white rounded-xl hover:bg-gray-700 flex items-center gap-2 font-semibold shadow-lg transition-all"
                    >
                      <X className="h-4 w-4" /> Close
                    </button>
                  </div>
                </div>
              </Modal>
            )}
          </div>
        )}

        {/* Edit Modal for Extracted Data */}
        <Modal
          isOpen={isEditModalOpen}
          onClose={() => setIsEditModalOpen(false)}
          title="Review & Edit Extracted Data"
        >
          <CoalDataForm
            formData={formData}
            onChange={handleInputChange}
            onSubmit={handleSubmit}
            isLoading={isLoading}
            onCancel={() => setIsEditModalOpen(false)}
          />
        </Modal>
      </div>
    </PageLayout>
  );
}

export default VendorDataUpload;

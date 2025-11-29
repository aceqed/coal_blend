import React from "react";
import { Save, X } from "lucide-react";

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

const CoalDataForm = ({ formData, onChange, onSubmit, isLoading, onCancel }) => {
  return (
    <form onSubmit={onSubmit} className="space-y-4">
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
        {COAL_PROPERTIES.map((prop) => (
          <div key={prop.id}>
            <label className="block text-sm font-medium text-gray-700 mb-1">
              {prop.label}
            </label>
            <input
              type={prop.type}
              name={prop.id}
              value={formData[prop.id] !== undefined && formData[prop.id] !== null ? formData[prop.id] : ""}
              onChange={onChange}
              step={prop.step}
              required={prop.required}
              className="w-full px-3 py-2 border bg-white text-black border-gray-300 rounded-md focus:ring-2 focus:ring-blue-500 focus:border-blue-500 transition-colors"
            />
          </div>
        ))}
      </div>
      
      <div className="flex justify-end space-x-3 mt-6 pt-4 border-t border-gray-100">
        {onCancel && (
          <button
            type="button"
            onClick={onCancel}
            className="px-4 py-2 border border-gray-300 text-gray-700 rounded-md hover:bg-gray-50 flex items-center transition-colors"
          >
            <X className="h-4 w-4 mr-2" /> Cancel
          </button>
        )}
        <button
          type="submit"
          disabled={isLoading}
          className="px-4 py-2 bg-blue-600 text-white rounded-md hover:bg-blue-700 flex items-center transition-colors disabled:opacity-50 disabled:cursor-not-allowed"
        >
          <Save className="h-4 w-4 mr-2" /> Save Coal Data
        </button>
      </div>
    </form>
  );
};

export default CoalDataForm;

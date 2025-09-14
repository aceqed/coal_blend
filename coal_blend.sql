--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

-- Started on 2025-09-14 13:02:21

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 217 (class 1259 OID 41499)
-- Name: avg_param_cri; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.avg_param_cri (
    parameter text,
    value double precision
);


ALTER TABLE public.avg_param_cri OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 41504)
-- Name: blend_composition; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.blend_composition (
    blend_id integer,
    coal_name text,
    percentage double precision
);


ALTER TABLE public.blend_composition OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 41509)
-- Name: blend_composition_all; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.blend_composition_all (
    blend_id integer,
    coal_name text,
    percentage double precision
);


ALTER TABLE public.blend_composition_all OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 41514)
-- Name: blend_reco_selection; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.blend_reco_selection (
    id integer,
    user_id integer,
    node_id integer,
    type character varying(10),
    coalno character varying(50),
    coal_name character varying(100),
    min_value double precision,
    max_value double precision,
    stockout_date date,
    inventory double precision
);


ALTER TABLE public.blend_reco_selection OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 41517)
-- Name: blend_recom_output_perc_temp; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.blend_recom_output_perc_temp (
    id integer,
    user_id integer,
    node_id integer,
    type character varying(10),
    recno integer,
    coalno character varying(50),
    coal_name character varying(100),
    blend_perc double precision
);


ALTER TABLE public.blend_recom_output_perc_temp OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 41520)
-- Name: blend_recommendation_output_temp; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.blend_recommendation_output_temp (
    id integer,
    user_id integer,
    node_id integer,
    type character varying(10),
    recno integer,
    ash double precision,
    cri double precision,
    csr double precision,
    p double precision,
    s double precision,
    m20 double precision,
    m10 double precision,
    m40 double precision,
    fc double precision,
    yield double precision,
    dmt_cost double precision,
    netcost double precision,
    max_fluidity_log_c double precision,
    sodiumoxide_imputed double precision,
    potassiumoxide_imputed double precision,
    phosincoal_airdried_prox double precision,
    csn double precision,
    ash_airdried_prox double precision,
    volatilematter_airdried_prox double precision
);


ALTER TABLE public.blend_recommendation_output_temp OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 41523)
-- Name: blend_recommendation_tracker; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.blend_recommendation_tracker (
    id integer NOT NULL,
    user_id integer,
    upload_status character varying(50),
    creation_date timestamp without time zone,
    lastupdated_date timestamp without time zone,
    node_id integer,
    type character varying(10)
);


ALTER TABLE public.blend_recommendation_tracker OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 41526)
-- Name: blend_recommendation_tracker_temp; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.blend_recommendation_tracker_temp (
    id integer NOT NULL,
    user_id integer,
    upload_status character varying(50),
    creation_date timestamp without time zone,
    lastupdated_date timestamp without time zone,
    node_id integer,
    type character varying(10)
);


ALTER TABLE public.blend_recommendation_tracker_temp OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 41529)
-- Name: blend_recommendations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.blend_recommendations (
    id integer NOT NULL,
    simulation_id integer,
    coal_name character varying(100),
    percentage double precision,
    predicted_ash double precision,
    predicted_vm double precision,
    predicted_fc double precision,
    predicted_csn double precision,
    predicted_cri double precision,
    predicted_csr double precision,
    predicted_ash_final double precision,
    predicted_vm_final double precision,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.blend_recommendations OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 41533)
-- Name: blend_recommendations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.blend_recommendations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.blend_recommendations_id_seq OWNER TO postgres;

--
-- TOC entry 5176 (class 0 OID 0)
-- Dependencies: 226
-- Name: blend_recommendations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.blend_recommendations_id_seq OWNED BY public.blend_recommendations.id;


--
-- TOC entry 227 (class 1259 OID 41534)
-- Name: coal_blend_ratio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.coal_blend_ratio (
    blend_id integer NOT NULL,
    "Riverside" real,
    "Moranbah North" real,
    "Illawara (PHCC)" real,
    "Goonyella" real,
    "Caval Ridge" real,
    "PDN" real,
    "Poitrel" real,
    "Amonate" real,
    "Aus.SHCC" real,
    "Teck Venture" real,
    "Lake Vermont" real,
    "Metropolitan" real,
    "Indonasian" real,
    "Low Ash SHCC/ SHCC-BHP" real,
    "Eagle crrek" real,
    "Dhamra SHCC PDN" real,
    "Daunia (SHCC)" real,
    "Leer" real,
    "Elga" real,
    "Leer/Russian HFCC" real,
    "Uvalnaya" real,
    "Blue creek" real,
    "Mt. Laurel" real,
    "R.PCI" real,
    "E.Soft" real,
    "Indian Coal Dhanbaad" real,
    "Scratch Coal" real,
    "HCC/ SHCC Contaminated Coal" real
);


ALTER TABLE public.coal_blend_ratio OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 41537)
-- Name: coal_blend_ratio_all; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.coal_blend_ratio_all (
    blend_id integer,
    "Riverside" real,
    "Moranbah North" real,
    "Illawara (PHCC)" real,
    "Goonyella" real,
    "Caval Ridge" real,
    "PDN" real,
    "Poitrel" real,
    "Amonate" real,
    "Aus.SHCC" real,
    "Teck Venture" real,
    "Lake Vermont" real,
    "Metropolitan" real,
    "Indonasian" real,
    "Low Ash SHCC/ SHCC-BHP" real,
    "Eagle crrek" real,
    "Dhamra SHCC PDN" real,
    "Daunia (SHCC)" real,
    "Leer" real,
    "Elga" real,
    "Leer/Russian HFCC" real,
    "Uvalnaya" real,
    "Blue creek" real,
    "Mt. Laurel" real,
    "R.PCI" real,
    "E.Soft" real,
    "Indian Coal Dhanbaad" real,
    "Scratch Coal" real,
    "HCC/ SHCC Contaminated Coal" real
);


ALTER TABLE public.coal_blend_ratio_all OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 41540)
-- Name: coal_blend_ratio_blend_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.coal_blend_ratio_blend_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.coal_blend_ratio_blend_id_seq OWNER TO postgres;

--
-- TOC entry 5177 (class 0 OID 0)
-- Dependencies: 229
-- Name: coal_blend_ratio_blend_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.coal_blend_ratio_blend_id_seq OWNED BY public.coal_blend_ratio.blend_id;


--
-- TOC entry 230 (class 1259 OID 41541)
-- Name: coal_blend_standard; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.coal_blend_standard (
    row_name text NOT NULL,
    total_moisture real,
    ash_percent real,
    vm_percent real,
    fc_percent real,
    sulphur_percent real,
    phosphorus real
);


ALTER TABLE public.coal_blend_standard OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 41546)
-- Name: coal_blend_standard_proprety; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.coal_blend_standard_proprety (
    riverside integer,
    "Moranbah North" integer,
    "Illawara(PHCC)" integer,
    goonyella integer,
    "Caval Ridge" integer,
    pdn integer,
    poitrel integer,
    amonate integer,
    "Aus.SHCC" integer,
    "Teck Venture" integer,
    "Lake Vermont" integer,
    metropolitan integer,
    indonasian integer,
    "Low Ash SHCC/ SHCC-BHP" integer,
    "Eagle creek" integer,
    "Dhamra_SHCC_PDN" integer,
    daunia integer,
    leer integer,
    elga integer,
    "Leer/Russian HFCC" integer,
    uvalnaya integer,
    "Blue creek" integer,
    "Mt.Laurel" integer,
    "Russian PCI" integer,
    "E.Soft" integer,
    "Indian Coal Dhanbaad" integer,
    "Scratch Coal" integer,
    " HCC/SHCC Contaminated Coal" integer
);


ALTER TABLE public.coal_blend_standard_proprety OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 41549)
-- Name: coal_list; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.coal_list (
    id integer NOT NULL,
    coalno character varying(50) NOT NULL,
    coal_name character varying(100) NOT NULL,
    active_flag boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.coal_list OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 41555)
-- Name: coal_list_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.coal_list_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.coal_list_id_seq OWNER TO postgres;

--
-- TOC entry 5178 (class 0 OID 0)
-- Dependencies: 233
-- Name: coal_list_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.coal_list_id_seq OWNED BY public.coal_list.id;


--
-- TOC entry 234 (class 1259 OID 41556)
-- Name: coal_master_model_new; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.coal_master_model_new (
    id integer NOT NULL,
    coalno character varying(50) NOT NULL,
    coal_name character varying(100) NOT NULL,
    active boolean DEFAULT true,
    ash_airdried_prox_imputed double precision,
    ash_dry_prox_imputed double precision,
    volatilematter_dry_prox_imputed double precision,
    sulphur_airdried_prox_imputed double precision,
    fixedcarbon_airdried_prox double precision,
    totalmoisture_asreceived_prox_imputed double precision,
    inherentmoisture_airdried_prox double precision,
    vitrinitereflectanceromax_imputed double precision,
    vitrinitereflectancervrandom_imputed double precision,
    vitrinite_imputed double precision,
    csn_imputed double precision,
    maxfluidity_log_imputed double precision,
    silicondioxide_imputed double precision,
    aluminiumoxide_imputed double precision,
    calciumoxide_imputed double precision,
    magnesiumoxide_imputed double precision,
    ironoxide_imputed double precision,
    sodiumoxide_imputed double precision,
    potassiumoxide_imputed double precision,
    phosphoruspentoxide_imputed double precision,
    titaniumoxide_imputed double precision,
    trimanganesetetraoxide_imputed double precision,
    sulfurtrioxide_imputed double precision,
    fob_price double precision,
    freight double precision,
    discount double precision,
    exchange_rate double precision,
    coaltype character varying(50),
    landed_cost double precision,
    duty double precision,
    cess double precision,
    port_to_plant double precision,
    wmt_cost double precision,
    dmt_cost double precision,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.coal_master_model_new OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 41561)
-- Name: coal_master_model_new_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.coal_master_model_new_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.coal_master_model_new_id_seq OWNER TO postgres;

--
-- TOC entry 5179 (class 0 OID 0)
-- Dependencies: 235
-- Name: coal_master_model_new_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.coal_master_model_new_id_seq OWNED BY public.coal_master_model_new.id;


--
-- TOC entry 236 (class 1259 OID 41562)
-- Name: coal_properties; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.coal_properties (
    coal_name text NOT NULL,
    total_moisture real,
    ash_percent real,
    vm_percent real,
    fc_percent real,
    sulphur_percent real,
    phosphorus real
);


ALTER TABLE public.coal_properties OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 41567)
-- Name: coal_properties_all; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.coal_properties_all (
    coal_name character varying(100),
    ash_airdried_prox_imputed double precision,
    ash_dry_prox_imputed double precision,
    volatilematter_dry_prox_imputed double precision,
    silicondioxide_imputed double precision,
    sulphur_airdried_prox_imputed double precision,
    maxfluidity_log_imputed double precision,
    vitrinite_imputed double precision,
    aluminiumoxide_imputed double precision,
    calciumoxide_imputed double precision,
    ironoxide_imputed double precision,
    magnesiumoxide_imputed double precision,
    sodiumoxide_imputed double precision,
    potassiumoxide_imputed double precision,
    phosphoruspentoxide_imputed double precision,
    titaniumoxide_imputed double precision,
    trimanganesetetraoxide_imputed double precision,
    sulfurtrioxide_imputed double precision,
    csn_imputed double precision
);


ALTER TABLE public.coal_properties_all OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 41570)
-- Name: coal_properties_clean; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.coal_properties_clean (
    coal_name character varying(100),
    "IM" double precision,
    "Ash" double precision,
    "VM" double precision,
    "FC" double precision,
    "S" double precision,
    "P" double precision,
    "SiO2" double precision,
    "Al2O3" double precision,
    "Fe2O3" double precision,
    "CaO" double precision,
    "MgO" double precision,
    "Na2O" double precision,
    "K2O" double precision,
    "TiO2" double precision,
    "Mn3O4" double precision,
    "SO3" double precision,
    "P2O5" double precision,
    "BaO" double precision,
    "SrO" double precision,
    "ZnO" double precision,
    "CRI" double precision,
    "CSR" double precision,
    "N" double precision,
    "HGI" double precision DEFAULT 0,
    "Rank" character varying(50) DEFAULT '0'::character varying,
    "Vitrinite" double precision DEFAULT 0,
    "Liptinite" double precision DEFAULT 0,
    "Semi_Fusinite" double precision DEFAULT 0,
    "CSN_FSI" double precision DEFAULT 0,
    "Initial_Softening_Temp" double precision DEFAULT 0,
    "MBI" double precision DEFAULT 0,
    "CBI" double precision DEFAULT 0,
    "Log_Max_Fluidity" double precision DEFAULT 0,
    coal_category character varying(100),
    "C" double precision DEFAULT 0.0,
    "H" double precision DEFAULT 0.0,
    "O" double precision DEFAULT 0.0,
    ss double precision DEFAULT 0.0,
    "V7" double precision,
    "V8" double precision,
    "V9" double precision,
    "V10" double precision,
    "V11" double precision,
    "V12" double precision,
    "V13" double precision,
    "V14" double precision,
    "V15" double precision,
    "V16" double precision,
    "V17" double precision,
    "V18" double precision,
    "V19" double precision,
    "Inertinite" double precision,
    "Minerals" double precision,
    "MaxFluidity" double precision
);


ALTER TABLE public.coal_properties_clean OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 41587)
-- Name: coal_second_data; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.coal_second_data (
    coal_name character varying(100),
    "VM" double precision,
    "FC" double precision,
    "S" double precision,
    "P" double precision,
    "HGI" double precision,
    "Rank" character varying(50),
    "Vitrnite" double precision,
    "Liptinite" double precision,
    "Semi_Fusinite" double precision,
    "CSN_FSI" double precision,
    "Initial_Softening_Temp" double precision,
    "CRI" double precision,
    "CSR" double precision,
    "BI" double precision,
    "MBI" double precision,
    "CBI" double precision,
    "Log_Max_Fluidity" double precision,
    coal_category character varying(100),
    "C" double precision DEFAULT 0.0,
    "H" double precision DEFAULT 0.0,
    "O" double precision DEFAULT 0.0,
    ss double precision DEFAULT 0.0,
    "V7" double precision,
    "V8" double precision,
    "V9" double precision,
    "V10" double precision,
    "V11" double precision,
    "V12" double precision,
    "V13" double precision,
    "V14" double precision,
    "V15" double precision,
    "V16" double precision,
    "V17" double precision,
    "V18" double precision,
    "V19" double precision,
    "Inertinite" double precision,
    "Minerals" double precision,
    "MaxFluidity" double precision
);


ALTER TABLE public.coal_second_data OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 41594)
-- Name: coalblendcomposition; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.coalblendcomposition (
    riverside double precision,
    "Moranbah North" double precision,
    "Illawara(PHCC)" double precision,
    goonyella double precision,
    "Caval Ridge" double precision,
    pdn double precision,
    poitrel double precision,
    amonate double precision,
    "Aus._SHCC" double precision,
    "Teck Venture" double precision,
    "Lake Vermont" double precision,
    metropolitan double precision,
    collinsvill double precision,
    "Olive Down" double precision,
    indonasian double precision,
    "Low Ash SHCC/SHCC BHP" double precision,
    "Eagle crrek" double precision,
    "Dhamra SHCC PDN" double precision,
    "Daunia(SHCC)" double precision,
    leer double precision,
    "Shoal Creek" double precision,
    elga double precision,
    "Leer/Russian HFCC" double precision,
    uvalnaya double precision,
    "Blue creek" double precision,
    "Mt. Laurel" double precision,
    "R.PCI" double precision,
    "E.Soft" double precision,
    "Indian Coal Dhanbaad" double precision,
    "Scratch Coal" double precision,
    "HCC/ SHCC Contaminated Coal" double precision,
    "%Ash" double precision,
    "%VM" double precision,
    "%FC" double precision,
    csn double precision,
    cri double precision,
    csr double precision,
    ash double precision,
    vm double precision
);


ALTER TABLE public.coalblendcomposition OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 41597)
-- Name: coalblendcomposition2; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.coalblendcomposition2 (
    "Riverside" double precision,
    "Moranbah_North" double precision,
    "Illawara" double precision,
    "Goonyella" double precision,
    "Caval_Ridge" double precision,
    "PDN" double precision,
    "Poitrel PCI" double precision,
    amonate double precision,
    aus_shcc double precision,
    teck_venture double precision,
    lake_vermont double precision,
    "Metropolitan Coking CoalI" double precision,
    collinsvill double precision,
    olive_down double precision,
    indonasian double precision,
    low_ash_shcc_shcc_bhp double precision,
    "Eagle Creek" double precision,
    dhamra_shcc_pdn double precision,
    "Daunia" double precision,
    "Leer" double precision,
    shoal_creek double precision,
    elga double precision,
    leer_russian_hfcc double precision,
    uvalnaya double precision,
    blue_creek double precision,
    mt_laurel double precision,
    "Russian PCI" double precision,
    e_soft double precision,
    indian_coal_dhanbaad double precision,
    scratch_coal double precision,
    hcc_shcc_contaminated_coal double precision
);


ALTER TABLE public.coalblendcomposition2 OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 41600)
-- Name: mobj_constraints; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mobj_constraints (
    id integer NOT NULL,
    parameters character varying(100) NOT NULL,
    display_name character varying(150),
    type character varying(50),
    min_value double precision,
    max_value double precision,
    range_max double precision,
    lastupdated_date timestamp without time zone,
    lastupdated_by character varying(100),
    active integer DEFAULT 1,
    node_id integer
);


ALTER TABLE public.mobj_constraints OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 41604)
-- Name: mobj_constraints_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mobj_constraints_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.mobj_constraints_id_seq OWNER TO postgres;

--
-- TOC entry 5180 (class 0 OID 0)
-- Dependencies: 243
-- Name: mobj_constraints_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mobj_constraints_id_seq OWNED BY public.mobj_constraints.id;


--
-- TOC entry 244 (class 1259 OID 41605)
-- Name: mobj_constraints_temp; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mobj_constraints_temp (
    id integer,
    user_id integer,
    node_id integer,
    type character varying(10),
    parameters character varying(50),
    display_name character varying(100),
    min_value double precision,
    max_value double precision,
    last_updated_date timestamp without time zone,
    last_updated_by integer,
    active boolean,
    creation_date timestamp without time zone,
    created_by integer,
    tenant_id integer
);


ALTER TABLE public.mobj_constraints_temp OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 41608)
-- Name: parameter_ranges; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.parameter_ranges (
    parameter text NOT NULL,
    min double precision,
    max double precision
);


ALTER TABLE public.parameter_ranges OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 41613)
-- Name: parking_table; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.parking_table (
    parking_name character varying(100),
    total_vehicle integer
);


ALTER TABLE public.parking_table OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 41616)
-- Name: prediction_output; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prediction_output (
    id integer NOT NULL,
    user_id integer,
    coal_data jsonb,
    inherentmoisture_airdried_prox double precision,
    volatilematter_airdried_prox double precision,
    ash_airdried_prox double precision,
    fixedcarbon_airdried_prox double precision,
    phosincoal_airdried_prox double precision,
    sulphur_airdried_prox double precision,
    csn double precision,
    max_fluidity_log_c double precision,
    vitrinitereflectanceromax_imputed double precision,
    vm double precision,
    ash double precision,
    fc double precision,
    p double precision,
    s double precision,
    cri double precision,
    csr double precision,
    m10 double precision,
    m20 double precision,
    m40 double precision,
    yield double precision,
    dmt_cost double precision,
    netcost double precision,
    impact_m10 double precision,
    impact_m10_current double precision,
    netcost_m10 double precision,
    cost_of_cokethm double precision,
    impact_of_ash double precision,
    inc_currentblend_ash double precision,
    ash_thm double precision,
    productivity double precision,
    impact_of_cri double precision,
    inc_currentblend_cri double precision,
    viu_cri double precision,
    final_cost_thm double precision,
    alert text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.prediction_output OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 41622)
-- Name: prediction_output_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.prediction_output_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.prediction_output_id_seq OWNER TO postgres;

--
-- TOC entry 5181 (class 0 OID 0)
-- Dependencies: 248
-- Name: prediction_output_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.prediction_output_id_seq OWNED BY public.prediction_output.id;


--
-- TOC entry 249 (class 1259 OID 41623)
-- Name: prediction_selection; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prediction_selection (
    id integer NOT NULL,
    user_id integer,
    coal_selection jsonb,
    total_percentage double precision,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.prediction_selection OWNER TO postgres;

--
-- TOC entry 250 (class 1259 OID 41629)
-- Name: prediction_selection_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.prediction_selection_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.prediction_selection_id_seq OWNER TO postgres;

--
-- TOC entry 5182 (class 0 OID 0)
-- Dependencies: 250
-- Name: prediction_selection_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.prediction_selection_id_seq OWNED BY public.prediction_selection.id;


--
-- TOC entry 251 (class 1259 OID 41630)
-- Name: simulationCoalRecommendations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."simulationCoalRecommendations" (
    id integer NOT NULL,
    simulation_id integer,
    coal_percentages json,
    predicted_ash double precision,
    predicted_vm double precision,
    predicted_fc double precision,
    predicted_csn double precision,
    predicted_cri double precision,
    predicted_csr double precision,
    predicted_ash_final double precision,
    predicted_vm_final double precision,
    total_cost double precision,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone,
    "CO2_Emissions" double precision,
    "CO_Emissions" double precision,
    "SO2_Emissions" double precision,
    "NO_Emissions" double precision,
    "NO2_Emissions" double precision,
    "PM_index" double precision,
    "PM10_Emissions" double precision,
    "PM25_Emissions" double precision,
    "VOC_index" double precision,
    "VOC_Emissions" double precision,
    "PAH_Emissions" double precision
);


ALTER TABLE public."simulationCoalRecommendations" OWNER TO postgres;

--
-- TOC entry 252 (class 1259 OID 41636)
-- Name: simulationCoalRecommendations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."simulationCoalRecommendations_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."simulationCoalRecommendations_id_seq" OWNER TO postgres;

--
-- TOC entry 5183 (class 0 OID 0)
-- Dependencies: 252
-- Name: simulationCoalRecommendations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."simulationCoalRecommendations_id_seq" OWNED BY public."simulationCoalRecommendations".id;


--
-- TOC entry 253 (class 1259 OID 41637)
-- Name: simulation_properties; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.simulation_properties (
    id integer NOT NULL,
    simulation_id integer,
    property_type character varying(50),
    property_name character varying(50),
    min_value double precision,
    max_value double precision
);


ALTER TABLE public.simulation_properties OWNER TO postgres;

--
-- TOC entry 254 (class 1259 OID 41640)
-- Name: simulation_properties_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.simulation_properties_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.simulation_properties_id_seq OWNER TO postgres;

--
-- TOC entry 5184 (class 0 OID 0)
-- Dependencies: 254
-- Name: simulation_properties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.simulation_properties_id_seq OWNED BY public.simulation_properties.id;


--
-- TOC entry 255 (class 1259 OID 41641)
-- Name: simulation_updates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.simulation_updates (
    id integer NOT NULL,
    simulation_id integer NOT NULL,
    status character varying(50) NOT NULL,
    progress double precision DEFAULT 0.0 NOT NULL,
    message text,
    "timestamp" timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.simulation_updates OWNER TO postgres;

--
-- TOC entry 256 (class 1259 OID 41648)
-- Name: simulation_updates_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.simulation_updates_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.simulation_updates_id_seq OWNER TO postgres;

--
-- TOC entry 5185 (class 0 OID 0)
-- Dependencies: 256
-- Name: simulation_updates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.simulation_updates_id_seq OWNED BY public.simulation_updates.id;


--
-- TOC entry 257 (class 1259 OID 41649)
-- Name: simulations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.simulations (
    id integer NOT NULL,
    scenario_name character varying(255) NOT NULL,
    scenario_description text,
    generated_date timestamp with time zone DEFAULT now(),
    status character varying(50),
    user_id integer
);


ALTER TABLE public.simulations OWNER TO postgres;

--
-- TOC entry 258 (class 1259 OID 41655)
-- Name: simulations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.simulations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.simulations_id_seq OWNER TO postgres;

--
-- TOC entry 5186 (class 0 OID 0)
-- Dependencies: 258
-- Name: simulations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.simulations_id_seq OWNED BY public.simulations.id;


--
-- TOC entry 259 (class 1259 OID 41656)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying,
    name character varying,
    hashed_password character varying,
    is_active boolean,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 260 (class 1259 OID 41662)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 5187 (class 0 OID 0)
-- Dependencies: 260
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 262 (class 1259 OID 41764)
-- Name: vendor_coal_data; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vendor_coal_data (
    id integer NOT NULL,
    coal_name character varying(100),
    "IM" double precision,
    "Ash" double precision,
    "VM" double precision,
    "FC" double precision,
    "S" double precision,
    "P" double precision,
    "SiO2" double precision,
    "Al2O3" double precision,
    "Fe2O3" double precision,
    "CaO" double precision,
    "MgO" double precision,
    "Na2O" double precision,
    "K2O" double precision,
    "TiO2" double precision,
    "Mn3O4" double precision,
    "SO3" double precision,
    "P2O5" double precision,
    "BaO" double precision,
    "SrO" double precision,
    "ZnO" double precision,
    "CRI" double precision,
    "CSR" double precision,
    "N" double precision,
    "HGI" double precision,
    "Rank" character varying(50),
    "Vitrinite" double precision,
    "Liptinite" double precision,
    "Semi_Fusinite" double precision,
    "CSN_FSI" double precision,
    "Initial_Softening_Temp" double precision,
    "MBI" double precision,
    "CBI" double precision,
    "Log_Max_Fluidity" double precision,
    coal_category character varying(50),
    "C" double precision,
    "H" double precision,
    "O" double precision,
    ss double precision,
    "V7" double precision,
    "V8" double precision,
    "V9" double precision,
    "V10" double precision,
    "V11" double precision,
    "V12" double precision,
    "V13" double precision,
    "V14" double precision,
    "V15" double precision,
    "V16" double precision,
    "V17" double precision,
    "V18" double precision,
    "V19" double precision,
    "Inertinite" double precision,
    "Minerals" double precision,
    "MaxFluidity" double precision,
    is_approved boolean,
    uploaded_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.vendor_coal_data OWNER TO postgres;

--
-- TOC entry 261 (class 1259 OID 41763)
-- Name: vendor_coal_data_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vendor_coal_data_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vendor_coal_data_id_seq OWNER TO postgres;

--
-- TOC entry 5188 (class 0 OID 0)
-- Dependencies: 261
-- Name: vendor_coal_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vendor_coal_data_id_seq OWNED BY public.vendor_coal_data.id;


--
-- TOC entry 4882 (class 2604 OID 41671)
-- Name: blend_recommendations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blend_recommendations ALTER COLUMN id SET DEFAULT nextval('public.blend_recommendations_id_seq'::regclass);


--
-- TOC entry 4884 (class 2604 OID 41672)
-- Name: coal_blend_ratio blend_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coal_blend_ratio ALTER COLUMN blend_id SET DEFAULT nextval('public.coal_blend_ratio_blend_id_seq'::regclass);


--
-- TOC entry 4885 (class 2604 OID 41673)
-- Name: coal_list id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coal_list ALTER COLUMN id SET DEFAULT nextval('public.coal_list_id_seq'::regclass);


--
-- TOC entry 4889 (class 2604 OID 41674)
-- Name: coal_master_model_new id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coal_master_model_new ALTER COLUMN id SET DEFAULT nextval('public.coal_master_model_new_id_seq'::regclass);


--
-- TOC entry 4910 (class 2604 OID 41675)
-- Name: mobj_constraints id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mobj_constraints ALTER COLUMN id SET DEFAULT nextval('public.mobj_constraints_id_seq'::regclass);


--
-- TOC entry 4912 (class 2604 OID 41676)
-- Name: prediction_output id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prediction_output ALTER COLUMN id SET DEFAULT nextval('public.prediction_output_id_seq'::regclass);


--
-- TOC entry 4914 (class 2604 OID 41677)
-- Name: prediction_selection id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prediction_selection ALTER COLUMN id SET DEFAULT nextval('public.prediction_selection_id_seq'::regclass);


--
-- TOC entry 4916 (class 2604 OID 41678)
-- Name: simulationCoalRecommendations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."simulationCoalRecommendations" ALTER COLUMN id SET DEFAULT nextval('public."simulationCoalRecommendations_id_seq"'::regclass);


--
-- TOC entry 4918 (class 2604 OID 41679)
-- Name: simulation_properties id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.simulation_properties ALTER COLUMN id SET DEFAULT nextval('public.simulation_properties_id_seq'::regclass);


--
-- TOC entry 4919 (class 2604 OID 41680)
-- Name: simulation_updates id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.simulation_updates ALTER COLUMN id SET DEFAULT nextval('public.simulation_updates_id_seq'::regclass);


--
-- TOC entry 4922 (class 2604 OID 41681)
-- Name: simulations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.simulations ALTER COLUMN id SET DEFAULT nextval('public.simulations_id_seq'::regclass);


--
-- TOC entry 4924 (class 2604 OID 41682)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 4926 (class 2604 OID 41767)
-- Name: vendor_coal_data id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_coal_data ALTER COLUMN id SET DEFAULT nextval('public.vendor_coal_data_id_seq'::regclass);


--
-- TOC entry 5125 (class 0 OID 41499)
-- Dependencies: 217
-- Data for Name: avg_param_cri; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.avg_param_cri (parameter, value) FROM stdin;
\.


--
-- TOC entry 5126 (class 0 OID 41504)
-- Dependencies: 218
-- Data for Name: blend_composition; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.blend_composition (blend_id, coal_name, percentage) FROM stdin;
1	Goonyella	33
2	Goonyella	33
3	Goonyella	33
4	Goonyella	28
5	Goonyella	28
6	Goonyella	28
7	Goonyella	28
8	Goonyella	28
9	Goonyella	28
10	Goonyella	28
11	Goonyella	33
12	Goonyella	33
13	Goonyella	33
14	Goonyella	33
15	Goonyella	33
16	Goonyella	33
17	Goonyella	33
18	Goonyella	36
19	Goonyella	36
20	Goonyella	35
21	Goonyella	35
22	Goonyella	35
23	Goonyella	40
24	Goonyella	40
25	Goonyella	40
26	Goonyella	35
27	Goonyella	25
28	Goonyella	30
29	Goonyella	30
30	Goonyella	30
31	Goonyella	30
32	Goonyella	30
33	Goonyella	35
34	Goonyella	35
35	Goonyella	35
36	Goonyella	35
37	Goonyella	40
38	Goonyella	35
39	Goonyella	35
40	Goonyella	35
41	Goonyella	35
42	Goonyella	31
43	Goonyella	31
44	Goonyella	31
45	Goonyella	31
46	Goonyella	31
47	Goonyella	31
48	Goonyella	31
49	Goonyella	31
50	Goonyella	33
51	Goonyella	33
52	Goonyella	33
53	Goonyella	35
54	Goonyella	35
55	Goonyella	35
56	Goonyella	35
57	Goonyella	35
58	Goonyella	33
1	Metropolitan Coking CoalI	19
2	Metropolitan Coking CoalI	19
3	Metropolitan Coking CoalI	19
4	Metropolitan Coking CoalI	18
5	Metropolitan Coking CoalI	18
6	Metropolitan Coking CoalI	8
7	Metropolitan Coking CoalI	8
8	Metropolitan Coking CoalI	8
11	Metropolitan Coking CoalI	20
12	Metropolitan Coking CoalI	20
13	Metropolitan Coking CoalI	20
14	Metropolitan Coking CoalI	20
15	Metropolitan Coking CoalI	20
16	Metropolitan Coking CoalI	10
17	Metropolitan Coking CoalI	10
18	Metropolitan Coking CoalI	10
19	Metropolitan Coking CoalI	10
20	Metropolitan Coking CoalI	10
21	Metropolitan Coking CoalI	10
22	Metropolitan Coking CoalI	10
23	Metropolitan Coking CoalI	5
24	Metropolitan Coking CoalI	5
25	Metropolitan Coking CoalI	5
26	Metropolitan Coking CoalI	19
27	Metropolitan Coking CoalI	24
28	Metropolitan Coking CoalI	17
29	Metropolitan Coking CoalI	17
30	Metropolitan Coking CoalI	15
31	Metropolitan Coking CoalI	15
32	Metropolitan Coking CoalI	15
33	Metropolitan Coking CoalI	20
34	Metropolitan Coking CoalI	20
35	Metropolitan Coking CoalI	20
36	Metropolitan Coking CoalI	20
37	Metropolitan Coking CoalI	20
38	Metropolitan Coking CoalI	20
39	Metropolitan Coking CoalI	20
40	Metropolitan Coking CoalI	19
41	Metropolitan Coking CoalI	19
42	Metropolitan Coking CoalI	17
43	Metropolitan Coking CoalI	17
44	Metropolitan Coking CoalI	17
45	Metropolitan Coking CoalI	17
46	Metropolitan Coking CoalI	17
47	Metropolitan Coking CoalI	17
48	Metropolitan Coking CoalI	17
49	Metropolitan Coking CoalI	17
50	Metropolitan Coking CoalI	20
51	Metropolitan Coking CoalI	20
52	Metropolitan Coking CoalI	20
53	Metropolitan Coking CoalI	20
54	Metropolitan Coking CoalI	20
55	Metropolitan Coking CoalI	20
56	Metropolitan Coking CoalI	20
57	Metropolitan Coking CoalI	20
58	Metropolitan Coking CoalI	21
16	collinsvill	10
17	collinsvill	10
18	collinsvill	7
19	collinsvill	7
20	collinsvill	7
21	collinsvill	7
22	collinsvill	6
23	collinsvill	10
24	collinsvill	10
25	collinsvill	10
26	collinsvill	8
27	collinsvill	12
28	collinsvill	10
29	collinsvill	12
30	collinsvill	12
31	collinsvill	12
32	collinsvill	12
33	collinsvill	10
34	collinsvill	10
35	collinsvill	10
36	collinsvill	10
37	collinsvill	10
4	olive_down	13
5	olive_down	13
6	olive_down	20
7	olive_down	20
8	olive_down	20
9	olive_down	27
10	olive_down	26
38	olive_down	10
39	olive_down	5
40	olive_down	5
41	olive_down	5
42	olive_down	5
43	olive_down	5
44	olive_down	5
45	olive_down	5
46	olive_down	5
47	olive_down	5
48	olive_down	5
49	olive_down	5
1	Daunia	7
2	Daunia	7
3	Daunia	7
1	Leer	17
2	Leer	17
3	Leer	17
4	Leer	17
5	Leer	17
6	Leer	20
7	Leer	20
8	Leer	20
9	Leer	20
10	Leer	19
11	Leer	18
12	Leer	18
13	Leer	18
14	Leer	16
15	Leer	16
16	Leer	16
17	Leer	16
18	Leer	18
19	Leer	18
20	Leer	18
21	Leer	18
22	Leer	19
23	Leer	19
24	Leer	19
25	Leer	19
26	Leer	20
27	Leer	22
28	Leer	22
29	Leer	18
30	Leer	17
31	Leer	17
32	Leer	17
33	Leer	17
34	Leer	17
35	Leer	17
36	Leer	17
38	Leer	8
39	Leer	8
40	Leer	8
41	Leer	15
42	Leer	17
43	Leer	17
44	Leer	17
45	Leer	17
46	Leer	17
47	Leer	17
48	Leer	17
49	Leer	17
50	Leer	5
51	Leer	5
52	Leer	5
37	shoal_creek	10
38	shoal_creek	7
39	shoal_creek	7
40	shoal_creek	7
50	shoal_creek	12
51	shoal_creek	12
52	shoal_creek	12
53	shoal_creek	17
54	shoal_creek	17
55	shoal_creek	17
56	shoal_creek	17
57	shoal_creek	17
58	shoal_creek	17
1	Russian PCI	17
2	Russian PCI	17
3	Russian PCI	17
4	Russian PCI	17
5	Russian PCI	17
6	Russian PCI	17
7	Russian PCI	17
8	Russian PCI	17
9	Russian PCI	17
10	Russian PCI	19
11	Russian PCI	21
12	Russian PCI	21
13	Russian PCI	21
14	Russian PCI	23
15	Russian PCI	23
16	Russian PCI	23
17	Russian PCI	23
18	Russian PCI	21
19	Russian PCI	21
20	Russian PCI	22
21	Russian PCI	22
22	Russian PCI	22
23	Russian PCI	18
24	Russian PCI	18
25	Russian PCI	18
26	Russian PCI	18
27	Russian PCI	12
28	Russian PCI	16
29	Russian PCI	18
30	Russian PCI	18
31	Russian PCI	18
32	Russian PCI	18
33	Russian PCI	18
34	Russian PCI	18
35	Russian PCI	18
36	Russian PCI	18
37	Russian PCI	20
38	Russian PCI	20
39	Russian PCI	20
40	Russian PCI	18
41	Russian PCI	16
42	Russian PCI	18
43	Russian PCI	18
44	Russian PCI	18
45	Russian PCI	18
46	Russian PCI	18
47	Russian PCI	18
48	Russian PCI	18
49	Russian PCI	18
50	Russian PCI	18
51	Russian PCI	18
52	Russian PCI	18
53	Russian PCI	16
54	Russian PCI	16
55	Russian PCI	16
56	Russian PCI	16
57	Russian PCI	16
58	Russian PCI	17
1	indian_coal_dhanbaad	7
2	indian_coal_dhanbaad	7
3	indian_coal_dhanbaad	7
4	indian_coal_dhanbaad	7
5	indian_coal_dhanbaad	7
6	indian_coal_dhanbaad	7
7	indian_coal_dhanbaad	7
8	indian_coal_dhanbaad	7
9	indian_coal_dhanbaad	8
10	indian_coal_dhanbaad	8
11	indian_coal_dhanbaad	8
12	indian_coal_dhanbaad	8
13	indian_coal_dhanbaad	8
14	indian_coal_dhanbaad	8
15	indian_coal_dhanbaad	8
16	indian_coal_dhanbaad	8
17	indian_coal_dhanbaad	8
18	indian_coal_dhanbaad	8
19	indian_coal_dhanbaad	8
20	indian_coal_dhanbaad	8
21	indian_coal_dhanbaad	8
22	indian_coal_dhanbaad	8
23	indian_coal_dhanbaad	8
24	indian_coal_dhanbaad	8
25	indian_coal_dhanbaad	8
27	indian_coal_dhanbaad	5
28	indian_coal_dhanbaad	5
29	indian_coal_dhanbaad	5
30	indian_coal_dhanbaad	8
31	indian_coal_dhanbaad	8
32	indian_coal_dhanbaad	8
39	indian_coal_dhanbaad	5
40	indian_coal_dhanbaad	8
41	indian_coal_dhanbaad	10
42	indian_coal_dhanbaad	12
43	indian_coal_dhanbaad	12
44	indian_coal_dhanbaad	12
45	indian_coal_dhanbaad	12
46	indian_coal_dhanbaad	12
47	indian_coal_dhanbaad	12
48	indian_coal_dhanbaad	12
49	indian_coal_dhanbaad	12
50	indian_coal_dhanbaad	12
51	indian_coal_dhanbaad	12
52	indian_coal_dhanbaad	12
53	indian_coal_dhanbaad	12
54	indian_coal_dhanbaad	12
55	indian_coal_dhanbaad	12
56	indian_coal_dhanbaad	12
57	indian_coal_dhanbaad	12
58	indian_coal_dhanbaad	12
\.


--
-- TOC entry 5127 (class 0 OID 41509)
-- Dependencies: 219
-- Data for Name: blend_composition_all; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.blend_composition_all (blend_id, coal_name, percentage) FROM stdin;
110	Moranbah North	27
111	Moranbah North	27
112	Moranbah North	27
113	Moranbah North	27
124	Moranbah North	44
125	Moranbah North	44
126	Moranbah North	44
127	Moranbah North	44
128	Moranbah North	45
129	Moranbah North	45
130	Moranbah North	45
131	Moranbah North	45
132	Moranbah North	45
133	Moranbah North	45
134	Moranbah North	45
135	Moranbah North	40
136	Moranbah North	40
137	Moranbah North	40
138	Moranbah North	35
139	Moranbah North	45
140	Moranbah North	45
141	Moranbah North	45
142	Moranbah North	50
143	Moranbah North	50
144	Moranbah North	50
145	Moranbah North	50
146	Moranbah North	50
147	Moranbah North	50
148	Moranbah North	50
149	Moranbah North	50
150	Moranbah North	50
151	Moranbah North	50
152	Moranbah North	50
153	Moranbah North	50
154	Moranbah North	50
155	Moranbah North	50
156	Moranbah North	55
157	Moranbah North	55
158	Moranbah North	55
181	Moranbah North	46
182	Moranbah North	46
183	Moranbah North	46
184	Moranbah North	46
185	Moranbah North	46
186	Moranbah North	46
187	Moranbah North	47
188	Moranbah North	47
189	Moranbah North	47
190	Moranbah North	47
191	Moranbah North	20
192	Moranbah North	20
193	Moranbah North	20
194	Moranbah North	16
195	Moranbah North	16
201	Moranbah North	20
202	Moranbah North	20
203	Moranbah North	20
204	Moranbah North	20
205	Moranbah North	20
206	Moranbah North	20
207	Moranbah North	18
208	Moranbah North	18
209	Moranbah North	18
210	Moranbah North	18
211	Moranbah North	17
212	Moranbah North	17
213	Moranbah North	17
214	Moranbah North	16
215	Moranbah North	16
216	Moranbah North	16
217	Moranbah North	16
218	Moranbah North	16
219	Moranbah North	16
220	Moranbah North	17
221	Moranbah North	17
284	Moranbah North	10
285	Moranbah North	10
286	Moranbah North	10
287	Moranbah North	10
288	Moranbah North	10
289	Moranbah North	10
290	Moranbah North	10
291	Moranbah North	10
835	Illawara (PHCC)	24
836	Illawara (PHCC)	24
837	Illawara (PHCC)	24
838	Illawara (PHCC)	24
839	Illawara (PHCC)	24
840	Illawara (PHCC)	24
841	Illawara (PHCC)	24
842	Illawara (PHCC)	24
843	Illawara (PHCC)	24
844	Illawara (PHCC)	24
845	Illawara (PHCC)	24
846	Illawara (PHCC)	24
847	Illawara (PHCC)	24
848	Illawara (PHCC)	24
849	Illawara (PHCC)	24
850	Illawara (PHCC)	24
851	Illawara (PHCC)	24
852	Illawara (PHCC)	22
853	Illawara (PHCC)	22
854	Illawara (PHCC)	15
855	Illawara (PHCC)	15
856	Illawara (PHCC)	15
857	Illawara (PHCC)	16
858	Illawara (PHCC)	16
859	Illawara (PHCC)	16
860	Illawara (PHCC)	16
861	Illawara (PHCC)	16
862	Illawara (PHCC)	16
863	Illawara (PHCC)	16
864	Illawara (PHCC)	16
865	Illawara (PHCC)	16
866	Illawara (PHCC)	32
867	Illawara (PHCC)	34
868	Illawara (PHCC)	34
869	Illawara (PHCC)	34
870	Illawara (PHCC)	34
871	Illawara (PHCC)	34
872	Illawara (PHCC)	34
882	Illawara (PHCC)	25
883	Illawara (PHCC)	25
884	Illawara (PHCC)	25
885	Illawara (PHCC)	25
888	Illawara (PHCC)	17
889	Illawara (PHCC)	17
890	Illawara (PHCC)	17
924	Illawara (PHCC)	32
925	Illawara (PHCC)	32
926	Illawara (PHCC)	32
990	Illawara (PHCC)	35
991	Illawara (PHCC)	35
1	Goonyella	40
2	Goonyella	40
3	Goonyella	34
4	Goonyella	34
5	Goonyella	34
6	Goonyella	40
7	Goonyella	40
8	Goonyella	40
9	Goonyella	40
10	Goonyella	45
11	Goonyella	45
12	Goonyella	45
13	Goonyella	45
14	Goonyella	45
47	Goonyella	16
48	Goonyella	16
49	Goonyella	16
50	Goonyella	16
51	Goonyella	16
52	Goonyella	13
53	Goonyella	13
54	Goonyella	13
55	Goonyella	13
191	Goonyella	26
192	Goonyella	26
193	Goonyella	26
194	Goonyella	30
195	Goonyella	30
196	Goonyella	40
197	Goonyella	40
198	Goonyella	40
199	Goonyella	40
200	Goonyella	40
247	Goonyella	20
248	Goonyella	20
249	Goonyella	20
250	Goonyella	19
251	Goonyella	19
252	Goonyella	17
253	Goonyella	17
254	Goonyella	17
255	Goonyella	17
256	Goonyella	17
257	Goonyella	17
258	Goonyella	17
259	Goonyella	17
260	Goonyella	17
261	Goonyella	16
262	Goonyella	16
263	Goonyella	16
264	Goonyella	15
265	Goonyella	15
266	Goonyella	15
267	Goonyella	30
268	Goonyella	30
269	Goonyella	30
270	Goonyella	30
271	Goonyella	30
272	Goonyella	30
273	Goonyella	30
274	Goonyella	31
275	Goonyella	31
276	Goonyella	31
277	Goonyella	31
278	Goonyella	31
279	Goonyella	31
280	Goonyella	31
281	Goonyella	31
282	Goonyella	31
283	Goonyella	34
284	Goonyella	27
285	Goonyella	27
286	Goonyella	23
287	Goonyella	21
288	Goonyella	21
289	Goonyella	21
290	Goonyella	21
291	Goonyella	21
292	Goonyella	31
293	Goonyella	31
294	Goonyella	31
295	Goonyella	31
296	Goonyella	31
297	Goonyella	31
298	Goonyella	31
299	Goonyella	31
300	Goonyella	31
301	Goonyella	30
302	Goonyella	29
303	Goonyella	29
304	Goonyella	29
305	Goonyella	29
306	Goonyella	27
307	Goonyella	29
308	Goonyella	28
398	Goonyella	44
399	Goonyella	44
400	Goonyella	44
738	Goonyella	27
739	Goonyella	27
740	Goonyella	27
741	Goonyella	27
742	Goonyella	27
743	Goonyella	27
744	Goonyella	27
745	Goonyella	27
746	Goonyella	27
747	Goonyella	27
748	Goonyella	38
749	Goonyella	38
750	Goonyella	38
751	Goonyella	38
752	Goonyella	38
753	Goonyella	38
754	Goonyella	38
755	Goonyella	38
756	Goonyella	38
757	Goonyella	38
758	Goonyella	38
759	Goonyella	38
760	Goonyella	22
761	Goonyella	22
762	Goonyella	22
763	Goonyella	22
764	Goonyella	22
765	Goonyella	22
766	Goonyella	22
767	Goonyella	22
768	Goonyella	22
769	Goonyella	22
770	Goonyella	22
771	Goonyella	38
772	Goonyella	38
773	Goonyella	38
774	Goonyella	30
775	Goonyella	30
776	Goonyella	26
777	Goonyella	26
778	Goonyella	26
779	Goonyella	26
780	Goonyella	26
781	Goonyella	26
782	Goonyella	10
783	Goonyella	10
784	Goonyella	10
785	Goonyella	10
786	Goonyella	5
787	Goonyella	5
788	Goonyella	10
789	Goonyella	10
790	Goonyella	10
791	Goonyella	15
792	Goonyella	15
793	Goonyella	15
794	Goonyella	15
795	Goonyella	15
796	Goonyella	15
797	Goonyella	15
798	Goonyella	15
799	Goonyella	15
800	Goonyella	15
805	Goonyella	14
806	Goonyella	14
807	Goonyella	14
808	Goonyella	14
809	Goonyella	14
810	Goonyella	14
811	Goonyella	14
812	Goonyella	14
813	Goonyella	14
814	Goonyella	14
815	Goonyella	14
816	Goonyella	14
817	Goonyella	14
818	Goonyella	16
819	Goonyella	16
820	Goonyella	16
821	Goonyella	16
822	Goonyella	16
823	Goonyella	16
824	Goonyella	16
825	Goonyella	16
826	Goonyella	16
827	Goonyella	32
828	Goonyella	32
829	Goonyella	32
830	Goonyella	32
831	Goonyella	32
832	Goonyella	32
833	Goonyella	32
834	Goonyella	32
835	Goonyella	6
836	Goonyella	6
837	Goonyella	6
838	Goonyella	6
839	Goonyella	6
840	Goonyella	6
841	Goonyella	6
842	Goonyella	6
843	Goonyella	6
844	Goonyella	6
845	Goonyella	6
846	Goonyella	6
847	Goonyella	6
848	Goonyella	6
849	Goonyella	6
850	Goonyella	11
851	Goonyella	11
852	Goonyella	11
853	Goonyella	11
854	Goonyella	15
855	Goonyella	15
856	Goonyella	15
857	Goonyella	16
858	Goonyella	16
859	Goonyella	16
860	Goonyella	16
861	Goonyella	16
862	Goonyella	16
863	Goonyella	16
864	Goonyella	16
865	Goonyella	16
882	Goonyella	6
883	Goonyella	6
884	Goonyella	6
885	Goonyella	6
886	Goonyella	32
887	Goonyella	33
888	Goonyella	17
889	Goonyella	17
890	Goonyella	17
894	Goonyella	34
895	Goonyella	34
896	Goonyella	34
897	Goonyella	34
898	Goonyella	34
899	Goonyella	34
900	Goonyella	34
901	Goonyella	34
902	Goonyella	34
903	Goonyella	40
904	Goonyella	40
905	Goonyella	34
906	Goonyella	34
907	Goonyella	34
908	Goonyella	34
909	Goonyella	34
910	Goonyella	34
911	Goonyella	34
912	Goonyella	34
913	Goonyella	34
914	Goonyella	34
915	Goonyella	34
916	Goonyella	33
917	Goonyella	33
918	Goonyella	33
919	Goonyella	33
920	Goonyella	33
921	Goonyella	33
922	Goonyella	33
923	Goonyella	32
927	Goonyella	32
928	Goonyella	32
929	Goonyella	32
930	Goonyella	32
931	Goonyella	32
932	Goonyella	32
933	Goonyella	32
934	Goonyella	32
935	Goonyella	28
936	Goonyella	28
937	Goonyella	28
938	Goonyella	32
939	Goonyella	30
940	Goonyella	30
941	Goonyella	30
971	Goonyella	34
972	Goonyella	32
973	Goonyella	32
974	Goonyella	32
975	Goonyella	32
976	Goonyella	38
977	Goonyella	38
978	Goonyella	38
979	Goonyella	38
980	Goonyella	32
981	Goonyella	32
982	Goonyella	32
983	Goonyella	34
984	Goonyella	34
992	Goonyella	32
993	Goonyella	32
994	Goonyella	32
995	Goonyella	32
996	Goonyella	32
15	Caval Ridge	39
16	Caval Ridge	39
17	Caval Ridge	39
18	Caval Ridge	39
19	Caval Ridge	39
20	Caval Ridge	39
21	Caval Ridge	36
22	Caval Ridge	36
23	Caval Ridge	36
24	Caval Ridge	36
25	Caval Ridge	36
26	Caval Ridge	34
27	Caval Ridge	34
28	Caval Ridge	34
29	Caval Ridge	34
30	Caval Ridge	36
31	Caval Ridge	36
32	Caval Ridge	37
33	Caval Ridge	37
34	Caval Ridge	37
35	Caval Ridge	37
36	Caval Ridge	37
37	Caval Ridge	37
38	Caval Ridge	39
39	Caval Ridge	39
40	Caval Ridge	39
41	Caval Ridge	40
42	Caval Ridge	40
43	Caval Ridge	40
44	Caval Ridge	45
45	Caval Ridge	45
46	Caval Ridge	45
47	Caval Ridge	30
48	Caval Ridge	30
49	Caval Ridge	30
50	Caval Ridge	30
51	Caval Ridge	30
52	Caval Ridge	20
53	Caval Ridge	20
54	Caval Ridge	20
55	Caval Ridge	20
56	Caval Ridge	35
57	Caval Ridge	35
58	Caval Ridge	35
59	Caval Ridge	35
60	Caval Ridge	35
61	Caval Ridge	40
62	Caval Ridge	40
63	Caval Ridge	40
64	Caval Ridge	40
65	Caval Ridge	40
66	Caval Ridge	40
67	Caval Ridge	40
68	Caval Ridge	40
69	Caval Ridge	40
70	Caval Ridge	40
104	Caval Ridge	59
106	Caval Ridge	24
107	Caval Ridge	24
108	Caval Ridge	24
109	Caval Ridge	24
114	Caval Ridge	32
115	Caval Ridge	32
116	Caval Ridge	32
117	Caval Ridge	32
118	Caval Ridge	32
119	Caval Ridge	32
159	Caval Ridge	30
160	Caval Ridge	30
161	Caval Ridge	30
162	Caval Ridge	58
163	Caval Ridge	58
164	Caval Ridge	58
165	Caval Ridge	55
166	Caval Ridge	55
167	Caval Ridge	55
168	Caval Ridge	55
169	Caval Ridge	55
170	Caval Ridge	51
171	Caval Ridge	51
172	Caval Ridge	51
173	Caval Ridge	51
174	Caval Ridge	50
175	Caval Ridge	50
176	Caval Ridge	50
177	Caval Ridge	50
178	Caval Ridge	50
179	Caval Ridge	46
180	Caval Ridge	46
201	Caval Ridge	20
202	Caval Ridge	20
203	Caval Ridge	20
204	Caval Ridge	20
205	Caval Ridge	20
206	Caval Ridge	20
207	Caval Ridge	20
208	Caval Ridge	18
209	Caval Ridge	18
210	Caval Ridge	18
211	Caval Ridge	17
212	Caval Ridge	17
213	Caval Ridge	17
214	Caval Ridge	16
215	Caval Ridge	16
216	Caval Ridge	16
217	Caval Ridge	16
218	Caval Ridge	16
219	Caval Ridge	16
220	Caval Ridge	17
221	Caval Ridge	17
222	Caval Ridge	34
223	Caval Ridge	34
224	Caval Ridge	34
225	Caval Ridge	34
226	Caval Ridge	34
227	Caval Ridge	34
228	Caval Ridge	40
229	Caval Ridge	40
230	Caval Ridge	40
231	Caval Ridge	38
232	Caval Ridge	38
233	Caval Ridge	38
234	Caval Ridge	38
235	Caval Ridge	38
236	Caval Ridge	36
237	Caval Ridge	36
238	Caval Ridge	36
239	Caval Ridge	36
240	Caval Ridge	36
241	Caval Ridge	36
242	Caval Ridge	36
243	Caval Ridge	36
244	Caval Ridge	38
245	Caval Ridge	38
246	Caval Ridge	38
247	Caval Ridge	17
248	Caval Ridge	17
249	Caval Ridge	17
250	Caval Ridge	17
251	Caval Ridge	17
252	Caval Ridge	17
253	Caval Ridge	17
254	Caval Ridge	17
255	Caval Ridge	17
256	Caval Ridge	17
257	Caval Ridge	17
258	Caval Ridge	17
259	Caval Ridge	17
260	Caval Ridge	17
261	Caval Ridge	16
262	Caval Ridge	16
263	Caval Ridge	16
264	Caval Ridge	15
265	Caval Ridge	15
266	Caval Ridge	15
390	Caval Ridge	43
391	Caval Ridge	43
392	Caval Ridge	43
401	Caval Ridge	42
402	Caval Ridge	42
403	Caval Ridge	42
404	Caval Ridge	42
405	Caval Ridge	42
406	Caval Ridge	41
407	Caval Ridge	41
408	Caval Ridge	41
409	Caval Ridge	40
410	Caval Ridge	40
411	Caval Ridge	40
412	Caval Ridge	40
413	Caval Ridge	40
414	Caval Ridge	40
415	Caval Ridge	40
416	Caval Ridge	40
417	Caval Ridge	40
418	Caval Ridge	40
419	Caval Ridge	40
420	Caval Ridge	45
421	Caval Ridge	51
422	Caval Ridge	49
439	Caval Ridge	44
440	Caval Ridge	44
441	Caval Ridge	44
442	Caval Ridge	44
443	Caval Ridge	46
444	Caval Ridge	46
445	Caval Ridge	46
446	Caval Ridge	46
447	Caval Ridge	46
448	Caval Ridge	46
449	Caval Ridge	46
450	Caval Ridge	35
451	Caval Ridge	35
452	Caval Ridge	35
453	Caval Ridge	35
454	Caval Ridge	37
455	Caval Ridge	37
456	Caval Ridge	37
457	Caval Ridge	37
458	Caval Ridge	42
459	Caval Ridge	42
460	Caval Ridge	42
461	Caval Ridge	42
462	Caval Ridge	42
463	Caval Ridge	45
464	Caval Ridge	45
465	Caval Ridge	45
466	Caval Ridge	42
467	Caval Ridge	42
468	Caval Ridge	42
469	Caval Ridge	40
470	Caval Ridge	40
471	Caval Ridge	40
472	Caval Ridge	40
473	Caval Ridge	40
474	Caval Ridge	38
475	Caval Ridge	38
476	Caval Ridge	38
477	Caval Ridge	38
478	Caval Ridge	40
479	Caval Ridge	40
480	Caval Ridge	38
481	Caval Ridge	38
482	Caval Ridge	38
483	Caval Ridge	38
484	Caval Ridge	36
485	Caval Ridge	36
486	Caval Ridge	36
487	Caval Ridge	34
488	Caval Ridge	34
489	Caval Ridge	34
490	Caval Ridge	34
491	Caval Ridge	34
492	Caval Ridge	35
493	Caval Ridge	35
494	Caval Ridge	35
495	Caval Ridge	35
496	Caval Ridge	35
497	Caval Ridge	35
498	Caval Ridge	37
499	Caval Ridge	37
507	Caval Ridge	31
508	Caval Ridge	31
509	Caval Ridge	31
510	Caval Ridge	31
511	Caval Ridge	31
512	Caval Ridge	31
513	Caval Ridge	31
514	Caval Ridge	31
515	Caval Ridge	31
516	Caval Ridge	33
517	Caval Ridge	33
518	Caval Ridge	33
519	Caval Ridge	33
520	Caval Ridge	33
521	Caval Ridge	33
522	Caval Ridge	33
542	Caval Ridge	32
543	Caval Ridge	32
544	Caval Ridge	32
547	Caval Ridge	35
548	Caval Ridge	35
549	Caval Ridge	35
550	Caval Ridge	35
551	Caval Ridge	35
552	Caval Ridge	35
553	Caval Ridge	33
554	Caval Ridge	33
555	Caval Ridge	33
590	Caval Ridge	45
591	Caval Ridge	45
592	Caval Ridge	45
593	Caval Ridge	34
594	Caval Ridge	32
595	Caval Ridge	30
596	Caval Ridge	30
597	Caval Ridge	30
598	Caval Ridge	29
599	Caval Ridge	29
600	Caval Ridge	29
601	Caval Ridge	29
602	Caval Ridge	29
603	Caval Ridge	29
604	Caval Ridge	29
605	Caval Ridge	29
606	Caval Ridge	29
607	Caval Ridge	29
608	Caval Ridge	29
609	Caval Ridge	25
610	Caval Ridge	25
611	Caval Ridge	25
612	Caval Ridge	25
665	Caval Ridge	33
666	Caval Ridge	33
667	Caval Ridge	33
668	Caval Ridge	28
669	Caval Ridge	26
670	Caval Ridge	26
671	Caval Ridge	26
672	Caval Ridge	24
673	Caval Ridge	24
674	Caval Ridge	24
675	Caval Ridge	24
676	Caval Ridge	27
677	Caval Ridge	27
678	Caval Ridge	36
679	Caval Ridge	36
680	Caval Ridge	36
681	Caval Ridge	32
682	Caval Ridge	34
683	Caval Ridge	34
684	Caval Ridge	32
685	Caval Ridge	32
686	Caval Ridge	34
687	Caval Ridge	34
688	Caval Ridge	34
689	Caval Ridge	34
690	Caval Ridge	34
691	Caval Ridge	34
692	Caval Ridge	34
693	Caval Ridge	34
694	Caval Ridge	34
695	Caval Ridge	34
696	Caval Ridge	32
697	Caval Ridge	32
698	Caval Ridge	32
699	Caval Ridge	35
700	Caval Ridge	38
701	Caval Ridge	38
702	Caval Ridge	38
703	Caval Ridge	38
704	Caval Ridge	32
705	Caval Ridge	32
706	Caval Ridge	32
707	Caval Ridge	32
708	Caval Ridge	32
709	Caval Ridge	32
710	Caval Ridge	32
711	Caval Ridge	32
712	Caval Ridge	34
713	Caval Ridge	34
714	Caval Ridge	34
715	Caval Ridge	35
716	Caval Ridge	35
717	Caval Ridge	35
718	Caval Ridge	35
719	Caval Ridge	35
720	Caval Ridge	35
721	Caval Ridge	35
722	Caval Ridge	35
723	Caval Ridge	35
724	Caval Ridge	35
725	Caval Ridge	35
726	Caval Ridge	35
727	Caval Ridge	35
728	Caval Ridge	54
729	Caval Ridge	50
730	Caval Ridge	50
731	Caval Ridge	50
732	Caval Ridge	40
733	Caval Ridge	40
738	Caval Ridge	15
739	Caval Ridge	15
740	Caval Ridge	15
741	Caval Ridge	15
742	Caval Ridge	15
743	Caval Ridge	15
744	Caval Ridge	13
745	Caval Ridge	13
746	Caval Ridge	13
747	Caval Ridge	13
760	Caval Ridge	15
761	Caval Ridge	15
762	Caval Ridge	15
763	Caval Ridge	15
764	Caval Ridge	15
765	Caval Ridge	15
766	Caval Ridge	15
767	Caval Ridge	15
768	Caval Ridge	15
769	Caval Ridge	15
770	Caval Ridge	15
782	Caval Ridge	28
783	Caval Ridge	28
784	Caval Ridge	28
785	Caval Ridge	28
786	Caval Ridge	45
787	Caval Ridge	45
788	Caval Ridge	45
789	Caval Ridge	45
790	Caval Ridge	35
791	Caval Ridge	20
792	Caval Ridge	20
793	Caval Ridge	20
794	Caval Ridge	20
795	Caval Ridge	20
796	Caval Ridge	20
797	Caval Ridge	20
798	Caval Ridge	20
799	Caval Ridge	20
800	Caval Ridge	20
801	Caval Ridge	29
802	Caval Ridge	29
803	Caval Ridge	29
804	Caval Ridge	29
805	Caval Ridge	13
806	Caval Ridge	13
807	Caval Ridge	13
808	Caval Ridge	13
809	Caval Ridge	13
810	Caval Ridge	13
811	Caval Ridge	13
812	Caval Ridge	13
813	Caval Ridge	13
814	Caval Ridge	13
815	Caval Ridge	13
816	Caval Ridge	13
817	Caval Ridge	13
818	Caval Ridge	16
819	Caval Ridge	16
820	Caval Ridge	16
821	Caval Ridge	16
822	Caval Ridge	16
823	Caval Ridge	16
824	Caval Ridge	16
825	Caval Ridge	16
826	Caval Ridge	16
71	PDN	40
72	PDN	40
73	PDN	40
74	PDN	40
75	PDN	40
76	PDN	50
77	PDN	50
78	PDN	50
79	PDN	50
80	PDN	42
81	PDN	42
82	PDN	42
83	PDN	42
84	PDN	42
85	PDN	39
86	PDN	39
87	PDN	39
88	PDN	39
89	PDN	39
90	PDN	41
91	PDN	41
92	PDN	41
93	PDN	41
94	PDN	41
95	PDN	41
96	PDN	41
97	PDN	50
98	PDN	50
99	PDN	50
100	PDN	50
101	PDN	44
102	PDN	44
103	PDN	44
105	PDN	44
106	PDN	20
107	PDN	20
108	PDN	20
109	PDN	20
120	PDN	38
121	PDN	38
122	PDN	38
123	PDN	38
159	PDN	18
160	PDN	18
161	PDN	18
1	Poitrel	32
2	Poitrel	32
3	Poitrel	38
4	Poitrel	38
5	Poitrel	38
6	Poitrel	32
7	Poitrel	32
8	Poitrel	32
9	Poitrel	29
10	Poitrel	29
11	Poitrel	29
12	Poitrel	29
13	Poitrel	29
14	Poitrel	29
15	Poitrel	13
16	Poitrel	13
17	Poitrel	13
18	Poitrel	13
19	Poitrel	13
20	Poitrel	13
21	Poitrel	13
22	Poitrel	13
23	Poitrel	13
24	Poitrel	13
25	Poitrel	13
26	Poitrel	41
27	Poitrel	41
28	Poitrel	41
29	Poitrel	41
30	Poitrel	41
31	Poitrel	41
32	Poitrel	41
33	Poitrel	41
34	Poitrel	41
35	Poitrel	41
36	Poitrel	41
37	Poitrel	41
38	Poitrel	39
39	Poitrel	39
40	Poitrel	39
41	Poitrel	37
42	Poitrel	37
43	Poitrel	37
44	Poitrel	22
45	Poitrel	22
46	Poitrel	22
47	Poitrel	12
48	Poitrel	12
49	Poitrel	12
50	Poitrel	14
51	Poitrel	14
52	Poitrel	25
53	Poitrel	25
54	Poitrel	25
55	Poitrel	25
56	Poitrel	25
57	Poitrel	25
58	Poitrel	25
59	Poitrel	25
60	Poitrel	25
61	Poitrel	25
62	Poitrel	25
63	Poitrel	25
64	Poitrel	25
65	Poitrel	25
66	Poitrel	25
67	Poitrel	25
68	Poitrel	25
69	Poitrel	25
70	Poitrel	25
85	Poitrel	10
86	Poitrel	10
87	Poitrel	10
88	Poitrel	10
89	Poitrel	10
90	Poitrel	10
91	Poitrel	10
92	Poitrel	10
93	Poitrel	10
94	Poitrel	10
95	Poitrel	10
96	Poitrel	10
235	Poitrel	20
236	Poitrel	20
237	Poitrel	20
238	Poitrel	20
239	Poitrel	20
240	Poitrel	20
241	Poitrel	20
242	Poitrel	20
243	Poitrel	20
244	Poitrel	20
245	Poitrel	20
246	Poitrel	20
247	Poitrel	18
248	Poitrel	18
249	Poitrel	18
250	Poitrel	16
251	Poitrel	16
252	Poitrel	9
253	Poitrel	9
254	Poitrel	9
255	Poitrel	9
256	Poitrel	9
712	Poitrel	8
713	Poitrel	8
738	Poitrel	10
739	Poitrel	10
740	Poitrel	10
741	Poitrel	10
742	Poitrel	10
743	Poitrel	10
738	Amonate	12
739	Amonate	12
740	Amonate	12
741	Amonate	12
742	Amonate	12
743	Amonate	12
755	Amonate	8
756	Amonate	8
757	Amonate	8
758	Amonate	8
759	Amonate	8
760	Amonate	8
761	Amonate	8
762	Amonate	8
763	Amonate	8
764	Amonate	8
765	Amonate	8
766	Amonate	8
767	Amonate	8
768	Amonate	8
769	Amonate	8
770	Amonate	8
771	Amonate	8
772	Amonate	8
773	Amonate	8
774	Amonate	8
775	Amonate	8
1	Aus.SHCC	6
2	Aus.SHCC	6
3	Aus.SHCC	6
4	Aus.SHCC	6
5	Aus.SHCC	6
6	Aus.SHCC	6
7	Aus.SHCC	6
8	Aus.SHCC	6
9	Aus.SHCC	9
10	Aus.SHCC	9
11	Aus.SHCC	9
12	Aus.SHCC	9
13	Aus.SHCC	9
14	Aus.SHCC	9
47	Aus.SHCC	15
48	Aus.SHCC	15
49	Aus.SHCC	15
50	Aus.SHCC	13
51	Aus.SHCC	13
52	Aus.SHCC	14
53	Aus.SHCC	14
54	Aus.SHCC	14
55	Aus.SHCC	14
56	Aus.SHCC	12
57	Aus.SHCC	12
58	Aus.SHCC	12
59	Aus.SHCC	12
60	Aus.SHCC	12
61	Aus.SHCC	4
62	Aus.SHCC	4
63	Aus.SHCC	4
64	Aus.SHCC	4
65	Aus.SHCC	4
66	Aus.SHCC	4
67	Aus.SHCC	4
68	Aus.SHCC	4
69	Aus.SHCC	4
70	Aus.SHCC	6
71	Aus.SHCC	22
72	Aus.SHCC	22
73	Aus.SHCC	22
74	Aus.SHCC	22
75	Aus.SHCC	22
76	Aus.SHCC	22
77	Aus.SHCC	22
78	Aus.SHCC	22
79	Aus.SHCC	22
80	Aus.SHCC	22
81	Aus.SHCC	22
82	Aus.SHCC	22
83	Aus.SHCC	22
84	Aus.SHCC	22
85	Aus.SHCC	25
86	Aus.SHCC	25
87	Aus.SHCC	25
88	Aus.SHCC	25
89	Aus.SHCC	25
90	Aus.SHCC	23
91	Aus.SHCC	23
92	Aus.SHCC	23
93	Aus.SHCC	23
94	Aus.SHCC	23
95	Aus.SHCC	23
96	Aus.SHCC	23
97	Aus.SHCC	26
98	Aus.SHCC	26
99	Aus.SHCC	26
100	Aus.SHCC	26
101	Aus.SHCC	20
102	Aus.SHCC	20
103	Aus.SHCC	27
104	Aus.SHCC	27
105	Aus.SHCC	27
106	Aus.SHCC	21
107	Aus.SHCC	21
108	Aus.SHCC	21
109	Aus.SHCC	21
120	Aus.SHCC	32
121	Aus.SHCC	32
122	Aus.SHCC	32
123	Aus.SHCC	32
124	Aus.SHCC	22
125	Aus.SHCC	22
126	Aus.SHCC	22
127	Aus.SHCC	22
128	Aus.SHCC	10
129	Aus.SHCC	10
130	Aus.SHCC	10
131	Aus.SHCC	10
132	Aus.SHCC	7
133	Aus.SHCC	7
134	Aus.SHCC	7
135	Aus.SHCC	7
136	Aus.SHCC	7
137	Aus.SHCC	7
146	Aus.SHCC	10
147	Aus.SHCC	10
148	Aus.SHCC	10
149	Aus.SHCC	10
153	Aus.SHCC	10
154	Aus.SHCC	10
155	Aus.SHCC	10
156	Aus.SHCC	10
157	Aus.SHCC	10
158	Aus.SHCC	10
159	Aus.SHCC	15
160	Aus.SHCC	15
161	Aus.SHCC	15
162	Aus.SHCC	27
163	Aus.SHCC	27
164	Aus.SHCC	27
165	Aus.SHCC	27
166	Aus.SHCC	27
167	Aus.SHCC	22
168	Aus.SHCC	22
169	Aus.SHCC	22
170	Aus.SHCC	22
171	Aus.SHCC	22
172	Aus.SHCC	22
173	Aus.SHCC	22
174	Aus.SHCC	15
175	Aus.SHCC	15
176	Aus.SHCC	15
177	Aus.SHCC	15
178	Aus.SHCC	15
179	Aus.SHCC	10
180	Aus.SHCC	10
181	Aus.SHCC	5
182	Aus.SHCC	5
183	Aus.SHCC	5
184	Aus.SHCC	5
185	Aus.SHCC	5
186	Aus.SHCC	5
235	Aus.SHCC	10
236	Aus.SHCC	10
237	Aus.SHCC	10
238	Aus.SHCC	10
239	Aus.SHCC	10
240	Aus.SHCC	10
241	Aus.SHCC	10
242	Aus.SHCC	10
243	Aus.SHCC	10
244	Aus.SHCC	10
245	Aus.SHCC	10
246	Aus.SHCC	10
247	Aus.SHCC	10
248	Aus.SHCC	10
249	Aus.SHCC	10
250	Aus.SHCC	10
251	Aus.SHCC	10
292	Aus.SHCC	10
293	Aus.SHCC	10
294	Aus.SHCC	10
744	Teck Venture	12
745	Teck Venture	12
746	Teck Venture	12
747	Teck Venture	12
748	Teck Venture	12
749	Teck Venture	12
750	Teck Venture	12
751	Teck Venture	12
752	Teck Venture	12
753	Teck Venture	12
754	Teck Venture	12
755	Teck Venture	14
756	Teck Venture	14
757	Teck Venture	14
758	Teck Venture	14
759	Teck Venture	14
760	Teck Venture	18
761	Teck Venture	18
762	Teck Venture	18
763	Teck Venture	14
764	Teck Venture	14
765	Teck Venture	14
766	Teck Venture	14
767	Teck Venture	14
768	Teck Venture	14
769	Teck Venture	14
770	Teck Venture	14
771	Teck Venture	15
772	Teck Venture	15
773	Teck Venture	15
774	Teck Venture	16
775	Teck Venture	16
776	Teck Venture	16
777	Teck Venture	16
778	Teck Venture	16
779	Teck Venture	16
780	Teck Venture	16
781	Teck Venture	16
782	Teck Venture	8
783	Teck Venture	8
784	Teck Venture	8
785	Teck Venture	8
786	Teck Venture	12
787	Teck Venture	12
788	Teck Venture	10
789	Teck Venture	10
110	Lake Vermont	41
111	Lake Vermont	41
112	Lake Vermont	41
113	Lake Vermont	41
114	Lake Vermont	38
115	Lake Vermont	38
116	Lake Vermont	38
117	Lake Vermont	38
118	Lake Vermont	38
119	Lake Vermont	38
128	Lake Vermont	5
129	Lake Vermont	5
130	Lake Vermont	5
131	Lake Vermont	5
132	Lake Vermont	8
133	Lake Vermont	8
134	Lake Vermont	8
135	Lake Vermont	8
136	Lake Vermont	8
137	Lake Vermont	8
138	Lake Vermont	5
201	Lake Vermont	5
202	Lake Vermont	5
203	Lake Vermont	5
284	Lake Vermont	1
285	Lake Vermont	1
286	Lake Vermont	1
287	Lake Vermont	1
288	Lake Vermont	1
289	Lake Vermont	1
290	Lake Vermont	1
291	Lake Vermont	1
292	Lake Vermont	1
293	Lake Vermont	1
294	Lake Vermont	1
295	Lake Vermont	2
296	Lake Vermont	2
297	Lake Vermont	2
298	Lake Vermont	2
299	Lake Vermont	2
300	Lake Vermont	2
301	Lake Vermont	2
302	Lake Vermont	2
303	Lake Vermont	2
450	Lake Vermont	29
451	Lake Vermont	33
452	Lake Vermont	33
453	Lake Vermont	33
454	Lake Vermont	26
455	Lake Vermont	26
456	Lake Vermont	26
457	Lake Vermont	19
458	Lake Vermont	19
459	Lake Vermont	19
460	Lake Vermont	19
461	Lake Vermont	19
462	Lake Vermont	19
463	Lake Vermont	21
464	Lake Vermont	21
465	Lake Vermont	21
466	Lake Vermont	19
467	Lake Vermont	19
468	Lake Vermont	19
469	Lake Vermont	19
470	Lake Vermont	19
471	Lake Vermont	19
472	Lake Vermont	19
473	Lake Vermont	19
474	Lake Vermont	21
475	Lake Vermont	21
476	Lake Vermont	21
477	Lake Vermont	21
478	Lake Vermont	6
479	Lake Vermont	6
480	Lake Vermont	6
481	Lake Vermont	6
482	Lake Vermont	6
483	Lake Vermont	6
484	Lake Vermont	7
485	Lake Vermont	7
486	Lake Vermont	7
487	Lake Vermont	9
488	Lake Vermont	9
489	Lake Vermont	9
490	Lake Vermont	9
491	Lake Vermont	9
492	Lake Vermont	7
493	Lake Vermont	7
494	Lake Vermont	7
495	Lake Vermont	7
496	Lake Vermont	7
497	Lake Vermont	7
498	Lake Vermont	20
499	Lake Vermont	20
507	Lake Vermont	18
508	Lake Vermont	18
509	Lake Vermont	18
510	Lake Vermont	18
511	Lake Vermont	18
512	Lake Vermont	18
513	Lake Vermont	18
514	Lake Vermont	18
515	Lake Vermont	18
516	Lake Vermont	18
517	Lake Vermont	18
518	Lake Vermont	18
519	Lake Vermont	18
520	Lake Vermont	18
521	Lake Vermont	18
522	Lake Vermont	18
542	Lake Vermont	24
543	Lake Vermont	24
544	Lake Vermont	24
547	Lake Vermont	24
548	Lake Vermont	24
549	Lake Vermont	24
550	Lake Vermont	24
551	Lake Vermont	24
552	Lake Vermont	24
553	Lake Vermont	25
554	Lake Vermont	25
555	Lake Vermont	25
590	Lake Vermont	41
591	Lake Vermont	41
592	Lake Vermont	41
593	Lake Vermont	28
594	Lake Vermont	30
595	Lake Vermont	31
596	Lake Vermont	31
597	Lake Vermont	31
598	Lake Vermont	32
599	Lake Vermont	30
600	Lake Vermont	30
601	Lake Vermont	30
602	Lake Vermont	30
603	Lake Vermont	30
604	Lake Vermont	30
605	Lake Vermont	30
606	Lake Vermont	30
607	Lake Vermont	30
608	Lake Vermont	30
609	Lake Vermont	32
610	Lake Vermont	32
611	Lake Vermont	32
612	Lake Vermont	32
665	Lake Vermont	32
666	Lake Vermont	32
667	Lake Vermont	32
668	Lake Vermont	29
669	Lake Vermont	27
670	Lake Vermont	27
671	Lake Vermont	27
672	Lake Vermont	23
673	Lake Vermont	23
674	Lake Vermont	23
675	Lake Vermont	23
676	Lake Vermont	20
677	Lake Vermont	20
678	Lake Vermont	13
679	Lake Vermont	13
680	Lake Vermont	13
681	Lake Vermont	30
682	Lake Vermont	29
683	Lake Vermont	29
684	Lake Vermont	32
685	Lake Vermont	32
686	Lake Vermont	31
687	Lake Vermont	31
688	Lake Vermont	31
689	Lake Vermont	31
690	Lake Vermont	44
691	Lake Vermont	44
692	Lake Vermont	46
693	Lake Vermont	46
694	Lake Vermont	41
695	Lake Vermont	41
696	Lake Vermont	48
697	Lake Vermont	48
698	Lake Vermont	48
699	Lake Vermont	43
700	Lake Vermont	38
701	Lake Vermont	38
702	Lake Vermont	38
703	Lake Vermont	38
704	Lake Vermont	30
705	Lake Vermont	30
706	Lake Vermont	22
707	Lake Vermont	22
708	Lake Vermont	22
709	Lake Vermont	22
710	Lake Vermont	22
711	Lake Vermont	22
712	Lake Vermont	10
713	Lake Vermont	10
714	Lake Vermont	16
715	Lake Vermont	16
716	Lake Vermont	16
717	Lake Vermont	16
718	Lake Vermont	16
719	Lake Vermont	20
720	Lake Vermont	20
721	Lake Vermont	20
722	Lake Vermont	20
723	Lake Vermont	18
724	Lake Vermont	18
725	Lake Vermont	18
726	Lake Vermont	10
727	Lake Vermont	5
732	Lake Vermont	10
733	Lake Vermont	10
791	Lake Vermont	10
792	Lake Vermont	10
793	Lake Vermont	10
794	Lake Vermont	10
795	Lake Vermont	18
796	Lake Vermont	18
797	Lake Vermont	18
798	Lake Vermont	25
799	Lake Vermont	25
800	Lake Vermont	25
801	Lake Vermont	30
802	Lake Vermont	30
803	Lake Vermont	30
804	Lake Vermont	30
805	Lake Vermont	32
806	Lake Vermont	32
807	Lake Vermont	32
808	Lake Vermont	32
809	Lake Vermont	32
810	Lake Vermont	32
811	Lake Vermont	32
812	Lake Vermont	32
813	Lake Vermont	32
814	Lake Vermont	32
815	Lake Vermont	32
816	Lake Vermont	32
817	Lake Vermont	32
818	Lake Vermont	31
819	Lake Vermont	31
820	Lake Vermont	32
821	Lake Vermont	32
822	Lake Vermont	32
823	Lake Vermont	32
824	Lake Vermont	32
825	Lake Vermont	32
826	Lake Vermont	32
827	Lake Vermont	22
828	Lake Vermont	22
829	Lake Vermont	22
830	Lake Vermont	22
831	Lake Vermont	22
832	Lake Vermont	22
833	Lake Vermont	22
834	Lake Vermont	22
835	Lake Vermont	27
836	Lake Vermont	27
837	Lake Vermont	27
838	Lake Vermont	27
839	Lake Vermont	27
840	Lake Vermont	27
841	Lake Vermont	30
842	Lake Vermont	30
843	Lake Vermont	30
844	Lake Vermont	30
845	Lake Vermont	27
846	Lake Vermont	27
847	Lake Vermont	27
848	Lake Vermont	27
849	Lake Vermont	27
850	Lake Vermont	32
851	Lake Vermont	32
852	Lake Vermont	29
853	Lake Vermont	29
854	Lake Vermont	28
855	Lake Vermont	28
856	Lake Vermont	26
857	Lake Vermont	26
858	Lake Vermont	26
859	Lake Vermont	26
860	Lake Vermont	26
861	Lake Vermont	26
862	Lake Vermont	26
863	Lake Vermont	26
864	Lake Vermont	26
865	Lake Vermont	26
866	Lake Vermont	21
867	Lake Vermont	16
868	Lake Vermont	16
869	Lake Vermont	16
870	Lake Vermont	16
871	Lake Vermont	16
872	Lake Vermont	16
882	Lake Vermont	24
883	Lake Vermont	24
884	Lake Vermont	24
885	Lake Vermont	24
886	Lake Vermont	24
887	Lake Vermont	24
888	Lake Vermont	24
889	Lake Vermont	24
890	Lake Vermont	24
894	Lake Vermont	26
895	Lake Vermont	26
896	Lake Vermont	26
897	Lake Vermont	31
898	Lake Vermont	31
899	Lake Vermont	35
900	Lake Vermont	35
901	Lake Vermont	33
902	Lake Vermont	33
903	Lake Vermont	14
904	Lake Vermont	14
905	Lake Vermont	14
906	Lake Vermont	14
907	Lake Vermont	14
908	Lake Vermont	14
909	Lake Vermont	14
910	Lake Vermont	14
911	Lake Vermont	14
912	Lake Vermont	14
913	Lake Vermont	14
914	Lake Vermont	14
915	Lake Vermont	14
916	Lake Vermont	12
917	Lake Vermont	12
918	Lake Vermont	12
919	Lake Vermont	12
920	Lake Vermont	12
921	Lake Vermont	14
922	Lake Vermont	14
923	Lake Vermont	25
924	Lake Vermont	25
925	Lake Vermont	25
926	Lake Vermont	25
927	Lake Vermont	27
928	Lake Vermont	27
929	Lake Vermont	27
930	Lake Vermont	27
931	Lake Vermont	12
932	Lake Vermont	12
933	Lake Vermont	12
934	Lake Vermont	12
935	Lake Vermont	7
936	Lake Vermont	7
937	Lake Vermont	7
971	Lake Vermont	7
903	Metropolitan	8
904	Metropolitan	8
905	Metropolitan	8
906	Metropolitan	8
907	Metropolitan	8
908	Metropolitan	8
909	Metropolitan	8
910	Metropolitan	8
911	Metropolitan	8
912	Metropolitan	8
913	Metropolitan	8
914	Metropolitan	8
915	Metropolitan	8
916	Metropolitan	10
917	Metropolitan	10
918	Metropolitan	10
919	Metropolitan	10
920	Metropolitan	10
921	Metropolitan	10
922	Metropolitan	10
931	Metropolitan	15
932	Metropolitan	15
933	Metropolitan	15
934	Metropolitan	15
935	Metropolitan	20
936	Metropolitan	20
937	Metropolitan	20
938	Metropolitan	10
939	Metropolitan	12
940	Metropolitan	12
941	Metropolitan	12
971	Metropolitan	20
972	Metropolitan	14
973	Metropolitan	14
974	Metropolitan	14
977	Metropolitan	10
978	Metropolitan	10
979	Metropolitan	10
980	Metropolitan	5
981	Metropolitan	5
982	Metropolitan	5
983	Metropolitan	11
984	Metropolitan	11
990	Metropolitan	10
991	Metropolitan	10
996	Metropolitan	14
706	Indonasian	10
707	Indonasian	10
708	Indonasian	10
709	Indonasian	10
710	Indonasian	10
711	Indonasian	10
712	Indonasian	12
713	Indonasian	12
714	Indonasian	14
715	Indonasian	15
716	Indonasian	15
717	Indonasian	15
718	Indonasian	15
719	Indonasian	18
720	Indonasian	18
721	Indonasian	18
722	Indonasian	18
723	Indonasian	20
724	Indonasian	20
725	Indonasian	20
726	Indonasian	20
727	Indonasian	16
744	Indonasian	12
745	Indonasian	12
746	Indonasian	12
747	Indonasian	12
748	Indonasian	12
749	Indonasian	12
750	Indonasian	12
751	Indonasian	12
752	Indonasian	12
753	Indonasian	12
754	Indonasian	12
760	Indonasian	6
761	Indonasian	6
762	Indonasian	6
776	Indonasian	24
777	Indonasian	24
778	Indonasian	24
779	Indonasian	24
780	Indonasian	24
781	Indonasian	24
782	Indonasian	16
783	Indonasian	16
784	Indonasian	16
785	Indonasian	16
786	Indonasian	12
787	Indonasian	12
790	Indonasian	34
791	Indonasian	16
792	Indonasian	16
793	Indonasian	16
794	Indonasian	16
795	Indonasian	8
796	Indonasian	8
797	Indonasian	8
827	Indonasian	14
828	Indonasian	14
829	Indonasian	14
830	Indonasian	14
831	Indonasian	14
832	Indonasian	20
833	Indonasian	20
834	Indonasian	20
835	Indonasian	5
836	Indonasian	5
837	Indonasian	5
838	Indonasian	5
839	Indonasian	5
840	Indonasian	5
841	Indonasian	5
842	Indonasian	5
843	Indonasian	5
844	Indonasian	5
845	Indonasian	5
846	Indonasian	5
847	Indonasian	5
848	Indonasian	5
849	Indonasian	5
850	Indonasian	5
851	Indonasian	5
852	Indonasian	6
853	Indonasian	6
854	Indonasian	8
855	Indonasian	8
856	Indonasian	8
857	Indonasian	8
858	Indonasian	8
859	Indonasian	8
860	Indonasian	8
861	Indonasian	8
862	Indonasian	8
863	Indonasian	8
864	Indonasian	8
865	Indonasian	8
866	Indonasian	6
867	Indonasian	10
868	Indonasian	10
869	Indonasian	10
870	Indonasian	10
871	Indonasian	10
872	Indonasian	10
349	Low Ash SHCC/ SHCC-BHP	22
350	Low Ash SHCC/ SHCC-BHP	22
351	Low Ash SHCC/ SHCC-BHP	22
352	Low Ash SHCC/ SHCC-BHP	24
353	Low Ash SHCC/ SHCC-BHP	24
354	Low Ash SHCC/ SHCC-BHP	24
355	Low Ash SHCC/ SHCC-BHP	24
356	Low Ash SHCC/ SHCC-BHP	24
357	Low Ash SHCC/ SHCC-BHP	35
358	Low Ash SHCC/ SHCC-BHP	35
359	Low Ash SHCC/ SHCC-BHP	35
360	Low Ash SHCC/ SHCC-BHP	35
361	Low Ash SHCC/ SHCC-BHP	36
362	Low Ash SHCC/ SHCC-BHP	36
363	Low Ash SHCC/ SHCC-BHP	25
364	Low Ash SHCC/ SHCC-BHP	25
365	Low Ash SHCC/ SHCC-BHP	25
366	Low Ash SHCC/ SHCC-BHP	25
367	Low Ash SHCC/ SHCC-BHP	22
368	Low Ash SHCC/ SHCC-BHP	22
369	Low Ash SHCC/ SHCC-BHP	25
370	Low Ash SHCC/ SHCC-BHP	25
371	Low Ash SHCC/ SHCC-BHP	25
372	Low Ash SHCC/ SHCC-BHP	25
373	Low Ash SHCC/ SHCC-BHP	25
374	Low Ash SHCC/ SHCC-BHP	25
375	Low Ash SHCC/ SHCC-BHP	25
376	Low Ash SHCC/ SHCC-BHP	25
377	Low Ash SHCC/ SHCC-BHP	25
378	Low Ash SHCC/ SHCC-BHP	25
379	Low Ash SHCC/ SHCC-BHP	25
380	Low Ash SHCC/ SHCC-BHP	25
381	Low Ash SHCC/ SHCC-BHP	25
382	Low Ash SHCC/ SHCC-BHP	25
383	Low Ash SHCC/ SHCC-BHP	25
384	Low Ash SHCC/ SHCC-BHP	25
385	Low Ash SHCC/ SHCC-BHP	25
386	Low Ash SHCC/ SHCC-BHP	25
387	Low Ash SHCC/ SHCC-BHP	25
388	Low Ash SHCC/ SHCC-BHP	25
389	Low Ash SHCC/ SHCC-BHP	25
390	Low Ash SHCC/ SHCC-BHP	25
391	Low Ash SHCC/ SHCC-BHP	25
392	Low Ash SHCC/ SHCC-BHP	25
398	Low Ash SHCC/ SHCC-BHP	27
399	Low Ash SHCC/ SHCC-BHP	27
400	Low Ash SHCC/ SHCC-BHP	27
401	Low Ash SHCC/ SHCC-BHP	27
402	Low Ash SHCC/ SHCC-BHP	27
403	Low Ash SHCC/ SHCC-BHP	27
404	Low Ash SHCC/ SHCC-BHP	27
405	Low Ash SHCC/ SHCC-BHP	27
406	Low Ash SHCC/ SHCC-BHP	27
407	Low Ash SHCC/ SHCC-BHP	27
408	Low Ash SHCC/ SHCC-BHP	27
409	Low Ash SHCC/ SHCC-BHP	27
410	Low Ash SHCC/ SHCC-BHP	27
411	Low Ash SHCC/ SHCC-BHP	27
412	Low Ash SHCC/ SHCC-BHP	27
413	Low Ash SHCC/ SHCC-BHP	27
414	Low Ash SHCC/ SHCC-BHP	27
415	Low Ash SHCC/ SHCC-BHP	27
416	Low Ash SHCC/ SHCC-BHP	27
417	Low Ash SHCC/ SHCC-BHP	27
418	Low Ash SHCC/ SHCC-BHP	27
419	Low Ash SHCC/ SHCC-BHP	27
420	Low Ash SHCC/ SHCC-BHP	30
421	Low Ash SHCC/ SHCC-BHP	30
422	Low Ash SHCC/ SHCC-BHP	28
439	Low Ash SHCC/ SHCC-BHP	14
440	Low Ash SHCC/ SHCC-BHP	23
441	Low Ash SHCC/ SHCC-BHP	23
442	Low Ash SHCC/ SHCC-BHP	23
71	Eagle crrek	10
72	Eagle crrek	10
73	Eagle crrek	10
74	Eagle crrek	10
75	Eagle crrek	10
76	Eagle crrek	10
77	Eagle crrek	10
78	Eagle crrek	10
79	Eagle crrek	10
80	Eagle crrek	10
81	Eagle crrek	10
82	Eagle crrek	10
83	Eagle crrek	10
84	Eagle crrek	10
443	Eagle crrek	23
444	Eagle crrek	23
445	Eagle crrek	23
446	Eagle crrek	23
447	Eagle crrek	23
448	Eagle crrek	23
449	Eagle crrek	23
478	Eagle crrek	26
479	Eagle crrek	26
480	Eagle crrek	26
481	Eagle crrek	26
482	Eagle crrek	26
483	Eagle crrek	26
484	Eagle crrek	27
485	Eagle crrek	27
486	Eagle crrek	27
487	Eagle crrek	27
488	Eagle crrek	27
489	Eagle crrek	27
490	Eagle crrek	27
491	Eagle crrek	27
492	Eagle crrek	23
493	Eagle crrek	23
494	Eagle crrek	23
495	Eagle crrek	25
496	Eagle crrek	25
497	Eagle crrek	25
507	Eagle crrek	12
508	Eagle crrek	12
509	Eagle crrek	12
510	Eagle crrek	10
511	Eagle crrek	10
512	Eagle crrek	10
513	Eagle crrek	10
514	Eagle crrek	10
515	Eagle crrek	10
516	Eagle crrek	8
517	Eagle crrek	8
518	Eagle crrek	8
519	Eagle crrek	8
520	Eagle crrek	8
521	Eagle crrek	8
522	Eagle crrek	8
15	Dhamra SHCC PDN	30
16	Dhamra SHCC PDN	30
17	Dhamra SHCC PDN	30
18	Dhamra SHCC PDN	30
19	Dhamra SHCC PDN	30
20	Dhamra SHCC PDN	30
21	Dhamra SHCC PDN	30
22	Dhamra SHCC PDN	30
23	Dhamra SHCC PDN	30
24	Dhamra SHCC PDN	30
25	Dhamra SHCC PDN	30
138	Daunia (SHCC)	22
139	Daunia (SHCC)	20
140	Daunia (SHCC)	20
141	Daunia (SHCC)	20
142	Daunia (SHCC)	10
143	Daunia (SHCC)	10
144	Daunia (SHCC)	10
145	Daunia (SHCC)	10
150	Daunia (SHCC)	10
151	Daunia (SHCC)	10
152	Daunia (SHCC)	10
153	Daunia (SHCC)	5
154	Daunia (SHCC)	5
174	Daunia (SHCC)	5
175	Daunia (SHCC)	5
176	Daunia (SHCC)	5
177	Daunia (SHCC)	5
178	Daunia (SHCC)	5
179	Daunia (SHCC)	12
180	Daunia (SHCC)	12
181	Daunia (SHCC)	17
182	Daunia (SHCC)	17
183	Daunia (SHCC)	17
184	Daunia (SHCC)	17
185	Daunia (SHCC)	17
186	Daunia (SHCC)	17
187	Daunia (SHCC)	20
188	Daunia (SHCC)	20
189	Daunia (SHCC)	20
190	Daunia (SHCC)	20
191	Daunia (SHCC)	20
192	Daunia (SHCC)	20
193	Daunia (SHCC)	20
194	Daunia (SHCC)	20
195	Daunia (SHCC)	20
196	Daunia (SHCC)	20
197	Daunia (SHCC)	20
198	Daunia (SHCC)	20
199	Daunia (SHCC)	20
200	Daunia (SHCC)	20
201	Daunia (SHCC)	15
202	Daunia (SHCC)	15
203	Daunia (SHCC)	15
204	Daunia (SHCC)	20
205	Daunia (SHCC)	20
206	Daunia (SHCC)	20
207	Daunia (SHCC)	20
208	Daunia (SHCC)	20
209	Daunia (SHCC)	20
210	Daunia (SHCC)	20
211	Daunia (SHCC)	20
212	Daunia (SHCC)	20
213	Daunia (SHCC)	20
214	Daunia (SHCC)	20
215	Daunia (SHCC)	20
216	Daunia (SHCC)	20
217	Daunia (SHCC)	20
218	Daunia (SHCC)	20
219	Daunia (SHCC)	20
220	Daunia (SHCC)	20
221	Daunia (SHCC)	20
222	Daunia (SHCC)	20
223	Daunia (SHCC)	20
224	Daunia (SHCC)	20
225	Daunia (SHCC)	20
226	Daunia (SHCC)	20
227	Daunia (SHCC)	20
228	Daunia (SHCC)	34
229	Daunia (SHCC)	34
230	Daunia (SHCC)	34
231	Daunia (SHCC)	32
232	Daunia (SHCC)	32
233	Daunia (SHCC)	32
234	Daunia (SHCC)	32
252	Daunia (SHCC)	25
253	Daunia (SHCC)	25
254	Daunia (SHCC)	25
255	Daunia (SHCC)	25
256	Daunia (SHCC)	25
257	Daunia (SHCC)	34
258	Daunia (SHCC)	34
259	Daunia (SHCC)	34
260	Daunia (SHCC)	34
261	Daunia (SHCC)	34
262	Daunia (SHCC)	34
263	Daunia (SHCC)	34
264	Daunia (SHCC)	36
265	Daunia (SHCC)	36
266	Daunia (SHCC)	36
267	Daunia (SHCC)	35
268	Daunia (SHCC)	35
269	Daunia (SHCC)	35
270	Daunia (SHCC)	35
271	Daunia (SHCC)	35
272	Daunia (SHCC)	35
273	Daunia (SHCC)	35
274	Daunia (SHCC)	37
275	Daunia (SHCC)	37
276	Daunia (SHCC)	37
277	Daunia (SHCC)	37
278	Daunia (SHCC)	37
279	Daunia (SHCC)	37
280	Daunia (SHCC)	37
281	Daunia (SHCC)	37
282	Daunia (SHCC)	37
283	Daunia (SHCC)	41
284	Daunia (SHCC)	38
285	Daunia (SHCC)	38
286	Daunia (SHCC)	38
287	Daunia (SHCC)	38
288	Daunia (SHCC)	38
289	Daunia (SHCC)	38
290	Daunia (SHCC)	38
291	Daunia (SHCC)	38
292	Daunia (SHCC)	28
293	Daunia (SHCC)	28
294	Daunia (SHCC)	28
295	Daunia (SHCC)	37
296	Daunia (SHCC)	37
297	Daunia (SHCC)	37
298	Daunia (SHCC)	37
299	Daunia (SHCC)	37
300	Daunia (SHCC)	37
301	Daunia (SHCC)	38
302	Daunia (SHCC)	37
303	Daunia (SHCC)	37
304	Daunia (SHCC)	39
305	Daunia (SHCC)	39
306	Daunia (SHCC)	39
307	Daunia (SHCC)	39
308	Daunia (SHCC)	38
309	Daunia (SHCC)	37
310	Daunia (SHCC)	37
311	Daunia (SHCC)	37
312	Daunia (SHCC)	37
313	Daunia (SHCC)	37
314	Daunia (SHCC)	37
315	Daunia (SHCC)	30
316	Daunia (SHCC)	30
317	Daunia (SHCC)	25
318	Daunia (SHCC)	25
319	Daunia (SHCC)	25
320	Daunia (SHCC)	25
321	Daunia (SHCC)	25
322	Daunia (SHCC)	25
323	Daunia (SHCC)	25
324	Daunia (SHCC)	25
325	Daunia (SHCC)	25
326	Daunia (SHCC)	25
327	Daunia (SHCC)	25
328	Daunia (SHCC)	25
329	Daunia (SHCC)	26
330	Daunia (SHCC)	26
331	Daunia (SHCC)	26
332	Daunia (SHCC)	26
333	Daunia (SHCC)	26
334	Daunia (SHCC)	26
335	Daunia (SHCC)	26
336	Daunia (SHCC)	26
337	Daunia (SHCC)	26
338	Daunia (SHCC)	26
339	Daunia (SHCC)	26
340	Daunia (SHCC)	26
341	Daunia (SHCC)	26
342	Daunia (SHCC)	26
343	Daunia (SHCC)	26
344	Daunia (SHCC)	30
345	Daunia (SHCC)	30
346	Daunia (SHCC)	30
347	Daunia (SHCC)	30
348	Daunia (SHCC)	30
349	Daunia (SHCC)	0
350	Daunia (SHCC)	0
351	Daunia (SHCC)	0
352	Daunia (SHCC)	0
353	Daunia (SHCC)	0
354	Daunia (SHCC)	0
355	Daunia (SHCC)	0
356	Daunia (SHCC)	0
357	Daunia (SHCC)	0
358	Daunia (SHCC)	0
938	Daunia (SHCC)	17
939	Daunia (SHCC)	17
940	Daunia (SHCC)	17
941	Daunia (SHCC)	17
972	Daunia (SHCC)	22
973	Daunia (SHCC)	22
974	Daunia (SHCC)	22
975	Daunia (SHCC)	30
976	Daunia (SHCC)	22
977	Daunia (SHCC)	12
978	Daunia (SHCC)	12
979	Daunia (SHCC)	12
980	Daunia (SHCC)	25
981	Daunia (SHCC)	25
982	Daunia (SHCC)	25
983	Daunia (SHCC)	34
984	Daunia (SHCC)	34
990	Daunia (SHCC)	17
991	Daunia (SHCC)	17
992	Daunia (SHCC)	27
993	Daunia (SHCC)	27
994	Daunia (SHCC)	27
995	Daunia (SHCC)	27
996	Daunia (SHCC)	13
850	Leer	6
851	Leer	6
854	Leer	8
855	Leer	8
856	Leer	6
857	Leer	6
858	Leer	6
859	Leer	6
860	Leer	6
861	Leer	6
862	Leer	6
863	Leer	6
864	Leer	6
865	Leer	6
866	Leer	17
882	Leer	9
883	Leer	9
884	Leer	9
885	Leer	9
886	Leer	19
887	Leer	19
888	Leer	21
889	Leer	21
890	Leer	21
894	Leer	18
895	Leer	18
896	Leer	18
897	Leer	12
898	Leer	12
905	Leer	9
906	Leer	9
907	Leer	9
908	Leer	9
909	Leer	9
910	Leer	9
911	Leer	9
912	Leer	9
913	Leer	9
914	Leer	9
915	Leer	9
921	Leer	16
922	Leer	16
923	Leer	16
924	Leer	16
925	Leer	16
926	Leer	16
927	Leer	18
928	Leer	18
929	Leer	18
930	Leer	18
931	Leer	18
932	Leer	18
933	Leer	18
934	Leer	18
935	Leer	20
936	Leer	20
937	Leer	20
938	Leer	18
939	Leer	18
940	Leer	18
941	Leer	18
971	Leer	17
972	Leer	14
973	Leer	14
974	Leer	14
975	Leer	18
976	Leer	17
977	Leer	17
978	Leer	17
979	Leer	17
980	Leer	17
981	Leer	17
982	Leer	17
983	Leer	10
984	Leer	10
990	Leer	15
991	Leer	15
992	Leer	17
993	Leer	17
994	Leer	17
995	Leer	17
996	Leer	17
590	Elga	6
591	Elga	6
592	Elga	6
593	Elga	6
594	Elga	7
595	Elga	7
596	Elga	7
597	Elga	7
598	Elga	7
599	Elga	7
600	Elga	7
601	Elga	7
602	Elga	7
603	Elga	7
604	Elga	7
605	Elga	7
606	Elga	7
607	Elga	7
608	Elga	7
609	Elga	8
610	Elga	8
611	Elga	8
612	Elga	8
665	Elga	8
666	Elga	8
667	Elga	8
668	Elga	8
669	Elga	8
670	Elga	8
671	Elga	8
672	Elga	8
673	Elga	8
674	Elga	8
675	Elga	8
676	Elga	8
677	Elga	8
678	Elga	8
679	Elga	8
680	Elga	8
681	Elga	10
682	Elga	8
683	Elga	8
684	Elga	9
685	Elga	9
686	Elga	9
687	Elga	9
688	Elga	9
689	Elga	9
690	Elga	6
691	Elga	6
692	Elga	6
693	Elga	6
728	Elga	10
729	Elga	11
730	Elga	11
731	Elga	11
732	Elga	11
733	Elga	11
738	Elga	7
739	Elga	7
740	Elga	7
741	Elga	7
742	Elga	7
743	Elga	7
744	Elga	6
745	Elga	6
746	Elga	6
747	Elga	6
748	Elga	6
749	Elga	6
750	Elga	6
751	Elga	6
752	Elga	6
753	Elga	6
754	Elga	6
755	Elga	7
756	Elga	7
757	Elga	7
758	Elga	7
759	Elga	7
760	Elga	7
761	Elga	7
762	Elga	7
763	Elga	10
764	Elga	10
765	Elga	10
766	Elga	10
767	Elga	10
768	Elga	10
769	Elga	10
770	Elga	10
771	Elga	10
772	Elga	10
773	Elga	10
774	Elga	10
775	Elga	10
776	Elga	10
777	Elga	10
778	Elga	10
779	Elga	10
780	Elga	10
781	Elga	10
782	Elga	6
783	Elga	6
784	Elga	6
785	Elga	6
791	Elga	8
792	Elga	8
793	Elga	8
794	Elga	8
795	Elga	8
796	Elga	8
797	Elga	8
798	Elga	9
799	Elga	9
800	Elga	9
801	Elga	9
802	Elga	9
803	Elga	9
804	Elga	9
805	Elga	10
806	Elga	10
807	Elga	10
808	Elga	10
809	Elga	10
810	Elga	10
811	Elga	10
812	Elga	10
813	Elga	10
814	Elga	10
815	Elga	10
816	Elga	10
817	Elga	10
818	Elga	10
819	Elga	10
820	Elga	10
821	Elga	10
822	Elga	10
823	Elga	10
824	Elga	10
825	Elga	10
826	Elga	10
827	Elga	8
828	Elga	8
829	Elga	8
830	Elga	8
831	Elga	8
832	Elga	10
833	Elga	10
834	Elga	10
835	Elga	7
836	Elga	7
837	Elga	7
838	Elga	7
839	Elga	7
840	Elga	7
841	Elga	7
842	Elga	7
843	Elga	7
844	Elga	7
845	Elga	7
846	Elga	7
847	Elga	7
848	Elga	7
849	Elga	7
850	Elga	7
851	Elga	7
852	Elga	6
853	Elga	6
854	Elga	6
855	Elga	6
856	Elga	8
857	Elga	8
858	Elga	8
859	Elga	8
860	Elga	8
861	Elga	8
862	Elga	8
863	Elga	8
864	Elga	8
865	Elga	8
867	Elga	9
868	Elga	9
869	Elga	9
870	Elga	9
871	Elga	9
872	Elga	9
882	Elga	8
883	Elga	8
884	Elga	8
885	Elga	8
897	Elga	6
898	Elga	6
899	Elga	14
900	Elga	14
901	Elga	14
902	Elga	14
903	Elga	14
904	Elga	14
905	Elga	9
906	Elga	9
907	Elga	9
908	Elga	9
909	Elga	9
910	Elga	9
911	Elga	9
912	Elga	9
913	Elga	9
914	Elga	9
915	Elga	9
916	Elga	9
917	Elga	9
918	Elga	9
919	Elga	9
920	Elga	9
97	Leer/Russian HFCC	10
98	Leer/Russian HFCC	10
99	Leer/Russian HFCC	10
100	Leer/Russian HFCC	10
101	Leer/Russian HFCC	20
102	Leer/Russian HFCC	20
103	Leer/Russian HFCC	14
104	Leer/Russian HFCC	14
105	Leer/Russian HFCC	14
106	Leer/Russian HFCC	20
107	Leer/Russian HFCC	20
108	Leer/Russian HFCC	20
109	Leer/Russian HFCC	20
110	Leer/Russian HFCC	15
111	Leer/Russian HFCC	15
112	Leer/Russian HFCC	15
113	Leer/Russian HFCC	15
114	Leer/Russian HFCC	14
115	Leer/Russian HFCC	14
116	Leer/Russian HFCC	14
117	Leer/Russian HFCC	14
118	Leer/Russian HFCC	14
119	Leer/Russian HFCC	14
120	Leer/Russian HFCC	7
121	Leer/Russian HFCC	7
122	Leer/Russian HFCC	7
123	Leer/Russian HFCC	7
167	Leer/Russian HFCC	10
168	Leer/Russian HFCC	10
169	Leer/Russian HFCC	10
170	Leer/Russian HFCC	10
171	Leer/Russian HFCC	10
172	Leer/Russian HFCC	10
173	Leer/Russian HFCC	10
174	Leer/Russian HFCC	10
175	Leer/Russian HFCC	10
176	Leer/Russian HFCC	10
177	Leer/Russian HFCC	15
178	Leer/Russian HFCC	15
179	Leer/Russian HFCC	15
180	Leer/Russian HFCC	15
181	Leer/Russian HFCC	15
182	Leer/Russian HFCC	15
183	Leer/Russian HFCC	15
184	Leer/Russian HFCC	15
185	Leer/Russian HFCC	15
186	Leer/Russian HFCC	15
187	Leer/Russian HFCC	15
188	Leer/Russian HFCC	15
189	Leer/Russian HFCC	15
190	Leer/Russian HFCC	15
191	Leer/Russian HFCC	15
192	Leer/Russian HFCC	15
193	Leer/Russian HFCC	15
194	Leer/Russian HFCC	15
195	Leer/Russian HFCC	15
196	Leer/Russian HFCC	15
197	Leer/Russian HFCC	15
198	Leer/Russian HFCC	15
199	Leer/Russian HFCC	15
200	Leer/Russian HFCC	15
201	Leer/Russian HFCC	15
202	Leer/Russian HFCC	15
203	Leer/Russian HFCC	15
204	Leer/Russian HFCC	15
205	Leer/Russian HFCC	15
206	Leer/Russian HFCC	15
207	Leer/Russian HFCC	15
208	Leer/Russian HFCC	15
209	Leer/Russian HFCC	15
210	Leer/Russian HFCC	15
211	Leer/Russian HFCC	10
212	Leer/Russian HFCC	10
213	Leer/Russian HFCC	10
214	Leer/Russian HFCC	10
215	Leer/Russian HFCC	10
216	Leer/Russian HFCC	10
217	Leer/Russian HFCC	10
218	Leer/Russian HFCC	10
219	Leer/Russian HFCC	10
220	Leer/Russian HFCC	10
221	Leer/Russian HFCC	10
222	Leer/Russian HFCC	10
223	Leer/Russian HFCC	10
224	Leer/Russian HFCC	10
225	Leer/Russian HFCC	10
226	Leer/Russian HFCC	10
227	Leer/Russian HFCC	10
233	Leer/Russian HFCC	10
234	Leer/Russian HFCC	10
247	Leer/Russian HFCC	10
248	Leer/Russian HFCC	10
249	Leer/Russian HFCC	10
250	Leer/Russian HFCC	10
251	Leer/Russian HFCC	10
252	Leer/Russian HFCC	8
253	Leer/Russian HFCC	8
254	Leer/Russian HFCC	8
255	Leer/Russian HFCC	8
256	Leer/Russian HFCC	8
257	Leer/Russian HFCC	8
258	Leer/Russian HFCC	8
259	Leer/Russian HFCC	8
260	Leer/Russian HFCC	8
261	Leer/Russian HFCC	8
262	Leer/Russian HFCC	8
263	Leer/Russian HFCC	8
264	Leer/Russian HFCC	8
265	Leer/Russian HFCC	8
266	Leer/Russian HFCC	8
267	Leer/Russian HFCC	8
268	Leer/Russian HFCC	8
269	Leer/Russian HFCC	8
270	Leer/Russian HFCC	8
271	Leer/Russian HFCC	8
272	Leer/Russian HFCC	8
273	Leer/Russian HFCC	8
274	Leer/Russian HFCC	8
275	Leer/Russian HFCC	8
276	Leer/Russian HFCC	8
277	Leer/Russian HFCC	8
278	Leer/Russian HFCC	8
279	Leer/Russian HFCC	8
280	Leer/Russian HFCC	8
281	Leer/Russian HFCC	8
282	Leer/Russian HFCC	8
283	Leer/Russian HFCC	8
284	Leer/Russian HFCC	8
285	Leer/Russian HFCC	8
286	Leer/Russian HFCC	8
287	Leer/Russian HFCC	8
288	Leer/Russian HFCC	8
289	Leer/Russian HFCC	8
290	Leer/Russian HFCC	8
291	Leer/Russian HFCC	8
292	Leer/Russian HFCC	8
293	Leer/Russian HFCC	8
294	Leer/Russian HFCC	8
295	Leer/Russian HFCC	8
296	Leer/Russian HFCC	8
297	Leer/Russian HFCC	8
298	Leer/Russian HFCC	8
299	Leer/Russian HFCC	8
300	Leer/Russian HFCC	8
301	Leer/Russian HFCC	8
302	Leer/Russian HFCC	8
303	Leer/Russian HFCC	8
304	Leer/Russian HFCC	8
305	Leer/Russian HFCC	8
306	Leer/Russian HFCC	8
307	Leer/Russian HFCC	8
308	Leer/Russian HFCC	8
309	Leer/Russian HFCC	8
310	Leer/Russian HFCC	8
311	Leer/Russian HFCC	8
312	Leer/Russian HFCC	8
313	Leer/Russian HFCC	8
314	Leer/Russian HFCC	8
315	Leer/Russian HFCC	10
316	Leer/Russian HFCC	10
317	Leer/Russian HFCC	12
318	Leer/Russian HFCC	12
319	Leer/Russian HFCC	12
320	Leer/Russian HFCC	12
321	Leer/Russian HFCC	12
322	Leer/Russian HFCC	12
323	Leer/Russian HFCC	12
324	Leer/Russian HFCC	12
325	Leer/Russian HFCC	12
326	Leer/Russian HFCC	12
327	Leer/Russian HFCC	12
328	Leer/Russian HFCC	12
329	Leer/Russian HFCC	12
330	Leer/Russian HFCC	12
331	Leer/Russian HFCC	12
344	Leer/Russian HFCC	12
345	Leer/Russian HFCC	12
346	Leer/Russian HFCC	12
347	Leer/Russian HFCC	12
348	Leer/Russian HFCC	12
349	Leer/Russian HFCC	10
350	Leer/Russian HFCC	10
351	Leer/Russian HFCC	10
352	Leer/Russian HFCC	10
353	Leer/Russian HFCC	10
354	Leer/Russian HFCC	10
355	Leer/Russian HFCC	5
356	Leer/Russian HFCC	5
357	Leer/Russian HFCC	0
358	Leer/Russian HFCC	0
359	Leer/Russian HFCC	8
360	Leer/Russian HFCC	8
361	Leer/Russian HFCC	6
362	Leer/Russian HFCC	6
363	Leer/Russian HFCC	6
364	Leer/Russian HFCC	6
365	Leer/Russian HFCC	6
366	Leer/Russian HFCC	6
367	Leer/Russian HFCC	5
368	Leer/Russian HFCC	5
369	Leer/Russian HFCC	6
370	Leer/Russian HFCC	6
371	Leer/Russian HFCC	6
372	Leer/Russian HFCC	6
373	Leer/Russian HFCC	6
374	Leer/Russian HFCC	6
375	Leer/Russian HFCC	6
376	Leer/Russian HFCC	6
377	Leer/Russian HFCC	6
378	Leer/Russian HFCC	6
379	Leer/Russian HFCC	6
380	Leer/Russian HFCC	6
381	Leer/Russian HFCC	6
382	Leer/Russian HFCC	6
383	Leer/Russian HFCC	6
384	Leer/Russian HFCC	6
385	Leer/Russian HFCC	6
386	Leer/Russian HFCC	6
387	Leer/Russian HFCC	6
388	Leer/Russian HFCC	6
389	Leer/Russian HFCC	6
390	Leer/Russian HFCC	6
391	Leer/Russian HFCC	6
392	Leer/Russian HFCC	6
398	Leer/Russian HFCC	6
399	Leer/Russian HFCC	6
400	Leer/Russian HFCC	6
401	Leer/Russian HFCC	6
402	Leer/Russian HFCC	6
403	Leer/Russian HFCC	6
404	Leer/Russian HFCC	6
405	Leer/Russian HFCC	6
406	Leer/Russian HFCC	6
407	Leer/Russian HFCC	6
408	Leer/Russian HFCC	6
409	Leer/Russian HFCC	6
410	Leer/Russian HFCC	6
411	Leer/Russian HFCC	6
412	Leer/Russian HFCC	6
413	Leer/Russian HFCC	6
414	Leer/Russian HFCC	6
415	Leer/Russian HFCC	6
416	Leer/Russian HFCC	6
417	Leer/Russian HFCC	6
418	Leer/Russian HFCC	6
419	Leer/Russian HFCC	6
420	Leer/Russian HFCC	7
421	Leer/Russian HFCC	8
422	Leer/Russian HFCC	8
439	Leer/Russian HFCC	15
440	Leer/Russian HFCC	5
441	Leer/Russian HFCC	5
442	Leer/Russian HFCC	5
443	Leer/Russian HFCC	5
444	Leer/Russian HFCC	5
445	Leer/Russian HFCC	5
446	Leer/Russian HFCC	5
447	Leer/Russian HFCC	5
448	Leer/Russian HFCC	5
449	Leer/Russian HFCC	5
450	Leer/Russian HFCC	15
451	Leer/Russian HFCC	17
452	Leer/Russian HFCC	17
453	Leer/Russian HFCC	17
454	Leer/Russian HFCC	16
455	Leer/Russian HFCC	16
456	Leer/Russian HFCC	14
457	Leer/Russian HFCC	16
458	Leer/Russian HFCC	13
459	Leer/Russian HFCC	13
460	Leer/Russian HFCC	13
461	Leer/Russian HFCC	13
462	Leer/Russian HFCC	13
463	Leer/Russian HFCC	13
464	Leer/Russian HFCC	13
465	Leer/Russian HFCC	13
466	Leer/Russian HFCC	13
467	Leer/Russian HFCC	13
468	Leer/Russian HFCC	13
469	Leer/Russian HFCC	13
470	Leer/Russian HFCC	13
471	Leer/Russian HFCC	13
472	Leer/Russian HFCC	13
473	Leer/Russian HFCC	13
474	Leer/Russian HFCC	13
475	Leer/Russian HFCC	13
476	Leer/Russian HFCC	13
477	Leer/Russian HFCC	13
492	Leer/Russian HFCC	5
493	Leer/Russian HFCC	5
494	Leer/Russian HFCC	5
495	Leer/Russian HFCC	3
496	Leer/Russian HFCC	3
497	Leer/Russian HFCC	3
498	Leer/Russian HFCC	16
499	Leer/Russian HFCC	16
507	Leer/Russian HFCC	12
508	Leer/Russian HFCC	12
509	Leer/Russian HFCC	12
510	Leer/Russian HFCC	14
511	Leer/Russian HFCC	14
512	Leer/Russian HFCC	14
513	Leer/Russian HFCC	14
514	Leer/Russian HFCC	14
515	Leer/Russian HFCC	14
516	Leer/Russian HFCC	14
517	Leer/Russian HFCC	14
518	Leer/Russian HFCC	14
519	Leer/Russian HFCC	14
520	Leer/Russian HFCC	14
521	Leer/Russian HFCC	14
522	Leer/Russian HFCC	14
542	Leer/Russian HFCC	6
543	Leer/Russian HFCC	6
544	Leer/Russian HFCC	6
547	Leer/Russian HFCC	6
548	Leer/Russian HFCC	6
549	Leer/Russian HFCC	6
550	Leer/Russian HFCC	6
551	Leer/Russian HFCC	6
552	Leer/Russian HFCC	6
553	Leer/Russian HFCC	6
554	Leer/Russian HFCC	6
555	Leer/Russian HFCC	6
665	Leer/Russian HFCC	9
666	Leer/Russian HFCC	9
667	Leer/Russian HFCC	9
668	Leer/Russian HFCC	13
669	Leer/Russian HFCC	15
670	Leer/Russian HFCC	15
671	Leer/Russian HFCC	15
672	Leer/Russian HFCC	17
673	Leer/Russian HFCC	17
674	Leer/Russian HFCC	17
675	Leer/Russian HFCC	17
676	Leer/Russian HFCC	17
677	Leer/Russian HFCC	17
678	Leer/Russian HFCC	14
679	Leer/Russian HFCC	14
680	Leer/Russian HFCC	14
681	Leer/Russian HFCC	8
682	Leer/Russian HFCC	8
683	Leer/Russian HFCC	8
684	Leer/Russian HFCC	8
685	Leer/Russian HFCC	8
686	Leer/Russian HFCC	9
687	Leer/Russian HFCC	9
688	Leer/Russian HFCC	9
689	Leer/Russian HFCC	9
690	Leer/Russian HFCC	8
691	Leer/Russian HFCC	8
692	Leer/Russian HFCC	8
693	Leer/Russian HFCC	8
694	Leer/Russian HFCC	15
695	Leer/Russian HFCC	15
696	Leer/Russian HFCC	12
697	Leer/Russian HFCC	12
698	Leer/Russian HFCC	12
699	Leer/Russian HFCC	12
700	Leer/Russian HFCC	12
701	Leer/Russian HFCC	12
704	Leer/Russian HFCC	8
705	Leer/Russian HFCC	8
706	Leer/Russian HFCC	18
707	Leer/Russian HFCC	18
708	Leer/Russian HFCC	8
709	Leer/Russian HFCC	8
710	Leer/Russian HFCC	8
711	Leer/Russian HFCC	8
712	Leer/Russian HFCC	8
713	Leer/Russian HFCC	8
714	Leer/Russian HFCC	8
795	Uvalnaya	6
796	Uvalnaya	6
797	Uvalnaya	6
798	Uvalnaya	6
799	Uvalnaya	6
800	Uvalnaya	6
801	Uvalnaya	6
802	Uvalnaya	6
803	Uvalnaya	6
804	Uvalnaya	6
805	Uvalnaya	6
806	Uvalnaya	6
807	Uvalnaya	6
808	Uvalnaya	6
809	Uvalnaya	6
810	Uvalnaya	6
811	Uvalnaya	6
812	Uvalnaya	6
813	Uvalnaya	6
814	Uvalnaya	6
815	Uvalnaya	6
816	Uvalnaya	6
817	Uvalnaya	6
818	Uvalnaya	6
819	Uvalnaya	6
820	Uvalnaya	6
821	Uvalnaya	6
822	Uvalnaya	6
823	Uvalnaya	6
824	Uvalnaya	6
825	Uvalnaya	6
826	Uvalnaya	6
827	Uvalnaya	6
828	Uvalnaya	6
829	Uvalnaya	6
830	Uvalnaya	6
831	Uvalnaya	6
832	Uvalnaya	10
833	Uvalnaya	10
834	Uvalnaya	10
835	Uvalnaya	6
836	Uvalnaya	6
837	Uvalnaya	6
838	Uvalnaya	6
839	Uvalnaya	6
840	Uvalnaya	6
841	Uvalnaya	6
842	Uvalnaya	6
843	Uvalnaya	6
844	Uvalnaya	6
845	Uvalnaya	6
846	Uvalnaya	6
847	Uvalnaya	6
848	Uvalnaya	6
849	Uvalnaya	6
852	Uvalnaya	6
853	Uvalnaya	6
867	Uvalnaya	7
868	Uvalnaya	7
869	Uvalnaya	7
870	Uvalnaya	7
871	Uvalnaya	7
872	Uvalnaya	7
916	Uvalnaya	9
917	Uvalnaya	9
918	Uvalnaya	9
919	Uvalnaya	9
920	Uvalnaya	9
702	Blue creek	12
703	Blue creek	12
704	Blue creek	11
705	Blue creek	11
708	Blue creek	8
709	Blue creek	8
710	Blue creek	8
711	Blue creek	8
712	Blue creek	8
713	Blue creek	8
714	Blue creek	8
715	Blue creek	14
716	Blue creek	14
717	Blue creek	14
718	Blue creek	14
719	Blue creek	10
720	Blue creek	10
721	Blue creek	10
722	Blue creek	10
723	Blue creek	10
724	Blue creek	10
725	Blue creek	10
726	Blue creek	14
727	Blue creek	20
728	Blue creek	10
729	Blue creek	11
730	Blue creek	11
731	Blue creek	11
732	Blue creek	11
733	Blue creek	11
738	Blue creek	7
739	Blue creek	7
740	Blue creek	7
741	Blue creek	7
742	Blue creek	7
743	Blue creek	7
744	Blue creek	6
745	Blue creek	6
746	Blue creek	6
747	Blue creek	6
748	Blue creek	6
749	Blue creek	6
750	Blue creek	6
751	Blue creek	6
752	Blue creek	6
753	Blue creek	6
754	Blue creek	6
755	Blue creek	7
756	Blue creek	7
757	Blue creek	7
758	Blue creek	7
759	Blue creek	7
760	Blue creek	7
761	Blue creek	7
762	Blue creek	7
763	Blue creek	7
764	Blue creek	7
765	Blue creek	7
766	Blue creek	7
767	Blue creek	7
768	Blue creek	7
769	Blue creek	7
770	Blue creek	7
771	Blue creek	7
772	Blue creek	7
773	Blue creek	7
774	Blue creek	12
775	Blue creek	12
776	Blue creek	12
777	Blue creek	12
778	Blue creek	12
779	Blue creek	12
780	Blue creek	12
781	Blue creek	12
782	Blue creek	6
783	Blue creek	6
784	Blue creek	6
785	Blue creek	6
786	Blue creek	8
787	Blue creek	8
788	Blue creek	25
789	Blue creek	25
790	Blue creek	8
791	Blue creek	6
792	Blue creek	6
793	Blue creek	6
794	Blue creek	6
1	Mt. Laurel	6
2	Mt. Laurel	6
3	Mt. Laurel	6
4	Mt. Laurel	6
5	Mt. Laurel	6
6	Mt. Laurel	6
7	Mt. Laurel	6
8	Mt. Laurel	6
9	Mt. Laurel	6
10	Mt. Laurel	6
11	Mt. Laurel	6
12	Mt. Laurel	6
13	Mt. Laurel	6
14	Mt. Laurel	6
15	Mt. Laurel	10
16	Mt. Laurel	10
17	Mt. Laurel	10
18	Mt. Laurel	10
19	Mt. Laurel	10
20	Mt. Laurel	10
21	Mt. Laurel	10
22	Mt. Laurel	10
23	Mt. Laurel	10
24	Mt. Laurel	10
25	Mt. Laurel	10
26	Mt. Laurel	10
27	Mt. Laurel	10
28	Mt. Laurel	10
29	Mt. Laurel	10
30	Mt. Laurel	10
31	Mt. Laurel	10
32	Mt. Laurel	10
33	Mt. Laurel	10
34	Mt. Laurel	10
35	Mt. Laurel	10
36	Mt. Laurel	10
37	Mt. Laurel	10
38	Mt. Laurel	10
39	Mt. Laurel	10
40	Mt. Laurel	10
41	Mt. Laurel	10
42	Mt. Laurel	10
43	Mt. Laurel	10
44	Mt. Laurel	9
45	Mt. Laurel	9
46	Mt. Laurel	9
47	Mt. Laurel	9
48	Mt. Laurel	9
49	Mt. Laurel	9
50	Mt. Laurel	7
51	Mt. Laurel	7
52	Mt. Laurel	9
53	Mt. Laurel	9
54	Mt. Laurel	9
55	Mt. Laurel	9
56	Mt. Laurel	9
57	Mt. Laurel	9
58	Mt. Laurel	9
59	Mt. Laurel	9
60	Mt. Laurel	9
61	Mt. Laurel	13
62	Mt. Laurel	13
63	Mt. Laurel	13
64	Mt. Laurel	13
65	Mt. Laurel	13
66	Mt. Laurel	13
67	Mt. Laurel	13
68	Mt. Laurel	13
69	Mt. Laurel	13
70	Mt. Laurel	13
71	Mt. Laurel	10
72	Mt. Laurel	10
73	Mt. Laurel	10
74	Mt. Laurel	10
75	Mt. Laurel	10
76	Mt. Laurel	8
77	Mt. Laurel	8
78	Mt. Laurel	8
79	Mt. Laurel	8
80	Mt. Laurel	8
81	Mt. Laurel	8
82	Mt. Laurel	8
83	Mt. Laurel	8
84	Mt. Laurel	8
85	Mt. Laurel	10
86	Mt. Laurel	10
87	Mt. Laurel	10
88	Mt. Laurel	10
89	Mt. Laurel	10
90	Mt. Laurel	10
91	Mt. Laurel	10
92	Mt. Laurel	10
93	Mt. Laurel	10
94	Mt. Laurel	10
95	Mt. Laurel	10
96	Mt. Laurel	10
120	Mt. Laurel	7
121	Mt. Laurel	7
122	Mt. Laurel	7
123	Mt. Laurel	7
124	Mt. Laurel	11
125	Mt. Laurel	11
126	Mt. Laurel	11
127	Mt. Laurel	11
128	Mt. Laurel	15
129	Mt. Laurel	15
130	Mt. Laurel	15
131	Mt. Laurel	15
132	Mt. Laurel	15
133	Mt. Laurel	15
134	Mt. Laurel	15
135	Mt. Laurel	20
136	Mt. Laurel	20
137	Mt. Laurel	20
138	Mt. Laurel	18
139	Mt. Laurel	10
140	Mt. Laurel	10
141	Mt. Laurel	10
142	Mt. Laurel	15
143	Mt. Laurel	15
144	Mt. Laurel	15
145	Mt. Laurel	15
146	Mt. Laurel	15
147	Mt. Laurel	15
148	Mt. Laurel	15
149	Mt. Laurel	15
150	Mt. Laurel	15
151	Mt. Laurel	15
152	Mt. Laurel	15
153	Mt. Laurel	15
154	Mt. Laurel	15
155	Mt. Laurel	20
156	Mt. Laurel	20
157	Mt. Laurel	20
158	Mt. Laurel	20
159	Mt. Laurel	15
160	Mt. Laurel	15
161	Mt. Laurel	15
162	Mt. Laurel	5
163	Mt. Laurel	5
164	Mt. Laurel	5
165	Mt. Laurel	5
166	Mt. Laurel	5
211	Mt. Laurel	5
212	Mt. Laurel	5
213	Mt. Laurel	5
214	Mt. Laurel	7
215	Mt. Laurel	7
216	Mt. Laurel	7
217	Mt. Laurel	7
218	Mt. Laurel	7
219	Mt. Laurel	7
220	Mt. Laurel	7
221	Mt. Laurel	7
222	Mt. Laurel	7
223	Mt. Laurel	7
224	Mt. Laurel	7
225	Mt. Laurel	7
226	Mt. Laurel	7
227	Mt. Laurel	7
228	Mt. Laurel	10
229	Mt. Laurel	10
230	Mt. Laurel	10
231	Mt. Laurel	10
232	Mt. Laurel	10
235	Mt. Laurel	10
236	Mt. Laurel	12
237	Mt. Laurel	14
238	Mt. Laurel	14
239	Mt. Laurel	14
240	Mt. Laurel	14
241	Mt. Laurel	14
242	Mt. Laurel	14
243	Mt. Laurel	14
244	Mt. Laurel	10
245	Mt. Laurel	10
246	Mt. Laurel	10
332	Mt. Laurel	12
333	Mt. Laurel	12
334	Mt. Laurel	12
335	Mt. Laurel	12
336	Mt. Laurel	12
337	Mt. Laurel	12
338	Mt. Laurel	12
339	Mt. Laurel	12
340	Mt. Laurel	12
341	Mt. Laurel	12
342	Mt. Laurel	12
343	Mt. Laurel	12
355	Mt. Laurel	5
356	Mt. Laurel	5
357	Mt. Laurel	0
358	Mt. Laurel	0
542	Mt. Laurel	16
543	Mt. Laurel	16
544	Mt. Laurel	16
547	Mt. Laurel	13
548	Mt. Laurel	13
549	Mt. Laurel	13
550	Mt. Laurel	13
551	Mt. Laurel	13
552	Mt. Laurel	13
553	Mt. Laurel	13
554	Mt. Laurel	13
555	Mt. Laurel	13
593	Mt. Laurel	11
594	Mt. Laurel	12
595	Mt. Laurel	13
596	Mt. Laurel	13
597	Mt. Laurel	13
598	Mt. Laurel	13
599	Mt. Laurel	13
600	Mt. Laurel	13
601	Mt. Laurel	13
602	Mt. Laurel	13
603	Mt. Laurel	13
604	Mt. Laurel	13
605	Mt. Laurel	13
606	Mt. Laurel	13
607	Mt. Laurel	13
608	Mt. Laurel	13
609	Mt. Laurel	14
610	Mt. Laurel	14
611	Mt. Laurel	14
612	Mt. Laurel	14
1	R.PCI	16
2	R.PCI	16
3	R.PCI	16
4	R.PCI	16
5	R.PCI	16
6	R.PCI	16
7	R.PCI	16
8	R.PCI	16
9	R.PCI	16
10	R.PCI	11
11	R.PCI	11
12	R.PCI	11
13	R.PCI	11
14	R.PCI	11
15	R.PCI	8
16	R.PCI	8
17	R.PCI	8
18	R.PCI	8
19	R.PCI	8
20	R.PCI	8
21	R.PCI	11
22	R.PCI	11
23	R.PCI	11
24	R.PCI	11
25	R.PCI	11
26	R.PCI	10
27	R.PCI	10
28	R.PCI	10
29	R.PCI	10
30	R.PCI	8
31	R.PCI	8
32	R.PCI	7
33	R.PCI	7
34	R.PCI	7
35	R.PCI	7
36	R.PCI	7
37	R.PCI	7
38	R.PCI	7
39	R.PCI	7
40	R.PCI	7
41	R.PCI	8
42	R.PCI	8
43	R.PCI	8
44	R.PCI	14
45	R.PCI	14
46	R.PCI	14
47	R.PCI	7
48	R.PCI	7
49	R.PCI	7
50	R.PCI	9
51	R.PCI	9
52	R.PCI	6
53	R.PCI	6
54	R.PCI	6
55	R.PCI	6
56	R.PCI	6
57	R.PCI	6
58	R.PCI	6
59	R.PCI	6
60	R.PCI	6
61	R.PCI	10
62	R.PCI	10
63	R.PCI	10
64	R.PCI	10
65	R.PCI	10
66	R.PCI	10
67	R.PCI	10
68	R.PCI	10
69	R.PCI	10
70	R.PCI	10
71	R.PCI	10
72	R.PCI	10
73	R.PCI	10
74	R.PCI	10
75	R.PCI	10
76	R.PCI	2
77	R.PCI	2
78	R.PCI	2
79	R.PCI	2
80	R.PCI	10
81	R.PCI	10
82	R.PCI	10
83	R.PCI	10
84	R.PCI	10
85	R.PCI	12
86	R.PCI	12
87	R.PCI	12
88	R.PCI	12
89	R.PCI	12
90	R.PCI	10
91	R.PCI	10
92	R.PCI	10
93	R.PCI	10
94	R.PCI	10
95	R.PCI	10
96	R.PCI	10
97	R.PCI	4
98	R.PCI	4
99	R.PCI	4
100	R.PCI	4
101	R.PCI	10
102	R.PCI	10
103	R.PCI	5
105	R.PCI	5
106	R.PCI	5
107	R.PCI	5
108	R.PCI	5
109	R.PCI	5
110	R.PCI	8
111	R.PCI	8
112	R.PCI	8
113	R.PCI	8
114	R.PCI	8
115	R.PCI	8
116	R.PCI	8
117	R.PCI	8
118	R.PCI	8
119	R.PCI	8
120	R.PCI	8
121	R.PCI	8
122	R.PCI	8
123	R.PCI	8
124	R.PCI	12
125	R.PCI	12
126	R.PCI	12
127	R.PCI	12
128	R.PCI	10
129	R.PCI	10
130	R.PCI	10
131	R.PCI	10
132	R.PCI	10
133	R.PCI	10
134	R.PCI	10
135	R.PCI	10
136	R.PCI	10
137	R.PCI	10
138	R.PCI	10
139	R.PCI	10
140	R.PCI	10
141	R.PCI	10
142	R.PCI	10
143	R.PCI	10
144	R.PCI	10
145	R.PCI	10
146	R.PCI	10
147	R.PCI	10
148	R.PCI	10
149	R.PCI	10
150	R.PCI	10
151	R.PCI	10
152	R.PCI	10
153	R.PCI	10
154	R.PCI	10
155	R.PCI	10
156	R.PCI	10
157	R.PCI	10
158	R.PCI	10
159	R.PCI	15
160	R.PCI	15
161	R.PCI	15
162	R.PCI	5
163	R.PCI	5
164	R.PCI	5
165	R.PCI	8
166	R.PCI	8
167	R.PCI	8
168	R.PCI	8
169	R.PCI	8
170	R.PCI	9
171	R.PCI	9
172	R.PCI	9
173	R.PCI	9
174	R.PCI	10
175	R.PCI	10
176	R.PCI	10
177	R.PCI	7
178	R.PCI	7
179	R.PCI	9
180	R.PCI	9
181	R.PCI	9
182	R.PCI	9
183	R.PCI	9
184	R.PCI	9
185	R.PCI	9
186	R.PCI	9
187	R.PCI	9
188	R.PCI	9
189	R.PCI	9
190	R.PCI	9
191	R.PCI	10
192	R.PCI	10
193	R.PCI	10
194	R.PCI	10
195	R.PCI	10
196	R.PCI	16
197	R.PCI	16
198	R.PCI	16
199	R.PCI	16
200	R.PCI	16
201	R.PCI	16
202	R.PCI	16
203	R.PCI	16
204	R.PCI	16
205	R.PCI	16
206	R.PCI	16
207	R.PCI	16
208	R.PCI	18
209	R.PCI	18
210	R.PCI	18
211	R.PCI	20
212	R.PCI	20
213	R.PCI	20
214	R.PCI	20
215	R.PCI	20
216	R.PCI	20
217	R.PCI	20
218	R.PCI	20
219	R.PCI	20
220	R.PCI	20
221	R.PCI	20
222	R.PCI	20
223	R.PCI	20
224	R.PCI	20
225	R.PCI	20
226	R.PCI	20
227	R.PCI	20
228	R.PCI	10
229	R.PCI	10
230	R.PCI	10
231	R.PCI	12
232	R.PCI	12
233	R.PCI	12
234	R.PCI	12
235	R.PCI	14
236	R.PCI	14
237	R.PCI	10
238	R.PCI	10
239	R.PCI	10
240	R.PCI	10
241	R.PCI	10
242	R.PCI	10
243	R.PCI	10
244	R.PCI	10
245	R.PCI	10
246	R.PCI	10
247	R.PCI	11
248	R.PCI	11
249	R.PCI	11
250	R.PCI	13
251	R.PCI	13
252	R.PCI	12
253	R.PCI	12
254	R.PCI	12
255	R.PCI	12
256	R.PCI	12
257	R.PCI	12
258	R.PCI	12
259	R.PCI	12
260	R.PCI	12
261	R.PCI	14
262	R.PCI	14
263	R.PCI	14
264	R.PCI	14
265	R.PCI	14
266	R.PCI	14
267	R.PCI	15
268	R.PCI	15
269	R.PCI	15
270	R.PCI	15
271	R.PCI	15
272	R.PCI	15
273	R.PCI	15
274	R.PCI	15
275	R.PCI	15
276	R.PCI	15
277	R.PCI	15
278	R.PCI	15
279	R.PCI	15
280	R.PCI	15
281	R.PCI	15
282	R.PCI	15
283	R.PCI	8
284	R.PCI	8
285	R.PCI	8
286	R.PCI	12
287	R.PCI	14
288	R.PCI	14
289	R.PCI	14
290	R.PCI	14
291	R.PCI	14
292	R.PCI	14
293	R.PCI	14
294	R.PCI	14
295	R.PCI	14
296	R.PCI	14
297	R.PCI	14
298	R.PCI	14
299	R.PCI	14
300	R.PCI	14
301	R.PCI	14
302	R.PCI	16
303	R.PCI	16
304	R.PCI	16
305	R.PCI	16
306	R.PCI	17
307	R.PCI	16
308	R.PCI	16
309	R.PCI	16
310	R.PCI	16
311	R.PCI	16
312	R.PCI	16
313	R.PCI	16
314	R.PCI	16
315	R.PCI	18
316	R.PCI	18
317	R.PCI	20
318	R.PCI	20
319	R.PCI	20
320	R.PCI	20
321	R.PCI	20
322	R.PCI	20
323	R.PCI	20
324	R.PCI	20
325	R.PCI	20
326	R.PCI	19
327	R.PCI	19
328	R.PCI	19
329	R.PCI	17
330	R.PCI	13
331	R.PCI	13
332	R.PCI	10
333	R.PCI	10
334	R.PCI	8
335	R.PCI	8
336	R.PCI	8
337	R.PCI	8
338	R.PCI	8
339	R.PCI	8
340	R.PCI	8
341	R.PCI	8
342	R.PCI	8
343	R.PCI	8
344	R.PCI	10
345	R.PCI	10
346	R.PCI	10
347	R.PCI	10
348	R.PCI	12
349	R.PCI	16
350	R.PCI	16
351	R.PCI	16
352	R.PCI	18
353	R.PCI	18
354	R.PCI	18
355	R.PCI	18
356	R.PCI	18
357	R.PCI	20
358	R.PCI	20
359	R.PCI	19
360	R.PCI	19
361	R.PCI	20
362	R.PCI	20
363	R.PCI	21
364	R.PCI	21
365	R.PCI	21
366	R.PCI	21
367	R.PCI	21
368	R.PCI	21
369	R.PCI	21
370	R.PCI	21
371	R.PCI	21
372	R.PCI	21
373	R.PCI	21
374	R.PCI	21
375	R.PCI	21
376	R.PCI	21
377	R.PCI	23
378	R.PCI	23
379	R.PCI	23
380	R.PCI	23
381	R.PCI	23
382	R.PCI	23
383	R.PCI	23
384	R.PCI	23
385	R.PCI	23
386	R.PCI	23
387	R.PCI	23
388	R.PCI	23
389	R.PCI	23
390	R.PCI	23
391	R.PCI	23
392	R.PCI	23
398	R.PCI	23
399	R.PCI	23
400	R.PCI	23
401	R.PCI	25
402	R.PCI	25
403	R.PCI	25
404	R.PCI	25
405	R.PCI	25
406	R.PCI	26
407	R.PCI	26
408	R.PCI	26
409	R.PCI	27
410	R.PCI	27
411	R.PCI	27
412	R.PCI	27
413	R.PCI	27
414	R.PCI	27
415	R.PCI	27
416	R.PCI	27
417	R.PCI	27
418	R.PCI	27
419	R.PCI	27
420	R.PCI	18
421	R.PCI	11
422	R.PCI	15
439	R.PCI	17
440	R.PCI	23
441	R.PCI	23
442	R.PCI	23
443	R.PCI	21
444	R.PCI	21
445	R.PCI	21
446	R.PCI	21
447	R.PCI	21
448	R.PCI	21
449	R.PCI	21
450	R.PCI	16
451	R.PCI	10
452	R.PCI	10
453	R.PCI	10
454	R.PCI	16
455	R.PCI	16
456	R.PCI	18
457	R.PCI	23
458	R.PCI	23
459	R.PCI	23
460	R.PCI	23
461	R.PCI	23
462	R.PCI	23
463	R.PCI	18
464	R.PCI	18
465	R.PCI	18
466	R.PCI	23
467	R.PCI	23
468	R.PCI	23
469	R.PCI	25
470	R.PCI	25
471	R.PCI	25
472	R.PCI	25
473	R.PCI	25
474	R.PCI	25
475	R.PCI	25
476	R.PCI	25
477	R.PCI	25
478	R.PCI	25
479	R.PCI	25
480	R.PCI	27
481	R.PCI	27
482	R.PCI	27
483	R.PCI	27
484	R.PCI	27
485	R.PCI	27
486	R.PCI	27
487	R.PCI	27
488	R.PCI	27
489	R.PCI	27
490	R.PCI	27
491	R.PCI	27
492	R.PCI	27
493	R.PCI	27
494	R.PCI	27
495	R.PCI	27
496	R.PCI	27
497	R.PCI	27
498	R.PCI	24
499	R.PCI	24
507	R.PCI	24
508	R.PCI	24
509	R.PCI	24
510	R.PCI	24
511	R.PCI	24
512	R.PCI	24
513	R.PCI	24
514	R.PCI	24
515	R.PCI	24
516	R.PCI	24
517	R.PCI	24
518	R.PCI	24
519	R.PCI	24
520	R.PCI	24
521	R.PCI	24
522	R.PCI	24
542	R.PCI	22
543	R.PCI	22
544	R.PCI	22
547	R.PCI	22
548	R.PCI	22
549	R.PCI	22
550	R.PCI	22
551	R.PCI	22
552	R.PCI	22
553	R.PCI	23
554	R.PCI	23
555	R.PCI	23
590	R.PCI	7
591	R.PCI	7
592	R.PCI	7
593	R.PCI	20
594	R.PCI	18
595	R.PCI	18
596	R.PCI	18
597	R.PCI	18
598	R.PCI	18
599	R.PCI	20
600	R.PCI	20
601	R.PCI	20
602	R.PCI	20
603	R.PCI	20
604	R.PCI	20
605	R.PCI	20
606	R.PCI	20
607	R.PCI	20
608	R.PCI	20
609	R.PCI	20
610	R.PCI	20
611	R.PCI	20
612	R.PCI	20
665	R.PCI	18
666	R.PCI	18
667	R.PCI	18
668	R.PCI	22
669	R.PCI	24
670	R.PCI	24
671	R.PCI	24
672	R.PCI	24
673	R.PCI	24
674	R.PCI	24
675	R.PCI	24
676	R.PCI	24
677	R.PCI	24
678	R.PCI	25
679	R.PCI	25
680	R.PCI	25
681	R.PCI	20
682	R.PCI	21
683	R.PCI	21
684	R.PCI	19
685	R.PCI	19
686	R.PCI	17
687	R.PCI	17
688	R.PCI	17
689	R.PCI	17
690	R.PCI	8
691	R.PCI	8
692	R.PCI	8
693	R.PCI	8
694	R.PCI	10
695	R.PCI	10
696	R.PCI	8
697	R.PCI	8
698	R.PCI	8
699	R.PCI	10
700	R.PCI	12
701	R.PCI	12
702	R.PCI	12
703	R.PCI	12
704	R.PCI	19
705	R.PCI	19
706	R.PCI	18
707	R.PCI	18
708	R.PCI	20
709	R.PCI	20
710	R.PCI	20
711	R.PCI	20
712	R.PCI	20
713	R.PCI	20
714	R.PCI	20
715	R.PCI	20
716	R.PCI	20
717	R.PCI	20
718	R.PCI	20
719	R.PCI	17
720	R.PCI	17
721	R.PCI	17
722	R.PCI	17
723	R.PCI	17
724	R.PCI	17
725	R.PCI	17
726	R.PCI	19
727	R.PCI	22
728	R.PCI	24
729	R.PCI	26
730	R.PCI	26
731	R.PCI	26
732	R.PCI	26
733	R.PCI	26
738	R.PCI	22
739	R.PCI	22
740	R.PCI	22
741	R.PCI	22
742	R.PCI	22
743	R.PCI	22
744	R.PCI	24
745	R.PCI	24
746	R.PCI	24
747	R.PCI	24
748	R.PCI	24
749	R.PCI	24
750	R.PCI	24
751	R.PCI	24
752	R.PCI	24
753	R.PCI	24
754	R.PCI	24
755	R.PCI	24
756	R.PCI	24
757	R.PCI	24
758	R.PCI	24
759	R.PCI	24
760	R.PCI	15
761	R.PCI	15
762	R.PCI	15
763	R.PCI	22
764	R.PCI	22
765	R.PCI	22
766	R.PCI	22
767	R.PCI	22
768	R.PCI	22
769	R.PCI	22
770	R.PCI	22
771	R.PCI	20
772	R.PCI	20
773	R.PCI	20
774	R.PCI	22
775	R.PCI	22
776	R.PCI	10
777	R.PCI	10
778	R.PCI	10
779	R.PCI	10
780	R.PCI	10
781	R.PCI	10
782	R.PCI	24
783	R.PCI	24
784	R.PCI	24
785	R.PCI	24
786	R.PCI	16
787	R.PCI	16
788	R.PCI	5
789	R.PCI	5
790	R.PCI	8
791	R.PCI	24
792	R.PCI	24
793	R.PCI	24
794	R.PCI	24
795	R.PCI	24
796	R.PCI	24
797	R.PCI	24
798	R.PCI	24
799	R.PCI	24
800	R.PCI	24
801	R.PCI	25
802	R.PCI	25
803	R.PCI	25
804	R.PCI	25
805	R.PCI	24
806	R.PCI	24
807	R.PCI	24
808	R.PCI	24
809	R.PCI	24
810	R.PCI	24
811	R.PCI	24
812	R.PCI	24
813	R.PCI	24
814	R.PCI	24
815	R.PCI	24
816	R.PCI	24
817	R.PCI	24
818	R.PCI	20
819	R.PCI	20
820	R.PCI	20
821	R.PCI	20
822	R.PCI	20
823	R.PCI	20
824	R.PCI	20
825	R.PCI	20
826	R.PCI	20
827	R.PCI	18
828	R.PCI	18
829	R.PCI	18
830	R.PCI	18
831	R.PCI	18
832	R.PCI	6
833	R.PCI	6
834	R.PCI	6
835	R.PCI	25
836	R.PCI	25
837	R.PCI	25
838	R.PCI	25
839	R.PCI	25
840	R.PCI	25
841	R.PCI	22
842	R.PCI	22
843	R.PCI	22
844	R.PCI	22
845	R.PCI	25
846	R.PCI	25
847	R.PCI	25
848	R.PCI	25
849	R.PCI	25
850	R.PCI	15
851	R.PCI	15
852	R.PCI	20
853	R.PCI	20
854	R.PCI	20
855	R.PCI	20
856	R.PCI	22
857	R.PCI	20
858	R.PCI	20
859	R.PCI	20
860	R.PCI	20
861	R.PCI	20
862	R.PCI	20
863	R.PCI	20
864	R.PCI	20
865	R.PCI	20
866	R.PCI	24
867	R.PCI	24
868	R.PCI	24
869	R.PCI	24
870	R.PCI	24
871	R.PCI	24
872	R.PCI	24
882	R.PCI	24
883	R.PCI	24
884	R.PCI	24
885	R.PCI	24
886	R.PCI	21
887	R.PCI	20
888	R.PCI	17
889	R.PCI	17
890	R.PCI	17
894	R.PCI	18
895	R.PCI	18
896	R.PCI	18
897	R.PCI	13
898	R.PCI	13
899	R.PCI	13
900	R.PCI	13
901	R.PCI	15
902	R.PCI	15
903	R.PCI	20
904	R.PCI	20
905	R.PCI	22
906	R.PCI	22
907	R.PCI	22
908	R.PCI	22
909	R.PCI	22
910	R.PCI	22
911	R.PCI	22
912	R.PCI	22
913	R.PCI	22
914	R.PCI	22
915	R.PCI	22
916	R.PCI	23
917	R.PCI	23
918	R.PCI	23
919	R.PCI	23
920	R.PCI	23
921	R.PCI	23
922	R.PCI	23
923	R.PCI	23
924	R.PCI	23
925	R.PCI	23
926	R.PCI	23
927	R.PCI	23
928	R.PCI	23
929	R.PCI	23
930	R.PCI	23
931	R.PCI	23
932	R.PCI	23
933	R.PCI	23
934	R.PCI	23
935	R.PCI	25
936	R.PCI	25
937	R.PCI	25
938	R.PCI	23
939	R.PCI	23
940	R.PCI	23
941	R.PCI	23
971	R.PCI	22
972	R.PCI	18
973	R.PCI	18
974	R.PCI	18
975	R.PCI	20
976	R.PCI	23
977	R.PCI	23
978	R.PCI	23
979	R.PCI	23
980	R.PCI	21
981	R.PCI	21
982	R.PCI	21
983	R.PCI	11
984	R.PCI	11
990	R.PCI	23
991	R.PCI	23
992	R.PCI	24
993	R.PCI	24
994	R.PCI	24
995	R.PCI	24
996	R.PCI	24
26	Scratch Coal	5
27	Scratch Coal	5
28	Scratch Coal	5
29	Scratch Coal	5
30	Scratch Coal	5
31	Scratch Coal	5
32	Scratch Coal	5
33	Scratch Coal	5
34	Scratch Coal	5
35	Scratch Coal	5
36	Scratch Coal	5
37	Scratch Coal	5
38	Scratch Coal	5
39	Scratch Coal	5
40	Scratch Coal	5
41	Scratch Coal	5
42	Scratch Coal	5
43	Scratch Coal	5
44	Scratch Coal	10
45	Scratch Coal	10
46	Scratch Coal	10
47	Scratch Coal	11
48	Scratch Coal	11
49	Scratch Coal	11
50	Scratch Coal	11
51	Scratch Coal	11
52	Scratch Coal	13
53	Scratch Coal	13
54	Scratch Coal	13
55	Scratch Coal	13
56	Scratch Coal	13
57	Scratch Coal	13
58	Scratch Coal	13
59	Scratch Coal	13
60	Scratch Coal	13
61	Scratch Coal	8
62	Scratch Coal	8
63	Scratch Coal	8
64	Scratch Coal	8
65	Scratch Coal	8
66	Scratch Coal	8
67	Scratch Coal	8
68	Scratch Coal	8
69	Scratch Coal	8
70	Scratch Coal	6
71	Scratch Coal	8
72	Scratch Coal	8
73	Scratch Coal	8
74	Scratch Coal	8
75	Scratch Coal	8
76	Scratch Coal	8
77	Scratch Coal	8
78	Scratch Coal	8
79	Scratch Coal	8
80	Scratch Coal	8
81	Scratch Coal	8
82	Scratch Coal	8
83	Scratch Coal	8
84	Scratch Coal	8
85	Scratch Coal	4
86	Scratch Coal	4
87	Scratch Coal	4
88	Scratch Coal	4
89	Scratch Coal	4
90	Scratch Coal	6
91	Scratch Coal	6
92	Scratch Coal	6
93	Scratch Coal	6
94	Scratch Coal	6
95	Scratch Coal	6
96	Scratch Coal	6
97	Scratch Coal	10
98	Scratch Coal	10
99	Scratch Coal	10
100	Scratch Coal	10
101	Scratch Coal	6
102	Scratch Coal	6
103	Scratch Coal	10
105	Scratch Coal	10
106	Scratch Coal	10
107	Scratch Coal	10
108	Scratch Coal	10
109	Scratch Coal	10
110	Scratch Coal	9
111	Scratch Coal	9
112	Scratch Coal	9
113	Scratch Coal	9
114	Scratch Coal	8
115	Scratch Coal	8
116	Scratch Coal	8
117	Scratch Coal	8
118	Scratch Coal	8
119	Scratch Coal	8
120	Scratch Coal	8
121	Scratch Coal	8
122	Scratch Coal	8
123	Scratch Coal	8
124	Scratch Coal	11
125	Scratch Coal	11
126	Scratch Coal	11
127	Scratch Coal	11
128	Scratch Coal	15
129	Scratch Coal	15
130	Scratch Coal	15
131	Scratch Coal	15
132	Scratch Coal	15
133	Scratch Coal	15
134	Scratch Coal	15
135	Scratch Coal	15
136	Scratch Coal	15
137	Scratch Coal	15
138	Scratch Coal	10
139	Scratch Coal	15
140	Scratch Coal	15
141	Scratch Coal	15
142	Scratch Coal	15
143	Scratch Coal	15
144	Scratch Coal	15
145	Scratch Coal	15
146	Scratch Coal	15
147	Scratch Coal	15
148	Scratch Coal	15
149	Scratch Coal	15
150	Scratch Coal	15
151	Scratch Coal	15
152	Scratch Coal	15
153	Scratch Coal	10
154	Scratch Coal	10
155	Scratch Coal	10
156	Scratch Coal	5
157	Scratch Coal	5
158	Scratch Coal	5
159	Scratch Coal	7
160	Scratch Coal	7
161	Scratch Coal	7
162	Scratch Coal	5
163	Scratch Coal	5
164	Scratch Coal	5
165	Scratch Coal	5
166	Scratch Coal	5
167	Scratch Coal	5
168	Scratch Coal	5
169	Scratch Coal	5
170	Scratch Coal	8
171	Scratch Coal	8
172	Scratch Coal	8
173	Scratch Coal	8
174	Scratch Coal	10
175	Scratch Coal	10
176	Scratch Coal	10
177	Scratch Coal	8
178	Scratch Coal	8
179	Scratch Coal	8
180	Scratch Coal	8
181	Scratch Coal	8
182	Scratch Coal	8
183	Scratch Coal	8
184	Scratch Coal	8
185	Scratch Coal	8
186	Scratch Coal	8
187	Scratch Coal	9
188	Scratch Coal	9
189	Scratch Coal	9
190	Scratch Coal	9
191	Scratch Coal	9
192	Scratch Coal	9
193	Scratch Coal	9
194	Scratch Coal	9
195	Scratch Coal	9
196	Scratch Coal	9
197	Scratch Coal	9
198	Scratch Coal	9
199	Scratch Coal	9
200	Scratch Coal	9
201	Scratch Coal	9
202	Scratch Coal	9
203	Scratch Coal	9
204	Scratch Coal	9
205	Scratch Coal	9
206	Scratch Coal	9
207	Scratch Coal	11
208	Scratch Coal	11
209	Scratch Coal	11
210	Scratch Coal	11
211	Scratch Coal	11
212	Scratch Coal	11
213	Scratch Coal	11
214	Scratch Coal	11
215	Scratch Coal	11
216	Scratch Coal	11
217	Scratch Coal	11
218	Scratch Coal	11
219	Scratch Coal	11
220	Scratch Coal	9
221	Scratch Coal	9
222	Scratch Coal	9
223	Scratch Coal	9
224	Scratch Coal	9
225	Scratch Coal	9
226	Scratch Coal	9
227	Scratch Coal	9
228	Scratch Coal	6
229	Scratch Coal	6
230	Scratch Coal	6
231	Scratch Coal	8
232	Scratch Coal	8
233	Scratch Coal	8
234	Scratch Coal	8
235	Scratch Coal	8
236	Scratch Coal	8
237	Scratch Coal	10
238	Scratch Coal	10
239	Scratch Coal	10
240	Scratch Coal	10
241	Scratch Coal	10
242	Scratch Coal	10
243	Scratch Coal	10
244	Scratch Coal	12
245	Scratch Coal	12
246	Scratch Coal	12
247	Scratch Coal	14
248	Scratch Coal	14
249	Scratch Coal	14
250	Scratch Coal	15
251	Scratch Coal	15
252	Scratch Coal	12
253	Scratch Coal	12
254	Scratch Coal	12
255	Scratch Coal	12
256	Scratch Coal	12
257	Scratch Coal	12
258	Scratch Coal	12
259	Scratch Coal	12
260	Scratch Coal	12
261	Scratch Coal	12
262	Scratch Coal	12
263	Scratch Coal	12
264	Scratch Coal	12
265	Scratch Coal	12
266	Scratch Coal	12
267	Scratch Coal	12
268	Scratch Coal	12
269	Scratch Coal	12
270	Scratch Coal	12
271	Scratch Coal	12
272	Scratch Coal	12
273	Scratch Coal	12
274	Scratch Coal	9
275	Scratch Coal	9
276	Scratch Coal	9
277	Scratch Coal	9
278	Scratch Coal	9
279	Scratch Coal	9
280	Scratch Coal	9
281	Scratch Coal	9
282	Scratch Coal	9
283	Scratch Coal	9
284	Scratch Coal	8
285	Scratch Coal	8
286	Scratch Coal	8
287	Scratch Coal	8
288	Scratch Coal	8
289	Scratch Coal	8
290	Scratch Coal	8
291	Scratch Coal	8
292	Scratch Coal	8
293	Scratch Coal	8
294	Scratch Coal	8
295	Scratch Coal	8
296	Scratch Coal	8
297	Scratch Coal	8
298	Scratch Coal	8
299	Scratch Coal	8
300	Scratch Coal	8
301	Scratch Coal	8
302	Scratch Coal	8
303	Scratch Coal	8
304	Scratch Coal	8
305	Scratch Coal	8
306	Scratch Coal	9
307	Scratch Coal	8
308	Scratch Coal	10
309	Scratch Coal	10
310	Scratch Coal	10
311	Scratch Coal	10
312	Scratch Coal	10
313	Scratch Coal	10
314	Scratch Coal	10
315	Scratch Coal	11
316	Scratch Coal	11
317	Scratch Coal	11
318	Scratch Coal	11
319	Scratch Coal	11
320	Scratch Coal	11
321	Scratch Coal	11
322	Scratch Coal	11
323	Scratch Coal	11
324	Scratch Coal	11
325	Scratch Coal	11
326	Scratch Coal	10
327	Scratch Coal	10
328	Scratch Coal	10
329	Scratch Coal	10
330	Scratch Coal	10
331	Scratch Coal	10
332	Scratch Coal	10
333	Scratch Coal	10
334	Scratch Coal	10
335	Scratch Coal	10
336	Scratch Coal	10
337	Scratch Coal	10
338	Scratch Coal	10
339	Scratch Coal	10
340	Scratch Coal	8
341	Scratch Coal	8
342	Scratch Coal	8
343	Scratch Coal	8
344	Scratch Coal	8
345	Scratch Coal	8
346	Scratch Coal	8
347	Scratch Coal	8
348	Scratch Coal	8
349	Scratch Coal	6
350	Scratch Coal	6
351	Scratch Coal	6
352	Scratch Coal	6
353	Scratch Coal	6
354	Scratch Coal	6
355	Scratch Coal	6
356	Scratch Coal	6
357	Scratch Coal	0
358	Scratch Coal	0
359	Scratch Coal	3
360	Scratch Coal	3
361	Scratch Coal	3
362	Scratch Coal	3
363	Scratch Coal	3
364	Scratch Coal	3
365	Scratch Coal	3
366	Scratch Coal	3
367	Scratch Coal	3
368	Scratch Coal	3
369	Scratch Coal	3
370	Scratch Coal	3
371	Scratch Coal	3
372	Scratch Coal	3
373	Scratch Coal	3
374	Scratch Coal	3
375	Scratch Coal	3
376	Scratch Coal	3
377	Scratch Coal	3
378	Scratch Coal	3
379	Scratch Coal	3
380	Scratch Coal	3
381	Scratch Coal	3
382	Scratch Coal	3
383	Scratch Coal	3
384	Scratch Coal	3
385	Scratch Coal	3
386	Scratch Coal	3
387	Scratch Coal	3
388	Scratch Coal	3
389	Scratch Coal	3
390	Scratch Coal	3
391	Scratch Coal	3
392	Scratch Coal	3
439	Scratch Coal	10
440	Scratch Coal	5
441	Scratch Coal	5
442	Scratch Coal	5
443	Scratch Coal	5
444	Scratch Coal	5
445	Scratch Coal	5
446	Scratch Coal	5
447	Scratch Coal	5
448	Scratch Coal	5
449	Scratch Coal	5
450	Scratch Coal	5
451	Scratch Coal	5
452	Scratch Coal	5
453	Scratch Coal	5
454	Scratch Coal	5
455	Scratch Coal	5
456	Scratch Coal	5
457	Scratch Coal	5
458	Scratch Coal	3
459	Scratch Coal	3
460	Scratch Coal	3
461	Scratch Coal	3
462	Scratch Coal	3
463	Scratch Coal	3
464	Scratch Coal	3
465	Scratch Coal	3
466	Scratch Coal	3
467	Scratch Coal	3
468	Scratch Coal	3
469	Scratch Coal	3
470	Scratch Coal	3
471	Scratch Coal	3
472	Scratch Coal	3
473	Scratch Coal	3
474	Scratch Coal	3
475	Scratch Coal	3
476	Scratch Coal	3
477	Scratch Coal	3
478	Scratch Coal	3
479	Scratch Coal	3
480	Scratch Coal	3
481	Scratch Coal	3
482	Scratch Coal	3
483	Scratch Coal	3
484	Scratch Coal	3
485	Scratch Coal	3
486	Scratch Coal	3
487	Scratch Coal	3
488	Scratch Coal	3
489	Scratch Coal	3
490	Scratch Coal	3
491	Scratch Coal	3
492	Scratch Coal	3
493	Scratch Coal	3
494	Scratch Coal	3
495	Scratch Coal	3
496	Scratch Coal	3
497	Scratch Coal	3
498	Scratch Coal	3
499	Scratch Coal	3
507	Scratch Coal	3
508	Scratch Coal	3
509	Scratch Coal	3
510	Scratch Coal	3
511	Scratch Coal	3
512	Scratch Coal	3
513	Scratch Coal	3
514	Scratch Coal	3
515	Scratch Coal	3
516	Scratch Coal	3
517	Scratch Coal	3
518	Scratch Coal	3
519	Scratch Coal	3
520	Scratch Coal	3
521	Scratch Coal	3
522	Scratch Coal	3
590	Scratch Coal	1
591	Scratch Coal	1
592	Scratch Coal	1
593	Scratch Coal	1
594	Scratch Coal	1
595	Scratch Coal	1
596	Scratch Coal	1
597	Scratch Coal	1
598	Scratch Coal	1
599	Scratch Coal	1
600	Scratch Coal	1
601	Scratch Coal	1
602	Scratch Coal	1
603	Scratch Coal	1
604	Scratch Coal	1
605	Scratch Coal	1
606	Scratch Coal	1
607	Scratch Coal	1
608	Scratch Coal	1
609	Scratch Coal	1
610	Scratch Coal	1
611	Scratch Coal	1
612	Scratch Coal	1
672	Scratch Coal	4
673	Scratch Coal	4
674	Scratch Coal	4
675	Scratch Coal	4
676	Scratch Coal	4
677	Scratch Coal	4
678	Scratch Coal	4
679	Scratch Coal	4
680	Scratch Coal	4
726	Scratch Coal	2
727	Scratch Coal	2
728	Scratch Coal	2
729	Scratch Coal	2
730	Scratch Coal	2
731	Scratch Coal	2
732	Scratch Coal	2
733	Scratch Coal	2
748	Scratch Coal	2
749	Scratch Coal	2
750	Scratch Coal	2
751	Scratch Coal	2
752	Scratch Coal	2
753	Scratch Coal	2
754	Scratch Coal	2
755	Scratch Coal	2
756	Scratch Coal	2
757	Scratch Coal	2
758	Scratch Coal	2
759	Scratch Coal	2
760	Scratch Coal	2
761	Scratch Coal	2
762	Scratch Coal	2
763	Scratch Coal	2
764	Scratch Coal	2
765	Scratch Coal	2
766	Scratch Coal	2
767	Scratch Coal	2
768	Scratch Coal	2
769	Scratch Coal	2
770	Scratch Coal	2
771	Scratch Coal	2
772	Scratch Coal	2
773	Scratch Coal	2
774	Scratch Coal	2
775	Scratch Coal	2
776	Scratch Coal	2
777	Scratch Coal	2
778	Scratch Coal	2
779	Scratch Coal	2
780	Scratch Coal	2
781	Scratch Coal	2
782	Scratch Coal	2
783	Scratch Coal	2
784	Scratch Coal	2
785	Scratch Coal	2
786	Scratch Coal	2
787	Scratch Coal	2
788	Scratch Coal	5
789	Scratch Coal	5
790	Scratch Coal	5
791	Scratch Coal	1
792	Scratch Coal	1
793	Scratch Coal	1
794	Scratch Coal	1
795	Scratch Coal	1
796	Scratch Coal	1
797	Scratch Coal	1
798	Scratch Coal	1
799	Scratch Coal	1
800	Scratch Coal	1
801	Scratch Coal	1
802	Scratch Coal	1
803	Scratch Coal	1
804	Scratch Coal	1
805	Scratch Coal	1
806	Scratch Coal	1
807	Scratch Coal	1
808	Scratch Coal	1
809	Scratch Coal	1
810	Scratch Coal	1
811	Scratch Coal	1
812	Scratch Coal	1
813	Scratch Coal	1
814	Scratch Coal	1
815	Scratch Coal	1
816	Scratch Coal	1
817	Scratch Coal	1
818	Scratch Coal	1
819	Scratch Coal	1
882	Scratch Coal	4
883	Scratch Coal	4
884	Scratch Coal	4
885	Scratch Coal	4
886	Scratch Coal	4
887	Scratch Coal	4
888	Scratch Coal	4
889	Scratch Coal	4
890	Scratch Coal	4
894	Scratch Coal	4
895	Scratch Coal	4
896	Scratch Coal	4
897	Scratch Coal	4
898	Scratch Coal	4
899	Scratch Coal	4
900	Scratch Coal	4
901	Scratch Coal	4
902	Scratch Coal	4
903	Scratch Coal	4
904	Scratch Coal	4
905	Scratch Coal	4
906	Scratch Coal	4
907	Scratch Coal	4
908	Scratch Coal	4
909	Scratch Coal	4
910	Scratch Coal	4
911	Scratch Coal	4
912	Scratch Coal	4
913	Scratch Coal	4
914	Scratch Coal	4
915	Scratch Coal	4
916	Scratch Coal	4
917	Scratch Coal	4
918	Scratch Coal	4
919	Scratch Coal	4
920	Scratch Coal	4
921	Scratch Coal	4
922	Scratch Coal	4
923	Scratch Coal	4
924	Scratch Coal	4
925	Scratch Coal	4
926	Scratch Coal	4
\.


--
-- TOC entry 5128 (class 0 OID 41514)
-- Dependencies: 220
-- Data for Name: blend_reco_selection; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.blend_reco_selection (id, user_id, node_id, type, coalno, coal_name, min_value, max_value, stockout_date, inventory) FROM stdin;
\.


--
-- TOC entry 5129 (class 0 OID 41517)
-- Dependencies: 221
-- Data for Name: blend_recom_output_perc_temp; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.blend_recom_output_perc_temp (id, user_id, node_id, type, recno, coalno, coal_name, blend_perc) FROM stdin;
\.


--
-- TOC entry 5130 (class 0 OID 41520)
-- Dependencies: 222
-- Data for Name: blend_recommendation_output_temp; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.blend_recommendation_output_temp (id, user_id, node_id, type, recno, ash, cri, csr, p, s, m20, m10, m40, fc, yield, dmt_cost, netcost, max_fluidity_log_c, sodiumoxide_imputed, potassiumoxide_imputed, phosincoal_airdried_prox, csn, ash_airdried_prox, volatilematter_airdried_prox) FROM stdin;
\.


--
-- TOC entry 5131 (class 0 OID 41523)
-- Dependencies: 223
-- Data for Name: blend_recommendation_tracker; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.blend_recommendation_tracker (id, user_id, upload_status, creation_date, lastupdated_date, node_id, type) FROM stdin;
\.


--
-- TOC entry 5132 (class 0 OID 41526)
-- Dependencies: 224
-- Data for Name: blend_recommendation_tracker_temp; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.blend_recommendation_tracker_temp (id, user_id, upload_status, creation_date, lastupdated_date, node_id, type) FROM stdin;
\.


--
-- TOC entry 5133 (class 0 OID 41529)
-- Dependencies: 225
-- Data for Name: blend_recommendations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.blend_recommendations (id, simulation_id, coal_name, percentage, predicted_ash, predicted_vm, predicted_fc, predicted_csn, predicted_cri, predicted_csr, predicted_ash_final, predicted_vm_final, created_at) FROM stdin;
1	1	Mavis HCC	60	8.5	22.3	69.2	65	25.5	74.5	8.5	22.3	2025-06-02 14:00:49.282212+05:30
2	1	Southfork MV	40	9.2	24.1	66.7	62	28	72	9.2	24.1	2025-06-02 14:00:49.282212+05:30
3	2	Mavis HCC	60	8.5	22.3	69.2	65	25.5	74.5	8.5	22.3	2025-06-02 14:02:57.395182+05:30
4	2	Southfork MV	40	9.2	24.1	66.7	62	28	72	9.2	24.1	2025-06-02 14:02:57.395182+05:30
5	3	Mavis HCC	60	8.5	22.3	69.2	65	25.5	74.5	8.5	22.3	2025-06-02 14:05:31.407927+05:30
6	3	Southfork MV	40	9.2	24.1	66.7	62	28	72	9.2	24.1	2025-06-02 14:05:31.407927+05:30
7	4	Mavis HCC	60	8.5	22.3	69.2	65	25.5	74.5	8.5	22.3	2025-06-02 14:14:25.30437+05:30
8	4	Southfork MV	40	9.2	24.1	66.7	62	28	72	9.2	24.1	2025-06-02 14:14:25.30437+05:30
9	5	Mavis HCC	40	8.5	22.3	69.2	65	25.5	74.5	8.5	22.3	2025-06-02 15:26:42.9355+05:30
10	5	Southfork MV	35	8.5	22.3	69.2	65	25.5	74.5	8.5	22.3	2025-06-02 15:26:42.9355+05:30
11	5	Coal A	25	8.5	22.3	69.2	65	25.5	74.5	8.5	22.3	2025-06-02 15:26:42.9355+05:30
12	5	Mavis HCC	45	8.2	21.8	70	66	24.8	75.2	8.2	21.8	2025-06-02 15:26:42.9355+05:30
13	5	Southfork MV	30	8.2	21.8	70	66	24.8	75.2	8.2	21.8	2025-06-02 15:26:42.9355+05:30
14	5	Coal B	15	8.2	21.8	70	66	24.8	75.2	8.2	21.8	2025-06-02 15:26:42.9355+05:30
15	5	Coal C	10	8.2	21.8	70	66	24.8	75.2	8.2	21.8	2025-06-02 15:26:42.9355+05:30
16	5	Mavis HCC	50	8.8	22.8	68.4	64	26.2	73.8	8.8	22.8	2025-06-02 15:26:42.9355+05:30
17	5	Southfork MV	30	8.8	22.8	68.4	64	26.2	73.8	8.8	22.8	2025-06-02 15:26:42.9355+05:30
18	5	Coal D	20	8.8	22.8	68.4	64	26.2	73.8	8.8	22.8	2025-06-02 15:26:42.9355+05:30
19	6	Mavis HCC	40	8.5	22.3	69.2	65	25.5	74.5	8.5	22.3	2025-06-02 15:32:26.265492+05:30
20	6	Southfork MV	35	8.5	22.3	69.2	65	25.5	74.5	8.5	22.3	2025-06-02 15:32:26.265492+05:30
21	6	Coal A	25	8.5	22.3	69.2	65	25.5	74.5	8.5	22.3	2025-06-02 15:32:26.265492+05:30
22	6	Mavis HCC	45	8.2	21.8	70	66	24.8	75.2	8.2	21.8	2025-06-02 15:32:26.265492+05:30
23	6	Southfork MV	30	8.2	21.8	70	66	24.8	75.2	8.2	21.8	2025-06-02 15:32:26.265492+05:30
24	6	Coal B	15	8.2	21.8	70	66	24.8	75.2	8.2	21.8	2025-06-02 15:32:26.265492+05:30
25	6	Coal C	10	8.2	21.8	70	66	24.8	75.2	8.2	21.8	2025-06-02 15:32:26.265492+05:30
26	6	Mavis HCC	50	8.8	22.8	68.4	64	26.2	73.8	8.8	22.8	2025-06-02 15:32:26.265492+05:30
27	6	Southfork MV	30	8.8	22.8	68.4	64	26.2	73.8	8.8	22.8	2025-06-02 15:32:26.265492+05:30
28	6	Coal D	20	8.8	22.8	68.4	64	26.2	73.8	8.8	22.8	2025-06-02 15:32:26.265492+05:30
29	7	Mavis HCC	40	8.5	22.3	69.2	65	25.5	74.5	8.5	22.3	2025-06-09 11:52:36.199413+05:30
30	7	Southfork MV	35	8.5	22.3	69.2	65	25.5	74.5	8.5	22.3	2025-06-09 11:52:36.199413+05:30
31	7	Coal A	25	8.5	22.3	69.2	65	25.5	74.5	8.5	22.3	2025-06-09 11:52:36.199413+05:30
32	7	Mavis HCC	45	8.2	21.8	70	66	24.8	75.2	8.2	21.8	2025-06-09 11:52:36.199413+05:30
33	7	Southfork MV	30	8.2	21.8	70	66	24.8	75.2	8.2	21.8	2025-06-09 11:52:36.199413+05:30
34	7	Coal B	15	8.2	21.8	70	66	24.8	75.2	8.2	21.8	2025-06-09 11:52:36.199413+05:30
35	7	Coal C	10	8.2	21.8	70	66	24.8	75.2	8.2	21.8	2025-06-09 11:52:36.199413+05:30
36	7	Mavis HCC	50	8.8	22.8	68.4	64	26.2	73.8	8.8	22.8	2025-06-09 11:52:36.199413+05:30
37	7	Southfork MV	30	8.8	22.8	68.4	64	26.2	73.8	8.8	22.8	2025-06-09 11:52:36.199413+05:30
38	7	Coal D	20	8.8	22.8	68.4	64	26.2	73.8	8.8	22.8	2025-06-09 11:52:36.199413+05:30
39	13	Illawara (PHCC)	85	9.969631217014342	24.369262896240006	64.81674617686818	5.71575035608447	22.048522319624826	69.35792043650791	13.335566522366523	0.7601850000000004	2025-06-09 12:54:26.968403+05:30
40	13	Teck Venture	10	9.969631217014342	24.369262896240006	64.81674617686818	5.71575035608447	22.048522319624826	69.35792043650791	13.335566522366523	0.7601850000000004	2025-06-09 12:54:26.968403+05:30
41	13	Caval Ridge	5	9.969631217014342	24.369262896240006	64.81674617686818	5.71575035608447	22.048522319624826	69.35792043650791	13.335566522366523	0.7601850000000004	2025-06-09 12:54:26.968403+05:30
42	14	Illawara (PHCC)	80	9.981282804221722	24.28249202317464	64.82845969539152	5.705485805839391	21.97459791486292	69.68666876984126	13.350546522366525	0.7612800000000004	2025-06-09 13:33:40.49965+05:30
43	14	Caval Ridge	5	9.981282804221722	24.28249202317464	64.82845969539152	5.705485805839391	21.97459791486292	69.68666876984126	13.350546522366525	0.7612800000000004	2025-06-09 13:33:40.49965+05:30
44	14	Teck Venture	15	9.981282804221722	24.28249202317464	64.82845969539152	5.705485805839391	21.97459791486292	69.68666876984126	13.350546522366525	0.7612800000000004	2025-06-09 13:33:40.49965+05:30
45	16	Illawara (PHCC)	60	10.18243198392485	24.251032777286067	64.60679567426565	5.7079957264675	22.289010238095248	67.6067426839827	13.29084167388167	0.7750158333333337	2025-06-09 14:20:32.814127+05:30
46	16	PDN	25	10.18243198392485	24.251032777286067	64.60679567426565	5.7079957264675	22.289010238095248	67.6067426839827	13.29084167388167	0.7750158333333337	2025-06-09 14:20:32.814127+05:30
47	16	Elga	15	10.18243198392485	24.251032777286067	64.60679567426565	5.7079957264675	22.289010238095248	67.6067426839827	13.29084167388167	0.7750158333333337	2025-06-09 14:20:32.814127+05:30
48	19	Illawara (PHCC)	40	10.35093570086293	23.326391904223097	64.47756935145486	6.056721204701197	21.97165984126985	69.71644488095237	13.717660735930739	0.7806870634920637	2025-06-09 16:43:42.632993+05:30
49	19	Teck Venture	25	10.35093570086293	23.326391904223097	64.47756935145486	6.056721204701197	21.97165984126985	69.71644488095237	13.717660735930739	0.7806870634920637	2025-06-09 16:43:42.632993+05:30
50	19	Caval Ridge	35	10.35093570086293	23.326391904223097	64.47756935145486	6.056721204701197	21.97165984126985	69.71644488095237	13.717660735930739	0.7806870634920637	2025-06-09 16:43:42.632993+05:30
51	20	Caval Ridge	5	10.225080475767074	24.369285766802236	64.9268950919958	5.725219932790806	22.038417557720063	68.22112476190478	13.308291046176048	0.7647300000000005	2025-06-10 10:53:53.981503+05:30
52	20	Illawara (PHCC)	90	10.225080475767074	24.369285766802236	64.9268950919958	5.725219932790806	22.038417557720063	68.22112476190478	13.308291046176048	0.7647300000000005	2025-06-10 10:53:53.981503+05:30
53	20	Elga	5	10.225080475767074	24.369285766802236	64.9268950919958	5.725219932790806	22.038417557720063	68.22112476190478	13.308291046176048	0.7647300000000005	2025-06-10 10:53:53.981503+05:30
54	21	Caval Ridge	5	9.981282804221722	24.28249202317464	64.82845969539152	5.705485805839391	21.97459791486292	69.68666876984126	13.350546522366525	0.7612800000000004	2025-06-10 11:26:40.712161+05:30
55	21	Illawara (PHCC)	80	9.981282804221722	24.28249202317464	64.82845969539152	5.705485805839391	21.97459791486292	69.68666876984126	13.350546522366525	0.7612800000000004	2025-06-10 11:26:40.712161+05:30
56	21	Teck Venture	15	9.981282804221722	24.28249202317464	64.82845969539152	5.705485805839391	21.97459791486292	69.68666876984126	13.350546522366525	0.7612800000000004	2025-06-10 11:26:40.712161+05:30
57	22	Caval Ridge	5	9.981282804221722	24.28249202317464	64.82845969539152	5.705485805839391	21.97459791486292	69.68666876984126	13.350546522366525	0.7612800000000004	2025-06-10 11:37:46.492063+05:30
58	22	Illawara (PHCC)	80	9.981282804221722	24.28249202317464	64.82845969539152	5.705485805839391	21.97459791486292	69.68666876984126	13.350546522366525	0.7612800000000004	2025-06-10 11:37:46.492063+05:30
59	22	Teck Venture	15	9.981282804221722	24.28249202317464	64.82845969539152	5.705485805839391	21.97459791486292	69.68666876984126	13.350546522366525	0.7612800000000004	2025-06-10 11:37:46.492063+05:30
60	23	Teck Venture	15	9.981282804221722	24.28249202317464	64.82845969539152	5.705485805839391	21.97459791486292	69.68666876984126	13.350546522366525	0.7612800000000004	2025-06-10 11:43:18.13128+05:30
61	23	Illawara (PHCC)	80	9.981282804221722	24.28249202317464	64.82845969539152	5.705485805839391	21.97459791486292	69.68666876984126	13.350546522366525	0.7612800000000004	2025-06-10 11:43:18.13128+05:30
62	23	Caval Ridge	5	9.981282804221722	24.28249202317464	64.82845969539152	5.705485805839391	21.97459791486292	69.68666876984126	13.350546522366525	0.7612800000000004	2025-06-10 11:43:18.13128+05:30
63	24	Illawara (PHCC)	80	9.981282804221722	24.28249202317464	64.82845969539152	5.705485805839391	21.97459791486292	69.68666876984126	13.350546522366525	0.7612800000000004	2025-06-10 11:51:25.515285+05:30
64	24	Teck Venture	15	9.981282804221722	24.28249202317464	64.82845969539152	5.705485805839391	21.97459791486292	69.68666876984126	13.350546522366525	0.7612800000000004	2025-06-10 11:51:25.515285+05:30
65	24	Caval Ridge	5	9.981282804221722	24.28249202317464	64.82845969539152	5.705485805839391	21.97459791486292	69.68666876984126	13.350546522366525	0.7612800000000004	2025-06-10 11:51:25.515285+05:30
66	25	Illawara (PHCC)	80	9.981282804221722	24.28249202317464	64.82845969539152	5.705485805839391	21.97459791486292	69.68666876984126	13.350546522366525	0.7612800000000004	2025-06-10 11:59:27.760456+05:30
67	25	Caval Ridge	5	9.981282804221722	24.28249202317464	64.82845969539152	5.705485805839391	21.97459791486292	69.68666876984126	13.350546522366525	0.7612800000000004	2025-06-10 11:59:27.760456+05:30
68	25	Teck Venture	15	9.981282804221722	24.28249202317464	64.82845969539152	5.705485805839391	21.97459791486292	69.68666876984126	13.350546522366525	0.7612800000000004	2025-06-10 11:59:27.760456+05:30
69	26	Caval Ridge	5	9.981282804221722	24.28249202317464	64.82845969539152	5.705485805839391	21.97459791486292	69.68666876984126	13.350546522366525	0.7612800000000004	2025-06-10 12:03:38.910404+05:30
70	26	Illawara (PHCC)	80	9.981282804221722	24.28249202317464	64.82845969539152	5.705485805839391	21.97459791486292	69.68666876984126	13.350546522366525	0.7612800000000004	2025-06-10 12:03:38.910404+05:30
71	26	Teck Venture	15	9.981282804221722	24.28249202317464	64.82845969539152	5.705485805839391	21.97459791486292	69.68666876984126	13.350546522366525	0.7612800000000004	2025-06-10 12:03:38.910404+05:30
72	27	Illawara (PHCC)	80	9.981282804221722	24.28249202317464	64.82845969539152	5.705485805839391	21.97459791486292	69.68666876984126	13.350546522366525	0.7612800000000004	2025-06-10 12:10:29.798898+05:30
73	27	Teck Venture	15	9.981282804221722	24.28249202317464	64.82845969539152	5.705485805839391	21.97459791486292	69.68666876984126	13.350546522366525	0.7612800000000004	2025-06-10 12:10:29.798898+05:30
74	27	Caval Ridge	5	9.981282804221722	24.28249202317464	64.82845969539152	5.705485805839391	21.97459791486292	69.68666876984126	13.350546522366525	0.7612800000000004	2025-06-10 12:10:29.798898+05:30
75	28	Illawara (PHCC)	40	10.35093570086293	23.326391904223097	64.47756935145486	6.056721204701197	21.97165984126985	69.71644488095237	13.717660735930739	0.7806870634920637	2025-06-10 12:16:33.052443+05:30
76	28	Caval Ridge	35	10.35093570086293	23.326391904223097	64.47756935145486	6.056721204701197	21.97165984126985	69.71644488095237	13.717660735930739	0.7806870634920637	2025-06-10 12:16:33.052443+05:30
77	28	Teck Venture	25	10.35093570086293	23.326391904223097	64.47756935145486	6.056721204701197	21.97165984126985	69.71644488095237	13.717660735930739	0.7806870634920637	2025-06-10 12:16:33.052443+05:30
78	29	Caval Ridge	5	9.981282804221722	24.28249202317464	64.82845969539152	5.705485805839391	21.97459791486292	69.68666876984126	13.350546522366525	0.7612800000000004	2025-06-10 12:20:17.732014+05:30
79	29	Illawara (PHCC)	80	9.981282804221722	24.28249202317464	64.82845969539152	5.705485805839391	21.97459791486292	69.68666876984126	13.350546522366525	0.7612800000000004	2025-06-10 12:20:17.732014+05:30
80	29	Teck Venture	15	9.981282804221722	24.28249202317464	64.82845969539152	5.705485805839391	21.97459791486292	69.68666876984126	13.350546522366525	0.7612800000000004	2025-06-10 12:20:17.732014+05:30
81	30	Caval Ridge	5	9.981282804221722	24.28249202317464	64.82845969539152	5.705485805839391	21.97459791486292	69.68666876984126	13.350546522366525	0.7612800000000004	2025-06-10 12:26:48.363119+05:30
82	30	Illawara (PHCC)	80	9.981282804221722	24.28249202317464	64.82845969539152	5.705485805839391	21.97459791486292	69.68666876984126	13.350546522366525	0.7612800000000004	2025-06-10 12:26:48.363119+05:30
83	30	Teck Venture	15	9.981282804221722	24.28249202317464	64.82845969539152	5.705485805839391	21.97459791486292	69.68666876984126	13.350546522366525	0.7612800000000004	2025-06-10 12:26:48.363119+05:30
84	31	Teck Venture	15	9.981282804221722	24.28249202317464	64.82845969539152	5.705485805839391	21.97459791486292	69.68666876984126	13.350546522366525	0.7612800000000004	2025-06-10 12:32:06.384369+05:30
85	31	Caval Ridge	5	9.981282804221722	24.28249202317464	64.82845969539152	5.705485805839391	21.97459791486292	69.68666876984126	13.350546522366525	0.7612800000000004	2025-06-10 12:32:06.384369+05:30
86	31	Illawara (PHCC)	80	9.981282804221722	24.28249202317464	64.82845969539152	5.705485805839391	21.97459791486292	69.68666876984126	13.350546522366525	0.7612800000000004	2025-06-10 12:32:06.384369+05:30
87	32	Caval Ridge	5	9.981282804221722	24.28249202317464	64.82845969539152	5.705485805839391	21.97459791486292	69.68666876984126	13.350546522366525	0.7612800000000004	2025-06-10 12:37:49.152004+05:30
88	32	Teck Venture	15	9.981282804221722	24.28249202317464	64.82845969539152	5.705485805839391	21.97459791486292	69.68666876984126	13.350546522366525	0.7612800000000004	2025-06-10 12:37:49.152004+05:30
89	32	Illawara (PHCC)	80	9.981282804221722	24.28249202317464	64.82845969539152	5.705485805839391	21.97459791486292	69.68666876984126	13.350546522366525	0.7612800000000004	2025-06-10 12:37:49.152004+05:30
90	33	Caval Ridge	5	9.981282804221722	24.28249202317464	64.82845969539152	5.705485805839391	21.97459791486292	69.68666876984126	13.350546522366525	0.7612800000000004	2025-06-10 12:42:52.384624+05:30
91	33	Illawara (PHCC)	80	9.981282804221722	24.28249202317464	64.82845969539152	5.705485805839391	21.97459791486292	69.68666876984126	13.350546522366525	0.7612800000000004	2025-06-10 12:42:52.384624+05:30
92	33	Teck Venture	15	9.981282804221722	24.28249202317464	64.82845969539152	5.705485805839391	21.97459791486292	69.68666876984126	13.350546522366525	0.7612800000000004	2025-06-10 12:42:52.384624+05:30
93	34	Illawara (PHCC)	70	10.23987955013381	23.90787439565559	64.94321477480187	5.723055250286474	21.94062648629149	69.6479932142857	13.660678831168832	0.7637316666666671	2025-06-10 14:04:12.478607+05:30
94	34	Caval Ridge	10	10.23987955013381	23.90787439565559	64.94321477480187	5.723055250286474	21.94062648629149	69.6479932142857	13.660678831168832	0.7637316666666671	2025-06-10 14:04:12.478607+05:30
95	34	Teck Venture	20	10.23987955013381	23.90787439565559	64.94321477480187	5.723055250286474	21.94062648629149	69.6479932142857	13.660678831168832	0.7637316666666671	2025-06-10 14:04:12.478607+05:30
96	35	Caval Ridge	5	9.981282804221722	24.28249202317464	64.82845969539152	5.705485805839391	21.97459791486292	69.68666876984126	13.350546522366525	0.7612800000000004	2025-06-10 14:09:20.067317+05:30
97	35	Teck Venture	15	9.981282804221722	24.28249202317464	64.82845969539152	5.705485805839391	21.97459791486292	69.68666876984126	13.350546522366525	0.7612800000000004	2025-06-10 14:09:20.067317+05:30
98	35	Illawara (PHCC)	80	9.981282804221722	24.28249202317464	64.82845969539152	5.705485805839391	21.97459791486292	69.68666876984126	13.350546522366525	0.7612800000000004	2025-06-10 14:09:20.067317+05:30
99	36	Caval Ridge	5	9.981282804221722	24.28249202317464	64.82845969539152	5.705485805839391	21.97459791486292	69.68666876984126	13.350546522366525	0.7612800000000004	2025-06-10 14:16:08.564707+05:30
100	36	Teck Venture	15	9.981282804221722	24.28249202317464	64.82845969539152	5.705485805839391	21.97459791486292	69.68666876984126	13.350546522366525	0.7612800000000004	2025-06-10 14:16:08.564707+05:30
101	36	Illawara (PHCC)	80	9.981282804221722	24.28249202317464	64.82845969539152	5.705485805839391	21.97459791486292	69.68666876984126	13.350546522366525	0.7612800000000004	2025-06-10 14:16:08.564707+05:30
102	37	Illawara (PHCC)	40	10.35093570086293	23.326391904223097	64.47756935145486	6.056721204701197	21.97165984126985	69.71644488095237	13.717660735930739	0.7806870634920637	2025-06-10 14:20:52.716225+05:30
103	37	Caval Ridge	35	10.35093570086293	23.326391904223097	64.47756935145486	6.056721204701197	21.97165984126985	69.71644488095237	13.717660735930739	0.7806870634920637	2025-06-10 14:20:52.716225+05:30
104	37	Teck Venture	25	10.35093570086293	23.326391904223097	64.47756935145486	6.056721204701197	21.97165984126985	69.71644488095237	13.717660735930739	0.7806870634920637	2025-06-10 14:20:52.716225+05:30
105	38	Illawara (PHCC)	45	9.95258965619962	23.552015777500966	65.24975402880555	6.031105935707238	21.903072597402602	69.64957094155844	13.366623910533908	0.783879126984127	2025-06-10 14:28:43.033234+05:30
106	38	Caval Ridge	35	9.95258965619962	23.552015777500966	65.24975402880555	6.031105935707238	21.903072597402602	69.64957094155844	13.366623910533908	0.783879126984127	2025-06-10 14:28:43.033234+05:30
107	38	Eagle crrek	20	9.95258965619962	23.552015777500966	65.24975402880555	6.031105935707238	21.903072597402602	69.64957094155844	13.366623910533908	0.783879126984127	2025-06-10 14:28:43.033234+05:30
108	42	Illawara (PHCC)	80	9.981282804221722	24.28249202317464	64.82845969539152	5.705485805839391	21.97459791486292	69.68666876984126	13.350546522366525	0.7612800000000004	2025-06-10 14:56:05.773257+05:30
109	42	Teck Venture	15	9.981282804221722	24.28249202317464	64.82845969539152	5.705485805839391	21.97459791486292	69.68666876984126	13.350546522366525	0.7612800000000004	2025-06-10 14:56:05.773257+05:30
110	42	Caval Ridge	5	9.981282804221722	24.28249202317464	64.82845969539152	5.705485805839391	21.97459791486292	69.68666876984126	13.350546522366525	0.7612800000000004	2025-06-10 14:56:05.773257+05:30
111	43	Illawara (PHCC)	80	9.981282804221722	24.28249202317464	64.82845969539152	5.705485805839391	21.97459791486292	69.68666876984126	13.350546522366525	0.7612800000000004	2025-06-10 15:00:17.27872+05:30
112	43	Caval Ridge	5	9.981282804221722	24.28249202317464	64.82845969539152	5.705485805839391	21.97459791486292	69.68666876984126	13.350546522366525	0.7612800000000004	2025-06-10 15:00:17.27872+05:30
113	43	Teck Venture	15	9.981282804221722	24.28249202317464	64.82845969539152	5.705485805839391	21.97459791486292	69.68666876984126	13.350546522366525	0.7612800000000004	2025-06-10 15:00:17.27872+05:30
114	49	Caval Ridge	5	9.981282804221722	24.28249202317464	64.82845969539152	5.705485805839391	21.97459791486292	69.68666876984126	13.350546522366525	0.7612800000000004	2025-06-10 23:28:27.42117+05:30
115	49	Illawara (PHCC)	80	9.981282804221722	24.28249202317464	64.82845969539152	5.705485805839391	21.97459791486292	69.68666876984126	13.350546522366525	0.7612800000000004	2025-06-10 23:28:27.42117+05:30
116	49	Teck Venture	15	9.981282804221722	24.28249202317464	64.82845969539152	5.705485805839391	21.97459791486292	69.68666876984126	13.350546522366525	0.7612800000000004	2025-06-10 23:28:27.42117+05:30
117	50	Illawara (PHCC)	70	10.23987955013381	23.90787439565559	64.94321477480187	5.723055250286474	21.94062648629149	69.6479932142857	13.660678831168832	0.7637316666666671	2025-06-10 23:33:58.067937+05:30
118	50	Caval Ridge	10	10.23987955013381	23.90787439565559	64.94321477480187	5.723055250286474	21.94062648629149	69.6479932142857	13.660678831168832	0.7637316666666671	2025-06-10 23:33:58.067937+05:30
119	50	Teck Venture	20	10.23987955013381	23.90787439565559	64.94321477480187	5.723055250286474	21.94062648629149	69.6479932142857	13.660678831168832	0.7637316666666671	2025-06-10 23:33:58.067937+05:30
120	51	Leer/Russian HFCC	37	10.167897512993724	24.17605927220309	65.0654070103607	5.743378968209998	22.184663888888885	66.82946458874461	13.302802196969695	0.7778048809523808	2025-06-10 23:41:16.759475+05:30
121	51	Caval Ridge	9	10.167897512993724	24.17605927220309	65.0654070103607	5.743378968209998	22.184663888888885	66.82946458874461	13.302802196969695	0.7778048809523808	2025-06-10 23:41:16.759475+05:30
122	51	Illawara (PHCC)	53	10.167897512993724	24.17605927220309	65.0654070103607	5.743378968209998	22.184663888888885	66.82946458874461	13.302802196969695	0.7778048809523808	2025-06-10 23:41:16.759475+05:30
123	52	Caval Ridge	5	9.981282804221722	24.28249202317464	64.82845969539152	5.705485805839391	21.97459791486292	69.68666876984126	13.350546522366525	0.7612800000000004	2025-06-10 23:45:42.297131+05:30
124	52	Teck Venture	15	9.981282804221722	24.28249202317464	64.82845969539152	5.705485805839391	21.97459791486292	69.68666876984126	13.350546522366525	0.7612800000000004	2025-06-10 23:45:42.297131+05:30
125	52	Illawara (PHCC)	80	9.981282804221722	24.28249202317464	64.82845969539152	5.705485805839391	21.97459791486292	69.68666876984126	13.350546522366525	0.7612800000000004	2025-06-10 23:45:42.297131+05:30
126	56	Illawara (PHCC)	63	10.134440079251075	24.210307420303092	64.9516669178496	5.7701742978832025	22.198211190476194	68.0602276839827	13.214030966810963	0.7824896428571432	2025-06-10 23:56:48.161624+05:30
127	56	Caval Ridge	4	10.134440079251075	24.210307420303092	64.9516669178496	5.7701742978832025	22.198211190476194	68.0602276839827	13.214030966810963	0.7824896428571432	2025-06-10 23:56:48.161624+05:30
128	56	Leer/Russian HFCC	32	10.134440079251075	24.210307420303092	64.9516669178496	5.7701742978832025	22.198211190476194	68.0602276839827	13.214030966810963	0.7824896428571432	2025-06-10 23:56:48.161624+05:30
129	61	Daunia (SHCC)	4	9.959950317503166	24.303886467564634	64.81177017154269	5.726616758231927	21.975776486291494	69.64694988095238	13.334441522366522	0.764536666666667	2025-06-11 00:15:28.539552+05:30
130	61	Illawara (PHCC)	88	9.959950317503166	24.303886467564634	64.81177017154269	5.726616758231927	21.975776486291494	69.64694988095238	13.334441522366522	0.764536666666667	2025-06-11 00:15:28.539552+05:30
131	61	Teck Venture	8	9.959950317503166	24.303886467564634	64.81177017154269	5.726616758231927	21.975776486291494	69.64694988095238	13.334441522366522	0.764536666666667	2025-06-11 00:15:28.539552+05:30
132	62	Illawara (PHCC)	59	10.121038650525598	24.246735555011067	64.60261234094064	5.7079957264675	22.23876023809525	67.53508435064938	13.330359610389609	0.7762408333333337	2025-06-11 00:25:48.945593+05:30
133	62	Elga	14	10.121038650525598	24.246735555011067	64.60261234094064	5.7079957264675	22.23876023809525	67.53508435064938	13.330359610389609	0.7762408333333337	2025-06-11 00:25:48.945593+05:30
134	62	PDN	26	10.121038650525598	24.246735555011067	64.60261234094064	5.7079957264675	22.23876023809525	67.53508435064938	13.330359610389609	0.7762408333333337	2025-06-11 00:25:48.945593+05:30
135	63	Illawara (PHCC)	73	9.952513598122628	23.48300299985988	64.57632559501903	5.7858052502593935	22.13982220057721	69.23027821428572	13.250832474747476	0.7972800793650796	2025-06-11 00:35:00.751516+05:30
136	63	Caval Ridge	11	9.952513598122628	23.48300299985988	64.57632559501903	5.7858052502593935	22.13982220057721	69.23027821428572	13.250832474747476	0.7972800793650796	2025-06-11 00:35:00.751516+05:30
137	63	Eagle crrek	15	9.952513598122628	23.48300299985988	64.57632559501903	5.7858052502593935	22.13982220057721	69.23027821428572	13.250832474747476	0.7972800793650796	2025-06-11 00:35:00.751516+05:30
138	68	Caval Ridge	13	10.069266375847008	23.48959010280453	64.58121596532736	5.78302747247106	22.133255533910546	69.21569488095237	13.256472474747472	0.7956100793650797	2025-06-12 11:33:58.73618+05:30
139	68	Illawara (PHCC)	73	10.069266375847008	23.48959010280453	64.58121596532736	5.78302747247106	22.133255533910546	69.21569488095237	13.256472474747472	0.7956100793650797	2025-06-12 11:33:58.73618+05:30
140	68	Eagle crrek	13	10.069266375847008	23.48959010280453	64.58121596532736	5.78302747247106	22.133255533910546	69.21569488095237	13.256472474747472	0.7956100793650797	2025-06-12 11:33:58.73618+05:30
141	69	Illawara (PHCC)	54	10.128829364895337	24.183050938886428	64.9941639548607	5.748795634882498	22.120113888888888	67.80717435064936	13.293346244588742	0.7770715476190475	2025-06-12 11:44:05.48707+05:30
142	69	Caval Ridge	9	10.128829364895337	24.183050938886428	64.9941639548607	5.748795634882498	22.120113888888888	67.80717435064936	13.293346244588742	0.7770715476190475	2025-06-12 11:44:05.48707+05:30
143	69	Leer/Russian HFCC	36	10.128829364895337	24.183050938886428	64.9941639548607	5.748795634882498	22.120113888888888	67.80717435064936	13.293346244588742	0.7770715476190475	2025-06-12 11:44:05.48707+05:30
144	70	Caval Ridge	13	10.069266375847008	23.48959010280453	64.58121596532736	5.78302747247106	22.133255533910546	69.21569488095237	13.256472474747472	0.7956100793650797	2025-06-12 11:55:03.933186+05:30
145	70	Eagle crrek	13	10.069266375847008	23.48959010280453	64.58121596532736	5.78302747247106	22.133255533910546	69.21569488095237	13.256472474747472	0.7956100793650797	2025-06-12 11:55:03.933186+05:30
146	70	Illawara (PHCC)	73	10.069266375847008	23.48959010280453	64.58121596532736	5.78302747247106	22.133255533910546	69.21569488095237	13.256472474747472	0.7956100793650797	2025-06-12 11:55:03.933186+05:30
147	71	Caval Ridge	8	10.080849709147008	23.90778319816405	64.92155432517295	5.774763583592726	22.115158867243878	69.23626154761904	13.22647414141414	0.7973300793650795	2025-06-12 12:23:11.745074+05:30
148	71	Illawara (PHCC)	78	10.080849709147008	23.90778319816405	64.92155432517295	5.774763583592726	22.115158867243878	69.23626154761904	13.22647414141414	0.7973300793650795	2025-06-12 12:23:11.745074+05:30
149	71	Eagle crrek	13	10.080849709147008	23.90778319816405	64.92155432517295	5.774763583592726	22.115158867243878	69.23626154761904	13.22647414141414	0.7973300793650795	2025-06-12 12:23:11.745074+05:30
\.


--
-- TOC entry 5135 (class 0 OID 41534)
-- Dependencies: 227
-- Data for Name: coal_blend_ratio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coal_blend_ratio (blend_id, "Riverside", "Moranbah North", "Illawara (PHCC)", "Goonyella", "Caval Ridge", "PDN", "Poitrel", "Amonate", "Aus.SHCC", "Teck Venture", "Lake Vermont", "Metropolitan", "Indonasian", "Low Ash SHCC/ SHCC-BHP", "Eagle crrek", "Dhamra SHCC PDN", "Daunia (SHCC)", "Leer", "Elga", "Leer/Russian HFCC", "Uvalnaya", "Blue creek", "Mt. Laurel", "R.PCI", "E.Soft", "Indian Coal Dhanbaad", "Scratch Coal", "HCC/ SHCC Contaminated Coal") FROM stdin;
1	\N	\N	\N	40	\N	\N	32	\N	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	16	\N	\N	\N	\N
2	\N	\N	\N	40	\N	\N	32	\N	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	16	\N	\N	\N	\N
3	\N	\N	\N	34	\N	\N	38	\N	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	16	\N	\N	\N	\N
4	\N	\N	\N	34	\N	\N	38	\N	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	16	\N	\N	\N	\N
5	\N	\N	\N	34	\N	\N	38	\N	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	16	\N	\N	\N	\N
6	\N	\N	\N	40	\N	\N	32	\N	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	16	\N	\N	\N	\N
7	\N	\N	\N	40	\N	\N	32	\N	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	16	\N	\N	\N	\N
8	\N	\N	\N	40	\N	\N	32	\N	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	16	\N	\N	\N	\N
9	\N	\N	\N	40	\N	\N	29	\N	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	16	\N	\N	\N	\N
10	\N	\N	\N	45	\N	\N	29	\N	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	11	\N	\N	\N	\N
11	\N	\N	\N	45	\N	\N	29	\N	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	11	\N	\N	\N	\N
12	\N	\N	\N	45	\N	\N	29	\N	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	11	\N	\N	\N	\N
13	\N	\N	\N	45	\N	\N	29	\N	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	11	\N	\N	\N	\N
14	\N	\N	\N	45	\N	\N	29	\N	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	11	\N	\N	\N	\N
15	\N	\N	\N	\N	39	\N	13	\N	\N	\N	\N	\N	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	10	8	\N	\N	\N	\N
16	\N	\N	\N	\N	39	\N	13	\N	\N	\N	\N	\N	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	10	8	\N	\N	\N	\N
17	\N	\N	\N	\N	39	\N	13	\N	\N	\N	\N	\N	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	10	8	\N	\N	\N	\N
18	\N	\N	\N	\N	39	\N	13	\N	\N	\N	\N	\N	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	10	8	\N	\N	\N	\N
19	\N	\N	\N	\N	39	\N	13	\N	\N	\N	\N	\N	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	10	8	\N	\N	\N	\N
20	\N	\N	\N	\N	39	\N	13	\N	\N	\N	\N	\N	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	10	8	\N	\N	\N	\N
21	\N	\N	\N	\N	36	\N	13	\N	\N	\N	\N	\N	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	10	11	\N	\N	\N	\N
22	\N	\N	\N	\N	36	\N	13	\N	\N	\N	\N	\N	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	10	11	\N	\N	\N	\N
23	\N	\N	\N	\N	36	\N	13	\N	\N	\N	\N	\N	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	10	11	\N	\N	\N	\N
24	\N	\N	\N	\N	36	\N	13	\N	\N	\N	\N	\N	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	10	11	\N	\N	\N	\N
25	\N	\N	\N	\N	36	\N	13	\N	\N	\N	\N	\N	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	10	11	\N	\N	\N	\N
26	\N	\N	\N	\N	34	\N	41	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	10	\N	\N	5	\N
27	\N	\N	\N	\N	34	\N	41	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	10	\N	\N	5	\N
28	\N	\N	\N	\N	34	\N	41	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	10	\N	\N	5	\N
29	\N	\N	\N	\N	34	\N	41	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	10	\N	\N	5	\N
30	\N	\N	\N	\N	36	\N	41	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	8	\N	\N	5	\N
31	\N	\N	\N	\N	36	\N	41	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	8	\N	\N	5	\N
32	\N	\N	\N	\N	37	\N	41	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	7	\N	\N	5	\N
33	\N	\N	\N	\N	37	\N	41	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	7	\N	\N	5	\N
34	\N	\N	\N	\N	37	\N	41	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	7	\N	\N	5	\N
35	\N	\N	\N	\N	37	\N	41	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	7	\N	\N	5	\N
36	\N	\N	\N	\N	37	\N	41	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	7	\N	\N	5	\N
37	\N	\N	\N	\N	37	\N	41	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	7	\N	\N	5	\N
38	\N	\N	\N	\N	39	\N	39	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	7	\N	\N	5	\N
39	\N	\N	\N	\N	39	\N	39	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	7	\N	\N	5	\N
40	\N	\N	\N	\N	39	\N	39	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	7	\N	\N	5	\N
41	\N	\N	\N	\N	40	\N	37	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	8	\N	\N	5	\N
42	\N	\N	\N	\N	40	\N	37	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	8	\N	\N	5	\N
43	\N	\N	\N	\N	40	\N	37	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	8	\N	\N	5	\N
44	\N	\N	\N	\N	45	\N	22	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9	14	\N	\N	10	\N
45	\N	\N	\N	\N	45	\N	22	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9	14	\N	\N	10	\N
46	\N	\N	\N	\N	45	\N	22	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9	14	\N	\N	10	\N
47	\N	\N	\N	16	30	\N	12	\N	15	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9	7	\N	\N	11	\N
48	\N	\N	\N	16	30	\N	12	\N	15	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9	7	\N	\N	11	\N
49	\N	\N	\N	16	30	\N	12	\N	15	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9	7	\N	\N	11	\N
50	\N	\N	\N	16	30	\N	14	\N	13	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7	9	\N	\N	11	\N
51	\N	\N	\N	16	30	\N	14	\N	13	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7	9	\N	\N	11	\N
52	\N	\N	\N	13	20	\N	25	\N	14	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9	6	\N	\N	13	\N
53	\N	\N	\N	13	20	\N	25	\N	14	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9	6	\N	\N	13	\N
54	\N	\N	\N	13	20	\N	25	\N	14	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9	6	\N	\N	13	\N
55	\N	\N	\N	13	20	\N	25	\N	14	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9	6	\N	\N	13	\N
56	\N	\N	\N	\N	35	\N	25	\N	12	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9	6	\N	\N	13	\N
57	\N	\N	\N	\N	35	\N	25	\N	12	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9	6	\N	\N	13	\N
58	\N	\N	\N	\N	35	\N	25	\N	12	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9	6	\N	\N	13	\N
59	\N	\N	\N	\N	35	\N	25	\N	12	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9	6	\N	\N	13	\N
60	\N	\N	\N	\N	35	\N	25	\N	12	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9	6	\N	\N	13	\N
61	\N	\N	\N	\N	40	\N	25	\N	4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	13	10	\N	\N	8	\N
62	\N	\N	\N	\N	40	\N	25	\N	4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	13	10	\N	\N	8	\N
63	\N	\N	\N	\N	40	\N	25	\N	4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	13	10	\N	\N	8	\N
64	\N	\N	\N	\N	40	\N	25	\N	4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	13	10	\N	\N	8	\N
65	\N	\N	\N	\N	40	\N	25	\N	4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	13	10	\N	\N	8	\N
66	\N	\N	\N	\N	40	\N	25	\N	4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	13	10	\N	\N	8	\N
67	\N	\N	\N	\N	40	\N	25	\N	4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	13	10	\N	\N	8	\N
68	\N	\N	\N	\N	40	\N	25	\N	4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	13	10	\N	\N	8	\N
69	\N	\N	\N	\N	40	\N	25	\N	4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	13	10	\N	\N	8	\N
70	\N	\N	\N	\N	40	\N	25	\N	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	13	10	\N	\N	6	\N
71	\N	\N	\N	\N	\N	40	\N	\N	22	\N	\N	\N	\N	\N	10	\N	\N	\N	\N	\N	\N	\N	10	10	\N	\N	8	\N
72	\N	\N	\N	\N	\N	40	\N	\N	22	\N	\N	\N	\N	\N	10	\N	\N	\N	\N	\N	\N	\N	10	10	\N	\N	8	\N
73	\N	\N	\N	\N	\N	40	\N	\N	22	\N	\N	\N	\N	\N	10	\N	\N	\N	\N	\N	\N	\N	10	10	\N	\N	8	\N
74	\N	\N	\N	\N	\N	40	\N	\N	22	\N	\N	\N	\N	\N	10	\N	\N	\N	\N	\N	\N	\N	10	10	\N	\N	8	\N
75	\N	\N	\N	\N	\N	40	\N	\N	22	\N	\N	\N	\N	\N	10	\N	\N	\N	\N	\N	\N	\N	10	10	\N	\N	8	\N
76	\N	\N	\N	\N	\N	50	\N	\N	22	\N	\N	\N	\N	\N	10	\N	\N	\N	\N	\N	\N	\N	8	2	\N	\N	8	\N
77	\N	\N	\N	\N	\N	50	\N	\N	22	\N	\N	\N	\N	\N	10	\N	\N	\N	\N	\N	\N	\N	8	2	\N	\N	8	\N
78	\N	\N	\N	\N	\N	50	\N	\N	22	\N	\N	\N	\N	\N	10	\N	\N	\N	\N	\N	\N	\N	8	2	\N	\N	8	\N
79	\N	\N	\N	\N	\N	50	\N	\N	22	\N	\N	\N	\N	\N	10	\N	\N	\N	\N	\N	\N	\N	8	2	\N	\N	8	\N
80	\N	\N	\N	\N	\N	42	\N	\N	22	\N	\N	\N	\N	\N	10	\N	\N	\N	\N	\N	\N	\N	8	10	\N	\N	8	\N
81	\N	\N	\N	\N	\N	42	\N	\N	22	\N	\N	\N	\N	\N	10	\N	\N	\N	\N	\N	\N	\N	8	10	\N	\N	8	\N
82	\N	\N	\N	\N	\N	42	\N	\N	22	\N	\N	\N	\N	\N	10	\N	\N	\N	\N	\N	\N	\N	8	10	\N	\N	8	\N
83	\N	\N	\N	\N	\N	42	\N	\N	22	\N	\N	\N	\N	\N	10	\N	\N	\N	\N	\N	\N	\N	8	10	\N	\N	8	\N
84	\N	\N	\N	\N	\N	42	\N	\N	22	\N	\N	\N	\N	\N	10	\N	\N	\N	\N	\N	\N	\N	8	10	\N	\N	8	\N
85	\N	\N	\N	\N	\N	39	10	\N	25	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	12	\N	\N	4	\N
86	\N	\N	\N	\N	\N	39	10	\N	25	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	12	\N	\N	4	\N
87	\N	\N	\N	\N	\N	39	10	\N	25	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	12	\N	\N	4	\N
88	\N	\N	\N	\N	\N	39	10	\N	25	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	12	\N	\N	4	\N
89	\N	\N	\N	\N	\N	39	10	\N	25	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	12	\N	\N	4	\N
90	\N	\N	\N	\N	\N	41	10	\N	23	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	10	\N	\N	6	\N
91	\N	\N	\N	\N	\N	41	10	\N	23	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	10	\N	\N	6	\N
92	\N	\N	\N	\N	\N	41	10	\N	23	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	10	\N	\N	6	\N
93	\N	\N	\N	\N	\N	41	10	\N	23	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	10	\N	\N	6	\N
94	\N	\N	\N	\N	\N	41	10	\N	23	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	10	\N	\N	6	\N
95	\N	\N	\N	\N	\N	41	10	\N	23	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	10	\N	\N	6	\N
96	\N	\N	\N	\N	\N	41	10	\N	23	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	10	\N	\N	6	\N
97	\N	\N	\N	\N	\N	50	\N	\N	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	\N	\N	4	\N	\N	10	\N
98	\N	\N	\N	\N	\N	50	\N	\N	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	\N	\N	4	\N	\N	10	\N
99	\N	\N	\N	\N	\N	50	\N	\N	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	\N	\N	4	\N	\N	10	\N
100	\N	\N	\N	\N	\N	50	\N	\N	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	\N	\N	4	\N	\N	10	\N
101	\N	\N	\N	\N	\N	44	\N	\N	20	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	\N	10	\N	\N	6	\N
102	\N	\N	\N	\N	\N	44	\N	\N	20	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	\N	10	\N	\N	6	\N
103	\N	\N	\N	\N	\N	44	\N	\N	27	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	14	\N	\N	\N	5	\N	\N	10	\N
104	\N	\N	\N	\N	59	\N	\N	\N	27	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	14	\N	\N	\N	\N	\N	\N	\N	\N
105	\N	\N	\N	\N	\N	44	\N	\N	27	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	14	\N	\N	\N	5	\N	\N	10	\N
106	\N	\N	\N	\N	24	20	\N	\N	21	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	\N	5	\N	\N	10	\N
107	\N	\N	\N	\N	24	20	\N	\N	21	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	\N	5	\N	\N	10	\N
108	\N	\N	\N	\N	24	20	\N	\N	21	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	\N	5	\N	\N	10	\N
109	\N	\N	\N	\N	24	20	\N	\N	21	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	\N	5	\N	\N	10	\N
110	\N	27	\N	\N	\N	\N	\N	\N	\N	\N	41	\N	\N	\N	\N	\N	\N	\N	\N	15	\N	\N	\N	8	\N	\N	9	\N
111	\N	27	\N	\N	\N	\N	\N	\N	\N	\N	41	\N	\N	\N	\N	\N	\N	\N	\N	15	\N	\N	\N	8	\N	\N	9	\N
112	\N	27	\N	\N	\N	\N	\N	\N	\N	\N	41	\N	\N	\N	\N	\N	\N	\N	\N	15	\N	\N	\N	8	\N	\N	9	\N
113	\N	27	\N	\N	\N	\N	\N	\N	\N	\N	41	\N	\N	\N	\N	\N	\N	\N	\N	15	\N	\N	\N	8	\N	\N	9	\N
114	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	38	\N	\N	\N	\N	\N	\N	\N	\N	14	\N	\N	\N	8	\N	\N	8	\N
115	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	38	\N	\N	\N	\N	\N	\N	\N	\N	14	\N	\N	\N	8	\N	\N	8	\N
116	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	38	\N	\N	\N	\N	\N	\N	\N	\N	14	\N	\N	\N	8	\N	\N	8	\N
117	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	38	\N	\N	\N	\N	\N	\N	\N	\N	14	\N	\N	\N	8	\N	\N	8	\N
118	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	38	\N	\N	\N	\N	\N	\N	\N	\N	14	\N	\N	\N	8	\N	\N	8	\N
119	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	38	\N	\N	\N	\N	\N	\N	\N	\N	14	\N	\N	\N	8	\N	\N	8	\N
120	\N	\N	\N	\N	\N	38	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7	\N	\N	7	8	\N	\N	8	\N
121	\N	\N	\N	\N	\N	38	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7	\N	\N	7	8	\N	\N	8	\N
122	\N	\N	\N	\N	\N	38	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7	\N	\N	7	8	\N	\N	8	\N
123	\N	\N	\N	\N	\N	38	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7	\N	\N	7	8	\N	\N	8	\N
124	\N	44	\N	\N	\N	\N	\N	\N	22	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11	12	\N	\N	11	\N
125	\N	44	\N	\N	\N	\N	\N	\N	22	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11	12	\N	\N	11	\N
126	\N	44	\N	\N	\N	\N	\N	\N	22	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11	12	\N	\N	11	\N
127	\N	44	\N	\N	\N	\N	\N	\N	22	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11	12	\N	\N	11	\N
128	\N	45	\N	\N	\N	\N	\N	\N	10	\N	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15	10	\N	\N	15	\N
129	\N	45	\N	\N	\N	\N	\N	\N	10	\N	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15	10	\N	\N	15	\N
130	\N	45	\N	\N	\N	\N	\N	\N	10	\N	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15	10	\N	\N	15	\N
131	\N	45	\N	\N	\N	\N	\N	\N	10	\N	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15	10	\N	\N	15	\N
132	\N	45	\N	\N	\N	\N	\N	\N	7	\N	8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15	10	\N	\N	15	\N
133	\N	45	\N	\N	\N	\N	\N	\N	7	\N	8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15	10	\N	\N	15	\N
134	\N	45	\N	\N	\N	\N	\N	\N	7	\N	8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15	10	\N	\N	15	\N
135	\N	40	\N	\N	\N	\N	\N	\N	7	\N	8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	10	\N	\N	15	\N
136	\N	40	\N	\N	\N	\N	\N	\N	7	\N	8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	10	\N	\N	15	\N
137	\N	40	\N	\N	\N	\N	\N	\N	7	\N	8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	10	\N	\N	15	\N
138	\N	35	\N	\N	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	\N	22	\N	\N	\N	\N	\N	18	10	\N	\N	10	\N
139	\N	45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	\N	\N	\N	10	10	\N	\N	15	\N
140	\N	45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	\N	\N	\N	10	10	\N	\N	15	\N
141	\N	45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	\N	\N	\N	10	10	\N	\N	15	\N
142	\N	50	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	\N	\N	\N	\N	15	10	\N	\N	15	\N
143	\N	50	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	\N	\N	\N	\N	15	10	\N	\N	15	\N
144	\N	50	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	\N	\N	\N	\N	15	10	\N	\N	15	\N
145	\N	50	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	\N	\N	\N	\N	15	10	\N	\N	15	\N
146	\N	50	\N	\N	\N	\N	\N	\N	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15	10	\N	\N	15	\N
147	\N	50	\N	\N	\N	\N	\N	\N	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15	10	\N	\N	15	\N
148	\N	50	\N	\N	\N	\N	\N	\N	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15	10	\N	\N	15	\N
149	\N	50	\N	\N	\N	\N	\N	\N	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15	10	\N	\N	15	\N
150	\N	50	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	\N	\N	\N	\N	15	10	\N	\N	15	\N
151	\N	50	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	\N	\N	\N	\N	15	10	\N	\N	15	\N
152	\N	50	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	\N	\N	\N	\N	15	10	\N	\N	15	\N
153	\N	50	\N	\N	\N	\N	\N	\N	10	\N	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	\N	15	10	\N	\N	10	\N
154	\N	50	\N	\N	\N	\N	\N	\N	10	\N	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	\N	15	10	\N	\N	10	\N
155	\N	50	\N	\N	\N	\N	\N	\N	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	10	\N	\N	10	\N
156	\N	55	\N	\N	\N	\N	\N	\N	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	10	\N	\N	5	\N
157	\N	55	\N	\N	\N	\N	\N	\N	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	10	\N	\N	5	\N
158	\N	55	\N	\N	\N	\N	\N	\N	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	10	\N	\N	5	\N
159	\N	\N	\N	\N	30	18	\N	\N	15	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15	15	\N	\N	7	\N
160	\N	\N	\N	\N	30	18	\N	\N	15	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15	15	\N	\N	7	\N
161	\N	\N	\N	\N	30	18	\N	\N	15	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15	15	\N	\N	7	\N
162	\N	\N	\N	\N	58	\N	\N	\N	27	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5	5	\N	\N	5	\N
163	\N	\N	\N	\N	58	\N	\N	\N	27	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5	5	\N	\N	5	\N
164	\N	\N	\N	\N	58	\N	\N	\N	27	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5	5	\N	\N	5	\N
165	\N	\N	\N	\N	55	\N	\N	\N	27	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5	8	\N	\N	5	\N
166	\N	\N	\N	\N	55	\N	\N	\N	27	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5	8	\N	\N	5	\N
167	\N	\N	\N	\N	55	\N	\N	\N	22	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	\N	\N	8	\N	\N	5	\N
168	\N	\N	\N	\N	55	\N	\N	\N	22	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	\N	\N	8	\N	\N	5	\N
169	\N	\N	\N	\N	55	\N	\N	\N	22	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	\N	\N	8	\N	\N	5	\N
170	\N	\N	\N	\N	51	\N	\N	\N	22	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	\N	\N	9	\N	\N	8	\N
171	\N	\N	\N	\N	51	\N	\N	\N	22	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	\N	\N	9	\N	\N	8	\N
172	\N	\N	\N	\N	51	\N	\N	\N	22	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	\N	\N	9	\N	\N	8	\N
173	\N	\N	\N	\N	51	\N	\N	\N	22	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	\N	\N	9	\N	\N	8	\N
174	\N	\N	\N	\N	50	\N	\N	\N	15	\N	\N	\N	\N	\N	\N	\N	5	\N	\N	10	\N	\N	\N	10	\N	\N	10	\N
175	\N	\N	\N	\N	50	\N	\N	\N	15	\N	\N	\N	\N	\N	\N	\N	5	\N	\N	10	\N	\N	\N	10	\N	\N	10	\N
176	\N	\N	\N	\N	50	\N	\N	\N	15	\N	\N	\N	\N	\N	\N	\N	5	\N	\N	10	\N	\N	\N	10	\N	\N	10	\N
177	\N	\N	\N	\N	50	\N	\N	\N	15	\N	\N	\N	\N	\N	\N	\N	5	\N	\N	15	\N	\N	\N	7	\N	\N	8	\N
178	\N	\N	\N	\N	50	\N	\N	\N	15	\N	\N	\N	\N	\N	\N	\N	5	\N	\N	15	\N	\N	\N	7	\N	\N	8	\N
179	\N	\N	\N	\N	46	\N	\N	\N	10	\N	\N	\N	\N	\N	\N	\N	12	\N	\N	15	\N	\N	\N	9	\N	\N	8	\N
180	\N	\N	\N	\N	46	\N	\N	\N	10	\N	\N	\N	\N	\N	\N	\N	12	\N	\N	15	\N	\N	\N	9	\N	\N	8	\N
181	\N	46	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	\N	\N	\N	17	\N	\N	15	\N	\N	\N	9	\N	\N	8	\N
182	\N	46	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	\N	\N	\N	17	\N	\N	15	\N	\N	\N	9	\N	\N	8	\N
183	\N	46	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	\N	\N	\N	17	\N	\N	15	\N	\N	\N	9	\N	\N	8	\N
184	\N	46	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	\N	\N	\N	17	\N	\N	15	\N	\N	\N	9	\N	\N	8	\N
185	\N	46	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	\N	\N	\N	17	\N	\N	15	\N	\N	\N	9	\N	\N	8	\N
186	\N	46	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	\N	\N	\N	17	\N	\N	15	\N	\N	\N	9	\N	\N	8	\N
187	\N	47	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	15	\N	\N	\N	9	\N	\N	9	\N
188	\N	47	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	15	\N	\N	\N	9	\N	\N	9	\N
189	\N	47	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	15	\N	\N	\N	9	\N	\N	9	\N
190	\N	47	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	15	\N	\N	\N	9	\N	\N	9	\N
191	\N	20	\N	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	15	\N	\N	\N	10	\N	\N	9	\N
192	\N	20	\N	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	15	\N	\N	\N	10	\N	\N	9	\N
193	\N	20	\N	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	15	\N	\N	\N	10	\N	\N	9	\N
194	\N	16	\N	30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	15	\N	\N	\N	10	\N	\N	9	\N
195	\N	16	\N	30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	15	\N	\N	\N	10	\N	\N	9	\N
196	\N	\N	\N	40	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	15	\N	\N	\N	16	\N	\N	9	\N
197	\N	\N	\N	40	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	15	\N	\N	\N	16	\N	\N	9	\N
198	\N	\N	\N	40	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	15	\N	\N	\N	16	\N	\N	9	\N
199	\N	\N	\N	40	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	15	\N	\N	\N	16	\N	\N	9	\N
200	\N	\N	\N	40	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	15	\N	\N	\N	16	\N	\N	9	\N
201	\N	20	\N	\N	20	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	\N	15	\N	\N	15	\N	\N	\N	16	\N	\N	9	\N
202	\N	20	\N	\N	20	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	\N	15	\N	\N	15	\N	\N	\N	16	\N	\N	9	\N
203	\N	20	\N	\N	20	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	\N	15	\N	\N	15	\N	\N	\N	16	\N	\N	9	\N
204	\N	20	\N	\N	20	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	15	\N	\N	\N	16	\N	\N	9	\N
205	\N	20	\N	\N	20	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	15	\N	\N	\N	16	\N	\N	9	\N
206	\N	20	\N	\N	20	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	15	\N	\N	\N	16	\N	\N	9	\N
207	\N	18	\N	\N	20	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	15	\N	\N	\N	16	\N	\N	11	\N
208	\N	18	\N	\N	18	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	15	\N	\N	\N	18	\N	\N	11	\N
209	\N	18	\N	\N	18	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	15	\N	\N	\N	18	\N	\N	11	\N
210	\N	18	\N	\N	18	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	15	\N	\N	\N	18	\N	\N	11	\N
211	\N	17	\N	\N	17	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	10	\N	\N	5	20	\N	\N	11	\N
212	\N	17	\N	\N	17	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	10	\N	\N	5	20	\N	\N	11	\N
213	\N	17	\N	\N	17	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	10	\N	\N	5	20	\N	\N	11	\N
214	\N	16	\N	\N	16	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	10	\N	\N	7	20	\N	\N	11	\N
215	\N	16	\N	\N	16	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	10	\N	\N	7	20	\N	\N	11	\N
216	\N	16	\N	\N	16	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	10	\N	\N	7	20	\N	\N	11	\N
217	\N	16	\N	\N	16	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	10	\N	\N	7	20	\N	\N	11	\N
218	\N	16	\N	\N	16	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	10	\N	\N	7	20	\N	\N	11	\N
219	\N	16	\N	\N	16	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	10	\N	\N	7	20	\N	\N	11	\N
220	\N	17	\N	\N	17	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	10	\N	\N	7	20	\N	\N	9	\N
221	\N	17	\N	\N	17	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	10	\N	\N	7	20	\N	\N	9	\N
222	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	10	\N	\N	7	20	\N	\N	9	\N
223	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	10	\N	\N	7	20	\N	\N	9	\N
224	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	10	\N	\N	7	20	\N	\N	9	\N
225	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	10	\N	\N	7	20	\N	\N	9	\N
226	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	10	\N	\N	7	20	\N	\N	9	\N
227	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	10	\N	\N	7	20	\N	\N	9	\N
228	\N	\N	\N	\N	40	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	10	10	\N	\N	6	\N
229	\N	\N	\N	\N	40	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	10	10	\N	\N	6	\N
230	\N	\N	\N	\N	40	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	10	10	\N	\N	6	\N
231	\N	\N	\N	\N	38	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	10	12	\N	\N	8	\N
232	\N	\N	\N	\N	38	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	10	12	\N	\N	8	\N
233	\N	\N	\N	\N	38	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	32	\N	\N	10	\N	\N	\N	12	\N	\N	8	\N
234	\N	\N	\N	\N	38	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	32	\N	\N	10	\N	\N	\N	12	\N	\N	8	\N
235	\N	\N	\N	\N	38	\N	20	\N	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	14	\N	\N	8	\N
236	\N	\N	\N	\N	36	\N	20	\N	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12	14	\N	\N	8	\N
237	\N	\N	\N	\N	36	\N	20	\N	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	14	10	\N	\N	10	\N
238	\N	\N	\N	\N	36	\N	20	\N	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	14	10	\N	\N	10	\N
239	\N	\N	\N	\N	36	\N	20	\N	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	14	10	\N	\N	10	\N
240	\N	\N	\N	\N	36	\N	20	\N	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	14	10	\N	\N	10	\N
241	\N	\N	\N	\N	36	\N	20	\N	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	14	10	\N	\N	10	\N
242	\N	\N	\N	\N	36	\N	20	\N	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	14	10	\N	\N	10	\N
243	\N	\N	\N	\N	36	\N	20	\N	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	14	10	\N	\N	10	\N
244	\N	\N	\N	\N	38	\N	20	\N	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	10	\N	\N	12	\N
245	\N	\N	\N	\N	38	\N	20	\N	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	10	\N	\N	12	\N
246	\N	\N	\N	\N	38	\N	20	\N	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	10	\N	\N	12	\N
247	\N	\N	\N	20	17	\N	18	\N	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	\N	\N	11	\N	\N	14	\N
248	\N	\N	\N	20	17	\N	18	\N	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	\N	\N	11	\N	\N	14	\N
249	\N	\N	\N	20	17	\N	18	\N	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	\N	\N	11	\N	\N	14	\N
250	\N	\N	\N	19	17	\N	16	\N	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	\N	\N	13	\N	\N	15	\N
251	\N	\N	\N	19	17	\N	16	\N	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	\N	\N	13	\N	\N	15	\N
252	\N	\N	\N	17	17	\N	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	8	\N	\N	\N	12	\N	\N	12	\N
253	\N	\N	\N	17	17	\N	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	8	\N	\N	\N	12	\N	\N	12	\N
254	\N	\N	\N	17	17	\N	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	8	\N	\N	\N	12	\N	\N	12	\N
255	\N	\N	\N	17	17	\N	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	8	\N	\N	\N	12	\N	\N	12	\N
256	\N	\N	\N	17	17	\N	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	8	\N	\N	\N	12	\N	\N	12	\N
257	\N	\N	\N	17	17	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	34	\N	\N	8	\N	\N	\N	12	\N	\N	12	\N
258	\N	\N	\N	17	17	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	34	\N	\N	8	\N	\N	\N	12	\N	\N	12	\N
259	\N	\N	\N	17	17	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	34	\N	\N	8	\N	\N	\N	12	\N	\N	12	\N
260	\N	\N	\N	17	17	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	34	\N	\N	8	\N	\N	\N	12	\N	\N	12	\N
261	\N	\N	\N	16	16	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	34	\N	\N	8	\N	\N	\N	14	\N	\N	12	\N
262	\N	\N	\N	16	16	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	34	\N	\N	8	\N	\N	\N	14	\N	\N	12	\N
263	\N	\N	\N	16	16	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	34	\N	\N	8	\N	\N	\N	14	\N	\N	12	\N
264	\N	\N	\N	15	15	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	36	\N	\N	8	\N	\N	\N	14	\N	\N	12	\N
265	\N	\N	\N	15	15	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	36	\N	\N	8	\N	\N	\N	14	\N	\N	12	\N
266	\N	\N	\N	15	15	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	36	\N	\N	8	\N	\N	\N	14	\N	\N	12	\N
267	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	35	\N	\N	8	\N	\N	\N	15	\N	\N	12	\N
268	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	35	\N	\N	8	\N	\N	\N	15	\N	\N	12	\N
269	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	35	\N	\N	8	\N	\N	\N	15	\N	\N	12	\N
270	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	35	\N	\N	8	\N	\N	\N	15	\N	\N	12	\N
271	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	35	\N	\N	8	\N	\N	\N	15	\N	\N	12	\N
272	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	35	\N	\N	8	\N	\N	\N	15	\N	\N	12	\N
273	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	35	\N	\N	8	\N	\N	\N	15	\N	\N	12	\N
274	\N	\N	\N	31	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	37	\N	\N	8	\N	\N	\N	15	\N	\N	9	\N
275	\N	\N	\N	31	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	37	\N	\N	8	\N	\N	\N	15	\N	\N	9	\N
276	\N	\N	\N	31	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	37	\N	\N	8	\N	\N	\N	15	\N	\N	9	\N
277	\N	\N	\N	31	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	37	\N	\N	8	\N	\N	\N	15	\N	\N	9	\N
278	\N	\N	\N	31	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	37	\N	\N	8	\N	\N	\N	15	\N	\N	9	\N
279	\N	\N	\N	31	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	37	\N	\N	8	\N	\N	\N	15	\N	\N	9	\N
280	\N	\N	\N	31	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	37	\N	\N	8	\N	\N	\N	15	\N	\N	9	\N
281	\N	\N	\N	31	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	37	\N	\N	8	\N	\N	\N	15	\N	\N	9	\N
282	\N	\N	\N	31	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	37	\N	\N	8	\N	\N	\N	15	\N	\N	9	\N
283	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	41	\N	\N	8	\N	\N	\N	8	\N	\N	9	\N
284	\N	10	\N	27	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	38	\N	\N	8	\N	\N	\N	8	\N	\N	8	\N
285	\N	10	\N	27	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	38	\N	\N	8	\N	\N	\N	8	\N	\N	8	\N
286	\N	10	\N	23	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	38	\N	\N	8	\N	\N	\N	12	\N	\N	8	\N
287	\N	10	\N	21	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	38	\N	\N	8	\N	\N	\N	14	\N	\N	8	\N
288	\N	10	\N	21	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	38	\N	\N	8	\N	\N	\N	14	\N	\N	8	\N
289	\N	10	\N	21	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	38	\N	\N	8	\N	\N	\N	14	\N	\N	8	\N
290	\N	10	\N	21	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	38	\N	\N	8	\N	\N	\N	14	\N	\N	8	\N
291	\N	10	\N	21	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	38	\N	\N	8	\N	\N	\N	14	\N	\N	8	\N
292	\N	\N	\N	31	\N	\N	\N	\N	10	\N	1	\N	\N	\N	\N	\N	28	\N	\N	8	\N	\N	\N	14	\N	\N	8	\N
293	\N	\N	\N	31	\N	\N	\N	\N	10	\N	1	\N	\N	\N	\N	\N	28	\N	\N	8	\N	\N	\N	14	\N	\N	8	\N
294	\N	\N	\N	31	\N	\N	\N	\N	10	\N	1	\N	\N	\N	\N	\N	28	\N	\N	8	\N	\N	\N	14	\N	\N	8	\N
295	\N	\N	\N	31	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	\N	\N	37	\N	\N	8	\N	\N	\N	14	\N	\N	8	\N
296	\N	\N	\N	31	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	\N	\N	37	\N	\N	8	\N	\N	\N	14	\N	\N	8	\N
297	\N	\N	\N	31	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	\N	\N	37	\N	\N	8	\N	\N	\N	14	\N	\N	8	\N
298	\N	\N	\N	31	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	\N	\N	37	\N	\N	8	\N	\N	\N	14	\N	\N	8	\N
299	\N	\N	\N	31	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	\N	\N	37	\N	\N	8	\N	\N	\N	14	\N	\N	8	\N
300	\N	\N	\N	31	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	\N	\N	37	\N	\N	8	\N	\N	\N	14	\N	\N	8	\N
301	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	\N	\N	38	\N	\N	8	\N	\N	\N	14	\N	\N	8	\N
302	\N	\N	\N	29	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	\N	\N	37	\N	\N	8	\N	\N	\N	16	\N	\N	8	\N
303	\N	\N	\N	29	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	\N	\N	37	\N	\N	8	\N	\N	\N	16	\N	\N	8	\N
304	\N	\N	\N	29	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	39	\N	\N	8	\N	\N	\N	16	\N	\N	8	\N
305	\N	\N	\N	29	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	39	\N	\N	8	\N	\N	\N	16	\N	\N	8	\N
306	\N	\N	\N	27	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	39	\N	\N	8	\N	\N	\N	17	\N	\N	9	\N
307	\N	\N	\N	29	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	39	\N	\N	8	\N	\N	\N	16	\N	\N	8	\N
308	\N	\N	\N	28	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	38	\N	\N	8	\N	\N	\N	16	\N	\N	10	\N
309	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	37	\N	\N	8	\N	\N	\N	16	\N	\N	10	\N
310	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	37	\N	\N	8	\N	\N	\N	16	\N	\N	10	\N
311	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	37	\N	\N	8	\N	\N	\N	16	\N	\N	10	\N
312	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	37	\N	\N	8	\N	\N	\N	16	\N	\N	10	\N
313	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	37	\N	\N	8	\N	\N	\N	16	\N	\N	10	\N
314	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	37	\N	\N	8	\N	\N	\N	16	\N	\N	10	\N
315	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	30	\N	\N	10	\N	\N	\N	18	\N	\N	11	\N
316	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	30	\N	\N	10	\N	\N	\N	18	\N	\N	11	\N
317	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	12	\N	\N	\N	20	\N	\N	11	\N
318	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	12	\N	\N	\N	20	\N	\N	11	\N
319	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	12	\N	\N	\N	20	\N	\N	11	\N
320	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	12	\N	\N	\N	20	\N	\N	11	\N
321	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	12	\N	\N	\N	20	\N	\N	11	\N
322	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	12	\N	\N	\N	20	\N	\N	11	\N
323	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	12	\N	\N	\N	20	\N	\N	11	\N
324	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	12	\N	\N	\N	20	\N	\N	11	\N
325	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	12	\N	\N	\N	20	\N	\N	11	\N
326	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	12	\N	\N	\N	19	\N	\N	10	\N
327	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	12	\N	\N	\N	19	\N	\N	10	\N
328	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	12	\N	\N	\N	19	\N	\N	10	\N
329	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	26	\N	\N	12	\N	\N	\N	17	\N	\N	10	\N
330	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	26	\N	\N	12	\N	\N	\N	13	\N	\N	10	\N
331	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	26	\N	\N	12	\N	\N	\N	13	\N	\N	10	\N
332	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	26	\N	\N	\N	\N	\N	12	10	\N	\N	10	\N
333	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	26	\N	\N	\N	\N	\N	12	10	\N	\N	10	\N
334	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	26	\N	\N	\N	\N	\N	12	8	\N	\N	10	\N
335	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	26	\N	\N	\N	\N	\N	12	8	\N	\N	10	\N
336	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	26	\N	\N	\N	\N	\N	12	8	\N	\N	10	\N
337	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	26	\N	\N	\N	\N	\N	12	8	\N	\N	10	\N
338	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	26	\N	\N	\N	\N	\N	12	8	\N	\N	10	\N
339	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	26	\N	\N	\N	\N	\N	12	8	\N	\N	10	\N
340	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	26	\N	\N	\N	\N	\N	12	8	\N	\N	8	\N
341	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	26	\N	\N	\N	\N	\N	12	8	\N	\N	8	\N
342	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	26	\N	\N	\N	\N	\N	12	8	\N	\N	8	\N
343	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	26	\N	\N	\N	\N	\N	12	8	\N	\N	8	\N
344	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	30	\N	\N	12	\N	\N	\N	10	\N	\N	8	\N
345	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	30	\N	\N	12	\N	\N	\N	10	\N	\N	8	\N
346	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	30	\N	\N	12	\N	\N	\N	10	\N	\N	8	\N
347	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	30	\N	\N	12	\N	\N	\N	10	\N	\N	8	\N
348	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	30	\N	\N	12	\N	\N	\N	12	\N	\N	8	\N
349	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	22	\N	\N	0	\N	\N	10	\N	\N	\N	16	\N	\N	6	\N
350	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	22	\N	\N	0	\N	\N	10	\N	\N	\N	16	\N	\N	6	\N
351	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	22	\N	\N	0	\N	\N	10	\N	\N	\N	16	\N	\N	6	\N
352	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	24	\N	\N	0	\N	\N	10	\N	\N	\N	18	\N	\N	6	\N
353	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	24	\N	\N	0	\N	\N	10	\N	\N	\N	18	\N	\N	6	\N
354	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	24	\N	\N	0	\N	\N	10	\N	\N	\N	18	\N	\N	6	\N
355	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	24	\N	\N	0	\N	\N	5	\N	\N	5	18	\N	\N	6	\N
356	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	24	\N	\N	0	\N	\N	5	\N	\N	5	18	\N	\N	6	\N
357	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	35	\N	\N	0	\N	\N	0	\N	\N	0	20	\N	\N	0	\N
358	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	35	\N	\N	0	\N	\N	0	\N	\N	0	20	\N	\N	0	\N
359	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	8	\N	\N	\N	19	\N	\N	3	\N
360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	8	\N	\N	\N	19	\N	\N	3	\N
361	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	36	\N	\N	\N	\N	\N	6	\N	\N	\N	20	\N	\N	3	\N
362	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	36	\N	\N	\N	\N	\N	6	\N	\N	\N	20	\N	\N	3	\N
363	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	6	\N	\N	\N	21	\N	\N	3	\N
364	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	6	\N	\N	\N	21	\N	\N	3	\N
365	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	6	\N	\N	\N	21	\N	\N	3	\N
366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	6	\N	\N	\N	21	\N	\N	3	\N
367	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	22	\N	\N	\N	\N	\N	5	\N	\N	\N	21	\N	\N	3	\N
368	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	22	\N	\N	\N	\N	\N	5	\N	\N	\N	21	\N	\N	3	\N
369	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	6	\N	\N	\N	21	\N	\N	3	\N
370	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	6	\N	\N	\N	21	\N	\N	3	\N
371	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	6	\N	\N	\N	21	\N	\N	3	\N
372	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	6	\N	\N	\N	21	\N	\N	3	\N
373	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	6	\N	\N	\N	21	\N	\N	3	\N
374	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	6	\N	\N	\N	21	\N	\N	3	\N
375	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	6	\N	\N	\N	21	\N	\N	3	\N
376	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	6	\N	\N	\N	21	\N	\N	3	\N
377	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	6	\N	\N	\N	23	\N	\N	3	\N
378	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	6	\N	\N	\N	23	\N	\N	3	\N
379	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	6	\N	\N	\N	23	\N	\N	3	\N
380	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	6	\N	\N	\N	23	\N	\N	3	\N
381	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	6	\N	\N	\N	23	\N	\N	3	\N
382	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	6	\N	\N	\N	23	\N	\N	3	\N
383	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	6	\N	\N	\N	23	\N	\N	3	\N
384	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	6	\N	\N	\N	23	\N	\N	3	\N
385	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	6	\N	\N	\N	23	\N	\N	3	\N
386	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	6	\N	\N	\N	23	\N	\N	3	\N
387	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	6	\N	\N	\N	23	\N	\N	3	\N
388	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	6	\N	\N	\N	23	\N	\N	3	\N
389	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	6	\N	\N	\N	23	\N	\N	3	\N
390	\N	\N	\N	\N	43	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	6	\N	\N	\N	23	\N	\N	3	\N
391	\N	\N	\N	\N	43	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	6	\N	\N	\N	23	\N	\N	3	\N
392	\N	\N	\N	\N	43	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	6	\N	\N	\N	23	\N	\N	3	\N
393	\N	\N	\N	\N	43	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	6	\N	\N	\N	23	\N	\N	\N	3
394	\N	\N	\N	\N	43	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	6	\N	\N	\N	23	\N	\N	\N	3
395	\N	\N	\N	\N	43	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	6	\N	\N	\N	23	\N	\N	\N	3
396	\N	\N	\N	\N	43	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	6	\N	\N	\N	23	\N	\N	\N	3
397	\N	\N	\N	\N	43	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	6	\N	\N	\N	23	\N	\N	\N	3
398	\N	\N	\N	44	\N	\N	\N	\N	\N	\N	\N	\N	\N	27	\N	\N	\N	\N	\N	6	\N	\N	\N	23	\N	\N	\N	\N
399	\N	\N	\N	44	\N	\N	\N	\N	\N	\N	\N	\N	\N	27	\N	\N	\N	\N	\N	6	\N	\N	\N	23	\N	\N	\N	\N
400	\N	\N	\N	44	\N	\N	\N	\N	\N	\N	\N	\N	\N	27	\N	\N	\N	\N	\N	6	\N	\N	\N	23	\N	\N	\N	\N
401	\N	\N	\N	\N	42	\N	\N	\N	\N	\N	\N	\N	\N	27	\N	\N	\N	\N	\N	6	\N	\N	\N	25	\N	\N	\N	\N
402	\N	\N	\N	\N	42	\N	\N	\N	\N	\N	\N	\N	\N	27	\N	\N	\N	\N	\N	6	\N	\N	\N	25	\N	\N	\N	\N
403	\N	\N	\N	\N	42	\N	\N	\N	\N	\N	\N	\N	\N	27	\N	\N	\N	\N	\N	6	\N	\N	\N	25	\N	\N	\N	\N
404	\N	\N	\N	\N	42	\N	\N	\N	\N	\N	\N	\N	\N	27	\N	\N	\N	\N	\N	6	\N	\N	\N	25	\N	\N	\N	\N
405	\N	\N	\N	\N	42	\N	\N	\N	\N	\N	\N	\N	\N	27	\N	\N	\N	\N	\N	6	\N	\N	\N	25	\N	\N	\N	\N
406	\N	\N	\N	\N	41	\N	\N	\N	\N	\N	\N	\N	\N	27	\N	\N	\N	\N	\N	6	\N	\N	\N	26	\N	\N	\N	\N
407	\N	\N	\N	\N	41	\N	\N	\N	\N	\N	\N	\N	\N	27	\N	\N	\N	\N	\N	6	\N	\N	\N	26	\N	\N	\N	\N
408	\N	\N	\N	\N	41	\N	\N	\N	\N	\N	\N	\N	\N	27	\N	\N	\N	\N	\N	6	\N	\N	\N	26	\N	\N	\N	\N
409	\N	\N	\N	\N	40	\N	\N	\N	\N	\N	\N	\N	\N	27	\N	\N	\N	\N	\N	6	\N	\N	\N	27	\N	\N	\N	\N
410	\N	\N	\N	\N	40	\N	\N	\N	\N	\N	\N	\N	\N	27	\N	\N	\N	\N	\N	6	\N	\N	\N	27	\N	\N	\N	\N
411	\N	\N	\N	\N	40	\N	\N	\N	\N	\N	\N	\N	\N	27	\N	\N	\N	\N	\N	6	\N	\N	\N	27	\N	\N	\N	\N
412	\N	\N	\N	\N	40	\N	\N	\N	\N	\N	\N	\N	\N	27	\N	\N	\N	\N	\N	6	\N	\N	\N	27	\N	\N	\N	\N
413	\N	\N	\N	\N	40	\N	\N	\N	\N	\N	\N	\N	\N	27	\N	\N	\N	\N	\N	6	\N	\N	\N	27	\N	\N	\N	\N
414	\N	\N	\N	\N	40	\N	\N	\N	\N	\N	\N	\N	\N	27	\N	\N	\N	\N	\N	6	\N	\N	\N	27	\N	\N	\N	\N
415	\N	\N	\N	\N	40	\N	\N	\N	\N	\N	\N	\N	\N	27	\N	\N	\N	\N	\N	6	\N	\N	\N	27	\N	\N	\N	\N
416	\N	\N	\N	\N	40	\N	\N	\N	\N	\N	\N	\N	\N	27	\N	\N	\N	\N	\N	6	\N	\N	\N	27	\N	\N	\N	\N
417	\N	\N	\N	\N	40	\N	\N	\N	\N	\N	\N	\N	\N	27	\N	\N	\N	\N	\N	6	\N	\N	\N	27	\N	\N	\N	\N
418	\N	\N	\N	\N	40	\N	\N	\N	\N	\N	\N	\N	\N	27	\N	\N	\N	\N	\N	6	\N	\N	\N	27	\N	\N	\N	\N
419	\N	\N	\N	\N	40	\N	\N	\N	\N	\N	\N	\N	\N	27	\N	\N	\N	\N	\N	6	\N	\N	\N	27	\N	\N	\N	\N
420	\N	\N	\N	\N	45	\N	\N	\N	\N	\N	\N	\N	\N	30	\N	\N	\N	\N	\N	7	\N	\N	\N	18	\N	\N	\N	\N
421	\N	\N	\N	\N	51	\N	\N	\N	\N	\N	\N	\N	\N	30	\N	\N	\N	\N	\N	8	\N	\N	\N	11	\N	\N	\N	\N
422	\N	\N	\N	\N	49	\N	\N	\N	\N	\N	\N	\N	\N	28	\N	\N	\N	\N	\N	8	\N	\N	\N	15	\N	\N	\N	\N
423	\N	\N	\N	\N	46	\N	\N	\N	\N	\N	\N	\N	\N	28	\N	\N	\N	\N	\N	8	\N	\N	\N	15	\N	\N	\N	3
424	\N	\N	\N	\N	46	\N	\N	\N	\N	\N	\N	\N	\N	28	\N	\N	\N	\N	\N	8	\N	\N	\N	15	\N	\N	\N	3
425	\N	\N	\N	\N	44	\N	\N	\N	\N	\N	\N	\N	\N	39	\N	\N	\N	\N	\N	5	\N	\N	\N	5	\N	\N	\N	7
426	\N	\N	\N	\N	44	\N	\N	\N	\N	\N	\N	\N	\N	39	\N	\N	\N	\N	\N	5	\N	\N	\N	5	\N	\N	\N	7
427	\N	\N	\N	\N	44	\N	\N	\N	\N	\N	\N	\N	\N	39	\N	\N	\N	\N	\N	5	\N	\N	\N	5	\N	\N	\N	7
428	\N	\N	\N	\N	44	\N	\N	\N	\N	\N	\N	\N	\N	39	\N	\N	\N	\N	\N	5	\N	\N	\N	5	\N	\N	\N	8
429	\N	\N	\N	\N	41	\N	\N	\N	\N	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	5	\N	\N	\N	15	\N	\N	\N	7
430	\N	\N	\N	\N	41	\N	\N	\N	\N	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	5	\N	\N	\N	15	\N	\N	\N	7
431	\N	\N	\N	\N	41	\N	\N	\N	\N	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	5	\N	\N	\N	15	\N	\N	\N	7
432	\N	\N	\N	\N	41	\N	\N	\N	\N	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	5	\N	\N	\N	15	\N	\N	\N	7
433	\N	\N	\N	\N	41	\N	\N	\N	\N	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	5	\N	\N	\N	15	\N	\N	\N	7
434	\N	\N	\N	\N	41	\N	\N	\N	\N	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	5	\N	\N	\N	15	\N	\N	\N	7
435	\N	\N	\N	\N	43	\N	\N	\N	\N	\N	\N	\N	\N	22	\N	\N	\N	\N	\N	10	\N	\N	\N	16	\N	\N	\N	9
436	\N	\N	\N	\N	43	\N	\N	\N	\N	\N	\N	\N	\N	22	\N	\N	\N	\N	\N	10	\N	\N	\N	16	\N	\N	\N	9
437	\N	\N	\N	\N	44	\N	\N	\N	\N	\N	\N	\N	\N	14	\N	\N	\N	\N	\N	15	\N	\N	\N	17	\N	\N	\N	10
438	\N	\N	\N	\N	44	\N	\N	\N	\N	\N	\N	\N	\N	14	\N	\N	\N	\N	\N	15	\N	\N	\N	17	\N	\N	\N	10
439	\N	\N	\N	\N	44	\N	\N	\N	\N	\N	\N	\N	\N	14	\N	\N	\N	\N	\N	15	\N	\N	\N	17	\N	\N	10	\N
440	\N	\N	\N	\N	44	\N	\N	\N	\N	\N	\N	\N	\N	23	\N	\N	\N	\N	\N	5	\N	\N	\N	23	\N	\N	5	\N
441	\N	\N	\N	\N	44	\N	\N	\N	\N	\N	\N	\N	\N	23	\N	\N	\N	\N	\N	5	\N	\N	\N	23	\N	\N	5	\N
442	\N	\N	\N	\N	44	\N	\N	\N	\N	\N	\N	\N	\N	23	\N	\N	\N	\N	\N	5	\N	\N	\N	23	\N	\N	5	\N
443	\N	\N	\N	\N	46	\N	\N	\N	\N	\N	\N	\N	\N	\N	23	\N	\N	\N	\N	5	\N	\N	\N	21	\N	\N	5	\N
444	\N	\N	\N	\N	46	\N	\N	\N	\N	\N	\N	\N	\N	\N	23	\N	\N	\N	\N	5	\N	\N	\N	21	\N	\N	5	\N
445	\N	\N	\N	\N	46	\N	\N	\N	\N	\N	\N	\N	\N	\N	23	\N	\N	\N	\N	5	\N	\N	\N	21	\N	\N	5	\N
446	\N	\N	\N	\N	46	\N	\N	\N	\N	\N	\N	\N	\N	\N	23	\N	\N	\N	\N	5	\N	\N	\N	21	\N	\N	5	\N
447	\N	\N	\N	\N	46	\N	\N	\N	\N	\N	\N	\N	\N	\N	23	\N	\N	\N	\N	5	\N	\N	\N	21	\N	\N	5	\N
448	\N	\N	\N	\N	46	\N	\N	\N	\N	\N	\N	\N	\N	\N	23	\N	\N	\N	\N	5	\N	\N	\N	21	\N	\N	5	\N
449	\N	\N	\N	\N	46	\N	\N	\N	\N	\N	\N	\N	\N	\N	23	\N	\N	\N	\N	5	\N	\N	\N	21	\N	\N	5	\N
450	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	29	\N	\N	\N	\N	\N	\N	\N	\N	15	\N	\N	\N	16	\N	\N	5	\N
451	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	33	\N	\N	\N	\N	\N	\N	\N	\N	17	\N	\N	\N	10	\N	\N	5	\N
452	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	33	\N	\N	\N	\N	\N	\N	\N	\N	17	\N	\N	\N	10	\N	\N	5	\N
453	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	33	\N	\N	\N	\N	\N	\N	\N	\N	17	\N	\N	\N	10	\N	\N	5	\N
454	\N	\N	\N	\N	37	\N	\N	\N	\N	\N	26	\N	\N	\N	\N	\N	\N	\N	\N	16	\N	\N	\N	16	\N	\N	5	\N
455	\N	\N	\N	\N	37	\N	\N	\N	\N	\N	26	\N	\N	\N	\N	\N	\N	\N	\N	16	\N	\N	\N	16	\N	\N	5	\N
456	\N	\N	\N	\N	37	\N	\N	\N	\N	\N	26	\N	\N	\N	\N	\N	\N	\N	\N	14	\N	\N	\N	18	\N	\N	5	\N
457	\N	\N	\N	\N	37	\N	\N	\N	\N	\N	19	\N	\N	\N	\N	\N	\N	\N	\N	16	\N	\N	\N	23	\N	\N	5	\N
458	\N	\N	\N	\N	42	\N	\N	\N	\N	\N	19	\N	\N	\N	\N	\N	\N	\N	\N	13	\N	\N	\N	23	\N	\N	3	\N
459	\N	\N	\N	\N	42	\N	\N	\N	\N	\N	19	\N	\N	\N	\N	\N	\N	\N	\N	13	\N	\N	\N	23	\N	\N	3	\N
460	\N	\N	\N	\N	42	\N	\N	\N	\N	\N	19	\N	\N	\N	\N	\N	\N	\N	\N	13	\N	\N	\N	23	\N	\N	3	\N
461	\N	\N	\N	\N	42	\N	\N	\N	\N	\N	19	\N	\N	\N	\N	\N	\N	\N	\N	13	\N	\N	\N	23	\N	\N	3	\N
462	\N	\N	\N	\N	42	\N	\N	\N	\N	\N	19	\N	\N	\N	\N	\N	\N	\N	\N	13	\N	\N	\N	23	\N	\N	3	\N
463	\N	\N	\N	\N	45	\N	\N	\N	\N	\N	21	\N	\N	\N	\N	\N	\N	\N	\N	13	\N	\N	\N	18	\N	\N	3	\N
464	\N	\N	\N	\N	45	\N	\N	\N	\N	\N	21	\N	\N	\N	\N	\N	\N	\N	\N	13	\N	\N	\N	18	\N	\N	3	\N
465	\N	\N	\N	\N	45	\N	\N	\N	\N	\N	21	\N	\N	\N	\N	\N	\N	\N	\N	13	\N	\N	\N	18	\N	\N	3	\N
466	\N	\N	\N	\N	42	\N	\N	\N	\N	\N	19	\N	\N	\N	\N	\N	\N	\N	\N	13	\N	\N	\N	23	\N	\N	3	\N
467	\N	\N	\N	\N	42	\N	\N	\N	\N	\N	19	\N	\N	\N	\N	\N	\N	\N	\N	13	\N	\N	\N	23	\N	\N	3	\N
468	\N	\N	\N	\N	42	\N	\N	\N	\N	\N	19	\N	\N	\N	\N	\N	\N	\N	\N	13	\N	\N	\N	23	\N	\N	3	\N
469	\N	\N	\N	\N	40	\N	\N	\N	\N	\N	19	\N	\N	\N	\N	\N	\N	\N	\N	13	\N	\N	\N	25	\N	\N	3	\N
470	\N	\N	\N	\N	40	\N	\N	\N	\N	\N	19	\N	\N	\N	\N	\N	\N	\N	\N	13	\N	\N	\N	25	\N	\N	3	\N
471	\N	\N	\N	\N	40	\N	\N	\N	\N	\N	19	\N	\N	\N	\N	\N	\N	\N	\N	13	\N	\N	\N	25	\N	\N	3	\N
472	\N	\N	\N	\N	40	\N	\N	\N	\N	\N	19	\N	\N	\N	\N	\N	\N	\N	\N	13	\N	\N	\N	25	\N	\N	3	\N
473	\N	\N	\N	\N	40	\N	\N	\N	\N	\N	19	\N	\N	\N	\N	\N	\N	\N	\N	13	\N	\N	\N	25	\N	\N	3	\N
474	\N	\N	\N	\N	38	\N	\N	\N	\N	\N	21	\N	\N	\N	\N	\N	\N	\N	\N	13	\N	\N	\N	25	\N	\N	3	\N
475	\N	\N	\N	\N	38	\N	\N	\N	\N	\N	21	\N	\N	\N	\N	\N	\N	\N	\N	13	\N	\N	\N	25	\N	\N	3	\N
476	\N	\N	\N	\N	38	\N	\N	\N	\N	\N	21	\N	\N	\N	\N	\N	\N	\N	\N	13	\N	\N	\N	25	\N	\N	3	\N
477	\N	\N	\N	\N	38	\N	\N	\N	\N	\N	21	\N	\N	\N	\N	\N	\N	\N	\N	13	\N	\N	\N	25	\N	\N	3	\N
478	\N	\N	\N	\N	40	\N	\N	\N	\N	\N	6	\N	\N	\N	26	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	3	\N
479	\N	\N	\N	\N	40	\N	\N	\N	\N	\N	6	\N	\N	\N	26	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	3	\N
480	\N	\N	\N	\N	38	\N	\N	\N	\N	\N	6	\N	\N	\N	26	\N	\N	\N	\N	\N	\N	\N	\N	27	\N	\N	3	\N
481	\N	\N	\N	\N	38	\N	\N	\N	\N	\N	6	\N	\N	\N	26	\N	\N	\N	\N	\N	\N	\N	\N	27	\N	\N	3	\N
482	\N	\N	\N	\N	38	\N	\N	\N	\N	\N	6	\N	\N	\N	26	\N	\N	\N	\N	\N	\N	\N	\N	27	\N	\N	3	\N
483	\N	\N	\N	\N	38	\N	\N	\N	\N	\N	6	\N	\N	\N	26	\N	\N	\N	\N	\N	\N	\N	\N	27	\N	\N	3	\N
484	\N	\N	\N	\N	36	\N	\N	\N	\N	\N	7	\N	\N	\N	27	\N	\N	\N	\N	\N	\N	\N	\N	27	\N	\N	3	\N
485	\N	\N	\N	\N	36	\N	\N	\N	\N	\N	7	\N	\N	\N	27	\N	\N	\N	\N	\N	\N	\N	\N	27	\N	\N	3	\N
486	\N	\N	\N	\N	36	\N	\N	\N	\N	\N	7	\N	\N	\N	27	\N	\N	\N	\N	\N	\N	\N	\N	27	\N	\N	3	\N
487	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	9	\N	\N	\N	27	\N	\N	\N	\N	\N	\N	\N	\N	27	\N	\N	3	\N
488	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	9	\N	\N	\N	27	\N	\N	\N	\N	\N	\N	\N	\N	27	\N	\N	3	\N
489	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	9	\N	\N	\N	27	\N	\N	\N	\N	\N	\N	\N	\N	27	\N	\N	3	\N
490	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	9	\N	\N	\N	27	\N	\N	\N	\N	\N	\N	\N	\N	27	\N	\N	3	\N
491	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	9	\N	\N	\N	27	\N	\N	\N	\N	\N	\N	\N	\N	27	\N	\N	3	\N
492	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	7	\N	\N	\N	23	\N	\N	\N	\N	5	\N	\N	\N	27	\N	\N	3	\N
493	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	7	\N	\N	\N	23	\N	\N	\N	\N	5	\N	\N	\N	27	\N	\N	3	\N
494	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	7	\N	\N	\N	23	\N	\N	\N	\N	5	\N	\N	\N	27	\N	\N	3	\N
495	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	7	\N	\N	\N	25	\N	\N	\N	\N	3	\N	\N	\N	27	\N	\N	3	\N
496	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	7	\N	\N	\N	25	\N	\N	\N	\N	3	\N	\N	\N	27	\N	\N	3	\N
497	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	7	\N	\N	\N	25	\N	\N	\N	\N	3	\N	\N	\N	27	\N	\N	3	\N
498	\N	\N	\N	\N	37	\N	\N	\N	\N	\N	20	\N	\N	\N	\N	\N	\N	\N	\N	16	\N	\N	\N	24	\N	\N	3	\N
499	\N	\N	\N	\N	37	\N	\N	\N	\N	\N	20	\N	\N	\N	\N	\N	\N	\N	\N	16	\N	\N	\N	24	\N	\N	3	\N
500	\N	\N	\N	\N	33	\N	\N	\N	\N	\N	23	\N	\N	\N	\N	\N	\N	\N	\N	17	\N	\N	\N	24	\N	\N	1	2
501	\N	\N	\N	\N	33	\N	\N	\N	\N	\N	23	\N	\N	\N	\N	\N	\N	\N	\N	17	\N	\N	\N	24	\N	\N	1	2
502	\N	\N	\N	\N	33	\N	\N	\N	\N	\N	23	\N	\N	\N	\N	\N	\N	\N	\N	17	\N	\N	\N	24	\N	\N	1	2
503	\N	\N	\N	\N	33	\N	\N	\N	\N	\N	23	\N	\N	\N	\N	\N	\N	\N	\N	17	\N	\N	\N	24	\N	\N	1	2
504	\N	\N	\N	\N	31	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	\N	\N	\N	17	\N	\N	\N	24	\N	\N	1	2
505	\N	\N	\N	\N	31	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	\N	\N	\N	17	\N	\N	\N	24	\N	\N	1	2
506	\N	\N	\N	\N	31	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	\N	\N	\N	17	\N	\N	\N	24	\N	\N	1	2
507	\N	\N	\N	\N	31	\N	\N	\N	\N	\N	18	\N	\N	\N	12	\N	\N	\N	\N	12	\N	\N	\N	24	\N	\N	3	\N
508	\N	\N	\N	\N	31	\N	\N	\N	\N	\N	18	\N	\N	\N	12	\N	\N	\N	\N	12	\N	\N	\N	24	\N	\N	3	\N
509	\N	\N	\N	\N	31	\N	\N	\N	\N	\N	18	\N	\N	\N	12	\N	\N	\N	\N	12	\N	\N	\N	24	\N	\N	3	\N
510	\N	\N	\N	\N	31	\N	\N	\N	\N	\N	18	\N	\N	\N	10	\N	\N	\N	\N	14	\N	\N	\N	24	\N	\N	3	\N
511	\N	\N	\N	\N	31	\N	\N	\N	\N	\N	18	\N	\N	\N	10	\N	\N	\N	\N	14	\N	\N	\N	24	\N	\N	3	\N
512	\N	\N	\N	\N	31	\N	\N	\N	\N	\N	18	\N	\N	\N	10	\N	\N	\N	\N	14	\N	\N	\N	24	\N	\N	3	\N
513	\N	\N	\N	\N	31	\N	\N	\N	\N	\N	18	\N	\N	\N	10	\N	\N	\N	\N	14	\N	\N	\N	24	\N	\N	3	\N
514	\N	\N	\N	\N	31	\N	\N	\N	\N	\N	18	\N	\N	\N	10	\N	\N	\N	\N	14	\N	\N	\N	24	\N	\N	3	\N
515	\N	\N	\N	\N	31	\N	\N	\N	\N	\N	18	\N	\N	\N	10	\N	\N	\N	\N	14	\N	\N	\N	24	\N	\N	3	\N
516	\N	\N	\N	\N	33	\N	\N	\N	\N	\N	18	\N	\N	\N	8	\N	\N	\N	\N	14	\N	\N	\N	24	\N	\N	3	\N
517	\N	\N	\N	\N	33	\N	\N	\N	\N	\N	18	\N	\N	\N	8	\N	\N	\N	\N	14	\N	\N	\N	24	\N	\N	3	\N
518	\N	\N	\N	\N	33	\N	\N	\N	\N	\N	18	\N	\N	\N	8	\N	\N	\N	\N	14	\N	\N	\N	24	\N	\N	3	\N
519	\N	\N	\N	\N	33	\N	\N	\N	\N	\N	18	\N	\N	\N	8	\N	\N	\N	\N	14	\N	\N	\N	24	\N	\N	3	\N
520	\N	\N	\N	\N	33	\N	\N	\N	\N	\N	18	\N	\N	\N	8	\N	\N	\N	\N	14	\N	\N	\N	24	\N	\N	3	\N
521	\N	\N	\N	\N	33	\N	\N	\N	\N	\N	18	\N	\N	\N	8	\N	\N	\N	\N	14	\N	\N	\N	24	\N	\N	3	\N
522	\N	\N	\N	\N	33	\N	\N	\N	\N	\N	18	\N	\N	\N	8	\N	\N	\N	\N	14	\N	\N	\N	24	\N	\N	3	\N
523	\N	\N	\N	\N	33	\N	\N	\N	\N	\N	18	\N	\N	\N	8	\N	\N	\N	\N	14	\N	\N	\N	24	\N	\N	\N	3
524	\N	\N	\N	\N	33	\N	\N	\N	\N	\N	18	\N	\N	\N	8	\N	\N	\N	\N	14	\N	\N	\N	24	\N	\N	\N	3
525	\N	\N	\N	\N	33	\N	\N	\N	\N	\N	18	\N	\N	\N	8	\N	\N	\N	\N	14	\N	\N	\N	24	\N	\N	\N	3
526	\N	\N	\N	\N	33	\N	\N	\N	\N	\N	18	\N	\N	\N	8	\N	\N	\N	\N	14	\N	\N	\N	24	\N	\N	\N	3
527	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	\N	\N	17	\N	\N	\N	22	\N	\N	\N	3
528	\N	\N	\N	\N	29	\N	\N	\N	\N	\N	26	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	\N	22	\N	\N	1	2
529	\N	\N	\N	\N	29	\N	\N	\N	\N	\N	26	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	\N	22	\N	\N	1	2
530	\N	\N	\N	\N	29	\N	\N	\N	\N	\N	26	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	\N	22	\N	\N	1	2
531	\N	\N	\N	\N	29	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	\N	\N	\N	14	\N	\N	7	22	\N	\N	1	2
532	\N	\N	\N	\N	29	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	\N	\N	\N	14	\N	\N	7	22	\N	\N	1	2
533	\N	\N	\N	\N	29	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	\N	\N	\N	14	\N	\N	7	22	\N	\N	1	2
534	\N	\N	\N	\N	29	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	\N	\N	\N	14	\N	\N	7	22	\N	\N	1	2
535	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	\N	\N	6	\N	\N	13	22	\N	\N	1	2
536	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	\N	\N	6	\N	\N	13	22	\N	\N	1	2
537	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	\N	\N	6	\N	\N	13	22	\N	\N	1	2
538	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	\N	\N	6	\N	\N	13	22	\N	\N	1	2
539	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	\N	\N	6	\N	\N	13	22	\N	\N	1	2
540	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	\N	\N	6	\N	\N	13	22	\N	\N	1	2
541	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	\N	\N	6	\N	\N	13	22	\N	\N	1	2
542	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	\N	\N	6	\N	\N	16	22	\N	\N	\N	\N
543	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	\N	\N	6	\N	\N	16	22	\N	\N	\N	\N
544	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	\N	\N	6	\N	\N	16	22	\N	\N	\N	\N
545	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	\N	\N	6	\N	\N	13	22	\N	\N	1	2
546	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	\N	\N	6	\N	\N	13	22	\N	\N	1	2
547	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	\N	\N	6	\N	\N	13	22	\N	\N	\N	\N
548	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	\N	\N	6	\N	\N	13	22	\N	\N	\N	\N
549	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	\N	\N	6	\N	\N	13	22	\N	\N	\N	\N
550	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	\N	\N	6	\N	\N	13	22	\N	\N	\N	\N
551	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	\N	\N	6	\N	\N	13	22	\N	\N	\N	\N
552	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	\N	\N	6	\N	\N	13	22	\N	\N	\N	\N
553	\N	\N	\N	\N	33	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	\N	\N	\N	6	\N	\N	13	23	\N	\N	\N	\N
554	\N	\N	\N	\N	33	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	\N	\N	\N	6	\N	\N	13	23	\N	\N	\N	\N
555	\N	\N	\N	\N	33	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	\N	\N	\N	6	\N	\N	13	23	\N	\N	\N	\N
556	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	\N	\N	6	\N	\N	13	22	\N	\N	1	2
557	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	\N	\N	6	\N	\N	13	22	\N	\N	1	2
558	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	\N	\N	6	\N	\N	13	22	\N	\N	1	2
559	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	\N	\N	6	\N	\N	13	22	\N	\N	1	2
560	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	\N	\N	6	\N	\N	13	22	\N	\N	1	2
561	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	\N	\N	6	\N	\N	13	22	\N	\N	1	2
562	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	\N	\N	6	\N	\N	13	22	\N	\N	1	2
563	\N	\N	\N	\N	31	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	\N	22	\N	\N	1	1
564	\N	\N	\N	\N	28	\N	\N	\N	\N	\N	26	\N	\N	\N	\N	\N	\N	\N	\N	22	\N	\N	\N	22	\N	\N	1	1
565	\N	\N	\N	\N	28	\N	\N	\N	\N	\N	26	\N	\N	\N	\N	\N	\N	\N	\N	22	\N	\N	\N	22	\N	\N	1	1
566	\N	\N	\N	\N	28	\N	\N	\N	\N	\N	26	\N	\N	\N	\N	\N	\N	\N	\N	22	\N	\N	\N	22	\N	\N	1	1
567	\N	\N	\N	\N	28	\N	\N	\N	\N	\N	26	\N	\N	\N	\N	\N	\N	\N	\N	22	\N	\N	\N	22	\N	\N	1	1
568	\N	\N	\N	\N	28	\N	\N	\N	\N	\N	26	\N	\N	\N	\N	\N	\N	\N	\N	22	\N	\N	\N	22	\N	\N	1	1
569	\N	\N	\N	\N	39	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	\N	\N	15	\N	\N	\N	20	\N	\N	1	1
570	\N	\N	\N	\N	39	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	\N	\N	15	\N	\N	\N	20	\N	\N	1	1
571	\N	\N	\N	\N	39	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	\N	\N	15	\N	\N	\N	20	\N	\N	1	1
572	\N	\N	\N	\N	39	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	\N	\N	15	\N	\N	\N	20	\N	\N	1	1
573	\N	\N	\N	\N	39	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	\N	\N	15	\N	\N	\N	20	\N	\N	1	1
574	\N	\N	\N	\N	39	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	\N	\N	15	\N	\N	\N	20	\N	\N	1	1
575	\N	\N	\N	\N	39	\N	\N	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15	14	\N	\N	1	1
576	\N	\N	\N	\N	39	\N	\N	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15	14	\N	\N	1	1
577	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	17	20	\N	\N	1	1
578	\N	\N	\N	\N	33	\N	\N	\N	\N	\N	27	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	18	20	\N	\N	1	1
579	\N	\N	\N	\N	33	\N	\N	\N	\N	\N	27	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	18	20	\N	\N	1	1
580	\N	\N	\N	\N	31	\N	\N	\N	\N	\N	29	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	18	20	\N	\N	1	1
581	\N	\N	\N	\N	31	\N	\N	\N	\N	\N	29	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	18	20	\N	\N	1	1
582	\N	\N	\N	\N	45	\N	\N	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9	14	\N	\N	1	1
583	\N	\N	\N	\N	38	\N	\N	\N	\N	\N	52	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8	0	\N	\N	1	1
584	\N	\N	\N	\N	42	\N	\N	\N	\N	\N	39	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8	9	\N	\N	1	1
585	\N	\N	\N	\N	42	\N	\N	\N	\N	\N	39	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8	9	\N	\N	1	1
586	\N	\N	\N	\N	42	\N	\N	\N	\N	\N	39	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8	9	\N	\N	1	1
587	\N	\N	\N	\N	51	\N	\N	\N	\N	\N	47	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1
588	\N	\N	\N	\N	43	\N	\N	\N	\N	\N	40	\N	\N	\N	\N	\N	\N	\N	7	\N	\N	\N	\N	8	\N	\N	1	1
589	\N	\N	\N	\N	43	\N	\N	\N	\N	\N	40	\N	\N	\N	\N	\N	\N	\N	7	\N	\N	\N	\N	8	\N	\N	1	1
590	\N	\N	\N	\N	45	\N	\N	\N	\N	\N	41	\N	\N	\N	\N	\N	\N	\N	6	\N	\N	\N	\N	7	\N	\N	1	\N
591	\N	\N	\N	\N	45	\N	\N	\N	\N	\N	41	\N	\N	\N	\N	\N	\N	\N	6	\N	\N	\N	\N	7	\N	\N	1	\N
592	\N	\N	\N	\N	45	\N	\N	\N	\N	\N	41	\N	\N	\N	\N	\N	\N	\N	6	\N	\N	\N	\N	7	\N	\N	1	\N
593	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	28	\N	\N	\N	\N	\N	\N	\N	6	\N	\N	\N	11	20	\N	\N	1	\N
594	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	\N	7	\N	\N	\N	12	18	\N	\N	1	\N
595	\N	\N	\N	\N	30	\N	\N	\N	\N	\N	31	\N	\N	\N	\N	\N	\N	\N	7	\N	\N	\N	13	18	\N	\N	1	\N
596	\N	\N	\N	\N	30	\N	\N	\N	\N	\N	31	\N	\N	\N	\N	\N	\N	\N	7	\N	\N	\N	13	18	\N	\N	1	\N
597	\N	\N	\N	\N	30	\N	\N	\N	\N	\N	31	\N	\N	\N	\N	\N	\N	\N	7	\N	\N	\N	13	18	\N	\N	1	\N
598	\N	\N	\N	\N	29	\N	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	7	\N	\N	\N	13	18	\N	\N	1	\N
599	\N	\N	\N	\N	29	\N	\N	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	\N	7	\N	\N	\N	13	20	\N	\N	1	\N
600	\N	\N	\N	\N	29	\N	\N	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	\N	7	\N	\N	\N	13	20	\N	\N	1	\N
601	\N	\N	\N	\N	29	\N	\N	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	\N	7	\N	\N	\N	13	20	\N	\N	1	\N
602	\N	\N	\N	\N	29	\N	\N	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	\N	7	\N	\N	\N	13	20	\N	\N	1	\N
603	\N	\N	\N	\N	29	\N	\N	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	\N	7	\N	\N	\N	13	20	\N	\N	1	\N
604	\N	\N	\N	\N	29	\N	\N	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	\N	7	\N	\N	\N	13	20	\N	\N	1	\N
605	\N	\N	\N	\N	29	\N	\N	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	\N	7	\N	\N	\N	13	20	\N	\N	1	\N
606	\N	\N	\N	\N	29	\N	\N	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	\N	7	\N	\N	\N	13	20	\N	\N	1	\N
607	\N	\N	\N	\N	29	\N	\N	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	\N	7	\N	\N	\N	13	20	\N	\N	1	\N
608	\N	\N	\N	\N	29	\N	\N	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	\N	7	\N	\N	\N	13	20	\N	\N	1	\N
609	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	8	\N	\N	\N	14	20	\N	\N	1	\N
610	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	8	\N	\N	\N	14	20	\N	\N	1	\N
611	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	8	\N	\N	\N	14	20	\N	\N	1	\N
612	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	8	\N	\N	\N	14	20	\N	\N	1	\N
613	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	11	\N	\N	\N	11	18	\N	\N	\N	1
614	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	11	\N	\N	\N	11	18	\N	\N	\N	1
615	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	11	\N	\N	\N	11	18	\N	\N	\N	1
616	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	11	\N	\N	\N	11	18	\N	\N	\N	1
617	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	11	\N	\N	\N	11	18	\N	\N	\N	1
618	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	11	\N	\N	\N	11	18	\N	\N	\N	1
619	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	11	\N	\N	\N	11	18	\N	\N	\N	1
620	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	11	\N	\N	\N	11	18	\N	\N	\N	1
621	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	11	\N	\N	\N	11	18	\N	\N	\N	1
622	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	11	\N	\N	\N	11	18	\N	\N	\N	1
623	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	11	\N	\N	\N	11	18	\N	\N	\N	1
624	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	9	\N	\N	\N	8	16	\N	\N	\N	1
625	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	9	\N	\N	\N	8	16	\N	\N	\N	1
626	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	9	\N	\N	\N	8	16	\N	\N	\N	1
627	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	9	\N	\N	\N	8	16	\N	\N	\N	1
628	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	7	10	\N	\N	\N	16	\N	\N	\N	1
629	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	7	10	\N	\N	\N	16	\N	\N	\N	1
630	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	7	10	\N	\N	\N	16	\N	\N	\N	1
631	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	7	10	\N	\N	\N	16	\N	\N	\N	1
632	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	7	10	\N	\N	\N	16	\N	\N	\N	1
633	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	7	10	\N	\N	\N	16	\N	\N	\N	1
634	\N	\N	\N	\N	36	\N	\N	\N	\N	\N	38	\N	\N	\N	\N	\N	\N	\N	7	10	\N	\N	\N	8	\N	\N	\N	1
635	\N	\N	\N	\N	36	\N	\N	\N	\N	\N	38	\N	\N	\N	\N	\N	\N	\N	7	10	\N	\N	\N	8	\N	\N	\N	1
636	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	7	10	\N	\N	\N	16	\N	\N	\N	1
637	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	7	10	\N	\N	\N	16	\N	\N	\N	1
638	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	7	10	\N	\N	\N	16	\N	\N	\N	1
639	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	7	10	\N	\N	\N	16	\N	\N	\N	1
640	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	7	10	\N	\N	\N	16	\N	\N	\N	1
641	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	28	\N	\N	\N	\N	\N	\N	\N	6	12	\N	\N	\N	20	\N	\N	\N	2
642	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	28	\N	\N	\N	\N	\N	\N	\N	6	12	\N	\N	\N	20	\N	\N	\N	2
643	\N	\N	\N	\N	33	\N	\N	\N	\N	\N	27	\N	\N	\N	\N	\N	\N	\N	6	11	\N	\N	\N	21	\N	\N	\N	2
644	\N	\N	\N	\N	33	\N	\N	\N	\N	\N	27	\N	\N	\N	\N	\N	\N	\N	6	11	\N	\N	\N	21	\N	\N	\N	2
645	\N	\N	\N	\N	33	\N	\N	\N	\N	\N	27	\N	\N	\N	\N	\N	\N	\N	6	11	\N	\N	\N	21	\N	\N	\N	2
646	\N	\N	\N	\N	31	\N	\N	\N	\N	\N	39	\N	\N	\N	\N	\N	\N	\N	6	10	\N	\N	\N	12	\N	\N	\N	2
647	\N	\N	\N	\N	31	\N	\N	\N	\N	\N	39	\N	\N	\N	\N	\N	\N	\N	6	10	\N	\N	\N	12	\N	\N	\N	2
648	\N	\N	\N	\N	31	\N	\N	\N	\N	\N	39	\N	\N	\N	\N	\N	\N	\N	6	10	\N	\N	\N	12	\N	\N	\N	2
649	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	41	\N	\N	\N	\N	\N	\N	\N	0	12	\N	\N	\N	10	\N	\N	\N	2
650	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	41	\N	\N	\N	\N	\N	\N	\N	0	12	\N	\N	\N	10	\N	\N	\N	2
651	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	41	\N	\N	\N	\N	\N	\N	\N	0	12	\N	\N	\N	10	\N	\N	\N	2
652	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	41	\N	\N	\N	\N	\N	\N	\N	0	12	\N	\N	\N	10	\N	\N	\N	2
653	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	41	\N	\N	\N	\N	\N	\N	\N	0	12	\N	\N	\N	10	\N	\N	\N	2
654	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	41	\N	\N	\N	\N	\N	\N	\N	0	12	\N	\N	\N	10	\N	\N	\N	2
655	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	41	\N	\N	\N	\N	\N	\N	\N	0	12	\N	\N	\N	10	\N	\N	\N	2
656	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	41	\N	\N	\N	\N	\N	\N	\N	0	12	\N	\N	\N	10	\N	\N	\N	2
657	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	41	\N	\N	\N	\N	\N	\N	\N	0	12	\N	\N	\N	10	\N	\N	\N	2
658	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	41	\N	\N	\N	\N	\N	\N	\N	0	12	\N	\N	\N	10	\N	\N	\N	2
659	\N	\N	\N	\N	29	\N	\N	\N	\N	\N	48	\N	\N	\N	\N	\N	\N	\N	6	10	\N	\N	\N	5	\N	\N	1	1
660	\N	\N	\N	\N	29	\N	\N	\N	\N	\N	48	\N	\N	\N	\N	\N	\N	\N	6	10	\N	\N	\N	5	\N	\N	1	1
661	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	41	\N	\N	\N	\N	\N	\N	\N	6	7	\N	\N	\N	10	\N	\N	\N	2
662	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	41	\N	\N	\N	\N	\N	\N	\N	6	7	\N	\N	\N	10	\N	\N	\N	2
663	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	41	\N	\N	\N	\N	\N	\N	\N	6	7	\N	\N	\N	10	\N	\N	\N	2
664	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	41	\N	\N	\N	\N	\N	\N	\N	6	7	\N	\N	\N	10	\N	\N	\N	2
665	\N	\N	\N	\N	33	\N	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	8	9	\N	\N	\N	18	\N	\N	\N	\N
666	\N	\N	\N	\N	33	\N	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	8	9	\N	\N	\N	18	\N	\N	\N	\N
667	\N	\N	\N	\N	33	\N	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	8	9	\N	\N	\N	18	\N	\N	\N	\N
668	\N	\N	\N	\N	28	\N	\N	\N	\N	\N	29	\N	\N	\N	\N	\N	\N	\N	8	13	\N	\N	\N	22	\N	\N	\N	\N
669	\N	\N	\N	\N	26	\N	\N	\N	\N	\N	27	\N	\N	\N	\N	\N	\N	\N	8	15	\N	\N	\N	24	\N	\N	\N	\N
670	\N	\N	\N	\N	26	\N	\N	\N	\N	\N	27	\N	\N	\N	\N	\N	\N	\N	8	15	\N	\N	\N	24	\N	\N	\N	\N
671	\N	\N	\N	\N	26	\N	\N	\N	\N	\N	27	\N	\N	\N	\N	\N	\N	\N	8	15	\N	\N	\N	24	\N	\N	\N	\N
672	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	23	\N	\N	\N	\N	\N	\N	\N	8	17	\N	\N	\N	24	\N	\N	4	\N
673	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	23	\N	\N	\N	\N	\N	\N	\N	8	17	\N	\N	\N	24	\N	\N	4	\N
674	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	23	\N	\N	\N	\N	\N	\N	\N	8	17	\N	\N	\N	24	\N	\N	4	\N
675	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	23	\N	\N	\N	\N	\N	\N	\N	8	17	\N	\N	\N	24	\N	\N	4	\N
676	\N	\N	\N	\N	27	\N	\N	\N	\N	\N	20	\N	\N	\N	\N	\N	\N	\N	8	17	\N	\N	\N	24	\N	\N	4	\N
677	\N	\N	\N	\N	27	\N	\N	\N	\N	\N	20	\N	\N	\N	\N	\N	\N	\N	8	17	\N	\N	\N	24	\N	\N	4	\N
678	\N	\N	\N	\N	36	\N	\N	\N	\N	\N	13	\N	\N	\N	\N	\N	\N	\N	8	14	\N	\N	\N	25	\N	\N	4	\N
679	\N	\N	\N	\N	36	\N	\N	\N	\N	\N	13	\N	\N	\N	\N	\N	\N	\N	8	14	\N	\N	\N	25	\N	\N	4	\N
680	\N	\N	\N	\N	36	\N	\N	\N	\N	\N	13	\N	\N	\N	\N	\N	\N	\N	8	14	\N	\N	\N	25	\N	\N	4	\N
681	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	\N	10	8	\N	\N	\N	20	\N	\N	\N	\N
682	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	29	\N	\N	\N	\N	\N	\N	\N	8	8	\N	\N	\N	21	\N	\N	\N	\N
683	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	29	\N	\N	\N	\N	\N	\N	\N	8	8	\N	\N	\N	21	\N	\N	\N	\N
684	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	9	8	\N	\N	\N	19	\N	\N	\N	\N
685	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	9	8	\N	\N	\N	19	\N	\N	\N	\N
686	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	31	\N	\N	\N	\N	\N	\N	\N	9	9	\N	\N	\N	17	\N	\N	\N	\N
687	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	31	\N	\N	\N	\N	\N	\N	\N	9	9	\N	\N	\N	17	\N	\N	\N	\N
688	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	31	\N	\N	\N	\N	\N	\N	\N	9	9	\N	\N	\N	17	\N	\N	\N	\N
689	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	31	\N	\N	\N	\N	\N	\N	\N	9	9	\N	\N	\N	17	\N	\N	\N	\N
690	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	44	\N	\N	\N	\N	\N	\N	\N	6	8	\N	\N	\N	8	\N	\N	\N	\N
691	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	44	\N	\N	\N	\N	\N	\N	\N	6	8	\N	\N	\N	8	\N	\N	\N	\N
692	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	46	\N	\N	\N	\N	\N	\N	\N	6	8	\N	\N	\N	8	\N	\N	\N	\N
693	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	46	\N	\N	\N	\N	\N	\N	\N	6	8	\N	\N	\N	8	\N	\N	\N	\N
694	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	41	\N	\N	\N	\N	\N	\N	\N	\N	15	\N	\N	\N	10	\N	\N	\N	\N
695	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	41	\N	\N	\N	\N	\N	\N	\N	\N	15	\N	\N	\N	10	\N	\N	\N	\N
696	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	48	\N	\N	\N	\N	\N	\N	\N	\N	12	\N	\N	\N	8	\N	\N	\N	\N
697	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	48	\N	\N	\N	\N	\N	\N	\N	\N	12	\N	\N	\N	8	\N	\N	\N	\N
698	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	48	\N	\N	\N	\N	\N	\N	\N	\N	12	\N	\N	\N	8	\N	\N	\N	\N
699	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	43	\N	\N	\N	\N	\N	\N	\N	\N	12	\N	\N	\N	10	\N	\N	\N	\N
700	\N	\N	\N	\N	38	\N	\N	\N	\N	\N	38	\N	\N	\N	\N	\N	\N	\N	\N	12	\N	\N	\N	12	\N	\N	\N	\N
701	\N	\N	\N	\N	38	\N	\N	\N	\N	\N	38	\N	\N	\N	\N	\N	\N	\N	\N	12	\N	\N	\N	12	\N	\N	\N	\N
702	\N	\N	\N	\N	38	\N	\N	\N	\N	\N	38	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12	\N	12	\N	\N	\N	\N
703	\N	\N	\N	\N	38	\N	\N	\N	\N	\N	38	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12	\N	12	\N	\N	\N	\N
704	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	\N	\N	8	\N	11	\N	19	\N	\N	\N	\N
705	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	\N	\N	8	\N	11	\N	19	\N	\N	\N	\N
706	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	22	\N	10	\N	\N	\N	\N	\N	\N	18	\N	\N	\N	18	\N	\N	\N	\N
707	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	22	\N	10	\N	\N	\N	\N	\N	\N	18	\N	\N	\N	18	\N	\N	\N	\N
708	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	22	\N	10	\N	\N	\N	\N	\N	\N	8	\N	8	\N	20	\N	\N	\N	\N
709	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	22	\N	10	\N	\N	\N	\N	\N	\N	8	\N	8	\N	20	\N	\N	\N	\N
710	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	22	\N	10	\N	\N	\N	\N	\N	\N	8	\N	8	\N	20	\N	\N	\N	\N
711	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	22	\N	10	\N	\N	\N	\N	\N	\N	8	\N	8	\N	20	\N	\N	\N	\N
712	\N	\N	\N	\N	34	\N	8	\N	\N	\N	10	\N	12	\N	\N	\N	\N	\N	\N	8	\N	8	\N	20	\N	\N	\N	\N
713	\N	\N	\N	\N	34	\N	8	\N	\N	\N	10	\N	12	\N	\N	\N	\N	\N	\N	8	\N	8	\N	20	\N	\N	\N	\N
714	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	16	\N	14	\N	\N	\N	\N	\N	\N	8	\N	8	\N	20	\N	\N	\N	\N
715	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	16	\N	15	\N	\N	\N	\N	\N	\N	\N	\N	14	\N	20	\N	\N	\N	\N
716	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	16	\N	15	\N	\N	\N	\N	\N	\N	\N	\N	14	\N	20	\N	\N	\N	\N
717	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	16	\N	15	\N	\N	\N	\N	\N	\N	\N	\N	14	\N	20	\N	\N	\N	\N
718	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	16	\N	15	\N	\N	\N	\N	\N	\N	\N	\N	14	\N	20	\N	\N	\N	\N
719	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	20	\N	18	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	17	\N	\N	\N	\N
720	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	20	\N	18	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	17	\N	\N	\N	\N
721	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	20	\N	18	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	17	\N	\N	\N	\N
722	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	20	\N	18	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	17	\N	\N	\N	\N
723	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	18	\N	20	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	17	\N	\N	\N	\N
724	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	18	\N	20	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	17	\N	\N	\N	\N
725	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	18	\N	20	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	17	\N	\N	\N	\N
726	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	10	\N	20	\N	\N	\N	\N	\N	\N	\N	\N	14	\N	19	\N	\N	2	\N
727	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	5	\N	16	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	22	\N	\N	2	\N
728	\N	\N	\N	\N	54	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	\N	10	\N	24	\N	\N	2	\N
729	\N	\N	\N	\N	50	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11	\N	\N	11	\N	26	\N	\N	2	\N
730	\N	\N	\N	\N	50	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11	\N	\N	11	\N	26	\N	\N	2	\N
731	\N	\N	\N	\N	50	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11	\N	\N	11	\N	26	\N	\N	2	\N
732	\N	\N	\N	\N	40	\N	\N	\N	\N	\N	10	\N	\N	\N	\N	\N	\N	\N	11	\N	\N	11	\N	26	\N	\N	2	\N
733	\N	\N	\N	\N	40	\N	\N	\N	\N	\N	10	\N	\N	\N	\N	\N	\N	\N	11	\N	\N	11	\N	26	\N	\N	2	\N
734	\N	\N	\N	\N	40	\N	9	\N	\N	\N	8	\N	\N	\N	\N	\N	\N	\N	12	\N	\N	8	\N	20	3	\N	\N	\N
735	\N	\N	\N	\N	40	\N	9	\N	\N	\N	8	\N	\N	\N	\N	\N	\N	\N	12	\N	\N	8	\N	20	3	\N	\N	\N
736	\N	\N	\N	\N	40	\N	9	\N	\N	\N	8	\N	\N	\N	\N	\N	\N	\N	12	\N	\N	8	\N	20	3	\N	\N	\N
737	\N	\N	\N	\N	40	\N	9	\N	\N	\N	8	\N	\N	\N	\N	\N	\N	\N	12	\N	\N	8	\N	20	3	\N	\N	\N
738	\N	\N	\N	27	15	\N	10	12	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7	\N	\N	7	\N	22	\N	\N	\N	\N
739	\N	\N	\N	27	15	\N	10	12	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7	\N	\N	7	\N	22	\N	\N	\N	\N
740	\N	\N	\N	27	15	\N	10	12	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7	\N	\N	7	\N	22	\N	\N	\N	\N
741	\N	\N	\N	27	15	\N	10	12	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7	\N	\N	7	\N	22	\N	\N	\N	\N
742	\N	\N	\N	27	15	\N	10	12	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7	\N	\N	7	\N	22	\N	\N	\N	\N
743	\N	\N	\N	27	15	\N	10	12	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7	\N	\N	7	\N	22	\N	\N	\N	\N
744	\N	\N	\N	27	13	\N	\N	\N	\N	12	\N	\N	12	\N	\N	\N	\N	\N	6	\N	\N	6	\N	24	\N	\N	\N	\N
745	\N	\N	\N	27	13	\N	\N	\N	\N	12	\N	\N	12	\N	\N	\N	\N	\N	6	\N	\N	6	\N	24	\N	\N	\N	\N
746	\N	\N	\N	27	13	\N	\N	\N	\N	12	\N	\N	12	\N	\N	\N	\N	\N	6	\N	\N	6	\N	24	\N	\N	\N	\N
747	\N	\N	\N	27	13	\N	\N	\N	\N	12	\N	\N	12	\N	\N	\N	\N	\N	6	\N	\N	6	\N	24	\N	\N	\N	\N
748	\N	\N	\N	38	\N	\N	\N	\N	\N	12	\N	\N	12	\N	\N	\N	\N	\N	6	\N	\N	6	\N	24	\N	\N	2	\N
749	\N	\N	\N	38	\N	\N	\N	\N	\N	12	\N	\N	12	\N	\N	\N	\N	\N	6	\N	\N	6	\N	24	\N	\N	2	\N
750	\N	\N	\N	38	\N	\N	\N	\N	\N	12	\N	\N	12	\N	\N	\N	\N	\N	6	\N	\N	6	\N	24	\N	\N	2	\N
751	\N	\N	\N	38	\N	\N	\N	\N	\N	12	\N	\N	12	\N	\N	\N	\N	\N	6	\N	\N	6	\N	24	\N	\N	2	\N
752	\N	\N	\N	38	\N	\N	\N	\N	\N	12	\N	\N	12	\N	\N	\N	\N	\N	6	\N	\N	6	\N	24	\N	\N	2	\N
753	\N	\N	\N	38	\N	\N	\N	\N	\N	12	\N	\N	12	\N	\N	\N	\N	\N	6	\N	\N	6	\N	24	\N	\N	2	\N
754	\N	\N	\N	38	\N	\N	\N	\N	\N	12	\N	\N	12	\N	\N	\N	\N	\N	6	\N	\N	6	\N	24	\N	\N	2	\N
755	\N	\N	\N	38	\N	\N	\N	8	\N	14	\N	\N	\N	\N	\N	\N	\N	\N	7	\N	\N	7	\N	24	\N	\N	2	\N
756	\N	\N	\N	38	\N	\N	\N	8	\N	14	\N	\N	\N	\N	\N	\N	\N	\N	7	\N	\N	7	\N	24	\N	\N	2	\N
757	\N	\N	\N	38	\N	\N	\N	8	\N	14	\N	\N	\N	\N	\N	\N	\N	\N	7	\N	\N	7	\N	24	\N	\N	2	\N
758	\N	\N	\N	38	\N	\N	\N	8	\N	14	\N	\N	\N	\N	\N	\N	\N	\N	7	\N	\N	7	\N	24	\N	\N	2	\N
759	\N	\N	\N	38	\N	\N	\N	8	\N	14	\N	\N	\N	\N	\N	\N	\N	\N	7	\N	\N	7	\N	24	\N	\N	2	\N
760	\N	\N	\N	22	15	\N	\N	8	\N	18	\N	\N	6	\N	\N	\N	\N	\N	7	\N	\N	7	\N	15	\N	\N	2	\N
761	\N	\N	\N	22	15	\N	\N	8	\N	18	\N	\N	6	\N	\N	\N	\N	\N	7	\N	\N	7	\N	15	\N	\N	2	\N
762	\N	\N	\N	22	15	\N	\N	8	\N	18	\N	\N	6	\N	\N	\N	\N	\N	7	\N	\N	7	\N	15	\N	\N	2	\N
763	\N	\N	\N	22	15	\N	\N	8	\N	14	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	\N	7	\N	22	\N	\N	2	\N
764	\N	\N	\N	22	15	\N	\N	8	\N	14	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	\N	7	\N	22	\N	\N	2	\N
765	\N	\N	\N	22	15	\N	\N	8	\N	14	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	\N	7	\N	22	\N	\N	2	\N
766	\N	\N	\N	22	15	\N	\N	8	\N	14	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	\N	7	\N	22	\N	\N	2	\N
767	\N	\N	\N	22	15	\N	\N	8	\N	14	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	\N	7	\N	22	\N	\N	2	\N
768	\N	\N	\N	22	15	\N	\N	8	\N	14	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	\N	7	\N	22	\N	\N	2	\N
769	\N	\N	\N	22	15	\N	\N	8	\N	14	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	\N	7	\N	22	\N	\N	2	\N
770	\N	\N	\N	22	15	\N	\N	8	\N	14	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	\N	7	\N	22	\N	\N	2	\N
771	\N	\N	\N	38	\N	\N	\N	8	\N	15	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	\N	7	\N	20	\N	\N	2	\N
772	\N	\N	\N	38	\N	\N	\N	8	\N	15	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	\N	7	\N	20	\N	\N	2	\N
773	\N	\N	\N	38	\N	\N	\N	8	\N	15	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	\N	7	\N	20	\N	\N	2	\N
774	\N	\N	\N	30	\N	\N	\N	8	\N	16	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	\N	12	\N	22	\N	\N	2	\N
775	\N	\N	\N	30	\N	\N	\N	8	\N	16	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	\N	12	\N	22	\N	\N	2	\N
776	\N	\N	\N	26	\N	\N	\N	\N	\N	16	\N	\N	24	\N	\N	\N	\N	\N	10	\N	\N	12	\N	10	\N	\N	2	\N
777	\N	\N	\N	26	\N	\N	\N	\N	\N	16	\N	\N	24	\N	\N	\N	\N	\N	10	\N	\N	12	\N	10	\N	\N	2	\N
778	\N	\N	\N	26	\N	\N	\N	\N	\N	16	\N	\N	24	\N	\N	\N	\N	\N	10	\N	\N	12	\N	10	\N	\N	2	\N
779	\N	\N	\N	26	\N	\N	\N	\N	\N	16	\N	\N	24	\N	\N	\N	\N	\N	10	\N	\N	12	\N	10	\N	\N	2	\N
780	\N	\N	\N	26	\N	\N	\N	\N	\N	16	\N	\N	24	\N	\N	\N	\N	\N	10	\N	\N	12	\N	10	\N	\N	2	\N
781	\N	\N	\N	26	\N	\N	\N	\N	\N	16	\N	\N	24	\N	\N	\N	\N	\N	10	\N	\N	12	\N	10	\N	\N	2	\N
782	\N	\N	\N	10	28	\N	\N	\N	\N	8	\N	\N	16	\N	\N	\N	\N	\N	6	\N	\N	6	\N	24	\N	\N	2	\N
783	\N	\N	\N	10	28	\N	\N	\N	\N	8	\N	\N	16	\N	\N	\N	\N	\N	6	\N	\N	6	\N	24	\N	\N	2	\N
784	\N	\N	\N	10	28	\N	\N	\N	\N	8	\N	\N	16	\N	\N	\N	\N	\N	6	\N	\N	6	\N	24	\N	\N	2	\N
785	\N	\N	\N	10	28	\N	\N	\N	\N	8	\N	\N	16	\N	\N	\N	\N	\N	6	\N	\N	6	\N	24	\N	\N	2	\N
786	\N	\N	\N	5	45	\N	\N	\N	\N	12	\N	\N	12	\N	\N	\N	\N	\N	\N	\N	\N	8	\N	16	\N	\N	2	\N
787	\N	\N	\N	5	45	\N	\N	\N	\N	12	\N	\N	12	\N	\N	\N	\N	\N	\N	\N	\N	8	\N	16	\N	\N	2	\N
788	\N	\N	\N	10	45	\N	\N	\N	\N	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	5	\N	\N	5	\N
789	\N	\N	\N	10	45	\N	\N	\N	\N	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	5	\N	\N	5	\N
790	\N	\N	\N	10	35	\N	\N	\N	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	\N	8	\N	8	\N	\N	5	\N
791	\N	\N	\N	15	20	\N	\N	\N	\N	\N	10	\N	16	\N	\N	\N	\N	\N	8	\N	\N	6	\N	24	\N	\N	1	\N
792	\N	\N	\N	15	20	\N	\N	\N	\N	\N	10	\N	16	\N	\N	\N	\N	\N	8	\N	\N	6	\N	24	\N	\N	1	\N
793	\N	\N	\N	15	20	\N	\N	\N	\N	\N	10	\N	16	\N	\N	\N	\N	\N	8	\N	\N	6	\N	24	\N	\N	1	\N
794	\N	\N	\N	15	20	\N	\N	\N	\N	\N	10	\N	16	\N	\N	\N	\N	\N	8	\N	\N	6	\N	24	\N	\N	1	\N
795	\N	\N	\N	15	20	\N	\N	\N	\N	\N	18	\N	8	\N	\N	\N	\N	\N	8	\N	6	\N	\N	24	\N	\N	1	\N
796	\N	\N	\N	15	20	\N	\N	\N	\N	\N	18	\N	8	\N	\N	\N	\N	\N	8	\N	6	\N	\N	24	\N	\N	1	\N
797	\N	\N	\N	15	20	\N	\N	\N	\N	\N	18	\N	8	\N	\N	\N	\N	\N	8	\N	6	\N	\N	24	\N	\N	1	\N
798	\N	\N	\N	15	20	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	\N	\N	9	\N	6	\N	\N	24	\N	\N	1	\N
799	\N	\N	\N	15	20	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	\N	\N	9	\N	6	\N	\N	24	\N	\N	1	\N
800	\N	\N	\N	15	20	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	\N	\N	9	\N	6	\N	\N	24	\N	\N	1	\N
801	\N	\N	\N	\N	29	\N	\N	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	\N	9	\N	6	\N	\N	25	\N	\N	1	\N
802	\N	\N	\N	\N	29	\N	\N	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	\N	9	\N	6	\N	\N	25	\N	\N	1	\N
803	\N	\N	\N	\N	29	\N	\N	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	\N	9	\N	6	\N	\N	25	\N	\N	1	\N
804	\N	\N	\N	\N	29	\N	\N	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	\N	9	\N	6	\N	\N	25	\N	\N	1	\N
805	\N	\N	\N	14	13	\N	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	10	\N	6	\N	\N	24	\N	\N	1	\N
806	\N	\N	\N	14	13	\N	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	10	\N	6	\N	\N	24	\N	\N	1	\N
807	\N	\N	\N	14	13	\N	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	10	\N	6	\N	\N	24	\N	\N	1	\N
808	\N	\N	\N	14	13	\N	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	10	\N	6	\N	\N	24	\N	\N	1	\N
809	\N	\N	\N	14	13	\N	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	10	\N	6	\N	\N	24	\N	\N	1	\N
810	\N	\N	\N	14	13	\N	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	10	\N	6	\N	\N	24	\N	\N	1	\N
811	\N	\N	\N	14	13	\N	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	10	\N	6	\N	\N	24	\N	\N	1	\N
812	\N	\N	\N	14	13	\N	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	10	\N	6	\N	\N	24	\N	\N	1	\N
813	\N	\N	\N	14	13	\N	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	10	\N	6	\N	\N	24	\N	\N	1	\N
814	\N	\N	\N	14	13	\N	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	10	\N	6	\N	\N	24	\N	\N	1	\N
815	\N	\N	\N	14	13	\N	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	10	\N	6	\N	\N	24	\N	\N	1	\N
816	\N	\N	\N	14	13	\N	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	10	\N	6	\N	\N	24	\N	\N	1	\N
817	\N	\N	\N	14	13	\N	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	10	\N	6	\N	\N	24	\N	\N	1	\N
818	\N	\N	\N	16	16	\N	\N	\N	\N	\N	31	\N	\N	\N	\N	\N	\N	\N	10	\N	6	\N	\N	20	\N	\N	1	\N
819	\N	\N	\N	16	16	\N	\N	\N	\N	\N	31	\N	\N	\N	\N	\N	\N	\N	10	\N	6	\N	\N	20	\N	\N	1	\N
820	\N	\N	\N	16	16	\N	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	10	\N	6	\N	\N	20	\N	\N	\N	\N
821	\N	\N	\N	16	16	\N	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	10	\N	6	\N	\N	20	\N	\N	\N	\N
822	\N	\N	\N	16	16	\N	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	10	\N	6	\N	\N	20	\N	\N	\N	\N
823	\N	\N	\N	16	16	\N	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	10	\N	6	\N	\N	20	\N	\N	\N	\N
824	\N	\N	\N	16	16	\N	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	10	\N	6	\N	\N	20	\N	\N	\N	\N
825	\N	\N	\N	16	16	\N	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	10	\N	6	\N	\N	20	\N	\N	\N	\N
826	\N	\N	\N	16	16	\N	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	10	\N	6	\N	\N	20	\N	\N	\N	\N
827	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	22	\N	14	\N	\N	\N	\N	\N	8	\N	6	\N	\N	18	\N	\N	\N	\N
828	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	22	\N	14	\N	\N	\N	\N	\N	8	\N	6	\N	\N	18	\N	\N	\N	\N
829	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	22	\N	14	\N	\N	\N	\N	\N	8	\N	6	\N	\N	18	\N	\N	\N	\N
830	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	22	\N	14	\N	\N	\N	\N	\N	8	\N	6	\N	\N	18	\N	\N	\N	\N
831	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	22	\N	14	\N	\N	\N	\N	\N	8	\N	6	\N	\N	18	\N	\N	\N	\N
832	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	22	\N	20	\N	\N	\N	\N	\N	10	\N	10	\N	\N	6	\N	\N	\N	\N
833	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	22	\N	20	\N	\N	\N	\N	\N	10	\N	10	\N	\N	6	\N	\N	\N	\N
834	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	22	\N	20	\N	\N	\N	\N	\N	10	\N	10	\N	\N	6	\N	\N	\N	\N
835	\N	\N	24	6	\N	\N	\N	\N	\N	\N	27	\N	5	\N	\N	\N	\N	\N	7	\N	6	\N	\N	25	\N	\N	\N	\N
836	\N	\N	24	6	\N	\N	\N	\N	\N	\N	27	\N	5	\N	\N	\N	\N	\N	7	\N	6	\N	\N	25	\N	\N	\N	\N
837	\N	\N	24	6	\N	\N	\N	\N	\N	\N	27	\N	5	\N	\N	\N	\N	\N	7	\N	6	\N	\N	25	\N	\N	\N	\N
838	\N	\N	24	6	\N	\N	\N	\N	\N	\N	27	\N	5	\N	\N	\N	\N	\N	7	\N	6	\N	\N	25	\N	\N	\N	\N
839	\N	\N	24	6	\N	\N	\N	\N	\N	\N	27	\N	5	\N	\N	\N	\N	\N	7	\N	6	\N	\N	25	\N	\N	\N	\N
840	\N	\N	24	6	\N	\N	\N	\N	\N	\N	27	\N	5	\N	\N	\N	\N	\N	7	\N	6	\N	\N	25	\N	\N	\N	\N
841	\N	\N	24	6	\N	\N	\N	\N	\N	\N	30	\N	5	\N	\N	\N	\N	\N	7	\N	6	\N	\N	22	\N	\N	\N	\N
842	\N	\N	24	6	\N	\N	\N	\N	\N	\N	30	\N	5	\N	\N	\N	\N	\N	7	\N	6	\N	\N	22	\N	\N	\N	\N
843	\N	\N	24	6	\N	\N	\N	\N	\N	\N	30	\N	5	\N	\N	\N	\N	\N	7	\N	6	\N	\N	22	\N	\N	\N	\N
844	\N	\N	24	6	\N	\N	\N	\N	\N	\N	30	\N	5	\N	\N	\N	\N	\N	7	\N	6	\N	\N	22	\N	\N	\N	\N
845	\N	\N	24	6	\N	\N	\N	\N	\N	\N	27	\N	5	\N	\N	\N	\N	\N	7	\N	6	\N	\N	25	\N	\N	\N	\N
846	\N	\N	24	6	\N	\N	\N	\N	\N	\N	27	\N	5	\N	\N	\N	\N	\N	7	\N	6	\N	\N	25	\N	\N	\N	\N
847	\N	\N	24	6	\N	\N	\N	\N	\N	\N	27	\N	5	\N	\N	\N	\N	\N	7	\N	6	\N	\N	25	\N	\N	\N	\N
848	\N	\N	24	6	\N	\N	\N	\N	\N	\N	27	\N	5	\N	\N	\N	\N	\N	7	\N	6	\N	\N	25	\N	\N	\N	\N
849	\N	\N	24	6	\N	\N	\N	\N	\N	\N	27	\N	5	\N	\N	\N	\N	\N	7	\N	6	\N	\N	25	\N	\N	\N	\N
850	\N	\N	24	11	\N	\N	\N	\N	\N	\N	32	\N	5	\N	\N	\N	\N	6	7	\N	\N	\N	\N	15	\N	\N	\N	\N
851	\N	\N	24	11	\N	\N	\N	\N	\N	\N	32	\N	5	\N	\N	\N	\N	6	7	\N	\N	\N	\N	15	\N	\N	\N	\N
852	\N	\N	22	11	\N	\N	\N	\N	\N	\N	29	\N	6	\N	\N	\N	\N	\N	6	\N	6	\N	\N	20	\N	\N	\N	\N
853	\N	\N	22	11	\N	\N	\N	\N	\N	\N	29	\N	6	\N	\N	\N	\N	\N	6	\N	6	\N	\N	20	\N	\N	\N	\N
854	\N	\N	15	15	\N	\N	\N	\N	\N	\N	28	\N	8	\N	\N	\N	\N	8	6	\N	\N	\N	\N	20	\N	\N	\N	\N
855	\N	\N	15	15	\N	\N	\N	\N	\N	\N	28	\N	8	\N	\N	\N	\N	8	6	\N	\N	\N	\N	20	\N	\N	\N	\N
856	\N	\N	15	15	\N	\N	\N	\N	\N	\N	26	\N	8	\N	\N	\N	\N	6	8	\N	\N	\N	\N	22	\N	\N	\N	\N
857	\N	\N	16	16	\N	\N	\N	\N	\N	\N	26	\N	8	\N	\N	\N	\N	6	8	\N	\N	\N	\N	20	\N	\N	\N	\N
858	\N	\N	16	16	\N	\N	\N	\N	\N	\N	26	\N	8	\N	\N	\N	\N	6	8	\N	\N	\N	\N	20	\N	\N	\N	\N
859	\N	\N	16	16	\N	\N	\N	\N	\N	\N	26	\N	8	\N	\N	\N	\N	6	8	\N	\N	\N	\N	20	\N	\N	\N	\N
860	\N	\N	16	16	\N	\N	\N	\N	\N	\N	26	\N	8	\N	\N	\N	\N	6	8	\N	\N	\N	\N	20	\N	\N	\N	\N
861	\N	\N	16	16	\N	\N	\N	\N	\N	\N	26	\N	8	\N	\N	\N	\N	6	8	\N	\N	\N	\N	20	\N	\N	\N	\N
862	\N	\N	16	16	\N	\N	\N	\N	\N	\N	26	\N	8	\N	\N	\N	\N	6	8	\N	\N	\N	\N	20	\N	\N	\N	\N
863	\N	\N	16	16	\N	\N	\N	\N	\N	\N	26	\N	8	\N	\N	\N	\N	6	8	\N	\N	\N	\N	20	\N	\N	\N	\N
864	\N	\N	16	16	\N	\N	\N	\N	\N	\N	26	\N	8	\N	\N	\N	\N	6	8	\N	\N	\N	\N	20	\N	\N	\N	\N
865	\N	\N	16	16	\N	\N	\N	\N	\N	\N	26	\N	8	\N	\N	\N	\N	6	8	\N	\N	\N	\N	20	\N	\N	\N	\N
866	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	21	\N	6	\N	\N	\N	\N	17	\N	\N	\N	\N	\N	24	\N	\N	\N	\N
867	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	16	\N	10	\N	\N	\N	\N	\N	9	\N	7	\N	\N	24	\N	\N	\N	\N
868	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	16	\N	10	\N	\N	\N	\N	\N	9	\N	7	\N	\N	24	\N	\N	\N	\N
869	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	16	\N	10	\N	\N	\N	\N	\N	9	\N	7	\N	\N	24	\N	\N	\N	\N
870	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	16	\N	10	\N	\N	\N	\N	\N	9	\N	7	\N	\N	24	\N	\N	\N	\N
871	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	16	\N	10	\N	\N	\N	\N	\N	9	\N	7	\N	\N	24	\N	\N	\N	\N
872	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	16	\N	10	\N	\N	\N	\N	\N	9	\N	7	\N	\N	24	\N	\N	\N	\N
873	\N	\N	22	10	\N	\N	\N	\N	\N	\N	16	\N	10	\N	\N	\N	\N	\N	9	\N	7	\N	\N	24	\N	2	\N	\N
874	\N	\N	22	10	\N	\N	\N	\N	\N	\N	16	\N	10	\N	\N	\N	\N	\N	9	\N	7	\N	\N	24	\N	2	\N	\N
875	\N	\N	25	6	\N	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	9	8	\N	\N	\N	\N	24	\N	2	2	\N
876	\N	\N	25	6	\N	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	9	8	\N	\N	\N	\N	24	\N	2	2	\N
877	\N	\N	25	6	\N	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	9	8	\N	\N	\N	\N	24	\N	2	2	\N
878	\N	\N	25	6	\N	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	9	8	\N	\N	\N	\N	24	\N	2	2	\N
879	\N	\N	25	6	\N	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	9	8	\N	\N	\N	\N	24	\N	2	2	\N
880	\N	\N	25	6	\N	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	9	8	\N	\N	\N	\N	24	\N	2	2	\N
881	\N	\N	25	6	\N	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	9	8	\N	\N	\N	\N	24	\N	2	2	\N
882	\N	\N	25	6	\N	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	9	8	\N	\N	\N	\N	24	\N	\N	4	\N
883	\N	\N	25	6	\N	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	9	8	\N	\N	\N	\N	24	\N	\N	4	\N
884	\N	\N	25	6	\N	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	9	8	\N	\N	\N	\N	24	\N	\N	4	\N
885	\N	\N	25	6	\N	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	9	8	\N	\N	\N	\N	24	\N	\N	4	\N
886	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	19	\N	\N	\N	\N	\N	21	\N	\N	4	\N
887	\N	\N	\N	33	\N	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	19	\N	\N	\N	\N	\N	20	\N	\N	4	\N
888	\N	\N	17	17	\N	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	21	\N	\N	\N	\N	\N	17	\N	\N	4	\N
889	\N	\N	17	17	\N	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	21	\N	\N	\N	\N	\N	17	\N	\N	4	\N
890	\N	\N	17	17	\N	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	21	\N	\N	\N	\N	\N	17	\N	\N	4	\N
891	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	26	\N	\N	\N	\N	\N	\N	18	\N	\N	\N	\N	\N	18	\N	2	2	\N
892	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	26	\N	\N	\N	\N	\N	\N	18	\N	\N	\N	\N	\N	18	\N	2	2	\N
893	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	26	\N	\N	\N	\N	\N	\N	18	\N	\N	\N	\N	\N	18	\N	2	2	\N
894	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	26	\N	\N	\N	\N	\N	\N	18	\N	\N	\N	\N	\N	18	\N	\N	4	\N
895	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	26	\N	\N	\N	\N	\N	\N	18	\N	\N	\N	\N	\N	18	\N	\N	4	\N
896	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	26	\N	\N	\N	\N	\N	\N	18	\N	\N	\N	\N	\N	18	\N	\N	4	\N
897	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	31	\N	\N	\N	\N	\N	\N	12	6	\N	\N	\N	\N	13	\N	\N	4	\N
898	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	31	\N	\N	\N	\N	\N	\N	12	6	\N	\N	\N	\N	13	\N	\N	4	\N
899	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	14	\N	\N	\N	\N	13	\N	\N	4	\N
900	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	14	\N	\N	\N	\N	13	\N	\N	4	\N
901	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	33	\N	\N	\N	\N	\N	\N	\N	14	\N	\N	\N	\N	15	\N	\N	4	\N
902	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	33	\N	\N	\N	\N	\N	\N	\N	14	\N	\N	\N	\N	15	\N	\N	4	\N
903	\N	\N	\N	40	\N	\N	\N	\N	\N	\N	14	8	\N	\N	\N	\N	\N	\N	14	\N	\N	\N	\N	20	\N	\N	4	\N
904	\N	\N	\N	40	\N	\N	\N	\N	\N	\N	14	8	\N	\N	\N	\N	\N	\N	14	\N	\N	\N	\N	20	\N	\N	4	\N
905	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	14	8	\N	\N	\N	\N	\N	9	9	\N	\N	\N	\N	22	\N	\N	4	\N
906	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	14	8	\N	\N	\N	\N	\N	9	9	\N	\N	\N	\N	22	\N	\N	4	\N
907	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	14	8	\N	\N	\N	\N	\N	9	9	\N	\N	\N	\N	22	\N	\N	4	\N
908	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	14	8	\N	\N	\N	\N	\N	9	9	\N	\N	\N	\N	22	\N	\N	4	\N
909	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	14	8	\N	\N	\N	\N	\N	9	9	\N	\N	\N	\N	22	\N	\N	4	\N
910	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	14	8	\N	\N	\N	\N	\N	9	9	\N	\N	\N	\N	22	\N	\N	4	\N
911	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	14	8	\N	\N	\N	\N	\N	9	9	\N	\N	\N	\N	22	\N	\N	4	\N
912	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	14	8	\N	\N	\N	\N	\N	9	9	\N	\N	\N	\N	22	\N	\N	4	\N
913	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	14	8	\N	\N	\N	\N	\N	9	9	\N	\N	\N	\N	22	\N	\N	4	\N
914	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	14	8	\N	\N	\N	\N	\N	9	9	\N	\N	\N	\N	22	\N	\N	4	\N
915	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	14	8	\N	\N	\N	\N	\N	9	9	\N	\N	\N	\N	22	\N	\N	4	\N
916	\N	\N	\N	33	\N	\N	\N	\N	\N	\N	12	10	\N	\N	\N	\N	\N	\N	9	\N	9	\N	\N	23	\N	\N	4	\N
917	\N	\N	\N	33	\N	\N	\N	\N	\N	\N	12	10	\N	\N	\N	\N	\N	\N	9	\N	9	\N	\N	23	\N	\N	4	\N
918	\N	\N	\N	33	\N	\N	\N	\N	\N	\N	12	10	\N	\N	\N	\N	\N	\N	9	\N	9	\N	\N	23	\N	\N	4	\N
919	\N	\N	\N	33	\N	\N	\N	\N	\N	\N	12	10	\N	\N	\N	\N	\N	\N	9	\N	9	\N	\N	23	\N	\N	4	\N
920	\N	\N	\N	33	\N	\N	\N	\N	\N	\N	12	10	\N	\N	\N	\N	\N	\N	9	\N	9	\N	\N	23	\N	\N	4	\N
921	\N	\N	\N	33	\N	\N	\N	\N	\N	\N	14	10	\N	\N	\N	\N	\N	16	\N	\N	\N	\N	\N	23	\N	\N	4	\N
922	\N	\N	\N	33	\N	\N	\N	\N	\N	\N	14	10	\N	\N	\N	\N	\N	16	\N	\N	\N	\N	\N	23	\N	\N	4	\N
923	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	\N	16	\N	\N	\N	\N	\N	23	\N	\N	4	\N
924	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	\N	16	\N	\N	\N	\N	\N	23	\N	\N	4	\N
925	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	\N	16	\N	\N	\N	\N	\N	23	\N	\N	4	\N
926	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	\N	16	\N	\N	\N	\N	\N	23	\N	\N	4	\N
927	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	27	\N	\N	\N	\N	\N	\N	18	\N	\N	\N	\N	\N	23	\N	\N	\N	\N
928	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	27	\N	\N	\N	\N	\N	\N	18	\N	\N	\N	\N	\N	23	\N	\N	\N	\N
929	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	27	\N	\N	\N	\N	\N	\N	18	\N	\N	\N	\N	\N	23	\N	\N	\N	\N
930	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	27	\N	\N	\N	\N	\N	\N	18	\N	\N	\N	\N	\N	23	\N	\N	\N	\N
931	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	12	15	\N	\N	\N	\N	\N	18	\N	\N	\N	\N	\N	23	\N	\N	\N	\N
932	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	12	15	\N	\N	\N	\N	\N	18	\N	\N	\N	\N	\N	23	\N	\N	\N	\N
933	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	12	15	\N	\N	\N	\N	\N	18	\N	\N	\N	\N	\N	23	\N	\N	\N	\N
934	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	12	15	\N	\N	\N	\N	\N	18	\N	\N	\N	\N	\N	23	\N	\N	\N	\N
935	\N	\N	\N	28	\N	\N	\N	\N	\N	\N	7	20	\N	\N	\N	\N	\N	20	\N	\N	\N	\N	\N	25	\N	\N	\N	\N
936	\N	\N	\N	28	\N	\N	\N	\N	\N	\N	7	20	\N	\N	\N	\N	\N	20	\N	\N	\N	\N	\N	25	\N	\N	\N	\N
937	\N	\N	\N	28	\N	\N	\N	\N	\N	\N	7	20	\N	\N	\N	\N	\N	20	\N	\N	\N	\N	\N	25	\N	\N	\N	\N
938	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	10	\N	\N	\N	\N	17	18	\N	\N	\N	\N	\N	23	\N	\N	\N	\N
939	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	\N	12	\N	\N	\N	\N	17	18	\N	\N	\N	\N	\N	23	\N	\N	\N	\N
940	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	\N	12	\N	\N	\N	\N	17	18	\N	\N	\N	\N	\N	23	\N	\N	\N	\N
941	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	\N	12	\N	\N	\N	\N	17	18	\N	\N	\N	\N	\N	23	\N	\N	\N	\N
942	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	\N	12	\N	\N	\N	\N	17	16	\N	\N	\N	\N	\N	23	\N	\N	\N	2
943	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	\N	12	\N	\N	\N	\N	17	16	\N	\N	\N	\N	\N	23	\N	\N	\N	2
944	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	\N	12	\N	\N	\N	\N	16	14	\N	\N	\N	\N	\N	15	\N	\N	\N	13
945	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	29	16	\N	\N	\N	\N	\N	15	\N	\N	\N	8
946	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	29	16	\N	\N	\N	\N	\N	15	\N	\N	\N	8
947	\N	\N	\N	37	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	20	\N	\N	\N	\N	\N	28	\N	\N	\N	5
948	\N	\N	\N	37	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	20	\N	\N	\N	\N	\N	28	\N	\N	\N	5
949	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	18	\N	\N	\N	\N	\N	20	\N	\N	\N	5
950	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	18	\N	\N	\N	\N	\N	20	\N	\N	\N	5
951	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	27	16	\N	\N	\N	\N	\N	20	\N	\N	\N	3
952	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	27	16	\N	\N	\N	\N	\N	20	\N	\N	\N	3
953	\N	\N	\N	38	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	27	10	\N	\N	\N	\N	\N	22	\N	\N	\N	3
954	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	27	16	\N	\N	\N	\N	\N	22	\N	\N	\N	3
955	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	27	16	\N	\N	\N	\N	\N	22	\N	\N	\N	3
956	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	27	16	\N	\N	\N	\N	\N	22	\N	\N	\N	3
957	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	27	16	\N	\N	\N	\N	\N	22	\N	\N	\N	3
958	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	27	16	\N	\N	\N	\N	\N	22	\N	\N	\N	3
959	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	29	\N	\N	\N	\N	\N	\N	18	\N	\N	\N	\N	\N	18	\N	\N	\N	3
960	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	29	\N	\N	\N	\N	\N	\N	18	\N	\N	\N	\N	\N	18	\N	\N	\N	3
961	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	29	\N	\N	\N	\N	\N	\N	18	\N	\N	\N	\N	\N	18	\N	\N	\N	3
962	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	29	\N	\N	\N	\N	\N	\N	18	\N	\N	\N	\N	\N	15	\N	3	\N	3
963	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	29	\N	\N	\N	\N	\N	\N	18	\N	\N	\N	\N	\N	15	\N	3	\N	3
964	\N	\N	\N	26	\N	\N	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	22	\N	\N	\N	\N	\N	17	\N	3	\N	\N
965	\N	\N	\N	26	\N	\N	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	22	\N	\N	\N	\N	\N	17	\N	3	\N	\N
966	\N	\N	\N	31	\N	\N	\N	\N	\N	\N	27	\N	\N	\N	\N	\N	\N	17	\N	\N	\N	\N	\N	22	\N	3	\N	\N
967	\N	\N	\N	31	\N	\N	\N	\N	\N	\N	27	\N	\N	\N	\N	\N	\N	17	\N	\N	\N	\N	\N	22	\N	3	\N	\N
968	\N	\N	\N	31	\N	\N	\N	\N	\N	\N	27	\N	\N	\N	\N	\N	\N	17	\N	\N	\N	\N	\N	22	\N	3	\N	\N
969	\N	\N	\N	31	\N	\N	\N	\N	\N	\N	15	12	\N	\N	\N	\N	\N	17	\N	\N	\N	\N	\N	22	\N	3	\N	\N
970	\N	\N	\N	31	\N	\N	\N	\N	\N	\N	15	12	\N	\N	\N	\N	\N	17	\N	\N	\N	\N	\N	22	\N	3	\N	\N
971	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	7	20	\N	\N	\N	\N	\N	17	\N	\N	\N	\N	\N	22	\N	\N	\N	\N
972	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	14	\N	\N	\N	\N	22	14	\N	\N	\N	\N	\N	18	\N	\N	\N	\N
973	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	14	\N	\N	\N	\N	22	14	\N	\N	\N	\N	\N	18	\N	\N	\N	\N
974	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	14	\N	\N	\N	\N	22	14	\N	\N	\N	\N	\N	18	\N	\N	\N	\N
975	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	30	18	\N	\N	\N	\N	\N	20	\N	\N	\N	\N
976	\N	\N	\N	38	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	22	17	\N	\N	\N	\N	\N	23	\N	\N	\N	\N
977	\N	\N	\N	38	\N	\N	\N	\N	\N	\N	\N	10	\N	\N	\N	\N	12	17	\N	\N	\N	\N	\N	23	\N	\N	\N	\N
978	\N	\N	\N	38	\N	\N	\N	\N	\N	\N	\N	10	\N	\N	\N	\N	12	17	\N	\N	\N	\N	\N	23	\N	\N	\N	\N
979	\N	\N	\N	38	\N	\N	\N	\N	\N	\N	\N	10	\N	\N	\N	\N	12	17	\N	\N	\N	\N	\N	23	\N	\N	\N	\N
980	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	25	17	\N	\N	\N	\N	\N	21	\N	\N	\N	\N
981	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	25	17	\N	\N	\N	\N	\N	21	\N	\N	\N	\N
982	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	25	17	\N	\N	\N	\N	\N	21	\N	\N	\N	\N
983	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	11	\N	\N	\N	\N	34	10	\N	\N	\N	\N	\N	11	\N	\N	\N	\N
984	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	11	\N	\N	\N	\N	34	10	\N	\N	\N	\N	\N	11	\N	\N	\N	\N
985	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	11	\N	\N	\N	\N	\N	31	10	\N	\N	\N	\N	\N	11	\N	3	\N	\N
986	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	11	\N	\N	\N	\N	\N	31	10	\N	\N	\N	\N	\N	11	\N	3	\N	\N
987	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	11	\N	\N	\N	\N	\N	31	10	\N	\N	\N	\N	\N	11	\N	3	\N	\N
988	\N	\N	33	\N	\N	\N	\N	\N	\N	\N	\N	11	\N	\N	\N	\N	25	10	\N	\N	\N	\N	\N	18	\N	3	\N	\N
989	\N	\N	33	\N	\N	\N	\N	\N	\N	\N	\N	11	\N	\N	\N	\N	25	10	\N	\N	\N	\N	\N	18	\N	3	\N	\N
990	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	\N	\N	\N	17	15	\N	\N	\N	\N	\N	23	\N	\N	\N	\N
991	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	\N	\N	\N	17	15	\N	\N	\N	\N	\N	23	\N	\N	\N	\N
992	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	27	17	\N	\N	\N	\N	\N	24	\N	\N	\N	\N
993	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	27	17	\N	\N	\N	\N	\N	24	\N	\N	\N	\N
994	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	27	17	\N	\N	\N	\N	\N	24	\N	\N	\N	\N
995	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	27	17	\N	\N	\N	\N	\N	24	\N	\N	\N	\N
996	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	14	\N	\N	\N	\N	13	17	\N	\N	\N	\N	\N	24	\N	\N	\N	\N
\.


--
-- TOC entry 5136 (class 0 OID 41537)
-- Dependencies: 228
-- Data for Name: coal_blend_ratio_all; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coal_blend_ratio_all (blend_id, "Riverside", "Moranbah North", "Illawara (PHCC)", "Goonyella", "Caval Ridge", "PDN", "Poitrel", "Amonate", "Aus.SHCC", "Teck Venture", "Lake Vermont", "Metropolitan", "Indonasian", "Low Ash SHCC/ SHCC-BHP", "Eagle crrek", "Dhamra SHCC PDN", "Daunia (SHCC)", "Leer", "Elga", "Leer/Russian HFCC", "Uvalnaya", "Blue creek", "Mt. Laurel", "R.PCI", "E.Soft", "Indian Coal Dhanbaad", "Scratch Coal", "HCC/ SHCC Contaminated Coal") FROM stdin;
1	\N	\N	\N	40	\N	\N	32	\N	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	16	\N	\N	\N	\N
2	\N	\N	\N	40	\N	\N	32	\N	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	16	\N	\N	\N	\N
3	\N	\N	\N	34	\N	\N	38	\N	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	16	\N	\N	\N	\N
4	\N	\N	\N	34	\N	\N	38	\N	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	16	\N	\N	\N	\N
5	\N	\N	\N	34	\N	\N	38	\N	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	16	\N	\N	\N	\N
6	\N	\N	\N	40	\N	\N	32	\N	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	16	\N	\N	\N	\N
7	\N	\N	\N	40	\N	\N	32	\N	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	16	\N	\N	\N	\N
8	\N	\N	\N	40	\N	\N	32	\N	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	16	\N	\N	\N	\N
9	\N	\N	\N	40	\N	\N	29	\N	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	16	\N	\N	\N	\N
10	\N	\N	\N	45	\N	\N	29	\N	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	11	\N	\N	\N	\N
11	\N	\N	\N	45	\N	\N	29	\N	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	11	\N	\N	\N	\N
12	\N	\N	\N	45	\N	\N	29	\N	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	11	\N	\N	\N	\N
13	\N	\N	\N	45	\N	\N	29	\N	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	11	\N	\N	\N	\N
14	\N	\N	\N	45	\N	\N	29	\N	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	11	\N	\N	\N	\N
15	\N	\N	\N	\N	39	\N	13	\N	\N	\N	\N	\N	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	10	8	\N	\N	\N	\N
16	\N	\N	\N	\N	39	\N	13	\N	\N	\N	\N	\N	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	10	8	\N	\N	\N	\N
17	\N	\N	\N	\N	39	\N	13	\N	\N	\N	\N	\N	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	10	8	\N	\N	\N	\N
18	\N	\N	\N	\N	39	\N	13	\N	\N	\N	\N	\N	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	10	8	\N	\N	\N	\N
19	\N	\N	\N	\N	39	\N	13	\N	\N	\N	\N	\N	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	10	8	\N	\N	\N	\N
20	\N	\N	\N	\N	39	\N	13	\N	\N	\N	\N	\N	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	10	8	\N	\N	\N	\N
21	\N	\N	\N	\N	36	\N	13	\N	\N	\N	\N	\N	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	10	11	\N	\N	\N	\N
22	\N	\N	\N	\N	36	\N	13	\N	\N	\N	\N	\N	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	10	11	\N	\N	\N	\N
23	\N	\N	\N	\N	36	\N	13	\N	\N	\N	\N	\N	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	10	11	\N	\N	\N	\N
24	\N	\N	\N	\N	36	\N	13	\N	\N	\N	\N	\N	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	10	11	\N	\N	\N	\N
25	\N	\N	\N	\N	36	\N	13	\N	\N	\N	\N	\N	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	10	11	\N	\N	\N	\N
26	\N	\N	\N	\N	34	\N	41	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	10	\N	\N	5	\N
27	\N	\N	\N	\N	34	\N	41	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	10	\N	\N	5	\N
28	\N	\N	\N	\N	34	\N	41	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	10	\N	\N	5	\N
29	\N	\N	\N	\N	34	\N	41	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	10	\N	\N	5	\N
30	\N	\N	\N	\N	36	\N	41	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	8	\N	\N	5	\N
31	\N	\N	\N	\N	36	\N	41	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	8	\N	\N	5	\N
32	\N	\N	\N	\N	37	\N	41	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	7	\N	\N	5	\N
33	\N	\N	\N	\N	37	\N	41	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	7	\N	\N	5	\N
34	\N	\N	\N	\N	37	\N	41	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	7	\N	\N	5	\N
35	\N	\N	\N	\N	37	\N	41	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	7	\N	\N	5	\N
36	\N	\N	\N	\N	37	\N	41	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	7	\N	\N	5	\N
37	\N	\N	\N	\N	37	\N	41	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	7	\N	\N	5	\N
38	\N	\N	\N	\N	39	\N	39	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	7	\N	\N	5	\N
39	\N	\N	\N	\N	39	\N	39	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	7	\N	\N	5	\N
40	\N	\N	\N	\N	39	\N	39	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	7	\N	\N	5	\N
41	\N	\N	\N	\N	40	\N	37	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	8	\N	\N	5	\N
42	\N	\N	\N	\N	40	\N	37	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	8	\N	\N	5	\N
43	\N	\N	\N	\N	40	\N	37	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	8	\N	\N	5	\N
44	\N	\N	\N	\N	45	\N	22	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9	14	\N	\N	10	\N
45	\N	\N	\N	\N	45	\N	22	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9	14	\N	\N	10	\N
46	\N	\N	\N	\N	45	\N	22	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9	14	\N	\N	10	\N
47	\N	\N	\N	16	30	\N	12	\N	15	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9	7	\N	\N	11	\N
48	\N	\N	\N	16	30	\N	12	\N	15	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9	7	\N	\N	11	\N
49	\N	\N	\N	16	30	\N	12	\N	15	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9	7	\N	\N	11	\N
50	\N	\N	\N	16	30	\N	14	\N	13	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7	9	\N	\N	11	\N
51	\N	\N	\N	16	30	\N	14	\N	13	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7	9	\N	\N	11	\N
52	\N	\N	\N	13	20	\N	25	\N	14	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9	6	\N	\N	13	\N
53	\N	\N	\N	13	20	\N	25	\N	14	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9	6	\N	\N	13	\N
54	\N	\N	\N	13	20	\N	25	\N	14	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9	6	\N	\N	13	\N
55	\N	\N	\N	13	20	\N	25	\N	14	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9	6	\N	\N	13	\N
56	\N	\N	\N	\N	35	\N	25	\N	12	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9	6	\N	\N	13	\N
57	\N	\N	\N	\N	35	\N	25	\N	12	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9	6	\N	\N	13	\N
58	\N	\N	\N	\N	35	\N	25	\N	12	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9	6	\N	\N	13	\N
59	\N	\N	\N	\N	35	\N	25	\N	12	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9	6	\N	\N	13	\N
60	\N	\N	\N	\N	35	\N	25	\N	12	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9	6	\N	\N	13	\N
61	\N	\N	\N	\N	40	\N	25	\N	4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	13	10	\N	\N	8	\N
62	\N	\N	\N	\N	40	\N	25	\N	4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	13	10	\N	\N	8	\N
63	\N	\N	\N	\N	40	\N	25	\N	4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	13	10	\N	\N	8	\N
64	\N	\N	\N	\N	40	\N	25	\N	4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	13	10	\N	\N	8	\N
65	\N	\N	\N	\N	40	\N	25	\N	4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	13	10	\N	\N	8	\N
66	\N	\N	\N	\N	40	\N	25	\N	4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	13	10	\N	\N	8	\N
67	\N	\N	\N	\N	40	\N	25	\N	4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	13	10	\N	\N	8	\N
68	\N	\N	\N	\N	40	\N	25	\N	4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	13	10	\N	\N	8	\N
69	\N	\N	\N	\N	40	\N	25	\N	4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	13	10	\N	\N	8	\N
70	\N	\N	\N	\N	40	\N	25	\N	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	13	10	\N	\N	6	\N
71	\N	\N	\N	\N	\N	40	\N	\N	22	\N	\N	\N	\N	\N	10	\N	\N	\N	\N	\N	\N	\N	10	10	\N	\N	8	\N
72	\N	\N	\N	\N	\N	40	\N	\N	22	\N	\N	\N	\N	\N	10	\N	\N	\N	\N	\N	\N	\N	10	10	\N	\N	8	\N
73	\N	\N	\N	\N	\N	40	\N	\N	22	\N	\N	\N	\N	\N	10	\N	\N	\N	\N	\N	\N	\N	10	10	\N	\N	8	\N
74	\N	\N	\N	\N	\N	40	\N	\N	22	\N	\N	\N	\N	\N	10	\N	\N	\N	\N	\N	\N	\N	10	10	\N	\N	8	\N
75	\N	\N	\N	\N	\N	40	\N	\N	22	\N	\N	\N	\N	\N	10	\N	\N	\N	\N	\N	\N	\N	10	10	\N	\N	8	\N
76	\N	\N	\N	\N	\N	50	\N	\N	22	\N	\N	\N	\N	\N	10	\N	\N	\N	\N	\N	\N	\N	8	2	\N	\N	8	\N
77	\N	\N	\N	\N	\N	50	\N	\N	22	\N	\N	\N	\N	\N	10	\N	\N	\N	\N	\N	\N	\N	8	2	\N	\N	8	\N
78	\N	\N	\N	\N	\N	50	\N	\N	22	\N	\N	\N	\N	\N	10	\N	\N	\N	\N	\N	\N	\N	8	2	\N	\N	8	\N
79	\N	\N	\N	\N	\N	50	\N	\N	22	\N	\N	\N	\N	\N	10	\N	\N	\N	\N	\N	\N	\N	8	2	\N	\N	8	\N
80	\N	\N	\N	\N	\N	42	\N	\N	22	\N	\N	\N	\N	\N	10	\N	\N	\N	\N	\N	\N	\N	8	10	\N	\N	8	\N
81	\N	\N	\N	\N	\N	42	\N	\N	22	\N	\N	\N	\N	\N	10	\N	\N	\N	\N	\N	\N	\N	8	10	\N	\N	8	\N
82	\N	\N	\N	\N	\N	42	\N	\N	22	\N	\N	\N	\N	\N	10	\N	\N	\N	\N	\N	\N	\N	8	10	\N	\N	8	\N
83	\N	\N	\N	\N	\N	42	\N	\N	22	\N	\N	\N	\N	\N	10	\N	\N	\N	\N	\N	\N	\N	8	10	\N	\N	8	\N
84	\N	\N	\N	\N	\N	42	\N	\N	22	\N	\N	\N	\N	\N	10	\N	\N	\N	\N	\N	\N	\N	8	10	\N	\N	8	\N
85	\N	\N	\N	\N	\N	39	10	\N	25	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	12	\N	\N	4	\N
86	\N	\N	\N	\N	\N	39	10	\N	25	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	12	\N	\N	4	\N
87	\N	\N	\N	\N	\N	39	10	\N	25	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	12	\N	\N	4	\N
88	\N	\N	\N	\N	\N	39	10	\N	25	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	12	\N	\N	4	\N
89	\N	\N	\N	\N	\N	39	10	\N	25	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	12	\N	\N	4	\N
90	\N	\N	\N	\N	\N	41	10	\N	23	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	10	\N	\N	6	\N
91	\N	\N	\N	\N	\N	41	10	\N	23	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	10	\N	\N	6	\N
92	\N	\N	\N	\N	\N	41	10	\N	23	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	10	\N	\N	6	\N
93	\N	\N	\N	\N	\N	41	10	\N	23	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	10	\N	\N	6	\N
94	\N	\N	\N	\N	\N	41	10	\N	23	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	10	\N	\N	6	\N
95	\N	\N	\N	\N	\N	41	10	\N	23	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	10	\N	\N	6	\N
96	\N	\N	\N	\N	\N	41	10	\N	23	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	10	\N	\N	6	\N
97	\N	\N	\N	\N	\N	50	\N	\N	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	\N	\N	4	\N	\N	10	\N
98	\N	\N	\N	\N	\N	50	\N	\N	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	\N	\N	4	\N	\N	10	\N
99	\N	\N	\N	\N	\N	50	\N	\N	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	\N	\N	4	\N	\N	10	\N
100	\N	\N	\N	\N	\N	50	\N	\N	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	\N	\N	4	\N	\N	10	\N
101	\N	\N	\N	\N	\N	44	\N	\N	20	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	\N	10	\N	\N	6	\N
102	\N	\N	\N	\N	\N	44	\N	\N	20	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	\N	10	\N	\N	6	\N
103	\N	\N	\N	\N	\N	44	\N	\N	27	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	14	\N	\N	\N	5	\N	\N	10	\N
104	\N	\N	\N	\N	59	\N	\N	\N	27	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	14	\N	\N	\N	\N	\N	\N	\N	\N
105	\N	\N	\N	\N	\N	44	\N	\N	27	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	14	\N	\N	\N	5	\N	\N	10	\N
106	\N	\N	\N	\N	24	20	\N	\N	21	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	\N	5	\N	\N	10	\N
107	\N	\N	\N	\N	24	20	\N	\N	21	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	\N	5	\N	\N	10	\N
108	\N	\N	\N	\N	24	20	\N	\N	21	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	\N	5	\N	\N	10	\N
109	\N	\N	\N	\N	24	20	\N	\N	21	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	\N	5	\N	\N	10	\N
110	\N	27	\N	\N	\N	\N	\N	\N	\N	\N	41	\N	\N	\N	\N	\N	\N	\N	\N	15	\N	\N	\N	8	\N	\N	9	\N
111	\N	27	\N	\N	\N	\N	\N	\N	\N	\N	41	\N	\N	\N	\N	\N	\N	\N	\N	15	\N	\N	\N	8	\N	\N	9	\N
112	\N	27	\N	\N	\N	\N	\N	\N	\N	\N	41	\N	\N	\N	\N	\N	\N	\N	\N	15	\N	\N	\N	8	\N	\N	9	\N
113	\N	27	\N	\N	\N	\N	\N	\N	\N	\N	41	\N	\N	\N	\N	\N	\N	\N	\N	15	\N	\N	\N	8	\N	\N	9	\N
114	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	38	\N	\N	\N	\N	\N	\N	\N	\N	14	\N	\N	\N	8	\N	\N	8	\N
115	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	38	\N	\N	\N	\N	\N	\N	\N	\N	14	\N	\N	\N	8	\N	\N	8	\N
116	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	38	\N	\N	\N	\N	\N	\N	\N	\N	14	\N	\N	\N	8	\N	\N	8	\N
117	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	38	\N	\N	\N	\N	\N	\N	\N	\N	14	\N	\N	\N	8	\N	\N	8	\N
118	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	38	\N	\N	\N	\N	\N	\N	\N	\N	14	\N	\N	\N	8	\N	\N	8	\N
119	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	38	\N	\N	\N	\N	\N	\N	\N	\N	14	\N	\N	\N	8	\N	\N	8	\N
120	\N	\N	\N	\N	\N	38	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7	\N	\N	7	8	\N	\N	8	\N
121	\N	\N	\N	\N	\N	38	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7	\N	\N	7	8	\N	\N	8	\N
122	\N	\N	\N	\N	\N	38	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7	\N	\N	7	8	\N	\N	8	\N
123	\N	\N	\N	\N	\N	38	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7	\N	\N	7	8	\N	\N	8	\N
124	\N	44	\N	\N	\N	\N	\N	\N	22	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11	12	\N	\N	11	\N
125	\N	44	\N	\N	\N	\N	\N	\N	22	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11	12	\N	\N	11	\N
126	\N	44	\N	\N	\N	\N	\N	\N	22	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11	12	\N	\N	11	\N
127	\N	44	\N	\N	\N	\N	\N	\N	22	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11	12	\N	\N	11	\N
128	\N	45	\N	\N	\N	\N	\N	\N	10	\N	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15	10	\N	\N	15	\N
129	\N	45	\N	\N	\N	\N	\N	\N	10	\N	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15	10	\N	\N	15	\N
130	\N	45	\N	\N	\N	\N	\N	\N	10	\N	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15	10	\N	\N	15	\N
131	\N	45	\N	\N	\N	\N	\N	\N	10	\N	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15	10	\N	\N	15	\N
132	\N	45	\N	\N	\N	\N	\N	\N	7	\N	8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15	10	\N	\N	15	\N
133	\N	45	\N	\N	\N	\N	\N	\N	7	\N	8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15	10	\N	\N	15	\N
134	\N	45	\N	\N	\N	\N	\N	\N	7	\N	8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15	10	\N	\N	15	\N
135	\N	40	\N	\N	\N	\N	\N	\N	7	\N	8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	10	\N	\N	15	\N
136	\N	40	\N	\N	\N	\N	\N	\N	7	\N	8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	10	\N	\N	15	\N
137	\N	40	\N	\N	\N	\N	\N	\N	7	\N	8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	10	\N	\N	15	\N
138	\N	35	\N	\N	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	\N	22	\N	\N	\N	\N	\N	18	10	\N	\N	10	\N
139	\N	45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	\N	\N	\N	10	10	\N	\N	15	\N
140	\N	45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	\N	\N	\N	10	10	\N	\N	15	\N
141	\N	45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	\N	\N	\N	10	10	\N	\N	15	\N
142	\N	50	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	\N	\N	\N	\N	15	10	\N	\N	15	\N
143	\N	50	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	\N	\N	\N	\N	15	10	\N	\N	15	\N
144	\N	50	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	\N	\N	\N	\N	15	10	\N	\N	15	\N
145	\N	50	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	\N	\N	\N	\N	15	10	\N	\N	15	\N
146	\N	50	\N	\N	\N	\N	\N	\N	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15	10	\N	\N	15	\N
147	\N	50	\N	\N	\N	\N	\N	\N	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15	10	\N	\N	15	\N
148	\N	50	\N	\N	\N	\N	\N	\N	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15	10	\N	\N	15	\N
149	\N	50	\N	\N	\N	\N	\N	\N	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15	10	\N	\N	15	\N
150	\N	50	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	\N	\N	\N	\N	15	10	\N	\N	15	\N
151	\N	50	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	\N	\N	\N	\N	15	10	\N	\N	15	\N
152	\N	50	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	\N	\N	\N	\N	15	10	\N	\N	15	\N
153	\N	50	\N	\N	\N	\N	\N	\N	10	\N	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	\N	15	10	\N	\N	10	\N
154	\N	50	\N	\N	\N	\N	\N	\N	10	\N	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	\N	15	10	\N	\N	10	\N
155	\N	50	\N	\N	\N	\N	\N	\N	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	10	\N	\N	10	\N
156	\N	55	\N	\N	\N	\N	\N	\N	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	10	\N	\N	5	\N
157	\N	55	\N	\N	\N	\N	\N	\N	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	10	\N	\N	5	\N
158	\N	55	\N	\N	\N	\N	\N	\N	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	10	\N	\N	5	\N
159	\N	\N	\N	\N	30	18	\N	\N	15	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15	15	\N	\N	7	\N
160	\N	\N	\N	\N	30	18	\N	\N	15	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15	15	\N	\N	7	\N
161	\N	\N	\N	\N	30	18	\N	\N	15	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15	15	\N	\N	7	\N
162	\N	\N	\N	\N	58	\N	\N	\N	27	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5	5	\N	\N	5	\N
163	\N	\N	\N	\N	58	\N	\N	\N	27	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5	5	\N	\N	5	\N
164	\N	\N	\N	\N	58	\N	\N	\N	27	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5	5	\N	\N	5	\N
165	\N	\N	\N	\N	55	\N	\N	\N	27	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5	8	\N	\N	5	\N
166	\N	\N	\N	\N	55	\N	\N	\N	27	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5	8	\N	\N	5	\N
167	\N	\N	\N	\N	55	\N	\N	\N	22	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	\N	\N	8	\N	\N	5	\N
168	\N	\N	\N	\N	55	\N	\N	\N	22	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	\N	\N	8	\N	\N	5	\N
169	\N	\N	\N	\N	55	\N	\N	\N	22	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	\N	\N	8	\N	\N	5	\N
170	\N	\N	\N	\N	51	\N	\N	\N	22	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	\N	\N	9	\N	\N	8	\N
171	\N	\N	\N	\N	51	\N	\N	\N	22	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	\N	\N	9	\N	\N	8	\N
172	\N	\N	\N	\N	51	\N	\N	\N	22	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	\N	\N	9	\N	\N	8	\N
173	\N	\N	\N	\N	51	\N	\N	\N	22	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	\N	\N	9	\N	\N	8	\N
174	\N	\N	\N	\N	50	\N	\N	\N	15	\N	\N	\N	\N	\N	\N	\N	5	\N	\N	10	\N	\N	\N	10	\N	\N	10	\N
175	\N	\N	\N	\N	50	\N	\N	\N	15	\N	\N	\N	\N	\N	\N	\N	5	\N	\N	10	\N	\N	\N	10	\N	\N	10	\N
176	\N	\N	\N	\N	50	\N	\N	\N	15	\N	\N	\N	\N	\N	\N	\N	5	\N	\N	10	\N	\N	\N	10	\N	\N	10	\N
177	\N	\N	\N	\N	50	\N	\N	\N	15	\N	\N	\N	\N	\N	\N	\N	5	\N	\N	15	\N	\N	\N	7	\N	\N	8	\N
178	\N	\N	\N	\N	50	\N	\N	\N	15	\N	\N	\N	\N	\N	\N	\N	5	\N	\N	15	\N	\N	\N	7	\N	\N	8	\N
179	\N	\N	\N	\N	46	\N	\N	\N	10	\N	\N	\N	\N	\N	\N	\N	12	\N	\N	15	\N	\N	\N	9	\N	\N	8	\N
180	\N	\N	\N	\N	46	\N	\N	\N	10	\N	\N	\N	\N	\N	\N	\N	12	\N	\N	15	\N	\N	\N	9	\N	\N	8	\N
181	\N	46	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	\N	\N	\N	17	\N	\N	15	\N	\N	\N	9	\N	\N	8	\N
182	\N	46	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	\N	\N	\N	17	\N	\N	15	\N	\N	\N	9	\N	\N	8	\N
183	\N	46	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	\N	\N	\N	17	\N	\N	15	\N	\N	\N	9	\N	\N	8	\N
184	\N	46	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	\N	\N	\N	17	\N	\N	15	\N	\N	\N	9	\N	\N	8	\N
185	\N	46	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	\N	\N	\N	17	\N	\N	15	\N	\N	\N	9	\N	\N	8	\N
186	\N	46	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	\N	\N	\N	17	\N	\N	15	\N	\N	\N	9	\N	\N	8	\N
187	\N	47	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	15	\N	\N	\N	9	\N	\N	9	\N
188	\N	47	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	15	\N	\N	\N	9	\N	\N	9	\N
189	\N	47	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	15	\N	\N	\N	9	\N	\N	9	\N
190	\N	47	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	15	\N	\N	\N	9	\N	\N	9	\N
191	\N	20	\N	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	15	\N	\N	\N	10	\N	\N	9	\N
192	\N	20	\N	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	15	\N	\N	\N	10	\N	\N	9	\N
193	\N	20	\N	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	15	\N	\N	\N	10	\N	\N	9	\N
194	\N	16	\N	30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	15	\N	\N	\N	10	\N	\N	9	\N
195	\N	16	\N	30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	15	\N	\N	\N	10	\N	\N	9	\N
196	\N	\N	\N	40	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	15	\N	\N	\N	16	\N	\N	9	\N
197	\N	\N	\N	40	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	15	\N	\N	\N	16	\N	\N	9	\N
198	\N	\N	\N	40	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	15	\N	\N	\N	16	\N	\N	9	\N
199	\N	\N	\N	40	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	15	\N	\N	\N	16	\N	\N	9	\N
200	\N	\N	\N	40	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	15	\N	\N	\N	16	\N	\N	9	\N
201	\N	20	\N	\N	20	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	\N	15	\N	\N	15	\N	\N	\N	16	\N	\N	9	\N
202	\N	20	\N	\N	20	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	\N	15	\N	\N	15	\N	\N	\N	16	\N	\N	9	\N
203	\N	20	\N	\N	20	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	\N	15	\N	\N	15	\N	\N	\N	16	\N	\N	9	\N
204	\N	20	\N	\N	20	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	15	\N	\N	\N	16	\N	\N	9	\N
205	\N	20	\N	\N	20	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	15	\N	\N	\N	16	\N	\N	9	\N
206	\N	20	\N	\N	20	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	15	\N	\N	\N	16	\N	\N	9	\N
207	\N	18	\N	\N	20	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	15	\N	\N	\N	16	\N	\N	11	\N
208	\N	18	\N	\N	18	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	15	\N	\N	\N	18	\N	\N	11	\N
209	\N	18	\N	\N	18	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	15	\N	\N	\N	18	\N	\N	11	\N
210	\N	18	\N	\N	18	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	15	\N	\N	\N	18	\N	\N	11	\N
211	\N	17	\N	\N	17	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	10	\N	\N	5	20	\N	\N	11	\N
212	\N	17	\N	\N	17	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	10	\N	\N	5	20	\N	\N	11	\N
213	\N	17	\N	\N	17	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	10	\N	\N	5	20	\N	\N	11	\N
214	\N	16	\N	\N	16	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	10	\N	\N	7	20	\N	\N	11	\N
215	\N	16	\N	\N	16	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	10	\N	\N	7	20	\N	\N	11	\N
216	\N	16	\N	\N	16	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	10	\N	\N	7	20	\N	\N	11	\N
217	\N	16	\N	\N	16	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	10	\N	\N	7	20	\N	\N	11	\N
218	\N	16	\N	\N	16	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	10	\N	\N	7	20	\N	\N	11	\N
219	\N	16	\N	\N	16	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	10	\N	\N	7	20	\N	\N	11	\N
220	\N	17	\N	\N	17	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	10	\N	\N	7	20	\N	\N	9	\N
221	\N	17	\N	\N	17	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	10	\N	\N	7	20	\N	\N	9	\N
222	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	10	\N	\N	7	20	\N	\N	9	\N
223	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	10	\N	\N	7	20	\N	\N	9	\N
224	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	10	\N	\N	7	20	\N	\N	9	\N
225	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	10	\N	\N	7	20	\N	\N	9	\N
226	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	10	\N	\N	7	20	\N	\N	9	\N
227	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	10	\N	\N	7	20	\N	\N	9	\N
228	\N	\N	\N	\N	40	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	10	10	\N	\N	6	\N
229	\N	\N	\N	\N	40	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	10	10	\N	\N	6	\N
230	\N	\N	\N	\N	40	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	10	10	\N	\N	6	\N
231	\N	\N	\N	\N	38	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	10	12	\N	\N	8	\N
232	\N	\N	\N	\N	38	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	10	12	\N	\N	8	\N
233	\N	\N	\N	\N	38	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	32	\N	\N	10	\N	\N	\N	12	\N	\N	8	\N
234	\N	\N	\N	\N	38	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	32	\N	\N	10	\N	\N	\N	12	\N	\N	8	\N
235	\N	\N	\N	\N	38	\N	20	\N	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	14	\N	\N	8	\N
236	\N	\N	\N	\N	36	\N	20	\N	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12	14	\N	\N	8	\N
237	\N	\N	\N	\N	36	\N	20	\N	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	14	10	\N	\N	10	\N
238	\N	\N	\N	\N	36	\N	20	\N	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	14	10	\N	\N	10	\N
239	\N	\N	\N	\N	36	\N	20	\N	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	14	10	\N	\N	10	\N
240	\N	\N	\N	\N	36	\N	20	\N	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	14	10	\N	\N	10	\N
241	\N	\N	\N	\N	36	\N	20	\N	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	14	10	\N	\N	10	\N
242	\N	\N	\N	\N	36	\N	20	\N	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	14	10	\N	\N	10	\N
243	\N	\N	\N	\N	36	\N	20	\N	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	14	10	\N	\N	10	\N
244	\N	\N	\N	\N	38	\N	20	\N	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	10	\N	\N	12	\N
245	\N	\N	\N	\N	38	\N	20	\N	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	10	\N	\N	12	\N
246	\N	\N	\N	\N	38	\N	20	\N	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	10	\N	\N	12	\N
247	\N	\N	\N	20	17	\N	18	\N	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	\N	\N	11	\N	\N	14	\N
248	\N	\N	\N	20	17	\N	18	\N	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	\N	\N	11	\N	\N	14	\N
249	\N	\N	\N	20	17	\N	18	\N	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	\N	\N	11	\N	\N	14	\N
250	\N	\N	\N	19	17	\N	16	\N	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	\N	\N	13	\N	\N	15	\N
251	\N	\N	\N	19	17	\N	16	\N	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	\N	\N	13	\N	\N	15	\N
252	\N	\N	\N	17	17	\N	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	8	\N	\N	\N	12	\N	\N	12	\N
253	\N	\N	\N	17	17	\N	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	8	\N	\N	\N	12	\N	\N	12	\N
254	\N	\N	\N	17	17	\N	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	8	\N	\N	\N	12	\N	\N	12	\N
255	\N	\N	\N	17	17	\N	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	8	\N	\N	\N	12	\N	\N	12	\N
256	\N	\N	\N	17	17	\N	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	8	\N	\N	\N	12	\N	\N	12	\N
257	\N	\N	\N	17	17	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	34	\N	\N	8	\N	\N	\N	12	\N	\N	12	\N
258	\N	\N	\N	17	17	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	34	\N	\N	8	\N	\N	\N	12	\N	\N	12	\N
259	\N	\N	\N	17	17	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	34	\N	\N	8	\N	\N	\N	12	\N	\N	12	\N
260	\N	\N	\N	17	17	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	34	\N	\N	8	\N	\N	\N	12	\N	\N	12	\N
261	\N	\N	\N	16	16	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	34	\N	\N	8	\N	\N	\N	14	\N	\N	12	\N
262	\N	\N	\N	16	16	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	34	\N	\N	8	\N	\N	\N	14	\N	\N	12	\N
263	\N	\N	\N	16	16	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	34	\N	\N	8	\N	\N	\N	14	\N	\N	12	\N
264	\N	\N	\N	15	15	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	36	\N	\N	8	\N	\N	\N	14	\N	\N	12	\N
265	\N	\N	\N	15	15	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	36	\N	\N	8	\N	\N	\N	14	\N	\N	12	\N
266	\N	\N	\N	15	15	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	36	\N	\N	8	\N	\N	\N	14	\N	\N	12	\N
267	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	35	\N	\N	8	\N	\N	\N	15	\N	\N	12	\N
268	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	35	\N	\N	8	\N	\N	\N	15	\N	\N	12	\N
269	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	35	\N	\N	8	\N	\N	\N	15	\N	\N	12	\N
270	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	35	\N	\N	8	\N	\N	\N	15	\N	\N	12	\N
271	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	35	\N	\N	8	\N	\N	\N	15	\N	\N	12	\N
272	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	35	\N	\N	8	\N	\N	\N	15	\N	\N	12	\N
273	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	35	\N	\N	8	\N	\N	\N	15	\N	\N	12	\N
274	\N	\N	\N	31	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	37	\N	\N	8	\N	\N	\N	15	\N	\N	9	\N
275	\N	\N	\N	31	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	37	\N	\N	8	\N	\N	\N	15	\N	\N	9	\N
276	\N	\N	\N	31	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	37	\N	\N	8	\N	\N	\N	15	\N	\N	9	\N
277	\N	\N	\N	31	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	37	\N	\N	8	\N	\N	\N	15	\N	\N	9	\N
278	\N	\N	\N	31	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	37	\N	\N	8	\N	\N	\N	15	\N	\N	9	\N
279	\N	\N	\N	31	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	37	\N	\N	8	\N	\N	\N	15	\N	\N	9	\N
280	\N	\N	\N	31	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	37	\N	\N	8	\N	\N	\N	15	\N	\N	9	\N
281	\N	\N	\N	31	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	37	\N	\N	8	\N	\N	\N	15	\N	\N	9	\N
282	\N	\N	\N	31	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	37	\N	\N	8	\N	\N	\N	15	\N	\N	9	\N
283	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	41	\N	\N	8	\N	\N	\N	8	\N	\N	9	\N
284	\N	10	\N	27	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	38	\N	\N	8	\N	\N	\N	8	\N	\N	8	\N
285	\N	10	\N	27	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	38	\N	\N	8	\N	\N	\N	8	\N	\N	8	\N
286	\N	10	\N	23	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	38	\N	\N	8	\N	\N	\N	12	\N	\N	8	\N
287	\N	10	\N	21	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	38	\N	\N	8	\N	\N	\N	14	\N	\N	8	\N
288	\N	10	\N	21	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	38	\N	\N	8	\N	\N	\N	14	\N	\N	8	\N
289	\N	10	\N	21	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	38	\N	\N	8	\N	\N	\N	14	\N	\N	8	\N
290	\N	10	\N	21	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	38	\N	\N	8	\N	\N	\N	14	\N	\N	8	\N
291	\N	10	\N	21	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	38	\N	\N	8	\N	\N	\N	14	\N	\N	8	\N
292	\N	\N	\N	31	\N	\N	\N	\N	10	\N	1	\N	\N	\N	\N	\N	28	\N	\N	8	\N	\N	\N	14	\N	\N	8	\N
293	\N	\N	\N	31	\N	\N	\N	\N	10	\N	1	\N	\N	\N	\N	\N	28	\N	\N	8	\N	\N	\N	14	\N	\N	8	\N
294	\N	\N	\N	31	\N	\N	\N	\N	10	\N	1	\N	\N	\N	\N	\N	28	\N	\N	8	\N	\N	\N	14	\N	\N	8	\N
295	\N	\N	\N	31	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	\N	\N	37	\N	\N	8	\N	\N	\N	14	\N	\N	8	\N
296	\N	\N	\N	31	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	\N	\N	37	\N	\N	8	\N	\N	\N	14	\N	\N	8	\N
297	\N	\N	\N	31	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	\N	\N	37	\N	\N	8	\N	\N	\N	14	\N	\N	8	\N
298	\N	\N	\N	31	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	\N	\N	37	\N	\N	8	\N	\N	\N	14	\N	\N	8	\N
299	\N	\N	\N	31	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	\N	\N	37	\N	\N	8	\N	\N	\N	14	\N	\N	8	\N
300	\N	\N	\N	31	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	\N	\N	37	\N	\N	8	\N	\N	\N	14	\N	\N	8	\N
301	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	\N	\N	38	\N	\N	8	\N	\N	\N	14	\N	\N	8	\N
302	\N	\N	\N	29	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	\N	\N	37	\N	\N	8	\N	\N	\N	16	\N	\N	8	\N
303	\N	\N	\N	29	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	\N	\N	37	\N	\N	8	\N	\N	\N	16	\N	\N	8	\N
304	\N	\N	\N	29	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	39	\N	\N	8	\N	\N	\N	16	\N	\N	8	\N
305	\N	\N	\N	29	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	39	\N	\N	8	\N	\N	\N	16	\N	\N	8	\N
306	\N	\N	\N	27	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	39	\N	\N	8	\N	\N	\N	17	\N	\N	9	\N
307	\N	\N	\N	29	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	39	\N	\N	8	\N	\N	\N	16	\N	\N	8	\N
308	\N	\N	\N	28	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	38	\N	\N	8	\N	\N	\N	16	\N	\N	10	\N
309	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	37	\N	\N	8	\N	\N	\N	16	\N	\N	10	\N
310	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	37	\N	\N	8	\N	\N	\N	16	\N	\N	10	\N
311	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	37	\N	\N	8	\N	\N	\N	16	\N	\N	10	\N
312	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	37	\N	\N	8	\N	\N	\N	16	\N	\N	10	\N
313	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	37	\N	\N	8	\N	\N	\N	16	\N	\N	10	\N
314	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	37	\N	\N	8	\N	\N	\N	16	\N	\N	10	\N
315	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	30	\N	\N	10	\N	\N	\N	18	\N	\N	11	\N
316	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	30	\N	\N	10	\N	\N	\N	18	\N	\N	11	\N
317	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	12	\N	\N	\N	20	\N	\N	11	\N
318	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	12	\N	\N	\N	20	\N	\N	11	\N
319	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	12	\N	\N	\N	20	\N	\N	11	\N
320	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	12	\N	\N	\N	20	\N	\N	11	\N
321	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	12	\N	\N	\N	20	\N	\N	11	\N
322	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	12	\N	\N	\N	20	\N	\N	11	\N
323	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	12	\N	\N	\N	20	\N	\N	11	\N
324	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	12	\N	\N	\N	20	\N	\N	11	\N
325	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	12	\N	\N	\N	20	\N	\N	11	\N
326	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	12	\N	\N	\N	19	\N	\N	10	\N
327	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	12	\N	\N	\N	19	\N	\N	10	\N
328	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	12	\N	\N	\N	19	\N	\N	10	\N
329	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	26	\N	\N	12	\N	\N	\N	17	\N	\N	10	\N
330	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	26	\N	\N	12	\N	\N	\N	13	\N	\N	10	\N
331	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	26	\N	\N	12	\N	\N	\N	13	\N	\N	10	\N
332	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	26	\N	\N	\N	\N	\N	12	10	\N	\N	10	\N
333	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	26	\N	\N	\N	\N	\N	12	10	\N	\N	10	\N
334	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	26	\N	\N	\N	\N	\N	12	8	\N	\N	10	\N
335	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	26	\N	\N	\N	\N	\N	12	8	\N	\N	10	\N
336	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	26	\N	\N	\N	\N	\N	12	8	\N	\N	10	\N
337	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	26	\N	\N	\N	\N	\N	12	8	\N	\N	10	\N
338	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	26	\N	\N	\N	\N	\N	12	8	\N	\N	10	\N
339	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	26	\N	\N	\N	\N	\N	12	8	\N	\N	10	\N
340	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	26	\N	\N	\N	\N	\N	12	8	\N	\N	8	\N
341	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	26	\N	\N	\N	\N	\N	12	8	\N	\N	8	\N
342	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	26	\N	\N	\N	\N	\N	12	8	\N	\N	8	\N
343	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	26	\N	\N	\N	\N	\N	12	8	\N	\N	8	\N
344	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	30	\N	\N	12	\N	\N	\N	10	\N	\N	8	\N
345	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	30	\N	\N	12	\N	\N	\N	10	\N	\N	8	\N
346	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	30	\N	\N	12	\N	\N	\N	10	\N	\N	8	\N
347	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	30	\N	\N	12	\N	\N	\N	10	\N	\N	8	\N
348	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	30	\N	\N	12	\N	\N	\N	12	\N	\N	8	\N
349	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	22	\N	\N	0	\N	\N	10	\N	\N	\N	16	\N	\N	6	\N
350	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	22	\N	\N	0	\N	\N	10	\N	\N	\N	16	\N	\N	6	\N
351	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	22	\N	\N	0	\N	\N	10	\N	\N	\N	16	\N	\N	6	\N
352	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	24	\N	\N	0	\N	\N	10	\N	\N	\N	18	\N	\N	6	\N
353	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	24	\N	\N	0	\N	\N	10	\N	\N	\N	18	\N	\N	6	\N
354	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	24	\N	\N	0	\N	\N	10	\N	\N	\N	18	\N	\N	6	\N
355	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	24	\N	\N	0	\N	\N	5	\N	\N	5	18	\N	\N	6	\N
356	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	24	\N	\N	0	\N	\N	5	\N	\N	5	18	\N	\N	6	\N
357	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	35	\N	\N	0	\N	\N	0	\N	\N	0	20	\N	\N	0	\N
358	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	35	\N	\N	0	\N	\N	0	\N	\N	0	20	\N	\N	0	\N
359	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	8	\N	\N	\N	19	\N	\N	3	\N
360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	8	\N	\N	\N	19	\N	\N	3	\N
361	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	36	\N	\N	\N	\N	\N	6	\N	\N	\N	20	\N	\N	3	\N
362	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	36	\N	\N	\N	\N	\N	6	\N	\N	\N	20	\N	\N	3	\N
363	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	6	\N	\N	\N	21	\N	\N	3	\N
364	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	6	\N	\N	\N	21	\N	\N	3	\N
365	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	6	\N	\N	\N	21	\N	\N	3	\N
366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	6	\N	\N	\N	21	\N	\N	3	\N
367	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	22	\N	\N	\N	\N	\N	5	\N	\N	\N	21	\N	\N	3	\N
368	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	22	\N	\N	\N	\N	\N	5	\N	\N	\N	21	\N	\N	3	\N
369	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	6	\N	\N	\N	21	\N	\N	3	\N
370	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	6	\N	\N	\N	21	\N	\N	3	\N
371	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	6	\N	\N	\N	21	\N	\N	3	\N
372	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	6	\N	\N	\N	21	\N	\N	3	\N
373	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	6	\N	\N	\N	21	\N	\N	3	\N
374	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	6	\N	\N	\N	21	\N	\N	3	\N
375	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	6	\N	\N	\N	21	\N	\N	3	\N
376	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	6	\N	\N	\N	21	\N	\N	3	\N
377	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	6	\N	\N	\N	23	\N	\N	3	\N
378	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	6	\N	\N	\N	23	\N	\N	3	\N
379	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	6	\N	\N	\N	23	\N	\N	3	\N
380	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	6	\N	\N	\N	23	\N	\N	3	\N
381	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	6	\N	\N	\N	23	\N	\N	3	\N
382	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	6	\N	\N	\N	23	\N	\N	3	\N
383	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	6	\N	\N	\N	23	\N	\N	3	\N
384	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	6	\N	\N	\N	23	\N	\N	3	\N
385	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	6	\N	\N	\N	23	\N	\N	3	\N
386	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	6	\N	\N	\N	23	\N	\N	3	\N
387	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	6	\N	\N	\N	23	\N	\N	3	\N
388	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	6	\N	\N	\N	23	\N	\N	3	\N
389	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	6	\N	\N	\N	23	\N	\N	3	\N
390	\N	\N	\N	\N	43	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	6	\N	\N	\N	23	\N	\N	3	\N
391	\N	\N	\N	\N	43	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	6	\N	\N	\N	23	\N	\N	3	\N
392	\N	\N	\N	\N	43	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	6	\N	\N	\N	23	\N	\N	3	\N
393	\N	\N	\N	\N	43	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	6	\N	\N	\N	23	\N	\N	\N	3
394	\N	\N	\N	\N	43	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	6	\N	\N	\N	23	\N	\N	\N	3
395	\N	\N	\N	\N	43	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	6	\N	\N	\N	23	\N	\N	\N	3
396	\N	\N	\N	\N	43	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	6	\N	\N	\N	23	\N	\N	\N	3
397	\N	\N	\N	\N	43	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	6	\N	\N	\N	23	\N	\N	\N	3
398	\N	\N	\N	44	\N	\N	\N	\N	\N	\N	\N	\N	\N	27	\N	\N	\N	\N	\N	6	\N	\N	\N	23	\N	\N	\N	\N
399	\N	\N	\N	44	\N	\N	\N	\N	\N	\N	\N	\N	\N	27	\N	\N	\N	\N	\N	6	\N	\N	\N	23	\N	\N	\N	\N
400	\N	\N	\N	44	\N	\N	\N	\N	\N	\N	\N	\N	\N	27	\N	\N	\N	\N	\N	6	\N	\N	\N	23	\N	\N	\N	\N
401	\N	\N	\N	\N	42	\N	\N	\N	\N	\N	\N	\N	\N	27	\N	\N	\N	\N	\N	6	\N	\N	\N	25	\N	\N	\N	\N
402	\N	\N	\N	\N	42	\N	\N	\N	\N	\N	\N	\N	\N	27	\N	\N	\N	\N	\N	6	\N	\N	\N	25	\N	\N	\N	\N
403	\N	\N	\N	\N	42	\N	\N	\N	\N	\N	\N	\N	\N	27	\N	\N	\N	\N	\N	6	\N	\N	\N	25	\N	\N	\N	\N
404	\N	\N	\N	\N	42	\N	\N	\N	\N	\N	\N	\N	\N	27	\N	\N	\N	\N	\N	6	\N	\N	\N	25	\N	\N	\N	\N
405	\N	\N	\N	\N	42	\N	\N	\N	\N	\N	\N	\N	\N	27	\N	\N	\N	\N	\N	6	\N	\N	\N	25	\N	\N	\N	\N
406	\N	\N	\N	\N	41	\N	\N	\N	\N	\N	\N	\N	\N	27	\N	\N	\N	\N	\N	6	\N	\N	\N	26	\N	\N	\N	\N
407	\N	\N	\N	\N	41	\N	\N	\N	\N	\N	\N	\N	\N	27	\N	\N	\N	\N	\N	6	\N	\N	\N	26	\N	\N	\N	\N
408	\N	\N	\N	\N	41	\N	\N	\N	\N	\N	\N	\N	\N	27	\N	\N	\N	\N	\N	6	\N	\N	\N	26	\N	\N	\N	\N
409	\N	\N	\N	\N	40	\N	\N	\N	\N	\N	\N	\N	\N	27	\N	\N	\N	\N	\N	6	\N	\N	\N	27	\N	\N	\N	\N
410	\N	\N	\N	\N	40	\N	\N	\N	\N	\N	\N	\N	\N	27	\N	\N	\N	\N	\N	6	\N	\N	\N	27	\N	\N	\N	\N
411	\N	\N	\N	\N	40	\N	\N	\N	\N	\N	\N	\N	\N	27	\N	\N	\N	\N	\N	6	\N	\N	\N	27	\N	\N	\N	\N
412	\N	\N	\N	\N	40	\N	\N	\N	\N	\N	\N	\N	\N	27	\N	\N	\N	\N	\N	6	\N	\N	\N	27	\N	\N	\N	\N
413	\N	\N	\N	\N	40	\N	\N	\N	\N	\N	\N	\N	\N	27	\N	\N	\N	\N	\N	6	\N	\N	\N	27	\N	\N	\N	\N
414	\N	\N	\N	\N	40	\N	\N	\N	\N	\N	\N	\N	\N	27	\N	\N	\N	\N	\N	6	\N	\N	\N	27	\N	\N	\N	\N
415	\N	\N	\N	\N	40	\N	\N	\N	\N	\N	\N	\N	\N	27	\N	\N	\N	\N	\N	6	\N	\N	\N	27	\N	\N	\N	\N
416	\N	\N	\N	\N	40	\N	\N	\N	\N	\N	\N	\N	\N	27	\N	\N	\N	\N	\N	6	\N	\N	\N	27	\N	\N	\N	\N
417	\N	\N	\N	\N	40	\N	\N	\N	\N	\N	\N	\N	\N	27	\N	\N	\N	\N	\N	6	\N	\N	\N	27	\N	\N	\N	\N
418	\N	\N	\N	\N	40	\N	\N	\N	\N	\N	\N	\N	\N	27	\N	\N	\N	\N	\N	6	\N	\N	\N	27	\N	\N	\N	\N
419	\N	\N	\N	\N	40	\N	\N	\N	\N	\N	\N	\N	\N	27	\N	\N	\N	\N	\N	6	\N	\N	\N	27	\N	\N	\N	\N
420	\N	\N	\N	\N	45	\N	\N	\N	\N	\N	\N	\N	\N	30	\N	\N	\N	\N	\N	7	\N	\N	\N	18	\N	\N	\N	\N
421	\N	\N	\N	\N	51	\N	\N	\N	\N	\N	\N	\N	\N	30	\N	\N	\N	\N	\N	8	\N	\N	\N	11	\N	\N	\N	\N
422	\N	\N	\N	\N	49	\N	\N	\N	\N	\N	\N	\N	\N	28	\N	\N	\N	\N	\N	8	\N	\N	\N	15	\N	\N	\N	\N
423	\N	\N	\N	\N	46	\N	\N	\N	\N	\N	\N	\N	\N	28	\N	\N	\N	\N	\N	8	\N	\N	\N	15	\N	\N	\N	3
424	\N	\N	\N	\N	46	\N	\N	\N	\N	\N	\N	\N	\N	28	\N	\N	\N	\N	\N	8	\N	\N	\N	15	\N	\N	\N	3
425	\N	\N	\N	\N	44	\N	\N	\N	\N	\N	\N	\N	\N	39	\N	\N	\N	\N	\N	5	\N	\N	\N	5	\N	\N	\N	7
426	\N	\N	\N	\N	44	\N	\N	\N	\N	\N	\N	\N	\N	39	\N	\N	\N	\N	\N	5	\N	\N	\N	5	\N	\N	\N	7
427	\N	\N	\N	\N	44	\N	\N	\N	\N	\N	\N	\N	\N	39	\N	\N	\N	\N	\N	5	\N	\N	\N	5	\N	\N	\N	7
428	\N	\N	\N	\N	44	\N	\N	\N	\N	\N	\N	\N	\N	39	\N	\N	\N	\N	\N	5	\N	\N	\N	5	\N	\N	\N	8
429	\N	\N	\N	\N	41	\N	\N	\N	\N	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	5	\N	\N	\N	15	\N	\N	\N	7
430	\N	\N	\N	\N	41	\N	\N	\N	\N	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	5	\N	\N	\N	15	\N	\N	\N	7
431	\N	\N	\N	\N	41	\N	\N	\N	\N	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	5	\N	\N	\N	15	\N	\N	\N	7
432	\N	\N	\N	\N	41	\N	\N	\N	\N	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	5	\N	\N	\N	15	\N	\N	\N	7
433	\N	\N	\N	\N	41	\N	\N	\N	\N	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	5	\N	\N	\N	15	\N	\N	\N	7
434	\N	\N	\N	\N	41	\N	\N	\N	\N	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	5	\N	\N	\N	15	\N	\N	\N	7
435	\N	\N	\N	\N	43	\N	\N	\N	\N	\N	\N	\N	\N	22	\N	\N	\N	\N	\N	10	\N	\N	\N	16	\N	\N	\N	9
436	\N	\N	\N	\N	43	\N	\N	\N	\N	\N	\N	\N	\N	22	\N	\N	\N	\N	\N	10	\N	\N	\N	16	\N	\N	\N	9
437	\N	\N	\N	\N	44	\N	\N	\N	\N	\N	\N	\N	\N	14	\N	\N	\N	\N	\N	15	\N	\N	\N	17	\N	\N	\N	10
438	\N	\N	\N	\N	44	\N	\N	\N	\N	\N	\N	\N	\N	14	\N	\N	\N	\N	\N	15	\N	\N	\N	17	\N	\N	\N	10
439	\N	\N	\N	\N	44	\N	\N	\N	\N	\N	\N	\N	\N	14	\N	\N	\N	\N	\N	15	\N	\N	\N	17	\N	\N	10	\N
440	\N	\N	\N	\N	44	\N	\N	\N	\N	\N	\N	\N	\N	23	\N	\N	\N	\N	\N	5	\N	\N	\N	23	\N	\N	5	\N
441	\N	\N	\N	\N	44	\N	\N	\N	\N	\N	\N	\N	\N	23	\N	\N	\N	\N	\N	5	\N	\N	\N	23	\N	\N	5	\N
442	\N	\N	\N	\N	44	\N	\N	\N	\N	\N	\N	\N	\N	23	\N	\N	\N	\N	\N	5	\N	\N	\N	23	\N	\N	5	\N
443	\N	\N	\N	\N	46	\N	\N	\N	\N	\N	\N	\N	\N	\N	23	\N	\N	\N	\N	5	\N	\N	\N	21	\N	\N	5	\N
444	\N	\N	\N	\N	46	\N	\N	\N	\N	\N	\N	\N	\N	\N	23	\N	\N	\N	\N	5	\N	\N	\N	21	\N	\N	5	\N
445	\N	\N	\N	\N	46	\N	\N	\N	\N	\N	\N	\N	\N	\N	23	\N	\N	\N	\N	5	\N	\N	\N	21	\N	\N	5	\N
446	\N	\N	\N	\N	46	\N	\N	\N	\N	\N	\N	\N	\N	\N	23	\N	\N	\N	\N	5	\N	\N	\N	21	\N	\N	5	\N
447	\N	\N	\N	\N	46	\N	\N	\N	\N	\N	\N	\N	\N	\N	23	\N	\N	\N	\N	5	\N	\N	\N	21	\N	\N	5	\N
448	\N	\N	\N	\N	46	\N	\N	\N	\N	\N	\N	\N	\N	\N	23	\N	\N	\N	\N	5	\N	\N	\N	21	\N	\N	5	\N
449	\N	\N	\N	\N	46	\N	\N	\N	\N	\N	\N	\N	\N	\N	23	\N	\N	\N	\N	5	\N	\N	\N	21	\N	\N	5	\N
450	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	29	\N	\N	\N	\N	\N	\N	\N	\N	15	\N	\N	\N	16	\N	\N	5	\N
451	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	33	\N	\N	\N	\N	\N	\N	\N	\N	17	\N	\N	\N	10	\N	\N	5	\N
452	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	33	\N	\N	\N	\N	\N	\N	\N	\N	17	\N	\N	\N	10	\N	\N	5	\N
453	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	33	\N	\N	\N	\N	\N	\N	\N	\N	17	\N	\N	\N	10	\N	\N	5	\N
454	\N	\N	\N	\N	37	\N	\N	\N	\N	\N	26	\N	\N	\N	\N	\N	\N	\N	\N	16	\N	\N	\N	16	\N	\N	5	\N
455	\N	\N	\N	\N	37	\N	\N	\N	\N	\N	26	\N	\N	\N	\N	\N	\N	\N	\N	16	\N	\N	\N	16	\N	\N	5	\N
456	\N	\N	\N	\N	37	\N	\N	\N	\N	\N	26	\N	\N	\N	\N	\N	\N	\N	\N	14	\N	\N	\N	18	\N	\N	5	\N
457	\N	\N	\N	\N	37	\N	\N	\N	\N	\N	19	\N	\N	\N	\N	\N	\N	\N	\N	16	\N	\N	\N	23	\N	\N	5	\N
458	\N	\N	\N	\N	42	\N	\N	\N	\N	\N	19	\N	\N	\N	\N	\N	\N	\N	\N	13	\N	\N	\N	23	\N	\N	3	\N
459	\N	\N	\N	\N	42	\N	\N	\N	\N	\N	19	\N	\N	\N	\N	\N	\N	\N	\N	13	\N	\N	\N	23	\N	\N	3	\N
460	\N	\N	\N	\N	42	\N	\N	\N	\N	\N	19	\N	\N	\N	\N	\N	\N	\N	\N	13	\N	\N	\N	23	\N	\N	3	\N
461	\N	\N	\N	\N	42	\N	\N	\N	\N	\N	19	\N	\N	\N	\N	\N	\N	\N	\N	13	\N	\N	\N	23	\N	\N	3	\N
462	\N	\N	\N	\N	42	\N	\N	\N	\N	\N	19	\N	\N	\N	\N	\N	\N	\N	\N	13	\N	\N	\N	23	\N	\N	3	\N
463	\N	\N	\N	\N	45	\N	\N	\N	\N	\N	21	\N	\N	\N	\N	\N	\N	\N	\N	13	\N	\N	\N	18	\N	\N	3	\N
464	\N	\N	\N	\N	45	\N	\N	\N	\N	\N	21	\N	\N	\N	\N	\N	\N	\N	\N	13	\N	\N	\N	18	\N	\N	3	\N
465	\N	\N	\N	\N	45	\N	\N	\N	\N	\N	21	\N	\N	\N	\N	\N	\N	\N	\N	13	\N	\N	\N	18	\N	\N	3	\N
466	\N	\N	\N	\N	42	\N	\N	\N	\N	\N	19	\N	\N	\N	\N	\N	\N	\N	\N	13	\N	\N	\N	23	\N	\N	3	\N
467	\N	\N	\N	\N	42	\N	\N	\N	\N	\N	19	\N	\N	\N	\N	\N	\N	\N	\N	13	\N	\N	\N	23	\N	\N	3	\N
468	\N	\N	\N	\N	42	\N	\N	\N	\N	\N	19	\N	\N	\N	\N	\N	\N	\N	\N	13	\N	\N	\N	23	\N	\N	3	\N
469	\N	\N	\N	\N	40	\N	\N	\N	\N	\N	19	\N	\N	\N	\N	\N	\N	\N	\N	13	\N	\N	\N	25	\N	\N	3	\N
470	\N	\N	\N	\N	40	\N	\N	\N	\N	\N	19	\N	\N	\N	\N	\N	\N	\N	\N	13	\N	\N	\N	25	\N	\N	3	\N
471	\N	\N	\N	\N	40	\N	\N	\N	\N	\N	19	\N	\N	\N	\N	\N	\N	\N	\N	13	\N	\N	\N	25	\N	\N	3	\N
472	\N	\N	\N	\N	40	\N	\N	\N	\N	\N	19	\N	\N	\N	\N	\N	\N	\N	\N	13	\N	\N	\N	25	\N	\N	3	\N
473	\N	\N	\N	\N	40	\N	\N	\N	\N	\N	19	\N	\N	\N	\N	\N	\N	\N	\N	13	\N	\N	\N	25	\N	\N	3	\N
474	\N	\N	\N	\N	38	\N	\N	\N	\N	\N	21	\N	\N	\N	\N	\N	\N	\N	\N	13	\N	\N	\N	25	\N	\N	3	\N
475	\N	\N	\N	\N	38	\N	\N	\N	\N	\N	21	\N	\N	\N	\N	\N	\N	\N	\N	13	\N	\N	\N	25	\N	\N	3	\N
476	\N	\N	\N	\N	38	\N	\N	\N	\N	\N	21	\N	\N	\N	\N	\N	\N	\N	\N	13	\N	\N	\N	25	\N	\N	3	\N
477	\N	\N	\N	\N	38	\N	\N	\N	\N	\N	21	\N	\N	\N	\N	\N	\N	\N	\N	13	\N	\N	\N	25	\N	\N	3	\N
478	\N	\N	\N	\N	40	\N	\N	\N	\N	\N	6	\N	\N	\N	26	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	3	\N
479	\N	\N	\N	\N	40	\N	\N	\N	\N	\N	6	\N	\N	\N	26	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	3	\N
480	\N	\N	\N	\N	38	\N	\N	\N	\N	\N	6	\N	\N	\N	26	\N	\N	\N	\N	\N	\N	\N	\N	27	\N	\N	3	\N
481	\N	\N	\N	\N	38	\N	\N	\N	\N	\N	6	\N	\N	\N	26	\N	\N	\N	\N	\N	\N	\N	\N	27	\N	\N	3	\N
482	\N	\N	\N	\N	38	\N	\N	\N	\N	\N	6	\N	\N	\N	26	\N	\N	\N	\N	\N	\N	\N	\N	27	\N	\N	3	\N
483	\N	\N	\N	\N	38	\N	\N	\N	\N	\N	6	\N	\N	\N	26	\N	\N	\N	\N	\N	\N	\N	\N	27	\N	\N	3	\N
484	\N	\N	\N	\N	36	\N	\N	\N	\N	\N	7	\N	\N	\N	27	\N	\N	\N	\N	\N	\N	\N	\N	27	\N	\N	3	\N
485	\N	\N	\N	\N	36	\N	\N	\N	\N	\N	7	\N	\N	\N	27	\N	\N	\N	\N	\N	\N	\N	\N	27	\N	\N	3	\N
486	\N	\N	\N	\N	36	\N	\N	\N	\N	\N	7	\N	\N	\N	27	\N	\N	\N	\N	\N	\N	\N	\N	27	\N	\N	3	\N
487	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	9	\N	\N	\N	27	\N	\N	\N	\N	\N	\N	\N	\N	27	\N	\N	3	\N
488	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	9	\N	\N	\N	27	\N	\N	\N	\N	\N	\N	\N	\N	27	\N	\N	3	\N
489	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	9	\N	\N	\N	27	\N	\N	\N	\N	\N	\N	\N	\N	27	\N	\N	3	\N
490	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	9	\N	\N	\N	27	\N	\N	\N	\N	\N	\N	\N	\N	27	\N	\N	3	\N
491	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	9	\N	\N	\N	27	\N	\N	\N	\N	\N	\N	\N	\N	27	\N	\N	3	\N
492	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	7	\N	\N	\N	23	\N	\N	\N	\N	5	\N	\N	\N	27	\N	\N	3	\N
493	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	7	\N	\N	\N	23	\N	\N	\N	\N	5	\N	\N	\N	27	\N	\N	3	\N
494	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	7	\N	\N	\N	23	\N	\N	\N	\N	5	\N	\N	\N	27	\N	\N	3	\N
495	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	7	\N	\N	\N	25	\N	\N	\N	\N	3	\N	\N	\N	27	\N	\N	3	\N
496	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	7	\N	\N	\N	25	\N	\N	\N	\N	3	\N	\N	\N	27	\N	\N	3	\N
497	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	7	\N	\N	\N	25	\N	\N	\N	\N	3	\N	\N	\N	27	\N	\N	3	\N
498	\N	\N	\N	\N	37	\N	\N	\N	\N	\N	20	\N	\N	\N	\N	\N	\N	\N	\N	16	\N	\N	\N	24	\N	\N	3	\N
499	\N	\N	\N	\N	37	\N	\N	\N	\N	\N	20	\N	\N	\N	\N	\N	\N	\N	\N	16	\N	\N	\N	24	\N	\N	3	\N
500	\N	\N	\N	\N	33	\N	\N	\N	\N	\N	23	\N	\N	\N	\N	\N	\N	\N	\N	17	\N	\N	\N	24	\N	\N	1	2
501	\N	\N	\N	\N	33	\N	\N	\N	\N	\N	23	\N	\N	\N	\N	\N	\N	\N	\N	17	\N	\N	\N	24	\N	\N	1	2
502	\N	\N	\N	\N	33	\N	\N	\N	\N	\N	23	\N	\N	\N	\N	\N	\N	\N	\N	17	\N	\N	\N	24	\N	\N	1	2
503	\N	\N	\N	\N	33	\N	\N	\N	\N	\N	23	\N	\N	\N	\N	\N	\N	\N	\N	17	\N	\N	\N	24	\N	\N	1	2
504	\N	\N	\N	\N	31	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	\N	\N	\N	17	\N	\N	\N	24	\N	\N	1	2
505	\N	\N	\N	\N	31	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	\N	\N	\N	17	\N	\N	\N	24	\N	\N	1	2
506	\N	\N	\N	\N	31	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	\N	\N	\N	17	\N	\N	\N	24	\N	\N	1	2
507	\N	\N	\N	\N	31	\N	\N	\N	\N	\N	18	\N	\N	\N	12	\N	\N	\N	\N	12	\N	\N	\N	24	\N	\N	3	\N
508	\N	\N	\N	\N	31	\N	\N	\N	\N	\N	18	\N	\N	\N	12	\N	\N	\N	\N	12	\N	\N	\N	24	\N	\N	3	\N
509	\N	\N	\N	\N	31	\N	\N	\N	\N	\N	18	\N	\N	\N	12	\N	\N	\N	\N	12	\N	\N	\N	24	\N	\N	3	\N
510	\N	\N	\N	\N	31	\N	\N	\N	\N	\N	18	\N	\N	\N	10	\N	\N	\N	\N	14	\N	\N	\N	24	\N	\N	3	\N
511	\N	\N	\N	\N	31	\N	\N	\N	\N	\N	18	\N	\N	\N	10	\N	\N	\N	\N	14	\N	\N	\N	24	\N	\N	3	\N
512	\N	\N	\N	\N	31	\N	\N	\N	\N	\N	18	\N	\N	\N	10	\N	\N	\N	\N	14	\N	\N	\N	24	\N	\N	3	\N
513	\N	\N	\N	\N	31	\N	\N	\N	\N	\N	18	\N	\N	\N	10	\N	\N	\N	\N	14	\N	\N	\N	24	\N	\N	3	\N
514	\N	\N	\N	\N	31	\N	\N	\N	\N	\N	18	\N	\N	\N	10	\N	\N	\N	\N	14	\N	\N	\N	24	\N	\N	3	\N
515	\N	\N	\N	\N	31	\N	\N	\N	\N	\N	18	\N	\N	\N	10	\N	\N	\N	\N	14	\N	\N	\N	24	\N	\N	3	\N
516	\N	\N	\N	\N	33	\N	\N	\N	\N	\N	18	\N	\N	\N	8	\N	\N	\N	\N	14	\N	\N	\N	24	\N	\N	3	\N
517	\N	\N	\N	\N	33	\N	\N	\N	\N	\N	18	\N	\N	\N	8	\N	\N	\N	\N	14	\N	\N	\N	24	\N	\N	3	\N
518	\N	\N	\N	\N	33	\N	\N	\N	\N	\N	18	\N	\N	\N	8	\N	\N	\N	\N	14	\N	\N	\N	24	\N	\N	3	\N
519	\N	\N	\N	\N	33	\N	\N	\N	\N	\N	18	\N	\N	\N	8	\N	\N	\N	\N	14	\N	\N	\N	24	\N	\N	3	\N
520	\N	\N	\N	\N	33	\N	\N	\N	\N	\N	18	\N	\N	\N	8	\N	\N	\N	\N	14	\N	\N	\N	24	\N	\N	3	\N
521	\N	\N	\N	\N	33	\N	\N	\N	\N	\N	18	\N	\N	\N	8	\N	\N	\N	\N	14	\N	\N	\N	24	\N	\N	3	\N
522	\N	\N	\N	\N	33	\N	\N	\N	\N	\N	18	\N	\N	\N	8	\N	\N	\N	\N	14	\N	\N	\N	24	\N	\N	3	\N
523	\N	\N	\N	\N	33	\N	\N	\N	\N	\N	18	\N	\N	\N	8	\N	\N	\N	\N	14	\N	\N	\N	24	\N	\N	\N	3
524	\N	\N	\N	\N	33	\N	\N	\N	\N	\N	18	\N	\N	\N	8	\N	\N	\N	\N	14	\N	\N	\N	24	\N	\N	\N	3
525	\N	\N	\N	\N	33	\N	\N	\N	\N	\N	18	\N	\N	\N	8	\N	\N	\N	\N	14	\N	\N	\N	24	\N	\N	\N	3
526	\N	\N	\N	\N	33	\N	\N	\N	\N	\N	18	\N	\N	\N	8	\N	\N	\N	\N	14	\N	\N	\N	24	\N	\N	\N	3
527	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	\N	\N	17	\N	\N	\N	22	\N	\N	\N	3
528	\N	\N	\N	\N	29	\N	\N	\N	\N	\N	26	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	\N	22	\N	\N	1	2
529	\N	\N	\N	\N	29	\N	\N	\N	\N	\N	26	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	\N	22	\N	\N	1	2
530	\N	\N	\N	\N	29	\N	\N	\N	\N	\N	26	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	\N	22	\N	\N	1	2
531	\N	\N	\N	\N	29	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	\N	\N	\N	14	\N	\N	7	22	\N	\N	1	2
532	\N	\N	\N	\N	29	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	\N	\N	\N	14	\N	\N	7	22	\N	\N	1	2
533	\N	\N	\N	\N	29	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	\N	\N	\N	14	\N	\N	7	22	\N	\N	1	2
534	\N	\N	\N	\N	29	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	\N	\N	\N	14	\N	\N	7	22	\N	\N	1	2
535	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	\N	\N	6	\N	\N	13	22	\N	\N	1	2
536	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	\N	\N	6	\N	\N	13	22	\N	\N	1	2
537	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	\N	\N	6	\N	\N	13	22	\N	\N	1	2
538	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	\N	\N	6	\N	\N	13	22	\N	\N	1	2
539	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	\N	\N	6	\N	\N	13	22	\N	\N	1	2
540	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	\N	\N	6	\N	\N	13	22	\N	\N	1	2
541	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	\N	\N	6	\N	\N	13	22	\N	\N	1	2
542	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	\N	\N	6	\N	\N	16	22	\N	\N	\N	\N
543	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	\N	\N	6	\N	\N	16	22	\N	\N	\N	\N
544	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	\N	\N	6	\N	\N	16	22	\N	\N	\N	\N
545	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	\N	\N	6	\N	\N	13	22	\N	\N	1	2
546	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	\N	\N	6	\N	\N	13	22	\N	\N	1	2
547	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	\N	\N	6	\N	\N	13	22	\N	\N	\N	\N
548	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	\N	\N	6	\N	\N	13	22	\N	\N	\N	\N
549	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	\N	\N	6	\N	\N	13	22	\N	\N	\N	\N
550	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	\N	\N	6	\N	\N	13	22	\N	\N	\N	\N
551	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	\N	\N	6	\N	\N	13	22	\N	\N	\N	\N
552	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	\N	\N	6	\N	\N	13	22	\N	\N	\N	\N
553	\N	\N	\N	\N	33	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	\N	\N	\N	6	\N	\N	13	23	\N	\N	\N	\N
554	\N	\N	\N	\N	33	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	\N	\N	\N	6	\N	\N	13	23	\N	\N	\N	\N
555	\N	\N	\N	\N	33	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	\N	\N	\N	6	\N	\N	13	23	\N	\N	\N	\N
556	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	\N	\N	6	\N	\N	13	22	\N	\N	1	2
557	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	\N	\N	6	\N	\N	13	22	\N	\N	1	2
558	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	\N	\N	6	\N	\N	13	22	\N	\N	1	2
559	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	\N	\N	6	\N	\N	13	22	\N	\N	1	2
560	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	\N	\N	6	\N	\N	13	22	\N	\N	1	2
561	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	\N	\N	6	\N	\N	13	22	\N	\N	1	2
562	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	\N	\N	6	\N	\N	13	22	\N	\N	1	2
563	\N	\N	\N	\N	31	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	\N	22	\N	\N	1	1
564	\N	\N	\N	\N	28	\N	\N	\N	\N	\N	26	\N	\N	\N	\N	\N	\N	\N	\N	22	\N	\N	\N	22	\N	\N	1	1
565	\N	\N	\N	\N	28	\N	\N	\N	\N	\N	26	\N	\N	\N	\N	\N	\N	\N	\N	22	\N	\N	\N	22	\N	\N	1	1
566	\N	\N	\N	\N	28	\N	\N	\N	\N	\N	26	\N	\N	\N	\N	\N	\N	\N	\N	22	\N	\N	\N	22	\N	\N	1	1
567	\N	\N	\N	\N	28	\N	\N	\N	\N	\N	26	\N	\N	\N	\N	\N	\N	\N	\N	22	\N	\N	\N	22	\N	\N	1	1
568	\N	\N	\N	\N	28	\N	\N	\N	\N	\N	26	\N	\N	\N	\N	\N	\N	\N	\N	22	\N	\N	\N	22	\N	\N	1	1
569	\N	\N	\N	\N	39	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	\N	\N	15	\N	\N	\N	20	\N	\N	1	1
570	\N	\N	\N	\N	39	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	\N	\N	15	\N	\N	\N	20	\N	\N	1	1
571	\N	\N	\N	\N	39	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	\N	\N	15	\N	\N	\N	20	\N	\N	1	1
572	\N	\N	\N	\N	39	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	\N	\N	15	\N	\N	\N	20	\N	\N	1	1
573	\N	\N	\N	\N	39	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	\N	\N	15	\N	\N	\N	20	\N	\N	1	1
574	\N	\N	\N	\N	39	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	\N	\N	15	\N	\N	\N	20	\N	\N	1	1
575	\N	\N	\N	\N	39	\N	\N	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15	14	\N	\N	1	1
576	\N	\N	\N	\N	39	\N	\N	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15	14	\N	\N	1	1
577	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	17	20	\N	\N	1	1
578	\N	\N	\N	\N	33	\N	\N	\N	\N	\N	27	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	18	20	\N	\N	1	1
579	\N	\N	\N	\N	33	\N	\N	\N	\N	\N	27	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	18	20	\N	\N	1	1
580	\N	\N	\N	\N	31	\N	\N	\N	\N	\N	29	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	18	20	\N	\N	1	1
581	\N	\N	\N	\N	31	\N	\N	\N	\N	\N	29	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	18	20	\N	\N	1	1
582	\N	\N	\N	\N	45	\N	\N	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9	14	\N	\N	1	1
583	\N	\N	\N	\N	38	\N	\N	\N	\N	\N	52	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8	0	\N	\N	1	1
584	\N	\N	\N	\N	42	\N	\N	\N	\N	\N	39	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8	9	\N	\N	1	1
585	\N	\N	\N	\N	42	\N	\N	\N	\N	\N	39	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8	9	\N	\N	1	1
586	\N	\N	\N	\N	42	\N	\N	\N	\N	\N	39	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8	9	\N	\N	1	1
587	\N	\N	\N	\N	51	\N	\N	\N	\N	\N	47	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1
588	\N	\N	\N	\N	43	\N	\N	\N	\N	\N	40	\N	\N	\N	\N	\N	\N	\N	7	\N	\N	\N	\N	8	\N	\N	1	1
589	\N	\N	\N	\N	43	\N	\N	\N	\N	\N	40	\N	\N	\N	\N	\N	\N	\N	7	\N	\N	\N	\N	8	\N	\N	1	1
590	\N	\N	\N	\N	45	\N	\N	\N	\N	\N	41	\N	\N	\N	\N	\N	\N	\N	6	\N	\N	\N	\N	7	\N	\N	1	\N
591	\N	\N	\N	\N	45	\N	\N	\N	\N	\N	41	\N	\N	\N	\N	\N	\N	\N	6	\N	\N	\N	\N	7	\N	\N	1	\N
592	\N	\N	\N	\N	45	\N	\N	\N	\N	\N	41	\N	\N	\N	\N	\N	\N	\N	6	\N	\N	\N	\N	7	\N	\N	1	\N
593	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	28	\N	\N	\N	\N	\N	\N	\N	6	\N	\N	\N	11	20	\N	\N	1	\N
594	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	\N	7	\N	\N	\N	12	18	\N	\N	1	\N
595	\N	\N	\N	\N	30	\N	\N	\N	\N	\N	31	\N	\N	\N	\N	\N	\N	\N	7	\N	\N	\N	13	18	\N	\N	1	\N
596	\N	\N	\N	\N	30	\N	\N	\N	\N	\N	31	\N	\N	\N	\N	\N	\N	\N	7	\N	\N	\N	13	18	\N	\N	1	\N
597	\N	\N	\N	\N	30	\N	\N	\N	\N	\N	31	\N	\N	\N	\N	\N	\N	\N	7	\N	\N	\N	13	18	\N	\N	1	\N
598	\N	\N	\N	\N	29	\N	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	7	\N	\N	\N	13	18	\N	\N	1	\N
599	\N	\N	\N	\N	29	\N	\N	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	\N	7	\N	\N	\N	13	20	\N	\N	1	\N
600	\N	\N	\N	\N	29	\N	\N	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	\N	7	\N	\N	\N	13	20	\N	\N	1	\N
601	\N	\N	\N	\N	29	\N	\N	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	\N	7	\N	\N	\N	13	20	\N	\N	1	\N
602	\N	\N	\N	\N	29	\N	\N	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	\N	7	\N	\N	\N	13	20	\N	\N	1	\N
603	\N	\N	\N	\N	29	\N	\N	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	\N	7	\N	\N	\N	13	20	\N	\N	1	\N
604	\N	\N	\N	\N	29	\N	\N	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	\N	7	\N	\N	\N	13	20	\N	\N	1	\N
605	\N	\N	\N	\N	29	\N	\N	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	\N	7	\N	\N	\N	13	20	\N	\N	1	\N
606	\N	\N	\N	\N	29	\N	\N	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	\N	7	\N	\N	\N	13	20	\N	\N	1	\N
607	\N	\N	\N	\N	29	\N	\N	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	\N	7	\N	\N	\N	13	20	\N	\N	1	\N
608	\N	\N	\N	\N	29	\N	\N	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	\N	7	\N	\N	\N	13	20	\N	\N	1	\N
609	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	8	\N	\N	\N	14	20	\N	\N	1	\N
610	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	8	\N	\N	\N	14	20	\N	\N	1	\N
611	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	8	\N	\N	\N	14	20	\N	\N	1	\N
612	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	8	\N	\N	\N	14	20	\N	\N	1	\N
613	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	11	\N	\N	\N	11	18	\N	\N	\N	1
614	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	11	\N	\N	\N	11	18	\N	\N	\N	1
615	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	11	\N	\N	\N	11	18	\N	\N	\N	1
616	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	11	\N	\N	\N	11	18	\N	\N	\N	1
617	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	11	\N	\N	\N	11	18	\N	\N	\N	1
618	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	11	\N	\N	\N	11	18	\N	\N	\N	1
619	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	11	\N	\N	\N	11	18	\N	\N	\N	1
620	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	11	\N	\N	\N	11	18	\N	\N	\N	1
621	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	11	\N	\N	\N	11	18	\N	\N	\N	1
622	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	11	\N	\N	\N	11	18	\N	\N	\N	1
623	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	11	\N	\N	\N	11	18	\N	\N	\N	1
624	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	9	\N	\N	\N	8	16	\N	\N	\N	1
625	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	9	\N	\N	\N	8	16	\N	\N	\N	1
626	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	9	\N	\N	\N	8	16	\N	\N	\N	1
627	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	9	\N	\N	\N	8	16	\N	\N	\N	1
628	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	7	10	\N	\N	\N	16	\N	\N	\N	1
629	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	7	10	\N	\N	\N	16	\N	\N	\N	1
630	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	7	10	\N	\N	\N	16	\N	\N	\N	1
631	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	7	10	\N	\N	\N	16	\N	\N	\N	1
632	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	7	10	\N	\N	\N	16	\N	\N	\N	1
633	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	7	10	\N	\N	\N	16	\N	\N	\N	1
634	\N	\N	\N	\N	36	\N	\N	\N	\N	\N	38	\N	\N	\N	\N	\N	\N	\N	7	10	\N	\N	\N	8	\N	\N	\N	1
635	\N	\N	\N	\N	36	\N	\N	\N	\N	\N	38	\N	\N	\N	\N	\N	\N	\N	7	10	\N	\N	\N	8	\N	\N	\N	1
636	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	7	10	\N	\N	\N	16	\N	\N	\N	1
637	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	7	10	\N	\N	\N	16	\N	\N	\N	1
638	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	7	10	\N	\N	\N	16	\N	\N	\N	1
639	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	7	10	\N	\N	\N	16	\N	\N	\N	1
640	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	7	10	\N	\N	\N	16	\N	\N	\N	1
641	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	28	\N	\N	\N	\N	\N	\N	\N	6	12	\N	\N	\N	20	\N	\N	\N	2
642	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	28	\N	\N	\N	\N	\N	\N	\N	6	12	\N	\N	\N	20	\N	\N	\N	2
643	\N	\N	\N	\N	33	\N	\N	\N	\N	\N	27	\N	\N	\N	\N	\N	\N	\N	6	11	\N	\N	\N	21	\N	\N	\N	2
644	\N	\N	\N	\N	33	\N	\N	\N	\N	\N	27	\N	\N	\N	\N	\N	\N	\N	6	11	\N	\N	\N	21	\N	\N	\N	2
645	\N	\N	\N	\N	33	\N	\N	\N	\N	\N	27	\N	\N	\N	\N	\N	\N	\N	6	11	\N	\N	\N	21	\N	\N	\N	2
646	\N	\N	\N	\N	31	\N	\N	\N	\N	\N	39	\N	\N	\N	\N	\N	\N	\N	6	10	\N	\N	\N	12	\N	\N	\N	2
647	\N	\N	\N	\N	31	\N	\N	\N	\N	\N	39	\N	\N	\N	\N	\N	\N	\N	6	10	\N	\N	\N	12	\N	\N	\N	2
648	\N	\N	\N	\N	31	\N	\N	\N	\N	\N	39	\N	\N	\N	\N	\N	\N	\N	6	10	\N	\N	\N	12	\N	\N	\N	2
649	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	41	\N	\N	\N	\N	\N	\N	\N	0	12	\N	\N	\N	10	\N	\N	\N	2
650	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	41	\N	\N	\N	\N	\N	\N	\N	0	12	\N	\N	\N	10	\N	\N	\N	2
651	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	41	\N	\N	\N	\N	\N	\N	\N	0	12	\N	\N	\N	10	\N	\N	\N	2
652	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	41	\N	\N	\N	\N	\N	\N	\N	0	12	\N	\N	\N	10	\N	\N	\N	2
653	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	41	\N	\N	\N	\N	\N	\N	\N	0	12	\N	\N	\N	10	\N	\N	\N	2
654	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	41	\N	\N	\N	\N	\N	\N	\N	0	12	\N	\N	\N	10	\N	\N	\N	2
655	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	41	\N	\N	\N	\N	\N	\N	\N	0	12	\N	\N	\N	10	\N	\N	\N	2
656	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	41	\N	\N	\N	\N	\N	\N	\N	0	12	\N	\N	\N	10	\N	\N	\N	2
657	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	41	\N	\N	\N	\N	\N	\N	\N	0	12	\N	\N	\N	10	\N	\N	\N	2
658	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	41	\N	\N	\N	\N	\N	\N	\N	0	12	\N	\N	\N	10	\N	\N	\N	2
659	\N	\N	\N	\N	29	\N	\N	\N	\N	\N	48	\N	\N	\N	\N	\N	\N	\N	6	10	\N	\N	\N	5	\N	\N	1	1
660	\N	\N	\N	\N	29	\N	\N	\N	\N	\N	48	\N	\N	\N	\N	\N	\N	\N	6	10	\N	\N	\N	5	\N	\N	1	1
661	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	41	\N	\N	\N	\N	\N	\N	\N	6	7	\N	\N	\N	10	\N	\N	\N	2
662	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	41	\N	\N	\N	\N	\N	\N	\N	6	7	\N	\N	\N	10	\N	\N	\N	2
663	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	41	\N	\N	\N	\N	\N	\N	\N	6	7	\N	\N	\N	10	\N	\N	\N	2
664	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	41	\N	\N	\N	\N	\N	\N	\N	6	7	\N	\N	\N	10	\N	\N	\N	2
665	\N	\N	\N	\N	33	\N	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	8	9	\N	\N	\N	18	\N	\N	\N	\N
666	\N	\N	\N	\N	33	\N	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	8	9	\N	\N	\N	18	\N	\N	\N	\N
667	\N	\N	\N	\N	33	\N	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	8	9	\N	\N	\N	18	\N	\N	\N	\N
668	\N	\N	\N	\N	28	\N	\N	\N	\N	\N	29	\N	\N	\N	\N	\N	\N	\N	8	13	\N	\N	\N	22	\N	\N	\N	\N
669	\N	\N	\N	\N	26	\N	\N	\N	\N	\N	27	\N	\N	\N	\N	\N	\N	\N	8	15	\N	\N	\N	24	\N	\N	\N	\N
670	\N	\N	\N	\N	26	\N	\N	\N	\N	\N	27	\N	\N	\N	\N	\N	\N	\N	8	15	\N	\N	\N	24	\N	\N	\N	\N
671	\N	\N	\N	\N	26	\N	\N	\N	\N	\N	27	\N	\N	\N	\N	\N	\N	\N	8	15	\N	\N	\N	24	\N	\N	\N	\N
672	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	23	\N	\N	\N	\N	\N	\N	\N	8	17	\N	\N	\N	24	\N	\N	4	\N
673	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	23	\N	\N	\N	\N	\N	\N	\N	8	17	\N	\N	\N	24	\N	\N	4	\N
674	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	23	\N	\N	\N	\N	\N	\N	\N	8	17	\N	\N	\N	24	\N	\N	4	\N
675	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	23	\N	\N	\N	\N	\N	\N	\N	8	17	\N	\N	\N	24	\N	\N	4	\N
676	\N	\N	\N	\N	27	\N	\N	\N	\N	\N	20	\N	\N	\N	\N	\N	\N	\N	8	17	\N	\N	\N	24	\N	\N	4	\N
677	\N	\N	\N	\N	27	\N	\N	\N	\N	\N	20	\N	\N	\N	\N	\N	\N	\N	8	17	\N	\N	\N	24	\N	\N	4	\N
678	\N	\N	\N	\N	36	\N	\N	\N	\N	\N	13	\N	\N	\N	\N	\N	\N	\N	8	14	\N	\N	\N	25	\N	\N	4	\N
679	\N	\N	\N	\N	36	\N	\N	\N	\N	\N	13	\N	\N	\N	\N	\N	\N	\N	8	14	\N	\N	\N	25	\N	\N	4	\N
680	\N	\N	\N	\N	36	\N	\N	\N	\N	\N	13	\N	\N	\N	\N	\N	\N	\N	8	14	\N	\N	\N	25	\N	\N	4	\N
681	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	\N	10	8	\N	\N	\N	20	\N	\N	\N	\N
682	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	29	\N	\N	\N	\N	\N	\N	\N	8	8	\N	\N	\N	21	\N	\N	\N	\N
683	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	29	\N	\N	\N	\N	\N	\N	\N	8	8	\N	\N	\N	21	\N	\N	\N	\N
684	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	9	8	\N	\N	\N	19	\N	\N	\N	\N
685	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	9	8	\N	\N	\N	19	\N	\N	\N	\N
686	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	31	\N	\N	\N	\N	\N	\N	\N	9	9	\N	\N	\N	17	\N	\N	\N	\N
687	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	31	\N	\N	\N	\N	\N	\N	\N	9	9	\N	\N	\N	17	\N	\N	\N	\N
688	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	31	\N	\N	\N	\N	\N	\N	\N	9	9	\N	\N	\N	17	\N	\N	\N	\N
689	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	31	\N	\N	\N	\N	\N	\N	\N	9	9	\N	\N	\N	17	\N	\N	\N	\N
690	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	44	\N	\N	\N	\N	\N	\N	\N	6	8	\N	\N	\N	8	\N	\N	\N	\N
691	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	44	\N	\N	\N	\N	\N	\N	\N	6	8	\N	\N	\N	8	\N	\N	\N	\N
692	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	46	\N	\N	\N	\N	\N	\N	\N	6	8	\N	\N	\N	8	\N	\N	\N	\N
693	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	46	\N	\N	\N	\N	\N	\N	\N	6	8	\N	\N	\N	8	\N	\N	\N	\N
694	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	41	\N	\N	\N	\N	\N	\N	\N	\N	15	\N	\N	\N	10	\N	\N	\N	\N
695	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	41	\N	\N	\N	\N	\N	\N	\N	\N	15	\N	\N	\N	10	\N	\N	\N	\N
696	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	48	\N	\N	\N	\N	\N	\N	\N	\N	12	\N	\N	\N	8	\N	\N	\N	\N
697	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	48	\N	\N	\N	\N	\N	\N	\N	\N	12	\N	\N	\N	8	\N	\N	\N	\N
698	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	48	\N	\N	\N	\N	\N	\N	\N	\N	12	\N	\N	\N	8	\N	\N	\N	\N
699	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	43	\N	\N	\N	\N	\N	\N	\N	\N	12	\N	\N	\N	10	\N	\N	\N	\N
700	\N	\N	\N	\N	38	\N	\N	\N	\N	\N	38	\N	\N	\N	\N	\N	\N	\N	\N	12	\N	\N	\N	12	\N	\N	\N	\N
701	\N	\N	\N	\N	38	\N	\N	\N	\N	\N	38	\N	\N	\N	\N	\N	\N	\N	\N	12	\N	\N	\N	12	\N	\N	\N	\N
702	\N	\N	\N	\N	38	\N	\N	\N	\N	\N	38	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12	\N	12	\N	\N	\N	\N
703	\N	\N	\N	\N	38	\N	\N	\N	\N	\N	38	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12	\N	12	\N	\N	\N	\N
704	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	\N	\N	8	\N	11	\N	19	\N	\N	\N	\N
705	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	\N	\N	8	\N	11	\N	19	\N	\N	\N	\N
706	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	22	\N	10	\N	\N	\N	\N	\N	\N	18	\N	\N	\N	18	\N	\N	\N	\N
707	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	22	\N	10	\N	\N	\N	\N	\N	\N	18	\N	\N	\N	18	\N	\N	\N	\N
708	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	22	\N	10	\N	\N	\N	\N	\N	\N	8	\N	8	\N	20	\N	\N	\N	\N
709	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	22	\N	10	\N	\N	\N	\N	\N	\N	8	\N	8	\N	20	\N	\N	\N	\N
710	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	22	\N	10	\N	\N	\N	\N	\N	\N	8	\N	8	\N	20	\N	\N	\N	\N
711	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	22	\N	10	\N	\N	\N	\N	\N	\N	8	\N	8	\N	20	\N	\N	\N	\N
712	\N	\N	\N	\N	34	\N	8	\N	\N	\N	10	\N	12	\N	\N	\N	\N	\N	\N	8	\N	8	\N	20	\N	\N	\N	\N
713	\N	\N	\N	\N	34	\N	8	\N	\N	\N	10	\N	12	\N	\N	\N	\N	\N	\N	8	\N	8	\N	20	\N	\N	\N	\N
714	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	16	\N	14	\N	\N	\N	\N	\N	\N	8	\N	8	\N	20	\N	\N	\N	\N
715	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	16	\N	15	\N	\N	\N	\N	\N	\N	\N	\N	14	\N	20	\N	\N	\N	\N
716	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	16	\N	15	\N	\N	\N	\N	\N	\N	\N	\N	14	\N	20	\N	\N	\N	\N
717	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	16	\N	15	\N	\N	\N	\N	\N	\N	\N	\N	14	\N	20	\N	\N	\N	\N
718	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	16	\N	15	\N	\N	\N	\N	\N	\N	\N	\N	14	\N	20	\N	\N	\N	\N
719	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	20	\N	18	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	17	\N	\N	\N	\N
720	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	20	\N	18	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	17	\N	\N	\N	\N
721	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	20	\N	18	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	17	\N	\N	\N	\N
722	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	20	\N	18	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	17	\N	\N	\N	\N
723	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	18	\N	20	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	17	\N	\N	\N	\N
724	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	18	\N	20	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	17	\N	\N	\N	\N
725	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	18	\N	20	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	17	\N	\N	\N	\N
726	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	10	\N	20	\N	\N	\N	\N	\N	\N	\N	\N	14	\N	19	\N	\N	2	\N
727	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	5	\N	16	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	22	\N	\N	2	\N
728	\N	\N	\N	\N	54	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	\N	10	\N	24	\N	\N	2	\N
729	\N	\N	\N	\N	50	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11	\N	\N	11	\N	26	\N	\N	2	\N
730	\N	\N	\N	\N	50	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11	\N	\N	11	\N	26	\N	\N	2	\N
731	\N	\N	\N	\N	50	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11	\N	\N	11	\N	26	\N	\N	2	\N
732	\N	\N	\N	\N	40	\N	\N	\N	\N	\N	10	\N	\N	\N	\N	\N	\N	\N	11	\N	\N	11	\N	26	\N	\N	2	\N
733	\N	\N	\N	\N	40	\N	\N	\N	\N	\N	10	\N	\N	\N	\N	\N	\N	\N	11	\N	\N	11	\N	26	\N	\N	2	\N
734	\N	\N	\N	\N	40	\N	9	\N	\N	\N	8	\N	\N	\N	\N	\N	\N	\N	12	\N	\N	8	\N	20	3	\N	\N	\N
735	\N	\N	\N	\N	40	\N	9	\N	\N	\N	8	\N	\N	\N	\N	\N	\N	\N	12	\N	\N	8	\N	20	3	\N	\N	\N
736	\N	\N	\N	\N	40	\N	9	\N	\N	\N	8	\N	\N	\N	\N	\N	\N	\N	12	\N	\N	8	\N	20	3	\N	\N	\N
737	\N	\N	\N	\N	40	\N	9	\N	\N	\N	8	\N	\N	\N	\N	\N	\N	\N	12	\N	\N	8	\N	20	3	\N	\N	\N
738	\N	\N	\N	27	15	\N	10	12	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7	\N	\N	7	\N	22	\N	\N	\N	\N
739	\N	\N	\N	27	15	\N	10	12	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7	\N	\N	7	\N	22	\N	\N	\N	\N
740	\N	\N	\N	27	15	\N	10	12	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7	\N	\N	7	\N	22	\N	\N	\N	\N
741	\N	\N	\N	27	15	\N	10	12	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7	\N	\N	7	\N	22	\N	\N	\N	\N
742	\N	\N	\N	27	15	\N	10	12	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7	\N	\N	7	\N	22	\N	\N	\N	\N
743	\N	\N	\N	27	15	\N	10	12	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7	\N	\N	7	\N	22	\N	\N	\N	\N
744	\N	\N	\N	27	13	\N	\N	\N	\N	12	\N	\N	12	\N	\N	\N	\N	\N	6	\N	\N	6	\N	24	\N	\N	\N	\N
745	\N	\N	\N	27	13	\N	\N	\N	\N	12	\N	\N	12	\N	\N	\N	\N	\N	6	\N	\N	6	\N	24	\N	\N	\N	\N
746	\N	\N	\N	27	13	\N	\N	\N	\N	12	\N	\N	12	\N	\N	\N	\N	\N	6	\N	\N	6	\N	24	\N	\N	\N	\N
747	\N	\N	\N	27	13	\N	\N	\N	\N	12	\N	\N	12	\N	\N	\N	\N	\N	6	\N	\N	6	\N	24	\N	\N	\N	\N
748	\N	\N	\N	38	\N	\N	\N	\N	\N	12	\N	\N	12	\N	\N	\N	\N	\N	6	\N	\N	6	\N	24	\N	\N	2	\N
749	\N	\N	\N	38	\N	\N	\N	\N	\N	12	\N	\N	12	\N	\N	\N	\N	\N	6	\N	\N	6	\N	24	\N	\N	2	\N
750	\N	\N	\N	38	\N	\N	\N	\N	\N	12	\N	\N	12	\N	\N	\N	\N	\N	6	\N	\N	6	\N	24	\N	\N	2	\N
751	\N	\N	\N	38	\N	\N	\N	\N	\N	12	\N	\N	12	\N	\N	\N	\N	\N	6	\N	\N	6	\N	24	\N	\N	2	\N
752	\N	\N	\N	38	\N	\N	\N	\N	\N	12	\N	\N	12	\N	\N	\N	\N	\N	6	\N	\N	6	\N	24	\N	\N	2	\N
753	\N	\N	\N	38	\N	\N	\N	\N	\N	12	\N	\N	12	\N	\N	\N	\N	\N	6	\N	\N	6	\N	24	\N	\N	2	\N
754	\N	\N	\N	38	\N	\N	\N	\N	\N	12	\N	\N	12	\N	\N	\N	\N	\N	6	\N	\N	6	\N	24	\N	\N	2	\N
755	\N	\N	\N	38	\N	\N	\N	8	\N	14	\N	\N	\N	\N	\N	\N	\N	\N	7	\N	\N	7	\N	24	\N	\N	2	\N
756	\N	\N	\N	38	\N	\N	\N	8	\N	14	\N	\N	\N	\N	\N	\N	\N	\N	7	\N	\N	7	\N	24	\N	\N	2	\N
757	\N	\N	\N	38	\N	\N	\N	8	\N	14	\N	\N	\N	\N	\N	\N	\N	\N	7	\N	\N	7	\N	24	\N	\N	2	\N
758	\N	\N	\N	38	\N	\N	\N	8	\N	14	\N	\N	\N	\N	\N	\N	\N	\N	7	\N	\N	7	\N	24	\N	\N	2	\N
759	\N	\N	\N	38	\N	\N	\N	8	\N	14	\N	\N	\N	\N	\N	\N	\N	\N	7	\N	\N	7	\N	24	\N	\N	2	\N
760	\N	\N	\N	22	15	\N	\N	8	\N	18	\N	\N	6	\N	\N	\N	\N	\N	7	\N	\N	7	\N	15	\N	\N	2	\N
761	\N	\N	\N	22	15	\N	\N	8	\N	18	\N	\N	6	\N	\N	\N	\N	\N	7	\N	\N	7	\N	15	\N	\N	2	\N
762	\N	\N	\N	22	15	\N	\N	8	\N	18	\N	\N	6	\N	\N	\N	\N	\N	7	\N	\N	7	\N	15	\N	\N	2	\N
763	\N	\N	\N	22	15	\N	\N	8	\N	14	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	\N	7	\N	22	\N	\N	2	\N
764	\N	\N	\N	22	15	\N	\N	8	\N	14	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	\N	7	\N	22	\N	\N	2	\N
765	\N	\N	\N	22	15	\N	\N	8	\N	14	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	\N	7	\N	22	\N	\N	2	\N
766	\N	\N	\N	22	15	\N	\N	8	\N	14	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	\N	7	\N	22	\N	\N	2	\N
767	\N	\N	\N	22	15	\N	\N	8	\N	14	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	\N	7	\N	22	\N	\N	2	\N
768	\N	\N	\N	22	15	\N	\N	8	\N	14	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	\N	7	\N	22	\N	\N	2	\N
769	\N	\N	\N	22	15	\N	\N	8	\N	14	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	\N	7	\N	22	\N	\N	2	\N
770	\N	\N	\N	22	15	\N	\N	8	\N	14	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	\N	7	\N	22	\N	\N	2	\N
771	\N	\N	\N	38	\N	\N	\N	8	\N	15	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	\N	7	\N	20	\N	\N	2	\N
772	\N	\N	\N	38	\N	\N	\N	8	\N	15	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	\N	7	\N	20	\N	\N	2	\N
773	\N	\N	\N	38	\N	\N	\N	8	\N	15	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	\N	7	\N	20	\N	\N	2	\N
774	\N	\N	\N	30	\N	\N	\N	8	\N	16	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	\N	12	\N	22	\N	\N	2	\N
775	\N	\N	\N	30	\N	\N	\N	8	\N	16	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	\N	12	\N	22	\N	\N	2	\N
776	\N	\N	\N	26	\N	\N	\N	\N	\N	16	\N	\N	24	\N	\N	\N	\N	\N	10	\N	\N	12	\N	10	\N	\N	2	\N
777	\N	\N	\N	26	\N	\N	\N	\N	\N	16	\N	\N	24	\N	\N	\N	\N	\N	10	\N	\N	12	\N	10	\N	\N	2	\N
778	\N	\N	\N	26	\N	\N	\N	\N	\N	16	\N	\N	24	\N	\N	\N	\N	\N	10	\N	\N	12	\N	10	\N	\N	2	\N
779	\N	\N	\N	26	\N	\N	\N	\N	\N	16	\N	\N	24	\N	\N	\N	\N	\N	10	\N	\N	12	\N	10	\N	\N	2	\N
780	\N	\N	\N	26	\N	\N	\N	\N	\N	16	\N	\N	24	\N	\N	\N	\N	\N	10	\N	\N	12	\N	10	\N	\N	2	\N
781	\N	\N	\N	26	\N	\N	\N	\N	\N	16	\N	\N	24	\N	\N	\N	\N	\N	10	\N	\N	12	\N	10	\N	\N	2	\N
782	\N	\N	\N	10	28	\N	\N	\N	\N	8	\N	\N	16	\N	\N	\N	\N	\N	6	\N	\N	6	\N	24	\N	\N	2	\N
783	\N	\N	\N	10	28	\N	\N	\N	\N	8	\N	\N	16	\N	\N	\N	\N	\N	6	\N	\N	6	\N	24	\N	\N	2	\N
784	\N	\N	\N	10	28	\N	\N	\N	\N	8	\N	\N	16	\N	\N	\N	\N	\N	6	\N	\N	6	\N	24	\N	\N	2	\N
785	\N	\N	\N	10	28	\N	\N	\N	\N	8	\N	\N	16	\N	\N	\N	\N	\N	6	\N	\N	6	\N	24	\N	\N	2	\N
786	\N	\N	\N	5	45	\N	\N	\N	\N	12	\N	\N	12	\N	\N	\N	\N	\N	\N	\N	\N	8	\N	16	\N	\N	2	\N
787	\N	\N	\N	5	45	\N	\N	\N	\N	12	\N	\N	12	\N	\N	\N	\N	\N	\N	\N	\N	8	\N	16	\N	\N	2	\N
788	\N	\N	\N	10	45	\N	\N	\N	\N	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	5	\N	\N	5	\N
789	\N	\N	\N	10	45	\N	\N	\N	\N	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	5	\N	\N	5	\N
790	\N	\N	\N	10	35	\N	\N	\N	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	\N	8	\N	8	\N	\N	5	\N
791	\N	\N	\N	15	20	\N	\N	\N	\N	\N	10	\N	16	\N	\N	\N	\N	\N	8	\N	\N	6	\N	24	\N	\N	1	\N
792	\N	\N	\N	15	20	\N	\N	\N	\N	\N	10	\N	16	\N	\N	\N	\N	\N	8	\N	\N	6	\N	24	\N	\N	1	\N
793	\N	\N	\N	15	20	\N	\N	\N	\N	\N	10	\N	16	\N	\N	\N	\N	\N	8	\N	\N	6	\N	24	\N	\N	1	\N
794	\N	\N	\N	15	20	\N	\N	\N	\N	\N	10	\N	16	\N	\N	\N	\N	\N	8	\N	\N	6	\N	24	\N	\N	1	\N
795	\N	\N	\N	15	20	\N	\N	\N	\N	\N	18	\N	8	\N	\N	\N	\N	\N	8	\N	6	\N	\N	24	\N	\N	1	\N
796	\N	\N	\N	15	20	\N	\N	\N	\N	\N	18	\N	8	\N	\N	\N	\N	\N	8	\N	6	\N	\N	24	\N	\N	1	\N
797	\N	\N	\N	15	20	\N	\N	\N	\N	\N	18	\N	8	\N	\N	\N	\N	\N	8	\N	6	\N	\N	24	\N	\N	1	\N
798	\N	\N	\N	15	20	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	\N	\N	9	\N	6	\N	\N	24	\N	\N	1	\N
799	\N	\N	\N	15	20	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	\N	\N	9	\N	6	\N	\N	24	\N	\N	1	\N
800	\N	\N	\N	15	20	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	\N	\N	9	\N	6	\N	\N	24	\N	\N	1	\N
801	\N	\N	\N	\N	29	\N	\N	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	\N	9	\N	6	\N	\N	25	\N	\N	1	\N
802	\N	\N	\N	\N	29	\N	\N	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	\N	9	\N	6	\N	\N	25	\N	\N	1	\N
803	\N	\N	\N	\N	29	\N	\N	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	\N	9	\N	6	\N	\N	25	\N	\N	1	\N
804	\N	\N	\N	\N	29	\N	\N	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	\N	9	\N	6	\N	\N	25	\N	\N	1	\N
805	\N	\N	\N	14	13	\N	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	10	\N	6	\N	\N	24	\N	\N	1	\N
806	\N	\N	\N	14	13	\N	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	10	\N	6	\N	\N	24	\N	\N	1	\N
807	\N	\N	\N	14	13	\N	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	10	\N	6	\N	\N	24	\N	\N	1	\N
808	\N	\N	\N	14	13	\N	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	10	\N	6	\N	\N	24	\N	\N	1	\N
809	\N	\N	\N	14	13	\N	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	10	\N	6	\N	\N	24	\N	\N	1	\N
810	\N	\N	\N	14	13	\N	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	10	\N	6	\N	\N	24	\N	\N	1	\N
811	\N	\N	\N	14	13	\N	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	10	\N	6	\N	\N	24	\N	\N	1	\N
812	\N	\N	\N	14	13	\N	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	10	\N	6	\N	\N	24	\N	\N	1	\N
813	\N	\N	\N	14	13	\N	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	10	\N	6	\N	\N	24	\N	\N	1	\N
814	\N	\N	\N	14	13	\N	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	10	\N	6	\N	\N	24	\N	\N	1	\N
815	\N	\N	\N	14	13	\N	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	10	\N	6	\N	\N	24	\N	\N	1	\N
816	\N	\N	\N	14	13	\N	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	10	\N	6	\N	\N	24	\N	\N	1	\N
817	\N	\N	\N	14	13	\N	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	10	\N	6	\N	\N	24	\N	\N	1	\N
818	\N	\N	\N	16	16	\N	\N	\N	\N	\N	31	\N	\N	\N	\N	\N	\N	\N	10	\N	6	\N	\N	20	\N	\N	1	\N
819	\N	\N	\N	16	16	\N	\N	\N	\N	\N	31	\N	\N	\N	\N	\N	\N	\N	10	\N	6	\N	\N	20	\N	\N	1	\N
820	\N	\N	\N	16	16	\N	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	10	\N	6	\N	\N	20	\N	\N	\N	\N
821	\N	\N	\N	16	16	\N	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	10	\N	6	\N	\N	20	\N	\N	\N	\N
822	\N	\N	\N	16	16	\N	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	10	\N	6	\N	\N	20	\N	\N	\N	\N
823	\N	\N	\N	16	16	\N	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	10	\N	6	\N	\N	20	\N	\N	\N	\N
824	\N	\N	\N	16	16	\N	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	10	\N	6	\N	\N	20	\N	\N	\N	\N
825	\N	\N	\N	16	16	\N	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	10	\N	6	\N	\N	20	\N	\N	\N	\N
826	\N	\N	\N	16	16	\N	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	10	\N	6	\N	\N	20	\N	\N	\N	\N
827	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	22	\N	14	\N	\N	\N	\N	\N	8	\N	6	\N	\N	18	\N	\N	\N	\N
828	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	22	\N	14	\N	\N	\N	\N	\N	8	\N	6	\N	\N	18	\N	\N	\N	\N
829	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	22	\N	14	\N	\N	\N	\N	\N	8	\N	6	\N	\N	18	\N	\N	\N	\N
830	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	22	\N	14	\N	\N	\N	\N	\N	8	\N	6	\N	\N	18	\N	\N	\N	\N
831	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	22	\N	14	\N	\N	\N	\N	\N	8	\N	6	\N	\N	18	\N	\N	\N	\N
832	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	22	\N	20	\N	\N	\N	\N	\N	10	\N	10	\N	\N	6	\N	\N	\N	\N
833	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	22	\N	20	\N	\N	\N	\N	\N	10	\N	10	\N	\N	6	\N	\N	\N	\N
834	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	22	\N	20	\N	\N	\N	\N	\N	10	\N	10	\N	\N	6	\N	\N	\N	\N
835	\N	\N	24	6	\N	\N	\N	\N	\N	\N	27	\N	5	\N	\N	\N	\N	\N	7	\N	6	\N	\N	25	\N	\N	\N	\N
836	\N	\N	24	6	\N	\N	\N	\N	\N	\N	27	\N	5	\N	\N	\N	\N	\N	7	\N	6	\N	\N	25	\N	\N	\N	\N
837	\N	\N	24	6	\N	\N	\N	\N	\N	\N	27	\N	5	\N	\N	\N	\N	\N	7	\N	6	\N	\N	25	\N	\N	\N	\N
838	\N	\N	24	6	\N	\N	\N	\N	\N	\N	27	\N	5	\N	\N	\N	\N	\N	7	\N	6	\N	\N	25	\N	\N	\N	\N
839	\N	\N	24	6	\N	\N	\N	\N	\N	\N	27	\N	5	\N	\N	\N	\N	\N	7	\N	6	\N	\N	25	\N	\N	\N	\N
840	\N	\N	24	6	\N	\N	\N	\N	\N	\N	27	\N	5	\N	\N	\N	\N	\N	7	\N	6	\N	\N	25	\N	\N	\N	\N
841	\N	\N	24	6	\N	\N	\N	\N	\N	\N	30	\N	5	\N	\N	\N	\N	\N	7	\N	6	\N	\N	22	\N	\N	\N	\N
842	\N	\N	24	6	\N	\N	\N	\N	\N	\N	30	\N	5	\N	\N	\N	\N	\N	7	\N	6	\N	\N	22	\N	\N	\N	\N
843	\N	\N	24	6	\N	\N	\N	\N	\N	\N	30	\N	5	\N	\N	\N	\N	\N	7	\N	6	\N	\N	22	\N	\N	\N	\N
844	\N	\N	24	6	\N	\N	\N	\N	\N	\N	30	\N	5	\N	\N	\N	\N	\N	7	\N	6	\N	\N	22	\N	\N	\N	\N
845	\N	\N	24	6	\N	\N	\N	\N	\N	\N	27	\N	5	\N	\N	\N	\N	\N	7	\N	6	\N	\N	25	\N	\N	\N	\N
846	\N	\N	24	6	\N	\N	\N	\N	\N	\N	27	\N	5	\N	\N	\N	\N	\N	7	\N	6	\N	\N	25	\N	\N	\N	\N
847	\N	\N	24	6	\N	\N	\N	\N	\N	\N	27	\N	5	\N	\N	\N	\N	\N	7	\N	6	\N	\N	25	\N	\N	\N	\N
848	\N	\N	24	6	\N	\N	\N	\N	\N	\N	27	\N	5	\N	\N	\N	\N	\N	7	\N	6	\N	\N	25	\N	\N	\N	\N
849	\N	\N	24	6	\N	\N	\N	\N	\N	\N	27	\N	5	\N	\N	\N	\N	\N	7	\N	6	\N	\N	25	\N	\N	\N	\N
850	\N	\N	24	11	\N	\N	\N	\N	\N	\N	32	\N	5	\N	\N	\N	\N	6	7	\N	\N	\N	\N	15	\N	\N	\N	\N
851	\N	\N	24	11	\N	\N	\N	\N	\N	\N	32	\N	5	\N	\N	\N	\N	6	7	\N	\N	\N	\N	15	\N	\N	\N	\N
852	\N	\N	22	11	\N	\N	\N	\N	\N	\N	29	\N	6	\N	\N	\N	\N	\N	6	\N	6	\N	\N	20	\N	\N	\N	\N
853	\N	\N	22	11	\N	\N	\N	\N	\N	\N	29	\N	6	\N	\N	\N	\N	\N	6	\N	6	\N	\N	20	\N	\N	\N	\N
854	\N	\N	15	15	\N	\N	\N	\N	\N	\N	28	\N	8	\N	\N	\N	\N	8	6	\N	\N	\N	\N	20	\N	\N	\N	\N
855	\N	\N	15	15	\N	\N	\N	\N	\N	\N	28	\N	8	\N	\N	\N	\N	8	6	\N	\N	\N	\N	20	\N	\N	\N	\N
856	\N	\N	15	15	\N	\N	\N	\N	\N	\N	26	\N	8	\N	\N	\N	\N	6	8	\N	\N	\N	\N	22	\N	\N	\N	\N
857	\N	\N	16	16	\N	\N	\N	\N	\N	\N	26	\N	8	\N	\N	\N	\N	6	8	\N	\N	\N	\N	20	\N	\N	\N	\N
858	\N	\N	16	16	\N	\N	\N	\N	\N	\N	26	\N	8	\N	\N	\N	\N	6	8	\N	\N	\N	\N	20	\N	\N	\N	\N
859	\N	\N	16	16	\N	\N	\N	\N	\N	\N	26	\N	8	\N	\N	\N	\N	6	8	\N	\N	\N	\N	20	\N	\N	\N	\N
860	\N	\N	16	16	\N	\N	\N	\N	\N	\N	26	\N	8	\N	\N	\N	\N	6	8	\N	\N	\N	\N	20	\N	\N	\N	\N
861	\N	\N	16	16	\N	\N	\N	\N	\N	\N	26	\N	8	\N	\N	\N	\N	6	8	\N	\N	\N	\N	20	\N	\N	\N	\N
862	\N	\N	16	16	\N	\N	\N	\N	\N	\N	26	\N	8	\N	\N	\N	\N	6	8	\N	\N	\N	\N	20	\N	\N	\N	\N
863	\N	\N	16	16	\N	\N	\N	\N	\N	\N	26	\N	8	\N	\N	\N	\N	6	8	\N	\N	\N	\N	20	\N	\N	\N	\N
864	\N	\N	16	16	\N	\N	\N	\N	\N	\N	26	\N	8	\N	\N	\N	\N	6	8	\N	\N	\N	\N	20	\N	\N	\N	\N
865	\N	\N	16	16	\N	\N	\N	\N	\N	\N	26	\N	8	\N	\N	\N	\N	6	8	\N	\N	\N	\N	20	\N	\N	\N	\N
866	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	21	\N	6	\N	\N	\N	\N	17	\N	\N	\N	\N	\N	24	\N	\N	\N	\N
867	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	16	\N	10	\N	\N	\N	\N	\N	9	\N	7	\N	\N	24	\N	\N	\N	\N
868	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	16	\N	10	\N	\N	\N	\N	\N	9	\N	7	\N	\N	24	\N	\N	\N	\N
869	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	16	\N	10	\N	\N	\N	\N	\N	9	\N	7	\N	\N	24	\N	\N	\N	\N
870	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	16	\N	10	\N	\N	\N	\N	\N	9	\N	7	\N	\N	24	\N	\N	\N	\N
871	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	16	\N	10	\N	\N	\N	\N	\N	9	\N	7	\N	\N	24	\N	\N	\N	\N
872	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	16	\N	10	\N	\N	\N	\N	\N	9	\N	7	\N	\N	24	\N	\N	\N	\N
873	\N	\N	22	10	\N	\N	\N	\N	\N	\N	16	\N	10	\N	\N	\N	\N	\N	9	\N	7	\N	\N	24	\N	2	\N	\N
874	\N	\N	22	10	\N	\N	\N	\N	\N	\N	16	\N	10	\N	\N	\N	\N	\N	9	\N	7	\N	\N	24	\N	2	\N	\N
875	\N	\N	25	6	\N	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	9	8	\N	\N	\N	\N	24	\N	2	2	\N
876	\N	\N	25	6	\N	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	9	8	\N	\N	\N	\N	24	\N	2	2	\N
877	\N	\N	25	6	\N	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	9	8	\N	\N	\N	\N	24	\N	2	2	\N
878	\N	\N	25	6	\N	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	9	8	\N	\N	\N	\N	24	\N	2	2	\N
879	\N	\N	25	6	\N	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	9	8	\N	\N	\N	\N	24	\N	2	2	\N
880	\N	\N	25	6	\N	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	9	8	\N	\N	\N	\N	24	\N	2	2	\N
881	\N	\N	25	6	\N	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	9	8	\N	\N	\N	\N	24	\N	2	2	\N
882	\N	\N	25	6	\N	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	9	8	\N	\N	\N	\N	24	\N	\N	4	\N
883	\N	\N	25	6	\N	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	9	8	\N	\N	\N	\N	24	\N	\N	4	\N
884	\N	\N	25	6	\N	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	9	8	\N	\N	\N	\N	24	\N	\N	4	\N
885	\N	\N	25	6	\N	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	9	8	\N	\N	\N	\N	24	\N	\N	4	\N
886	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	19	\N	\N	\N	\N	\N	21	\N	\N	4	\N
887	\N	\N	\N	33	\N	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	19	\N	\N	\N	\N	\N	20	\N	\N	4	\N
888	\N	\N	17	17	\N	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	21	\N	\N	\N	\N	\N	17	\N	\N	4	\N
889	\N	\N	17	17	\N	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	21	\N	\N	\N	\N	\N	17	\N	\N	4	\N
890	\N	\N	17	17	\N	\N	\N	\N	\N	\N	24	\N	\N	\N	\N	\N	\N	21	\N	\N	\N	\N	\N	17	\N	\N	4	\N
891	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	26	\N	\N	\N	\N	\N	\N	18	\N	\N	\N	\N	\N	18	\N	2	2	\N
892	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	26	\N	\N	\N	\N	\N	\N	18	\N	\N	\N	\N	\N	18	\N	2	2	\N
893	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	26	\N	\N	\N	\N	\N	\N	18	\N	\N	\N	\N	\N	18	\N	2	2	\N
894	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	26	\N	\N	\N	\N	\N	\N	18	\N	\N	\N	\N	\N	18	\N	\N	4	\N
895	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	26	\N	\N	\N	\N	\N	\N	18	\N	\N	\N	\N	\N	18	\N	\N	4	\N
896	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	26	\N	\N	\N	\N	\N	\N	18	\N	\N	\N	\N	\N	18	\N	\N	4	\N
897	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	31	\N	\N	\N	\N	\N	\N	12	6	\N	\N	\N	\N	13	\N	\N	4	\N
898	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	31	\N	\N	\N	\N	\N	\N	12	6	\N	\N	\N	\N	13	\N	\N	4	\N
899	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	14	\N	\N	\N	\N	13	\N	\N	4	\N
900	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	14	\N	\N	\N	\N	13	\N	\N	4	\N
901	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	33	\N	\N	\N	\N	\N	\N	\N	14	\N	\N	\N	\N	15	\N	\N	4	\N
902	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	33	\N	\N	\N	\N	\N	\N	\N	14	\N	\N	\N	\N	15	\N	\N	4	\N
903	\N	\N	\N	40	\N	\N	\N	\N	\N	\N	14	8	\N	\N	\N	\N	\N	\N	14	\N	\N	\N	\N	20	\N	\N	4	\N
904	\N	\N	\N	40	\N	\N	\N	\N	\N	\N	14	8	\N	\N	\N	\N	\N	\N	14	\N	\N	\N	\N	20	\N	\N	4	\N
905	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	14	8	\N	\N	\N	\N	\N	9	9	\N	\N	\N	\N	22	\N	\N	4	\N
906	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	14	8	\N	\N	\N	\N	\N	9	9	\N	\N	\N	\N	22	\N	\N	4	\N
907	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	14	8	\N	\N	\N	\N	\N	9	9	\N	\N	\N	\N	22	\N	\N	4	\N
908	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	14	8	\N	\N	\N	\N	\N	9	9	\N	\N	\N	\N	22	\N	\N	4	\N
909	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	14	8	\N	\N	\N	\N	\N	9	9	\N	\N	\N	\N	22	\N	\N	4	\N
910	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	14	8	\N	\N	\N	\N	\N	9	9	\N	\N	\N	\N	22	\N	\N	4	\N
911	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	14	8	\N	\N	\N	\N	\N	9	9	\N	\N	\N	\N	22	\N	\N	4	\N
912	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	14	8	\N	\N	\N	\N	\N	9	9	\N	\N	\N	\N	22	\N	\N	4	\N
913	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	14	8	\N	\N	\N	\N	\N	9	9	\N	\N	\N	\N	22	\N	\N	4	\N
914	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	14	8	\N	\N	\N	\N	\N	9	9	\N	\N	\N	\N	22	\N	\N	4	\N
915	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	14	8	\N	\N	\N	\N	\N	9	9	\N	\N	\N	\N	22	\N	\N	4	\N
916	\N	\N	\N	33	\N	\N	\N	\N	\N	\N	12	10	\N	\N	\N	\N	\N	\N	9	\N	9	\N	\N	23	\N	\N	4	\N
917	\N	\N	\N	33	\N	\N	\N	\N	\N	\N	12	10	\N	\N	\N	\N	\N	\N	9	\N	9	\N	\N	23	\N	\N	4	\N
918	\N	\N	\N	33	\N	\N	\N	\N	\N	\N	12	10	\N	\N	\N	\N	\N	\N	9	\N	9	\N	\N	23	\N	\N	4	\N
919	\N	\N	\N	33	\N	\N	\N	\N	\N	\N	12	10	\N	\N	\N	\N	\N	\N	9	\N	9	\N	\N	23	\N	\N	4	\N
920	\N	\N	\N	33	\N	\N	\N	\N	\N	\N	12	10	\N	\N	\N	\N	\N	\N	9	\N	9	\N	\N	23	\N	\N	4	\N
921	\N	\N	\N	33	\N	\N	\N	\N	\N	\N	14	10	\N	\N	\N	\N	\N	16	\N	\N	\N	\N	\N	23	\N	\N	4	\N
922	\N	\N	\N	33	\N	\N	\N	\N	\N	\N	14	10	\N	\N	\N	\N	\N	16	\N	\N	\N	\N	\N	23	\N	\N	4	\N
923	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	\N	16	\N	\N	\N	\N	\N	23	\N	\N	4	\N
924	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	\N	16	\N	\N	\N	\N	\N	23	\N	\N	4	\N
925	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	\N	16	\N	\N	\N	\N	\N	23	\N	\N	4	\N
926	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	\N	16	\N	\N	\N	\N	\N	23	\N	\N	4	\N
927	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	27	\N	\N	\N	\N	\N	\N	18	\N	\N	\N	\N	\N	23	\N	\N	\N	\N
928	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	27	\N	\N	\N	\N	\N	\N	18	\N	\N	\N	\N	\N	23	\N	\N	\N	\N
929	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	27	\N	\N	\N	\N	\N	\N	18	\N	\N	\N	\N	\N	23	\N	\N	\N	\N
930	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	27	\N	\N	\N	\N	\N	\N	18	\N	\N	\N	\N	\N	23	\N	\N	\N	\N
931	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	12	15	\N	\N	\N	\N	\N	18	\N	\N	\N	\N	\N	23	\N	\N	\N	\N
932	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	12	15	\N	\N	\N	\N	\N	18	\N	\N	\N	\N	\N	23	\N	\N	\N	\N
933	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	12	15	\N	\N	\N	\N	\N	18	\N	\N	\N	\N	\N	23	\N	\N	\N	\N
934	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	12	15	\N	\N	\N	\N	\N	18	\N	\N	\N	\N	\N	23	\N	\N	\N	\N
935	\N	\N	\N	28	\N	\N	\N	\N	\N	\N	7	20	\N	\N	\N	\N	\N	20	\N	\N	\N	\N	\N	25	\N	\N	\N	\N
936	\N	\N	\N	28	\N	\N	\N	\N	\N	\N	7	20	\N	\N	\N	\N	\N	20	\N	\N	\N	\N	\N	25	\N	\N	\N	\N
937	\N	\N	\N	28	\N	\N	\N	\N	\N	\N	7	20	\N	\N	\N	\N	\N	20	\N	\N	\N	\N	\N	25	\N	\N	\N	\N
938	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	10	\N	\N	\N	\N	17	18	\N	\N	\N	\N	\N	23	\N	\N	\N	\N
939	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	\N	12	\N	\N	\N	\N	17	18	\N	\N	\N	\N	\N	23	\N	\N	\N	\N
940	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	\N	12	\N	\N	\N	\N	17	18	\N	\N	\N	\N	\N	23	\N	\N	\N	\N
941	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	\N	12	\N	\N	\N	\N	17	18	\N	\N	\N	\N	\N	23	\N	\N	\N	\N
942	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	\N	12	\N	\N	\N	\N	17	16	\N	\N	\N	\N	\N	23	\N	\N	\N	2
943	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	\N	12	\N	\N	\N	\N	17	16	\N	\N	\N	\N	\N	23	\N	\N	\N	2
944	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	\N	12	\N	\N	\N	\N	16	14	\N	\N	\N	\N	\N	15	\N	\N	\N	13
945	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	29	16	\N	\N	\N	\N	\N	15	\N	\N	\N	8
946	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	29	16	\N	\N	\N	\N	\N	15	\N	\N	\N	8
947	\N	\N	\N	37	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	20	\N	\N	\N	\N	\N	28	\N	\N	\N	5
948	\N	\N	\N	37	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	20	\N	\N	\N	\N	\N	28	\N	\N	\N	5
949	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	18	\N	\N	\N	\N	\N	20	\N	\N	\N	5
950	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	18	\N	\N	\N	\N	\N	20	\N	\N	\N	5
951	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	27	16	\N	\N	\N	\N	\N	20	\N	\N	\N	3
952	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	27	16	\N	\N	\N	\N	\N	20	\N	\N	\N	3
953	\N	\N	\N	38	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	27	10	\N	\N	\N	\N	\N	22	\N	\N	\N	3
954	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	27	16	\N	\N	\N	\N	\N	22	\N	\N	\N	3
955	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	27	16	\N	\N	\N	\N	\N	22	\N	\N	\N	3
956	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	27	16	\N	\N	\N	\N	\N	22	\N	\N	\N	3
957	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	27	16	\N	\N	\N	\N	\N	22	\N	\N	\N	3
958	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	27	16	\N	\N	\N	\N	\N	22	\N	\N	\N	3
959	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	29	\N	\N	\N	\N	\N	\N	18	\N	\N	\N	\N	\N	18	\N	\N	\N	3
960	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	29	\N	\N	\N	\N	\N	\N	18	\N	\N	\N	\N	\N	18	\N	\N	\N	3
961	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	29	\N	\N	\N	\N	\N	\N	18	\N	\N	\N	\N	\N	18	\N	\N	\N	3
962	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	29	\N	\N	\N	\N	\N	\N	18	\N	\N	\N	\N	\N	15	\N	3	\N	3
963	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	29	\N	\N	\N	\N	\N	\N	18	\N	\N	\N	\N	\N	15	\N	3	\N	3
964	\N	\N	\N	26	\N	\N	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	22	\N	\N	\N	\N	\N	17	\N	3	\N	\N
965	\N	\N	\N	26	\N	\N	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	22	\N	\N	\N	\N	\N	17	\N	3	\N	\N
966	\N	\N	\N	31	\N	\N	\N	\N	\N	\N	27	\N	\N	\N	\N	\N	\N	17	\N	\N	\N	\N	\N	22	\N	3	\N	\N
967	\N	\N	\N	31	\N	\N	\N	\N	\N	\N	27	\N	\N	\N	\N	\N	\N	17	\N	\N	\N	\N	\N	22	\N	3	\N	\N
968	\N	\N	\N	31	\N	\N	\N	\N	\N	\N	27	\N	\N	\N	\N	\N	\N	17	\N	\N	\N	\N	\N	22	\N	3	\N	\N
969	\N	\N	\N	31	\N	\N	\N	\N	\N	\N	15	12	\N	\N	\N	\N	\N	17	\N	\N	\N	\N	\N	22	\N	3	\N	\N
970	\N	\N	\N	31	\N	\N	\N	\N	\N	\N	15	12	\N	\N	\N	\N	\N	17	\N	\N	\N	\N	\N	22	\N	3	\N	\N
971	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	7	20	\N	\N	\N	\N	\N	17	\N	\N	\N	\N	\N	22	\N	\N	\N	\N
972	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	14	\N	\N	\N	\N	22	14	\N	\N	\N	\N	\N	18	\N	\N	\N	\N
973	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	14	\N	\N	\N	\N	22	14	\N	\N	\N	\N	\N	18	\N	\N	\N	\N
974	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	14	\N	\N	\N	\N	22	14	\N	\N	\N	\N	\N	18	\N	\N	\N	\N
975	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	30	18	\N	\N	\N	\N	\N	20	\N	\N	\N	\N
976	\N	\N	\N	38	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	22	17	\N	\N	\N	\N	\N	23	\N	\N	\N	\N
977	\N	\N	\N	38	\N	\N	\N	\N	\N	\N	\N	10	\N	\N	\N	\N	12	17	\N	\N	\N	\N	\N	23	\N	\N	\N	\N
978	\N	\N	\N	38	\N	\N	\N	\N	\N	\N	\N	10	\N	\N	\N	\N	12	17	\N	\N	\N	\N	\N	23	\N	\N	\N	\N
979	\N	\N	\N	38	\N	\N	\N	\N	\N	\N	\N	10	\N	\N	\N	\N	12	17	\N	\N	\N	\N	\N	23	\N	\N	\N	\N
980	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	25	17	\N	\N	\N	\N	\N	21	\N	\N	\N	\N
981	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	25	17	\N	\N	\N	\N	\N	21	\N	\N	\N	\N
982	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	25	17	\N	\N	\N	\N	\N	21	\N	\N	\N	\N
983	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	11	\N	\N	\N	\N	34	10	\N	\N	\N	\N	\N	11	\N	\N	\N	\N
984	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	11	\N	\N	\N	\N	34	10	\N	\N	\N	\N	\N	11	\N	\N	\N	\N
985	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	11	\N	\N	\N	\N	\N	31	10	\N	\N	\N	\N	\N	11	\N	3	\N	\N
986	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	11	\N	\N	\N	\N	\N	31	10	\N	\N	\N	\N	\N	11	\N	3	\N	\N
987	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	11	\N	\N	\N	\N	\N	31	10	\N	\N	\N	\N	\N	11	\N	3	\N	\N
988	\N	\N	33	\N	\N	\N	\N	\N	\N	\N	\N	11	\N	\N	\N	\N	25	10	\N	\N	\N	\N	\N	18	\N	3	\N	\N
989	\N	\N	33	\N	\N	\N	\N	\N	\N	\N	\N	11	\N	\N	\N	\N	25	10	\N	\N	\N	\N	\N	18	\N	3	\N	\N
990	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	\N	\N	\N	17	15	\N	\N	\N	\N	\N	23	\N	\N	\N	\N
991	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	\N	\N	\N	17	15	\N	\N	\N	\N	\N	23	\N	\N	\N	\N
992	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	27	17	\N	\N	\N	\N	\N	24	\N	\N	\N	\N
993	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	27	17	\N	\N	\N	\N	\N	24	\N	\N	\N	\N
994	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	27	17	\N	\N	\N	\N	\N	24	\N	\N	\N	\N
995	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	27	17	\N	\N	\N	\N	\N	24	\N	\N	\N	\N
996	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	14	\N	\N	\N	\N	13	17	\N	\N	\N	\N	\N	24	\N	\N	\N	\N
\.


--
-- TOC entry 5138 (class 0 OID 41541)
-- Dependencies: 230
-- Data for Name: coal_blend_standard; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coal_blend_standard (row_name, total_moisture, ash_percent, vm_percent, fc_percent, sulphur_percent, phosphorus) FROM stdin;
Goonyella	10.2	8.1	21.4	60.4	0.49	0.023
Riverside	9.5	9.2	20.2	61.2	0.5	0.012
Moranbah North	10.8	11	21.5	66	0.52	0.04
Caval Ridge	6.71	9.5	20.2	60	0.55	0.032
Daunia	10	7.3	20.1	62.5	0.4	0.037
Poitrel PCI	9.5	8.6	21.1	60.8	0.32	0.074
Leer	7.3	9.39	30.72	59.29	0.97	0.025
Russian PCI	9	10	17	72	0.4	0.055
Eagle Creek	8.5	8.67	23.31	67.02	0.99	0.027
PDN	0	9.5	20.5	68.2	0.35	0.065
Metropolitan Coking Coal	10.5	9.5	17.2	62.8	0.3	0.054
Illawara	10	8.6	21.8	59.5	0.5	0.041
Indonesian IMR	0	8.86	26	64.46	0.8	0.006
Scratch Coal	8.61	1	11.22	23.25	64.53	0.3
Elga coal	10.18	11.2	27.8	50.8	27	0
UVALNAYA COKING COAL	1.1	8.4	34	52.12	0.46	0.059
Blue Creek Mid Vol	10	9.2	23.9	65.9	0.77	0.035
Mt.Laurel	0	9.57	32.61	56.64	0.92	0.03
Lake Vermont PCI	11	10.5	20.5	67.5	0.45	0.085
Teck Venture Coal	9	10.5	23.5	65.3	0.5	0.055
Aus.SHCC	10.5	9.5	17.3	62.7	0.4	0.027
SHCC_AMONATE	0	7.5	24.5	68	0.68	0.002
\.


--
-- TOC entry 5139 (class 0 OID 41546)
-- Dependencies: 231
-- Data for Name: coal_blend_standard_proprety; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coal_blend_standard_proprety (riverside, "Moranbah North", "Illawara(PHCC)", goonyella, "Caval Ridge", pdn, poitrel, amonate, "Aus.SHCC", "Teck Venture", "Lake Vermont", metropolitan, indonasian, "Low Ash SHCC/ SHCC-BHP", "Eagle creek", "Dhamra_SHCC_PDN", daunia, leer, elga, "Leer/Russian HFCC", uvalnaya, "Blue creek", "Mt.Laurel", "Russian PCI", "E.Soft", "Indian Coal Dhanbaad", "Scratch Coal", " HCC/SHCC Contaminated Coal") FROM stdin;
\.


--
-- TOC entry 5140 (class 0 OID 41549)
-- Dependencies: 232
-- Data for Name: coal_list; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coal_list (id, coalno, coal_name, active_flag, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5142 (class 0 OID 41556)
-- Dependencies: 234
-- Data for Name: coal_master_model_new; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coal_master_model_new (id, coalno, coal_name, active, ash_airdried_prox_imputed, ash_dry_prox_imputed, volatilematter_dry_prox_imputed, sulphur_airdried_prox_imputed, fixedcarbon_airdried_prox, totalmoisture_asreceived_prox_imputed, inherentmoisture_airdried_prox, vitrinitereflectanceromax_imputed, vitrinitereflectancervrandom_imputed, vitrinite_imputed, csn_imputed, maxfluidity_log_imputed, silicondioxide_imputed, aluminiumoxide_imputed, calciumoxide_imputed, magnesiumoxide_imputed, ironoxide_imputed, sodiumoxide_imputed, potassiumoxide_imputed, phosphoruspentoxide_imputed, titaniumoxide_imputed, trimanganesetetraoxide_imputed, sulfurtrioxide_imputed, fob_price, freight, discount, exchange_rate, coaltype, landed_cost, duty, cess, port_to_plant, wmt_cost, dmt_cost, created_at) FROM stdin;
\.


--
-- TOC entry 5144 (class 0 OID 41562)
-- Dependencies: 236
-- Data for Name: coal_properties; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coal_properties (coal_name, total_moisture, ash_percent, vm_percent, fc_percent, sulphur_percent, phosphorus) FROM stdin;
Goonyella	10.2	8.1	21.4	60.4	0.49	0.023
Riverside	9.5	9.2	20.2	61.2	0.5	0.012
Moranbah_North	10.8	11	21.5	66	0.52	0.04
Caval_Ridge	6.71	9.5	20.2	60	0.55	0.032
Daunia	10	7.3	20.1	62.5	0.4	0.037
Poitrel PCI	9.5	8.6	21.1	60.8	0.32	0.074
Leer	7.3	9.39	30.72	59.29	0.97	0.025
Russian PCI	9	10	17	72	0.4	0.055
Eagle Creek	8.5	8.67	23.31	67.02	0.99	0.027
PDN	0	9.5	20.5	68.2	0.35	0.065
Metropolitan Coking Coal	10.5	9.5	17.2	62.8	0.3	0.054
Illawara	10	8.6	21.8	59.5	0.5	0.041
Indonesian IMR	0	8.86	26	64.46	0.8	0.006
Scratch_Coal	8.61	1	11.22	23.25	64.53	0.3
Elga coal	10.18	11.2	27.8	50.8	27	0
UVALNAYA COKING COAL	1.1	8.4	34	52.12	0.46	0.059
Blue Creek Mid Vol	10	9.2	23.9	65.9	0.77	0.035
Mt.Laurel	0	9.57	32.61	56.64	0.92	0.03
Lake Vermont PCI	11	10.5	20.5	67.5	0.45	0.085
Teck Venture Coal	9	10.5	23.5	65.3	0.5	0.055
Aus.SHCC	10.5	9.5	17.3	62.7	0.4	0.027
SHCC_AMONATE	0	7.5	24.5	68	0.68	0.002
\.


--
-- TOC entry 5145 (class 0 OID 41567)
-- Dependencies: 237
-- Data for Name: coal_properties_all; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coal_properties_all (coal_name, ash_airdried_prox_imputed, ash_dry_prox_imputed, volatilematter_dry_prox_imputed, silicondioxide_imputed, sulphur_airdried_prox_imputed, maxfluidity_log_imputed, vitrinite_imputed, aluminiumoxide_imputed, calciumoxide_imputed, ironoxide_imputed, magnesiumoxide_imputed, sodiumoxide_imputed, potassiumoxide_imputed, phosphoruspentoxide_imputed, titaniumoxide_imputed, trimanganesetetraoxide_imputed, sulfurtrioxide_imputed, csn_imputed) FROM stdin;
Metropolitan	10.5	0.35	10.6	19.2	36	6.5	50	50.5	37.5	4.4	1.1	0.6	0.6	0.8	2.1	0.02	0.4	1.1
Lake Vermont	10.5	0.45	10.66	20.81	30	2.5	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
PDN	9.5	0.35	\N	\N	34	3	10	43.6	36.6	4.4	6.8	0.9	0.1	0.2	1.7	0	1.3	1.6
Riverside	10	0.55	10.1	22.3	57	8.5	500	62.5	28.5	3.9	0.7	0.5	0.5	0.9	1.6	0	0.4	0.3
Poitrel	9.3	0.35	9.5	23.4	30	1	1	44.5	35	7.2	5	1.1	0.3	0.4	1.7	0.1	1.3	1.4
Illawara (PHCC)	9.5	0.49	9.6	24.2	63	8	3000	63.4	26.1	3.9	2.1	0.5	0.3	0.9	1.4	0.1	0.4	1.1
Teck Venture	10.5	0.5	\N	\N	47	6	8	55	29.1	3.3	3.9	0.8	0.4	0.6	1.8	\N	1.6	1.2
Leer	9.39	0.97	7.69	33.19	65.4	8.5	20000	47.59	32.34	9.31	3.09	0.55	0.24	1.33	1.5	0.04	1.73	0.4
Daunia (SHCC)	8	0.42	8.1	22.4	52	6.5	74	47.5	29.3	9	5.9	1.1	0.2	0.6	1.5	0.1	3	1.2
Mt. Laurel	9.57	0.92	7.25	37	59.9	7.5	5000	52.73	32.25	5.77	2.04	0.64	0.42	1.21	1.82	\N	1.45	0.4
Moranbah North	11	0.52	9.9	21.8	64	9	250	54.8	33.4	4.77	1.57	1.02	0.58	0.63	1.61	0.04	0.46	0.82
R.PCI	10	0.4	\N	\N	\N	1	\N	56.35	27.9	4.58	2.54	0.63	0.6	1.34	0.91	\N	\N	1.25
Eagle crrek	8.67	0.99	\N	\N	74	8.5	1362	53.7	31.65	5.88	1.73	0.74	0.51	1.62	1.64	\N	1.54	0.64
Goonyella	8.9	0.54	9	23.8	64	8.5	700	56.1	32.6	4.8	1.3	0.8	0.5	0.8	1.8	0.1	0.3	0.6
Blue creek	9.2	0.77	\N	\N	70.8	9	10000	56.87	28.27	5.7	2.08	1.12	0.5	1.5	1.61	0.03	0.93	0.86
Scratch Coal	11.22	0.3	\N	\N	58	8	10	52.4	32.3	5.3	2.1	0.9	0.42	1.4	1	0.06	1.5	1.6
Dhamra SHCC PDN	10.6	\N	\N	\N	63	8.5	275	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
Elga	12.36	0.3	12.51	30.96	99	8.5	50000	57.2	24.72	4.87	5.03	1.84	0.55	1.13	1.2	\N	2.26	0.31
Low Ash SHCC/ SHCC-BHP	9.6	0.22	9.7	32.7	97.3	8.5	42000	53.2	28.1	5.3	4.2	1.6	0.6	1.2	1.2	0.1	3.5	0.09
Leer/Russian HFCC	9.5	0.4	\N	\N	91	7.5	11000	54.3	28.5	4.8	3.6	1.5	0.6	1.2	1.2	0.1	1.4	0.35
Indonasian	8.86	0.6	\N	\N	\N	8	10	47.42	29.64	9.3	3.52	2.84	1.08	2.06	1.19	0.04	1.05	0.52
Uvalnaya	8.4	0.46	\N	\N	87	8.5	30000	55.98	28.61	4.2	2.08	1.2	0.93	2.3	1.2	0.03	0.55	\N
Caval Ridge	10.44	0.62	10.6	22.5	70	8	700	64.2	23.8	3.9	1.6	0.6	0.5	1.1	1.1	0	0.3	0.8
Amonate	7.5	0.68	6.45	36.5	67.6	8.5	65	48.42	26.93	7.56	5.64	1.5	0.33	1.55	\N	\N	5.05	0.07
Aus.SHCC	10.5	0.56	10.6	21.5	70	8.5	800	57	26	9.3	1.7	0.8	0.3	1.6	1.2	0.1	1.1	0.2
Indian Coal Dhanbaad	18.32	10	25.8	70.2	0.8	400	700	55	28	4.3	0.3	0.13	0.84	1.24	1.3	0.1	0.12	6.5
\.


--
-- TOC entry 5146 (class 0 OID 41570)
-- Dependencies: 238
-- Data for Name: coal_properties_clean; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coal_properties_clean (coal_name, "IM", "Ash", "VM", "FC", "S", "P", "SiO2", "Al2O3", "Fe2O3", "CaO", "MgO", "Na2O", "K2O", "TiO2", "Mn3O4", "SO3", "P2O5", "BaO", "SrO", "ZnO", "CRI", "CSR", "N", "HGI", "Rank", "Vitrinite", "Liptinite", "Semi_Fusinite", "CSN_FSI", "Initial_Softening_Temp", "MBI", "CBI", "Log_Max_Fluidity", coal_category, "C", "H", "O", ss, "V7", "V8", "V9", "V10", "V11", "V12", "V13", "V14", "V15", "V16", "V17", "V18", "V19", "Inertinite", "Minerals", "MaxFluidity") FROM stdin;
Elga	0.01	10	32	64	0.3	0.025	53.2	28.1	5.3	8.4	1.6	0.6	1.2	1.2	0	2.26	0.31	0.24	0.1	0	23.4	57.6	0.02	80	1.05	97	0	6.1	8	385	5.152348709	0.116275804	10.30895266	HFCC	79	5	4	0.87	0	30	43	27	0	0	0	0	0	0	0	0	0	0	4.6	30000
Lake Vermont	0.016	8	22	67	0.5	0.08	56.699999999999996	28.9	4.3	3.1	0.8999999999999999	0.2	1.4000000000000001	0	0.01	0.1	2.1999999999999997	0	0	0	23	64	0.016	80	1.19	51	0	35	7	420	1.598512784	0.224761354	4.605170186	SHCC	89	4.8	4	0.4	0	0	0	0	5	55	40	0	0	0	0	0	0	7	0	100
Uvalnaya	0.011	0.084	0.34	0.5212	0.0046	0.00059	55.98	28.610000000000003	4.2	2.08	1.2	0.9299999999999999	2.3	1.2	0.03	0.5499999999999999	0	0	0	0	26.6	49.9	0.0216	0	0	0	0	0	0	0	0	0	0	SHCC	0	0	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
Moranbah North	0.015	9.9	21.8	68.2	0.53	0.04	54.800000000000004	33.4	4.77	1.5699999999999998	1.02	0.58	0.63	1.6099999999999999	0.04	0.45999999999999996	0.8200000000000001	0.05	0.08	0.02	22	70	0.019	80	1.3	64	0	26	9	420	1.208049047	0.332893474	6.476972363	HCC	88.7	4.98	3.75	0.6	0	0	0	0	4	44	48	4	0	0	0	0	0	6	4	650
Riverside	0.013	10.2	22.3	67.5	0.56	0.015	62.5	28.499999999999996	3.9	0.7000000000000001	0.5	0.5	0.8999999999999999	1.6	0	0.4	0.3	0	0	0	23	70	0.02	85	1.25	59	1	31	8.5	415	0.832814381	0.239378909	6.214608098	HCC	88.5	5	3.9	0.6	0	0	0	0	24	52	24	0	0	0	0	0	0	8	0	500
Scratch Coal	0.01	11.22	23.25	64.53	0.3	0.004	52.400000000000006	32.300000000000004	5.3	2.1	0.8999999999999999	0.42	1.4000000000000001	1	0.06	1.5	1.6	0	0	0	27	55	0.02	79	1.15	58	0	24	8	433	1.734386778	0	2.302585093	WC	87	5	3.8	0.6	13	35	17	22	2	8	3	0	0	0	0	0	0	19	2	10
Teck Venture	0.007	9.5	23	66.4	0.4	0.06	55.00000000000001	29.099999999999998	3.3000000000000003	3.9	0.8	0.4	0.6	1.7999999999999998	0	1.6	1.2	0	0	0	30	60	0.0134	84	1.17	49.8	0	17.1	6	405	1.153182403	1.088601988	4.605170186	SHCC	79.9	4.3	4.6	0.4	0	2	6	12	38	34	8	0	0	0	0	0	0	35.2	4.9	100
Leer/Russian HFCC	0.01	7.3	32.13	60.37	1.05	0.025	54.300000000000004	28.499999999999996	4.8	3.5999999999999996	1.5	0.6	1.2	1.2	0.1	1.4000000000000001	0.35000000000000003	0	0	0	26	58	0.0152	76	0.99	91	0	1.4	7.5	375	1.498137195	0.34692479	9.305650552	HFCC	79.5	5.82	5.36	0.7	0	0.6	13.4	32	15.4	2.6	0	0	0	0	0	0	0	9	0	11000
R.PCI	0.01	8.4	18.4	73.2	0.5	0.04	56.35	27.900000000000002	4.58	2.54	0.63	0.6	1.34	0.91	0	0	1.25	0	3.9	0	35	57	0.0235	74	1.48	52	0	41	1	410	1.171324566	0	0	PCI	88.19	3.99	4.94	0.53	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1
Daunia (SHCC)	0.017	8.1	22.4	69.5	0.46	0.041	47.5	29.299999999999997	9	5.8999999999999995	1.0999999999999999	0.2	0.6	1.5	0.1	3	1.2	0	0	0	35	56	0.017	85	1.27	52	0	36	8	425	2.239601849	0.249158249	5.298317367	SHCC	88.7	4.8	4.3	0.5	0	0	0	0	10	60	30	0	0	0	0	0	0	8	0	200
Eagle crrek	0.01	8.4	24	66.75	0.9	0.025	53.7	31.65	5.88	1.73	0.74	0.51	1.6199999999999999	1.6400000000000001	0	1.54	0.64	0	0	0	22	68	0.022	80	1.26	74	1.5	24.5	9	405	1.331550511	0	7.824046011	SHCC	88.1	4.7	4.4	0.8	0	0	0	3	15	58	22	2	0	0	0	0	0	0	0	2500
Metropolitan	0.01	10.6	19.2	70.2	0.35	0.061	50.5	37.5	4.3999999999999995	1.0999999999999999	0.6	0.6	0.8	2.1	0.02	0.4	1.0999999999999999	0.5	0.4	0	24	62	0.017	85	1.39	36	0	55	6.5	425	1.092020967	0.347478261	3.912023005	SHCC	89	4.7	4.19	0.41	0	0	0	0	0	10	65	25	0	0	0	0	0	5	4	50
Mt. Laurel	0.0118	7.5	35.25	57.25	0.95	0.014	52.73	32.25	5.7700000000000005	2.04	0.64	0.42	1.21	1.82	0	1.4500000000000002	0.4	0	0	0	25	51	0.016	51	0.95	65.5	0	2.6	7.5	381	1.420849421	1.221798436	10.30895266	HFCC	79	5.2	5.8	1	3.1	17.1	24.4	17.7	3.2	0	0	0	0	0	0	0	0	27.7	3.8	30000
Olive Down	0.015	9.9	19.8	64	0.46	0.061	56.2	27.400000000000002	5.25	3.64	1.22	0.36	1.5	1.55	0	0	1.09	0.12	0.06	0.02	30	62	0.0181	84	1.39	53	0	42	7	430	1.735283049	0.201232777	3.912023005	\N	88.9	4.64	4.18	0.47	0	0	0	0	0	10	50	40	0	0	0	0	0	2	3	50
Scratch Coal	0.01	11.22	23.25	64.53	0.3	0.004	52.400000000000006	32.300000000000004	5.3	2.1	0.8999999999999999	0.42	1.4000000000000001	1	0.06	1.5	1.6	0	0	0	27	55	0.02	79	1.15	58	0	24	8	433	1.734386778	0	2.302585093	WC	87	5	3.8	0.6	13	35	17	22	2	8	3	0	0	0	0	0	0	19	2	10
Goonyella	0.012	9	23.7	67.3	0.53	0.025	56.10000000000001	32.6	4.8	1.3	0.8	0.5	0.8	1.7999999999999998	0.1	0.3	0.6	0.1	0	0	24	67	0.02	90	1.2	61	1	29	9	410	0.979739166	0.194739282	6.907755279	HCC	88.4	5	4.1	0.6	0	0	0	7	43	41	8	0	0	0	0	0	0	7	0	1000
Illawara (PHCC)	0.01	9.6	24.2	66.2	0.39	0.045	63.4	26.1	3.9	2.1	0.5	0.3	0.8999999999999999	1.4000000000000001	0.1	0.4	1.0999999999999999	0.1	0	0	20	73	0.019	85	1.18	60	0	33	7.5	400	1.072824961	0.177245509	7.60090246	HCC	88.8	5	3.8	0.5	0	0	0	10	25	55	5	0	0	0	0	0	0	3	3	2000
Teck Venture	0.007	9.5	23	66.4	0.4	0.06	55.00000000000001	29.099999999999998	3.3000000000000003	3.9	0.8	0.4	0.6	1.7999999999999998	0	1.6	1.2	0	0	0	30	60	0.0134	84	1.17	49.8	0	17.1	6	405	1.153182403	1.088601988	4.605170186	SHCC	79.9	4.3	4.6	0.4	0	2	6	12	38	34	8	0	0	0	0	0	0	35.2	4.9	100
Caval Ridge	0.013	10.6	22.5	66.9	0.61	0.035	64.2	23.799999999999997	3.9	1.6	0.6	0.5	1.0999999999999999	1.0999999999999999	0	0.3	0.8	0.1	0	0	20	71	0.02	87	1.29	70	0	21	8.5	415	1.181999204	0.215514053	6.907755279	HCC	88.4	5	3.9	0.7	0	0	0	0	5	35	35	20	5	0	0	0	0	6	0	1000
PDN	0.014	10.1	22.8	67	0.53	0.044	61.8	26.200000000000003	3.9	2.1	0.7000000000000001	0.3	0.8999999999999999	1.2	0.1	0.1	0.8999999999999999	0.1	0	0	27	68	0.019	85	1.26	63	0	25	8.5	420	1.238967002	0.214474992	6.684611728	HCC	88.5	4.9	4.1	0.6	0	0	0	0	17	54	29	0	0	0	0	0	0	7	0	800
Poitrel 	0.015	8.5	24.8	66.7	0.41	0.061	55.60000000000001	27.6	8	2.1999999999999997	1.4000000000000001	0.2	1.4000000000000001	0	0	0	0	0	0	0	40	48	0.016	85	1.11	48	2	40	7.5	420	2.423130584	0.173267327	5.521460918	SHCC	87.8	4.8	5.3	0.4	0	0	0	40	56	4	0	0	0	0	0	0	0	7	0	250
Blue creek	0.01	10.2	26.5	63.3	0.85	0.025	51.89	30.013	6.75	2.19	1.08	0.7100000000000001	2.5	1.54	0	0	0	0	0	0	21	66	0.02	76	4.03	75.5	0	3.9	8.5	397	2.285125589	0.309617918	8.996899596	HFCC	78.83	4.7	3.68	0.85	0	0	3	20.4	50.4	1.5	0	0	0	0	0	0	0	3.4	6	8078
Uvalnaya	0.011	0.084	0.34	0.5212	0.0046	0.00059	55.98	28.610000000000003	4.2	2.08	1.2	0.9299999999999999	2.3	1.2	0.03	0.5499999999999999	0	0	0	0	26.6	49.9	0.0216	0	0	0	0	0	0	0	0	0	0	SHCC	0	0	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
Collinsville	0.015	0.1	0.24	0.645	0.007	0.0005	61.1	28.199999999999996	2.6	0.74	0.2	0.11	0.8099999999999999	4.08	0.02	0.12	1.15	0	0	0	23	64	0.021	0	0	0	0	0	0	0	0	0	0	NONE	0	0	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
Indian Coal Dhanbaad	0.0134	0.1832	0.2538	0.563	0.0049	0.0004	55.60000000000001	27.800000000000004	6	3.2	1.31	0.31	0.5700000000000001	1.3	0.75	0.06999999999999999	1.18	0.11	1.32	0.006999999999999999	28.3	62.7	0.02	0	0	0	0	0	0	0	0	0	0	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
Leer	0.006	7.3	0.3072	0.5929	0.0097	0.00025	47.589999999999996	32.34	9.31	3.09	0.5499999999999999	0.24	1.3299999999999998	1.5	0.04	1.73	0.4	0	0	0	17.4	68.7	0.0152	0	0	0	0	0	0	0	0	0	0	HFCC	0	0	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
Aus. SHCC	0.014	11.7	25.1	63.1	0.63	0.035	56.10000000000001	28.599999999999998	7.3	1.5	1.2	0.7000000000000001	1.0999999999999999	1.4000000000000001	0.1	0.3	0.7000000000000001	0.1	0	0	25	55	0.019	90	1.12	61	1	22	8	415	2.140833539	0.159163238	7.090076836	SHCC	87.3	5.2	4.8	0.7	0	3	12	25	30	20	10	0	0	0	0	0	0	6	0	1200
\.


--
-- TOC entry 5147 (class 0 OID 41587)
-- Dependencies: 239
-- Data for Name: coal_second_data; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coal_second_data (coal_name, "VM", "FC", "S", "P", "HGI", "Rank", "Vitrnite", "Liptinite", "Semi_Fusinite", "CSN_FSI", "Initial_Softening_Temp", "CRI", "CSR", "BI", "MBI", "CBI", "Log_Max_Fluidity", coal_category, "C", "H", "O", ss, "V7", "V8", "V9", "V10", "V11", "V12", "V13", "V14", "V15", "V16", "V17", "V18", "V19", "Inertinite", "Minerals", "MaxFluidity") FROM stdin;
Aus. SHCC	25.1	63.1	0.63	0.035	90	1.12	61	1	22	8	415	25	53	0.137049942	2.140833539	0.159163238	7.090076836	SHCC	87.3	5.2	4.8	0.7	0	3	12	25	30	20	10	0	0	0	0	0	0	6	0	1200
Blue creek	26.5	63.3	0.85	0.025	76	4.03	75.5	0	3.9	8.5	397	19.4	68.1	0.164663462	2.285125589	0.309617918	8.996899596	HFCC	78.83	4.7	3.68	0.85	0	0	3	20.4	50.4	1.5	0	0	0	0	0	0	0	3.4	6	8078
Caval Ridge	22.5	66.9	0.61	0.035	87	1.29	70	0	21	8.5	415	20	71	0.086419753	1.181999204	0.215514053	6.907755279	HCC	88.4	5	3.9	0.7	0	0	0	0	5	35	35	20	5	0	0	0	0	6	0	1000
Daunia (SHCC)	22.4	69.5	0.46	0.041	85	1.27	52	0	36	8	425	35	57	0.214559387	2.239601849	0.249158249	5.298317367	SHCC	88.7	4.8	4.3	0.5	0	0	0	0	10	60	30	0	0	0	0	0	0	8	0	200
Eagle crrek	24	66.75	0.9	0.025	80	1.26	74	1.5	24.5	9	405	22	68	0.120473618	1.331550511	0	7.824046011	SHCC	88.1	4.7	4.4	0.8	0	0	0	3	15	58	22	2	0	0	0	0	0	0	0	2500
Elga	32	64	0.3	0.025	80	1.05	97	0	6.1	8	385	23.4	57.6	0.350359712	5.152348709	0.116275804	10.30895266	HFCC	79	5	4	0.87	0	30	43	27	0	0	0	0	0	0	0	0	0	0	4.6	30000
Goonyella	23.7	67.3	0.53	0.025	90	1.2	61	1	29	9	410	22	67	0.083060109	0.979739166	0.194739282	6.907755279	HCC	88.4	5	4.1	0.6	0	0	0	7	43	41	8	0	0	0	0	0	0	7	0	1000
Illawara (PHCC)	24.2	66.2	0.39	0.045	85	1.18	60	0	33	7.5	400	20	73	0.084708471	1.072824961	0.177245509	7.60090246	HCC	88.8	5	3.8	0.5	0	0	0	10	25	55	5	0	0	0	0	0	0	3	3	2000
Lake Vermont	22	67	0.5	0.08	80	1.19	51	0	35	7	420	25	62	0.155854996	1.598512784	0.224761354	4.605170186	SHCC	89	4.8	4	0.4	0	0	0	0	5	55	40	0	0	0	0	0	0	7	0	100
Leer 	32.13	60.37	1.05	0.025	76	4.12	64	0	3.9	8	368	17.4	69	1.207643312	12.98923851	0.393181429	10.30895266	HFCC	80.66	5.08	4.38	1.05	0	0.6	13.4	32	15.4	2.6	0	0	0	0	0	0	0	6	4.2	30000
Metropolitan	19.2	70.2	0.35	0.061	85	1.39	36	0	55	6.5	425	24	62	0.083240844	1.092020967	0.347478261	3.912023005	SHCC	89	4.7	4.19	0.41	0	0	0	0	0	10	65	25	0	0	0	0	0	5	4	50
Moranbah North	21.8	68.2	0.53	0.04	80	1.3	64	0	26	9	420	22	70	0.095423672	1.208049047	0.332893474	6.476972363	HCC	88.7	4.98	3.75	0.6	0	0	0	0	4	44	48	4	0	0	0	0	0	6	4	650
Mt. Laurel	35.25	57.25	0.95	0.014	51	0.95	65.5	0	2.6	7.5	381	27.1	55.8	0.122666667	1.420849421	1.221798436	10.30895266	HFCC	79	5.2	5.8	1	3.1	17.1	24.4	17.7	3.2	0	0	0	0	0	0	0	0	27.7	3.8	30000
Olive Down	19.8	64	0.46	0.061	84	1.39	53	0	42	7	430	30	62	0.140575455	1.735283049	0.201232777	3.912023005	SHCC	88.9	4.64	4.18	0.47	0	0	0	0	0	10	50	40	0	0	0	0	0	2	3	50
PDN	22.8	67	0.53	0.044	85	1.26	63	0	25	8.5	420	26	68	0.09470124	1.238967002	0.214474992	6.684611728	HCC	88.5	4.9	4.1	0.6	0	0	0	0	17	54	29	0	0	0	0	0	0	7	0	800
Poitrel 	24.8	66.7	0.41	0.061	85	1.11	48	2	40	7.5	420	41	45	0.214375788	2.423130584	0.173267327	5.521460918	SHCC	87.8	4.8	5.3	0.4	0	0	0	40	56	4	0	0	0	0	0	0	0	7	0	250
Riverside	22.3	67.5	0.56	0.015	85	1.25	59	1	31	8.5	415	23	70	0.06344086	0.832814381	0.239378909	6.214608098	HCC	88.5	5	3.9	0.6	0	0	0	0	24	52	24	0	0	0	0	0	0	8	0	500
Scratch Coal	23.25	64.53	0.3	0.004	79	1.15	58	0	24	8	433	27	55	0.118640094	1.734386778	0	2.302585093	WC	87	5	3.8	0.6	13	35	17	22	2	8	3	0	0	0	0	0	0	19	2	10
Teck Venture	23	66.4	0.4	0.06	84	1.17	49.8	0	17.1	6	405	25	64	0.093468468	1.153182403	1.088601988	4.605170186	SHCC	79.9	4.3	4.6	0.4	0	2	6	12	38	34	8	0	0	0	0	0	0	35.2	4.9	100
Leer/Russian HFCC	32.13	60.37	1.05	0.025	76	0.99	91	0	1.4	7.5	375	26	58	0.139285714	1.498137195	0.34692479	9.305650552	HFCC	79.5	5.82	5.36	0.7	0	0.6	13.4	32	15.4	2.6	0	0	0	0	0	0	0	9	0	11000
R.PCI	18.4	73.2	0.5	0.04	74	1.48	52	0	41	1	410	35	57	0.113785815	1.171324566	0	0	PCI	88.19	3.99	4.94	0.53	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1
\.


--
-- TOC entry 5148 (class 0 OID 41594)
-- Dependencies: 240
-- Data for Name: coalblendcomposition; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coalblendcomposition (riverside, "Moranbah North", "Illawara(PHCC)", goonyella, "Caval Ridge", pdn, poitrel, amonate, "Aus._SHCC", "Teck Venture", "Lake Vermont", metropolitan, collinsvill, "Olive Down", indonasian, "Low Ash SHCC/SHCC BHP", "Eagle crrek", "Dhamra SHCC PDN", "Daunia(SHCC)", leer, "Shoal Creek", elga, "Leer/Russian HFCC", uvalnaya, "Blue creek", "Mt. Laurel", "R.PCI", "E.Soft", "Indian Coal Dhanbaad", "Scratch Coal", "HCC/ SHCC Contaminated Coal", "%Ash", "%VM", "%FC", csn, cri, csr, ash, vm) FROM stdin;
\.


--
-- TOC entry 5149 (class 0 OID 41597)
-- Dependencies: 241
-- Data for Name: coalblendcomposition2; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coalblendcomposition2 ("Riverside", "Moranbah_North", "Illawara", "Goonyella", "Caval_Ridge", "PDN", "Poitrel PCI", amonate, aus_shcc, teck_venture, lake_vermont, "Metropolitan Coking CoalI", collinsvill, olive_down, indonasian, low_ash_shcc_shcc_bhp, "Eagle Creek", dhamra_shcc_pdn, "Daunia", "Leer", shoal_creek, elga, leer_russian_hfcc, uvalnaya, blue_creek, mt_laurel, "Russian PCI", e_soft, indian_coal_dhanbaad, scratch_coal, hcc_shcc_contaminated_coal) FROM stdin;
\N	\N	\N	33	\N	\N	\N	\N	\N	\N	\N	19	\N	\N	\N	\N	\N	\N	7	17	\N	\N	\N	\N	\N	\N	17	\N	7	\N	\N
\N	\N	\N	33	\N	\N	\N	\N	\N	\N	\N	19	\N	\N	\N	\N	\N	\N	7	17	\N	\N	\N	\N	\N	\N	17	\N	7	\N	\N
\N	\N	\N	33	\N	\N	\N	\N	\N	\N	\N	19	\N	\N	\N	\N	\N	\N	7	17	\N	\N	\N	\N	\N	\N	17	\N	7	\N	\N
\N	\N	\N	28	\N	\N	\N	\N	\N	\N	\N	18	\N	13	\N	\N	\N	\N	\N	17	\N	\N	\N	\N	\N	\N	17	\N	7	\N	\N
\N	\N	\N	28	\N	\N	\N	\N	\N	\N	\N	18	\N	13	\N	\N	\N	\N	\N	17	\N	\N	\N	\N	\N	\N	17	\N	7	\N	\N
\N	\N	\N	28	\N	\N	\N	\N	\N	\N	\N	8	\N	20	\N	\N	\N	\N	\N	20	\N	\N	\N	\N	\N	\N	17	\N	7	\N	\N
\N	\N	\N	28	\N	\N	\N	\N	\N	\N	\N	8	\N	20	\N	\N	\N	\N	\N	20	\N	\N	\N	\N	\N	\N	17	\N	7	\N	\N
\N	\N	\N	28	\N	\N	\N	\N	\N	\N	\N	8	\N	20	\N	\N	\N	\N	\N	20	\N	\N	\N	\N	\N	\N	17	\N	7	\N	\N
\N	\N	\N	28	\N	\N	\N	\N	\N	\N	\N	\N	\N	27	\N	\N	\N	\N	\N	20	\N	\N	\N	\N	\N	\N	17	\N	8	\N	\N
\N	\N	\N	28	\N	\N	\N	\N	\N	\N	\N	\N	\N	26	\N	\N	\N	\N	\N	19	\N	\N	\N	\N	\N	\N	19	\N	8	\N	\N
\N	\N	\N	33	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	\N	\N	\N	\N	\N	18	\N	\N	\N	\N	\N	\N	21	\N	8	\N	\N
\N	\N	\N	33	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	\N	\N	\N	\N	\N	18	\N	\N	\N	\N	\N	\N	21	\N	8	\N	\N
\N	\N	\N	33	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	\N	\N	\N	\N	\N	18	\N	\N	\N	\N	\N	\N	21	\N	8	\N	\N
\N	\N	\N	33	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	\N	\N	\N	\N	\N	16	\N	\N	\N	\N	\N	\N	23	\N	8	\N	\N
\N	\N	\N	33	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	\N	\N	\N	\N	\N	16	\N	\N	\N	\N	\N	\N	23	\N	8	\N	\N
\N	\N	\N	33	\N	\N	\N	\N	\N	\N	\N	10	10	\N	\N	\N	\N	\N	\N	16	\N	\N	\N	\N	\N	\N	23	\N	8	\N	\N
\N	\N	\N	33	\N	\N	\N	\N	\N	\N	\N	10	10	\N	\N	\N	\N	\N	\N	16	\N	\N	\N	\N	\N	\N	23	\N	8	\N	\N
\N	\N	\N	36	\N	\N	\N	\N	\N	\N	\N	10	7	\N	\N	\N	\N	\N	\N	18	\N	\N	\N	\N	\N	\N	21	\N	8	\N	\N
\N	\N	\N	36	\N	\N	\N	\N	\N	\N	\N	10	7	\N	\N	\N	\N	\N	\N	18	\N	\N	\N	\N	\N	\N	21	\N	8	\N	\N
\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	10	7	\N	\N	\N	\N	\N	\N	18	\N	\N	\N	\N	\N	\N	22	\N	8	\N	\N
\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	10	7	\N	\N	\N	\N	\N	\N	18	\N	\N	\N	\N	\N	\N	22	\N	8	\N	\N
\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	10	6	\N	\N	\N	\N	\N	\N	19	\N	\N	\N	\N	\N	\N	22	\N	8	\N	\N
\N	\N	\N	40	\N	\N	\N	\N	\N	\N	\N	5	10	\N	\N	\N	\N	\N	\N	19	\N	\N	\N	\N	\N	\N	18	\N	8	\N	\N
\N	\N	\N	40	\N	\N	\N	\N	\N	\N	\N	5	10	\N	\N	\N	\N	\N	\N	19	\N	\N	\N	\N	\N	\N	18	\N	8	\N	\N
\N	\N	\N	40	\N	\N	\N	\N	\N	\N	\N	5	10	\N	\N	\N	\N	\N	\N	19	\N	\N	\N	\N	\N	\N	18	\N	8	\N	\N
\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	19	8	\N	\N	\N	\N	\N	\N	20	\N	\N	\N	\N	\N	\N	18	\N	\N	\N	\N
\N	\N	\N	25	\N	\N	\N	\N	\N	\N	\N	24	12	\N	\N	\N	\N	\N	\N	22	\N	\N	\N	\N	\N	\N	12	\N	5	\N	\N
\N	\N	\N	30	\N	\N	\N	\N	\N	\N	\N	17	10	\N	\N	\N	\N	\N	\N	22	\N	\N	\N	\N	\N	\N	16	\N	5	\N	\N
\N	\N	\N	30	\N	\N	\N	\N	\N	\N	\N	17	12	\N	\N	\N	\N	\N	\N	18	\N	\N	\N	\N	\N	\N	18	\N	5	\N	\N
\N	\N	\N	30	\N	\N	\N	\N	\N	\N	\N	15	12	\N	\N	\N	\N	\N	\N	17	\N	\N	\N	\N	\N	\N	18	\N	8	\N	\N
\N	\N	\N	30	\N	\N	\N	\N	\N	\N	\N	15	12	\N	\N	\N	\N	\N	\N	17	\N	\N	\N	\N	\N	\N	18	\N	8	\N	\N
\N	\N	\N	30	\N	\N	\N	\N	\N	\N	\N	15	12	\N	\N	\N	\N	\N	\N	17	\N	\N	\N	\N	\N	\N	18	\N	8	\N	\N
\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	20	10	\N	\N	\N	\N	\N	\N	17	\N	\N	\N	\N	\N	\N	18	\N	\N	\N	\N
\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	20	10	\N	\N	\N	\N	\N	\N	17	\N	\N	\N	\N	\N	\N	18	\N	\N	\N	\N
\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	20	10	\N	\N	\N	\N	\N	\N	17	\N	\N	\N	\N	\N	\N	18	\N	\N	\N	\N
\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	20	10	\N	\N	\N	\N	\N	\N	17	\N	\N	\N	\N	\N	\N	18	\N	\N	\N	\N
\N	\N	\N	40	\N	\N	\N	\N	\N	\N	\N	20	10	\N	\N	\N	\N	\N	\N	\N	10	\N	\N	\N	\N	\N	20	\N	\N	\N	\N
\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	20	\N	10	\N	\N	\N	\N	\N	8	7	\N	\N	\N	\N	\N	20	\N	\N	\N	\N
\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	20	\N	5	\N	\N	\N	\N	\N	8	7	\N	\N	\N	\N	\N	20	\N	5	\N	\N
\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	19	\N	5	\N	\N	\N	\N	\N	8	7	\N	\N	\N	\N	\N	18	\N	8	\N	\N
\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	19	\N	5	\N	\N	\N	\N	\N	15	\N	\N	\N	\N	\N	\N	16	\N	10	\N	\N
\N	\N	\N	31	\N	\N	\N	\N	\N	\N	\N	17	\N	5	\N	\N	\N	\N	\N	17	\N	\N	\N	\N	\N	\N	18	\N	12	\N	\N
\N	\N	\N	31	\N	\N	\N	\N	\N	\N	\N	17	\N	5	\N	\N	\N	\N	\N	17	\N	\N	\N	\N	\N	\N	18	\N	12	\N	\N
\N	\N	\N	31	\N	\N	\N	\N	\N	\N	\N	17	\N	5	\N	\N	\N	\N	\N	17	\N	\N	\N	\N	\N	\N	18	\N	12	\N	\N
\N	\N	\N	31	\N	\N	\N	\N	\N	\N	\N	17	\N	5	\N	\N	\N	\N	\N	17	\N	\N	\N	\N	\N	\N	18	\N	12	\N	\N
\N	\N	\N	31	\N	\N	\N	\N	\N	\N	\N	17	\N	5	\N	\N	\N	\N	\N	17	\N	\N	\N	\N	\N	\N	18	\N	12	\N	\N
\N	\N	\N	31	\N	\N	\N	\N	\N	\N	\N	17	\N	5	\N	\N	\N	\N	\N	17	\N	\N	\N	\N	\N	\N	18	\N	12	\N	\N
\N	\N	\N	31	\N	\N	\N	\N	\N	\N	\N	17	\N	5	\N	\N	\N	\N	\N	17	\N	\N	\N	\N	\N	\N	18	\N	12	\N	\N
\N	\N	\N	31	\N	\N	\N	\N	\N	\N	\N	17	\N	5	\N	\N	\N	\N	\N	17	\N	\N	\N	\N	\N	\N	18	\N	12	\N	\N
\N	\N	\N	33	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	\N	\N	\N	\N	\N	5	12	\N	\N	\N	\N	\N	18	\N	12	\N	\N
\N	\N	\N	33	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	\N	\N	\N	\N	\N	5	12	\N	\N	\N	\N	\N	18	\N	12	\N	\N
\N	\N	\N	33	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	\N	\N	\N	\N	\N	5	12	\N	\N	\N	\N	\N	18	\N	12	\N	\N
\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	\N	\N	\N	\N	\N	\N	17	\N	\N	\N	\N	\N	16	\N	12	\N	\N
\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	\N	\N	\N	\N	\N	\N	17	\N	\N	\N	\N	\N	16	\N	12	\N	\N
\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	\N	\N	\N	\N	\N	\N	17	\N	\N	\N	\N	\N	16	\N	12	\N	\N
\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	\N	\N	\N	\N	\N	\N	17	\N	\N	\N	\N	\N	16	\N	12	\N	\N
\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	20	\N	\N	\N	\N	\N	\N	\N	\N	17	\N	\N	\N	\N	\N	16	\N	12	\N	\N
\N	\N	\N	33	\N	\N	\N	\N	\N	\N	\N	21	\N	\N	\N	\N	\N	\N	\N	\N	17	\N	\N	\N	\N	\N	17	\N	12	\N	\N
\.


--
-- TOC entry 5150 (class 0 OID 41600)
-- Dependencies: 242
-- Data for Name: mobj_constraints; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mobj_constraints (id, parameters, display_name, type, min_value, max_value, range_max, lastupdated_date, lastupdated_by, active, node_id) FROM stdin;
\.


--
-- TOC entry 5152 (class 0 OID 41605)
-- Dependencies: 244
-- Data for Name: mobj_constraints_temp; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mobj_constraints_temp (id, user_id, node_id, type, parameters, display_name, min_value, max_value, last_updated_date, last_updated_by, active, creation_date, created_by, tenant_id) FROM stdin;
\.


--
-- TOC entry 5153 (class 0 OID 41608)
-- Dependencies: 245
-- Data for Name: parameter_ranges; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.parameter_ranges (parameter, min, max) FROM stdin;
\.


--
-- TOC entry 5154 (class 0 OID 41613)
-- Dependencies: 246
-- Data for Name: parking_table; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.parking_table (parking_name, total_vehicle) FROM stdin;
Main_Parking	168
ECE_Department	30
EE_Department	20
Civil_Department	30
Mechanical_Department	70
MBA_Department	24
Academics Building	28
\.


--
-- TOC entry 5155 (class 0 OID 41616)
-- Dependencies: 247
-- Data for Name: prediction_output; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.prediction_output (id, user_id, coal_data, inherentmoisture_airdried_prox, volatilematter_airdried_prox, ash_airdried_prox, fixedcarbon_airdried_prox, phosincoal_airdried_prox, sulphur_airdried_prox, csn, max_fluidity_log_c, vitrinitereflectanceromax_imputed, vm, ash, fc, p, s, cri, csr, m10, m20, m40, yield, dmt_cost, netcost, impact_m10, impact_m10_current, netcost_m10, cost_of_cokethm, impact_of_ash, inc_currentblend_ash, ash_thm, productivity, impact_of_cri, inc_currentblend_cri, viu_cri, final_cost_thm, alert, created_at) FROM stdin;
\.


--
-- TOC entry 5157 (class 0 OID 41623)
-- Dependencies: 249
-- Data for Name: prediction_selection; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.prediction_selection (id, user_id, coal_selection, total_percentage, created_at) FROM stdin;
\.


--
-- TOC entry 5159 (class 0 OID 41630)
-- Dependencies: 251
-- Data for Name: simulationCoalRecommendations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."simulationCoalRecommendations" (id, simulation_id, coal_percentages, predicted_ash, predicted_vm, predicted_fc, predicted_csn, predicted_cri, predicted_csr, predicted_ash_final, predicted_vm_final, total_cost, created_at, updated_at, "CO2_Emissions", "CO_Emissions", "SO2_Emissions", "NO_Emissions", "NO2_Emissions", "PM_index", "PM10_Emissions", "PM25_Emissions", "VOC_index", "VOC_Emissions", "PAH_Emissions") FROM stdin;
1	72	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 5, "Teck Venture": 5, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 90, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 0.0, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	9.946542235035222	23.400481004334324	68.0280089357203	6.291369528646353	23.99896080808082	66.80923435064933	13.300496385281384	0.7103565151515157	0	2025-06-12 15:25:06.23619+05:30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2	72	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 5, "Teck Venture": 0.0, "Leer": 0.0, "Daunia (SHCC)": 90, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 0.0, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0, "Aus. SHCC": 5}	8.938830940122957	23.138069186018058	68.3437668855639	6.977210978816228	24.985903875291378	65.05339642857143	12.467852500000006	0.7669157142857143	0	2025-06-12 15:25:06.23619+05:30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3	72	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 5, "Teck Venture": 80, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 15, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	10.346519946468426	23.583969800863645	67.05697221877357	5.7275079364802135	24.122494380341884	66.27259896825397	13.665706428571427	0.7283299603174603	0	2025-06-12 15:25:06.23619+05:30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4	72	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 10, "Teck Venture": 0.0, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 80, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 10, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	9.552705291015304	23.706854947317783	67.54744382283495	6.462468919944074	24.228450595238098	66.74529936507939	13.190146904761896	0.7349009523809522	0	2025-06-12 15:25:06.23619+05:30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5	72	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 90, "Teck Venture": 0.0, "Leer": 0.0, "Daunia (SHCC)": 5, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 0.0, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0, "Aus. SHCC": 5}	9.969920952469286	24.355836864482384	64.81990173243486	5.708583028043973	21.94989434343435	69.40942530663779	13.31639818903319	0.7620728571428574	1000	2025-06-12 15:25:06.23619+05:30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6	73	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 5, "Teck Venture": 0.0, "Leer": 0.0, "Daunia (SHCC)": 5, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 90, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 0.0, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	10.318847976003422	23.769361727925876	66.31109780398322	6.039752585373531	24.551264393939398	62.16768349206349	13.642372976190481	0.7342454761904764	0	2025-06-12 15:35:50.715183+05:30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7	73	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 20, "Teck Venture": 50, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 30, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	10.276683247039571	23.571480991115713	66.67289536817044	5.97437825599454	23.2719932936508	68.24823611111114	13.631743950216451	0.7710582539682543	0	2025-06-12 15:35:50.715183+05:30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8	73	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 30, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 10, "Teck Venture": 0.0, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 60, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 0.0, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	9.765781676112487	23.51160653586076	67.87018403930759	6.299234788375742	23.917544249639263	66.87737720779221	12.66188334693085	0.7446257142857144	0	2025-06-12 15:35:50.715183+05:30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9	73	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 30, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 20, "Teck Venture": 0.0, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 50, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 0.0, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	9.761820803055691	23.488950940723853	67.81024365135303	6.2103440957139995	23.28413700577201	68.82018288961036	12.668619378066385	0.7533792857142859	0	2025-06-12 15:35:50.715183+05:30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10	73	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 10, "Teck Venture": 70, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 20, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	10.305479986222345	23.533186110294842	67.05147221891735	5.746285714272212	24.119725491452996	66.28313031746033	13.64057880952381	0.7450735714285713	0	2025-06-12 15:35:50.715183+05:30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11	73	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 65, "Riverside": 15, "Poitrel": 0.0, "Illawara (PHCC)": 20, "Teck Venture": 0.0, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 0.0, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	10.109879470826689	23.743013629093454	65.15983138702667	7.032201851866762	23.789384722222216	67.0554030952381	13.303761024531024	0.8142755627705625	0	2025-06-12 15:35:50.715183+05:30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12	73	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 5, "Poitrel": 0.0, "Illawara (PHCC)": 5, "Teck Venture": 0.0, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 90, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 0.0, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	10.335205198186756	23.764711727959206	66.30571632259016	6.021641474271087	24.624606060606066	62.2791349206349	13.584464047619049	0.7338343650793652	0	2025-06-12 15:35:50.715183+05:30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13	73	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 15, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 15, "Teck Venture": 0.0, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 70, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 0.0, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	9.574722668196348	23.38618083484917	68.00283152599587	6.286855639743519	23.832548383838393	66.822480508658	12.694396539571542	0.7341458333333334	0	2025-06-12 15:35:50.715183+05:30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14	73	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 5, "Teck Venture": 0.0, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 10, "Indonasian": 0.0, "Uvalnaya": 85, "Caval Ridge": 0.0, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	10.299361588095827	24.176781513529917	65.02273361823535	6.119738400460115	24.998767222222234	63.586542936507925	13.342617380952381	0.7496066666666666	0	2025-06-12 15:35:50.715183+05:30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15	73	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 70, "Teck Venture": 20, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 10, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	10.23987955013381	23.90787439565559	64.94321477480187	5.723055250286474	21.94062648629149	69.6479932142857	13.660678831168832	0.7637316666666671	1000	2025-06-12 15:35:50.715183+05:30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16	74	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 0.0, "Teck Venture": 0.0, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 5, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0, "Aus. SHCC": 46, "Collinsville": 48}	10.52601616389819	22.68208868589072	66.13125601820724	6.9315285002463884	25.57504426129426	64.94832650793653	13.951747857142848	0.8372091269841271	0	2025-06-12 16:26:13.734257+05:30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17	74	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 0.0, "Teck Venture": 0.0, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 22, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0, "Aus. SHCC": 23, "Collinsville": 54}	10.471485476254331	22.793814808764235	65.46297732731236	6.869979232805535	24.816275378787886	65.99172761904764	13.888035833333326	0.8411582539682544	0	2025-06-12 16:26:13.734257+05:30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18	74	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 39, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 0.0, "Teck Venture": 0.0, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 17, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0, "Aus. SHCC": 43}	10.617194298978264	23.25024211237695	66.23256449284521	7.190178042338324	24.13646126984127	66.6121413095238	13.921427063492061	0.8583976587301587	0	2025-06-12 16:26:13.734257+05:30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19	74	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 0.0, "Teck Venture": 0.0, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 13, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 9, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0, "Collinsville": 77}	10.826059311553758	22.787993676904758	65.2817199066637	6.843426455029617	25.066170793650787	65.44979825396827	13.970261666666664	0.8301692857142859	0	2025-06-12 16:26:13.734257+05:30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20	74	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 15, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 0.0, "Teck Venture": 0.0, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 5, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0, "Aus. SHCC": 79}	9.540585694991524	23.13450385441527	66.26048720922675	6.750942433933339	23.97949291930293	65.65241452380957	13.830641666666668	0.8111439069264067	0	2025-06-12 16:26:13.734257+05:30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21	74	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 40, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 0.0, "Teck Venture": 0.0, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 19, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0, "Aus. SHCC": 40}	10.602901521141593	23.243232853040283	66.30028069546115	7.30542539682837	23.77492178571428	66.74936464285713	13.885347063492063	0.8620443253968255	0	2025-06-12 16:26:13.734257+05:30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22	74	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 0.0, "Teck Venture": 0.0, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 18, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0, "Aus. SHCC": 29, "Collinsville": 52}	10.512062354347186	22.803389808780906	65.38289450999487	6.866050661400297	24.60174275974027	65.9783942857143	13.890635833333326	0.8300948412698416	0	2025-06-12 16:26:13.734257+05:30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23	74	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 0.0, "Teck Venture": 0.0, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 5, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 20, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0, "Collinsville": 75}	11.007394112847686	22.783087283508326	65.37641132201999	6.838554232793118	25.091516309523808	65.84483587301587	13.797320769230764	0.8222390476190481	0	2025-06-12 16:26:13.734257+05:30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
24	74	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 0.0, "Teck Venture": 0.0, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 29, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0, "Aus. SHCC": 52, "Collinsville": 18}	10.648786944638614	22.610213359369276	66.39930506595938	7.3154335978876475	24.882783308913304	65.57111619047622	13.926577063492058	0.880914682539683	990	2025-06-12 16:26:13.734257+05:30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
25	75	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 0.0, "Teck Venture": 0.0, "Leer": 61, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 5, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0, "Aus. SHCC": 33}	9.440342547427115	23.69661735360905	65.78436975463552	5.900817460213618	25.250498290043293	62.03261920634922	13.971663982683982	0.7655424999999997	0	2025-06-12 16:48:22.319029+05:30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
26	75	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 0.0, "Teck Venture": 0.0, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 5, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0, "Poitrel ": 35, "Aus. SHCC": 60}	9.454196075705713	23.51961985482967	66.13423408722203	6.945531469766468	25.44429366883117	63.89715333333334	13.73698785714286	0.80040373015873	0	2025-06-12 16:48:22.319029+05:30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
27	75	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 0.0, "Teck Venture": 0.0, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 6, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 64, "Aus. SHCC": 29}	9.480847607219637	23.349709139386977	66.11054262108388	6.9733769576901095	24.71410373737374	65.19830867243867	13.535820833333334	0.7915434018759018	0	2025-06-12 16:48:22.319029+05:30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
28	75	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 0.0, "Teck Venture": 0.0, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 6, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 50, "Aus. SHCC": 43}	9.497942361888398	23.28567266662531	66.11336355405743	6.855727460363353	24.52564875901876	65.03273047619051	13.47767142857143	0.7965533910533911	0	2025-06-12 16:48:22.319029+05:30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
29	75	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 0.0, "Teck Venture": 0.0, "Leer": 5, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 61, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0, "Aus. SHCC": 33}	10.656956799121946	22.67340555513665	66.68093838566564	7.279232857162142	23.04283914502164	66.95807999999998	13.990748690476188	0.8755400793650794	990	2025-06-12 16:48:22.319029+05:30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
36	77	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 5, "Teck Venture": 0.0, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 85, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 10, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	10.325747499806493	23.755320061304918	66.34329171946872	6.026593855231942	24.531423917748924	62.53769682539683	13.581439047619048	0.7323676984126984	0	2025-06-13 14:44:47.037919+05:30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
31	76	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 3, "Teck Venture": 74, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 22, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	10.736943517331492	23.502779999194004	67.6475323777657	5.748757936479796	24.652512991453	63.22881698412698	13.667099523809522	0.7287226984126982	0	2025-06-13 14:14:59.56667+05:30	2025-08-06 20:54:13.771744+05:30	16.657583455453786	4.543567169025812	0.10413873050530253	0.06377285653104926	0.0977737130620985	0.30890629450549456	0.21623440615384618	0.09267188835164837	0.2507341296703297	0.22566071670329674	0.02507341296703297
32	76	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 7, "Teck Venture": 21, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 71, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 0.0, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	10.326716944172418	23.75874004807254	66.38245052006738	6.029252585386531	24.66558344155845	62.28822587301587	13.663846547619055	0.7262496031746032	0	2025-06-13 14:14:59.56667+05:30	2025-08-06 20:54:13.792063+05:30	14.819680416319732	4.042255803497087	0.05905391453524641	0.07858721484653819	0.12048642969307637	0.29476457875457873	0.2063352051282051	0.08842937362637361	0.2544176747252747	0.22897590725274725	0.025441767472527473
33	76	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 0.0, "Teck Venture": 0.0, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 40, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 40, "Caval Ridge": 20, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	10.067383787410394	24.269956169660944	64.97630611103142	6.162567460278581	25.4447596031746	63.70387011904762	12.757623506493502	0.7550211904761904	0	2025-06-13 14:14:59.56667+05:30	2025-08-06 20:54:13.804399+05:30	15.944738717735218	4.349129725228976	0.08873075483468497	0.09442118486795148	0.14476236973590295	0.3481390573870574	0.24369734017094016	0.10444171721611722	0.28327389010989007	0.25494650109890105	0.02832738901098901
35	76	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 74, "Teck Venture": 3, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 22, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	9.992197518524222	23.518077578708937	64.65458080651663	5.8068892449412495	22.23516446248197	69.04213948412698	13.322764855699857	0.7798933333333334	990	2025-06-13 14:14:59.56667+05:30	2025-08-06 20:54:13.832464+05:30	16.694008051623648	4.55350243963364	0.10271983780411727	0.08080636973590294	0.12388873947180584	0.1899193103785104	0.13294351726495726	0.056975793113553115	0.17272744395604395	0.15545469956043956	0.017272744395604396
37	77	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 25, "Teck Venture": 45, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 30, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	10.338940065933167	23.558103848274765	66.72188944726285	6.029128255990708	23.260959960317464	68.91404154761904	13.738053116883117	0.7726023015873019	0	2025-06-13 14:44:47.037919+05:30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
38	77	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 5, "Teck Venture": 80, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 15, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	10.346519946468426	23.583969800863645	67.05697221877357	5.7275079364802135	24.122494380341884	66.27259896825397	13.665706428571427	0.7283299603174603	0	2025-06-13 14:44:47.037919+05:30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
39	77	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 45, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 5, "Teck Venture": 0.0, "Leer": 50, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 0.0, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	9.356861616683174	24.335414692978176	65.60798528353978	5.855087301519905	24.9480171933622	62.02758111111113	12.768850508658003	0.7725068650793652	0	2025-06-13 14:44:47.037919+05:30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
40	77	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 5, "Teck Venture": 0.0, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 55, "Caval Ridge": 40, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	10.061329779412336	23.95888759238892	65.34865122990868	7.151516474254992	24.530215717893224	65.18481011904764	13.285776608946609	0.7771180663780665	0	2025-06-13 14:44:47.037919+05:30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
41	77	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 5, "Teck Venture": 0.0, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 90, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 5, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	10.332204642677922	23.755578394619207	66.34070283053539	6.018308140941087	24.51101391774892	62.35701349206349	13.584897380952379	0.7323676984126984	0	2025-06-13 14:44:47.037919+05:30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
42	77	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 80, "Teck Venture": 15, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 5, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	9.981282804221722	24.28249202317464	64.82845969539152	5.705485805839391	21.97459791486292	69.68666876984126	13.350546522366525	0.7612800000000004	1000	2025-06-13 14:44:47.037919+05:30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
43	79	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 5, "Teck Venture": 85, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 10, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	10.346067089252333	23.57768646769698	67.15418708634787	5.592813492058796	24.160342991452996	66.36564896825398	13.725173095238095	0.7279899603174601	0	2025-07-02 11:32:52.72872+05:30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
44	79	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 25, "Teck Venture": 45, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 30, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	10.338940065933167	23.558103848274765	66.72188944726285	6.029128255990708	23.260959960317464	68.91404154761904	13.738053116883117	0.7726023015873019	0	2025-07-02 11:32:52.72872+05:30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
45	79	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 5, "Teck Venture": 80, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 15, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	10.346519946468426	23.583969800863645	67.05697221877357	5.7275079364802135	24.122494380341884	66.27259896825397	13.665706428571427	0.7283299603174603	0	2025-07-02 11:32:52.72872+05:30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
46	79	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 15, "Teck Venture": 65, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 20, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	10.271092823628498	23.552211030921985	66.85111431222501	5.751730158716547	23.902605848595854	66.67267583333334	13.620627142857145	0.7439675396825399	0	2025-07-02 11:32:52.72872+05:30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
47	79	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 80, "Teck Venture": 15, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 5, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	9.981282804221722	24.28249202317464	64.82845969539152	5.705485805839391	21.97459791486292	69.68666876984126	13.350546522366525	0.7612800000000004	1000	2025-07-02 11:32:52.72872+05:30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
48	80	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 10, "Teck Venture": 0.0, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 50, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 40, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	9.859750158829847	23.580432976205767	67.41483727921029	6.489403799880631	22.950461706349216	68.35145980158728	13.171412142857134	0.7831538095238101	0	2025-07-02 12:24:30.109301+05:30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
49	80	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 5, "Teck Venture": 0.0, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 5, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 90, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 0.0, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	10.071072024653573	24.20735677808927	66.29423433220633	6.013955993048527	24.92444028944912	62.37964876984125	13.24866428571429	0.7080787606837607	0	2025-07-02 12:24:30.109301+05:30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
50	80	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 10, "Poitrel": 0.0, "Illawara (PHCC)": 35, "Teck Venture": 0.0, "Leer": 55, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 0.0, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	9.327780819044296	24.312375089737458	65.68489055282026	5.857801587211547	25.223501082251087	61.99853666666667	12.795891937229435	0.7675885317460318	0	2025-07-02 12:24:30.109301+05:30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
51	80	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 10, "Teck Venture": 0.0, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 80, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 10, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	9.552705291015304	23.706854947317783	67.54744382283495	6.462468919944074	24.228450595238098	66.74529936507939	13.190146904761896	0.7349009523809522	0	2025-07-02 12:24:30.109301+05:30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
52	80	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 5, "Teck Venture": 0.0, "Leer": 50, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 45, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	9.483735140033282	23.61143809430961	65.56124697676466	5.9317202380336065	24.905033820346322	61.7212056746032	13.89200636363637	0.7742824206349206	0	2025-07-02 12:24:30.109301+05:30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
53	80	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 5, "Teck Venture": 0.0, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 5, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 0.0, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0, "Olive Down": 90}	10.012525542251735	22.956841547660236	67.61344942622273	6.996885341533849	24.970413626373613	63.071472222222205	13.379115650183143	0.7692923809523807	0	2025-07-02 12:24:30.109301+05:30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
54	80	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 90, "Teck Venture": 0.0, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 5, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 5, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 0.0, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	9.90921688372826	24.356544285386672	64.8772122879296	5.735557234352626	21.934027557720068	69.35381615079363	13.174558903318903	0.7708159523809525	1000	2025-07-02 12:24:30.109301+05:30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
55	81	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 5, "Teck Venture": 80, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 15, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	10.346519946468426	23.583969800863645	67.05697221877357	5.7275079364802135	24.122494380341884	66.27259896825397	13.665706428571427	0.7283299603174603	0	2025-07-02 12:36:43.676503+05:30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
56	81	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 5, "Teck Venture": 85, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 10, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	10.346067089252333	23.57768646769698	67.15418708634787	5.592813492058796	24.160342991452996	66.36564896825398	13.725173095238095	0.7279899603174601	0	2025-07-02 12:36:43.676503+05:30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
57	81	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 35, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 0.0, "Teck Venture": 35, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 30, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	10.30965809487854	23.82432378661929	64.89597768481525	5.786258292618746	22.130987698412707	67.94444404761904	13.696748116883118	0.7800193650793654	0	2025-07-02 12:36:43.676503+05:30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
58	81	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 10, "Teck Venture": 70, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 20, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	10.305479986222345	23.533186110294842	67.05147221891735	5.746285714272212	24.119725491452996	66.28313031746033	13.64057880952381	0.7450735714285713	0	2025-07-02 12:36:43.676503+05:30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
59	81	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 25, "Teck Venture": 40, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 35, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	10.349099589761764	23.546620514924765	66.62979536818236	6.031128255990708	22.112812698412707	69.21594726190474	13.723416450216453	0.7723456349206353	0	2025-07-02 12:36:43.676503+05:30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
60	81	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 80, "Teck Venture": 15, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 5, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	9.981282804221722	24.28249202317464	64.82845969539152	5.705485805839391	21.97459791486292	69.68666876984126	13.350546522366525	0.7612800000000004	1000	2025-07-02 12:36:43.676503+05:30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
61	82	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 5, "Teck Venture": 80, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 15, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	10.346519946468426	23.583969800863645	67.05697221877357	5.7275079364802135	24.122494380341884	66.27259896825397	13.665706428571427	0.7283299603174603	0	2025-07-02 12:39:07.640537+05:30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
62	82	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 5, "Teck Venture": 85, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 10, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	10.346067089252333	23.57768646769698	67.15418708634787	5.592813492058796	24.160342991452996	66.36564896825398	13.725173095238095	0.7279899603174601	0	2025-07-02 12:39:07.640537+05:30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
63	82	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 5, "Poitrel": 0.0, "Illawara (PHCC)": 90, "Teck Venture": 0.0, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 5, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 0.0, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	9.976833439181842	24.238934295846217	64.96761109752343	5.848739774069284	23.16425966089467	69.17031781746029	13.309158189033187	0.7896669047619049	0	2025-07-02 12:39:07.640537+05:30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
64	82	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 5, "Teck Venture": 0.0, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 5, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0, "Collinsville": 90}	11.003411851069092	22.795610616939992	65.41023441715834	6.850404232786619	25.028472380952383	65.8999042063492	13.926946666666662	0.8239202380952382	0	2025-07-02 12:39:07.640537+05:30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
65	82	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 5, "Teck Venture": 0.0, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 90, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 5, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	10.332204642677922	23.755578394619207	66.34070283053539	6.018308140941087	24.51101391774892	62.35701349206349	13.584897380952379	0.7323676984126984	0	2025-07-02 12:39:07.640537+05:30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
66	82	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 80, "Teck Venture": 15, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 5, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	9.981282804221722	24.28249202317464	64.82845969539152	5.705485805839391	21.97459791486292	69.68666876984126	13.350546522366525	0.7612800000000004	1000	2025-07-02 12:39:07.640537+05:30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
67	83	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 10, "Teck Venture": 0.0, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 65, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 25, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	10.124648200806377	23.757964905454674	65.99927476434814	6.092991707326565	25.004942936507952	62.39164058080807	13.32145086580086	0.769027489177489	0	2025-07-08 11:22:54.765007+05:30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
68	83	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 5, "Teck Venture": 85, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 10, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	10.346067089252333	23.57768646769698	67.15418708634787	5.592813492058796	24.160342991452996	66.36564896825398	13.725173095238095	0.7279899603174601	0	2025-07-08 11:22:54.765007+05:30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
69	83	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 5, "Teck Venture": 80, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 15, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	10.346519946468426	23.583969800863645	67.05697221877357	5.7275079364802135	24.122494380341884	66.27259896825397	13.665706428571427	0.7283299603174603	0	2025-07-08 11:22:54.765007+05:30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
70	83	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 25, "Teck Venture": 0.0, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 40, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 35, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	10.38537793598854	23.777041135743126	65.13818110230895	6.135283374007233	22.24841571428572	66.28715857142858	13.79150154761905	0.7814902380952383	0	2025-07-08 11:22:54.765007+05:30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
71	83	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 10, "Teck Venture": 70, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 20, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	10.305479986222345	23.533186110294842	67.05147221891735	5.746285714272212	24.119725491452996	66.28313031746033	13.64057880952381	0.7450735714285713	0	2025-07-08 11:22:54.765007+05:30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
72	83	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 10, "Poitrel": 0.0, "Illawara (PHCC)": 15, "Teck Venture": 0.0, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 75, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	10.451480621729544	23.11396803186571	67.28574228536756	7.335374278516477	23.066324740259738	68.69612346861469	13.759095119047615	0.8313240079365083	0	2025-07-08 11:22:54.765007+05:30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
73	83	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 25, "Teck Venture": 40, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 35, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	10.349099589761764	23.546620514924765	66.62979536818236	6.031128255990708	22.112812698412707	69.21594726190474	13.723416450216453	0.7723456349206353	0	2025-07-08 11:22:54.765007+05:30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
74	83	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 5, "Teck Venture": 0.0, "Leer": 75, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 20, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	9.212533781995536	24.168543423039246	66.25600603130906	5.9187559523013205	25.338669018759024	61.61746626984127	12.767784404761906	0.7532060714285711	0	2025-07-08 11:22:54.765007+05:30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
75	83	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 80, "Teck Venture": 15, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 5, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	9.981282804221722	24.28249202317464	64.82845969539152	5.705485805839391	21.97459791486292	69.68666876984126	13.350546522366525	0.7612800000000004	1000	2025-07-08 11:22:54.765007+05:30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
76	84	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 25, "Teck Venture": 45, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 30, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	10.338940065933167	23.558103848274765	66.72188944726285	6.029128255990708	23.260959960317464	68.91404154761904	13.738053116883117	0.7726023015873019	0	2025-08-03 01:48:36.783195+05:30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
77	84	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 10, "Teck Venture": 0.0, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 80, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 10, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	10.491452671613779	23.472858107932417	67.72403440471558	5.644391534333079	25.00100630952381	63.59972914224661	13.83530974025974	0.713089078144078	0	2025-08-03 01:48:36.783195+05:30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
78	84	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 0.0, "Teck Venture": 0.0, "Leer": 0.0, "Daunia (SHCC)": 65, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 5, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0, "Aus. SHCC": 30}	9.289663333291525	23.329496349330963	67.72722112041069	7.06196388887532	24.437480184815186	65.86246404761903	12.684227738095238	0.7896972619047617	0	2025-08-03 01:48:36.783195+05:30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
79	84	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 5, "Teck Venture": 0.0, "Leer": 0.0, "Daunia (SHCC)": 90, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 0.0, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0, "Aus. SHCC": 5}	8.938830940122957	23.138069186018058	68.3437668855639	6.977210978816228	24.985903875291378	65.05339642857143	12.467852500000006	0.7669157142857143	0	2025-08-03 01:48:36.783195+05:30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
80	84	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 10, "Teck Venture": 0.0, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 60, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 30, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	10.038304106579726	23.59570902102536	67.50366580147147	5.549551587261485	24.558650753968262	65.62227730158729	13.844449913419913	0.7448999206349205	0	2025-08-03 01:48:36.783195+05:30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
81	84	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 90, "Teck Venture": 0.0, "Leer": 0.0, "Daunia (SHCC)": 5, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 0.0, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0, "Aus. SHCC": 5}	9.969920952469286	24.355836864482384	64.81990173243486	5.708583028043973	21.94989434343435	69.40942530663779	13.31639818903319	0.7620728571428574	1000	2025-08-03 01:48:36.783195+05:30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
83	86	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 20, "Teck Venture": 0.0, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 50, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 30, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	9.900881349304932	23.728261018764652	67.32184587719435	6.51567328500967	23.763226602564117	66.92568448412699	13.209786428571418	0.7781221428571432	0	2025-08-06 01:01:20.863524+05:30	2025-08-06 01:06:17.718757+05:30	17.08108351373855	4.659082181515405	0.15567850904553956	0.08910892219842971	0.1366178443968594	0.20654772649572647	0.14458340854700852	0.06196431794871794	0.18376107692307694	0.16538496923076926	0.018376107692307696
84	86	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 5, "Teck Venture": 0.0, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 90, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 5, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	10.332204642677922	23.755578394619207	66.34070283053539	6.018308140941087	24.51101391774892	62.35701349206349	13.584897380952379	0.7323676984126984	0	2025-08-06 01:01:20.863524+05:30	2025-08-06 01:06:17.73478+05:30	14.530079225645295	3.9632634054954208	0.050660464753587015	0.0854674518201285	0.13103490364025697	0.27942223199023203	0.19559556239316242	0.08382666959706961	0.24807574725274725	0.22326817252747252	0.024807574725274728
82	86	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 20, "Teck Venture": 0.0, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 45, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 35, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	9.856739603315013	23.73563470907953	67.23774429968103	6.514366406721081	22.990050984848498	68.70432646103895	13.18575892857142	0.7797746428571433	0	2025-08-06 01:01:20.863524+05:30	2025-08-06 01:06:17.670686+05:30	17.075696777685266	4.657612880932557	0.15198139426076107	0.08868051391862956	0.13596102783725908	0.20482332356532354	0.14337632649572646	0.06144699706959706	0.1825522527472527	0.16429702747252745	0.01825522527472527
85	86	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 25, "Teck Venture": 0.0, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 40, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 35, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	10.38537793598854	23.777041135743126	65.13818110230895	6.135283374007233	22.24841571428572	66.28715857142858	13.79150154761905	0.7814902380952383	0	2025-08-06 01:01:20.863524+05:30	2025-08-06 01:06:17.751725+05:30	16.182011615320565	4.413848917568693	0.09982209918902056	0.07638519628836547	0.11711039257673089	0.2383684444444444	0.1668579111111111	0.07151053333333332	0.210739	0.1896651	0.021073900000000003
86	86	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 90, "Teck Venture": 0.0, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 5, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 5, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	10.225080475767074	24.369285766802236	64.9268950919958	5.725219932790806	22.038417557720063	68.22112476190478	13.308291046176048	0.7647300000000005	1000	2025-08-06 01:01:20.863524+05:30	2025-08-06 01:06:17.765061+05:30	16.68862131557036	4.552033139050791	0.09652467248908296	0.0818259814418273	0.12545196288365454	0.18747589499389505	0.13123312649572652	0.05624276849816851	0.17279096703296706	0.15551187032967037	0.017279096703296706
87	87	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 5, "Teck Venture": 80, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 15, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	10.346519946468426	23.583969800863645	67.05697221877357	5.7275079364802135	24.122494380341884	66.27259896825397	13.665706428571427	0.7283299603174603	0	2025-08-06 01:43:01.638941+05:30	2025-08-06 01:46:38.746129+05:30	16.802768817651955	4.583168318068276	0.10341929195258891	0.06284749464668096	0.09635498929336188	0.3171019829059829	0.221971388034188	0.09513059487179487	0.2566986923076923	0.2310288230769231	0.025669869230769235
88	87	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 30, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 20, "Teck Venture": 0.0, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 50, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 0.0, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	9.761820803055691	23.488950940723853	67.81024365135303	6.2103440957139995	23.28413700577201	68.82018288961036	12.668619378066385	0.7533792857142859	0	2025-08-06 01:43:01.638941+05:30	2025-08-06 01:46:38.765956+05:30	17.22524283097419	4.698403463780184	0.08293527760449157	0.09103675945753036	0.13957351891506067	0.32833615628815627	0.22983530940170938	0.09850084688644688	0.2624089560439561	0.23616806043956048	0.02624089560439561
89	87	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 15, "Teck Venture": 0.0, "Leer": 0.0, "Daunia (SHCC)": 25, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 0.0, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0, "Collinsville": 60}	9.83078876977442	23.149132730419	66.90659568790831	6.858023015875595	25.03254021367522	65.33377523809526	13.382686111111106	0.7868488888888893	0	2025-08-06 01:43:01.638941+05:30	2025-08-06 01:46:38.79319+05:30	16.839962947543714	4.593313488759367	0.11960665938864627	0.08439643112062815	0.12939286224125626	0.2855542735042735	0.19988799145299144	0.08566628205128204	0.23644692307692308	0.21280223076923077	0.02364469230769231
90	87	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 10, "Teck Venture": 70, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 20, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	10.305479986222345	23.533186110294842	67.05147221891735	5.746285714272212	24.119725491452996	66.28313031746033	13.64057880952381	0.7450735714285713	0	2025-08-06 01:43:01.638941+05:30	2025-08-06 01:46:38.808292+05:30	16.822007160699414	4.5884158201498755	0.10451843418590141	0.06546078515346182	0.10036157030692362	0.30082568009768007	0.21057797606837603	0.09024770402930402	0.2459325274725275	0.22133927472527476	0.024593252747252752
91	87	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 10, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 5, "Teck Venture": 0.0, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 85, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 0.0, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	9.75402092206034	23.344809671215994	68.00735980887704	6.2822028619693535	23.946709260461766	66.857571017316	13.215376038961042	0.7200483333333336	0	2025-08-06 01:43:01.638941+05:30	2025-08-06 01:46:38.823914+05:30	17.728004862614487	4.835538184845962	0.07244346537741733	0.0977841898643826	0.14991837972876515	0.3908942588522589	0.2736259811965812	0.11726827765567767	0.30011230219780227	0.2701010719780221	0.03001123021978023
92	87	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 20, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 10, "Teck Venture": 0.0, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 70, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 0.0, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	9.58166266819518	23.423153692135596	68.00463430377087	6.275188973078519	23.827988383838388	66.70276273088022	12.62820502442003	0.7417475000000001	0	2025-08-06 01:43:01.638941+05:30	2025-08-06 01:46:38.839061+05:30	17.50535310574521	4.77480709408826	0.07693995633187771	0.09489243397573163	0.14548486795146323	0.3654832185592185	0.25583825299145296	0.10964496556776555	0.2849392197802198	0.2564452978021978	0.02849392197802198
93	87	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 25, "Teck Venture": 50, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 25, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	10.284687612049863	23.62137091176606	65.53824293236843	5.771253968261489	23.39575996031747	68.10625277777781	13.635445616883118	0.7687893650793655	0	2025-08-06 01:43:01.638941+05:30	2025-08-06 01:46:38.855093+05:30	16.846375728559533	4.595062656119901	0.1054177323767935	0.07047316202712349	0.10804632405424695	0.26779064713064715	0.187453452991453	0.08033719413919414	0.22417950549450555	0.201761554945055	0.022417950549450557
94	87	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 80, "Teck Venture": 15, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 5, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	9.981282804221722	24.28249202317464	64.82845969539152	5.705485805839391	21.97459791486292	69.68666876984126	13.350546522366525	0.7612800000000004	1000	2025-08-06 01:43:01.638941+05:30	2025-08-06 01:46:38.869808+05:30	16.807899042464612	4.584567651956704	0.09952233312538987	0.078013147751606	0.11960629550321199	0.20720538217338216	0.1450437675213675	0.06216161465201465	0.18484273626373626	0.16635846263736265	0.018484273626373626
95	88	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 5, "Teck Venture": 80, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 15, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	10.346519946468426	23.583969800863645	67.05697221877357	5.7275079364802135	24.122494380341884	66.27259896825397	13.665706428571427	0.7283299603174603	0	2025-08-06 20:48:45.210554+05:30	2025-08-06 20:54:02.451377+05:30	16.802768817651955	4.583168318068276	0.10341929195258891	0.06284749464668096	0.09635498929336188	0.3171019829059829	0.221971388034188	0.09513059487179487	0.2566986923076923	0.2310288230769231	0.025669869230769235
96	88	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 25, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 20, "Teck Venture": 0.0, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 55, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 0.0, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	9.77796080305536	23.509512766055526	67.78563730214447	6.236260101023301	23.25202283910534	68.87125344516592	12.643690275502276	0.7471810714285717	0	2025-08-06 20:48:45.210554+05:30	2025-08-06 20:54:02.483759+05:30	17.30783945045795	4.720932739383846	0.08143644728633812	0.09200067808708068	0.1410513561741613	0.3351736654456654	0.23462156581196578	0.10055209963369961	0.2663169065934066	0.23968521593406597	0.026631690659340665
97	88	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 5, "Teck Venture": 10, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 0.0, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0, "Olive Down": 85}	10.111689712484539	22.985688492291075	67.60560031506272	6.991240897096515	24.813263626373622	63.08837555555553	13.411747554945052	0.777353333333333	0	2025-08-06 20:48:45.210554+05:30	2025-08-06 20:54:02.504496+05:30	17.123407868442964	4.670626686094921	0.09132872738615093	0.07572116345467524	0.11609232690935045	0.3326821978021978	0.23287753846153847	0.09980465934065934	0.2608856318681319	0.23479706868131872	0.026088563186813192
98	88	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 25, "Teck Venture": 40, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 35, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	10.349099589761764	23.546620514924765	66.62979536818236	6.031128255990708	22.112812698412707	69.21594726190474	13.723416450216453	0.7723456349206353	0	2025-08-06 20:48:45.210554+05:30	2025-08-06 20:54:02.520242+05:30	16.8797221898418	4.604158326394671	0.10781586088583903	0.07330065667380443	0.11238131334760884	0.2519967716727717	0.17639774017094018	0.0755990315018315	0.21363403296703298	0.19227062967032968	0.0213634032967033
99	88	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 5, "Teck Venture": 10, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 0.0, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0, "Collinsville": 85}	11.012414152592427	22.787177283589994	65.41094775049167	6.828645502621048	25.005972380952375	65.90570420634921	13.905304999999993	0.8262002380952381	0	2025-08-06 20:48:45.210554+05:30	2025-08-06 20:54:02.538883+05:30	16.57832148209825	4.521947460449626	0.13379558640049904	0.08628142755174878	0.13228285510349752	0.26116159951159956	0.1828131196581197	0.07834847985347987	0.22105136263736266	0.1989462263736264	0.022105136263736266
100	88	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 10, "Teck Venture": 0.0, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 60, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 30, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	10.238313174232589	23.781465831448838	65.97519718513458	6.087297262889065	24.95855317460319	62.520068611111114	13.536236706349204	0.7754667748917748	0	2025-08-06 20:48:45.210554+05:30	2025-08-06 20:54:02.553743+05:30	15.80878776019983	4.312047377185678	0.09492592014971925	0.07291508922198432	0.11179017844396862	0.2645893137973138	0.18521251965811966	0.07937679413919414	0.23104450549450556	0.20794005494505502	0.023104450549450557
101	88	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 80, "Teck Venture": 15, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 5, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	9.981282804221722	24.28249202317464	64.82845969539152	5.705485805839391	21.97459791486292	69.68666876984126	13.350546522366525	0.7612800000000004	1000	2025-08-06 20:48:45.210554+05:30	2025-08-06 20:54:02.568902+05:30	16.807899042464612	4.584567651956704	0.09952233312538987	0.078013147751606	0.11960629550321199	0.20720538217338216	0.1450437675213675	0.06216161465201465	0.18484273626373626	0.16635846263736265	0.018484273626373626
30	76	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 4, "Poitrel": 0.0, "Illawara (PHCC)": 16, "Teck Venture": 0.0, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 79, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 0.0, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	10.323243531408405	23.75320434692968	66.36527542318929	6.029704966341387	24.579848917748926	62.479121349206345	13.607001547619053	0.7363324603174606	0	2025-06-13 14:14:59.56667+05:30	2025-08-06 20:54:13.751203+05:30	14.638583480432972	3.9928593172356375	0.05479723643169058	0.08413938615274806	0.12899877230549608	0.2700734676434676	0.18905142735042732	0.08102204029304029	0.23950927472527472	0.21555834725274725	0.023950927472527472
34	76	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 30, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 0.0, "Teck Venture": 45, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 25, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	10.48139880877887	23.735274897354287	64.81015906032168	5.829668650750344	23.340421031746033	68.23847634920637	13.671075735930732	0.7662001984126986	0	2025-06-13 14:14:59.56667+05:30	2025-08-06 20:54:13.818036+05:30	16.698112231473768	4.554621906744379	0.10531781035558328	0.0716727052105639	0.10988541042112779	0.28880235897435896	0.20216165128205127	0.08664070769230768	0.23938146153846157	0.21544331538461542	0.02393814615384616
102	90	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 5, "Teck Venture": 0.0, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 90, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 5, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	10.563659338122447	23.535706547167898	67.72105322383725	5.691772486718972	25.331079642857148	63.33441318986566	14.237538470418476	0.7117002686202683	0	2025-08-06 20:58:32.892148+05:30	2025-08-06 21:11:06.027851+05:30	16.591660066611155	4.525585728559534	0.06504923580786025	0.0854674518201285	0.13103490364025697	0.3250245177045177	0.22751716239316236	0.0975073553113553	0.26194860439560447	0.23575374395604404	0.026194860439560447
103	90	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 5, "Teck Venture": 0.0, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 85, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 0.0, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0, "Aus. SHCC": 10}	9.947311699261421	23.350325649988694	67.99213647567481	6.312202861976353	23.823743427128434	66.78450911255409	13.510160876623377	0.7440170021645026	0	2025-08-06 20:58:32.892148+05:30	2025-08-06 21:11:06.136297+05:30	17.72800486261449	4.835538184845963	0.07244346537741733	0.0977841898643826	0.14991837972876515	0.39483717948717956	0.27638602564102566	0.11845115384615386	0.3025777307692308	0.2723199576923077	0.03025777307692308
104	90	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 10, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 5, "Teck Venture": 85, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 0.0, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	10.516267366766499	23.803442763541657	65.4787004912252	5.587442460308271	24.192216959706965	66.10351920634923	13.746532619047622	0.7352513492063492	0	2025-08-06 20:58:32.892148+05:30	2025-08-06 21:11:06.191202+05:30	16.707603147377185	4.557210674437969	0.09962225514660011	0.06100533904354035	0.09353067808708065	0.3338310915750916	0.2336817641025641	0.10014932747252749	0.2684285054945055	0.24158565494505493	0.02684285054945055
105	90	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 10, "Teck Venture": 0.0, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 80, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 10, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	10.491452671613779	23.472858107932417	67.72403440471558	5.644391534333079	25.00100630952381	63.59972914224661	13.83530974025974	0.713089078144078	0	2025-08-06 20:58:32.892148+05:30	2025-08-06 21:11:06.266646+05:30	16.630649775187344	4.536220666111574	0.07014525888958202	0.08525324768022843	0.13070649536045684	0.30962280830280836	0.21673596581196583	0.0928868424908425	0.25177083516483517	0.22659375164835166	0.02517708351648352
106	90	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 5, "Teck Venture": 0.0, "Leer": 0.0, "Daunia (SHCC)": 80, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 15, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	9.244410396787025	23.201880852840205	67.90095556316012	6.991916534385395	24.79422828005327	65.56824571428571	12.5507075	0.7627847619047617	0	2025-08-06 20:58:32.892148+05:30	2025-08-06 21:11:06.335264+05:30	17.459437593671943	4.762283055786845	0.09062927323767934	0.07518565310492506	0.1152713062098501	0.3738394676434676	0.2616876273504273	0.11215184029304028	0.2926842747252747	0.26341584725274725	0.02926842747252747
107	90	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 10, "Teck Venture": 0.0, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 75, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 0.0, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0, "Poitrel ": 15}	10.288830555293828	23.83816118541408	66.24622391516264	6.006766474279086	24.90939022727273	62.1366899206349	13.609486720779223	0.7335782142857143	0	2025-08-06 20:58:32.892148+05:30	2025-08-06 21:11:06.426943+05:30	14.716049875104078	4.0139892589508746	0.05475726762320648	0.08268279800142755	0.12676559600285506	0.31249786324786316	0.2187485042735042	0.09374935897435895	0.26725153846153843	0.2405263846153846	0.026725153846153843
108	90	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 15, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 5, "Teck Venture": 0.0, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 80, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 0.0, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	10.309862976069795	23.746318632618255	66.36527542318929	6.026371633006387	24.684682251082258	62.5001284920635	13.64951190476191	0.7358657936507939	0	2025-08-06 20:58:32.892148+05:30	2025-08-06 21:11:06.493721+05:30	14.694502930890927	4.008112056619486	0.054757267623206485	0.08482483940042827	0.13004967880085652	0.28281812698412695	0.19797268888888886	0.08484543809523808	0.24934571428571428	0.22441114285714286	0.02493457142857143
109	90	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 5, "Teck Venture": 0.0, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 90, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 5, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	10.332204642677922	23.755578394619207	66.34070283053539	6.018308140941087	24.51101391774892	62.35701349206349	13.584897380952379	0.7323676984126984	0	2025-08-06 20:58:32.892148+05:30	2025-08-06 21:11:06.514644+05:30	14.530079225645295	3.9632634054954208	0.050660464753587015	0.0854674518201285	0.13103490364025697	0.27942223199023203	0.19559556239316242	0.08382666959706961	0.24807574725274725	0.22326817252747252	0.024807574725274728
110	90	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 90, "Teck Venture": 0.0, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 5, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 5, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	10.225080475767074	24.369285766802236	64.9268950919958	5.725219932790806	22.038417557720063	68.22112476190478	13.308291046176048	0.7647300000000005	1000	2025-08-06 20:58:32.892148+05:30	2025-08-06 21:11:06.546862+05:30	16.68862131557036	4.552033139050791	0.09652467248908296	0.0818259814418273	0.12545196288365454	0.18747589499389505	0.13123312649572652	0.05624276849816851	0.17279096703296706	0.15551187032967037	0.017279096703296706
112	91	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 5, "Teck Venture": 80, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 15, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	10.346519946468426	23.583969800863645	67.05697221877357	5.7275079364802135	24.122494380341884	66.27259896825397	13.665706428571427	0.7283299603174603	0	2025-08-06 21:11:23.831132+05:30	2025-08-06 21:16:17.274341+05:30	16.802768817651955	4.583168318068276	0.10341929195258891	0.06284749464668096	0.09635498929336188	0.3171019829059829	0.221971388034188	0.09513059487179487	0.2566986923076923	0.2310288230769231	0.025669869230769235
113	91	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 30, "Teck Venture": 35, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 35, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	10.37846070082876	23.544691626118098	66.64383349497	6.029461589320707	22.155441269841273	69.45759726190474	13.702468116883118	0.7716739682539687	0	2025-08-06 21:11:23.831132+05:30	2025-08-06 21:16:17.298217+05:30	16.882287302248127	4.604857993338885	0.1077159388646288	0.07450019985724485	0.11422039971448965	0.24361740659340653	0.17053218461538455	0.07308522197802196	0.2081406043956044	0.18732654395604395	0.02081406043956044
114	91	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 35, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 20, "Teck Venture": 0.0, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 0.0, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0, "Olive Down": 45}	9.96188723553168	23.079832889545905	67.44233991667251	7.050649230439319	23.772397344877344	67.74161503968256	13.289769087301584	0.7781808333333332	0	2025-08-06 21:11:23.831132+05:30	2025-08-06 21:16:17.324989+05:30	16.798664637801835	4.582048850957536	0.09432638802245787	0.07966251962883657	0.12213503925767309	0.2869948888888889	0.20089642222222223	0.08609846666666666	0.2355695	0.21201255	0.02355695
115	91	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 0.0, "Teck Venture": 25, "Leer": 60, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 15, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	9.385093565783869	23.63826920555794	66.09947099636287	5.904807539611012	25.289213542568557	61.575246626984125	14.008657196969699	0.7598653571428567	0	2025-08-06 21:11:23.831132+05:30	2025-08-06 21:16:17.342133+05:30	15.875224171523733	4.330168751040801	0.1598752339363693	0.0662747608850821	0.10160952177016418	0.22009304029304022	0.15406512820512813	0.06602791208791206	0.20090258241758238	0.18081232417582416	0.020090258241758238
116	91	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 10, "Teck Venture": 70, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 20, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	10.305479986222345	23.533186110294842	67.05147221891735	5.746285714272212	24.119725491452996	66.28313031746033	13.64057880952381	0.7450735714285713	0	2025-08-06 21:11:23.831132+05:30	2025-08-06 21:16:17.356012+05:30	16.822007160699414	4.5884158201498755	0.10451843418590141	0.06546078515346182	0.10036157030692362	0.30082568009768007	0.21057797606837603	0.09024770402930402	0.2459325274725275	0.22133927472527476	0.024593252747252752
117	91	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 25, "Teck Venture": 40, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 35, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	10.349099589761764	23.546620514924765	66.62979536818236	6.031128255990708	22.112812698412707	69.21594726190474	13.723416450216453	0.7723456349206353	0	2025-08-06 21:11:23.831132+05:30	2025-08-06 21:16:17.370601+05:30	16.8797221898418	4.604158326394671	0.10781586088583903	0.07330065667380443	0.11238131334760884	0.2519967716727717	0.17639774017094018	0.0755990315018315	0.21363403296703298	0.19227062967032968	0.0213634032967033
118	91	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 80, "Teck Venture": 15, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 5, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	9.981282804221722	24.28249202317464	64.82845969539152	5.705485805839391	21.97459791486292	69.68666876984126	13.350546522366525	0.7612800000000004	1000	2025-08-06 21:11:23.831132+05:30	2025-08-06 21:16:17.38512+05:30	16.807899042464612	4.584567651956704	0.09952233312538987	0.078013147751606	0.11960629550321199	0.20720538217338216	0.1450437675213675	0.06216161465201465	0.18484273626373626	0.16635846263736265	0.018484273626373626
111	91	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 15, "Teck Venture": 65, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 20, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	10.271092823628498	23.552211030921985	66.85111431222501	5.751730158716547	23.902605848595854	66.67267583333334	13.620627142857145	0.7439675396825399	0	2025-08-06 21:11:23.831132+05:30	2025-08-06 21:16:17.253277+05:30	16.824572273105744	4.589115487094089	0.1044185121646912	0.06666032833690223	0.10220065667380443	0.29244631501831503	0.20471242051282051	0.0877338945054945	0.24043909890109888	0.216395189010989	0.02404390989010989
120	92	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 5, "Teck Venture": 80, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 15, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	10.346519946468426	23.583969800863645	67.05697221877357	5.7275079364802135	24.122494380341884	66.27259896825397	13.665706428571427	0.7283299603174603	0	2025-08-14 15:23:07.251678+05:30	2025-08-18 19:07:17.229111+05:30	17.049019608659453	4.65033634471274	0.08613278228321897	0.0006284749464668096	0.0009635498929336187	0.7422393162393164	0.5195675213675215	0.22267179487179492	4.806774692307693	4.326097223076924	0.4806774692307693
121	92	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 15, "Teck Venture": 60, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 25, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	10.268049569729595	23.598156507090945	66.77925292001274	5.7478333333410845	23.91114811050062	66.49211845238096	13.640619188311689	0.7585525396825397	0	2025-08-14 15:23:07.251678+05:30	2025-08-18 19:07:17.271238+05:30	17.056714945878436	4.6524353455453795	0.09012966313162818	0.0006807407566024271	0.0010436815132048537	0.7150671550671552	0.5005470085470086	0.21452014652014656	4.799226362637363	4.319303726373627	0.4799226362637363
122	92	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 25, "Teck Venture": 40, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 35, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	10.349099589761764	23.546620514924765	66.62979536818236	6.031128255990708	22.112812698412707	69.21594726190474	13.723416450216453	0.7723456349206353	0	2025-08-14 15:23:07.251678+05:30	2025-08-18 19:07:17.426072+05:30	17.064410283097416	4.654534346378019	0.09412654398003742	0.0007330065667380443	0.0011238131334760885	0.6878949938949939	0.4815264957264957	0.20636849816849814	4.791678032967034	4.31251022967033	0.4791678032967034
123	92	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 5, "Teck Venture": 0.0, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 65, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 30, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	10.083778999703597	23.545566190279168	67.49522695564457	5.589135581970554	24.53148468253969	65.56637563492062	13.901856103896105	0.7620863492063491	0	2025-08-14 15:23:07.251678+05:30	2025-08-18 19:07:17.479243+05:30	16.756468538717733	4.5705393297252295	0.0794380068621335	0.0008546745182012851	0.0013103490364025697	0.7696818681318682	0.5387773076923077	0.23090456043956045	4.805082912087912	4.324574620879122	0.48050829120879124
125	92	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 20, "Teck Venture": 55, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 25, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	10.305937982524307	23.665725237197847	66.71441682828308	5.742861111120418	23.431472817460325	68.09186642857146	13.64715395021645	0.7719874603174606	0	2025-08-14 15:23:07.251678+05:30	2025-08-18 19:07:17.80733+05:30	17.05414983347211	4.651735678601167	0.09002974111041796	0.000692736188436831	0.0010620723768736615	0.7069322344322344	0.49485256410256406	0.21207967032967032	4.805682934065935	4.325114640659342	0.4805682934065935
126	92	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 80, "Teck Venture": 15, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 5, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	9.981282804221722	24.28249202317464	64.82845969539152	5.705485805839391	21.97459791486292	69.68666876984126	13.350546522366525	0.7612800000000004	1000	2025-08-14 15:23:07.251678+05:30	2025-08-18 19:07:17.914259+05:30	16.997717360532892	4.636343005828478	0.08043722707423581	0.0007801314775160601	0.0011960629550321197	0.6311178266178267	0.44178247863247866	0.18933534798534798	4.924084736263736	4.431676262637362	0.49240847362637363
119	92	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 10, "Teck Venture": 75, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 15, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	10.281949629085666	23.56619424532698	67.07056523445453	5.729341269811214	24.08919493589744	66.18446888888889	13.697207142857145	0.7283885714285714	0	2025-08-14 15:23:07.251678+05:30	2025-08-18 19:07:17.138012+05:30	17.04645449625312	4.649636677768527	0.08603286026200874	0.0006404703783012135	0.0009819407566024267	0.7341043956043957	0.5138730769230769	0.2202313186813187	4.813231263736264	4.331908137362638	0.4813231263736264
128	93	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 10, "Teck Venture": 75, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 15, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	10.281949629085666	23.56619424532698	67.07056523445453	5.729341269811214	24.08919493589744	66.18446888888889	13.697207142857145	0.7283885714285714	0	2025-08-14 15:45:35.691403+05:30	2025-08-16 15:24:19.441261+05:30	1704.645449625312	464.9636677768527	8.603286026200873	0.06404703783012135	0.09819407566024269	0.3087226178266178	0.21610583247863246	0.09261678534798534	4.813231263736264	4.331908137362638	0.4813231263736264
130	93	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 5, "Teck Venture": 0.0, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 60, "Caval Ridge": 35, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	10.048139788405598	24.014312936344073	65.39128082719176	7.138591871118178	24.4711092893218	65.09134261904764	13.281084108946608	0.764035010822511	0	2025-08-14 15:45:35.691403+05:30	2025-08-16 15:24:19.670798+05:30	693.5479101082431	189.17398930890926	4.711523144104803	0.08958017130620986	0.1373403426124197	0.2910663199023199	0.20374642393162393	0.08731989597069596	2.0512184725274722	1.846096625274725	0.20512184725274724
132	93	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 5, "Teck Venture": 10, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 85, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 0.0, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	10.040734326190575	24.259159616146587	66.30025899410506	6.021213929556065	24.967856241830077	62.31749876984125	13.256241587301593	0.7125563003663002	0	2025-08-14 15:45:35.691403+05:30	2025-08-16 15:24:19.823604+05:30	1571.5032901748543	428.64745503746883	19.025152838427942	0.06516089935760172	0.09990179871520341	0.31183260073260066	0.21828282051282044	0.0935497802197802	6.3706649560439566	5.733598460439561	0.6370664956043957
133	93	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 65, "Riverside": 15, "Poitrel": 0.0, "Illawara (PHCC)": 20, "Teck Venture": 0.0, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 0.0, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	10.109879470826689	23.743013629093454	65.15983138702667	7.032201851866762	23.789384722222216	67.0554030952381	13.303761024531024	0.8142755627705625	0	2025-08-14 15:45:35.691403+05:30	2025-08-16 15:24:19.881308+05:30	1716.4449666944213	468.1821357202332	10.122100748596383	0.08204018558172736	0.1257803711634547	0.2521972112332112	0.17653804786324784	0.07565916336996335	4.76825565934066	4.2914300934065945	0.47682556593406605
134	93	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 25, "Teck Venture": 40, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 35, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	10.349099589761764	23.546620514924765	66.62979536818236	6.031128255990708	22.112812698412707	69.21594726190474	13.723416450216453	0.7723456349206353	0	2025-08-14 15:45:35.691403+05:30	2025-08-16 15:24:20.167217+05:30	1706.4410283097418	465.4534346378019	9.412654398003742	0.07330065667380443	0.11238131334760884	0.2519967716727717	0.17639774017094018	0.0755990315018315	4.791678032967034	4.31251022967033	0.4791678032967034
135	93	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 80, "Teck Venture": 15, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 5, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	9.981282804221722	24.28249202317464	64.82845969539152	5.705485805839391	21.97459791486292	69.68666876984126	13.350546522366525	0.7612800000000004	1000	2025-08-14 15:45:35.691403+05:30	2025-08-16 15:24:20.229428+05:30	1699.771736053289	463.6343005828478	8.043722707423582	0.078013147751606	0.11960629550321199	0.20720538217338216	0.1450437675213675	0.06216161465201465	4.924084736263736	4.431676262637362	0.49240847362637363
127	93	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 15, "Teck Venture": 0.0, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 45, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 40, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	10.36590484060859	23.80115359612193	65.14850639637228	6.127546957658449	23.435961349206366	64.6345115873016	13.66855392857143	0.782131666666667	0	2025-08-14 15:45:35.691403+05:30	2025-08-16 15:24:19.541497+05:30	1637.9910037468776	446.7828222314738	15.487913287585775	0.07578542469664526	0.11619084939329048	0.24552669597069596	0.17186868717948717	0.07365800879120879	5.580227241758243	5.022204517582418	0.5580227241758243
129	93	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 5, "Teck Venture": 80, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 15, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	10.346519946468426	23.583969800863645	67.05697221877357	5.7275079364802135	24.122494380341884	66.27259896825397	13.665706428571427	0.7283299603174603	0	2025-08-14 15:45:35.691403+05:30	2025-08-16 15:24:19.616432+05:30	1704.9019608659453	465.03363447127407	8.613278228321896	0.06284749464668096	0.09635498929336188	0.3171019829059829	0.221971388034188	0.09513059487179487	4.806774692307693	4.326097223076924	0.4806774692307693
131	93	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 15, "Teck Venture": 70, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 15, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	10.31577546245225	23.562461705757933	67.01173745697	5.732674603143214	24.092187793040296	66.1376823015873	13.660343809523813	0.7384235714285714	0	2025-08-14 15:45:35.691403+05:30	2025-08-16 15:24:19.749118+05:30	1704.3889383846797	464.8937010824314	8.593293824079847	0.06524658101356176	0.10003316202712348	0.3003432527472527	0.2102402769230769	0.09010297582417581	4.819687835164834	4.337719051648351	0.4819687835164834
137	94	{"Metropolitan": 75, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 0.0, "Teck Venture": 5, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 20, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 0.0, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	9.32134913300191	24.0327800796219	66.39665298330536	6.222926149801715	23.11282880952381	67.77012865440115	13.012381349206345	0.7278358874458873	0	2025-08-18 18:49:32.715856+05:30	2025-08-18 19:20:36.150304+05:30	17.78135920066611	4.850091257285596	0.0924278696194635	0.0007634235546038546	0.0011704471092077089	0.7139517704517704	0.49976623931623926	0.2141855311355311	4.24834243956044	3.8235081956043957	0.42483424395604397
138	94	{"Metropolitan": 5, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 0.0, "Teck Venture": 75, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 20, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 0.0, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	9.32134913300191	24.0818400796819	66.39665298330536	6.250664245029216	23.102828809523807	67.77012865440115	13.012381349206345	0.7306408874458874	1000	2025-08-18 18:49:32.715856+05:30	2025-08-18 19:20:36.214571+05:30	17.099039300582845	4.663979850124896	0.09942241110417965	0.0006554646680942185	0.001004929336188437	0.7311910866910867	0.5118337606837606	0.219357326007326	4.814398131868132	4.332958318681319	0.4814398131868132
139	95	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 0.0, "Teck Venture": 0.0, "Leer": 60, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 30, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 10, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 0.0, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	9.32134913300191	24.0327800796219	66.39665298330536	6.225148372018382	23.107828809523806	67.77012865440115	13.012381349206345	0.7278358874458873	0	2025-08-18 19:01:36.245154+05:30	2025-08-18 19:06:04.431142+05:30	6.911885197169026	1.8853043565362202	0.038933616344354334	0.0007334349750178445	0.0011244699500356887	0.5635825396825397	0.39450777777777774	0.1690747619047619	2.2368902857142854	2.013201257142857	0.22368902857142856
140	95	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 0.0, "Teck Venture": 0.0, "Leer": 30, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 10, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 60, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 0.0, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	9.32134913300191	24.0327800796219	66.39665298330536	6.222926149801715	23.107828809523806	67.77012865440115	13.012381349206345	0.7278358874458873	1000	2025-08-18 19:01:36.245154+05:30	2025-08-18 19:06:04.52116+05:30	11.621977944129892	3.1700418951706917	0.047145208047411104	0.0007951257673090652	0.00121905153461813	0.6505175824175824	0.4553623076923076	0.19515527472527472	4.498633054945055	4.04876974945055	0.4498633054945055
124	92	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 0.0, "Teck Venture": 75, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 5, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0, "Aus. SHCC": 20}	10.930512286987943	23.662562208050478	65.67032431186978	5.8004877945993245	24.69500776418027	63.02422146825396	13.853850079365081	0.7257416269841269	0	2025-08-14 15:23:07.251678+05:30	2025-08-18 19:07:17.756445+05:30	16.869461740216487	4.6013596586178185	0.09122880536494073	0.0006361862955032121	0.000975372591006424	0.7747332112332114	0.542313247863248	0.2324199633699634	4.900825659340659	4.410743093406593	0.4900825659340659
136	94	{"Metropolitan": 40, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 0.0, "Teck Venture": 0.0, "Leer": 40, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 20, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 0.0, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	9.32134913300191	24.0327800796219	66.39665298330536	6.222926149801715	23.107828809523806	67.77012865440115	13.012381349206345	0.7278358874458873	0	2025-08-18 18:49:32.715856+05:30	2025-08-18 19:20:36.096719+05:30	10.574203914404663	2.8842482388009993	0.040744203368683715	0.0007231531763026409	0.0011087063526052817	0.6611797313797315	0.462825811965812	0.19835391941391944	2.6544134505494505	2.3889721054945054	0.26544134505494504
141	96	{"Metropolitan": 5, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 0.0, "Teck Venture": 0.0, "Leer": 30, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 0.0, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0, "Aus. SHCC": 65}	9.32134913300191	24.050463412871906	66.55023060227822	7.086784444459865	23.11282880952381	67.77012865440115	13.012381349206345	0.7257908874458873	0	2025-08-18 19:20:51.246231+05:30	2025-08-18 19:26:49.610791+05:30	11.466788643547046	3.127712045045796	0.08591495227698065	0.0007608531049250536	0.0011665062098501068	0.7273509768009768	0.5091456837606837	0.21820529304029304	3.6541827252747257	3.288764452747253	0.3654182725274726
142	96	{"Metropolitan": 65, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 0.0, "Teck Venture": 5, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 30, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 0.0, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	9.32134913300191	24.0327800796219	66.39665298330536	6.222926149801715	23.11282880952381	67.77012865440115	13.012381349206345	0.7278358874458873	0	2025-08-18 19:20:51.246231+05:30	2025-08-18 19:26:49.656586+05:30	18.189212073272273	4.961338301415487	0.07943800686213348	0.0008041223411848682	0.0012328446823697359	0.7562783882783882	0.5293948717948718	0.22688351648351646	4.043173703296703	3.6388563329670327	0.4043173703296703
143	96	{"Metropolitan": 5, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 0.0, "Teck Venture": 65, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 30, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 0.0, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	9.32134913300191	24.0818400796819	66.39665298330536	6.250664245029216	23.102828809523807	67.77012865440115	13.012381349206345	0.7306408874458874	1000	2025-08-18 19:20:51.246231+05:30	2025-08-18 19:26:49.699356+05:30	17.60436644462947	4.801814238134887	0.08543332813474734	0.0007115861527480374	0.0010909723054960743	0.771054945054945	0.5397384615384615	0.23131648351648348	4.528364296703296	4.075527867032967	0.45283642967032967
144	97	{"Metropolitan": 15, "Lake Vermont": 0.0, "PDN": 75, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 0.0, "Teck Venture": 10, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 0.0, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	9.317849132995244	23.54428222207761	66.68804591954392	7.100296349228795	24.067857222222212	67.79791615440114	13.000201349206348	0.7482328318903319	0	2025-08-19 11:41:44.341698+05:30	2025-08-19 11:48:42.80982+05:30	17.293987843463782	4.717154537885096	0.09792358078602618	0.0007771326195574591	0.0011914652391149178	0.7312341269841269	0.5118638888888888	0.21937023809523806	4.645599714285715	4.181039742857143	0.4645599714285715
145	97	{"Metropolitan": 50, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 0.0, "Teck Venture": 45, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 5, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 0.0, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	9.32134913300191	24.0327800796219	66.39665298330536	6.222926149801715	23.107828809523806	67.77012865440115	13.012381349206345	0.7278358874458873	0	2025-08-19 11:41:44.341698+05:30	2025-08-19 11:48:42.871277+05:30	17.48893638634471	4.7703292256452965	0.0739422956955708	0.000665318058529622	0.0010200361170592436	0.7525431623931624	0.5267802136752137	0.22576294871794872	4.514729923076924	4.063256930769232	0.45147299230769244
146	97	{"Metropolitan": 5, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 0.0, "Teck Venture": 50, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 45, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 0.0, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	9.32134913300191	24.0818400796819	66.39665298330536	6.250664245029216	23.102828809523807	67.77012865440115	13.012381349206345	0.7306408874458874	1000	2025-08-19 11:41:44.341698+05:30	2025-08-19 11:48:42.964754+05:30	16.80405137385512	4.583518151540384	0.07044502495321273	0.0007090157030692365	0.0010870314061384727	0.7486595238095238	0.5240616666666666	0.22459785714285715	5.582983571428572	5.024685214285714	0.5582983571428571
147	98	{"Metropolitan": 25, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 0.0, "Teck Venture": 0.0, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 5, "Goonyella": 0.0, "Blue creek": 70, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 0.0, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	9.32134913300191	24.0327800796219	66.39665298330536	6.222926149801715	23.11282880952381	67.77012865440115	13.012381349206345	0.7278358874458873	0	2025-09-10 17:30:14.940858+05:30	2025-09-11 13:21:28.023646+05:30	16.723891611157363	4.561653559533721	0.14538654086088582	0.0008289700214132764	0.0012709400428265526	0.686887667887668	0.48082136752136756	0.2060663003663004	5.067341593406592	4.5606074340659335	0.5067341593406592
148	98	{"Metropolitan": 70, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 10, "Poitrel": 0.0, "Illawara (PHCC)": 0.0, "Teck Venture": 20, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 0.0, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	9.32134913300191	24.0327800796219	66.39665298330536	6.222926149801715	23.11282880952381	67.77012865440115	13.012381349206345	0.7278358874458873	0	2025-09-10 17:30:14.940858+05:30	2025-09-11 13:21:28.164679+05:30	17.74288251457119	4.839596253122399	0.07614058016219587	0.0007103009279086369	0.0010890018558172736	0.7404841269841269	0.5183388888888888	0.22214523809523806	4.2429437142857145	3.8186493428571433	0.42429437142857146
149	98	{"Metropolitan": 55, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 0.0, "Teck Venture": 5, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 40, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 0.0, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	9.32134913300191	24.0327800796219	66.39665298330536	6.222926149801715	23.11282880952381	67.77012865440115	13.012381349206345	0.7278358874458873	0	2025-09-10 17:30:14.940858+05:30	2025-09-11 13:21:28.266384+05:30	17.604366444629477	4.80181423813489	0.11441071428571427	0.000806264382583869	0.0012361287651677373	0.684572039072039	0.4792004273504273	0.2053716117216117	4.43389298901099	3.990503690109891	0.443389298901099
150	98	{"Metropolitan": 5, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 0.0, "Teck Venture": 40, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 55, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 0.0, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0}	9.32134913300191	24.0818400796819	66.39665298330536	6.250664245029216	23.102828809523807	67.77012865440115	13.012381349206345	0.7306408874458874	1000	2025-09-10 17:30:14.940858+05:30	2025-09-11 13:21:28.407923+05:30	17.13046192756037	4.672550770191509	0.13439511852776045	0.0007844155603140615	0.001202631120628123	0.6711568986568988	0.4698098290598291	0.20134706959706963	4.856083747252748	4.370475372527473	0.4856083747252748
151	99	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 0.0, "Teck Venture": 0.0, "Leer": 0.0, "Daunia (SHCC)": 20, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 20, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 0.0, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0, "Olive Down": 60}	9.318291234027244	23.536002857061895	66.71602851669189	7.099163160192728	24.45797833333333	66.1583561147186	13.023119920634919	0.7570947366522366	0	2025-09-11 15:08:17.009139+05:30	2025-09-11 15:15:25.808962+05:30	16.726071956702746	4.5622482764363035	0.08553325015595759	0.0007822735189150609	0.0011993470378301213	0.7872937728937728	0.5511056410256409	0.2361881318681318	4.438199626373627	3.994379663736264	0.4438199626373627
152	99	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 0.0, "Teck Venture": 0.0, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 10, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 0.0, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 35, "Aus. SHCC": 55}	9.301982900702246	23.536002857061895	66.71602851669189	7.103815937970228	24.364542619047615	66.2905186147186	13.023119920634919	0.7495947366522366	0	2025-09-11 15:08:17.009139+05:30	2025-09-11 15:15:26.1128+05:30	10.57648429933389	2.8848702427144053	0.08657543683718028	0.0008332541042112778	0.0012775082084225554	0.6387680012210012	0.4471376008547008	0.19163040036630036	3.513767593406594	3.162390834065935	0.35137675934065943
153	99	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 0.0, "Teck Venture": 0.0, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 5, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 0.0, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 50, "Olive Down": 45}	9.318291234027244	23.536002857061895	66.71602851669189	7.099163160192728	24.45797833333333	66.1583561147186	13.023119920634919	0.7570947366522366	0	2025-09-11 15:08:17.009139+05:30	2025-09-11 15:15:26.296509+05:30	8.398562785179017	2.290814525395504	0.04685343574547723	0.0008276847965738761	0.0012689695931477518	0.5491223931623931	0.3843856752136751	0.16473671794871791	2.2122350769230774	1.9910115692307697	0.22122350769230775
154	99	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 0.0, "Teck Venture": 0.0, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 10, "Moranbah North": 0.0, "R.PCI": 0.0, "Eagle crrek": 0.0, "Goonyella": 75, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 0.0, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 0.0, "Olive Down": 15}	9.317849132995244	23.54340730148856	66.67676449098393	7.146658650815341	23.43645150793651	66.32032734487733	13.022954682539678	0.7487715223665224	0	2025-09-11 15:08:17.009139+05:30	2025-09-11 15:15:26.407548+05:30	16.87843963363863	4.603808492922564	0.11221242981908922	0.000827470592433976	0.0012686411848679513	0.6688058608058607	0.46816410256410246	0.2006417582417582	5.035579851648351	4.532021866483516	0.5035579851648352
155	99	{"Metropolitan": 0.0, "Lake Vermont": 0.0, "PDN": 0.0, "Riverside": 0.0, "Poitrel": 0.0, "Illawara (PHCC)": 0.0, "Teck Venture": 0.0, "Leer": 0.0, "Daunia (SHCC)": 0.0, "Mt. Laurel": 0.0, "Moranbah North": 0.0, "R.PCI": 50, "Eagle crrek": 0.0, "Goonyella": 0.0, "Blue creek": 0.0, "Scratch Coal": 0.0, "Dhamra SHCC PDN": 0.0, "Elga": 0.0, "Low Ash SHCC/ SHCC-BHP": 0.0, "Leer/Russian HFCC": 0.0, "Indonasian": 0.0, "Uvalnaya": 0.0, "Caval Ridge": 0.0, "Amonate": 0.0, "Aus.SHCC": 0.0, "Indian Coal Dhanbaad": 5, "Olive Down": 45}	9.35814206958555	23.545659444145702	66.44679472902631	7.077716190496177	23.44306936507937	66.2998736147186	13.061706904761902	0.7671100793650792	1000	2025-09-11 15:08:17.009139+05:30	2025-09-11 15:15:26.599311+05:30	16.783055928809326	4.577791377602	0.09137768917654399	0.0008951591006423987	0.0013724182012847968	0.757600426129426	0.5303202982905981	0.22728012783882778	3.8749785989010985	3.4874807390109885	0.3874978598901099
\.


--
-- TOC entry 5161 (class 0 OID 41637)
-- Dependencies: 253
-- Data for Name: simulation_properties; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.simulation_properties (id, simulation_id, property_type, property_name, min_value, max_value) FROM stdin;
1	1	coke	vm	0	0
2	1	coke	fixedCarbon	0	0
3	1	coke	phosphorus	0	0
4	1	coke	csr	0	0
5	1	coke	m25d	0	0
6	1	coke	ash	0	0
7	1	coke	sulphur	0	0
8	1	coke	cri	0	0
9	1	coke	m40	0	0
10	1	coke	m10	0	0
11	1	blend	vm	0	0
12	1	blend	fc	0	0
13	1	blend	ash	0	0
14	1	blend	s	0	0
15	1	blend	p	0	0
16	1	blend	sio2	0	0
17	1	blend	al2o3	0	0
18	1	blend	fe2o3	0	0
19	1	blend	cao	0	0
20	1	blend	mgo	0	0
21	1	blend	na2o	0	0
22	1	blend	k2o	0	0
23	1	blend	tio2	0	0
24	1	blend	mn3o4	0	0
25	1	blend	so3	0	0
26	1	blend	p2o5	0	0
27	1	blend	bao	0	0
28	1	blend	sro	0	0
29	1	blend	zno	0	0
30	1	blend	cri	0	0
31	1	blend	csr	0	0
32	2	coke	vm	0.5	1.5
33	2	coke	fixedCarbon	85	95
34	2	coke	phosphorus	0.01	0.05
35	2	coke	csr	60	75
36	2	coke	m25d	85	95
37	2	coke	ash	8	12
38	2	coke	sulphur	0.4	0.8
39	2	coke	cri	20	30
40	2	coke	m40	80	90
41	2	coke	m10	5	10
42	2	blend	vm	20	30
43	2	blend	fc	50	60
44	2	blend	ash	8	12
45	2	blend	s	0.4	0.8
46	2	blend	p	0.01	0.05
47	2	blend	sio2	3	6
48	2	blend	al2o3	2	4
49	2	blend	fe2o3	1	3
50	2	blend	cao	0.5	2
51	2	blend	mgo	0.2	1
52	2	blend	na2o	0.1	0.3
53	2	blend	k2o	0.1	0.3
54	2	blend	tio2	0.1	0.5
55	2	blend	mn3o4	0.01	0.1
56	2	blend	so3	0.1	0.5
57	2	blend	p2o5	0.01	0.1
58	2	blend	bao	0.01	0.1
59	2	blend	sro	0.01	0.1
60	2	blend	zno	0.01	0.1
61	2	blend	cri	20	30
62	2	blend	csr	60	75
63	3	coke	vm	0.5	1.5
64	3	coke	fixedCarbon	85	95
65	3	coke	phosphorus	0.01	0.05
66	3	coke	csr	60	75
67	3	coke	m25d	85	95
68	3	coke	ash	8	12
69	3	coke	sulphur	0.4	0.8
70	3	coke	cri	20	30
71	3	coke	m40	80	90
72	3	coke	m10	5	10
73	3	blend	vm	20	30
74	3	blend	fc	50	60
75	3	blend	ash	8	12
76	3	blend	s	0.4	0.8
77	3	blend	p	0.01	0.05
78	3	blend	sio2	3	6
79	3	blend	al2o3	2	4
80	3	blend	fe2o3	1	3
81	3	blend	cao	0.5	2
82	3	blend	mgo	0.2	1
83	3	blend	na2o	0.1	0.3
84	3	blend	k2o	0.1	0.3
85	3	blend	tio2	0.1	0.5
86	3	blend	mn3o4	0.01	0.1
87	3	blend	so3	0.1	0.5
88	3	blend	p2o5	0.01	0.1
89	3	blend	bao	0.01	0.1
90	3	blend	sro	0.01	0.1
91	3	blend	zno	0.01	0.1
92	3	blend	cri	20	30
93	3	blend	csr	60	75
94	4	coke	vm	0.5	1.5
95	4	coke	fixedCarbon	85	95
96	4	coke	phosphorus	0.01	0.05
97	4	coke	csr	60	75
98	4	coke	m25d	85	95
99	4	coke	ash	8	12
100	4	coke	sulphur	0.4	0.8
101	4	coke	cri	20	30
102	4	coke	m40	80	90
103	4	coke	m10	5	10
104	4	blend	vm	20	30
105	4	blend	fc	50	60
106	4	blend	ash	8	12
107	4	blend	s	0.4	0.8
108	4	blend	p	0.01	0.05
109	4	blend	sio2	3	6
110	4	blend	al2o3	2	4
111	4	blend	fe2o3	1	3
112	4	blend	cao	0.5	2
113	4	blend	mgo	0.2	1
114	4	blend	na2o	0.1	0.3
115	4	blend	k2o	0.1	0.3
116	4	blend	tio2	0.1	0.5
117	4	blend	mn3o4	0.01	0.1
118	4	blend	so3	0.1	0.5
119	4	blend	p2o5	0.01	0.1
120	4	blend	bao	0.01	0.1
121	4	blend	sro	0.01	0.1
122	4	blend	zno	0.01	0.1
123	4	blend	cri	20	30
124	4	blend	csr	60	75
125	5	coke	vm	0.5	1.5
126	5	coke	fixedCarbon	85	95
127	5	coke	phosphorus	0.01	0.05
128	5	coke	csr	60	75
129	5	coke	m25d	85	95
130	5	coke	ash	8	12
131	5	coke	sulphur	0.4	0.8
132	5	coke	cri	20	30
133	5	coke	m40	80	90
134	5	coke	m10	5	10
135	5	blend	vm	20	30
136	5	blend	fc	50	60
137	5	blend	ash	8	12
138	5	blend	s	0.4	0.8
139	5	blend	p	0.01	0.05
140	5	blend	sio2	3	6
141	5	blend	al2o3	2	4
142	5	blend	fe2o3	1	3
143	5	blend	cao	0.5	2
144	5	blend	mgo	0.2	1
145	5	blend	na2o	0.1	0.3
146	5	blend	k2o	0.1	0.3
147	5	blend	tio2	0.1	0.5
148	5	blend	mn3o4	0.01	0.1
149	5	blend	so3	0.1	0.5
150	5	blend	p2o5	0.01	0.1
151	5	blend	bao	0.01	0.1
152	5	blend	sro	0.01	0.1
153	5	blend	zno	0.01	0.1
154	5	blend	cri	20	30
155	5	blend	csr	60	75
156	6	coke	vm	0.5	1.5
157	6	coke	fixedCarbon	85	95
158	6	coke	phosphorus	0.01	0.05
159	6	coke	csr	60	75
160	6	coke	m25d	85	95
161	6	coke	ash	8	12
162	6	coke	sulphur	0.4	0.8
163	6	coke	cri	20	30
164	6	coke	m40	80	90
165	6	coke	m10	5	10
166	6	blend	vm	20	30
167	6	blend	fc	50	60
168	6	blend	ash	8	12
169	6	blend	s	0.4	0.8
170	6	blend	p	0.01	0.05
171	6	blend	sio2	3	6
172	6	blend	al2o3	2	4
173	6	blend	fe2o3	1	3
174	6	blend	cao	0.5	2
175	6	blend	mgo	0.2	1
176	6	blend	na2o	0.1	0.3
177	6	blend	k2o	0.1	0.3
178	6	blend	tio2	0.1	0.5
179	6	blend	mn3o4	0.01	0.1
180	6	blend	so3	0.1	0.5
181	6	blend	p2o5	0.01	0.1
182	6	blend	bao	0.01	0.1
183	6	blend	sro	0.01	0.1
184	6	blend	zno	0.01	0.1
185	6	blend	cri	20	30
186	6	blend	csr	60	75
187	7	coke	cri	0.5	1.5
188	7	coke	csr	60	75
189	7	coke	vm	0.5	1.5
190	7	coke	ash	0.5	1.5
191	7	blend	vm	20	30
192	7	blend	fc	50	60
193	7	blend	ash	8	12
194	7	blend	csn	0.4	0.8
195	13	coke	cri	0.5	1.5
196	13	coke	csr	60	75
197	13	coke	vm	0.5	1.5
198	13	coke	ash	0.5	1.5
199	13	blend	vm	20	30
200	13	blend	fc	50	60
201	13	blend	ash	8	12
202	13	blend	csn	0.4	0.8
203	14	coke	cri	0.5	1.5
204	14	coke	csr	60	75
205	14	coke	vm	0.5	1.5
206	14	coke	ash	0.5	1.5
207	14	blend	vm	20	30
208	14	blend	fc	50	60
209	14	blend	ash	8	12
210	14	blend	csn	0.4	0.8
211	16	coke	cri	1.5	4.5
212	16	coke	csr	66	79
213	16	coke	vm	1.5	2.5
214	16	coke	ash	2.5	5
215	16	blend	vm	40	60
216	16	blend	fc	20	25
217	16	blend	ash	8	12
218	16	blend	csn	3.4	4.8
219	19	coke	cri	0.5	1.5
220	19	coke	csr	60	75
221	19	coke	vm	0.5	1.5
222	19	coke	ash	0.5	3.5
223	19	blend	vm	20	30
224	19	blend	fc	50	60
225	19	blend	ash	8	12
226	19	blend	csn	0.4	0.8
227	20	coke	cri	0.5	2.5
228	20	coke	csr	60	67
229	20	coke	vm	0.5	1.5
230	20	coke	ash	0.5	1.5
231	20	blend	vm	20	30
232	20	blend	fc	50	60
233	20	blend	ash	8	12
234	20	blend	csn	0.4	0.8
235	21	coke	cri	0.5	1.5
236	21	coke	csr	60	75
237	21	coke	vm	0.5	1.5
238	21	coke	ash	0.5	1.5
239	21	blend	vm	20	30
240	21	blend	fc	50	60
241	21	blend	ash	8	12
242	21	blend	csn	0.4	0.8
243	22	coke	cri	0.5	1.5
244	22	coke	csr	60	75
245	22	coke	vm	0.5	1.5
246	22	coke	ash	0.5	1.5
247	22	blend	vm	20	30
248	22	blend	fc	50	60
249	22	blend	ash	8	12
250	22	blend	csn	0.4	0.8
251	23	coke	cri	0.5	1.5
252	23	coke	csr	60	75
253	23	coke	vm	0.5	1.5
254	23	coke	ash	0.5	1.5
255	23	blend	vm	20	30
256	23	blend	fc	50	60
257	23	blend	ash	8	12
258	23	blend	csn	0.4	0.8
259	24	coke	cri	0.5	1.5
260	24	coke	csr	60	75
261	24	coke	vm	0.5	1.5
262	24	coke	ash	0.5	1.5
263	24	blend	vm	20	30
264	24	blend	fc	50	60
265	24	blend	ash	8	12
266	24	blend	csn	0.4	0.8
267	25	coke	cri	0.5	1.5
268	25	coke	csr	60	75
269	25	coke	vm	0.5	1.5
270	25	coke	ash	0.5	1.5
271	25	blend	vm	20	30
272	25	blend	fc	50	60
273	25	blend	ash	8	12
274	25	blend	csn	0.4	0.8
275	26	coke	cri	0.5	1.5
276	26	coke	csr	60	75
277	26	coke	vm	0.5	1.5
278	26	coke	ash	0.5	1.5
279	26	blend	vm	20	30
280	26	blend	fc	50	60
281	26	blend	ash	8	12
282	26	blend	csn	0.4	0.8
283	27	coke	cri	0.5	1.5
284	27	coke	csr	60	75
285	27	coke	vm	0.5	1.5
286	27	coke	ash	0.5	1.5
287	27	blend	vm	20	30
288	27	blend	fc	50	60
289	27	blend	ash	8	12
290	27	blend	csn	0.4	0.8
291	28	coke	cri	0.5	1.5
292	28	coke	csr	60	75
293	28	coke	vm	0.5	1.5
294	28	coke	ash	0.5	1.5
295	28	blend	vm	20	30
296	28	blend	fc	50	60
297	28	blend	ash	8	12
298	28	blend	csn	0.4	0.8
299	29	coke	cri	0.5	1.5
300	29	coke	csr	60	75
301	29	coke	vm	0.5	1.5
302	29	coke	ash	0.5	1.5
303	29	blend	vm	20	30
304	29	blend	fc	50	60
305	29	blend	ash	8	12
306	29	blend	csn	0.4	0.8
307	30	coke	cri	0.5	1.5
308	30	coke	csr	60	75
309	30	coke	vm	0.5	1.5
310	30	coke	ash	0.5	1.5
311	30	blend	vm	20	30
312	30	blend	fc	50	60
313	30	blend	ash	8	12
314	30	blend	csn	0.4	0.8
315	31	coke	cri	0.5	1.5
316	31	coke	csr	60	75
317	31	coke	vm	0.5	1.5
318	31	coke	ash	0.5	1.5
319	31	blend	vm	20	30
320	31	blend	fc	50	60
321	31	blend	ash	8	12
322	31	blend	csn	0.4	0.8
323	32	coke	cri	0.5	1.5
324	32	coke	csr	60	75
325	32	coke	vm	0.5	1.5
326	32	coke	ash	0.5	1.5
327	32	blend	vm	20	30
328	32	blend	fc	50	60
329	32	blend	ash	8	12
330	32	blend	csn	0.4	0.8
331	33	coke	cri	0.5	1.5
332	33	coke	csr	60	75
333	33	coke	vm	0.5	1.5
334	33	coke	ash	0.5	1.5
335	33	blend	vm	20	30
336	33	blend	fc	50	60
337	33	blend	ash	8	12
338	33	blend	csn	0.4	0.8
339	34	coke	cri	0.5	1.5
340	34	coke	csr	60	75
341	34	coke	vm	0.5	1.5
342	34	coke	ash	0.5	1.5
343	34	blend	vm	20	30
344	34	blend	fc	50	60
345	34	blend	ash	8	12
346	34	blend	csn	0.4	0.8
347	35	coke	cri	0.5	1.5
348	35	coke	csr	60	75
349	35	coke	vm	0.5	1.5
350	35	coke	ash	0.5	1.5
351	35	blend	vm	20	30
352	35	blend	fc	50	60
353	35	blend	ash	8	12
354	35	blend	csn	0.4	0.8
355	36	coke	cri	0.5	1.5
356	36	coke	csr	60	75
357	36	coke	vm	0.5	1.5
358	36	coke	ash	0.5	1.5
359	36	blend	vm	20	30
360	36	blend	fc	50	60
361	36	blend	ash	8	12
362	36	blend	csn	0.4	0.8
363	37	coke	cri	0.5	1.5
364	37	coke	csr	60	75
365	37	coke	vm	0.5	1.5
366	37	coke	ash	0.5	1.5
367	37	blend	vm	20	30
368	37	blend	fc	50	60
369	37	blend	ash	8	12
370	37	blend	csn	0.4	0.8
371	38	coke	cri	0.5	1.5
372	38	coke	csr	60	75
373	38	coke	vm	0.5	1.5
374	38	coke	ash	0.5	1.5
375	38	blend	vm	20	30
376	38	blend	fc	50	60
377	38	blend	ash	8	12
378	38	blend	csn	0.4	0.8
379	39	coke	cri	0.5	1.5
380	39	coke	csr	60	75
381	39	coke	vm	0.5	1.5
382	39	coke	ash	0.5	1.5
383	39	blend	vm	20	30
384	39	blend	fc	50	60
385	39	blend	ash	8	12
386	39	blend	csn	0.4	0.8
387	40	coke	cri	0.5	1.5
388	40	coke	csr	60	75
389	40	coke	vm	0.5	1.5
390	40	coke	ash	0.5	1.5
391	40	blend	vm	20	30
392	40	blend	fc	50	60
393	40	blend	ash	8	12
394	40	blend	csn	0.4	0.8
395	41	coke	cri	0.5	1.5
396	41	coke	csr	60	75
397	41	coke	vm	0.5	1.5
398	41	coke	ash	0.5	1.5
399	41	blend	vm	20	30
400	41	blend	fc	50	60
401	41	blend	ash	8	12
402	41	blend	csn	0.4	0.8
403	42	coke	cri	0.5	1.5
404	42	coke	csr	60	75
405	42	coke	vm	0.5	1.5
406	42	coke	ash	0.5	1.5
407	42	blend	vm	20	30
408	42	blend	fc	50	60
409	42	blend	ash	8	12
410	42	blend	csn	0.4	0.8
411	43	coke	cri	0.5	1.5
412	43	coke	csr	60	75
413	43	coke	vm	0.5	1.5
414	43	coke	ash	0.5	1.5
415	43	blend	vm	20	30
416	43	blend	fc	50	60
417	43	blend	ash	8	12
418	43	blend	csn	0.4	0.8
419	44	coke	cri	0.5	1.5
420	44	coke	csr	60	75
421	44	coke	vm	0.5	1.5
422	44	coke	ash	0.5	1.5
423	44	blend	vm	20	30
424	44	blend	fc	50	60
425	44	blend	ash	8	12
426	44	blend	csn	0.4	0.8
427	45	coke	cri	0.5	1.5
428	45	coke	csr	60	75
429	45	coke	vm	0.5	1.5
430	45	coke	ash	0.5	1.5
431	45	blend	vm	20	30
432	45	blend	fc	50	60
433	45	blend	ash	8	12
434	45	blend	csn	0.4	0.8
435	46	coke	cri	0.5	1.5
436	46	coke	csr	60	75
437	46	coke	vm	0.5	1.5
438	46	coke	ash	0.5	1.5
439	46	blend	vm	20	30
440	46	blend	fc	50	60
441	46	blend	ash	8	12
442	46	blend	csn	0.4	0.8
443	49	coke	cri	0.5	1.5
444	49	coke	csr	60	75
445	49	coke	vm	0.5	1.5
446	49	coke	ash	0.5	1.5
447	49	blend	vm	20	30
448	49	blend	fc	50	60
449	49	blend	ash	8	12
450	49	blend	csn	0.4	0.8
451	50	coke	cri	0.5	1.5
452	50	coke	csr	60	75
453	50	coke	vm	0.5	1.5
454	50	coke	ash	0.5	1.5
455	50	blend	vm	20	30
456	50	blend	fc	50	60
457	50	blend	ash	8	12
458	50	blend	csn	0.4	0.8
459	51	coke	cri	0.5	1.5
460	51	coke	csr	60	75
461	51	coke	vm	0.5	1.5
462	51	coke	ash	0.5	1.5
463	51	blend	vm	20	30
464	51	blend	fc	50	60
465	51	blend	ash	8	12
466	51	blend	csn	0.4	0.8
467	52	coke	cri	0.5	1.5
468	52	coke	csr	60	75
469	52	coke	vm	0.5	1.5
470	52	coke	ash	0.5	1.5
471	52	blend	vm	20	30
472	52	blend	fc	50	60
473	52	blend	ash	8	12
474	52	blend	csn	0.4	0.8
475	53	coke	cri	0.5	1.5
476	53	coke	csr	60	75
477	53	coke	vm	0.5	1.5
478	53	coke	ash	0.5	1.5
479	53	blend	vm	20	30
480	53	blend	fc	50	60
481	53	blend	ash	8	12
482	53	blend	csn	0.4	0.8
483	54	coke	cri	0.5	1.5
484	54	coke	csr	60	75
485	54	coke	vm	0.5	1.5
486	54	coke	ash	0.5	1.5
487	54	blend	vm	20	30
488	54	blend	fc	50	60
489	54	blend	ash	8	12
490	54	blend	csn	0.4	0.8
491	55	coke	cri	0.5	1.5
492	55	coke	csr	60	75
493	55	coke	vm	0.5	1.5
494	55	coke	ash	0.5	1.5
495	55	blend	vm	20	30
496	55	blend	fc	50	60
497	55	blend	ash	8	12
498	55	blend	csn	0.4	0.8
499	56	coke	cri	0.5	1.5
500	56	coke	csr	60	75
501	56	coke	vm	0.5	1.5
502	56	coke	ash	0.5	1.5
503	56	blend	vm	20	30
504	56	blend	fc	50	60
505	56	blend	ash	8	12
506	56	blend	csn	0.4	0.8
507	57	coke	cri	0.5	1.5
508	57	coke	csr	60	75
509	57	coke	vm	0.5	1.5
510	57	coke	ash	0.5	1.5
511	57	blend	vm	20	30
512	57	blend	fc	50	60
513	57	blend	ash	8	12
514	57	blend	csn	0.4	0.8
515	58	coke	cri	0.5	1.5
516	58	coke	csr	60	75
517	58	coke	vm	0.5	1.5
518	58	coke	ash	0.5	1.5
519	58	blend	vm	20	30
520	58	blend	fc	50	60
521	58	blend	ash	8	12
522	58	blend	csn	0.4	0.8
523	59	coke	cri	0.5	1.5
524	59	coke	csr	60	75
525	59	coke	vm	0.5	1.5
526	59	coke	ash	0.5	1.5
527	59	blend	vm	20	30
528	59	blend	fc	50	60
529	59	blend	ash	8	12
530	59	blend	csn	0.4	0.8
531	60	coke	cri	0.5	1.5
532	60	coke	csr	60	75
533	60	coke	vm	0.5	1.5
534	60	coke	ash	0.5	1.5
535	60	blend	vm	20	30
536	60	blend	fc	50	60
537	60	blend	ash	8	12
538	60	blend	csn	0.4	0.8
539	61	coke	cri	0.5	1.5
540	61	coke	csr	60	75
541	61	coke	vm	0.5	1.5
542	61	coke	ash	0.5	1.5
543	61	blend	vm	20	30
544	61	blend	fc	50	60
545	61	blend	ash	8	12
546	61	blend	csn	0.4	0.8
547	62	coke	cri	0.5	1.5
548	62	coke	csr	60	75
549	62	coke	vm	0.5	1.5
550	62	coke	ash	0.5	1.5
551	62	blend	vm	20	30
552	62	blend	fc	50	60
553	62	blend	ash	8	12
554	62	blend	csn	0.4	0.8
555	63	coke	cri	0.5	1.5
556	63	coke	csr	60	75
557	63	coke	vm	0.5	1.5
558	63	coke	ash	0.5	1.5
559	63	blend	vm	20	30
560	63	blend	fc	50	60
561	63	blend	ash	8	12
562	63	blend	csn	0.4	0.8
563	64	coke	cri	0.5	1.5
564	64	coke	csr	60	75
565	64	coke	vm	0.5	1.5
566	64	coke	ash	0.5	1.5
567	64	blend	vm	20	30
568	64	blend	fc	50	60
569	64	blend	ash	8	12
570	64	blend	csn	0.4	0.8
571	65	coke	cri	0.5	1.5
572	65	coke	csr	60	75
573	65	coke	vm	0.5	1.5
574	65	coke	ash	0.5	1.5
575	65	blend	vm	20	30
576	65	blend	fc	50	60
577	65	blend	ash	8	12
578	65	blend	csn	0.4	0.8
579	66	coke	cri	0.5	1.5
580	66	coke	csr	60	75
581	66	coke	vm	0.5	1.5
582	66	coke	ash	0.5	1.5
583	66	blend	vm	20	30
584	66	blend	fc	50	60
585	66	blend	ash	8	12
586	66	blend	csn	0.4	0.8
587	67	coke	cri	0.5	1.5
588	67	coke	csr	60	75
589	67	coke	vm	0.5	1.5
590	67	coke	ash	0.5	1.5
591	67	blend	vm	20	30
592	67	blend	fc	50	60
593	67	blend	ash	8	12
594	67	blend	csn	0.4	0.8
595	68	coke	cri	0.5	1.5
596	68	coke	csr	60	75
597	68	coke	vm	0.5	1.5
598	68	coke	ash	0.5	1.5
599	68	blend	vm	20	30
600	68	blend	fc	50	60
601	68	blend	ash	8	12
602	68	blend	csn	0.4	0.8
603	69	coke	cri	0.5	1.5
604	69	coke	csr	60	75
605	69	coke	vm	0.5	1.5
606	69	coke	ash	0.5	1.5
607	69	blend	vm	20	30
608	69	blend	fc	50	60
609	69	blend	ash	8	12
610	69	blend	csn	0.4	0.8
611	70	coke	cri	0.5	1.5
612	70	coke	csr	60	75
613	70	coke	vm	0.5	1.5
614	70	coke	ash	0.5	1.5
615	70	blend	vm	20	30
616	70	blend	fc	50	60
617	70	blend	ash	8	12
618	70	blend	csn	0.4	0.8
619	71	coke	cri	0.5	1.5
620	71	coke	csr	60	75
621	71	coke	vm	0.5	1.5
622	71	coke	ash	0.5	1.5
623	71	blend	vm	20	30
624	71	blend	fc	50	60
625	71	blend	ash	8	12
626	71	blend	csn	0.4	0.8
627	72	coke	cri	0.5	1.5
628	72	coke	csr	60	75
629	72	coke	vm	0.5	1.5
630	72	coke	ash	0.5	1.5
631	72	blend	vm	20	30
632	72	blend	fc	50	60
633	72	blend	ash	8	12
634	72	blend	csn	0.4	0.8
635	73	coke	cri	0.5	1.5
636	73	coke	csr	60	75
637	73	coke	vm	0.5	1.5
638	73	coke	ash	0.5	1.5
639	73	blend	vm	20	30
640	73	blend	fc	50	60
641	73	blend	ash	8	12
642	73	blend	csn	0.4	0.8
643	74	coke	cri	20	25
644	74	coke	csr	60	75
645	74	coke	vm	0	5
646	74	coke	ash	0.5	1.5
647	74	blend	vm	20	25
648	74	blend	fc	60	70
649	74	blend	ash	10	15
650	74	blend	csn	5	10
651	75	coke	cri	20	25
652	75	coke	csr	60	75
653	75	coke	vm	0.5	1.5
654	75	coke	ash	5	15
655	75	blend	vm	20	30
656	75	blend	fc	60	70
657	75	blend	ash	5	20
658	75	blend	csn	0	10
659	76	coke	cri	0.5	1.5
660	76	coke	csr	60	75
661	76	coke	vm	0.5	1.5
662	76	coke	ash	0.5	1.5
663	76	blend	vm	20	30
664	76	blend	fc	50	60
665	76	blend	ash	8	12
666	76	blend	csn	0.4	0.8
667	77	coke	cri	0.5	1.5
668	77	coke	csr	60	75
669	77	coke	vm	0.5	1.5
670	77	coke	ash	0.5	1.5
671	77	blend	vm	20	30
672	77	blend	fc	50	60
673	77	blend	ash	8	12
674	77	blend	csn	0.4	0.8
675	78	coke	cri	0.5	1.5
676	78	coke	csr	60	75
677	78	coke	vm	0.5	1.5
678	78	coke	ash	0.5	1.5
679	78	blend	vm	20	30
680	78	blend	fc	50	60
681	78	blend	ash	8	12
682	78	blend	csn	0.4	0.8
683	79	coke	cri	0.5	1.5
684	79	coke	csr	60	75
685	79	coke	vm	0.5	1.5
686	79	coke	ash	0.5	1.5
687	79	blend	vm	20	30
688	79	blend	fc	50	60
689	79	blend	ash	8	12
690	79	blend	csn	0.4	0.8
691	80	coke	cri	0.5	1.5
692	80	coke	csr	60	75
693	80	coke	vm	0.5	1.5
694	80	coke	ash	0.5	1.5
695	80	blend	vm	20	30
696	80	blend	fc	50	60
697	80	blend	ash	8	12
698	80	blend	csn	0.4	0.8
699	81	coke	cri	0.5	1.5
700	81	coke	csr	60	75
701	81	coke	vm	0.5	1.5
702	81	coke	ash	0.5	1.5
703	81	blend	vm	20	30
704	81	blend	fc	50	60
705	81	blend	ash	8	12
706	81	blend	csn	0.4	0.8
707	82	coke	cri	0.5	1.5
708	82	coke	csr	60	75
709	82	coke	vm	0.5	1.5
710	82	coke	ash	0.5	1.5
711	82	blend	vm	20	30
712	82	blend	fc	50	60
713	82	blend	ash	8	12
714	82	blend	csn	0.4	0.8
715	83	coke	cri	0.5	1.5
716	83	coke	csr	60	75
717	83	coke	vm	0.5	1.5
718	83	coke	ash	0.5	1.5
719	83	blend	vm	20	30
720	83	blend	fc	50	60
721	83	blend	ash	8	12
722	83	blend	csn	0.4	0.8
723	84	coke	cri	0.5	1.5
724	84	coke	csr	60	75
725	84	coke	vm	0.5	1.5
726	84	coke	ash	0.5	1.5
727	84	blend	vm	20	30
728	84	blend	fc	50	60
729	84	blend	ash	8	12
730	84	blend	csn	0.4	0.8
731	85	coke	cri	0.5	1.5
732	85	coke	csr	60	75
733	85	coke	vm	0.5	1.5
734	85	coke	ash	0.5	1.5
735	85	blend	vm	20	30
736	85	blend	fc	50	60
737	85	blend	ash	8	12
738	85	blend	csn	0.4	0.8
739	86	coke	cri	0.5	1.5
740	86	coke	csr	60	75
741	86	coke	vm	0.5	1.5
742	86	coke	ash	0.5	1.5
743	86	blend	vm	20	30
744	86	blend	fc	50	60
745	86	blend	ash	8	12
746	86	blend	csn	0.4	0.8
747	87	coke	cri	0.5	1.5
748	87	coke	csr	60	75
749	87	coke	vm	0.5	1.5
750	87	coke	ash	0.5	1.5
751	87	blend	vm	20	30
752	87	blend	fc	50	60
753	87	blend	ash	8	12
754	87	blend	csn	0.4	0.8
755	88	coke	cri	0.5	1.5
756	88	coke	csr	60	75
757	88	coke	vm	0.5	1.5
758	88	coke	ash	0.5	1.5
759	88	blend	vm	20	30
760	88	blend	fc	50	60
761	88	blend	ash	8	12
762	88	blend	csn	0.4	0.8
763	89	coke	cri	0.5	1.5
764	89	coke	csr	60	75
765	89	coke	vm	0.5	1.5
766	89	coke	ash	0.5	1.5
767	89	blend	vm	20	30
768	89	blend	fc	50	60
769	89	blend	ash	8	12
770	89	blend	csn	0.4	0.8
771	90	coke	cri	0.5	1.5
772	90	coke	csr	60	75
773	90	coke	vm	0.5	1.5
774	90	coke	ash	0.5	1.5
775	90	blend	vm	20	30
776	90	blend	fc	50	60
777	90	blend	ash	8	12
778	90	blend	csn	0.4	0.8
779	91	coke	cri	0.5	1.5
780	91	coke	csr	60	75
781	91	coke	vm	0.5	1.5
782	91	coke	ash	0.5	1.5
783	91	blend	vm	20	30
784	91	blend	fc	50	60
785	91	blend	ash	8	12
786	91	blend	csn	0.4	0.8
787	92	coke	cri	0.5	1.5
788	92	coke	csr	60	75
789	92	coke	vm	0.5	1.5
790	92	coke	ash	0.5	1.5
791	92	blend	vm	20	30
792	92	blend	fc	50	60
793	92	blend	ash	8	12
794	92	blend	csn	0.4	0.8
795	93	coke	cri	0.5	1.5
796	93	coke	csr	60	75
797	93	coke	vm	0.5	1.5
798	93	coke	ash	0.5	1.5
799	93	blend	vm	20	30
800	93	blend	fc	50	60
801	93	blend	ash	8	12
802	93	blend	csn	0.4	0.8
803	94	coke	cri	0.5	1.5
804	94	coke	csr	60	75
805	94	coke	vm	0.5	1.5
806	94	coke	ash	0.5	1.5
807	94	blend	vm	20	30
808	94	blend	fc	50	60
809	94	blend	ash	8	12
810	94	blend	csn	0.4	0.8
811	95	coke	cri	0.5	1.5
812	95	coke	csr	60	75
813	95	coke	vm	0.5	1.5
814	95	coke	ash	0.5	1.5
815	95	blend	vm	20	30
816	95	blend	fc	50	60
817	95	blend	ash	8	12
818	95	blend	csn	0.4	0.8
819	96	coke	cri	0.5	1.5
820	96	coke	csr	60	75
821	96	coke	vm	0.5	1.5
822	96	coke	ash	0.5	1.5
823	96	blend	vm	20	30
824	96	blend	fc	50	60
825	96	blend	ash	8	12
826	96	blend	csn	0.4	0.8
827	97	coke	cri	0.5	1.5
828	97	coke	csr	60	75
829	97	coke	vm	0.5	1.5
830	97	coke	ash	0.5	1.5
831	97	blend	vm	20	30
832	97	blend	fc	50	60
833	97	blend	ash	8	12
834	97	blend	csn	0.4	0.8
835	98	coke	cri	0.5	1.5
836	98	coke	csr	60	75
837	98	coke	vm	0.5	1.5
838	98	coke	ash	0.5	1.5
839	98	blend	vm	20	30
840	98	blend	fc	50	60
841	98	blend	ash	8	12
842	98	blend	csn	0.4	0.8
843	99	coke	cri	21	23
844	99	coke	csr	65	67
845	99	coke	vm	0	0.8
846	99	coke	ash	12	13.5
847	99	blend	vm	22.5	23.5
848	99	blend	fc	60	70
849	99	blend	ash	8	10
850	99	blend	csn	6.5	7.5
\.


--
-- TOC entry 5163 (class 0 OID 41641)
-- Dependencies: 255
-- Data for Name: simulation_updates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.simulation_updates (id, simulation_id, status, progress, message, "timestamp") FROM stdin;
\.


--
-- TOC entry 5165 (class 0 OID 41649)
-- Dependencies: 257
-- Data for Name: simulations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.simulations (id, scenario_name, scenario_description, generated_date, status, user_id) FROM stdin;
1	test	testing	2025-06-02 14:00:49.282212+05:30	completed	1
2	test	testing	2025-06-02 14:02:57.395182+05:30	completed	1
3	test2	testing2	2025-06-02 14:05:31.407927+05:30	completed	1
4	test4	testing4	2025-06-02 14:14:25.30437+05:30	completed	1
5	test5	testing5	2025-06-02 15:26:42.9355+05:30	completed	1
6	test6	testing 6	2025-06-02 15:32:26.265492+05:30	completed	1
7	test8	testing8	2025-06-09 11:52:36.199413+05:30	completed	1
13	test9	testing9	2025-06-09 12:54:26.968403+05:30	completed	1
14	test10	testing10	2025-06-09 13:33:40.49965+05:30	completed	1
16	test11	testing11	2025-06-09 14:20:32.814127+05:30	completed	1
19	test12	testin12	2025-06-09 16:43:42.632993+05:30	completed	1
20	test13	testing13	2025-06-10 10:53:53.981503+05:30	completed	1
21	test14	testing14	2025-06-10 11:26:40.712161+05:30	completed	1
22	test14	testing14	2025-06-10 11:37:46.492063+05:30	completed	1
23	test15	testin15	2025-06-10 11:43:18.13128+05:30	completed	1
24	test15	testin15	2025-06-10 11:51:25.515285+05:30	completed	1
25	testing16	test16	2025-06-10 11:59:27.760456+05:30	completed	1
26	tes17	tesin17	2025-06-10 12:03:38.910404+05:30	completed	1
27	test17	testin17	2025-06-10 12:10:29.798898+05:30	completed	1
28	test18	testing18	2025-06-10 12:16:33.052443+05:30	completed	1
29	test19	testin19	2025-06-10 12:20:17.732014+05:30	completed	1
30	test20	testing20	2025-06-10 12:26:48.363119+05:30	completed	1
31	test21	testing21	2025-06-10 12:32:06.384369+05:30	completed	1
32	test22	testing22	2025-06-10 12:37:49.152004+05:30	completed	1
33	test23	testing23	2025-06-10 12:42:52.384624+05:30	completed	1
34	test24	testing24	2025-06-10 14:04:12.478607+05:30	completed	1
35	test25	testing25	2025-06-10 14:09:20.067317+05:30	completed	1
36	test26	testing26	2025-06-10 14:16:08.564707+05:30	completed	1
37	test29	testing29	2025-06-10 14:20:52.716225+05:30	completed	1
38	test30	testing30	2025-06-10 14:28:43.033234+05:30	completed	1
39	test31	testing31	2025-06-10 14:41:32.591212+05:30	completed	1
40	test32	testing32	2025-06-10 14:42:32.445678+05:30	completed	1
41	test33	testing33	2025-06-10 14:48:19.089596+05:30	completed	1
42	test33	testing33	2025-06-10 14:56:05.734233+05:30	completed	1
43	test34	testing34	2025-06-10 15:00:17.26719+05:30	completed	1
45	test35	testing35	2025-06-10 15:08:59.988186+05:30	failed	1
44	test35	testing35	2025-06-10 15:08:05.623706+05:30	failed	1
46	test36	testing36	2025-06-10 23:04:50.200256+05:30	failed	1
48	test37	testing37	2025-06-10 23:27:04.095434+05:30	failed	1
47	test37	testing37	2025-06-10 23:25:39.945888+05:30	failed	1
49	testin38	test	2025-06-10 23:28:27.380041+05:30	completed	1
50	test39	testing39	2025-06-10 23:33:58.027516+05:30	completed	1
51	test40	testing40	2025-06-10 23:41:16.712346+05:30	completed	1
52	test41	testing41	2025-06-10 23:45:42.270953+05:30	completed	1
53	test50	testing50	2025-06-10 23:50:27.862946+05:30	failed	1
55	test54	testing54	2025-06-10 23:56:17.505531+05:30	failed	1
54	test54	testing54	2025-06-10 23:53:53.75396+05:30	failed	1
56	test55	testing55	2025-06-10 23:56:48.078431+05:30	completed	1
57	test56	testing56	2025-06-11 00:01:16.690793+05:30	failed	1
58	test59	testing59	2025-06-11 00:04:07.648357+05:30	failed	1
59	test57	testing57	2025-06-11 00:07:34.046537+05:30	failed	1
60	test58	testing58	2025-06-11 00:13:50.621761+05:30	failed	1
61	test60	testing60	2025-06-11 00:15:20.945957+05:30	completed	1
62	test71	testing71	2025-06-11 00:25:48.82903+05:30	completed	1
63	test72	testing72	2025-06-11 00:35:00.360307+05:30	completed	1
64	test73	testing73	2025-06-11 00:46:54.958404+05:30	failed	1
65	test77	testing77	2025-06-12 11:04:43.124538+05:30	failed	1
66	test444	testing444	2025-06-12 11:10:59.043519+05:30	failed	1
67	test123	testing123	2025-06-12 11:18:04.886591+05:30	failed	1
68	test1234	testing1234	2025-06-12 11:33:58.642743+05:30	completed	1
69	test12345	testing12345	2025-06-12 11:44:05.367882+05:30	completed	1
70	test123456	testing123456	2025-06-12 11:55:03.785833+05:30	completed	1
71	test1234567	testing12345678	2025-06-12 12:23:11.592847+05:30	completed	1
72	test998	testing998	2025-06-12 15:25:06.139558+05:30	completed	1
73	test76758	testing6754	2025-06-12 15:35:50.644759+05:30	completed	1
74	real	real	2025-06-12 16:26:13.640197+05:30	completed	1
75	test657	testing56748	2025-06-12 16:48:22.234233+05:30	completed	1
76	testnavin	testing	2025-06-13 14:14:59.449197+05:30	completed	1
77	testnam	testingnam	2025-06-13 14:44:46.957329+05:30	completed	1
78	test90270	testing90270	2025-07-02 11:27:28.95721+05:30	failed	1
79	test1234	testing234	2025-07-02 11:32:52.242458+05:30	completed	1
80	testing123456	testing12345678	2025-07-02 12:24:29.535515+05:30	completed	1
81	test	test	2025-07-02 12:36:43.347056+05:30	completed	1
82	test123	test1234	2025-07-02 12:39:06.969817+05:30	completed	1
83	test	test12	2025-07-08 11:22:54.57296+05:30	completed	4
84	testnavin	helloworld	2025-08-03 01:48:36.283067+05:30	completed	1
85	testing with emission	te	2025-08-06 00:53:37.640359+05:30	failed	1
86	test	test	2025-08-06 01:01:06.459478+05:30	completed	1
87	helo	he	2025-08-06 01:43:01.544294+05:30	completed	1
88	he	hello	2025-08-06 20:48:44.920133+05:30	completed	1
89	test	huu	2025-08-06 20:52:53.963242+05:30	failed	1
90	test	test	2025-08-06 20:58:32.153176+05:30	completed	1
91	hi	hi	2025-08-06 21:11:23.47853+05:30	completed	1
92	test1	test2	2025-08-14 15:23:06.348888+05:30	completed	1
93	hello	hi	2025-08-14 15:45:35.470477+05:30	completed	1
94	test_emissionscore	testing	2025-08-18 18:49:32.253839+05:30	completed	1
95	testing_emission_score	test	2025-08-18 19:01:35.777633+05:30	completed	1
96	r	t	2025-08-18 19:20:51.129225+05:30	completed	1
97	hi	hello	2025-08-19 11:41:44.167029+05:30	completed	1
98	test	testing	2025-09-10 17:30:14.006356+05:30	completed	1
99	ESL	ESL	2025-09-11 15:08:16.784294+05:30	completed	1
\.


--
-- TOC entry 5167 (class 0 OID 41656)
-- Dependencies: 259
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, email, name, hashed_password, is_active, created_at, updated_at) FROM stdin;
1	navinpal512002@gmail.com	navin	$2b$12$pWs4RL7mqlVYJHEbzRdXBe.Yolg4JJoD5g4Q/5VcekHWbWmKcArsi	t	2025-05-24 10:00:47.147393+05:30	\N
2	abhay@gmail.com	abhay	$2b$12$ewJFAW8PVTE4Z6.mHjb8Ee3edAscPKnqTo41Qmh3ny2CHZzxu2ItC	t	2025-05-24 11:32:37.147261+05:30	\N
3	namo@gmail.com	namo	$2b$12$aeY19AFQLcQWxr9NAHNhyOE/LepuDvDqDZ.vdt79YpV.xzH8sdePu	t	2025-05-26 12:26:33.79111+05:30	\N
4	navin@gmail.com	navin	$2b$12$7xsPbBbw7QQXOPbQccNIjeP16ODxsuO409qSOOB3JQI9CKvhWwhXq	t	2025-07-08 11:21:55.48851+05:30	\N
\.


--
-- TOC entry 5170 (class 0 OID 41764)
-- Dependencies: 262
-- Data for Name: vendor_coal_data; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vendor_coal_data (id, coal_name, "IM", "Ash", "VM", "FC", "S", "P", "SiO2", "Al2O3", "Fe2O3", "CaO", "MgO", "Na2O", "K2O", "TiO2", "Mn3O4", "SO3", "P2O5", "BaO", "SrO", "ZnO", "CRI", "CSR", "N", "HGI", "Rank", "Vitrinite", "Liptinite", "Semi_Fusinite", "CSN_FSI", "Initial_Softening_Temp", "MBI", "CBI", "Log_Max_Fluidity", coal_category, "C", "H", "O", ss, "V7", "V8", "V9", "V10", "V11", "V12", "V13", "V14", "V15", "V16", "V17", "V18", "V19", "Inertinite", "Minerals", "MaxFluidity", is_approved, uploaded_at) FROM stdin;
1	Echo Semi Soft Coking Coal	\N	\N	\N	\N	\N	0.015	51.5	24.8	16.7	1.48	0.61	0.31	1.6	1.1	0.08	0.67	0.63	\N	\N	\N	\N	\N	1.23	59	\N	88	\N	\N	4.5	\N	\N	\N	\N	\N	77.6	5.37	9.47	1.03	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.77	2	t	2025-09-14 12:55:13.8804+05:30
\.


--
-- TOC entry 5189 (class 0 OID 0)
-- Dependencies: 226
-- Name: blend_recommendations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.blend_recommendations_id_seq', 149, true);


--
-- TOC entry 5190 (class 0 OID 0)
-- Dependencies: 229
-- Name: coal_blend_ratio_blend_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.coal_blend_ratio_blend_id_seq', 1, false);


--
-- TOC entry 5191 (class 0 OID 0)
-- Dependencies: 233
-- Name: coal_list_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.coal_list_id_seq', 1, false);


--
-- TOC entry 5192 (class 0 OID 0)
-- Dependencies: 235
-- Name: coal_master_model_new_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.coal_master_model_new_id_seq', 1, false);


--
-- TOC entry 5193 (class 0 OID 0)
-- Dependencies: 243
-- Name: mobj_constraints_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mobj_constraints_id_seq', 1, false);


--
-- TOC entry 5194 (class 0 OID 0)
-- Dependencies: 248
-- Name: prediction_output_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.prediction_output_id_seq', 1, false);


--
-- TOC entry 5195 (class 0 OID 0)
-- Dependencies: 250
-- Name: prediction_selection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.prediction_selection_id_seq', 1, false);


--
-- TOC entry 5196 (class 0 OID 0)
-- Dependencies: 252
-- Name: simulationCoalRecommendations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."simulationCoalRecommendations_id_seq"', 155, true);


--
-- TOC entry 5197 (class 0 OID 0)
-- Dependencies: 254
-- Name: simulation_properties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.simulation_properties_id_seq', 850, true);


--
-- TOC entry 5198 (class 0 OID 0)
-- Dependencies: 256
-- Name: simulation_updates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.simulation_updates_id_seq', 1, false);


--
-- TOC entry 5199 (class 0 OID 0)
-- Dependencies: 258
-- Name: simulations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.simulations_id_seq', 99, true);


--
-- TOC entry 5200 (class 0 OID 0)
-- Dependencies: 260
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 4, true);


--
-- TOC entry 5201 (class 0 OID 0)
-- Dependencies: 261
-- Name: vendor_coal_data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vendor_coal_data_id_seq', 1, true);


--
-- TOC entry 4929 (class 2606 OID 41685)
-- Name: blend_recommendation_tracker blend_recommendation_tracker_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blend_recommendation_tracker
    ADD CONSTRAINT blend_recommendation_tracker_pkey PRIMARY KEY (id);


--
-- TOC entry 4931 (class 2606 OID 41687)
-- Name: blend_recommendation_tracker_temp blend_recommendation_tracker_temp_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blend_recommendation_tracker_temp
    ADD CONSTRAINT blend_recommendation_tracker_temp_pkey PRIMARY KEY (id);


--
-- TOC entry 4933 (class 2606 OID 41689)
-- Name: blend_recommendations blend_recommendations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blend_recommendations
    ADD CONSTRAINT blend_recommendations_pkey PRIMARY KEY (id);


--
-- TOC entry 4936 (class 2606 OID 41691)
-- Name: coal_blend_ratio coal_blend_ratio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coal_blend_ratio
    ADD CONSTRAINT coal_blend_ratio_pkey PRIMARY KEY (blend_id);


--
-- TOC entry 4938 (class 2606 OID 41693)
-- Name: coal_blend_standard coal_blend_standard_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coal_blend_standard
    ADD CONSTRAINT coal_blend_standard_pkey PRIMARY KEY (row_name);


--
-- TOC entry 4940 (class 2606 OID 41695)
-- Name: coal_list coal_list_coalno_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coal_list
    ADD CONSTRAINT coal_list_coalno_key UNIQUE (coalno);


--
-- TOC entry 4942 (class 2606 OID 41697)
-- Name: coal_list coal_list_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coal_list
    ADD CONSTRAINT coal_list_pkey PRIMARY KEY (id);


--
-- TOC entry 4944 (class 2606 OID 41699)
-- Name: coal_master_model_new coal_master_model_new_coalno_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coal_master_model_new
    ADD CONSTRAINT coal_master_model_new_coalno_key UNIQUE (coalno);


--
-- TOC entry 4946 (class 2606 OID 41701)
-- Name: coal_master_model_new coal_master_model_new_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coal_master_model_new
    ADD CONSTRAINT coal_master_model_new_pkey PRIMARY KEY (id);


--
-- TOC entry 4948 (class 2606 OID 41703)
-- Name: coal_properties coal_properties_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coal_properties
    ADD CONSTRAINT coal_properties_pkey PRIMARY KEY (coal_name);


--
-- TOC entry 4950 (class 2606 OID 41705)
-- Name: mobj_constraints mobj_constraints_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mobj_constraints
    ADD CONSTRAINT mobj_constraints_pkey PRIMARY KEY (id);


--
-- TOC entry 4952 (class 2606 OID 41707)
-- Name: parameter_ranges parameter_ranges_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parameter_ranges
    ADD CONSTRAINT parameter_ranges_pkey PRIMARY KEY (parameter);


--
-- TOC entry 4954 (class 2606 OID 41709)
-- Name: prediction_output prediction_output_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prediction_output
    ADD CONSTRAINT prediction_output_pkey PRIMARY KEY (id);


--
-- TOC entry 4956 (class 2606 OID 41711)
-- Name: prediction_selection prediction_selection_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prediction_selection
    ADD CONSTRAINT prediction_selection_pkey PRIMARY KEY (id);


--
-- TOC entry 4959 (class 2606 OID 41713)
-- Name: simulationCoalRecommendations simulationCoalRecommendations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."simulationCoalRecommendations"
    ADD CONSTRAINT "simulationCoalRecommendations_pkey" PRIMARY KEY (id);


--
-- TOC entry 4962 (class 2606 OID 41715)
-- Name: simulation_properties simulation_properties_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.simulation_properties
    ADD CONSTRAINT simulation_properties_pkey PRIMARY KEY (id);


--
-- TOC entry 4965 (class 2606 OID 41717)
-- Name: simulation_updates simulation_updates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.simulation_updates
    ADD CONSTRAINT simulation_updates_pkey PRIMARY KEY (id);


--
-- TOC entry 4968 (class 2606 OID 41719)
-- Name: simulations simulations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.simulations
    ADD CONSTRAINT simulations_pkey PRIMARY KEY (id);


--
-- TOC entry 4972 (class 2606 OID 41721)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4974 (class 2606 OID 41770)
-- Name: vendor_coal_data vendor_coal_data_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_coal_data
    ADD CONSTRAINT vendor_coal_data_pkey PRIMARY KEY (id);


--
-- TOC entry 4963 (class 1259 OID 41724)
-- Name: idx_simulation_updates_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_simulation_updates_id ON public.simulation_updates USING btree (id);


--
-- TOC entry 4934 (class 1259 OID 41726)
-- Name: ix_blend_recommendations_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_blend_recommendations_id ON public.blend_recommendations USING btree (id);


--
-- TOC entry 4957 (class 1259 OID 41727)
-- Name: ix_simulationCoalRecommendations_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "ix_simulationCoalRecommendations_id" ON public."simulationCoalRecommendations" USING btree (id);


--
-- TOC entry 4960 (class 1259 OID 41728)
-- Name: ix_simulation_properties_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_simulation_properties_id ON public.simulation_properties USING btree (id);


--
-- TOC entry 4966 (class 1259 OID 41729)
-- Name: ix_simulations_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_simulations_id ON public.simulations USING btree (id);


--
-- TOC entry 4969 (class 1259 OID 41730)
-- Name: ix_users_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ix_users_email ON public.users USING btree (email);


--
-- TOC entry 4970 (class 1259 OID 41731)
-- Name: ix_users_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_users_id ON public.users USING btree (id);


--
-- TOC entry 4975 (class 2606 OID 41732)
-- Name: blend_recommendations blend_recommendations_simulation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blend_recommendations
    ADD CONSTRAINT blend_recommendations_simulation_id_fkey FOREIGN KEY (simulation_id) REFERENCES public.simulations(id);


--
-- TOC entry 4976 (class 2606 OID 41737)
-- Name: simulationCoalRecommendations simulationCoalRecommendations_simulation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."simulationCoalRecommendations"
    ADD CONSTRAINT "simulationCoalRecommendations_simulation_id_fkey" FOREIGN KEY (simulation_id) REFERENCES public.simulations(id);


--
-- TOC entry 4977 (class 2606 OID 41742)
-- Name: simulation_properties simulation_properties_simulation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.simulation_properties
    ADD CONSTRAINT simulation_properties_simulation_id_fkey FOREIGN KEY (simulation_id) REFERENCES public.simulations(id);


--
-- TOC entry 4978 (class 2606 OID 41747)
-- Name: simulation_updates simulation_updates_simulation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.simulation_updates
    ADD CONSTRAINT simulation_updates_simulation_id_fkey FOREIGN KEY (simulation_id) REFERENCES public.simulations(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4979 (class 2606 OID 41752)
-- Name: simulations simulations_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.simulations
    ADD CONSTRAINT simulations_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


-- Completed on 2025-09-14 13:02:21

--
-- PostgreSQL database dump complete
--


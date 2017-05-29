--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.2
-- Dumped by pg_dump version 9.6.2

-- Started on 2017-05-29 00:10:22 ECT

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12467)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2452 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 186 (class 1259 OID 40886)
-- Name: apartado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE apartado (
    id integer NOT NULL,
    nombre text,
    codigo text
);


ALTER TABLE apartado OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 40884)
-- Name: apartado_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE apartado_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE apartado_id_seq OWNER TO postgres;

--
-- TOC entry 2453 (class 0 OID 0)
-- Dependencies: 185
-- Name: apartado_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE apartado_id_seq OWNED BY apartado.id;


--
-- TOC entry 188 (class 1259 OID 40898)
-- Name: apartado_pregunta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE apartado_pregunta (
    id integer NOT NULL,
    apartado integer,
    pregunta integer,
    respuesta integer,
    orden integer,
    estado boolean,
    valor_pregunta numeric(5,2)
);


ALTER TABLE apartado_pregunta OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 40896)
-- Name: apartado_pregunta_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE apartado_pregunta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE apartado_pregunta_id_seq OWNER TO postgres;

--
-- TOC entry 2454 (class 0 OID 0)
-- Dependencies: 187
-- Name: apartado_pregunta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE apartado_pregunta_id_seq OWNED BY apartado_pregunta.id;


--
-- TOC entry 190 (class 1259 OID 40910)
-- Name: ciudad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE ciudad (
    id integer NOT NULL,
    pais integer,
    provincia integer,
    nombre text,
    estado boolean
);


ALTER TABLE ciudad OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 40908)
-- Name: ciudad_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ciudad_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ciudad_id_seq OWNER TO postgres;

--
-- TOC entry 2455 (class 0 OID 0)
-- Dependencies: 189
-- Name: ciudad_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE ciudad_id_seq OWNED BY ciudad.id;


--
-- TOC entry 191 (class 1259 OID 40922)
-- Name: datos_examen; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE datos_examen (
    apartado_pregunta integer NOT NULL,
    examen integer NOT NULL,
    respuesta integer,
    fecha date
);


ALTER TABLE datos_examen OWNER TO postgres;

--
-- TOC entry 193 (class 1259 OID 40932)
-- Name: detalle_examen; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE detalle_examen (
    id integer NOT NULL,
    formulario_apartado integer,
    examen integer,
    valor numeric(5,2)
);


ALTER TABLE detalle_examen OWNER TO postgres;

--
-- TOC entry 192 (class 1259 OID 40930)
-- Name: detalle_examen_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE detalle_examen_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE detalle_examen_id_seq OWNER TO postgres;

--
-- TOC entry 2456 (class 0 OID 0)
-- Dependencies: 192
-- Name: detalle_examen_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE detalle_examen_id_seq OWNED BY detalle_examen.id;


--
-- TOC entry 195 (class 1259 OID 40943)
-- Name: empresa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE empresa (
    id integer NOT NULL,
    ciudad integer,
    tipo_empresa integer,
    nombre text,
    mail text,
    telefono text,
    direccion text
);


ALTER TABLE empresa OWNER TO postgres;

--
-- TOC entry 2457 (class 0 OID 0)
-- Dependencies: 195
-- Name: COLUMN empresa.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN empresa.id IS 'primary key de tabla';


--
-- TOC entry 194 (class 1259 OID 40941)
-- Name: empresa_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE empresa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE empresa_id_seq OWNER TO postgres;

--
-- TOC entry 2458 (class 0 OID 0)
-- Dependencies: 194
-- Name: empresa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE empresa_id_seq OWNED BY empresa.id;


--
-- TOC entry 197 (class 1259 OID 40957)
-- Name: examen; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE examen (
    id integer NOT NULL,
    empresa integer,
    formulario integer,
    fecha date,
    estado boolean,
    codigo text,
    total numeric(5,2)
);


ALTER TABLE examen OWNER TO postgres;

--
-- TOC entry 2459 (class 0 OID 0)
-- Dependencies: 197
-- Name: TABLE examen; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE examen IS 'objeto donde se ingresa respuestas';


--
-- TOC entry 2460 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN examen.empresa; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN examen.empresa IS 'primary key de tabla';


--
-- TOC entry 196 (class 1259 OID 40955)
-- Name: examen_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE examen_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE examen_id_seq OWNER TO postgres;

--
-- TOC entry 2461 (class 0 OID 0)
-- Dependencies: 196
-- Name: examen_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE examen_id_seq OWNED BY examen.id;


--
-- TOC entry 199 (class 1259 OID 40971)
-- Name: formulario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE formulario (
    id integer NOT NULL,
    nombre text,
    descripcion text,
    fecha date,
    codigo text,
    estado boolean,
    anterior integer
);


ALTER TABLE formulario OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 40983)
-- Name: formulario_apartado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE formulario_apartado (
    id integer NOT NULL,
    formulario integer,
    apartado integer,
    orden integer,
    estado boolean,
    valor_apartado numeric(5,2)
);


ALTER TABLE formulario_apartado OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 40981)
-- Name: formulario_apartado_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE formulario_apartado_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE formulario_apartado_id_seq OWNER TO postgres;

--
-- TOC entry 2462 (class 0 OID 0)
-- Dependencies: 200
-- Name: formulario_apartado_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE formulario_apartado_id_seq OWNED BY formulario_apartado.id;


--
-- TOC entry 198 (class 1259 OID 40969)
-- Name: formulario_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE formulario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE formulario_id_seq OWNER TO postgres;

--
-- TOC entry 2463 (class 0 OID 0)
-- Dependencies: 198
-- Name: formulario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE formulario_id_seq OWNED BY formulario.id;


--
-- TOC entry 203 (class 1259 OID 40994)
-- Name: grupo_respuesta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE grupo_respuesta (
    id integer NOT NULL,
    nombre text,
    codigo text
);


ALTER TABLE grupo_respuesta OWNER TO postgres;

--
-- TOC entry 2464 (class 0 OID 0)
-- Dependencies: 203
-- Name: COLUMN grupo_respuesta.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN grupo_respuesta.id IS 'clave primaria de grupo';


--
-- TOC entry 202 (class 1259 OID 40992)
-- Name: grupo_respuesta_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE grupo_respuesta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE grupo_respuesta_id_seq OWNER TO postgres;

--
-- TOC entry 2465 (class 0 OID 0)
-- Dependencies: 202
-- Name: grupo_respuesta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE grupo_respuesta_id_seq OWNED BY grupo_respuesta.id;


--
-- TOC entry 205 (class 1259 OID 41006)
-- Name: pais; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE pais (
    id integer NOT NULL,
    nombre text,
    nacionalidad text,
    estado boolean
);


ALTER TABLE pais OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 41004)
-- Name: pais_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pais_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pais_id_seq OWNER TO postgres;

--
-- TOC entry 2466 (class 0 OID 0)
-- Dependencies: 204
-- Name: pais_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE pais_id_seq OWNED BY pais.id;


--
-- TOC entry 207 (class 1259 OID 41018)
-- Name: pregunta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE pregunta (
    id integer NOT NULL,
    grupo_respuesta integer,
    nombre text NOT NULL,
    codigo text
);


ALTER TABLE pregunta OWNER TO postgres;

--
-- TOC entry 2467 (class 0 OID 0)
-- Dependencies: 207
-- Name: COLUMN pregunta.grupo_respuesta; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN pregunta.grupo_respuesta IS 'clave primaria de grupo';


--
-- TOC entry 206 (class 1259 OID 41016)
-- Name: pregunta_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pregunta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pregunta_id_seq OWNER TO postgres;

--
-- TOC entry 2468 (class 0 OID 0)
-- Dependencies: 206
-- Name: pregunta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE pregunta_id_seq OWNED BY pregunta.id;


--
-- TOC entry 209 (class 1259 OID 41031)
-- Name: provincia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE provincia (
    id integer NOT NULL,
    pais integer,
    nombre text,
    estado boolean
);


ALTER TABLE provincia OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 41029)
-- Name: provincia_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE provincia_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE provincia_id_seq OWNER TO postgres;

--
-- TOC entry 2469 (class 0 OID 0)
-- Dependencies: 208
-- Name: provincia_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE provincia_id_seq OWNED BY provincia.id;


--
-- TOC entry 211 (class 1259 OID 41044)
-- Name: recomendacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE recomendacion (
    id integer NOT NULL,
    formulario integer,
    nombre text,
    descripcion text,
    valor_inicio numeric(4,2),
    valor_fin numeric(4,2)
);


ALTER TABLE recomendacion OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 41057)
-- Name: recomendacion_examen; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE recomendacion_examen (
    id integer NOT NULL,
    recomendacion integer,
    examen integer
);


ALTER TABLE recomendacion_examen OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 41055)
-- Name: recomendacion_examen_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE recomendacion_examen_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE recomendacion_examen_id_seq OWNER TO postgres;

--
-- TOC entry 2470 (class 0 OID 0)
-- Dependencies: 212
-- Name: recomendacion_examen_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE recomendacion_examen_id_seq OWNED BY recomendacion_examen.id;


--
-- TOC entry 210 (class 1259 OID 41042)
-- Name: recomendacion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE recomendacion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE recomendacion_id_seq OWNER TO postgres;

--
-- TOC entry 2471 (class 0 OID 0)
-- Dependencies: 210
-- Name: recomendacion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE recomendacion_id_seq OWNED BY recomendacion.id;


--
-- TOC entry 215 (class 1259 OID 41068)
-- Name: respuesta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE respuesta (
    id integer NOT NULL,
    grupo integer,
    nombre text NOT NULL,
    codigo text
);


ALTER TABLE respuesta OWNER TO postgres;

--
-- TOC entry 2472 (class 0 OID 0)
-- Dependencies: 215
-- Name: COLUMN respuesta.grupo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN respuesta.grupo IS 'clave primaria de grupo';


--
-- TOC entry 214 (class 1259 OID 41066)
-- Name: respuesta_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE respuesta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE respuesta_id_seq OWNER TO postgres;

--
-- TOC entry 2473 (class 0 OID 0)
-- Dependencies: 214
-- Name: respuesta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE respuesta_id_seq OWNED BY respuesta.id;


--
-- TOC entry 217 (class 1259 OID 41081)
-- Name: tipo_empresa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tipo_empresa (
    id integer NOT NULL,
    nombre text,
    descripcion text,
    codigo text,
    estado boolean
);


ALTER TABLE tipo_empresa OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 41079)
-- Name: tipo_empresa_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tipo_empresa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tipo_empresa_id_seq OWNER TO postgres;

--
-- TOC entry 2474 (class 0 OID 0)
-- Dependencies: 216
-- Name: tipo_empresa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tipo_empresa_id_seq OWNED BY tipo_empresa.id;


--
-- TOC entry 2185 (class 2604 OID 40889)
-- Name: apartado id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY apartado ALTER COLUMN id SET DEFAULT nextval('apartado_id_seq'::regclass);


--
-- TOC entry 2186 (class 2604 OID 40901)
-- Name: apartado_pregunta id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY apartado_pregunta ALTER COLUMN id SET DEFAULT nextval('apartado_pregunta_id_seq'::regclass);


--
-- TOC entry 2187 (class 2604 OID 40913)
-- Name: ciudad id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ciudad ALTER COLUMN id SET DEFAULT nextval('ciudad_id_seq'::regclass);


--
-- TOC entry 2188 (class 2604 OID 40935)
-- Name: detalle_examen id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY detalle_examen ALTER COLUMN id SET DEFAULT nextval('detalle_examen_id_seq'::regclass);


--
-- TOC entry 2189 (class 2604 OID 40946)
-- Name: empresa id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY empresa ALTER COLUMN id SET DEFAULT nextval('empresa_id_seq'::regclass);


--
-- TOC entry 2190 (class 2604 OID 40960)
-- Name: examen id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY examen ALTER COLUMN id SET DEFAULT nextval('examen_id_seq'::regclass);


--
-- TOC entry 2191 (class 2604 OID 40974)
-- Name: formulario id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY formulario ALTER COLUMN id SET DEFAULT nextval('formulario_id_seq'::regclass);


--
-- TOC entry 2192 (class 2604 OID 40986)
-- Name: formulario_apartado id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY formulario_apartado ALTER COLUMN id SET DEFAULT nextval('formulario_apartado_id_seq'::regclass);


--
-- TOC entry 2193 (class 2604 OID 40997)
-- Name: grupo_respuesta id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY grupo_respuesta ALTER COLUMN id SET DEFAULT nextval('grupo_respuesta_id_seq'::regclass);


--
-- TOC entry 2194 (class 2604 OID 41009)
-- Name: pais id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pais ALTER COLUMN id SET DEFAULT nextval('pais_id_seq'::regclass);


--
-- TOC entry 2195 (class 2604 OID 41021)
-- Name: pregunta id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pregunta ALTER COLUMN id SET DEFAULT nextval('pregunta_id_seq'::regclass);


--
-- TOC entry 2196 (class 2604 OID 41034)
-- Name: provincia id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY provincia ALTER COLUMN id SET DEFAULT nextval('provincia_id_seq'::regclass);


--
-- TOC entry 2197 (class 2604 OID 41047)
-- Name: recomendacion id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY recomendacion ALTER COLUMN id SET DEFAULT nextval('recomendacion_id_seq'::regclass);


--
-- TOC entry 2198 (class 2604 OID 41060)
-- Name: recomendacion_examen id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY recomendacion_examen ALTER COLUMN id SET DEFAULT nextval('recomendacion_examen_id_seq'::regclass);


--
-- TOC entry 2199 (class 2604 OID 41071)
-- Name: respuesta id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY respuesta ALTER COLUMN id SET DEFAULT nextval('respuesta_id_seq'::regclass);


--
-- TOC entry 2200 (class 2604 OID 41084)
-- Name: tipo_empresa id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tipo_empresa ALTER COLUMN id SET DEFAULT nextval('tipo_empresa_id_seq'::regclass);


--
-- TOC entry 2414 (class 0 OID 40886)
-- Dependencies: 186
-- Data for Name: apartado; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY apartado (id, nombre, codigo) FROM stdin;
1	APARTADO PREVIO	APRPREV
\.


--
-- TOC entry 2475 (class 0 OID 0)
-- Dependencies: 185
-- Name: apartado_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('apartado_id_seq', 1, true);


--
-- TOC entry 2416 (class 0 OID 40898)
-- Dependencies: 188
-- Data for Name: apartado_pregunta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY apartado_pregunta (id, apartado, pregunta, respuesta, orden, estado, valor_pregunta) FROM stdin;
1	1	1	\N	1	t	\N
2	1	2	\N	2	t	\N
3	1	3	\N	3	t	\N
4	1	4	\N	4	t	\N
5	1	5	\N	5	t	\N
\.


--
-- TOC entry 2476 (class 0 OID 0)
-- Dependencies: 187
-- Name: apartado_pregunta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('apartado_pregunta_id_seq', 5, true);


--
-- TOC entry 2418 (class 0 OID 40910)
-- Dependencies: 190
-- Data for Name: ciudad; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ciudad (id, pais, provincia, nombre, estado) FROM stdin;
1	117	1	Cuenca	t
2	117	2	Guaranda	t
3	117	3	Azogues	t
4	117	4	Tulcan	t
5	117	5	Riobamba	t
6	117	6	Latacunga	t
7	117	7	Machala	t
8	117	8	Esmeraldas	t
9	117	9	Puerto Baquerizo Moreno	t
10	117	10	Guayaquil	t
11	117	11	Imbabura	t
12	117	12	Loja	t
13	117	13	Babahoyo	t
14	117	14	Portoviejo	t
15	117	15	Macas	t
16	117	16	Tena	t
17	117	17	Francisco de Orellana	t
18	117	18	Puyo	t
19	117	19	Quito	t
20	117	20	Santa Elena	t
21	117	21	Santo Domingo	t
22	117	22	Nueva Loja	t
23	117	23	Ambato	t
24	117	24	Zamaro	t
\.


--
-- TOC entry 2477 (class 0 OID 0)
-- Dependencies: 189
-- Name: ciudad_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('ciudad_id_seq', 24, true);


--
-- TOC entry 2419 (class 0 OID 40922)
-- Dependencies: 191
-- Data for Name: datos_examen; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY datos_examen (apartado_pregunta, examen, respuesta, fecha) FROM stdin;
\.


--
-- TOC entry 2421 (class 0 OID 40932)
-- Dependencies: 193
-- Data for Name: detalle_examen; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY detalle_examen (id, formulario_apartado, examen, valor) FROM stdin;
\.


--
-- TOC entry 2478 (class 0 OID 0)
-- Dependencies: 192
-- Name: detalle_examen_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('detalle_examen_id_seq', 1, false);


--
-- TOC entry 2423 (class 0 OID 40943)
-- Dependencies: 195
-- Data for Name: empresa; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY empresa (id, ciudad, tipo_empresa, nombre, mail, telefono, direccion) FROM stdin;
\.


--
-- TOC entry 2479 (class 0 OID 0)
-- Dependencies: 194
-- Name: empresa_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('empresa_id_seq', 1, false);


--
-- TOC entry 2425 (class 0 OID 40957)
-- Dependencies: 197
-- Data for Name: examen; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY examen (id, empresa, formulario, fecha, estado, codigo, total) FROM stdin;
\.


--
-- TOC entry 2480 (class 0 OID 0)
-- Dependencies: 196
-- Name: examen_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('examen_id_seq', 1, false);


--
-- TOC entry 2427 (class 0 OID 40971)
-- Dependencies: 199
-- Data for Name: formulario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY formulario (id, nombre, descripcion, fecha, codigo, estado, anterior) FROM stdin;
2	ISO 37001 Sistema de Gestión antisoborno 	FORMULARIO DE ISO 37001 SISTEMA	2017-05-17	ISO37001	t	1
1	FORMULARIO PREVIO 	FORMULARIO DE CONTENIDO PREVIO DE FRAUDE	2017-05-17	FRMPREV01	\N	\N
\.


--
-- TOC entry 2429 (class 0 OID 40983)
-- Dependencies: 201
-- Data for Name: formulario_apartado; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY formulario_apartado (id, formulario, apartado, orden, estado, valor_apartado) FROM stdin;
1	1	1	1	t	\N
\.


--
-- TOC entry 2481 (class 0 OID 0)
-- Dependencies: 200
-- Name: formulario_apartado_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('formulario_apartado_id_seq', 1, true);


--
-- TOC entry 2482 (class 0 OID 0)
-- Dependencies: 198
-- Name: formulario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('formulario_id_seq', 2, true);


--
-- TOC entry 2431 (class 0 OID 40994)
-- Dependencies: 203
-- Data for Name: grupo_respuesta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY grupo_respuesta (id, nombre, codigo) FROM stdin;
1	GRUPO DE PREGUNTAS PREVIAS	GRPPREV
\.


--
-- TOC entry 2483 (class 0 OID 0)
-- Dependencies: 202
-- Name: grupo_respuesta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('grupo_respuesta_id_seq', 1, true);


--
-- TOC entry 2433 (class 0 OID 41006)
-- Dependencies: 205
-- Data for Name: pais; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY pais (id, nombre, nacionalidad, estado) FROM stdin;
1	Australia	AU	t
2	China	CN	t
3	Japan	JP	t
4	Thailand	TH	t
5	India	IN	t
6	Malaysia	MY	t
7	Kore	KR	t
8	Hong Kong	HK	t
9	Taiwan	TW	t
10	Philippines	PH	t
11	Vietnam	VN	t
12	France	FR	t
13	Europe	EU	t
14	Germany	DE	t
15	Sweden	SE	t
16	Italy	IT	t
17	Greece	GR	t
18	Spain	ES	t
19	Austria	AT	t
20	United Kingdom	GB	t
21	Netherlands	NL	t
22	Belgium	BE	t
23	Switzerland	CH	t
24	United Arab Emirates	AE	t
25	Israel	IL	t
26	Ukraine	UA	t
27	Russian Federation	RU	t
28	Kazakhstan	KZ	t
29	Portugal	PT	t
30	Saudi Arabia	SA	t
31	Denmark	DK	t
32	Ira	IR	t
33	Norway	NO	t
34	United States	US	t
35	Mexico	MX	t
36	Canada	CA	t
37	Anonymous Proxy	A1	t
38	Syrian Arab Republic	SY	t
39	Cyprus	CY	t
40	Czech Republic	CZ	t
41	Iraq	IQ	t
42	Turkey	TR	t
43	Romania	RO	t
44	Lebanon	LB	t
45	Hungary	HU	t
46	Georgia	GE	t
47	Brazil	BR	t
48	Azerbaijan	AZ	t
49	Satellite Provider	A2	t
50	Palestinian Territory	PS	t
51	Lithuania	LT	t
52	Oman	OM	t
53	Slovakia	SK	t
54	Serbia	RS	t
55	Finland	FI	t
56	Iceland	IS	t
57	Bulgaria	BG	t
58	Slovenia	SI	t
59	Moldov	MD	t
60	Macedonia	MK	t
61	Liechtenstein	LI	t
62	Jersey	JE	t
63	Poland	PL	t
64	Croatia	HR	t
65	Bosnia and Herzegovina	BA	t
66	Estonia	EE	t
67	Latvia	LV	t
68	Jordan	JO	t
69	Kyrgyzstan	KG	t
70	Reunion	RE	t
71	Ireland	IE	t
72	Libya	LY	t
73	Luxembourg	LU	t
74	Armenia	AM	t
75	Virgin Island	VG	t
76	Yemen	YE	t
77	Belarus	BY	t
78	Gibraltar	GI	t
79	Martinique	MQ	t
80	Panama	PA	t
81	Dominican Republic	DO	t
82	Guam	GU	t
83	Puerto Rico	PR	t
84	Virgin Island	VI	t
85	Mongolia	MN	t
86	New Zealand	NZ	t
87	Singapore	SG	t
88	Indonesia	ID	t
89	Nepal	NP	t
90	Papua New Guinea	PG	t
91	Pakistan	PK	t
92	Asia/Pacific Region	AP	t
93	Bahamas	BS	t
94	Saint Lucia	LC	t
95	Argentina	AR	t
96	Bangladesh	BD	t
97	Tokelau	TK	t
98	Cambodia	KH	t
99	Macau	MO	t
100	Maldives	MV	t
101	Afghanistan	AF	t
102	New Caledonia	NC	t
103	Fiji	FJ	t
104	Wallis and Futuna	WF	t
105	Qatar	QA	t
106	Albania	AL	t
107	Belize	BZ	t
108	Uzbekistan	UZ	t
109	Kuwait	KW	t
110	Montenegro	ME	t
111	Peru	PE	t
112	Bermuda	BM	t
113	Curacao	CW	t
114	Colombia	CO	t
115	Venezuela	VE	t
116	Chile	CL	t
117	Ecuador	EC	t
118	South Africa	ZA	t
119	Isle of Man	IM	t
120	Bolivia	BO	t
121	Guernsey	GG	t
122	Malta	MT	t
123	Tajikistan	TJ	t
124	Seychelles	SC	t
125	Bahrain	BH	t
126	Egypt	EG	t
127	Zimbabwe	ZW	t
128	Liberia	LR	t
129	Kenya	KE	t
130	Ghana	GH	t
131	Nigeria	NG	t
132	Tanzani	TZ	t
133	Zambia	ZM	t
134	Madagascar	MG	t
135	Angola	AO	t
136	Namibia	NA	t
137	Cote D'Ivoire	CI	t
138	Sudan	SD	t
139	Cameroon	CM	t
140	Malawi	MW	t
141	Gabon	GA	t
142	Mali	ML	t
143	Benin	BJ	t
144	Chad	TD	t
145	Botswana	BW	t
146	Cape Verde	CV	t
147	Rwanda	RW	t
148	Congo	CG	t
149	Uganda	UG	t
150	Mozambique	MZ	t
151	Gambia	GM	t
152	Lesotho	LS	t
153	Mauritius	MU	t
154	Morocco	MA	t
155	Algeria	DZ	t
156	Guinea	GN	t
157	Cong	CD	t
158	Swaziland	SZ	t
159	Burkina Faso	BF	t
160	Sierra Leone	SL	t
161	Somalia	SO	t
162	Niger	NE	t
163	Central African Republic	CF	t
164	Togo	TG	t
165	Burundi	BI	t
166	Equatorial Guinea	GQ	t
167	South Sudan	SS	t
168	Senegal	SN	t
169	Mauritania	MR	t
170	Djibouti	DJ	t
171	Comoros	KM	t
172	British Indian Ocean Territory	IO	t
173	Tunisia	TN	t
174	Greenland	GL	t
175	Holy See (Vatican City State)	VA	t
176	Costa Rica	CR	t
177	Cayman Islands	KY	t
178	Jamaica	JM	t
179	Guatemala	GT	t
180	Marshall Islands	MH	t
181	Antarctica	AQ	t
182	Barbados	BB	t
183	Aruba	AW	t
184	Monaco	MC	t
185	Anguilla	AI	t
186	Saint Kitts and Nevis	KN	t
187	Grenada	GD	t
188	Paraguay	PY	t
189	Montserrat	MS	t
190	Turks and Caicos Islands	TC	t
191	Antigua and Barbuda	AG	t
192	Tuvalu	TV	t
193	French Polynesia	PF	t
194	Solomon Islands	SB	t
195	Vanuatu	VU	t
196	Eritrea	ER	t
197	Trinidad and Tobago	TT	t
198	Andorra	AD	t
199	Haiti	HT	t
200	Saint Helena	SH	t
201	Micronesi	FM	t
202	El Salvador	SV	t
203	Honduras	HN	t
204	Uruguay	UY	t
205	Sri Lanka	LK	t
206	Western Sahara	EH	t
207	Christmas Island	CX	t
208	Samoa	WS	t
209	Suriname	SR	t
210	Cook Islands	CK	t
211	Kiribati	KI	t
212	Niue	NU	t
213	Tonga	TO	t
214	French Southern Territories	TF	t
215	Mayotte	YT	t
216	Norfolk Island	NF	t
217	Brunei Darussalam	BN	t
218	Turkmenistan	TM	t
219	Pitcairn Islands	PN	t
220	San Marino	SM	t
221	Aland Islands	AX	t
222	Faroe Islands	FO	t
223	Svalbard and Jan Mayen	SJ	t
224	Cocos (Keeling) Islands	CC	t
225	Nauru	NR	t
226	South Georgia and the South Sandwich Islands	GS	t
227	United States Minor Outlying Islands	UM	t
228	Guinea-Bissau	GW	t
229	Palau	PW	t
230	American Samoa	AS	t
231	Bhutan	BT	t
232	French Guiana	GF	t
233	Guadeloupe	GP	t
234	Saint Martin	MF	t
235	Saint Vincent and the Grenadines	VC	t
236	Saint Pierre and Miquelon	PM	t
237	Saint Barthelemy	BL	t
238	Dominica	DM	t
239	Sao Tome and Principe	ST	t
240	Kore	KP	t
241	Falkland Islands (Malvinas)	FK	t
242	Northern Mariana Islands	MP	t
243	Timor-Leste	TL	t
244	Bonair	BQ	t
245	Myanmar	MM	t
246	Nicaragua	NI	t
247	Sint Maarten (Dutch part)	SX	t
248	Guyana	GY	t
249	Lao People's Democratic Republic	LA	t
250	Cuba	CU	t
251	Ethiopia	ET	t
\.


--
-- TOC entry 2484 (class 0 OID 0)
-- Dependencies: 204
-- Name: pais_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pais_id_seq', 251, true);


--
-- TOC entry 2435 (class 0 OID 41018)
-- Dependencies: 207
-- Data for Name: pregunta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY pregunta (id, grupo_respuesta, nombre, codigo) FROM stdin;
1	1	Tiene la organización, una estructura establecida de gobierno anti-fraude, la cual asigna responsabilidades para investigaciones de fraude IT?	PRE01
2	1	Tiene la organización, políticas establecidas de respuesta ante incidentes de fraude IT?	PRE02
3	1	La organización ha identificado leyes y regulaciones relacionadas al fraude IT en jurisdicciones donde mantiene negocios?	PRE03
4	1	El programa de manejo de fraudes IT de la organización incluye coordinación con auditoría interna?	PRE04
5	1	Tiene la organización, una línea caliente anti-fraude que notifique a los interesados apropiados de sospechas de fraude que involucren recursos IT?	PRE05
\.


--
-- TOC entry 2485 (class 0 OID 0)
-- Dependencies: 206
-- Name: pregunta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pregunta_id_seq', 5, true);


--
-- TOC entry 2437 (class 0 OID 41031)
-- Dependencies: 209
-- Data for Name: provincia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY provincia (id, pais, nombre, estado) FROM stdin;
1	117	Azuay	t
2	117	Bolivar	t
3	117	Cañar	t
4	117	Carchi	t
5	117	Chimborazo	t
6	117	Cotopaxi	t
7	117	El Oro	t
8	117	Esmeraldas	t
9	117	Galápagos	t
10	117	Guayas	t
11	117	Imbabura	t
12	117	Loja	t
13	117	Los Rios	t
14	117	Manabí	t
15	117	Morona Santiago	t
16	117	Napo	t
17	117	Orellana	t
18	117	Pastaza	t
19	117	Pichincha	t
20	117	Santa Elena	t
21	117	Santo Domingo de los Tsáchilas	t
22	117	Sucumbios	t
23	117	Tungurahua	t
24	117	Zamora Chimchipe	t
\.


--
-- TOC entry 2486 (class 0 OID 0)
-- Dependencies: 208
-- Name: provincia_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('provincia_id_seq', 24, true);


--
-- TOC entry 2439 (class 0 OID 41044)
-- Dependencies: 211
-- Data for Name: recomendacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY recomendacion (id, formulario, nombre, descripcion, valor_inicio, valor_fin) FROM stdin;
\.


--
-- TOC entry 2441 (class 0 OID 41057)
-- Dependencies: 213
-- Data for Name: recomendacion_examen; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY recomendacion_examen (id, recomendacion, examen) FROM stdin;
\.


--
-- TOC entry 2487 (class 0 OID 0)
-- Dependencies: 212
-- Name: recomendacion_examen_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('recomendacion_examen_id_seq', 1, false);


--
-- TOC entry 2488 (class 0 OID 0)
-- Dependencies: 210
-- Name: recomendacion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('recomendacion_id_seq', 1, false);


--
-- TOC entry 2443 (class 0 OID 41068)
-- Dependencies: 215
-- Data for Name: respuesta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY respuesta (id, grupo, nombre, codigo) FROM stdin;
1	1	SI	SI
2	1	NO	NO
\.


--
-- TOC entry 2489 (class 0 OID 0)
-- Dependencies: 214
-- Name: respuesta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('respuesta_id_seq', 2, true);


--
-- TOC entry 2445 (class 0 OID 41081)
-- Dependencies: 217
-- Data for Name: tipo_empresa; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tipo_empresa (id, nombre, descripcion, codigo, estado) FROM stdin;
200	Extracción de zinc.	Extracción de zinc.	B0729.01.04	t
201	Extracción de estaño.	Extracción de estaño.	B0729.01.05	t
751	Fabricación de papel cigarrillo.	Fabricación de papel cigarrillo.	C1709.29.05	f
202	Extracción de manganeso.	Extracción de manganeso.	B0729.01.06	t
901	Fabricación de pegamento (colas).	Fabricación de pegamento (colas).	C2029.16.02	f
970	Fabricación de vajillas de plástico.	Fabricación de vajillas de plástico.	C2220.92.01	f
203	Extracción de níquel.	Extracción de níquel.	B0729.01.07	t
86	Producción de leche cruda de vaca.	Producción de leche cruda de vaca.	A0141.02.01	f
1322	Fabricación de grupos electrógenos.	Fabricación de grupos electrógenos.	C2710.13.02	f
87	Producción de semen y embriones bovinos.	Producción de semen y embriones bovinos.	A0141.03.01	f
215	Extracción de yeso.	Extracción de yeso.	B0810.13.01	t
216	Extracción de anhidrita.	Extracción de anhidrita.	B0810.13.02	t
224	Extracción de caolín.	Extracción de caolín.	B0810.23.02	t
1721	Producción de perlas labradas.	Producción de perlas labradas.	C3211.01.01	f
1811	Fabricación de paraguas, sombrillas.	Fabricación de paraguas, sombrillas.	C3290.23.01	f
1891	Operación de canales de riego.	Operación de canales de riego.	E3600.03.01	f
2020	Venta al por mayor de semillas.	Venta al por mayor de semillas.	G4620.11.02	f
2120	Venta al por mayor de juguetes.	Venta al por mayor de juguetes.	G4649.99.02	f
2389	Actividades de guías turísticos.	Actividades de guías turísticos.	H5229.05.01	f
2421	Preparación de comida en puestos de mercados.	Preparación de comida en puestos de mercados.	I5610.03.03	f
232	Extracción de guano.	Extracción de guano.	B0891.06.01	t
431	Conservación en azúcar de otras partes de las plantas.	Conservación en azúcar de otras partes de las plantas.	C1073.22.04	f
1081	Producción de otros productos ferrosos esponjosos.	Producción de otros productos ferrosos esponjosos.	C2410.13.02	f
1303	Fabricación de instrumentos ópticos como: catalejos.	Fabricación de instrumentos ópticos como: catalejos.	C2670.14.02	f
3076	Afinación de pianos.	Afinación de pianos.	S9529.04.02	t
3084	Suministro de pañales.	Suministro de pañales.	S9601.03.02	t
2886	Escuelas de cosmética y de peluquería.	Escuelas de cosmética y de peluquería.	P8522.03.01	f
2906	Actividades de formación religiosa.	Actividades de formación religiosa.	P8549.15.01	f
44	Cultivo de uvas para vino y uvas para ser consumidas como fruta fresca.	Cultivo de uvas para vino y uvas para ser consumidas como fruta fresca.	A0121.00.01	f
45	Cultivo de bananos y plátanos.	Cultivo de bananos y plátanos.	A0122.01.01	f
4	Otros cultivos de cereales n.c.p.: sorgo, cebada, centeno, avena, mijo, etcétera.	Otros cultivos de cereales n.c.p.: sorgo, cebada, centeno, avena, mijo, etcétera.	A0111.19.01	f
8	Otros cultivos le legumbres: habas, garbanzos, vainitas, chocho (altramuces), etcétera.	Otros cultivos le legumbres: habas, garbanzos, vainitas, chocho (altramuces), etcétera.	A0111.29.01	f
9	Cultivo de granos y semillas de soya.	Cultivo de granos y semillas de soya.	A0111.31.01	f
11	Otros cultivos de semillas oleaginosas: semillas de ricino, \r\nsemillas de linaza, semillas de mostaza, semillas de girasol,\r\nsemillas de ajonjolí (sésamo), semillas de colza, semillas de cártamo, semillas de níger, etcétera.	Otros cultivos de semillas oleaginosas: semillas de ricino, semillas de linaza, semillas de mostaza, semillas de girasol,  semillas de ajonjolí (sésamo), semillas de colza, semillas de cártamo, semillas de níger, etcétera.	A0111.39.01	f
12	Cultivo de arroz (incluido el cultivo orgánico y el cultivo de arroz genéticamente modificado).	Cultivo de arroz (incluido el cultivo orgánico y el cultivo de arroz genéticamente modificado).	A0112.00.01	f
13	Cultivo de brócoli, col y coliflor.	Cultivo de brócoli, col y coliflor.	A0113.11.01	f
14	Cultivo de alcachofa y espárrago.	Cultivo de alcachofa y espárrago.	A0113.12.01	f
15	Otros cultivos de hortalizas de hoja o de tallo, espinaca, lechuga, berros, apio, perejil, acelga, etcétera.	Otros cultivos de hortalizas de hoja o de tallo, espinaca, lechuga, berros, apio, perejil, acelga, etcétera.	A0113.19.01	f
16	Cultivo de tomates (excepto tomate de árbol),  pepinillos y similares.	Cultivo de tomates (excepto tomate de árbol),  pepinillos y similares.	A0113.21.01	f
19	Cultivo de zapallo, sambo, etc.	Cultivo de zapallo, sambo, etc.	A0113.29.01	f
20	Cultivo de zuquini, berenjenas, etc.	Cultivo de zuquini, berenjenas, etc.	A0113.29.02	f
21	Cultivo de cebollas paiteñas, cebollas perla, cebollas en rama (puerros), ajos.	Cultivo de cebollas paiteñas, cebollas perla, cebollas en rama (puerros), ajos.	A0113.31.01	f
22	Cultivo de zanahoria amarilla, rábano, remolacha (beteraba), (excepto la remolacha azucarera).	Cultivo de zanahoria amarilla, rábano, remolacha (beteraba), (excepto la remolacha azucarera).	A0113.32.01	f
23	Otros cultivos de hortalizas de raíces bulbosas o tuberosas: papanabo, etcétera.	Otros cultivos de hortalizas de raíces bulbosas o tuberosas: papanabo, etcétera.	A0113.39.01	f
26	Otros cultivos de raíces y tubérculos, camote (batata), melloco, oca, mashua, zanahoria blanca, papa china, etcétera.	Otros cultivos de raíces y tubérculos, camote (batata), melloco, oca, mashua, zanahoria blanca, papa china, etcétera.	A0113.49.01	f
29	Cultivo de semillas vegetales excepto semillas de remolacha.	Cultivo de semillas vegetales excepto semillas de remolacha.	A0113.92.01	f
30	Cultivo de remolacha azucarera.	Cultivo de remolacha azucarera.	A0113.93.01	f
35	Cultivo de yute, kenaf y otras plantas de fibras textiles blandas.	Cultivo de yute, kenaf y otras plantas de fibras textiles blandas.	A0116.02.01	f
37	Cultivo de sisal y otras plantas de fibras textiles del género agave.	Cultivo de sisal y otras plantas de fibras textiles del género agave.	A0116.04.01	f
38	Cultivo de albacá, ramio y otras plantas de fibras textiles.	Cultivo de albacá, ramio y otras plantas de fibras textiles.	A0116.05.01	f
39	Cultivo de otras plantas de fibras.	Cultivo de otras plantas de fibras.	A0116.09.01	f
40	Cultivo de plantas forrajeras: nabos forrajeros, remolacha forrajera, raíces forrajeras, trébol, alfalfa, esparceta, maíz forrajero, kikuyo, raygrás y otras plantas forrajeras.	Cultivo de plantas forrajeras: nabos forrajeros, remolacha forrajera, raíces forrajeras, trébol, alfalfa, esparceta, maíz forrajero, kikuyo, raygrás y otras plantas forrajeras.	A0119.01.01	f
41	Cultivo de semillas de remolacha (exceptuando la remolacha azucarera) y semillas de plantas forrajeras.	Cultivo de semillas de remolacha (exceptuando la remolacha azucarera) y semillas de plantas forrajeras.	A0119.02.01	f
42	Cultivo de flores, incluida la producción de flores cortadas y capullos.	Cultivo de flores, incluida la producción de flores cortadas y capullos.	A0119.03.01	f
43	Producción de semillas de flores.	Producción de semillas de flores.	A0119.04.01	f
3125	SIN ACTIVIDAD ECONOMICA - CIIU	SIN ACTIVIDAD ECONOMICA - CIIU	V0300.00.01	f
49	Otros cultivos de frutas tropicales y subtropicales: papayas, babacos, chamburos, aguacates, higos, arazá, guayabas, guanábana, guaba, chirimoya, naranjillas, zapotes, borojó, tamarindo, granadillas, dátiles, etcétera.	Otros cultivos de frutas tropicales y subtropicales: papayas, babacos, chamburos, aguacates, higos, arazá, guayabas, guanábana, guaba, chirimoya, naranjillas, zapotes, borojó, tamarindo, granadillas, dátiles, etcétera.	A0122.09.01	f
51	Cultivo de mandarinas, clementinas y tangerinas.	Cultivo de mandarinas, clementinas y tangerinas.	A0123.02.01	f
52	Otros cultivos de cítricos, limones, toronjas, limas, etcétera.	Otros cultivos de cítricos, limones, toronjas, limas, etcétera.	A0123.09.01	f
53	Cultivo de manzanas, peras y membrillos.	Cultivo de manzanas, peras y membrillos.	A0124.01.01	f
54	Cultivo de duraznos (melocotones), albaricoques y nectarinas.	Cultivo de duraznos (melocotones), albaricoques y nectarinas.	A0124.02.01	f
55	Otros cultivos de frutas con hueso y con pepa: cerezas, ciruelas, endrinas, capulíes, ovos, claudias, etcétera.	Otros cultivos de frutas con hueso y con pepa: cerezas, ciruelas, endrinas, capulíes, ovos, claudias, etcétera.	A0124.09.01	f
56	Cultivo de bayas grosellas, grosellas espinosas, kiwis, frambuesas, fresas (frutillas), moras, mortiños (arándanos), uvilla y otras bayas.	Cultivo de bayas grosellas, grosellas espinosas, kiwis, frambuesas, fresas (frutillas), moras, mortiños (arándanos), uvilla y otras bayas.	A0125.01.01	f
58	Producción de semillas de frutas.	Producción de semillas de frutas.	A0125.03.01	f
59	Cultivos de nueces comestibles: almendras, anacardos, castañas, avellanas, pistachos, nueces de nogal y otras nueces.	Cultivos de nueces comestibles: almendras, anacardos, castañas, avellanas, pistachos, nueces de nogal y otras nueces.	A0125.04.01	f
60	Otros cultivos de frutos de árboles y arbustos: pitahaya, tuna, algarroba, taxos, etcétera.	Otros cultivos de frutos de árboles y arbustos: pitahaya, tuna, algarroba, taxos, etcétera.	A0125.09.01	f
61	Cultivo de palmas de aceite (palma africana).	Cultivo de palmas de aceite (palma africana).	A0126.01.01	f
62	Otros cultivos de frutos oleaginosos: cocos, aceitunas, etcétera.	Otros cultivos de frutos oleaginosos: cocos, aceitunas, etcétera.	A0126.09.01	f
66	Otros cultivos de plantas con las que se preparan bebidas: mate, etcétera.	Otros cultivos de plantas con las que se preparan bebidas: mate, etcétera.	A0127.09.02	f
67	Cultivo de especias del género capsicum: ajíes, pimientos, etcétera.	Cultivo de especias del género capsicum: ajíes, pimientos, etcétera.	A0128.01.01	f
68	Cultivo de especias perennes y no perennes: nuez moscada, macis, cardamomos, anís, badiana, etc.	Cultivo de especias perennes y no perennes: nuez moscada, macis, cardamomos, anís, badiana, etc.	A0128.02.01	f
69	Cultivo de especias perennes y no perennes: hinojo, pimienta, clavo, jengibre, vainilla, lúpulo, estragón, etcétera.	Cultivo de especias perennes y no perennes: hinojo, pimienta, clavo, jengibre, vainilla, lúpulo, estragón, etcétera.	A0128.02.02	f
70	Cultivo de especias perennes y no perennes: hinojo, pimienta, clavo, jengibre, vainilla, lúpulo, estragón, etcétera.	Cultivo de especias perennes y no perennes: hinojo, pimienta, clavo, jengibre, vainilla, lúpulo, estragón, etcétera.	A0128.02.03	f
71	Cultivo de plantas medicinales, narcóticas o propósitos similares: ortiga, menta, belladona, hierba luisa, manzanilla, guanto, uña de gato, etcétera.	Cultivo de plantas medicinales, narcóticas o propósitos similares: ortiga, menta, belladona, hierba luisa, manzanilla, guanto, uña de gato, etcétera.	A0128.03.01	f
72	Cultivo de plantas medicinales, narcóticas o propósitos similares: orégano, etcétera.	Cultivo de plantas medicinales, narcóticas o propósitos similares: orégano, etcétera.	A0128.03.02	f
73	Cultivo de plantas utilizadas principalmente en perfumería, para la preparación de insecticidas, fungicidas o propósitos similares: ortiga, menta, belladona, hierba luisa, manzanilla, guanto, uña de gato, etcétera.	Cultivo de plantas utilizadas principalmente en perfumería, para la preparación de insecticidas, fungicidas o propósitos similares: ortiga, menta, belladona, hierba luisa, manzanilla, guanto, uña de gato, etcétera.	A0128.03.03	f
74	Cultivo de plantas utilizadas principalmente en perfumería, para la preparación de insecticidas, fungicidas o propósitos similares: orégano, etcétera.	Cultivo de plantas utilizadas principalmente en perfumería, para la preparación de insecticidas, fungicidas o propósitos similares: orégano, etcétera.	A0128.03.04	f
76	Cultivo de materiales vegetales de los tipos utilizados principalmente para trenzar: paja toquilla, totora, bambú, mimbre, etcétera.	Cultivo de materiales vegetales de los tipos utilizados principalmente para trenzar: paja toquilla, totora, bambú, mimbre, etcétera.	A0129.01.01	f
80	Cultivo de árboles para la extracción de savia, árboles de pino, etcétera.	Cultivo de árboles para la extracción de savia, árboles de pino, etcétera.	A0129.09.03	f
81	Explotación de viveros, cultivo de plantas para: plantas vivas para utilizar sus bulbos, tubérculos y raíces; esquejes e injertos; estacas; esporas de hongos, etcétera.	Explotación de viveros, cultivo de plantas para: plantas vivas para utilizar sus bulbos, tubérculos y raíces; esquejes e injertos; estacas; esporas de hongos, etcétera.	A0130.00.01	f
82	Explotación de viveros, cultivo de plantas para: el trasplante incluido césped para trasplante, plantas con fines ornamentales, etc.	Explotación de viveros, cultivo de plantas para: el trasplante incluido césped para trasplante, plantas con fines ornamentales, etc.	A0130.00.02	f
83	Explotación de viveros, cultivo de árboles frutales en viveros.	Explotación de viveros, cultivo de árboles frutales en viveros.	A0130.00.03	f
85	Cría y reproducción de ganado bovino incluido la obtención de pelo y excremento.	Cría y reproducción de ganado bovino incluido la obtención de pelo y excremento.	A0141.01.01	f
50	Cultivo de naranjas.	Cultivo de naranjas.	A0123.01.01	t
88	Cría y reproducción de otro tipo de ganado bovino: búfalos.	Cría y reproducción de otro tipo de ganado bovino: búfalos.	A0141.09.01	f
89	Cría y reproducción de caballos (incluidos caballos de carreras).	Cría y reproducción de caballos (incluidos caballos de carreras).	A0142.01.01	f
90	Cría y reproducción de asnos (burros), mulas y burdéganos.	Cría y reproducción de asnos (burros), mulas y burdéganos.	A0142.02.01	f
91	Cría y reproducción de camélidos: alpaca, llama, vicuña, etcétera incluido la obtención de pelo y excremento.	Cría y reproducción de camélidos: alpaca, llama, vicuña, etcétera incluido la obtención de pelo y excremento.	A0143.00.01	f
92	Cría y reproducción de ovejas.	Cría y reproducción de ovejas.	A0144.01.01	f
93	Cría y reproducción de cabras.	Cría y reproducción de cabras.	A0144.01.02	f
94	Producción de leche cruda de oveja.	Producción de leche cruda de oveja.	A0144.02.01	f
95	Producción de leche cruda de cabra.	Producción de leche cruda de cabra.	A0144.02.02	f
96	Producción de lana cruda y pelo de ovejas y cabras.	Producción de lana cruda y pelo de ovejas y cabras.	A0144.03.01	f
97	Producción de semen y embriones de ovejas y cabras.	Producción de semen y embriones de ovejas y cabras.	A0144.04.01	f
98	Cría y reproducción de cerdos.	Cría y reproducción de cerdos.	A0145.01.01	f
99	Producción de semen y embriones de cerdos.	Producción de semen y embriones de cerdos.	A0145.02.01	f
100	Explotación de criaderos de pollos y reproducción de aves de corral, pollos y gallinas (aves de la especie Gallus Domesticus).	Explotación de criaderos de pollos y reproducción de aves de corral, pollos y gallinas (aves de la especie Gallus Domesticus).	A0146.01.01	f
101	Cría y reproducción de: codornices, patos, ganzos, pavos y gallinas de Guinea.	Cría y reproducción de: codornices, patos, ganzos, pavos y gallinas de Guinea.	A0146.02.01	f
102	Producción de huevos de aves de corral.	Producción de huevos de aves de corral.	A0146.03.01	f
103	Cría y reproducción de avestruces, emúes, palomas, tórtolas y otras aves (excepto aves de corral).	Cría y reproducción de avestruces, emúes, palomas, tórtolas y otras aves (excepto aves de corral).	A0149.10.01	f
104	Cría y reproducción de conejos.	Cría y reproducción de conejos.	A0149.20.01	f
106	Cría y reproducción de insectos.	Cría y reproducción de insectos.	A0149.31.01	f
107	Cría y reproducción de reptiles.	Cría y reproducción de reptiles.	A0149.32.01	f
108	Producción de pieles finas como parte de la explotación pecuaria.	Producción de pieles finas como parte de la explotación pecuaria.	A0149.91.01	f
109	Producción de cueros de reptiles como parte de la explotación pecuaria.	Producción de cueros de reptiles como parte de la explotación pecuaria.	A0149.91.02	f
110	Producción de plumas de aves como parte de la explotación pecuaria.	Producción de plumas de aves como parte de la explotación pecuaria.	A0149.91.03	f
111	Explotación de criaderos de gusanos (lombricultura), moluscos terrestres, caracoles, etcétera.	Explotación de criaderos de gusanos (lombricultura), moluscos terrestres, caracoles, etcétera.	A0149.92.01	f
112	Cría de gusanos de seda, producción de capullos de gusanos de seda.	Cría de gusanos de seda, producción de capullos de gusanos de seda.	A0149.93.01	f
116	Cría y reproducción de animales domésticos (excepto peces): gatos, perros, pájaros, hámsters, etcétera.	Cría y reproducción de animales domésticos (excepto peces): gatos, perros, pájaros, hámsters, etcétera.	A0149.95.01	f
118	Obtención de pelo y excremento de otros animales, n.c.p.	Obtención de pelo y excremento de otros animales, n.c.p.	A0149.97.01	f
119	Producción de pieles mediante actividades de caza ordinaria y con trampa.	Producción de pieles mediante actividades de caza ordinaria y con trampa.	A0149.98.01	f
120	Producción de cueros de reptiles mediante actividades de caza ordinaria y con trampa.	Producción de cueros de reptiles mediante actividades de caza ordinaria y con trampa.	A0149.98.02	f
121	Producción de plumas de aves mediante actividades de caza ordinaria y con trampa.	Producción de plumas de aves mediante actividades de caza ordinaria y con trampa.	A0149.98.03	f
122	Explotación mixta de cultivos y animales sin especialización en ninguna de las actividades. El tamaño del conjunto de la explotación agrícola no es un factor determinante. Si el cultivo de productos agrícolas o la cría de animales representan en una unidad determinada una proporción igual o superior al 66% de los márgenes brutos corrientes, la actividad mixta no debe clasificarse en esta clase, sino entre los cultivos o las actividades de cría de animales.	Explotación mixta de cultivos y animales sin especialización en ninguna de las actividades. El tamaño del conjunto de la explotación agrícola no es un factor determinante. Si el cultivo de productos agrícolas o la cría de animales representan en una unidad determinada una proporción igual o superior al 66% de los márgenes brutos corrientes, la actividad mixta no debe clasificarse en esta clase, sino entre los cultivos o las actividades de cría de animales.	A0150.00.01	f
123	Actividades de transplante de arroz	Actividades de transplante de arroz	A0161.01.01	f
124	Actividades de acondicionamiento y mantenimiento de terrenos para usos agrícolas: plantación o siembra de cultivos y cosecha, poda de árboles frutales y viñas y entresacado de remolacha.	Actividades de acondicionamiento y mantenimiento de terrenos para usos agrícolas: plantación o siembra de cultivos y cosecha, poda de árboles frutales y viñas y entresacado de remolacha.	A0161.01.02	f
125	Actividades de fumigación de cultivos, incluida la fumigación aérea; tratamiento de cultivos, control de plagas (incluidos los conejos); en relación con la agricultura.	Actividades de fumigación de cultivos, incluida la fumigación aérea; tratamiento de cultivos, control de plagas (incluidos los conejos); en relación con la agricultura.	A0161.02.01	f
126	Suministro de maquinaria agrícola con operadores y personal.	Suministro de maquinaria agrícola con operadores y personal.	A0161.03.01	f
127	Manejo de sistemas de riego con fines agrícolas.	Manejo de sistemas de riego con fines agrícolas.	A0161.04.01	f
128	Enfriamiento de fibras vegetales.	Enfriamiento de fibras vegetales.	A0161.05.01	f
113	Apicultura.	Apicultura.	A0149.94.01	t
129	Actividades para mejorar la reproducción, crecimiento y rendimiento de los animales relacionadas con la inseminación artificial, servicios de sementales.	Actividades para mejorar la reproducción, crecimiento y rendimiento de los animales relacionadas con la inseminación artificial, servicios de sementales.	A0162.01.01	f
191	Extracción de minerales estimados principalmente por su contenido en hierro.	Extracción de minerales estimados principalmente por su contenido en hierro.	B0710.01.01	f
130	Servicios de inspección sanitaria, arreo y pasturaje de ganado, capadura de animales, limpieza de gallineros, etcétera.	Servicios de inspección sanitaria, arreo y pasturaje de ganado, capadura de animales, limpieza de gallineros, etcétera.	A0162.02.01	f
131	Actividades de albergue y cuidades de animales de granja	Actividades de albergue y cuidades de animales de granja	A0162.09.01	f
132	Actividades de esquila de ovejas, etc.	Actividades de esquila de ovejas, etc.	A0162.09.02	f
133	Actividades de herradores, desuello de animales, etc.	Actividades de herradores, desuello de animales, etc.	A0162.09.03	f
134	Contratistas de mano de obra para el sector agropecuario.	Contratistas de mano de obra para el sector agropecuario.	A0162.09.04	f
135	Limpieza y clasificación de huevos.	Limpieza y clasificación de huevos.	A0162.09.05	f
136	Actividades de preparación de la cosecha para su comercialización en los mercados primarios: limpieza, recorte, clasificación, desinfección, empacado poscosecha, encerado de frutas.	Actividades de preparación de la cosecha para su comercialización en los mercados primarios: limpieza, recorte, clasificación, desinfección, empacado poscosecha, encerado de frutas.	A0163.01.01	f
137	Otras actividades de Poscosecha: desmotado de algodón.	Otras actividades de Poscosecha: desmotado de algodón.	A0163.09.01	f
138	Otras actividades de Poscosecha: preparación de hojas de tabaco, preparación de cacao y café en grano, secado al sol de frutas y hortalizas.	Otras actividades de Poscosecha: preparación de hojas de tabaco, preparación de cacao y café en grano, secado al sol de frutas y hortalizas.	A0163.09.02	f
139	Actividades poscosecha dirigidas a mejorar la calidad de las semillas para propagación, a través de la eliminación de los materiales que no son semilla, semillas de tamaño inferior al normal, semillas dañadas mecánicamente o por insectos y semillas inmaduras, así como la eliminación de la humedad de las semillas hasta un nivel que permita su almacenamiento seguro. Esta actividad incluye el secado, limpieza, clasificación y tratamiento de semillas hasta su comercialización. Se incluye asi mismo el tratamiento de semillas genéticamente modificadas.	Actividades poscosecha dirigidas a mejorar la calidad de las semillas para propagación, a través de la eliminación de los materiales que no son semilla, semillas de tamaño inferior al normal, semillas dañadas mecánicamente o por insectos y semillas inmaduras, así como la eliminación de la humedad de las semillas hasta un nivel que permita su almacenamiento seguro. Esta actividad incluye el secado, limpieza, clasificación y tratamiento de semillas hasta su comercialización. Se incluye asi mismo el tratamiento de semillas genéticamente modificadas.	A0164.00.01	f
140	Actividades de caza ordinaria y mediante trampas para fines comerciales.	Actividades de caza ordinaria y mediante trampas para fines comerciales.	A0170.01.01	f
141	Captura de animales (vivos o muertos) para carne, producción de pieles incluso pieles finas, cueros (cueros de reptiles), plumas.	Captura de animales (vivos o muertos) para carne, producción de pieles incluso pieles finas, cueros (cueros de reptiles), plumas.	A0170.01.02	f
142	Captura de animales (vivos o muertos) para utilizarlos en la investigación, en zoológicos o como animales domésticos.	Captura de animales (vivos o muertos) para utilizarlos en la investigación, en zoológicos o como animales domésticos.	A0170.01.03	f
143	Captura en tierra de mamíferos marinos, como focas y morsas.	Captura en tierra de mamíferos marinos, como focas y morsas.	A0170.02.01	f
144	Actividades y servicios para promover la caza.	Actividades y servicios para promover la caza.	A0170.03.01	f
145	Explotación de madera en pie : plantación, replante, transplante, aclareo.	Explotación de madera en pie : plantación, replante, transplante, aclareo.	A0210.01.01	f
146	Explotación de viveros forestales	Explotación de viveros forestales	A0210.01.02	f
147	Conservación de bosques y zonas forestadas (Estas actividades pueden ser llevadas a cabo en bosques naturales o en plantaciones forestales).	Conservación de bosques y zonas forestadas (Estas actividades pueden ser llevadas a cabo en bosques naturales o en plantaciones forestales).	A0210.01.03	f
148	Cultivo de monte bajo (arbustos), madera para pasta y para leña (Esta actividad puede ser llevada a cabo en bosques naturales o en plantaciones forestales).	Cultivo de monte bajo (arbustos), madera para pasta y para leña (Esta actividad puede ser llevada a cabo en bosques naturales o en plantaciones forestales).	A0210.02.01	f
149	OTROS CULTIVOS DE ESPECIALIDADES HORTICOLAS.	OTROS CULTIVOS DE ESPECIALIDADES HORTICOLAS.	A0210.02.02	f
150	Producción de madera en bruto (rollos) para las industrias manufactureras que utilizan productos forestales, chonta, balsa, ciprés, pino, etcétera.	Producción de madera en bruto (rollos) para las industrias manufactureras que utilizan productos forestales, chonta, balsa, ciprés, pino, etcétera.	A0220.01.01	f
151	Producción de madera en bruto (rollos) utilizada en forma no procesada como puntales, estacas, cercas, etcétera.	Producción de madera en bruto (rollos) utilizada en forma no procesada como puntales, estacas, cercas, etcétera.	A0220.02.01	f
152	Actividades de recolección y producción de leña.	Actividades de recolección y producción de leña.	A0220.03.01	f
153	Recolección de materiales silvestres: hongos, trufas, bayas, nueces, balata y otras gomas similares al caucho, corcho, goma laca y resinas, bálsamos, crin vegetal, crin marina (zostera), bellotas y castañas de indias, musgos y líquenes, etcétera.	Recolección de materiales silvestres: hongos, trufas, bayas, nueces, balata y otras gomas similares al caucho, corcho, goma laca y resinas, bálsamos, crin vegetal, crin marina (zostera), bellotas y castañas de indias, musgos y líquenes, etcétera.	A0230.00.01	f
154	Actividades de inventarios forestales y evaluación de existencias maderables, lucha contra plagas forestales y servicios de consultoría de gestión forestal.	Actividades de inventarios forestales y evaluación de existencias maderables, lucha contra plagas forestales y servicios de consultoría de gestión forestal.	A0240.01.01	f
155	Actividades de extinción y prevención de incendios forestales.	Actividades de extinción y prevención de incendios forestales.	A0240.02.01	f
156	Transporte de troncos dentro del bosque.	Transporte de troncos dentro del bosque.	A0240.03.01	f
31	Cultivo de otras hortalizas.	Cultivo de otras hortalizas.	A0113.99.01	t
157	Planificación, diseño, cuidado, instalación y conservacion de prados y jardines.	Planificación, diseño, cuidado, instalación y conservacion de prados y jardines.	A0240.04.01	f
158	Actividades fitosanitarias para el cuidado de árboles y arbustos ornamentales.	Actividades fitosanitarias para el cuidado de árboles y arbustos ornamentales.	A0240.05.01	f
159	Actividades de servicios de corta.	Actividades de servicios de corta.	A0240.06.01	f
192	Beneficio y aglomeración de minerales de hierro.	Beneficio y aglomeración de minerales de hierro.	B0710.02.01	f
160	Actividades de pesca de altura y costera: extracción de peces, crustáceos y moluscos marinos, tortugas, erizos de mar, ascidias y otros tunicados, etcétera.	Actividades de pesca de altura y costera: extracción de peces, crustáceos y moluscos marinos, tortugas, erizos de mar, ascidias y otros tunicados, etcétera.	A0311.01.01	f
161	Actividades de captura de ballenas.	Actividades de captura de ballenas.	A0311.02.01	f
162	Actividades de buques dedicados tanto a la pesca marina como a la preparación y conservación de pescado.	Actividades de buques dedicados tanto a la pesca marina como a la preparación y conservación de pescado.	A0311.03.01	f
163	Actividades de buques dedicados tanto a la pesca marina como a la preparación y conservación de crustáceos.	Actividades de buques dedicados tanto a la pesca marina como a la preparación y conservación de crustáceos.	A0311.04.01	f
164	Actividades de buques dedicados tanto a la pesca marina como a la preparación y conservación de moluscos.	Actividades de buques dedicados tanto a la pesca marina como a la preparación y conservación de moluscos.	A0311.05.01	f
165	Recolección de otros materiales y organismos marinos: perlas naturales, esponjas, corales y algas.	Recolección de otros materiales y organismos marinos: perlas naturales, esponjas, corales y algas.	A0311.09.01	f
166	Pesca en aguas interiores, extracción de peces, crustáceos y moluscos de agua dulce.	Pesca en aguas interiores, extracción de peces, crustáceos y moluscos de agua dulce.	A0312.01.01	f
167	Recolección de materiales de agua dulce.	Recolección de materiales de agua dulce.	A0312.02.01	f
168	Actividades de acuicultura en agua del mar o en tanques de agua salada: cría de peces incluido la cria de peces ornamentales marinos.	Actividades de acuicultura en agua del mar o en tanques de agua salada: cría de peces incluido la cria de peces ornamentales marinos.	A0321.01.01	f
169	Explotación de criaderos de camarones (camaroneras), criaderos de larvas  de camarón (laboratorios de larvas de camarón).	Explotación de criaderos de camarones (camaroneras), criaderos de larvas  de camarón (laboratorios de larvas de camarón).	A0321.02.01	f
170	Producción de larvas de bivalvos.	Producción de larvas de bivalvos.	A0321.03.01	f
171	Producción de ostras, mejillones, etc.	Producción de ostras, mejillones, etc.	A0321.03.02	f
172	Producción de langostas y langostinos, etc.	Producción de langostas y langostinos, etc.	A0321.03.03	f
173	Producción de alevines y jaramugos.	Producción de alevines y jaramugos.	A0321.03.04	f
174	Actividades de cultivo ostras para obtener perlas	Actividades de cultivo ostras para obtener perlas	A0321.04.01	f
175	Actividades de cultivo de laver y otras algas comestibles.	Actividades de cultivo de laver y otras algas comestibles.	A0321.04.02	f
176	Cría y explotación de criaderos de peces (de agua dulce) incluido peces ornamentales, truchas, tilapias, etcétera.	Cría y explotación de criaderos de peces (de agua dulce) incluido peces ornamentales, truchas, tilapias, etcétera.	A0322.01.01	f
177	Cría de crustáceos, bivalvos, moluscos y otros animales acuáticos de agua dulce.	Cría de crustáceos, bivalvos, moluscos y otros animales acuáticos de agua dulce.	A0322.02.01	f
179	Actividades de tipo servicio relacionadas con la pesca de mar y de agua dulce y con criaderos de peces y granjas piscícolas.	Actividades de tipo servicio relacionadas con la pesca de mar y de agua dulce y con criaderos de peces y granjas piscícolas.	A0322.04.01	f
180	Actividades de tipo servicio relacionadas con criaderos de peces y granjas piscícolas.	Actividades de tipo servicio relacionadas con criaderos de peces y granjas piscícolas.	A0322.05.01	f
181	Actividades de extracción de carbón de piedra en minas, incluyendo la extracción a través de métodos de licuefacción, recuperación de carbón de piedra de escombreras, limpieza, cribado, clasificación, pulverización, compresión, etcétera; del carbón para clasificarlo, mejorar su calidad o facilitar su transporte o almacenamiento.	Actividades de extracción de carbón de piedra en minas, incluyendo la extracción a través de métodos de licuefacción, recuperación de carbón de piedra de escombreras, limpieza, cribado, clasificación, pulverización, compresión, etcétera; del carbón para clasificarlo, mejorar su calidad o facilitar su transporte o almacenamiento.	B0510.00.01	f
182	Actividades de extracción de antracita	Actividades de extracción de antracita	B0511.00.01	f
183	Actividades de extracción de hulla	Actividades de extracción de hulla	B0512.00.01	f
184	Actividades de extracción de carbones bituminosos.	Actividades de extracción de carbones bituminosos.	B0512.00.02	f
185	Actividades de extracción de otros tipos de carbón mineral.	Actividades de extracción de otros tipos de carbón mineral.	B0513.00.01	f
186	Extracción de lignito (carbón pardo) en minas, incluyendo la extracción a través de métodos de licuefacción, actividades de limpieza, deshidratación, pulverización, compresión, etcétera; de lignito para mejorar su calidad o facilitar su transporte o almacenamiento.	Extracción de lignito (carbón pardo) en minas, incluyendo la extracción a través de métodos de licuefacción, actividades de limpieza, deshidratación, pulverización, compresión, etcétera; de lignito para mejorar su calidad o facilitar su transporte o almacenamiento.	B0520.00.01	f
187	Extracción de aceites crudos de petróleo, esquistos bituminosos y arenas alquitranadas, producción de petróleo crudo de esquistos y arenas bituminosas, procesos de obtención de crudos: decantación, desalado, deshidratación, estabilización, etcétera.	Extracción de aceites crudos de petróleo, esquistos bituminosos y arenas alquitranadas, producción de petróleo crudo de esquistos y arenas bituminosas, procesos de obtención de crudos: decantación, desalado, deshidratación, estabilización, etcétera.	B0610.00.01	f
188	Producción de hidrocarburos crudos en estado gaseoso (gas natural), extracción de condensados, drenaje y separación de las fracciones líquidas, desulfurización de gas.	Producción de hidrocarburos crudos en estado gaseoso (gas natural), extracción de condensados, drenaje y separación de las fracciones líquidas, desulfurización de gas.	B0620.01.01	f
178	Cría de ranas.	Cría de ranas.	A0322.03.01	t
189	Producción de hidrocarburos crudos en estado gaseoso (gas natural), extracción de condensados, drenaje y separación de las fracciones líquidas, desulfurización de gas.	Producción de hidrocarburos crudos en estado gaseoso (gas natural), extracción de condensados, drenaje y separación de las fracciones líquidas, desulfurización de gas.	B0620.01.01	f
190	Extracción de hidrocarburos líquidos, obtenidos a través de licuefacción o pirolisis.	Extracción de hidrocarburos líquidos, obtenidos a través de licuefacción o pirolisis.	B0620.02.01	f
193	Producción de minerales de hierro sinterizados.	Producción de minerales de hierro sinterizados.	B0710.03.01	f
194	Extracción de minerales estimados principalmente por su contenido de uranio y torio: pecblenda, óxido natural de uranio, etcétera.	Extracción de minerales estimados principalmente por su contenido de uranio y torio: pecblenda, óxido natural de uranio, etcétera.	B0721.00.01	f
195	 Concentración de uranio y torio, producción de torta amarilla (concentrado de uranio).	 Concentración de uranio y torio, producción de torta amarilla (concentrado de uranio).	B0721.00.02	f
196	Extracción de metal de uranio a partir de la pecblenda u otros minerales que contienen uranio.	Extracción de metal de uranio a partir de la pecblenda u otros minerales que contienen uranio.	B0722.00.01	f
204	Extracción de cobalto, molibdeno, tántalo, etc.	Extracción de cobalto, molibdeno, tántalo, etc.	B0729.01.08	f
205	Extracción de vanadio, cromo, tungsteno, etc.	Extracción de vanadio, cromo, tungsteno, etc.	B0729.01.09	f
206	Extracción de metales preciosos: oro.	Extracción de metales preciosos: oro.	B0729.02.01	f
207	Extracción de metales preciosos: plata.	Extracción de metales preciosos: plata.	B0729.02.02	f
208	Extracción de metales preciosos: platino.	Extracción de metales preciosos: platino.	B0729.02.03	f
209	Extracción, talla sin labrar y aserrado de piedra de construcción, granito.	Extracción, talla sin labrar y aserrado de piedra de construcción, granito.	B0810.11.01	f
210	Extracción, talla sin labrar y aserrado de piedra de construcción, como mármol.	Extracción, talla sin labrar y aserrado de piedra de construcción, como mármol.	B0810.11.02	f
211	Extracción, talla sin labrar y aserrado de piedra de construcción, como pizarra.	Extracción, talla sin labrar y aserrado de piedra de construcción, como pizarra.	B0810.11.03	f
212	Extracción, talla sin labrar y aserrado de piedra de construcción, como arenisca.	Extracción, talla sin labrar y aserrado de piedra de construcción, como arenisca.	B0810.11.04	f
213	Extracción de piedra caliza, para utilizarla en la fabricación de cal o cemento.	Extracción de piedra caliza, para utilizarla en la fabricación de cal o cemento.	B0810.12.01	f
214	Trituración y fragmentación de piedra caliza, para utilizarla en la fabricación de cal o cemento.	Trituración y fragmentación de piedra caliza, para utilizarla en la fabricación de cal o cemento.	B0810.12.02	f
217	Extracción de creta y dolomita sin calcinar.	Extracción de creta y dolomita sin calcinar.	B0810.14.01	f
218	Extracción y dragado de arenas para la industria, arenas para la construcción, grava (ripio) y gravilla.	Extracción y dragado de arenas para la industria, arenas para la construcción, grava (ripio) y gravilla.	B0810.21.01	f
219	Extracción de arena de silice.	Extracción de arena de silice.	B0810.21.02	f
220	Extracción de arena de cuarzo.	Extracción de arena de cuarzo.	B0810.21.03	f
221	Explotación de depósitos de arenas alquitranadas o esquistos bituminosos.	Explotación de depósitos de arenas alquitranadas o esquistos bituminosos.	B0810.21.04	f
222	Fragmentación y trituración de piedra, grava (ripio), gravilla y arena, para la construcción.	Fragmentación y trituración de piedra, grava (ripio), gravilla y arena, para la construcción.	B0810.22.01	f
223	Extracción de arcillas, arcillas refractarias.	Extracción de arcillas, arcillas refractarias.	B0810.23.01	f
225	Extracción de fosfatos y sales de potasio naturales.	Extracción de fosfatos y sales de potasio naturales.	B0891.01.01	f
226	Extracción de azufre natural (nativo).	Extracción de azufre natural (nativo).	B0891.02.01	f
227	Extracción y preparación de pirita y pirrotina, excepto el tostado de pirita y pirrotina.	Extracción y preparación de pirita y pirrotina, excepto el tostado de pirita y pirrotina.	B0891.03.01	f
228	Extracción de bario naturales (baritina y witherita).	Extracción de bario naturales (baritina y witherita).	B0891.04.01	f
229	Extracción de boratos naturales.	Extracción de boratos naturales.	B0891.04.02	f
230	Extracción de sulfato de magnesio naturales (kieserita) y carbonato.	Extracción de sulfato de magnesio naturales (kieserita) y carbonato.	B0891.04.03	f
231	Extracción de tierras colorantes, espatoflúor y otros minerales estimados principalmente como fuente de sustancias químicas.	Extracción de tierras colorantes, espatoflúor y otros minerales estimados principalmente como fuente de sustancias químicas.	B0891.05.01	f
235	Aglomeración, preparación de turba para mejorar su calidad, facilitar su transporte o almacenamiento.	Aglomeración, preparación de turba para mejorar su calidad, facilitar su transporte o almacenamiento.	B0892.01.01	f
236	Extracción de sal en yacimientos subterráneos, incluso mediante disolución y bombeo.	Extracción de sal en yacimientos subterráneos, incluso mediante disolución y bombeo.	B0893.01.01	f
237	Producción de sal mediante evaporación al sol de agua de mar y otras aguas salinas.	Producción de sal mediante evaporación al sol de agua de mar y otras aguas salinas.	B0893.02.01	f
197	Extracción de aluminio.	Extracción de aluminio.	B0729.01.01	t
238	Trituración, purificación y refinado de la sal por el productor.	Trituración, purificación y refinado de la sal por el productor.	B0893.03.01	f
239	Extracción de bitumen natural sólido.	Extracción de bitumen natural sólido.	B0899.01.01	f
240	Extracción de asfalto natural, asfaltitas y roca asfáltica.	Extracción de asfalto natural, asfaltitas y roca asfáltica.	B0899.01.02	f
241	Extracción de piedras preciosas.	Extracción de piedras preciosas.	B0899.02.01	f
242	Extracción de piedras semipreciosas.	Extracción de piedras semipreciosas.	B0899.02.02	f
245	Extracción de mica, gema, etc.	Extracción de mica, gema, etc.	B0899.02.05	f
246	Extracción de grafito natural.	Extracción de grafito natural.	B0899.03.01	f
247	Extracción de corindón, piedra pómez, esmeril, etc.	Extracción de corindón, piedra pómez, esmeril, etc.	B0899.03.02	f
249	Extracción de antimonio, magnesita, esteatita (talco), etc.	Extracción de antimonio, magnesita, esteatita (talco), etc.	B0899.09.01	f
250	Extracción de peolita, vermiculita, clorita, etc.	Extracción de peolita, vermiculita, clorita, etc.	B0899.09.02	f
252	Extracción de fósiles silíceos, etc.	Extracción de fósiles silíceos, etc.	B0899.09.04	f
253	Extracción de otros fundentes naturales, leucita, nefelina, sienita nefilimica.	Extracción de otros fundentes naturales, leucita, nefelina, sienita nefilimica.	B0899.10.01	f
254	Actividades de servicios de extracción de petróleo y gas realizadas a cambio de una retribución o por contrato: sondeos, exploración (por ejemplo: métodos tradicionales de prospección, como observaciones geológicas en posibles yacimientos).	Actividades de servicios de extracción de petróleo y gas realizadas a cambio de una retribución o por contrato: sondeos, exploración (por ejemplo: métodos tradicionales de prospección, como observaciones geológicas en posibles yacimientos).	B0910.01.01	f
255	Actividades de servicios de perforación dirigida y reperforación.	Actividades de servicios de perforación dirigida y reperforación.	B0910.01.02	f
256	Actividades de servicios de perforación inicial.	Actividades de servicios de perforación inicial.	B0910.01.03	f
257	Actividades de servicios de erección, reparación y desmantelamiento de torres de perforación.	Actividades de servicios de erección, reparación y desmantelamiento de torres de perforación.	B0910.01.04	f
258	Actividades de servicios de cementación de tubos de encamisado de los pozos de petróleo y gas, bombeo, taponamiento y abandono de pozos, etcétera.	Actividades de servicios de cementación de tubos de encamisado de los pozos de petróleo y gas, bombeo, taponamiento y abandono de pozos, etcétera.	B0910.01.05	f
259	Actividades de servicios de licuefacción y regasificación de gas natural para su transporte, realizadas en el lugar de extracción; drenaje y bombeo.	Actividades de servicios de licuefacción y regasificación de gas natural para su transporte, realizadas en el lugar de extracción; drenaje y bombeo.	B0910.01.06	f
260	Servicios de prevención y extinción de incendios en campos de petróleo y gas.	Servicios de prevención y extinción de incendios en campos de petróleo y gas.	B0910.02.01	f
261	Servicios de apoyo a cambio de una retribución o por contrato, requeridas para la extracción de carbón de piedra, lignito y turba: exploración (por ejemplo: métodos de prospección tradicionales, como recogida de muestras y realización de observaciones geológicas en posibles yacimientos); perforaciones de prueba y sondeos; drenaje y bombeo.	Servicios de apoyo a cambio de una retribución o por contrato, requeridas para la extracción de carbón de piedra, lignito y turba: exploración (por ejemplo: métodos de prospección tradicionales, como recogida de muestras y realización de observaciones geológicas en posibles yacimientos); perforaciones de prueba y sondeos; drenaje y bombeo.	B0990.01.01	f
262	Servicios de apoyo a cambio de una retribución o por contrato, requeridas para la extracción de minerales metalíferos: perforaciones de prueba y sondeos, exploración (por ejemplo: métodos de prospección tradicionales, como recogida de muestras y realización de observaciones geológicas en posibles yacimientos; drenaje y bombeo.	Servicios de apoyo a cambio de una retribución o por contrato, requeridas para la extracción de minerales metalíferos: perforaciones de prueba y sondeos, exploración (por ejemplo: métodos de prospección tradicionales, como recogida de muestras y realización de observaciones geológicas en posibles yacimientos; drenaje y bombeo.	B0990.02.01	f
263	Servicios de gasificación del carbón in situ, para obtener productos tales como el metano.	Servicios de gasificación del carbón in situ, para obtener productos tales como el metano.	B0990.03.01	f
264	Operaciones mineras de limpieza, cribado, clasificación, pulverización u otras actividades para mejorar la calidad y facilitar el transporte.	Operaciones mineras de limpieza, cribado, clasificación, pulverización u otras actividades para mejorar la calidad y facilitar el transporte.	B0990.04.01	f
265	Lavado, deshidratación, pulverización u otras operaciones para mejorar la calidad de la aglomeración de lignito y facilitar el transporte o almacenamiento.	Lavado, deshidratación, pulverización u otras operaciones para mejorar la calidad de la aglomeración de lignito y facilitar el transporte o almacenamiento.	B0990.05.01	f
266	Servicios de apoyo a cambio de una retribución o por contrato, requeridas para la explotación de otras minas y canteras: perforaciones de prueba y sondeos, exploración (por ejemplo: métodos de prospección tradicionales, como recogida de muestras y realización de observaciones geológicas en posibles yacimientos); drenaje y bombeo.	Servicios de apoyo a cambio de una retribución o por contrato, requeridas para la explotación de otras minas y canteras: perforaciones de prueba y sondeos, exploración (por ejemplo: métodos de prospección tradicionales, como recogida de muestras y realización de observaciones geológicas en posibles yacimientos); drenaje y bombeo.	B0990.09.01	f
267	Explotación de mataderos que realizan actividades de sacrificio, faenamiento, preparación, producción y empacado de carne fresca refrigerada o congelada en canales o piezas o porciones individuales de: bovino.	Explotación de mataderos que realizan actividades de sacrificio, faenamiento, preparación, producción y empacado de carne fresca refrigerada o congelada en canales o piezas o porciones individuales de: bovino.	C1010.11.01	f
298	Actividades de buques-factoría que se dedican a la pesca y a la conservación de pescado.	Actividades de buques-factoría que se dedican a la pesca y a la conservación de pescado.	C1020.07.01	f
32	Cultivo de caña de azúcar.	Cultivo de caña de azúcar.	A0114.00.01	t
268	Explotación de mataderos que realizan actividades de sacrificio, faenamiento, preparación, producción y empacado de carne fresca refrigerada o congelada en canales o piezas o porciones individuales de: porcino.	Explotación de mataderos que realizan actividades de sacrificio, faenamiento, preparación, producción y empacado de carne fresca refrigerada o congelada en canales o piezas o porciones individuales de: porcino.	C1010.11.02	f
269	Explotación de mataderos que realizan actividades de sacrificio, faenamiento, preparación, producción y empacado de carne fresca refrigerada o congelada en canales o piezas o porciones individuales de: ovino y caprino.	Explotación de mataderos que realizan actividades de sacrificio, faenamiento, preparación, producción y empacado de carne fresca refrigerada o congelada en canales o piezas o porciones individuales de: ovino y caprino.	C1010.11.03	f
337	Producción de otros elaborados de aceites y mantecas animales.	Producción de otros elaborados de aceites y mantecas animales.	C1040.25.01	f
270	Explotación de mataderos que realizan actividades de sacrificio, faenamiento, preparación, producción y empacado de carne fresca refrigerada o congelada incluso en piezas o porciones individuales de aves de corral.	Explotación de mataderos que realizan actividades de sacrificio, faenamiento, preparación, producción y empacado de carne fresca refrigerada o congelada incluso en piezas o porciones individuales de aves de corral.	C1010.12.01	f
271	Actividades de sacrificio, faenamiento, preparación, producción y empacado de carne fresca refrigerada o congelada incluso en piezas o porciones individuales de: cuyes, conejos, rana (ancas de rana) etcétera,	Actividades de sacrificio, faenamiento, preparación, producción y empacado de carne fresca refrigerada o congelada incluso en piezas o porciones individuales de: cuyes, conejos, rana (ancas de rana) etcétera,	C1010.13.01	f
272	Captura, sacrificio y procesamiento de ballenas en tierra o sobre embarcaciones especializadas.	Captura, sacrificio y procesamiento de ballenas en tierra o sobre embarcaciones especializadas.	C1010.14.01	f
273	Preparación y conservación de carne mediante: desecación.	Preparación y conservación de carne mediante: desecación.	C1010.21.01	f
274	Preparación y conservación de carne mediante: saladura.	Preparación y conservación de carne mediante: saladura.	C1010.21.02	f
275	Preparación y conservación de carne mediante: ahumado.	Preparación y conservación de carne mediante: ahumado.	C1010.21.03	f
276	Preparación y conservación de carne mediante: enlatado.	Preparación y conservación de carne mediante: enlatado.	C1010.21.04	f
277	Fabricación de productos cárnicos: salchichas, salchichón, chorizo, salame, morcillas, mortadela, patés, chicharrones finos, jamones, embutidos, etcétera. Incluso snacks de cerdo.	Fabricación de productos cárnicos: salchichas, salchichón, chorizo, salame, morcillas, mortadela, patés, chicharrones finos, jamones, embutidos, etcétera. Incluso snacks de cerdo.	C1010.22.01	f
278	Producción de cueros y pieles originados en mataderos incluida pieles depiladas.	Producción de cueros y pieles originados en mataderos incluida pieles depiladas.	C1010.23.01	f
279	Extracción de otras grasas comestibles de origen animal.	Extracción de otras grasas comestibles de origen animal.	C1010.24.01	f
280	Extracción de manteca de cerdo de origen animal.	Extracción de manteca de cerdo de origen animal.	C1010.24.02	f
281	Obtención de despojos de animales, lana de matadero.	Obtención de despojos de animales, lana de matadero.	C1010.25.01	f
282	Obtención de despojos de animales, pelo ordinario, plumas (plumón) y pelusas.	Obtención de despojos de animales, pelo ordinario, plumas (plumón) y pelusas.	C1010.25.02	f
283	Producción de sémolas de carne.	Producción de sémolas de carne.	C1010.26.01	f
284	Produción de harinas de carne.	Produción de harinas de carne.	C1010.26.02	f
285	Producción de carnes provientes de la caza.	Producción de carnes provientes de la caza.	C1010.27.01	f
286	Elaboración de despojos de carne.	Elaboración de despojos de carne.	C1010.28.01	f
287	Preparación y conservación de otros productos cárnicos.	Preparación y conservación de otros productos cárnicos.	C1010.29.01	f
288	Servicios de apoyo a la elaboración y conservación de carne a cambio de una retribución o por contrato.	Servicios de apoyo a la elaboración y conservación de carne a cambio de una retribución o por contrato.	C1010.30.01	f
289	Preparación y conservación de camarón y langostinos mediante el congelado, ultracongelado secado, ahumado, salado, sumergido en salmuera y enlatado, etcétera.	Preparación y conservación de camarón y langostinos mediante el congelado, ultracongelado secado, ahumado, salado, sumergido en salmuera y enlatado, etcétera.	C1020.01.01	f
290	Preparación y conservación de pescado mediante el congelado, ultracongelado, secado, ahumado, salado, sumergido en salmuera y enlatado, etcétera.	Preparación y conservación de pescado mediante el congelado, ultracongelado, secado, ahumado, salado, sumergido en salmuera y enlatado, etcétera.	C1020.02.01	f
291	Preparación y conservación de crustáceos y otros moluscos mediante el congelado, ultracongelado, secado, ahumado, salado, sumergido en salmuera y enlatado, etcétera.	Preparación y conservación de crustáceos y otros moluscos mediante el congelado, ultracongelado, secado, ahumado, salado, sumergido en salmuera y enlatado, etcétera.	C1020.02.02	f
292	Preparación y conservación de productos de pescado, mediante el congelado, ultracongelado, secado, ahumado, salado, sumergido en salmuera y enlatado, etcétera.	Preparación y conservación de productos de pescado, mediante el congelado, ultracongelado, secado, ahumado, salado, sumergido en salmuera y enlatado, etcétera.	C1020.02.03	f
293	Elaboración de productos de camarón y langostinos.	Elaboración de productos de camarón y langostinos.	C1020.03.01	f
294	Elaboración de productos de pescado: cocinado, filetes de pescado, huevos de pescado, caviar y sustitutos del caviar, etcétera.	Elaboración de productos de pescado: cocinado, filetes de pescado, huevos de pescado, caviar y sustitutos del caviar, etcétera.	C1020.04.01	f
295	Elaboración de productos de crustáceos (excepto camarón y langostinos) y otros moluscos, etcétera.	Elaboración de productos de crustáceos (excepto camarón y langostinos) y otros moluscos, etcétera.	C1020.04.02	f
296	Elaboración de harina de pescado para consumo humano.	Elaboración de harina de pescado para consumo humano.	C1020.05.01	f
297	Elaboración de harina y solubles de pescado y otros animales acuáticos para alimento de animales, no aptos para el consumo humano.	Elaboración de harina y solubles de pescado y otros animales acuáticos para alimento de animales, no aptos para el consumo humano.	C1020.06.01	f
376	Elaboración de almidones a partir de otros tubérculos.	Elaboración de almidones a partir de otros tubérculos.	C1062.01.05	f
299	Actividades de buques-factoría que se dedican a la pesca y a la conservación de crustáceos y moluscos.	Actividades de buques-factoría que se dedican a la pesca y a la conservación de crustáceos y moluscos.	C1020.07.02	f
300	Elaboración de productos de algas y otros recursos marinos, mediante el secado, salazón, conservación en salmuera, enlatados, ahumado, etcétera.	Elaboración de productos de algas y otros recursos marinos, mediante el secado, salazón, conservación en salmuera, enlatados, ahumado, etcétera.	C1020.08.01	f
301	Servicios de apoyo a la elaboración y conservación de pescados, crustáceos y moluscos a cambio de una retribución o por contrato.	Servicios de apoyo a la elaboración y conservación de pescados, crustáceos y moluscos a cambio de una retribución o por contrato.	C1020.09.01	f
383	Elaboración de jarabe de maltosa.	Elaboración de jarabe de maltosa.	C1062.03.03	f
302	Producción de pescado y filetes de pescado, incluso pescado picado, trozado o molido, frescos, refrigerados o congelados.	Producción de pescado y filetes de pescado, incluso pescado picado, trozado o molido, frescos, refrigerados o congelados.	C1020.10.01	f
303	Elaboración de alimentos compuestos (mezcla) principalmente de frutas excepto platos preparados en forma congelada o enlatada listos para consumir.	Elaboración de alimentos compuestos (mezcla) principalmente de frutas excepto platos preparados en forma congelada o enlatada listos para consumir.	C1030.11.01	f
304	Elaboración de alimentos compuestos (mezcla) principalmente de legumbres u hortalizas, excepto platos preparados en forma congelada o enlatada listos para consumir.	Elaboración de alimentos compuestos (mezcla) principalmente de legumbres u hortalizas, excepto platos preparados en forma congelada o enlatada listos para consumir.	C1030.11.02	f
305	Conservación de frutas mediante congelado.	Conservación de frutas mediante congelado.	C1030.12.01	f
306	Conservación de frutas mediante enlatado.	Conservación de frutas mediante enlatado.	C1030.12.02	f
307	Conservación de frutas mediante secado, deshidratado, inmersión en aceite o vinagre, etcétera.	Conservación de frutas mediante secado, deshidratado, inmersión en aceite o vinagre, etcétera.	C1030.12.03	f
308	Conservación de legumbres mediante congelado.	Conservación de legumbres mediante congelado.	C1030.12.04	f
309	Conservación de legumbres mediante enlatado.	Conservación de legumbres mediante enlatado.	C1030.12.05	f
310	Conservación de legumbres mediante secado, deshidratado, inmersión en aceite o vinagre, etcétera.	Conservación de legumbres mediante secado, deshidratado, inmersión en aceite o vinagre, etcétera.	C1030.12.06	f
311	Conservación de hortalizas mediante congelado.	Conservación de hortalizas mediante congelado.	C1030.12.07	f
312	Conservación de hortalizas mediante enlatado.	Conservación de hortalizas mediante enlatado.	C1030.12.08	f
313	Conservación de hortalizas mediante secado, deshidratado, inmersión en aceite o vinagre, etcétera.	Conservación de hortalizas mediante secado, deshidratado, inmersión en aceite o vinagre, etcétera.	C1030.12.09	f
314	Conservación de nueces (pasta de nueces) y otros frutos secos mediante el tostado, salado, asado, enlatado, etcétera.	Conservación de nueces (pasta de nueces) y otros frutos secos mediante el tostado, salado, asado, enlatado, etcétera.	C1030.13.01	f
315	Fabricación de productos alimenticios a partir de (un solo componente) frutas, legumbres y hortalizas; incluso snacks de plátano (chifles), yuca, frutas, etcétera, excepto papa.	Fabricación de productos alimenticios a partir de (un solo componente) frutas, legumbres y hortalizas; incluso snacks de plátano (chifles), yuca, frutas, etcétera, excepto papa.	C1030.14.01	f
316	Elaboración de jugos (zumos), néctares, concentrados de fruta fresca.	Elaboración de jugos (zumos), néctares, concentrados de fruta fresca.	C1030.15.01	f
317	Elaboración de jugos (zumos), néctares, concentrados de hortalizas.	Elaboración de jugos (zumos), néctares, concentrados de hortalizas.	C1030.15.02	f
318	Elaboración de compotas, mermeladas y jaleas, purés y otras confituras de frutas o frutos secos.	Elaboración de compotas, mermeladas y jaleas, purés y otras confituras de frutas o frutos secos.	C1030.16.01	f
319	Fabricación de alimentos perecibles a base de frutas, legumbres y hortalizas como: ensaladas empaquetadas, hortalizas peladas y cortadas, tofu (cuajada de soya).	Fabricación de alimentos perecibles a base de frutas, legumbres y hortalizas como: ensaladas empaquetadas, hortalizas peladas y cortadas, tofu (cuajada de soya).	C1030.17.01	f
320	Elaboración y conservación de papas preparadas congeladas u otro tipo de conservación.	Elaboración y conservación de papas preparadas congeladas u otro tipo de conservación.	C1030.21.01	f
321	Elaboración de puré de papas deshidratado, harina y sémola de papa.	Elaboración de puré de papas deshidratado, harina y sémola de papa.	C1030.22.01	f
322	Elaboración de papas fritas y snacks de papas.	Elaboración de papas fritas y snacks de papas.	C1030.23.01	f
323	Servicios de apoyo a la elaboración y conservación de frutas, legumbres y hortalizas a cambio de una retribución o por contrato: pelado industrial de papas, etcétera.	Servicios de apoyo a la elaboración y conservación de frutas, legumbres y hortalizas a cambio de una retribución o por contrato: pelado industrial de papas, etcétera.	C1030.30.01	f
324	Elaboración de aceites crudos vegetales (sin refinar) de: oliva, soya, palma, semilla de girasol, semilla de algodón, colza, repollo o mostaza, linaza, etcétera.	Elaboración de aceites crudos vegetales (sin refinar) de: oliva, soya, palma, semilla de girasol, semilla de algodón, colza, repollo o mostaza, linaza, etcétera.	C1040.11.01	f
325	Elaboración de harina y sémola sin desgrasar de semillas, nueces y almendras oleaginosas.	Elaboración de harina y sémola sin desgrasar de semillas, nueces y almendras oleaginosas.	C1040.12.01	f
326	Elaboración de aceites vegetales refinados: aceite de oliva, aceite de soya, etcétera.	Elaboración de aceites vegetales refinados: aceite de oliva, aceite de soya, etcétera.	C1040.13.01	f
327	Elaboración de aceites vegetales: oxidación por corriente de aire, cocción, deshidratación, hidrogenación, etcétera; mezclas de aceites de oliva, y productos similares.	Elaboración de aceites vegetales: oxidación por corriente de aire, cocción, deshidratación, hidrogenación, etcétera; mezclas de aceites de oliva, y productos similares.	C1040.14.01	f
329	Elaboración de grasas compuestas para cocinar y productos similares.	Elaboración de grasas compuestas para cocinar y productos similares.	C1040.14.03	f
330	Producción de mantecas para cocinar.	Producción de mantecas para cocinar.	C1040.14.04	f
331	Producción de borras de algodón.	Producción de borras de algodón.	C1040.15.01	f
332	Producción de tortas y otros productos residuales de la producción de aceite.	Producción de tortas y otros productos residuales de la producción de aceite.	C1040.15.02	f
333	Elaboración de aceites y grasas de origen animal no comestibles.	Elaboración de aceites y grasas de origen animal no comestibles.	C1040.21.01	f
334	Extracción de aceites de pescado (hígado de pescado) y mamíferos marinos.	Extracción de aceites de pescado (hígado de pescado) y mamíferos marinos.	C1040.22.01	f
335	Extracción y refinación de manteca y otras grasas de origen animal.	Extracción y refinación de manteca y otras grasas de origen animal.	C1040.23.01	f
336	Producción de residuos de la extracción de aceites y mantecas animales.	Producción de residuos de la extracción de aceites y mantecas animales.	C1040.24.01	f
338	Servicios de apoyo a la elaboración de aceites y grasas de origen vegetal y animal a cambio de una retribución o por contrato.	Servicios de apoyo a la elaboración de aceites y grasas de origen vegetal y animal a cambio de una retribución o por contrato.	C1040.30.01	f
339	Elaboración de leche fresca líquida.	Elaboración de leche fresca líquida.	C1050.01.01	f
340	Elaboración de crema de leche líquida.	Elaboración de crema de leche líquida.	C1050.01.02	f
341	Elaboración de bebidas a base de leche, yogurt, pasteurizada, esterilizada, homogeneizada y/o tratada a altas temperaturas.	Elaboración de bebidas a base de leche, yogurt, pasteurizada, esterilizada, homogeneizada y/o tratada a altas temperaturas.	C1050.01.03	f
342	Elaboración de caseína pasteurizada, esterilizada, homogeneizada y/o tratada a altas temperaturas.	Elaboración de caseína pasteurizada, esterilizada, homogeneizada y/o tratada a altas temperaturas.	C1050.01.04	f
343	Elaboración de lactosa, pasteurizada, esterilizada, homogeneizada y/o tratada a altas temperaturas.	Elaboración de lactosa, pasteurizada, esterilizada, homogeneizada y/o tratada a altas temperaturas.	C1050.01.05	f
344	Elaboración de leche en polvo, condensada sea o no azucarada.	Elaboración de leche en polvo, condensada sea o no azucarada.	C1050.02.01	f
345	Elaboración de crema en forma sólida.	Elaboración de crema en forma sólida.	C1050.03.01	f
347	Elaboración de queso y cuajada.	Elaboración de queso y cuajada.	C1050.04.02	f
349	Elaboración de helados (de todo tipo), sorbetes, bolos, granizados, etcétera.	Elaboración de helados (de todo tipo), sorbetes, bolos, granizados, etcétera.	C1050.05.01	f
350	Servicios de apoyo a la elaboración de productos lácteos a cambio de una retribución o por contrato.	Servicios de apoyo a la elaboración de productos lácteos a cambio de una retribución o por contrato.	C1050.06.01	f
351	Producción de leche en forma sólida ya sea en bloque o gránulos.	Producción de leche en forma sólida ya sea en bloque o gránulos.	C1050.07.01	f
352	Elaboración de otros productos lácteos: manjar de leche.	Elaboración de otros productos lácteos: manjar de leche.	C1050.09.01	f
353	Otros tipos de procesamiento de la leche.	Otros tipos de procesamiento de la leche.	C1050.10.01	f
354	Molienda de cereales, producción de harina de: trigo, avena, maíz y otros cereales.	Molienda de cereales, producción de harina de: trigo, avena, maíz y otros cereales.	C1061.11.01	f
355	Molienda de semolina, sémola, etc.	Molienda de semolina, sémola, etc.	C1061.11.02	f
356	Producción de semolina, sémola y otros cereales.	Producción de semolina, sémola y otros cereales.	C1061.11.03	f
357	Molienda de cereales, producción de harina de centeno.	Molienda de cereales, producción de harina de centeno.	C1061.11.04	f
358	Molienda o pilado de arroz: producción de arroz descascarillado, blanqueado, pulido, semicocido.	Molienda o pilado de arroz: producción de arroz descascarillado, blanqueado, pulido, semicocido.	C1061.12.01	f
359	Molienda o pilado de harina de arroz.	Molienda o pilado de harina de arroz.	C1061.12.02	f
360	Molienda de otros productos de origen vegetal: producción de harinas.	Molienda de otros productos de origen vegetal: producción de harinas.	C1061.13.01	f
361	Molienda de otros productos de origen vegetal: sémolas de leguminosas desecadas.	Molienda de otros productos de origen vegetal: sémolas de leguminosas desecadas.	C1061.13.02	f
362	Molienda de otros productos de origen vegetal: raíces y tubérculos (excepto patatas).	Molienda de otros productos de origen vegetal: raíces y tubérculos (excepto patatas).	C1061.13.03	f
363	Molienda de otros productos de origen vegetal: de nueces.	Molienda de otros productos de origen vegetal: de nueces.	C1061.13.04	f
364	Molienda de otros productos de origen vegetal: de frutas.	Molienda de otros productos de origen vegetal: de frutas.	C1061.13.05	f
365	Elaboración de alimentos a base de cereales tostados, insuflados.	Elaboración de alimentos a base de cereales tostados, insuflados.	C1061.21.01	f
366	Elaboración de alimentos a base de cereales macerados, hojaldrados, granos pulidos y cereales partidos o triturados, cereales para el desayuno y snacks a base de cereales.	Elaboración de alimentos a base de cereales macerados, hojaldrados, granos pulidos y cereales partidos o triturados, cereales para el desayuno y snacks a base de cereales.	C1061.21.02	f
367	Elaboración de harinas para la fabricación de pan, pasteles, bizcochos o panqueques.	Elaboración de harinas para la fabricación de pan, pasteles, bizcochos o panqueques.	C1061.22.01	f
368	Elaboración de masas mezcladas preparadas para la fabricación de pan, pasteles, bizcochos o panqueques.	Elaboración de masas mezcladas preparadas para la fabricación de pan, pasteles, bizcochos o panqueques.	C1061.22.02	f
369	Elaboración de granos de cereales precocidos.	Elaboración de granos de cereales precocidos.	C1061.23.01	f
370	Servicios de apoyo a la elaboración de productos de molinería a cambio de una retribución o por contrato.	Servicios de apoyo a la elaboración de productos de molinería a cambio de una retribución o por contrato.	C1061.30.01	f
371	Tratamiento de semillas certificadas.	Tratamiento de semillas certificadas.	C1061.31.01	f
372	Elaboración de almidones a partir de arroz.	Elaboración de almidones a partir de arroz.	C1062.01.01	f
373	Elaboración de almidones a partir de maiz (maicena).	Elaboración de almidones a partir de maiz (maicena).	C1062.01.02	f
374	Elaboración de almidones a partir de patatas.	Elaboración de almidones a partir de patatas.	C1062.01.03	f
375	Elaboración de almidones a partir de yuca, etc.	Elaboración de almidones a partir de yuca, etc.	C1062.01.04	f
377	Elaboración de almidones a partir de otras materias vegetales.	Elaboración de almidones a partir de otras materias vegetales.	C1062.01.06	f
379	Elaboración de almidones a partir de dextrina.	Elaboración de almidones a partir de dextrina.	C1062.01.08	f
380	Molienda en húmedo de maíz, elaboración de aceite de maíz.	Molienda en húmedo de maíz, elaboración de aceite de maíz.	C1062.02.01	f
382	Elaboración de jarabe de glucosa.	Elaboración de jarabe de glucosa.	C1062.03.02	f
384	Elaboración de tapioca y sustitutos de tapioca preparados a partir de almidones.	Elaboración de tapioca y sustitutos de tapioca preparados a partir de almidones.	C1062.04.01	f
385	Servicios de apoyo a la elaboración de almidones y productos derivados del almidón a cambio de una retribución o por contrato.	Servicios de apoyo a la elaboración de almidones y productos derivados del almidón a cambio de una retribución o por contrato.	C1062.05.01	f
386	Elaboración de pan, panecillos.	Elaboración de pan, panecillos.	C1071.01.01	f
387	Elaboración de bizcochos, galletas, etcétera, incluso envasados.	Elaboración de bizcochos, galletas, etcétera, incluso envasados.	C1071.01.02	f
388	Elaboración de pan de todo tipo, tostadas, etcétera, incluso envasados.	Elaboración de pan de todo tipo, tostadas, etcétera, incluso envasados.	C1071.01.03	f
389	Elaboración de otros productos de panadería.	Elaboración de otros productos de panadería.	C1071.01.04	f
390	Elaboración de pasteles y pasteles de frutas.	Elaboración de pasteles y pasteles de frutas.	C1071.02.01	f
391	Elaboración de tortas, tartas, etc.	Elaboración de tortas, tartas, etc.	C1071.02.02	f
392	Elaboración de churros, buñuelos, etc.	Elaboración de churros, buñuelos, etc.	C1071.02.03	f
393	Elaboración de otros productos de pastelería.	Elaboración de otros productos de pastelería.	C1071.02.04	f
394	Elaboración de bocadillos dulces.	Elaboración de bocadillos dulces.	C1071.02.05	f
395	Elaboración de bocadillos salados.	Elaboración de bocadillos salados.	C1071.02.06	f
396	Servicios de apoyo a la elaboración de productos de panadería a cambio de una retribución o por contrato.	Servicios de apoyo a la elaboración de productos de panadería a cambio de una retribución o por contrato.	C1071.03.01	f
397	Elaboración de otros productos de panadería, incluso congelados: tortillas de maíz o trigo, conos de helado, obleas, waffles, panqueques, etcétera.	Elaboración de otros productos de panadería, incluso congelados: tortillas de maíz o trigo, conos de helado, obleas, waffles, panqueques, etcétera.	C1071.09.01	f
399	Elaboración de masa de hojaldre y similares.	Elaboración de masa de hojaldre y similares.	C1071.09.03	f
400	Elaboración de productos de repostería.	Elaboración de productos de repostería.	C1071.09.04	f
401	Molienda y extracción de jugo de caña (trapiche).	Molienda y extracción de jugo de caña (trapiche).	C1072.01.01	f
403	Elaboración de azúcar de caña.	Elaboración de azúcar de caña.	C1072.02.01	f
404	Elaboración y refinado de azúcar de remolacha.	Elaboración y refinado de azúcar de remolacha.	C1072.02.02	f
405	Elaboración de azúcar de caña refinada.	Elaboración de azúcar de caña refinada.	C1072.02.03	f
406	Elaboración y refinado de remolacha azucarera, etcétera.	Elaboración y refinado de remolacha azucarera, etcétera.	C1072.02.04	f
407	Elaboración de melaza de caña.	Elaboración de melaza de caña.	C1072.02.05	f
408	Elaboración de melaza de remolacha azucarera.	Elaboración de melaza de remolacha azucarera.	C1072.02.06	f
409	Elaboración de melaza de maíz.	Elaboración de melaza de maíz.	C1072.02.07	f
410	Elaboración de azúcar en polvo.	Elaboración de azúcar en polvo.	C1072.02.08	f
411	Elaboración de otros tipos de azúcar y productos derivados del azúcar.	Elaboración de otros tipos de azúcar y productos derivados del azúcar.	C1072.02.09	f
412	Elaboración de jarabe de: caña de azúcar, palma, remolacha azucarera, stevia, etcétera.	Elaboración de jarabe de: caña de azúcar, palma, remolacha azucarera, stevia, etcétera.	C1072.03.01	f
413	Servicios de apoyo a la elaboración de azúcar a cambio de una retribución o por contrato.	Servicios de apoyo a la elaboración de azúcar a cambio de una retribución o por contrato.	C1072.04.01	f
414	Elaboración de cacao sin desgrasar, licor.	Elaboración de cacao sin desgrasar, licor.	C1073.11.01	f
415	Elaboración de cacao desgrasado, torta de cacao.	Elaboración de cacao desgrasado, torta de cacao.	C1073.11.02	f
416	Elaboración de cacao en polvo o en bloques.	Elaboración de cacao en polvo o en bloques.	C1073.11.03	f
417	Elaboración de manteca de cacao.	Elaboración de manteca de cacao.	C1073.11.04	f
418	Elaboración de grasa y aceite de cacao.	Elaboración de grasa y aceite de cacao.	C1073.11.05	f
419	Elaboración de otros productos de cacao.	Elaboración de otros productos de cacao.	C1073.11.06	f
421	Elaboración de productos de chocolate.	Elaboración de productos de chocolate.	C1073.12.02	f
422	Elaboración de productos de confitería: caramelos, etc.	Elaboración de productos de confitería: caramelos, etc.	C1073.21.01	f
423	Elaboración de productos de confitería a base de chocolate, chocolate blanco, etc.	Elaboración de productos de confitería a base de chocolate, chocolate blanco, etc.	C1073.21.02	f
424	Elaboración de goma de mascar, chicles, etc.	Elaboración de goma de mascar, chicles, etc.	C1073.21.03	f
425	Elaboración de productos de confitería: grageas y pastillas de confitería, etcétera.	Elaboración de productos de confitería: grageas y pastillas de confitería, etcétera.	C1073.21.04	f
427	Elaboración de confites blandos, etc.	Elaboración de confites blandos, etc.	C1073.21.06	f
428	Conservación en azúcar de frutas y frutos secos.	Conservación en azúcar de frutas y frutos secos.	C1073.22.01	f
429	Conservación en azúcar de nueces.	Conservación en azúcar de nueces.	C1073.22.02	f
430	Conservación en azúcar de cáscara de frutas.	Conservación en azúcar de cáscara de frutas.	C1073.22.03	f
378	Elaboración de gluten.	Elaboración de gluten.	C1062.01.07	t
432	Elaboración de otros dulces: melcochas, cocadas, nogadas, dulce de guayaba, alfeñiques, etcétera.	Elaboración de otros dulces: melcochas, cocadas, nogadas, dulce de guayaba, alfeñiques, etcétera.	C1073.29.01	f
433	Servicios de apoyo a la elaboración de cacao, chocolate y productos de confitería a cambio de una retribución o por contrato.	Servicios de apoyo a la elaboración de cacao, chocolate y productos de confitería a cambio de una retribución o por contrato.	C1073.30.01	f
434	Elaboración de pastas: tallarín, espaguetis, macarrones, fideos, sean o no cocidos, sin relleno, o congelados.	Elaboración de pastas: tallarín, espaguetis, macarrones, fideos, sean o no cocidos, sin relleno, o congelados.	C1074.01.01	f
435	Elaboración de pastas: lasañas, canelones, ravioles sean o no cocidos, rellenos o congelados.	Elaboración de pastas: lasañas, canelones, ravioles sean o no cocidos, rellenos o congelados.	C1074.01.02	f
437	Servicios de apoyo a la elaboración de macarrones, fideos, alcuzcuz y productos farináceos similares a cambio de una retribución o por contrato.	Servicios de apoyo a la elaboración de macarrones, fideos, alcuzcuz y productos farináceos similares a cambio de una retribución o por contrato.	C1074.02.01	f
438	Elaboración de platos a base de carne o de pollo, estofados y comidas preparados al vacio, congeladas, envasadas, enlatadas o conservadas de otra manera.	Elaboración de platos a base de carne o de pollo, estofados y comidas preparados al vacio, congeladas, envasadas, enlatadas o conservadas de otra manera.	C1075.01.01	f
439	Elaboración de platos de pescado y mariscos, incluyendo pescado con papas fritas, envasado o congelado.	Elaboración de platos de pescado y mariscos, incluyendo pescado con papas fritas, envasado o congelado.	C1075.02.01	f
440	Elaboración de platos preparados a base de legumbres y hortalizas, congeladas, envasadas, enlatadas o conservadas de otra manera.	Elaboración de platos preparados a base de legumbres y hortalizas, congeladas, envasadas, enlatadas o conservadas de otra manera.	C1075.03.01	f
441	Servicios de apoyo a la elaboración de comidas y platos preparados a cambio de una retribución o por contrato.	Servicios de apoyo a la elaboración de comidas y platos preparados a cambio de una retribución o por contrato.	C1075.04.01	f
442	Elaboración de otras comidas preparadas: congeladas, envasadas, enlatadas o conservadas de otra manera.	Elaboración de otras comidas preparadas: congeladas, envasadas, enlatadas o conservadas de otra manera.	C1075.09.01	f
443	Actividades de extractos y concentrados de café.	Actividades de extractos y concentrados de café.	C1079.11.01	f
444	Actividades de descascarillado de café.	Actividades de descascarillado de café.	C1079.11.02	f
445	Actividades de tostado de café.	Actividades de tostado de café.	C1079.11.03	f
446	Actividades de molido de café.	Actividades de molido de café.	C1079.11.04	f
447	Actividades de descafeinado de café.	Actividades de descafeinado de café.	C1079.11.05	f
448	Actividades de envasado de café.	Actividades de envasado de café.	C1079.11.06	f
449	Elaboración de sucedáneos (sustitutos) del café.	Elaboración de sucedáneos (sustitutos) del café.	C1079.12.01	f
450	Elaboración de pastas, extractos y concentrados del café.	Elaboración de pastas, extractos y concentrados del café.	C1079.12.02	f
451	Elaboración de extractos y preparados a base de té.	Elaboración de extractos y preparados a base de té.	C1079.13.01	f
453	Elaboración de extractos y preparados a base de mate; mezcla de té y mate, infusiones de hierbas (menta, manzanilla, verbena, etcétera).	Elaboración de extractos y preparados a base de mate; mezcla de té y mate, infusiones de hierbas (menta, manzanilla, verbena, etcétera).	C1079.13.03	f
454	Elaboración de alimentos especiales, leche maternizada, leche y otros alimentos complementarios para el crecimiento, alimentos que contienen ingredientes homogeneizados.	Elaboración de alimentos especiales, leche maternizada, leche y otros alimentos complementarios para el crecimiento, alimentos que contienen ingredientes homogeneizados.	C1079.21.01	f
455	Elaboración de alimentos especiales, leche maternizada, leche y otros alimentos complementarios para deportistas, alimentos que contienen ingredientes homogeneizados.	Elaboración de alimentos especiales, leche maternizada, leche y otros alimentos complementarios para deportistas, alimentos que contienen ingredientes homogeneizados.	C1079.21.02	f
456	Elaboración de alimentos especiales para infantes, leche maternizada, leche y otros alimentos complementarios, alimentos que contienen ingredientes homogeneizados.	Elaboración de alimentos especiales para infantes, leche maternizada, leche y otros alimentos complementarios, alimentos que contienen ingredientes homogeneizados.	C1079.21.03	f
457	Elaboración de alimentos especiales, leche maternizada, leche y otros alimentos complementarios, alimentos que contienen ingredientes homogeneizados para fines médicos especiales.	Elaboración de alimentos especiales, leche maternizada, leche y otros alimentos complementarios, alimentos que contienen ingredientes homogeneizados para fines médicos especiales.	C1079.21.04	f
458	Elaboración de leches a base de harinas, almidón (féculas) o extractos de malta para bebés.	Elaboración de leches a base de harinas, almidón (féculas) o extractos de malta para bebés.	C1079.21.05	f
459	Elaboración de derivados de leche a base de harinas, almidón (féculas) o extractos de malta para bebés.	Elaboración de derivados de leche a base de harinas, almidón (féculas) o extractos de malta para bebés.	C1079.21.06	f
460	Elaboración de sustitutos no lácteos de leche y quesos no lácteos (leche de soya).	Elaboración de sustitutos no lácteos de leche y quesos no lácteos (leche de soya).	C1079.22.01	f
461	Elaboración de otros alimentos especiales: concentrados de proteínas; alimentos preparados con fines dietéticos.	Elaboración de otros alimentos especiales: concentrados de proteínas; alimentos preparados con fines dietéticos.	C1079.29.01	f
462	Elaboración de otros alimentos especiales: alimentos sin gluten, alimentos para combatir el desgaste causado por el esfuerzo muscular, etcétera.	Elaboración de otros alimentos especiales: alimentos sin gluten, alimentos para combatir el desgaste causado por el esfuerzo muscular, etcétera.	C1079.29.02	f
463	Procesamiento de especias y condimentos: laurel, tomillo, albahaca, cilantro, comino, canela, pimienta, nuez moscada, jengibre, sal de ajo, de apio, etcétera.	Procesamiento de especias y condimentos: laurel, tomillo, albahaca, cilantro, comino, canela, pimienta, nuez moscada, jengibre, sal de ajo, de apio, etcétera.	C1079.31.01	f
33	Cultivo de tabaco en bruto.	Cultivo de tabaco en bruto.	A0115.00.01	t
464	Elaboración de salsas líquidas o en polvo: mayonesa, harina y sémola de mostaza, mostaza preparada, salsas de: tomate, ají, soya, etcétera.	Elaboración de salsas líquidas o en polvo: mayonesa, harina y sémola de mostaza, mostaza preparada, salsas de: tomate, ají, soya, etcétera.	C1079.32.01	f
466	Procesamiento de sal de mesa; por ejemplo: sal yodada.	Procesamiento de sal de mesa; por ejemplo: sal yodada.	C1079.34.01	f
467	Elaboración de salsa de champiñones, boloñesa, sal de ajo, de apio, cebolla, etc.	Elaboración de salsa de champiñones, boloñesa, sal de ajo, de apio, cebolla, etc.	C1079.35.01	f
468	Elaboración de otras especias, salsas o condimentos.	Elaboración de otras especias, salsas o condimentos.	C1079.35.02	f
469	Servicios de apoyo a la elaboración de otros productos alimenticios n.c.p a cambio de una retribución o por contrato.	Servicios de apoyo a la elaboración de otros productos alimenticios n.c.p a cambio de una retribución o por contrato.	C1079.40.01	f
471	Elaboración de polvos de hornear.	Elaboración de polvos de hornear.	C1079.91.02	f
472	Elaboración de sopas y caldos de diversos ingredientes, líquidos, polvo.	Elaboración de sopas y caldos de diversos ingredientes, líquidos, polvo.	C1079.92.01	f
473	Elaboración de sopas y caldos de diversos ingredientes en tabletas,sólidos.	Elaboración de sopas y caldos de diversos ingredientes en tabletas,sólidos.	C1079.92.02	f
474	Elaboración de extractos y jugos de carne, pescado, crustáceos o moluscos.	Elaboración de extractos y jugos de carne, pescado, crustáceos o moluscos.	C1079.93.01	f
475	Elaboración de concentrados artificiales; polvos solubles para la preparación de postres, tortas, flanes, budines, gelatinas, refrescos en polvo sin diluir, edulcorantes, saborizantes, espesantes, colorantes, etcétera.	Elaboración de concentrados artificiales; polvos solubles para la preparación de postres, tortas, flanes, budines, gelatinas, refrescos en polvo sin diluir, edulcorantes, saborizantes, espesantes, colorantes, etcétera.	C1079.94.01	f
476	Elaboración de otros productos alimenticios: elaboración de miel artificial, productos de huevo, claras de huevo, ovoalbúmina, etcétera.	Elaboración de otros productos alimenticios: elaboración de miel artificial, productos de huevo, claras de huevo, ovoalbúmina, etcétera.	C1079.99.01	f
477	Elaboración de otros productos alimenticios no clasificados en otra parte.	Elaboración de otros productos alimenticios no clasificados en otra parte.	C1079.99.02	f
478	Elaboración de alimentos preparados para animales domésticos como: perros.	Elaboración de alimentos preparados para animales domésticos como: perros.	C1080.01.01	f
479	Elaboración de alimentos preparados para animales domésticos como: gatos.	Elaboración de alimentos preparados para animales domésticos como: gatos.	C1080.01.02	f
480	Elaboración de alimentos preparados para animales domésticos como: pájaros.	Elaboración de alimentos preparados para animales domésticos como: pájaros.	C1080.01.03	f
481	Elaboración de alimentos preparados para animales domésticos como: peces, etcétera; incluidos los obtenidos del tratamiento de desperdicios de mataderos.	Elaboración de alimentos preparados para animales domésticos como: peces, etcétera; incluidos los obtenidos del tratamiento de desperdicios de mataderos.	C1080.01.04	f
482	Fabricación de alimentos preparados para animales de granja (aves, ganado vacuno, porcino, etcétera), incluidos alimentos concentrados.	Fabricación de alimentos preparados para animales de granja (aves, ganado vacuno, porcino, etcétera), incluidos alimentos concentrados.	C1080.02.01	f
483	Fabricación de alimentos preparados para animales acuáticos.	Fabricación de alimentos preparados para animales acuáticos.	C1080.02.02	f
484	Fabricación de alimentos sin mezclar (elaborados a partir de un único producto) y los obtenidos del tratamiento de desperdicios de mataderos.	Fabricación de alimentos sin mezclar (elaborados a partir de un único producto) y los obtenidos del tratamiento de desperdicios de mataderos.	C1080.02.03	f
485	Fabricación de alimentos preparados para animales,  suplementos alimenticios.	Fabricación de alimentos preparados para animales,  suplementos alimenticios.	C1080.02.04	f
486	Servicios de apoyo a la elaboración de alimentos preparados para animales a cambio de una retribución o por contrato.	Servicios de apoyo a la elaboración de alimentos preparados para animales a cambio de una retribución o por contrato.	C1080.03.01	f
487	Elaboración de bebidas alcohólicas destiladas: whisky, coñac, brandy, ginebra, aguardiente de caña de azúcar, etcétera.	Elaboración de bebidas alcohólicas destiladas: whisky, coñac, brandy, ginebra, aguardiente de caña de azúcar, etcétera.	C1101.01.01	f
488	Elaboración de mezcla de bebidas alcohólicas destiladas y preparados alcohólicos compuestos: cremas y otras bebidas alcohólicas aromatizadas y azucaradas.	Elaboración de mezcla de bebidas alcohólicas destiladas y preparados alcohólicos compuestos: cremas y otras bebidas alcohólicas aromatizadas y azucaradas.	C1101.02.01	f
489	Producción de aguardientes neutros	Producción de aguardientes neutros	C1101.03.01	f
490	Producción de aguardientes neutros	Producción de aguardientes neutros	C1101.03.01	f
491	Producción de alcoholes base para elaborar bebidas alcohólicas.	Producción de alcoholes base para elaborar bebidas alcohólicas.	C1101.03.02	f
492	Producción de alcoholes base para elaborar bebidas alcohólicas.	Producción de alcoholes base para elaborar bebidas alcohólicas.	C1101.03.02	f
493	Servicios de apoyo a la destilación, rectificación y mezcla de bebidas alcohólicas a cambio de una retribución o por contrato.	Servicios de apoyo a la destilación, rectificación y mezcla de bebidas alcohólicas a cambio de una retribución o por contrato.	C1101.04.01	f
495	Elaboración de vinos, vinos espumosos (champagne)	Elaboración de vinos, vinos espumosos (champagne)	C1102.01.01	f
496	Elaboración de vino a partir de mosto de uva concentrado (vino tinto, jerez, oporto, etcétera).	Elaboración de vino a partir de mosto de uva concentrado (vino tinto, jerez, oporto, etcétera).	C1102.01.02	f
497	Elaboración de bebidas alcohólicas fermentadas pero no destiladas: sake, sidra, perada, vermouth, aguamiel y otros vinos de frutas y mezclas de bebidas que contienen alcohol.	Elaboración de bebidas alcohólicas fermentadas pero no destiladas: sake, sidra, perada, vermouth, aguamiel y otros vinos de frutas y mezclas de bebidas que contienen alcohol.	C1102.02.01	f
34	Cultivo de algodón.	Cultivo de algodón.	A0116.01.01	t
498	Elaboración de vinos de baja graduación o sin alcohol y mezclas de vinos.	Elaboración de vinos de baja graduación o sin alcohol y mezclas de vinos.	C1102.03.01	f
499	Servicios de apoyo a la elaboración de vinos a cambio de una retribución o por contrato.	Servicios de apoyo a la elaboración de vinos a cambio de una retribución o por contrato.	C1102.04.01	f
500	Elaboración de bebidas malteadas como: cervezas corrientes de fermentación alta, negras y fuertes, incluida cerveza de baja graduación o sin alcohol.	Elaboración de bebidas malteadas como: cervezas corrientes de fermentación alta, negras y fuertes, incluida cerveza de baja graduación o sin alcohol.	C1103.01.01	f
502	Servicios de apoyo a la elaboración de bebidas malteadas y de malta a cambio de una retribución o por contrato.	Servicios de apoyo a la elaboración de bebidas malteadas y de malta a cambio de una retribución o por contrato.	C1103.03.01	f
503	Elaboración de bebidas no alcohólicas embotelladas (excepto cerveza y vino sin alcohol): bebidas a base de leche y cacao, etcétera.	Elaboración de bebidas no alcohólicas embotelladas (excepto cerveza y vino sin alcohol): bebidas a base de leche y cacao, etcétera.	C1104.01.01	f
504	Elaboración de bebidas no alcohólicas embotelladas (excepto cerveza y vino sin alcohol): limonadas, naranjadas, bebidas artificiales de jugos de frutas.	Elaboración de bebidas no alcohólicas embotelladas (excepto cerveza y vino sin alcohol): limonadas, naranjadas, bebidas artificiales de jugos de frutas.	C1104.01.02	f
505	Elaboración de bebidas no alcohólicas embotelladas: jarabes de frutas, etc.	Elaboración de bebidas no alcohólicas embotelladas: jarabes de frutas, etc.	C1104.01.03	f
506	Elaboración de bebidas no alcohólicas embotelladas (excepto cerveza y vino sin alcohol): bebidas gaseosas (colas).	Elaboración de bebidas no alcohólicas embotelladas (excepto cerveza y vino sin alcohol): bebidas gaseosas (colas).	C1104.01.04	f
507	Elaboración de bebidas no alcohólicas embotelladas (excepto cerveza y vino sin alcohol): bebidas aromatizadas y/o edulcoradas, aguas tónicas, gelatina comestible, bebidas hidratantes, etcétera.	Elaboración de bebidas no alcohólicas embotelladas (excepto cerveza y vino sin alcohol): bebidas aromatizadas y/o edulcoradas, aguas tónicas, gelatina comestible, bebidas hidratantes, etcétera.	C1104.01.05	f
508	Producción de aguas minerales naturales y otras aguas embotelladas.	Producción de aguas minerales naturales y otras aguas embotelladas.	C1104.02.01	f
509	Servicios de apoyo a la elaboración de bebidas no alcohólicas; producción de aguas minerales y otras aguas embotelladas a cambio de una retribución o por contrato.	Servicios de apoyo a la elaboración de bebidas no alcohólicas; producción de aguas minerales y otras aguas embotelladas a cambio de una retribución o por contrato.	C1104.03.01	f
510	Elaboración de concentrados para bebidas gaseosas.	Elaboración de concentrados para bebidas gaseosas.	C1104.04.01	f
511	Elaboración de productos de tabaco y sustitutos de productos de tabaco: cigarrillos, picadura para cigarrillos.	Elaboración de productos de tabaco y sustitutos de productos de tabaco: cigarrillos, picadura para cigarrillos.	C1200.01.01	f
512	Elaboración de productos de tabaco y sustitutos de productos de tabaco: cigarrillos (puros).	Elaboración de productos de tabaco y sustitutos de productos de tabaco: cigarrillos (puros).	C1200.01.02	f
513	Elaboración de productos de tabaco y sustitutos de productos de tabaco: tabaco de pipa, etcétera.	Elaboración de productos de tabaco y sustitutos de productos de tabaco: tabaco de pipa, etcétera.	C1200.01.03	f
514	Elaboración de productos de tabaco y sustitutos de productos de tabaco: tabaco de mascar, rape, etcétera.	Elaboración de productos de tabaco y sustitutos de productos de tabaco: tabaco de mascar, rape, etcétera.	C1200.01.04	f
515	Elaboración de productos de tabaco y sustitutos de productos de tabaco: tabaco homogeneizado o reconstituido, etcétera.	Elaboración de productos de tabaco y sustitutos de productos de tabaco: tabaco homogeneizado o reconstituido, etcétera.	C1200.01.05	f
516	Desnervado y secado de las hojas de tabaco.	Desnervado y secado de las hojas de tabaco.	C1200.02.01	f
517	Elaboración de extractos y esencias de tabaco.	Elaboración de extractos y esencias de tabaco.	C1200.03.01	f
518	Servicios de apoyo a la elaboración de productos de tabaco a cambio de una retribución o por contrato.	Servicios de apoyo a la elaboración de productos de tabaco a cambio de una retribución o por contrato.	C1200.04.01	f
519	Actividades de operaciones preparatorias de fibras textiles: devanado de seda.	Actividades de operaciones preparatorias de fibras textiles: devanado de seda.	C1311.01.01	f
520	Actividades de operaciones preparatorias de fibras textiles: lavado de seda.	Actividades de operaciones preparatorias de fibras textiles: lavado de seda.	C1311.01.02	f
521	Actividades de operaciones preparatorias de fibras textiles: desengrase de toda clase de fibras animales, vegetales, artificiales.	Actividades de operaciones preparatorias de fibras textiles: desengrase de toda clase de fibras animales, vegetales, artificiales.	C1311.01.03	f
522	Actividades de operaciones preparatorias de fibras textiles: carbonización y teñido toda clase de fibras animales, vegetales, artificiales.	Actividades de operaciones preparatorias de fibras textiles: carbonización y teñido toda clase de fibras animales, vegetales, artificiales.	C1311.01.04	f
523	Actividades de operaciones preparatorias de fibras textiles: cardado y peinado de lana.	Actividades de operaciones preparatorias de fibras textiles: cardado y peinado de lana.	C1311.01.05	f
524	Actividades de operaciones preparatorias de fibras textiles: cardado y peinado de fibras de algodón.	Actividades de operaciones preparatorias de fibras textiles: cardado y peinado de fibras de algodón.	C1311.01.06	f
525	Actividades de operaciones preparatorias de fibras textiles: cardado y peinado de fibras de lino.	Actividades de operaciones preparatorias de fibras textiles: cardado y peinado de fibras de lino.	C1311.01.07	f
526	Actividades de operaciones preparatorias de fibras textiles: cardado y peinado de yute.	Actividades de operaciones preparatorias de fibras textiles: cardado y peinado de yute.	C1311.01.08	f
527	Actividades de operaciones preparatorias de fibras textiles: cardado y peinado de cáñamo.	Actividades de operaciones preparatorias de fibras textiles: cardado y peinado de cáñamo.	C1311.01.09	f
528	Actividades de operaciones preparatorias de fibras textiles: cardado y peinado de otras fibras vegetales o animales.	Actividades de operaciones preparatorias de fibras textiles: cardado y peinado de otras fibras vegetales o animales.	C1311.01.10	f
529	Actividades de operaciones preparatorias de fibras textiles artificiales.	Actividades de operaciones preparatorias de fibras textiles artificiales.	C1311.01.11	f
36	Cultivo de lino y cáñamo.	Cultivo de lino y cáñamo.	A0116.03.01	t
530	Actividades de operaciones preparatorias de fibras textiles sintéticas.	Actividades de operaciones preparatorias de fibras textiles sintéticas.	C1311.01.12	f
531	Hilatura y fabricación de hilados e hilos para tejeduría o costura, para el comercio o para procesamiento posterior, texturización, retorcido, plegado, cableado y remojo de hilaturas filamentosas de algodón, lana, sintéticas o artificiales.	Hilatura y fabricación de hilados e hilos para tejeduría o costura, para el comercio o para procesamiento posterior, texturización, retorcido, plegado, cableado y remojo de hilaturas filamentosas de algodón, lana, sintéticas o artificiales.	C1311.02.01	f
532	Hilatura y fabricación de hilados e hilos para tejeduría o costura, para el comercio o para procesamiento posterior, texturización, retorcido, plegado, cableado y remojo de hilaturas filamentosas de pelos finos de animales o lino, sintéticas o artificiales.	Hilatura y fabricación de hilados e hilos para tejeduría o costura, para el comercio o para procesamiento posterior, texturización, retorcido, plegado, cableado y remojo de hilaturas filamentosas de pelos finos de animales o lino, sintéticas o artificiales.	C1311.02.02	f
533	Hilatura y fabricación de hilados e hilos para tejeduría o costura, para el comercio o para procesamiento posterior, texturización, retorcido, plegado, cableado y remojo de hilaturas filamentosas de hilos de seda, sintéticas o artificiales.	Hilatura y fabricación de hilados e hilos para tejeduría o costura, para el comercio o para procesamiento posterior, texturización, retorcido, plegado, cableado y remojo de hilaturas filamentosas de hilos de seda, sintéticas o artificiales.	C1311.02.03	f
534	Hilatura y fabricación de hilados e hilos para tejeduría o costura, para el comercio o para procesamiento posterior, texturización, retorcido, plegado, cableado y remojo de hilaturas filamentosas de yute, cáñamo, coco (bonote), fibras de liber, sintéticas o artificiales.	Hilatura y fabricación de hilados e hilos para tejeduría o costura, para el comercio o para procesamiento posterior, texturización, retorcido, plegado, cableado y remojo de hilaturas filamentosas de yute, cáñamo, coco (bonote), fibras de liber, sintéticas o artificiales.	C1311.02.04	f
535	Hilatura y fabricación de hilados e hilos para tejeduría o costura, para el comercio o para procesamiento posterior, texturización, retorcido, plegado, cableado y remojo de hilaturas filamentosas.	Hilatura y fabricación de hilados e hilos para tejeduría o costura, para el comercio o para procesamiento posterior, texturización, retorcido, plegado, cableado y remojo de hilaturas filamentosas.	C1311.02.05	f
536	Hilatura y fabricación de hilados e hilos para tejeduría o costura, para el comercio o para procesamiento posterior, texturización, retorcido, plegado, cableado y remojo de toda clase de fibras animales, vegetales, sintéticas o artificiales.	Hilatura y fabricación de hilados e hilos para tejeduría o costura, para el comercio o para procesamiento posterior, texturización, retorcido, plegado, cableado y remojo de toda clase de fibras animales, vegetales, sintéticas o artificiales.	C1311.02.06	f
537	Fabricación de hilados de papel.	Fabricación de hilados de papel.	C1311.03.01	f
538	Servicios de apoyo a la preparación e hilatura de fibras textiles a cambio de una retribución o por contrato.	Servicios de apoyo a la preparación e hilatura de fibras textiles a cambio de una retribución o por contrato.	C1311.04.01	f
539	Fabricación de tejidos (telas) anchos de algodón, lana o seda.	Fabricación de tejidos (telas) anchos de algodón, lana o seda.	C1312.01.01	f
540	Fabricación de tejidos (telas) anchos a partir de mezclas o de hilados sintéticos o artificiales.	Fabricación de tejidos (telas) anchos a partir de mezclas o de hilados sintéticos o artificiales.	C1312.01.02	f
541	Fabricación de tejidos (telas) anchos de rayón.	Fabricación de tejidos (telas) anchos de rayón.	C1312.01.03	f
542	Fabricación de tejidos (telas) anchos de hilados sintéticos o artificiales.	Fabricación de tejidos (telas) anchos de hilados sintéticos o artificiales.	C1312.01.04	f
543	Fabricación de tejidos (telas) anchos de poliéster.	Fabricación de tejidos (telas) anchos de poliéster.	C1312.01.05	f
544	Fabricación de tejidos (telas) aterciopelados y de felpilla.	Fabricación de tejidos (telas) aterciopelados y de felpilla.	C1312.02.01	f
545	Fabricación de tejidos de rizo.	Fabricación de tejidos de rizo.	C1312.02.02	f
546	Fabricación de tejidos de gasa, etcétera.	Fabricación de tejidos de gasa, etcétera.	C1312.02.03	f
547	Fabricación de tejidos (telas) de fibra de vidrio.	Fabricación de tejidos (telas) de fibra de vidrio.	C1312.03.01	f
548	Servicios de apoyo a la elaboración de tejidos a cambio de una retribución o por contrato.	Servicios de apoyo a la elaboración de tejidos a cambio de una retribución o por contrato.	C1312.04.01	f
549	Fabricación de otros tejidos (telas) anchos de yute.	Fabricación de otros tejidos (telas) anchos de yute.	C1312.09.01	f
550	Fabricación de otros tejidos (telas) anchos de cáñamo.	Fabricación de otros tejidos (telas) anchos de cáñamo.	C1312.09.02	f
551	Fabricación de otros tejidos (telas) anchos de lino, ramio, fibras blandas y de hilados especiales.	Fabricación de otros tejidos (telas) anchos de lino, ramio, fibras blandas y de hilados especiales.	C1312.09.03	f
552	Fabricación de otros tejidos que imitan las pieles finas, etcétera.	Fabricación de otros tejidos que imitan las pieles finas, etcétera.	C1312.09.04	f
553	Fabricación de otros tejidos de hilados de papel, etc.	Fabricación de otros tejidos de hilados de papel, etc.	C1312.09.05	f
554	Fabricación de otros tejidos de fibra de carbono e hilos arámidos, etcétera.	Fabricación de otros tejidos de fibra de carbono e hilos arámidos, etcétera.	C1312.09.06	f
555	Servicio de teñido de fibras, hilados, tejidos (telas) y artículos textiles, incluido prendas de vestir: pantalones vaqueros (jeans) etcétera, realizado por terceros a cambio de una retribución o por contrato.	Servicio de teñido de fibras, hilados, tejidos (telas) y artículos textiles, incluido prendas de vestir: pantalones vaqueros (jeans) etcétera, realizado por terceros a cambio de una retribución o por contrato.	C1313.01.01	f
556	Servicio de blanqueo de fibras, hilados, tejidos (telas) y artículos textiles, incluido prendas de vestir: pantalones vaqueros (jeans) etcétera, realizado por terceros a cambio de una retribución o por contrato.	Servicio de blanqueo de fibras, hilados, tejidos (telas) y artículos textiles, incluido prendas de vestir: pantalones vaqueros (jeans) etcétera, realizado por terceros a cambio de una retribución o por contrato.	C1313.01.02	f
611	Fabricación de prendas de vestir de cuero o cuero regenerado, para practicar deportes.	Fabricación de prendas de vestir de cuero o cuero regenerado, para practicar deportes.	C1410.01.04	f
557	Servicio de calandrado, plisado de textiles y artículos textiles, incluido prendas de vestir realizado por terceros a cambio de una retribución o por contrato.	Servicio de calandrado, plisado de textiles y artículos textiles, incluido prendas de vestir realizado por terceros a cambio de una retribución o por contrato.	C1313.02.01	f
558	Servicio de apresto, secado, vaporizado, encogimiento,realizado por terceros a cambio de una retribución o por contrato.	Servicio de apresto, secado, vaporizado, encogimiento,realizado por terceros a cambio de una retribución o por contrato.	C1313.02.02	f
559	Servicio de perchado, remallado, sanforizado, mercerizado realizado por terceros a cambio de una retribución o por contrato.	Servicio de perchado, remallado, sanforizado, mercerizado realizado por terceros a cambio de una retribución o por contrato.	C1313.02.03	f
647	Fabricación de cueros regenerados (artificiales), adobados, vegetal.	Fabricación de cueros regenerados (artificiales), adobados, vegetal.	C1511.02.01	f
560	Servicio de impermeabilizado, revestimiento, cauchutado o impregnación de prendas realizado por terceros a cambio de una retribución o por contrato.	Servicio de impermeabilizado, revestimiento, cauchutado o impregnación de prendas realizado por terceros a cambio de una retribución o por contrato.	C1313.03.01	f
561	Servicio de estampado serigráfico de productos textiles y prendas de vestir, realizado por terceros a cambio de una retribución o por contrato.	Servicio de estampado serigráfico de productos textiles y prendas de vestir, realizado por terceros a cambio de una retribución o por contrato.	C1313.04.01	f
562	Fabricación de tejidos (telas) de punto o ganchillo.	Fabricación de tejidos (telas) de punto o ganchillo.	C1391.01.01	f
563	Fabricación de tejidos aterciopelados y de rizo, pieles de imitación de punto obtenidas mediante el tricotaje.	Fabricación de tejidos aterciopelados y de rizo, pieles de imitación de punto obtenidas mediante el tricotaje.	C1391.01.02	f
564	Servicios de apoyo a la fabricación de tejidos de punto y ganchillo a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de tejidos de punto y ganchillo a cambio de una retribución o por contrato.	C1391.02.01	f
565	Fabricación de artículos confeccionados con cualquier tipo de material textil, incluidos tejidos (telas) de punto y ganchillo: frazadas, mantas de viaje, sobrecamas, cobijas, edredones y artículos de cocina, edredones, artículos para el baño, etcétera, incluido  tejidos para mantas eléctricas.	Fabricación de artículos confeccionados con cualquier tipo de material textil, incluidos tejidos (telas) de punto y ganchillo: frazadas, mantas de viaje, sobrecamas, cobijas, edredones y artículos de cocina, edredones, artículos para el baño, etcétera, incluido  tejidos para mantas eléctricas.	C1392.01.01	f
566	Fabricación de artículos confeccionados con cualquier tipo de material textil, incluidos tejidos (telas) de punto y ganchillo: ropa de cama, sábanas, mantelería, toallas.	Fabricación de artículos confeccionados con cualquier tipo de material textil, incluidos tejidos (telas) de punto y ganchillo: ropa de cama, sábanas, mantelería, toallas.	C1392.01.02	f
567	Fabricación de artículos confeccionados con cualquier tipo de material textil, artículos acolchados, etcétera.	Fabricación de artículos confeccionados con cualquier tipo de material textil, artículos acolchados, etcétera.	C1392.01.03	f
568	Fabricación de artículos confeccionados con cualquier tipo de material textil, cojines, pufés, almohadas,  etcétera.	Fabricación de artículos confeccionados con cualquier tipo de material textil, cojines, pufés, almohadas,  etcétera.	C1392.01.04	f
569	Fabricación de artículos confeccionados con cualquier tipo de material textil, sacos de dormir.	Fabricación de artículos confeccionados con cualquier tipo de material textil, sacos de dormir.	C1392.01.05	f
570	Fabricación de accesorios confeccionados para el hogar: cortinas, cenefas, visillos.	Fabricación de accesorios confeccionados para el hogar: cortinas, cenefas, visillos.	C1392.02.01	f
571	Fabricación de artículos de lona o encerados: artículos de acampada.	Fabricación de artículos de lona o encerados: artículos de acampada.	C1392.03.01	f
572	Fabricación de artículos de lona o encerados: tiendas de campaña.	Fabricación de artículos de lona o encerados: tiendas de campaña.	C1392.03.02	f
573	Fabricación de artículos de lona o encerados: toldos de protección contra el sol, carpas, etc.	Fabricación de artículos de lona o encerados: toldos de protección contra el sol, carpas, etc.	C1392.03.03	f
574	Fabricación de artículos de lona o encerados: velas para embarcaciones.	Fabricación de artículos de lona o encerados: velas para embarcaciones.	C1392.03.04	f
575	Fabricación de artículos de lona o encerados: fundas para pistolas, mochilas, polainas, etcétera.	Fabricación de artículos de lona o encerados: fundas para pistolas, mochilas, polainas, etcétera.	C1392.03.05	f
576	Fabricación de artículos de lona o encerados: fundas para embalar mercaderías, tejidos para mantas eléctricas, etcétera.	Fabricación de artículos de lona o encerados: fundas para embalar mercaderías, tejidos para mantas eléctricas, etcétera.	C1392.03.06	f
577	Fabricación de tapices tejidos a mano.	Fabricación de tapices tejidos a mano.	C1392.04.01	f
578	Fabricación de banderas, banderines, gallardetes, estandartes, etcétera.	Fabricación de banderas, banderines, gallardetes, estandartes, etcétera.	C1392.05.01	f
579	Fabricación de fundas (forros) o cobertores de asientos para automóviles, etc.	Fabricación de fundas (forros) o cobertores de asientos para automóviles, etc.	C1392.06.01	f
580	Fabricación de fundas (forros) para maquinarias, muebles, neumáticos, etcétera.	Fabricación de fundas (forros) para maquinarias, muebles, neumáticos, etcétera.	C1392.06.02	f
581	Servicios de apoyo a la fabricación de artículos confeccionados de materiales textiles, excepto prendas de vestir a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de artículos confeccionados de materiales textiles, excepto prendas de vestir a cambio de una retribución o por contrato.	C1392.07.01	f
582	Fabricación de otros artículos confeccionados con textiles: paños para desempolvar, paños de cocina y artículos similares, chalecos salvavidas, etc.	Fabricación de otros artículos confeccionados con textiles: paños para desempolvar, paños de cocina y artículos similares, chalecos salvavidas, etc.	C1392.09.01	f
583	Fabricación de otros artículos confeccionados con textiles: paracaídas, etcétera.	Fabricación de otros artículos confeccionados con textiles: paracaídas, etcétera.	C1392.09.02	f
584	Fabricación de recubrimientos para pisos de materiales textiles: tapices, alfombras, esteras, recuadros de moqueta (alfombra), de lana, pelos finos o algodón.	Fabricación de recubrimientos para pisos de materiales textiles: tapices, alfombras, esteras, recuadros de moqueta (alfombra), de lana, pelos finos o algodón.	C1393.01.01	f
585	Fabricación de recubrimientos para pisos de materiales textiles: tapices, alfombras, esteras, recuadros de moqueta (alfombra), de yute, fibra de coco, sisal o fibras similares.	Fabricación de recubrimientos para pisos de materiales textiles: tapices, alfombras, esteras, recuadros de moqueta (alfombra), de yute, fibra de coco, sisal o fibras similares.	C1393.01.02	f
586	Fabricación de recubrimientos para pisos de fieltro punzonado.	Fabricación de recubrimientos para pisos de fieltro punzonado.	C1393.02.01	f
587	Servicios de apoyo a la fabricación de tapices y alfombras a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de tapices y alfombras a cambio de una retribución o por contrato.	C1393.03.01	f
648	Fabricación de cueros regenerados (artificiales), adobados mineral o químicamente.	Fabricación de cueros regenerados (artificiales), adobados mineral o químicamente.	C1511.02.02	f
588	Fabricación de cuerdas, cordeles, bramantes e hilos de fibras textiles o de cintas o similares, estén o no impregnados, revestidos, cubiertos o forrados con caucho o plástico.	Fabricación de cuerdas, cordeles, bramantes e hilos de fibras textiles o de cintas o similares, estén o no impregnados, revestidos, cubiertos o forrados con caucho o plástico.	C1394.01.01	f
589	Fabricación de otras cuerdas, cordeles y redes.	Fabricación de otras cuerdas, cordeles y redes.	C1394.01.02	f
590	Fabricación de mallas anudadas de cuerda, cordel o bramante: defensas para bordos, cojines para descarga,etcétera.	Fabricación de mallas anudadas de cuerda, cordel o bramante: defensas para bordos, cojines para descarga,etcétera.	C1394.02.01	f
591	Fabricación de mallas anudadas de cuerda, cordel o bramante: eslingas, cuerdas y maromas con aros metálicos, etcétera.	Fabricación de mallas anudadas de cuerda, cordel o bramante: eslingas, cuerdas y maromas con aros metálicos, etcétera.	C1394.02.02	f
592	Fabricación de mallas anudadas de cuerda, cordel o bramante: redes de pesca, etcétera, incluido fabricación de hamacas, bolsas de red para pelotas, redes para deportes, etcétera.	Fabricación de mallas anudadas de cuerda, cordel o bramante: redes de pesca, etcétera, incluido fabricación de hamacas, bolsas de red para pelotas, redes para deportes, etcétera.	C1394.02.03	f
593	Servicios de apoyo a la fabricación de cuerdas, cordeles, bramantes y redes a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de cuerdas, cordeles, bramantes y redes a cambio de una retribución o por contrato.	C1394.03.01	f
594	Fabricación de tejidos (telas) estrechos, incluidos los de urdimbre sin trama sujetos por una sustancia adhesiva.	Fabricación de tejidos (telas) estrechos, incluidos los de urdimbre sin trama sujetos por una sustancia adhesiva.	C1399.01.01	f
595	Fabricación de marbetes, insignias, etcétera.	Fabricación de marbetes, insignias, etcétera.	C1399.01.02	f
596	Fabricación de artículos de pasamanería: cordones de materiales textiles para zapatos, trencillas, borlas, madroños.	Fabricación de artículos de pasamanería: cordones de materiales textiles para zapatos, trencillas, borlas, madroños.	C1399.01.03	f
597	Fabricación de tules y otros tejidos (telas) de mallas anudadas, de encaje y bordados, en piezas, tiras o motivos decorativos, tejidos (telas) de red y del tipo que se utiliza para la confección de visillos tricotados en máquinas Raschel o máquinas similares.	Fabricación de tules y otros tejidos (telas) de mallas anudadas, de encaje y bordados, en piezas, tiras o motivos decorativos, tejidos (telas) de red y del tipo que se utiliza para la confección de visillos tricotados en máquinas Raschel o máquinas similares.	C1399.01.04	f
598	Fabricación de tejidos (telas) impregnados, revestidos, recubiertos o laminados con plástico.	Fabricación de tejidos (telas) impregnados, revestidos, recubiertos o laminados con plástico.	C1399.02.01	f
599	Fabricación de hilados metalizados e hilados entorchados; hilos y cuerdas de caucho revestidos de materiales textiles; hilados y bandas textiles recubiertos impregnados, revestidos o forrados con caucho o plástico.	Fabricación de hilados metalizados e hilados entorchados; hilos y cuerdas de caucho revestidos de materiales textiles; hilados y bandas textiles recubiertos impregnados, revestidos o forrados con caucho o plástico.	C1399.03.01	f
600	Fabricación de tejidos de hilados de gran resistencia para cuerdas de neumáticos.	Fabricación de tejidos de hilados de gran resistencia para cuerdas de neumáticos.	C1399.04.01	f
601	Fabricación de tejidos tratados o revestidos: papel tela, lienzos preparados para pintores, bocací y tejidos rígidos similares.	Fabricación de tejidos tratados o revestidos: papel tela, lienzos preparados para pintores, bocací y tejidos rígidos similares.	C1399.05.01	f
602	Fabricación de tejidos revestidos con goma o sustancias amiláceas.	Fabricación de tejidos revestidos con goma o sustancias amiláceas.	C1399.05.02	f
603	Fabricación de artículos textiles diversos: tejidos tubulares para su fabricación, mangueras, correas transportadoras y correaje de transmisión (estén reforzados o no con metales u otros materiales), fieltro, etcétera.	Fabricación de artículos textiles diversos: tejidos tubulares para su fabricación, mangueras, correas transportadoras y correaje de transmisión (estén reforzados o no con metales u otros materiales), fieltro, etcétera.	C1399.06.01	f
604	Fabricación de artículos textiles diversos: mechas de materiales textiles, camisas para mecheros de gas incandescentes.	Fabricación de artículos textiles diversos: mechas de materiales textiles, camisas para mecheros de gas incandescentes.	C1399.06.02	f
605	Fabricación de artículos textiles diversos: tela para tamices, tela de filtración, etc.	Fabricación de artículos textiles diversos: tela para tamices, tela de filtración, etc.	C1399.06.03	f
606	Servicios de apoyo a la fabricación de otros productos textiles n.c.p a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de otros productos textiles n.c.p a cambio de una retribución o por contrato.	C1399.07.01	f
607	Fabricación de otros productos textiles: adornos para vehículos automotores, cinta-tejido sensible a la presión, etcétera.	Fabricación de otros productos textiles: adornos para vehículos automotores, cinta-tejido sensible a la presión, etcétera.	C1399.09.01	f
608	Fabricación de prendas de vestir de cuero o cuero regenerado, de ropa exterior.	Fabricación de prendas de vestir de cuero o cuero regenerado, de ropa exterior.	C1410.01.01	f
609	Fabricación de prendas de vestir de cuero o cuero regenerado, de diario y de etiqueta.	Fabricación de prendas de vestir de cuero o cuero regenerado, de diario y de etiqueta.	C1410.01.02	f
610	Fabricación de prendas de vestir de cuero o cuero regenerado, incluidos accesorios de trabajo de cuero como: mandiles para soldadores, ropa de trabajo, etcétera.	Fabricación de prendas de vestir de cuero o cuero regenerado, incluidos accesorios de trabajo de cuero como: mandiles para soldadores, ropa de trabajo, etcétera.	C1410.01.03	f
612	Fabricación de prendas de vestir de telas tejidas, de telas no tejidas, entre otras, para hombres, mujeres, niños y bebes: pantalones, faldas, camisetas, etcétera de ropa exterior.	Fabricación de prendas de vestir de telas tejidas, de telas no tejidas, entre otras, para hombres, mujeres, niños y bebes: pantalones, faldas, camisetas, etcétera de ropa exterior.	C1410.02.01	f
613	Fabricación de prendas de vestir de telas tejidas, de telas no tejidas, entre otras, para hombres, mujeres, niños y bebes: abrigos, trajes, conjuntos, chaquetas, camisas, etcétera de diario y de etiqueta.	Fabricación de prendas de vestir de telas tejidas, de telas no tejidas, entre otras, para hombres, mujeres, niños y bebes: abrigos, trajes, conjuntos, chaquetas, camisas, etcétera de diario y de etiqueta.	C1410.02.02	f
614	Fabricación de prendas de vestir de telas tejidas, de telas no tejidas, entre otras, para hombres, mujeres, niños y bebes: uniformes, ropa de trabajo, etc.	Fabricación de prendas de vestir de telas tejidas, de telas no tejidas, entre otras, para hombres, mujeres, niños y bebes: uniformes, ropa de trabajo, etc.	C1410.02.03	f
615	Fabricación de prendas de vestir de telas tejidas, de telas no tejidas, entre otras, para hombres, mujeres, niños y bebes: calentadores, trajes de baño, ropa de esquí, ropa para practicar deportes, etc.	Fabricación de prendas de vestir de telas tejidas, de telas no tejidas, entre otras, para hombres, mujeres, niños y bebes: calentadores, trajes de baño, ropa de esquí, ropa para practicar deportes, etc.	C1410.02.04	f
616	Fabricación de ropa interior de telas tejidas, de encaje, de punto y ganchillo,mujeres y niños: panties, calzoncillos, slips, sujetadores, fajas, etcétera.	Fabricación de ropa interior de telas tejidas, de encaje, de punto y ganchillo,mujeres y niños: panties, calzoncillos, slips, sujetadores, fajas, etcétera.	C1410.03.01	f
617	Fabricación de ropa de dormir de telas tejidas, de punto y ganchillo, de encaje, etcétera, para hombres, mujeres y niños: pijamas, camisones, batas, blusas, etcétera.	Fabricación de ropa de dormir de telas tejidas, de punto y ganchillo, de encaje, etcétera, para hombres, mujeres y niños: pijamas, camisones, batas, blusas, etcétera.	C1410.03.02	f
618	Actividades de confección a la medida de prendas de vestir (costureras, sastres).	Actividades de confección a la medida de prendas de vestir (costureras, sastres).	C1410.04.01	f
619	Fabricación de sombreros de cualquier material.	Fabricación de sombreros de cualquier material.	C1410.05.01	f
620	Fabricación de gorros y tocados de cualquier material.	Fabricación de gorros y tocados de cualquier material.	C1410.05.02	f
621	Fabricación de sombreros de paja toquilla.	Fabricación de sombreros de paja toquilla.	C1410.05.03	f
622	Actividades administrativas de compra de materias primas para la elaboración de prendas de vestir.	Actividades administrativas de compra de materias primas para la elaboración de prendas de vestir.	C1410.06.01	f
623	Actividades administrativas de contratación con fábricas de confecciones de prendas de vestir usando materiales propios.	Actividades administrativas de contratación con fábricas de confecciones de prendas de vestir usando materiales propios.	C1410.06.02	f
624	Actividades administrativas de diseño y preparación de muestras para la fabricación de prendas de vestir.	Actividades administrativas de diseño y preparación de muestras para la fabricación de prendas de vestir.	C1410.06.03	f
625	Actividades administrativas vinculadas a la fabricación de prendas de vestir.	Actividades administrativas vinculadas a la fabricación de prendas de vestir.	C1410.06.04	f
626	Fabricación de otros accesorios de vestir: calzado de materiales textiles sin aplicación de suelas, etcétera.	Fabricación de otros accesorios de vestir: calzado de materiales textiles sin aplicación de suelas, etcétera.	C1410.09.01	f
627	Fabricación de otros accesorios de vestir: chales.	Fabricación de otros accesorios de vestir: chales.	C1410.09.02	f
628	Fabricación de otros accesorios de vestir: corbatas, corbatines, etc.	Fabricación de otros accesorios de vestir: corbatas, corbatines, etc.	C1410.09.03	f
629	Fabricación de otros accesorios de vestir: guantes, etc.	Fabricación de otros accesorios de vestir: guantes, etc.	C1410.09.04	f
630	Fabricación de otros accesorios de vestir: cinturones, etc.	Fabricación de otros accesorios de vestir: cinturones, etc.	C1410.09.05	f
631	Fabricación de otros accesorios de vestir: incluido la fabricación de partes de productos o prendas textiles.	Fabricación de otros accesorios de vestir: incluido la fabricación de partes de productos o prendas textiles.	C1410.09.06	f
632	Fabricación de otros accesorios de vestir: redecillas para el cabello, etc.	Fabricación de otros accesorios de vestir: redecillas para el cabello, etc.	C1410.09.07	f
633	Fabricación de artículos de piel (con pelo natural): incluido los confeccionados con pieles “alargadas”, planchas, cuadrados, tiras, etcétera.	Fabricación de artículos de piel (con pelo natural): incluido los confeccionados con pieles “alargadas”, planchas, cuadrados, tiras, etcétera.	C1420.01.01	f
634	Fabricación de artículos de piel (con pelo natural): prendas de vestir.	Fabricación de artículos de piel (con pelo natural): prendas de vestir.	C1420.01.02	f
635	Fabricación de artículos de piel (con pelo natural): accesorios de piel.	Fabricación de artículos de piel (con pelo natural): accesorios de piel.	C1420.01.03	f
636	Fabricación de artículos diversos de piel (con pelo natural): alfombras.	Fabricación de artículos diversos de piel (con pelo natural): alfombras.	C1420.02.01	f
637	Fabricación de artículos diversos de piel (con pelo natural): pufs sin relleno.	Fabricación de artículos diversos de piel (con pelo natural): pufs sin relleno.	C1420.02.02	f
638	Fabricación de artículos diversos de piel (con pelo natural): paños para pulimento industrial.	Fabricación de artículos diversos de piel (con pelo natural): paños para pulimento industrial.	C1420.02.03	f
639	Fabricación de artículos diversos de piel (con pelo natural): conjuntos de peletería, cuadros, planchas, etc.	Fabricación de artículos diversos de piel (con pelo natural): conjuntos de peletería, cuadros, planchas, etc.	C1420.02.04	f
640	Servicios de apoyo a la fabricación de artículos de piel a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de artículos de piel a cambio de una retribución o por contrato.	C1420.03.01	f
641	Fabricación de pieles artificiales.	Fabricación de pieles artificiales.	C1420.04.01	f
642	Fabricación de artículos confeccionados con pieles artificiales.	Fabricación de artículos confeccionados con pieles artificiales.	C1420.04.02	f
643	Fabricación de artículos de confección de punto y ganchillo: jerseys, suéteres, chalecos, camisetas y artículos similares.	Fabricación de artículos de confección de punto y ganchillo: jerseys, suéteres, chalecos, camisetas y artículos similares.	C1430.01.01	f
644	Fabricación de medias, incluidos calcetines, leotardos y pantimedias.	Fabricación de medias, incluidos calcetines, leotardos y pantimedias.	C1430.02.01	f
645	Servicios de apoyo a la fabricación de artículos de punto y ganchillo a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de artículos de punto y ganchillo a cambio de una retribución o por contrato.	C1430.03.01	f
646	Actividades de descarnadura, tundido, depilado, engrase, curtido, blanqueo, teñido, adobo de pieles y cueros de pieles finas y cueros con pelo.	Actividades de descarnadura, tundido, depilado, engrase, curtido, blanqueo, teñido, adobo de pieles y cueros de pieles finas y cueros con pelo.	C1511.01.01	f
649	Fabricación de cueros regenerados (artificiales), charol y cueros metalizados.	Fabricación de cueros regenerados (artificiales), charol y cueros metalizados.	C1511.02.03	f
650	Fabricación de cueros regenerados (artificiales), cueros gamuzados y apergaminados.	Fabricación de cueros regenerados (artificiales), cueros gamuzados y apergaminados.	C1511.02.04	f
651	Fabricación de planchas, que contengan cuero o fibras de cuero.	Fabricación de planchas, que contengan cuero o fibras de cuero.	C1511.02.05	f
652	Fabricación de hojas o tiras, que contengan cuero o fibras de cuero.	Fabricación de hojas o tiras, que contengan cuero o fibras de cuero.	C1511.02.06	f
653	Servicios de apoyo al curtido y adobo de cueros; adobo y teñido de pieles a cambio de una retribución o por contrato.	Servicios de apoyo al curtido y adobo de cueros; adobo y teñido de pieles a cambio de una retribución o por contrato.	C1511.03.01	f
654	Fabricación de maletas, bolsos de mano, mochilas y artículos similares, de cuero, cuero regenerado.	Fabricación de maletas, bolsos de mano, mochilas y artículos similares, de cuero, cuero regenerado.	C1512.01.01	f
655	Fabricación de maletas, bolsos de mano, mochilas y artículos similares, cualquier otro material, como plástico, materiales textiles, fibras vulcanizadas o cartón, cuando se usa la misma tecnología que en el caso del cuero.	Fabricación de maletas, bolsos de mano, mochilas y artículos similares, cualquier otro material, como plástico, materiales textiles, fibras vulcanizadas o cartón, cuando se usa la misma tecnología que en el caso del cuero.	C1512.01.02	f
656	Fabricación de artículos de talabartería y guarnicionería: sillas de montar, arreos, látigos y fustas.	Fabricación de artículos de talabartería y guarnicionería: sillas de montar, arreos, látigos y fustas.	C1512.02.01	f
657	Servicios de apoyo a la fabricación de maletas, bolsos de mano y artículos similares, artículos de talabartería y guarnicionería a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de maletas, bolsos de mano y artículos similares, artículos de talabartería y guarnicionería a cambio de una retribución o por contrato.	C1512.03.01	f
658	Fabricación de otros artículos diversos de cuero o cuero regenerado: correas de transmisión, cordones de cuero para zapatos, correas no metálicas para relojes (de materiales textiles, cuero y plástico), artículos de envase o embalaje, artículos usados con fines técnicos, etcétera.	Fabricación de otros artículos diversos de cuero o cuero regenerado: correas de transmisión, cordones de cuero para zapatos, correas no metálicas para relojes (de materiales textiles, cuero y plástico), artículos de envase o embalaje, artículos usados con fines técnicos, etcétera.	C1512.09.01	f
659	Fabricación de calzado de cuero y mediante cualquier proceso, incluido el moldeado (aparado de calzado).	Fabricación de calzado de cuero y mediante cualquier proceso, incluido el moldeado (aparado de calzado).	C1520.01.01	f
660	Fabricación de calzado de caucho y plástico y mediante cualquier proceso, incluido el moldeado (aparado de calzado).	Fabricación de calzado de caucho y plástico y mediante cualquier proceso, incluido el moldeado (aparado de calzado).	C1520.01.02	f
661	Fabricación de botines, polainas y artículos similares de cualquier material y mediante cualquier proceso, incluido el moldeado (aparado de calzado).	Fabricación de botines, polainas y artículos similares de cualquier material y mediante cualquier proceso, incluido el moldeado (aparado de calzado).	C1520.01.03	f
662	Fabricación de otros tipos de calzado de cualquier material y mediante cualquier proceso, incluido el moldeado (aparado de calzado).	Fabricación de otros tipos de calzado de cualquier material y mediante cualquier proceso, incluido el moldeado (aparado de calzado).	C1520.01.04	f
663	Fabricación de partes de cuero para calzado: palas y partes de palas, suelas y plantillas, tacones, etcétera.	Fabricación de partes de cuero para calzado: palas y partes de palas, suelas y plantillas, tacones, etcétera.	C1520.02.01	f
664	Servicios de apoyo a la fabricación de calzado a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de calzado a cambio de una retribución o por contrato.	C1520.03.01	f
665	Actividades de secado, aserrado (madera en bruto).	Actividades de secado, aserrado (madera en bruto).	C1610.01.01	f
666	Actividades de acepilladura y maquinado de madera (madera preparada o tratada).	Actividades de acepilladura y maquinado de madera (madera preparada o tratada).	C1610.01.02	f
667	Actividades de tableado, descortezado y desmenuzamiento de troncos.	Actividades de tableado, descortezado y desmenuzamiento de troncos.	C1610.01.03	f
668	Actividades de obtención de lana de madera, harina de madera y partículas de madera.	Actividades de obtención de lana de madera, harina de madera y partículas de madera.	C1610.01.04	f
669	Actividades de impregnación y tratamiento químico de la madera con agentes conservantes y otras sustancias (madera preparada o tratada).	Actividades de impregnación y tratamiento químico de la madera con agentes conservantes y otras sustancias (madera preparada o tratada).	C1610.01.05	f
670	Fabricación de tabletas para la ensambladura de pisos de madera (duela, media duela, parquet).	Fabricación de tabletas para la ensambladura de pisos de madera (duela, media duela, parquet).	C1610.02.01	f
671	Servicios de apoyo al aserrado y acepilladura de madera a cambio de una retribución o por contrato.	Servicios de apoyo al aserrado y acepilladura de madera a cambio de una retribución o por contrato.	C1610.03.01	f
672	Fabricación de otros tipos de madera en bruto: rodrigones, estacas, tablillas, traviesas de madera (durmientes) para vías férreas, etcétera.	Fabricación de otros tipos de madera en bruto: rodrigones, estacas, tablillas, traviesas de madera (durmientes) para vías férreas, etcétera.	C1610.09.01	f
699	Fabricación y procesamiento de corcho natural.	Fabricación y procesamiento de corcho natural.	C1629.21.01	f
700	Fabricación y procesamiento de corcho aglomerado.	Fabricación y procesamiento de corcho aglomerado.	C1629.21.02	f
1082	Producción de barras, palastros u otras formas de hierro no aleado.	Producción de barras, palastros u otras formas de hierro no aleado.	C2410.13.03	f
673	Fabricación de hojas de madera (alisadas, teñidas, bañadas, impregnadas, reforzadas con papel o tela, cortadas en figuras) para enchapado suficientemente delgadas para producir madera enchapada y hojas de madera laminada, madera compactada, madera laminada encolada.	Fabricación de hojas de madera (alisadas, teñidas, bañadas, impregnadas, reforzadas con papel o tela, cortadas en figuras) para enchapado suficientemente delgadas para producir madera enchapada y hojas de madera laminada, madera compactada, madera laminada encolada.	C1621.01.01	f
674	Fabricación de madera (alisadas, teñidas, bañadas, impregnadas, reforzadas con papel o tela, cortadas en figuras) para enchapado suficientemente delgadas para producir madera enchapada, compactada, laminada encolada.	Fabricación de madera (alisadas, teñidas, bañadas, impregnadas, reforzadas con papel o tela, cortadas en figuras) para enchapado suficientemente delgadas para producir madera enchapada, compactada, laminada encolada.	C1621.01.02	f
675	Fabricación de madera compactada, madera laminada encolada.	Fabricación de madera compactada, madera laminada encolada.	C1621.01.03	f
676	Fabricación de tableros contrachapados, tableros de madera enchapada y otros tableros, tableros de fibra y tableros de partículas.	Fabricación de tableros contrachapados, tableros de madera enchapada y otros tableros, tableros de fibra y tableros de partículas.	C1621.01.04	f
677	Servicios de apoyo a la fabricación de hojas de madera para enchapado y tableros a base de madera a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de hojas de madera para enchapado y tableros a base de madera a cambio de una retribución o por contrato.	C1621.02.01	f
678	Fabricación de productos de madera utilizados principalmente por la industria de la construcción: vigas, cabríos, jabalcones, puntales, armazones de madera laminada encolada y armazones de madera prefabricados con uniones de metal, andamios, postes, etcétera.	Fabricación de productos de madera utilizados principalmente por la industria de la construcción: vigas, cabríos, jabalcones, puntales, armazones de madera laminada encolada y armazones de madera prefabricados con uniones de metal, andamios, postes, etcétera.	C1622.01.01	f
679	Fabricación de puertas, ventanas, contraventanas y sus marcos, tengan o no herrajes, como bisagras, cerraduras, escaleras, barandales.	Fabricación de puertas, ventanas, contraventanas y sus marcos, tengan o no herrajes, como bisagras, cerraduras, escaleras, barandales.	C1622.02.01	f
680	Fabricación de boceles y molduras; ripias, duelas de madera, bloques, listones, etcétera, ensamblados en tableros para pisos de parquét; tabiques (mamparas) de madera (excepto los autoestables).	Fabricación de boceles y molduras; ripias, duelas de madera, bloques, listones, etcétera, ensamblados en tableros para pisos de parquét; tabiques (mamparas) de madera (excepto los autoestables).	C1622.02.02	f
681	Fabricación de casas móviles, edificios prefabricados y componentes de los mismos, predominantemente de madera, por ejemplo saunas.	Fabricación de casas móviles, edificios prefabricados y componentes de los mismos, predominantemente de madera, por ejemplo saunas.	C1622.03.01	f
682	Servicios de apoyo a la fabricación de partes y piezas de carpintería para edificios y construcciones a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de partes y piezas de carpintería para edificios y construcciones a cambio de una retribución o por contrato.	C1622.04.01	f
683	Fabricación de toneles, barricas, cubas, tinas  y otros productos de tonelería de madera.	Fabricación de toneles, barricas, cubas, tinas  y otros productos de tonelería de madera.	C1623.01.01	f
684	Fabricación de cajas, cajones, barriles y envases similares, toneles.	Fabricación de cajas, cajones, barriles y envases similares, toneles.	C1623.01.02	f
685	Fabricación de otros recipientes de madera.	Fabricación de otros recipientes de madera.	C1623.01.03	f
686	Fabricación de paletas, paletas-caja y otras bandejas de madera para operaciones de carga.	Fabricación de paletas, paletas-caja y otras bandejas de madera para operaciones de carga.	C1623.02.01	f
687	Fabricación de carretes de madera para cables.	Fabricación de carretes de madera para cables.	C1623.03.01	f
688	Servicios de apoyo a la fabricación de recipientes de madera a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de recipientes de madera a cambio de una retribución o por contrato.	C1623.04.01	f
689	Fabricación de productos de madera: mangos y monturas de herramientas.	Fabricación de productos de madera: mangos y monturas de herramientas.	C1629.11.01	f
690	Fabricación de productos de madera: cepillos y escobas.	Fabricación de productos de madera: cepillos y escobas.	C1629.11.02	f
691	Fabricación de partes de madera para botas o zapatos (tacones), hormas y tensores para botas o zapatos.	Fabricación de partes de madera para botas o zapatos (tacones), hormas y tensores para botas o zapatos.	C1629.12.01	f
692	Fabricación de utensilios de cocina y para uso doméstico de madera.	Fabricación de utensilios de cocina y para uso doméstico de madera.	C1629.13.01	f
693	Fabricación de estatuillas y ornamentos de madera y artículos de marquetería y taracea.	Fabricación de estatuillas y ornamentos de madera y artículos de marquetería y taracea.	C1629.14.01	f
694	Fabricación de marcos de madera para espejos y cuadros, fabricación de bastidores de madera para lienzos de pintor.	Fabricación de marcos de madera para espejos y cuadros, fabricación de bastidores de madera para lienzos de pintor.	C1629.15.01	f
695	Fabricación de cajas de madera para joyas, cuchillos y artículos similares.	Fabricación de cajas de madera para joyas, cuchillos y artículos similares.	C1629.16.01	f
696	Fabricación de carretes, tapas, canillas de bobinas, carretes para hilos de coser y artículos similares de madera torneada.	Fabricación de carretes, tapas, canillas de bobinas, carretes para hilos de coser y artículos similares de madera torneada.	C1629.17.01	f
697	Fabricación de artículos de madera para moblaje del tipo aplique como: percheros para ropa y sombreros, pero no muebles en pie, perchas de madera.	Fabricación de artículos de madera para moblaje del tipo aplique como: percheros para ropa y sombreros, pero no muebles en pie, perchas de madera.	C1629.18.01	f
698	Fabricación de otros artículos de madera: mangos (empuñaduras) para paraguas, bastones y similares, bloques de madera para la elaboración de pipas; palillos, paletas para helados, pinchos, baja lenguas, etcétera, troncos de chimenea hechos de madera prensada o de otros materiales prensados, como moleduras de café o de habas de soya.	Fabricación de otros artículos de madera: mangos (empuñaduras) para paraguas, bastones y similares, bloques de madera para la elaboración de pipas; palillos, paletas para helados, pinchos, baja lenguas, etcétera, troncos de chimenea hechos de madera prensada o de otros materiales prensados, como moleduras de café o de habas de soya.	C1629.19.01	f
701	Fabricación de artículos de corcho natural o corcho aglomerado, incluidos cubrimientos para pisos.	Fabricación de artículos de corcho natural o corcho aglomerado, incluidos cubrimientos para pisos.	C1629.22.01	f
702	Fabricación de cestos y artículos de mimbre, etcétera.	Fabricación de cestos y artículos de mimbre, etcétera.	C1629.23.01	f
703	Fabricación de esteras, esterillas, persianas, cajas, etc.	Fabricación de esteras, esterillas, persianas, cajas, etc.	C1629.23.02	f
704	Fabricación de trenzas y artículos similares de materiales trenzables.	Fabricación de trenzas y artículos similares de materiales trenzables.	C1629.23.03	f
737	Elaboración de papel para revestimiento para vidrios.	Elaboración de papel para revestimiento para vidrios.	C1709.14.02	f
705	Servicios de apoyo a la fabricación de otros productos de madera; fabricación de artículos de corcho, paja y materiales trenzables a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de otros productos de madera; fabricación de artículos de corcho, paja y materiales trenzables a cambio de una retribución o por contrato.	C1629.30.01	f
706	Fabricación de pasta de madera blanqueada.	Fabricación de pasta de madera blanqueada.	C1701.01.01	f
707	Fabricación de pasta de madera blanqueada, semiblanqueada o sin blanquear mediante procesos químicos (con o sin disolución) o semiquímicos.	Fabricación de pasta de madera blanqueada, semiblanqueada o sin blanquear mediante procesos químicos (con o sin disolución) o semiquímicos.	C1701.01.02	f
708	Fabricación de pasta de madera blanqueada, semiblanqueada o sin blanquear mediante procesos mecánicos.	Fabricación de pasta de madera blanqueada, semiblanqueada o sin blanquear mediante procesos mecánicos.	C1701.01.03	f
709	Fabricación de pasta de papel a partir de la eliminación de la tinta y fabricación de pasta de desechos de papel papeles usados; o a partir de residuos textiles, como borras de algodón.	Fabricación de pasta de papel a partir de la eliminación de la tinta y fabricación de pasta de desechos de papel papeles usados; o a partir de residuos textiles, como borras de algodón.	C1701.02.01	f
710	Fabricación de papel y cartón sin revestir.	Fabricación de papel y cartón sin revestir.	C1701.03.01	f
711	Fabricación de papel y cartón multilaminar.	Fabricación de papel y cartón multilaminar.	C1701.03.02	f
712	Fabricación de papel semiquímico sin revestir.	Fabricación de papel semiquímico sin revestir.	C1701.03.03	f
713	Fabricación de papel absorvente.	Fabricación de papel absorvente.	C1701.03.04	f
714	Tratamiento industrial posterior de papel y cartón: revestimiento, recubrimiento e impregnación de papel y cartón; papeles laminados, papel aluminio, papel Kraft, cartulina, papel multilaminar, papeles absorbentes, papel pergamino, papel cigarrillo, papel rizado o plegado, etcétera.	Tratamiento industrial posterior de papel y cartón: revestimiento, recubrimiento e impregnación de papel y cartón; papeles laminados, papel aluminio, papel Kraft, cartulina, papel multilaminar, papeles absorbentes, papel pergamino, papel cigarrillo, papel rizado o plegado, etcétera.	C1701.04.01	f
715	Fabricación de papel periódico.	Fabricación de papel periódico.	C1701.05.01	f
716	Fabricación de otros papeles para imprimir y escribir: papel pergamino vegetal.	Fabricación de otros papeles para imprimir y escribir: papel pergamino vegetal.	C1701.05.02	f
717	Fabricación de otros papeles para escribir.	Fabricación de otros papeles para escribir.	C1701.05.03	f
718	Servicios de apoyo a la fabricación de pasta de madera, papel y cartón a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de pasta de madera, papel y cartón a cambio de una retribución o por contrato.	C1701.06.01	f
719	Fabricación de guata de celulosa y tiras de fibras de celulosa, etcétera.	Fabricación de guata de celulosa y tiras de fibras de celulosa, etcétera.	C1701.09.01	f
720	Fabricación de papel kraft para forros sin revestir para envolver o embalar.	Fabricación de papel kraft para forros sin revestir para envolver o embalar.	C1701.09.02	f
722	Elaboración de otros tipos de papel: papel carbón o papel esténcil en rollos u hojas grandes, papel de calcar.	Elaboración de otros tipos de papel: papel carbón o papel esténcil en rollos u hojas grandes, papel de calcar.	C1701.09.04	f
723	Fabricación de papel revestido, recubierto o impregnado: para escribir o imprimir, papel kraft, cubierto de plástico, etc.	Fabricación de papel revestido, recubierto o impregnado: para escribir o imprimir, papel kraft, cubierto de plástico, etc.	C1701.10.01	f
724	Fabricación de papel rizado o plegado.	Fabricación de papel rizado o plegado.	C1701.11.01	f
725	Fabricación de papel y cartón compuesto (papel laminado con betún u otras sustancias adherentes).	Fabricación de papel y cartón compuesto (papel laminado con betún u otras sustancias adherentes).	C1701.12.01	f
726	Fabricación de otros productos de la reelaboración de papel y cartón de base.	Fabricación de otros productos de la reelaboración de papel y cartón de base.	C1701.13.01	f
727	Fabricación del papel y cartón ondulados o corrugado.	Fabricación del papel y cartón ondulados o corrugado.	C1702.01.01	f
728	Fabricación de envases de papel o de cartón rígido: cajas, cajones, estuches, envases, archivadores de cartón de oficina y artículos similares.	Fabricación de envases de papel o de cartón rígido: cajas, cajones, estuches, envases, archivadores de cartón de oficina y artículos similares.	C1702.02.01	f
729	Fabricación de envases de papel o de cartón ondulado o plegable: cajas, cajones, estuches, envases, archivadores de cartón de oficina y artículos similares.	Fabricación de envases de papel o de cartón ondulado o plegable: cajas, cajones, estuches, envases, archivadores de cartón de oficina y artículos similares.	C1702.02.02	f
730	Fabricación de sacos y de bolsas del papel.	Fabricación de sacos y de bolsas del papel.	C1702.03.01	f
731	Servicios de apoyo a la fabricación de papel y cartón ondulado y de envases de papel y cartón a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de papel y cartón ondulado y de envases de papel y cartón a cambio de una retribución o por contrato.	C1702.04.01	f
732	Fabricación de productos de papel de higiene personal y productos de guata de celulosa y materiales textiles: pañuelos de limpieza, toallas, servilletas, papel higiénico, toallas sanitarias y tampones, toallas para desmaquillar, pañales para bebes y similares, etcétera.	Fabricación de productos de papel de higiene personal y productos de guata de celulosa y materiales textiles: pañuelos de limpieza, toallas, servilletas, papel higiénico, toallas sanitarias y tampones, toallas para desmaquillar, pañales para bebes y similares, etcétera.	C1709.11.01	f
733	Fabricación de artículos de uso domésticos vasos, platos y bandejas, bandejas para guardar huevos y otros productos para envasado, de papel o cartón moldeado.	Fabricación de artículos de uso domésticos vasos, platos y bandejas, bandejas para guardar huevos y otros productos para envasado, de papel o cartón moldeado.	C1709.12.01	f
734	Elaboración de bobinas de papel o cartón.	Elaboración de bobinas de papel o cartón.	C1709.13.01	f
735	Elaboración de carretes, tapas, etcétera, de papel o cartón.	Elaboración de carretes, tapas, etcétera, de papel o cartón.	C1709.13.02	f
736	Elaboración de papel para empapelar y cubrimientos similares para pared.	Elaboración de papel para empapelar y cubrimientos similares para pared.	C1709.14.01	f
738	Elaboración de papel para empapelar textil y recubierto de vinilo, revestimiento para pisos.	Elaboración de papel para empapelar textil y recubierto de vinilo, revestimiento para pisos.	C1709.14.03	f
739	Elaboración de prendas y complementos de vestir de papel o guata de celulosa.	Elaboración de prendas y complementos de vestir de papel o guata de celulosa.	C1709.15.01	f
740	Fabricación de bloques, planchas y placas filtrantes de pasta de papel.	Fabricación de bloques, planchas y placas filtrantes de pasta de papel.	C1709.16.01	f
741	Fabricación de papel para impresora de computadora; papel para imprimir y escribir u otros usos gráficos listo para usar, cortado o perforado, rayado, etcétera (papel Bond, etiqueta, couché).	Fabricación de papel para impresora de computadora; papel para imprimir y escribir u otros usos gráficos listo para usar, cortado o perforado, rayado, etcétera (papel Bond, etiqueta, couché).	C1709.21.01	f
742	Elaboración de papel de esténcil, autocopia y otros papeles para copiar o transferir, listo para usar.	Elaboración de papel de esténcil, autocopia y otros papeles para copiar o transferir, listo para usar.	C1709.22.01	f
743	Fabricación de papel engomado o adhesivo listo para usar (cintas o rollos), elaboración de sobres, aerogramas, cartas y tarjetas.	Fabricación de papel engomado o adhesivo listo para usar (cintas o rollos), elaboración de sobres, aerogramas, cartas y tarjetas.	C1709.23.01	f
744	Fabricación de registros, libros de contabilidad, cuadernos y artículos de papelería similares de uso educativo o comercial, cuando la información impresa no constituya su característica principal.	Fabricación de registros, libros de contabilidad, cuadernos y artículos de papelería similares de uso educativo o comercial, cuando la información impresa no constituya su característica principal.	C1709.24.01	f
745	Fabricación de cajas, bolsas (fundas), carpetas y juegos de escritorio que contengan una variedad de artículos de papelería, recados de escribir que contienen papel para correspondencia.	Fabricación de cajas, bolsas (fundas), carpetas y juegos de escritorio que contengan una variedad de artículos de papelería, recados de escribir que contienen papel para correspondencia.	C1709.25.01	f
746	Fabricación de artículos de papelería, esquelas o tarjetas postales en blanco, etcétera.	Fabricación de artículos de papelería, esquelas o tarjetas postales en blanco, etcétera.	C1709.25.02	f
747	Fabricación de otros artículos de papel: artículos de fantasía de papel, artículos promocionales y de regalo de papel,  cuerdas y cordajes de papel, papel regalo, etcétera.	Fabricación de otros artículos de papel: artículos de fantasía de papel, artículos promocionales y de regalo de papel,  cuerdas y cordajes de papel, papel regalo, etcétera.	C1709.29.01	f
748	Fabricación de papel y cartón filtro.	Fabricación de papel y cartón filtro.	C1709.29.02	f
749	Fabricación de otros artículos de papel: etiquetas impresas o sin imprimir.	Fabricación de otros artículos de papel: etiquetas impresas o sin imprimir.	C1709.29.03	f
750	Fabricación de otros artículos de papel o cartón: papel impreso para aparatos de grabación automática.	Fabricación de otros artículos de papel o cartón: papel impreso para aparatos de grabación automática.	C1709.29.04	f
752	Servicios de apoyo a la fabricación de otros artículos del papel y cartón a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de otros artículos del papel y cartón a cambio de una retribución o por contrato.	C1709.30.01	f
753	Actividades de impresión de periódicos.	Actividades de impresión de periódicos.	C1811.01.01	f
754	Actividades de impresión de revistas y otras publicaciones periódicas.	Actividades de impresión de revistas y otras publicaciones periódicas.	C1811.01.02	f
755	Actividades de impresión de libros.	Actividades de impresión de libros.	C1811.02.01	f
756	Actividades de folletos, manuscritos musicales y partitura, mapas, atlas, carteles, etcétera; mediante impresión por Offset, fotograbación, impresión flexográfica e impresión en otros tipos de prensa, maquinas autocopistas, impresoras estampadoras, etcétera, incluida la impresión rápida.	Actividades de folletos, manuscritos musicales y partitura, mapas, atlas, carteles, etcétera; mediante impresión por Offset, fotograbación, impresión flexográfica e impresión en otros tipos de prensa, maquinas autocopistas, impresoras estampadoras, etcétera, incluida la impresión rápida.	C1811.02.02	f
757	Actividades de diccionarios, enciclopedias, etcétera; mediante impresión por Offset, fotograbación, impresión flexográfica e impresión en otros tipos de prensa, maquinas autocopistas, impresoras estampadoras, etcétera, incluida la impresión rápida.	Actividades de diccionarios, enciclopedias, etcétera; mediante impresión por Offset, fotograbación, impresión flexográfica e impresión en otros tipos de prensa, maquinas autocopistas, impresoras estampadoras, etcétera, incluida la impresión rápida.	C1811.02.03	f
758	Actividades de impresión de sellos de correo, estampillas y timbres fiscales, documentos de títulos, boletos de entradas a espectáculos, cheques y otros valores o documentos de garantía y de seguridad, mediante impresión por Offset, fotograbación, impresión flexográfica e impresión en otros tipos de prensa, maquinas autocopistas, impresoras estampadoras, etcétera, incluida la impresión rápida.	Actividades de impresión de sellos de correo, estampillas y timbres fiscales, documentos de títulos, boletos de entradas a espectáculos, cheques y otros valores o documentos de garantía y de seguridad, mediante impresión por Offset, fotograbación, impresión flexográfica e impresión en otros tipos de prensa, maquinas autocopistas, impresoras estampadoras, etcétera, incluida la impresión rápida.	C1811.03.01	f
759	Actividades de impresión de catálogos para fabricantes de máquinas.	Actividades de impresión de catálogos para fabricantes de máquinas.	C1811.04.01	f
780	Servicios de apoyo a la fabricación de productos de horno de coque a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de productos de horno de coque a cambio de una retribución o por contrato.	C1910.03.01	f
1107	Producción de alúmina y matas de cobre.	Producción de alúmina y matas de cobre.	C2420.26.02	f
760	Actividades de impresión de pósters, gigantografías, catálogos de publicidad, prospectos y otros impresos publicitarios mediante impresión por Offset, fotograbación, impresión flexográfica e impresión en otros tipos de prensa, maquinas autocopistas, impresoras estampadoras, etcétera, incluida la impresión rápida.	Actividades de impresión de pósters, gigantografías, catálogos de publicidad, prospectos y otros impresos publicitarios mediante impresión por Offset, fotograbación, impresión flexográfica e impresión en otros tipos de prensa, maquinas autocopistas, impresoras estampadoras, etcétera, incluida la impresión rápida.	C1811.04.02	f
783	Fabricación de grasas lubricantes a base de petróleo, incluido los fabricados a partir de residuos del petróleo.	Fabricación de grasas lubricantes a base de petróleo, incluido los fabricados a partir de residuos del petróleo.	C1920.02.02	f
761	Actividades de impresión de calendarios, formularios comerciales, directorios y otros materiales impresos de uso comercial, papel de correspondencia álbumes, agendas personales, diarios, tarjetas de invitación, de visita, de presentación y otros materiales impresos mediante impresión por Offset, fotograbación, impresión flexográfica e impresión en otros tipos de prensa, maquinas autocopistas, impresoras estampadoras, etcétera, incluida la impresión rápida.	Actividades de impresión de calendarios, formularios comerciales, directorios y otros materiales impresos de uso comercial, papel de correspondencia álbumes, agendas personales, diarios, tarjetas de invitación, de visita, de presentación y otros materiales impresos mediante impresión por Offset, fotograbación, impresión flexográfica e impresión en otros tipos de prensa, maquinas autocopistas, impresoras estampadoras, etcétera, incluida la impresión rápida.	C1811.04.03	f
762	Actividades de impresión directa en textiles, plásticos, vidrio, metal, madera y cerámica (excepto serigrafía sobre textiles o prendas de vestir).	Actividades de impresión directa en textiles, plásticos, vidrio, metal, madera y cerámica (excepto serigrafía sobre textiles o prendas de vestir).	C1811.05.01	f
763	Actividades de Impresión en etiquetas o marbetes (por procedimientos litográficos, de rotograbado, flexográficos, u otros).	Actividades de Impresión en etiquetas o marbetes (por procedimientos litográficos, de rotograbado, flexográficos, u otros).	C1811.06.01	f
764	Impresión de papel moneda para el gobierno.	Impresión de papel moneda para el gobierno.	C1811.07.01	f
765	Actividades de encuadernación de hojas impresas para confeccionar libros, folletos, revistas, catálogos etcétera, mediante el colado, cortado, ensamblado, engomado, compaginado, hilvanado (cosido), encuadernado con adhesivo, recortado, estampado en oro, encuadernación espiral, etcétera.	Actividades de encuadernación de hojas impresas para confeccionar libros, folletos, revistas, catálogos etcétera, mediante el colado, cortado, ensamblado, engomado, compaginado, hilvanado (cosido), encuadernado con adhesivo, recortado, estampado en oro, encuadernación espiral, etcétera.	C1812.01.01	f
766	Actividades de servicios de preparación de placas, planchas y tintes para el estampado y la impresión e impresión en relieve (incluidas planchas de fotopolímeros), preparación de la composición de imágenes y placas para imprentas tipográficas y de Offset. Composición tipografía, fotocomposición, la incorporación de datos antes de la impresión, incluso mediante el escaneo y reconocimiento óptico de caracteres, compaginación electrónica y grabado de cilindros para rotograbado.	Actividades de servicios de preparación de placas, planchas y tintes para el estampado y la impresión e impresión en relieve (incluidas planchas de fotopolímeros), preparación de la composición de imágenes y placas para imprentas tipográficas y de Offset. Composición tipografía, fotocomposición, la incorporación de datos antes de la impresión, incluso mediante el escaneo y reconocimiento óptico de caracteres, compaginación electrónica y grabado de cilindros para rotograbado.	C1812.02.01	f
767	Actividades de diseño de productos impresos por ejemplo bocetos, diagramas, patrones, croquis, maquetas, etcétera, producción de pruebas.	Actividades de diseño de productos impresos por ejemplo bocetos, diagramas, patrones, croquis, maquetas, etcétera, producción de pruebas.	C1812.03.01	f
768	Actividades de producción de obras artísticas incluso piedras litográficas y planchas de madera preparadas.	Actividades de producción de obras artísticas incluso piedras litográficas y planchas de madera preparadas.	C1812.04.01	f
769	Actividades de producción de productos de reprografía (copiadora).	Actividades de producción de productos de reprografía (copiadora).	C1812.05.01	f
770	Actividades de servicios combinados de impresión de texto e imágenes.	Actividades de servicios combinados de impresión de texto e imágenes.	C1812.06.01	f
771	Actividades graficas, como el estampado en hueco y estampado a troquel, impresión de libros Braille, troquelado y perforado, estampado en relieve, barnizado y laminado, alzado, encartación y plegado.	Actividades graficas, como el estampado en hueco y estampado a troquel, impresión de libros Braille, troquelado y perforado, estampado en relieve, barnizado y laminado, alzado, encartación y plegado.	C1812.07.01	f
772	Otros actividades de servicios relacionados con la impresión: servicios de preparación de datos digitales, etcétera.	Otros actividades de servicios relacionados con la impresión: servicios de preparación de datos digitales, etcétera.	C1812.09.01	f
773	Actividades de reproducción a partir de copias matrices (originales) de: discos gramofónicos, discos compactos y cintas con música u otras grabaciones de sonido.	Actividades de reproducción a partir de copias matrices (originales) de: discos gramofónicos, discos compactos y cintas con música u otras grabaciones de sonido.	C1820.01.01	f
774	Actividades de reproducción de copias matrices (originales) de discos, discos compactos, cintas con películas y otras grabaciones de video.	Actividades de reproducción de copias matrices (originales) de discos, discos compactos, cintas con películas y otras grabaciones de video.	C1820.02.01	f
775	Actividades de reproducción a partir de copias matrices de programas informáticos y datos en discos.	Actividades de reproducción a partir de copias matrices de programas informáticos y datos en discos.	C1820.03.01	f
776	Explotación de hornos de coque para la producción de alquitranes de hulla y carbón de retorta.	Explotación de hornos de coque para la producción de alquitranes de hulla y carbón de retorta.	C1910.01.01	f
777	Explotación de hornos de coque para la producción de lignito crudos, etc.	Explotación de hornos de coque para la producción de lignito crudos, etc.	C1910.01.02	f
778	Explotación de hornos de coque para la producción de coque o semicoque, brea y coque de brea, gas de horno de coque.	Explotación de hornos de coque para la producción de coque o semicoque, brea y coque de brea, gas de horno de coque.	C1910.01.03	f
781	Producción de combustibles para motores: gasolina, queroseno etcétera; fueloil ligero, medio y pesado, gases de refinería como etano, butano o propano, etcétera, recuperación de gases de petróleo licuados en el refinamiento de petróleo.	Producción de combustibles para motores: gasolina, queroseno etcétera; fueloil ligero, medio y pesado, gases de refinería como etano, butano o propano, etcétera, recuperación de gases de petróleo licuados en el refinamiento de petróleo.	C1920.01.01	f
782	Fabricación de aceites lubricantes a base de petróleo, incluido los fabricados a partir de residuos del petróleo.	Fabricación de aceites lubricantes a base de petróleo, incluido los fabricados a partir de residuos del petróleo.	C1920.02.01	f
784	Fabricación de productos para la industria petroquímica y para la fabricación de pavimentos de carreteras.	Fabricación de productos para la industria petroquímica y para la fabricación de pavimentos de carreteras.	C1920.03.01	f
785	Fabricación de briquetas de carbón de piedra.	Fabricación de briquetas de carbón de piedra.	C1920.04.01	f
786	Fabricación de briquetas de lignito.	Fabricación de briquetas de lignito.	C1920.04.02	f
787	Fabricación de biocombustibles, es decir la mezcla de alcoholes con petróleo por ejemplo: Gasohol.	Fabricación de biocombustibles, es decir la mezcla de alcoholes con petróleo por ejemplo: Gasohol.	C1920.05.01	f
788	Servicios de apoyo a la fabricación de productos de la refinación del petróleo a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de productos de la refinación del petróleo a cambio de una retribución o por contrato.	C1920.06.01	f
789	Fabricación de otros productos de la refinación del petróleo: vaselina, cera de parafina, jalea de petróleo (petrolato), briquetas de petróleo etcétera.	Fabricación de otros productos de la refinación del petróleo: vaselina, cera de parafina, jalea de petróleo (petrolato), briquetas de petróleo etcétera.	C1920.09.01	f
790	Fabricación de otros productos de la refinación del petróleo: bencina mineral (aguarrás), etc.	Fabricación de otros productos de la refinación del petróleo: bencina mineral (aguarrás), etc.	C1920.09.02	f
791	Fabricación de aire líquido o comprimido (oxigeno).	Fabricación de aire líquido o comprimido (oxigeno).	C2011.11.01	f
792	Fabricación de gases industriales o médicos inorgánicos, licuados o comprimidos: gases inertes como el dióxido de carbono (anhídrido carbónico), gases aislantes.	Fabricación de gases industriales o médicos inorgánicos, licuados o comprimidos: gases inertes como el dióxido de carbono (anhídrido carbónico), gases aislantes.	C2011.11.02	f
793	Fabricación de gases refrigerantes.	Fabricación de gases refrigerantes.	C2011.11.03	f
794	Fabricación de mezclas de gases industriales (gases carbónicos), gases elementales.	Fabricación de mezclas de gases industriales (gases carbónicos), gases elementales.	C2011.11.04	f
795	Fabricación de álcalis, lejías y otras bases inorgánicas: pigmentos inorgánicos.	Fabricación de álcalis, lejías y otras bases inorgánicas: pigmentos inorgánicos.	C2011.12.01	f
796	Fabricación de álcalis, lejías y otras bases inorgánicas: hipoclorito de sodio.	Fabricación de álcalis, lejías y otras bases inorgánicas: hipoclorito de sodio.	C2011.12.02	f
797	Elaboración de elementos químicos (excepto gases industriales y metales básicos).	Elaboración de elementos químicos (excepto gases industriales y metales básicos).	C2011.13.01	f
798	Fabricación de ácidos inorgánicos excepto acido nítrico.	Fabricación de ácidos inorgánicos excepto acido nítrico.	C2011.14.01	f
799	Fabricación de otros compuestos químicos inorgánicos ( como cloro doméstico).	Fabricación de otros compuestos químicos inorgánicos ( como cloro doméstico).	C2011.19.01	f
800	Fabricación de alcoholes cíclicos y acíclicos, fenoles y fenoles-alcoholes, sorbitol, metanol y alcoholes superiores (incluso alcohol etílico sintético).	Fabricación de alcoholes cíclicos y acíclicos, fenoles y fenoles-alcoholes, sorbitol, metanol y alcoholes superiores (incluso alcohol etílico sintético).	C2011.21.01	f
801	Fabricación de compuestos orgánicos de función nitrógeno, incluso aminas (cuerpo derivado del amoníaco).	Fabricación de compuestos orgánicos de función nitrógeno, incluso aminas (cuerpo derivado del amoníaco).	C2011.22.01	f
802	Fabricación de compuestos de función nitrilo.	Fabricación de compuestos de función nitrilo.	C2011.22.02	f
803	Fabricación de hidrocarburos cíclicos y acíclicos, saturados y no saturados, benceno, tolueno, xileno y otros productos de la destilación de alquitrán, hulla o aceite mineral, producción de brea y coque de brea.	Fabricación de hidrocarburos cíclicos y acíclicos, saturados y no saturados, benceno, tolueno, xileno y otros productos de la destilación de alquitrán, hulla o aceite mineral, producción de brea y coque de brea.	C2011.23.01	f
804	Fabricación de ácidos monocarboxílicos y policarboxílicos, incluido acido acético.	Fabricación de ácidos monocarboxílicos y policarboxílicos, incluido acido acético.	C2011.24.01	f
805	Fermentación de caña de azúcar, maíz o similares para producir alcohol y esteres.	Fermentación de caña de azúcar, maíz o similares para producir alcohol y esteres.	C2011.25.01	f
806	Fabricación de compuestos de función oxigeno, incluso aldehídos, cetonas, quinonas y compuestos duales o múltiples de función oxígeno.	Fabricación de compuestos de función oxigeno, incluso aldehídos, cetonas, quinonas y compuestos duales o múltiples de función oxígeno.	C2011.26.01	f
807	Fabricación de carbón vegetal y otros productos de la destilación de madera.	Fabricación de carbón vegetal y otros productos de la destilación de madera.	C2011.27.01	f
808	Fabricación de otros compuestos orgánicos, glicerina sintética, etcétera.	Fabricación de otros compuestos orgánicos, glicerina sintética, etcétera.	C2011.29.01	f
809	Servicios de apoyo a la fabricación de substancias químicas básicas a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de substancias químicas básicas a cambio de una retribución o por contrato.	C2011.30.01	f
810	Fabricación de aleaciones, dispersiones, mezclas de uranio natural o sus compuestos.	Fabricación de aleaciones, dispersiones, mezclas de uranio natural o sus compuestos.	C2011.31.01	f
811	Fabricación de uranio 235 emprobecido y sus compuestos, torio y sus compuestos o aleaciones, dispersiones o mezclas de estos compuestos.	Fabricación de uranio 235 emprobecido y sus compuestos, torio y sus compuestos o aleaciones, dispersiones o mezclas de estos compuestos.	C2011.32.01	f
812	Fabricación de uranio enriquecido y sus compuestos, plutonio y sus compuestos o aleaciones, dispersiones o mezclas de estos compuestos.	Fabricación de uranio enriquecido y sus compuestos, plutonio y sus compuestos o aleaciones, dispersiones o mezclas de estos compuestos.	C2011.33.01	f
813	Fabricación de elementos combustibles no irradiados para su utilización en reactores nucleares.	Fabricación de elementos combustibles no irradiados para su utilización en reactores nucleares.	C2011.34.01	f
814	Fabricación de otros elementos, isótopos o compuestos radiactivos.	Fabricación de otros elementos, isótopos o compuestos radiactivos.	C2011.35.01	f
815	Fabricación de materias colorantes, tintes y pigmentos de cualquier origen en forma básica o como concentrado, de origen orgánico sintético.	Fabricación de materias colorantes, tintes y pigmentos de cualquier origen en forma básica o como concentrado, de origen orgánico sintético.	C2011.91.01	f
816	Fabricación de materias colorantes, tintes y pigmentos de cualquier origen en forma básica o como concentrado, de origen vegeal o animal.	Fabricación de materias colorantes, tintes y pigmentos de cualquier origen en forma básica o como concentrado, de origen vegeal o animal.	C2011.91.02	f
817	Fabricación de productos usados como agentes avivadores fluorescentes o como luminóforos.	Fabricación de productos usados como agentes avivadores fluorescentes o como luminóforos.	C2011.92.01	f
818	Fabricación de otros productos aromáticos orgánicos y sintéticos.	Fabricación de otros productos aromáticos orgánicos y sintéticos.	C2011.93.01	f
819	Fabricación de productos curtientes sintéticos.	Fabricación de productos curtientes sintéticos.	C2011.94.01	f
820	Fabricación de productos curtientes de origen vegetal o animal.	Fabricación de productos curtientes de origen vegetal o animal.	C2011.94.02	f
821	Actividades de enriquecimiento de minerales de uranio, plutonio, torio y producción de elementos combustibles para reactores nucleares.	Actividades de enriquecimiento de minerales de uranio, plutonio, torio y producción de elementos combustibles para reactores nucleares.	C2011.95.01	f
822	Fabricación de agua destilada.	Fabricación de agua destilada.	C2011.96.01	f
823	Actividades de tostado de piritas de hierro.	Actividades de tostado de piritas de hierro.	C2011.97.01	f
824	Fabricación de productos químicos inorgánicos básicos n.c.p.	Fabricación de productos químicos inorgánicos básicos n.c.p.	C2011.98.01	f
825	Fabricación de abonos nitrogenados puros o complejos, úrea.	Fabricación de abonos nitrogenados puros o complejos, úrea.	C2012.01.01	f
826	Fabricación de abonos fosfatados, puros o complejos.	Fabricación de abonos fosfatados, puros o complejos.	C2012.01.02	f
827	Fabricación de abonos potásicos puros o complejos.	Fabricación de abonos potásicos puros o complejos.	C2012.01.03	f
828	Fabricación de fosfatos naturales en crudo y sales de potasio naturales crudas.	Fabricación de fosfatos naturales en crudo y sales de potasio naturales crudas.	C2012.01.04	f
829	Fabricación de productos nitrogenados conexos: acido nítrico y sulfonítrico.	Fabricación de productos nitrogenados conexos: acido nítrico y sulfonítrico.	C2012.02.01	f
830	Fabricación de productos nitrogenados conexos: amoníaco, cloruro de amonio, carbonato de amonio.	Fabricación de productos nitrogenados conexos: amoníaco, cloruro de amonio, carbonato de amonio.	C2012.02.02	f
831	Fabricación de productos nitrogenados conexos: nitritos y nitratos de potasio.	Fabricación de productos nitrogenados conexos: nitritos y nitratos de potasio.	C2012.02.03	f
832	Fabricación de sustratos (tierra para macetas) hechos principalmente de turba; de mezclas de tierra natural, arena, arcilla y minerales.	Fabricación de sustratos (tierra para macetas) hechos principalmente de turba; de mezclas de tierra natural, arena, arcilla y minerales.	C2012.03.01	f
833	Servicios de apoyo a la fabricación de abonos y compuestos de nitrógeno a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de abonos y compuestos de nitrógeno a cambio de una retribución o por contrato.	C2012.04.01	f
834	Fabricación de plásticos en formas primarias: aminoresinas, resinas fenólicas y poliuretanos.	Fabricación de plásticos en formas primarias: aminoresinas, resinas fenólicas y poliuretanos.	C2013.11.01	f
835	Fabricación de plásticos en formas primarias: resinas epoxídicas, resinas de poliéster, poliacetales.	Fabricación de plásticos en formas primarias: resinas epoxídicas, resinas de poliéster, poliacetales.	C2013.11.02	f
836	Fabricación de plásticos en formas primarias: policarbonatos, resinas alquídicas.	Fabricación de plásticos en formas primarias: policarbonatos, resinas alquídicas.	C2013.11.03	f
837	Fabricación de plásticos en formas primarias: polímeros, incluidos los polímeros de etileno, propileno, estireno, cloruro de vinillo, acetato de vinillo y acrílicos.	Fabricación de plásticos en formas primarias: polímeros, incluidos los polímeros de etileno, propileno, estireno, cloruro de vinillo, acetato de vinillo y acrílicos.	C2013.11.04	f
838	Fabricación de plásticos en formas primarias: resinas de petróleo, politerpenos, polisulfuros, polisulfonas.	Fabricación de plásticos en formas primarias: resinas de petróleo, politerpenos, polisulfuros, polisulfonas.	C2013.11.05	f
839	Fabricación de plásticos en formas primarias: siliconas.	Fabricación de plásticos en formas primarias: siliconas.	C2013.11.06	f
840	Fabricación de polímeros naturales, ácido algínico.	Fabricación de polímeros naturales, ácido algínico.	C2013.11.07	f
841	Fabricación de plásticos en formas primarias: intercambiadores de iones basados en polímeros.	Fabricación de plásticos en formas primarias: intercambiadores de iones basados en polímeros.	C2013.11.08	f
842	Fabricación de plásticos en formas primarias: Poliamidas.	Fabricación de plásticos en formas primarias: Poliamidas.	C2013.11.09	f
843	Fabricación de otras formas primarias de plásticos: esteres de polialilo, olefinas halogenadas, etc.	Fabricación de otras formas primarias de plásticos: esteres de polialilo, olefinas halogenadas, etc.	C2013.11.10	f
844	Fabricación de celulosa y sus derivados químicos.	Fabricación de celulosa y sus derivados químicos.	C2013.12.01	f
845	Fabricación de placas de identificación.	Fabricación de placas de identificación.	C2013.13.01	f
846	Fabricación de tarjetas y otros similares de plástico.	Fabricación de tarjetas y otros similares de plástico.	C2013.13.02	f
847	Fabricación de linoleo y otros materiales duros para revestir pisos.	Fabricación de linoleo y otros materiales duros para revestir pisos.	C2013.14.01	f
848	Fabricación de caucho sintético en formas primarias: caucho sintético, artificial.	Fabricación de caucho sintético en formas primarias: caucho sintético, artificial.	C2013.21.01	f
849	Fabricación de aceite vegetal vulcanizado.	Fabricación de aceite vegetal vulcanizado.	C2013.22.01	f
850	Fabricación de mezclas de caucho sintético.	Fabricación de mezclas de caucho sintético.	C2013.23.01	f
851	Fabricación de mezclas de caucho natural o gomas similares al caucho (balata).	Fabricación de mezclas de caucho natural o gomas similares al caucho (balata).	C2013.23.02	f
852	Servicios de apoyo a la fabricación de plásticos y de cauchos sintético en formas primarias a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de plásticos y de cauchos sintético en formas primarias a cambio de una retribución o por contrato.	C2013.30.01	f
857	Fabricación de productos antigerminantes.	Fabricación de productos antigerminantes.	C2021.01.05	f
858	Fabricación de reguladores del crecimiento de las plantas.	Fabricación de reguladores del crecimiento de las plantas.	C2021.01.06	f
859	Fabricación de desinfectantes de uso agropecuario y para otros usos.	Fabricación de desinfectantes de uso agropecuario y para otros usos.	C2021.02.01	f
860	Servicios de apoyo a la fabricación de plaguicidas y otros productos químicos de uso agropecuario a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de plaguicidas y otros productos químicos de uso agropecuario a cambio de una retribución o por contrato.	C2021.03.01	f
861	Fabricación de otros productos químicos de uso agropecuario n.c.p.	Fabricación de otros productos químicos de uso agropecuario n.c.p.	C2021.09.01	f
862	Fabricación de pinturas, barnices, esmaltes o lacas.	Fabricación de pinturas, barnices, esmaltes o lacas.	C2022.01.01	f
863	Fabricación de pigmentos y tintes, opacificadores y colores preparados.	Fabricación de pigmentos y tintes, opacificadores y colores preparados.	C2022.01.02	f
864	Fabricación de otras pinturas y productos similares.	Fabricación de otras pinturas y productos similares.	C2022.01.03	f
865	Fabricación de esmaltes vitrificables y barnices para vidriar y enlucidos cerámicos y preparados similares; pigmentos y tintes, opacificadores y colores preparados	Fabricación de esmaltes vitrificables y barnices para vidriar y enlucidos cerámicos y preparados similares; pigmentos y tintes, opacificadores y colores preparados	C2022.02.01	f
866	Fabricación de masillas, compuestos para calafatear y preparados similares no refractarios para relleno y enlucido.	Fabricación de masillas, compuestos para calafatear y preparados similares no refractarios para relleno y enlucido.	C2022.03.01	f
867	Fabricación de disolventes y diluyentes compuestos orgánicos: decapantes (removedores) de pintura y barniz preparados (thiñer).	Fabricación de disolventes y diluyentes compuestos orgánicos: decapantes (removedores) de pintura y barniz preparados (thiñer).	C2022.04.01	f
868	Fabricación de tinta de imprenta.	Fabricación de tinta de imprenta.	C2022.05.01	f
869	Servicios de apoyo a la fabricación de pinturas, barnices y productos de revestimiento similares, tintas de imprenta y masillas a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de pinturas, barnices y productos de revestimiento similares, tintas de imprenta y masillas a cambio de una retribución o por contrato.	C2022.06.01	f
870	Fabricación de agentes orgánicos tensoactivos y preparados tensoactivos (detergentes) para lavar en polvo o líquidos.	Fabricación de agentes orgánicos tensoactivos y preparados tensoactivos (detergentes) para lavar en polvo o líquidos.	C2023.11.01	f
871	Fabricación de barras (jabón), pastillas, piezas, preparados para fregar platos (lavavajillas); suavizantes textiles, incluido jabón cosmético.	Fabricación de barras (jabón), pastillas, piezas, preparados para fregar platos (lavavajillas); suavizantes textiles, incluido jabón cosmético.	C2023.11.02	f
872	Fabricación de detergentes y otros materiales impregnados, revestidos o recubiertos con jabón o detergentes.	Fabricación de detergentes y otros materiales impregnados, revestidos o recubiertos con jabón o detergentes.	C2023.12.01	f
873	Fabricación de glicerina en bruto.	Fabricación de glicerina en bruto.	C2023.12.02	f
874	Fabricación de papel, guata, fieltro y otros materiales impregnados.	Fabricación de papel, guata, fieltro y otros materiales impregnados.	C2023.12.03	f
875	Fabricación de productos de limpieza: Preparados para perfumar y desodorizar ambientes, polvos o pastas de limpieza incluidos papel, guata, etcétera, revestido o recubierto con estos productos de limpieza.	Fabricación de productos de limpieza: Preparados para perfumar y desodorizar ambientes, polvos o pastas de limpieza incluidos papel, guata, etcétera, revestido o recubierto con estos productos de limpieza.	C2023.21.01	f
876	Fabricación de productos para pulir y abrillantar: lustres y cremas para pisos.	Fabricación de productos para pulir y abrillantar: lustres y cremas para pisos.	C2023.22.01	f
877	Fabricación de productos para pulir y abrillantar:  lustres para carrocerías de automóviles.	Fabricación de productos para pulir y abrillantar:  lustres para carrocerías de automóviles.	C2023.22.02	f
878	Fabricación de productos para pulir y abrillantar: lustres y cremas para vidrio y metal.	Fabricación de productos para pulir y abrillantar: lustres y cremas para vidrio y metal.	C2023.22.03	f
879	Fabricación de productos para pulir y abrillantar: betunes y cremas para el calzado.	Fabricación de productos para pulir y abrillantar: betunes y cremas para el calzado.	C2023.22.04	f
880	Fabricación de productos para pulir y abrillantar: ceras artificiales y ceras preparadas.	Fabricación de productos para pulir y abrillantar: ceras artificiales y ceras preparadas.	C2023.22.05	f
881	Fabricación de productos para pulir y abrillantar: plásticos celulares o de caucho celular impregnados, revestidos o recubiertos de lustradores o cremas.	Fabricación de productos para pulir y abrillantar: plásticos celulares o de caucho celular impregnados, revestidos o recubiertos de lustradores o cremas.	C2023.22.06	f
882	Fabricación de perfumes y aguas de colonia.	Fabricación de perfumes y aguas de colonia.	C2023.31.01	f
884	Fabricación de preparados de belleza y de maquillaje, cremas solares y preparados bronceadores, preparados para manicura y pedicura.	Fabricación de preparados de belleza y de maquillaje, cremas solares y preparados bronceadores, preparados para manicura y pedicura.	C2023.31.03	f
885	Fabricación de productos para peluquería y cuidado del cabello: champú, tintes, lacas para el cabello, preparados para ondular y alisar el cabello, etcétera.	Fabricación de productos para peluquería y cuidado del cabello: champú, tintes, lacas para el cabello, preparados para ondular y alisar el cabello, etcétera.	C2023.32.01	f
886	Fabricación de preparados para el afeitado, incluso para antes y después de afeitar.	Fabricación de preparados para el afeitado, incluso para antes y después de afeitar.	C2023.39.01	f
887	Fabricación de otros productos de perfumería y tocador: depiladores, etcétera.	Fabricación de otros productos de perfumería y tocador: depiladores, etcétera.	C2023.39.02	f
888	Fabricación de otros productos de perfumería y tocador: dentífrico y preparados de higiene bucal y dental.	Fabricación de otros productos de perfumería y tocador: dentífrico y preparados de higiene bucal y dental.	C2023.39.03	f
889	Fabricación de preparados para la fijación de dentaduras postizas.	Fabricación de preparados para la fijación de dentaduras postizas.	C2023.39.04	f
890	Fabricación de otros productos de perfumería y tocador: preparados para perfumar o desodorizar el ambiente.	Fabricación de otros productos de perfumería y tocador: preparados para perfumar o desodorizar el ambiente.	C2023.39.05	f
891	Fabricación de desodorantes y sales de baño; etcétera.	Fabricación de desodorantes y sales de baño; etcétera.	C2023.39.06	f
892	Servicios de apoyo a la fabricación de jabones y detergentes, preparados para limpiar y pulir, perfumes y preparados de tocador a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de jabones y detergentes, preparados para limpiar y pulir, perfumes y preparados de tocador a cambio de una retribución o por contrato.	C2023.40.01	f
893	Fabricación de grasas y aceites modificados químicamente; aceites esenciales; resinoides, aguas destiladas aromáticas; fabricación de mezclas de productos odoríferos para la elaboración de perfumes o alimentos; fabricación de extractos de productos aromáticos naturales.	Fabricación de grasas y aceites modificados químicamente; aceites esenciales; resinoides, aguas destiladas aromáticas; fabricación de mezclas de productos odoríferos para la elaboración de perfumes o alimentos; fabricación de extractos de productos aromáticos naturales.	C2029.11.01	f
894	Fabricación de carbón activado, aditivos para aceites lubricantes, preparados para acelerar la vulcanización del caucho, catalizadores; preparados aditivos para cementos y otros productos químicos de uso industrial.	Fabricación de carbón activado, aditivos para aceites lubricantes, preparados para acelerar la vulcanización del caucho, catalizadores; preparados aditivos para cementos y otros productos químicos de uso industrial.	C2029.12.01	f
895	Fabricación de materiales para el acabado de productos textiles y de cuero.	Fabricación de materiales para el acabado de productos textiles y de cuero.	C2029.13.01	f
896	Fabricación de preparados antidetonantes.	Fabricación de preparados antidetonantes.	C2029.14.01	f
897	Fabricación de preparados anticongelantes.	Fabricación de preparados anticongelantes.	C2029.14.02	f
898	Fabricación de líquidos para transmisiones hidráulicas.	Fabricación de líquidos para transmisiones hidráulicas.	C2029.14.03	f
899	Fabricación de reactivos compuestos para diagnóstico y laboratorio.	Fabricación de reactivos compuestos para diagnóstico y laboratorio.	C2029.15.01	f
900	Fabricación de gelatina y derivados de la gelatina.	Fabricación de gelatina y derivados de la gelatina.	C2029.16.01	f
902	Fabricación de preparados adhesivos, incluyendo pegamento y adhesivo a base de caucho.	Fabricación de preparados adhesivos, incluyendo pegamento y adhesivo a base de caucho.	C2029.16.03	f
903	Servicios de apoyo a la fabricación de otros productos químicos n.c.p a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de otros productos químicos n.c.p a cambio de una retribución o por contrato.	C2029.20.01	f
904	Fabricación de explosivos y productos pirotécnicos, incluidos cápsulas fulminantes, detonadores, bengalas de señales y artículos similares, pólvoras propulsoras, cerillas (fósforos).	Fabricación de explosivos y productos pirotécnicos, incluidos cápsulas fulminantes, detonadores, bengalas de señales y artículos similares, pólvoras propulsoras, cerillas (fósforos).	C2029.91.01	f
905	Fabricación de productos fotoquímicos: placas y películas fotográficas.	Fabricación de productos fotoquímicos: placas y películas fotográficas.	C2029.92.01	f
906	Fabricación de productos fotoquímicos: papel sensible y otros materiales sensibilizados sin imprimir.	Fabricación de productos fotoquímicos: papel sensible y otros materiales sensibilizados sin imprimir.	C2029.92.02	f
907	Fabricación de preparados químicos de uso fotográfico.	Fabricación de preparados químicos de uso fotográfico.	C2029.92.03	f
908	Fabricación de tintas para escribir.	Fabricación de tintas para escribir.	C2029.93.01	f
909	Fabricación de tintas para dibujar.	Fabricación de tintas para dibujar.	C2029.93.02	f
910	Fabricación de granadas y bombas extintoras de fuego, preparación y carga de aparatos extintores.	Fabricación de granadas y bombas extintoras de fuego, preparación y carga de aparatos extintores.	C2029.94.01	f
911	Fabricación de materiales vírgenes de reproducción para grabaciones sonoras o de otro tipo.	Fabricación de materiales vírgenes de reproducción para grabaciones sonoras o de otro tipo.	C2029.95.01	f
912	Fabricación de otros productos químicos: peptonas y sus derivados.	Fabricación de otros productos químicos: peptonas y sus derivados.	C2029.99.01	f
913	Fabricación de otros productos químicos: otras sustancias proteínicas y sus derivados.	Fabricación de otros productos químicos: otras sustancias proteínicas y sus derivados.	C2029.99.02	f
914	Fabricación de otros productos químicos: Substancias para el decapado de metales.	Fabricación de otros productos químicos: Substancias para el decapado de metales.	C2029.99.03	f
915	Fabricación de otros productos químicos: Polvos y pastas para soldadura blanda, dura o autógena.	Fabricación de otros productos químicos: Polvos y pastas para soldadura blanda, dura o autógena.	C2029.99.04	f
916	Fabricación de estopas de filamento artificial o sintético (waipe).	Fabricación de estopas de filamento artificial o sintético (waipe).	C2030.01.01	f
917	Fabricación de fibras discontinuas sintéticas o artificiales, sin cardar, peinar ni elaborar de otro modo para su hilado.	Fabricación de fibras discontinuas sintéticas o artificiales, sin cardar, peinar ni elaborar de otro modo para su hilado.	C2030.02.01	f
918	Fabricación de hilados (hilos) de filamento sintético o artificial, incluidos hilados (hilos) de gran resistencia, monofilamento o hebras sintéticas o artificiales.	Fabricación de hilados (hilos) de filamento sintético o artificial, incluidos hilados (hilos) de gran resistencia, monofilamento o hebras sintéticas o artificiales.	C2030.03.01	f
919	Servicios de apoyo a la fabricación de fibras artificiales a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de fibras artificiales a cambio de una retribución o por contrato.	C2030.04.01	f
1079	Producción de ferroaleaciones.	Producción de ferroaleaciones.	C2410.12.01	f
244	Extracción de cuarcita.	Extracción de cuarcita.	B0899.02.04	t
951	Fabricación de prendas de vestir de caucho (solo si están sellados, y no cosidos): trajes de buceo de caucho, gorras de baño, guantes y delantales de caucho, ligas, etcétera.	Fabricación de prendas de vestir de caucho (solo si están sellados, y no cosidos): trajes de buceo de caucho, gorras de baño, guantes y delantales de caucho, ligas, etcétera.	C2219.04.01	f
1019	Fabricación de materiales de construcción de arcilla,  ladrillos, tejas, sombreretes de chimenea.	Fabricación de materiales de construcción de arcilla,  ladrillos, tejas, sombreretes de chimenea.	C2392.02.01	f
920	Fabricación de sustancias medicinales activas que se utilizan por sus propiedades farmacológicas en la fabricación de medicamentos: antibióticos, vitaminas básicas, ácido salicílico y acetilsalicílico, etcétera, tratamiento de la sangre, fabricación de medicamentos: antisueros y otras fracciones de sangre, azúcares químicamente puros, productos y extractos endocrinos,  vacunas. Incluidos preparados homeopáticos, fabricación y procesamiento de glándulas y extractos glandulares, fabricación de productos químicos anticonceptivos de uso externo y de medicamentos anticonceptivos hormonales, fabricación de preparados para el diagnóstico médico, incluidas pruebas de embarazo, etcétera.	Fabricación de sustancias medicinales activas que se utilizan por sus propiedades farmacológicas en la fabricación de medicamentos: antibióticos, vitaminas básicas, ácido salicílico y acetilsalicílico, etcétera, tratamiento de la sangre, fabricación de medicamentos: antisueros y otras fracciones de sangre, azúcares químicamente puros, productos y extractos endocrinos,  vacunas. Incluidos preparados homeopáticos, fabricación y procesamiento de glándulas y extractos glandulares, fabricación de productos químicos anticonceptivos de uso externo y de medicamentos anticonceptivos hormonales, fabricación de preparados para el diagnóstico médico, incluidas pruebas de embarazo, etcétera.	C2100.01.01	f
921	Fabricación de sustancias radiactivas para diagnóstico en vivo, etcétera, productos de biotecnología.	Fabricación de sustancias radiactivas para diagnóstico en vivo, etcétera, productos de biotecnología.	C2100.02.01	f
922	Fabricación de guatas, gasas, hilos, vendas y apósitos médicos impregnados.	Fabricación de guatas, gasas, hilos, vendas y apósitos médicos impregnados.	C2100.03.01	f
923	Preparación de productos botánicos (trituración, cribado, molido) para uso farmacéutico.	Preparación de productos botánicos (trituración, cribado, molido) para uso farmacéutico.	C2100.04.01	f
924	Fabricación de productos farmacéuticos para uso veterinario, sean genéricos o de marca registrada, de venta al público en general o reglamentada por las autoridades.	Fabricación de productos farmacéuticos para uso veterinario, sean genéricos o de marca registrada, de venta al público en general o reglamentada por las autoridades.	C2100.05.01	f
925	Servicios de apoyo a la fabricación de productos farmacéuticos, sustancias químicas medicinales y productos botánicos de uso farmacéutico a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de productos farmacéuticos, sustancias químicas medicinales y productos botánicos de uso farmacéutico a cambio de una retribución o por contrato.	C2100.06.01	f
926	Fabricación de cubiertas de caucho para: vehículos.	Fabricación de cubiertas de caucho para: vehículos.	C2211.01.01	f
927	Fabricación de cubiertas de caucho para: equipo, maquinaria móvil.	Fabricación de cubiertas de caucho para: equipo, maquinaria móvil.	C2211.01.02	f
928	Fabricación de cubiertas de caucho para: aeronaves, juguetes, muebles y otros usos: neumáticos, llantas.	Fabricación de cubiertas de caucho para: aeronaves, juguetes, muebles y otros usos: neumáticos, llantas.	C2211.01.03	f
929	Fabricación de cámaras de caucho para cubiertas de vehículos.	Fabricación de cámaras de caucho para cubiertas de vehículos.	C2211.02.01	f
930	Fabricación de cámaras de caucho para cubiertas de aeronaves.	Fabricación de cámaras de caucho para cubiertas de aeronaves.	C2211.02.02	f
931	Fabricación de cámaras de caucho para cubiertas de juguetes.	Fabricación de cámaras de caucho para cubiertas de juguetes.	C2211.02.03	f
932	Fabricación de cámaras de caucho para cubiertas de muebles.	Fabricación de cámaras de caucho para cubiertas de muebles.	C2211.02.04	f
933	Fabricación de cámaras de caucho para cubiertas de tubos.	Fabricación de cámaras de caucho para cubiertas de tubos.	C2211.02.05	f
934	Fabricación de cubiertas de neumáticos.	Fabricación de cubiertas de neumáticos.	C2211.02.06	f
935	Fabricación de cubiertas sólidas y mullidas (esponjosas, blandas).	Fabricación de cubiertas sólidas y mullidas (esponjosas, blandas).	C2211.02.07	f
936	Fabricación de bandas de rodadura intercambiables, cámaras para cubiertas, fajas de protección de la cámara.	Fabricación de bandas de rodadura intercambiables, cámaras para cubiertas, fajas de protección de la cámara.	C2211.02.08	f
937	Fabricación de tiras de remiendo para recauchutar cubiertas, etc.	Fabricación de tiras de remiendo para recauchutar cubiertas, etc.	C2211.02.09	f
938	Servicios de apoyo a la fabricación de cubiertas y cámaras de caucho; renovación de cubiertas de caucho a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de cubiertas y cámaras de caucho; renovación de cubiertas de caucho a cambio de una retribución o por contrato.	C2211.03.01	f
939	Servicios de apoyo a la fabricación de cubiertas y cámaras de caucho; recauchutado de cubiertas de caucho a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de cubiertas y cámaras de caucho; recauchutado de cubiertas de caucho a cambio de una retribución o por contrato.	C2211.03.02	f
940	Fabricación de planchas de caucho.	Fabricación de planchas de caucho.	C2219.01.01	f
941	Fabricación de láminas de caucho.	Fabricación de láminas de caucho.	C2219.01.02	f
942	Fabricación de varillas de caucho.	Fabricación de varillas de caucho.	C2219.01.03	f
943	Fabricación  de empaques de caucho.	Fabricación  de empaques de caucho.	C2219.01.04	f
944	Fabricación de rodeles de caucho.	Fabricación de rodeles de caucho.	C2219.01.05	f
945	Fabricación de perfiles de caucho.	Fabricación de perfiles de caucho.	C2219.01.06	f
946	Fabricación de hojas de caucho vulcanizado sin endurecer.	Fabricación de hojas de caucho vulcanizado sin endurecer.	C2219.01.07	f
947	Fabricación de tiras de caucho vulcanizado sin endurecer.	Fabricación de tiras de caucho vulcanizado sin endurecer.	C2219.01.08	f
948	Fabricación de tubos, caños y mangueras; arandelas, empaques, conectores, y cierres de caucho.	Fabricación de tubos, caños y mangueras; arandelas, empaques, conectores, y cierres de caucho.	C2219.01.09	f
949	Fabricación de correas y cintas transportadoras y de transmisión de caucho.	Fabricación de correas y cintas transportadoras y de transmisión de caucho.	C2219.02.01	f
950	Fabricación de artículos higiénicos y cuidado personal de caucho: cepillos de caucho, peines de caucho duro, horquillas, rulos y artículos similares de caucho endurecido; preservativos, tetinas, bolsas de agua caliente, etcétera, incluido la fabricación de artículos eróticos de caucho.	Fabricación de artículos higiénicos y cuidado personal de caucho: cepillos de caucho, peines de caucho duro, horquillas, rulos y artículos similares de caucho endurecido; preservativos, tetinas, bolsas de agua caliente, etcétera, incluido la fabricación de artículos eróticos de caucho.	C2219.03.01	f
952	Fabricación de hilos impregnados, revestidos, recubiertos o laminados de caucho en los que el caucho es el principal componente, cubiertas de caucho para rodillos.	Fabricación de hilos impregnados, revestidos, recubiertos o laminados de caucho en los que el caucho es el principal componente, cubiertas de caucho para rodillos.	C2219.05.01	f
953	Fabricación de cuerdas, hilatura, tejidos de caucho, tejidos textiles impregnados, revestidos, recubiertos o laminados de caucho en los que el caucho es el principal componente, cubiertas de caucho para rodillos.	Fabricación de cuerdas, hilatura, tejidos de caucho, tejidos textiles impregnados, revestidos, recubiertos o laminados de caucho en los que el caucho es el principal componente, cubiertas de caucho para rodillos.	C2219.05.02	f
954	Servicios de apoyo a la fabricación de otros productos de caucho a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de otros productos de caucho a cambio de una retribución o por contrato.	C2219.06.01	f
955	Fabricación de otros productos de caucho endurecido.	Fabricación de otros productos de caucho endurecido.	C2219.09.01	f
956	Fabricación de otros productos de caucho natural o sintético sin vulcanizar, vulcanizado.	Fabricación de otros productos de caucho natural o sintético sin vulcanizar, vulcanizado.	C2219.09.02	f
957	Fabricación de otros productos de caucho natural o sintético vulcanizado sin endurecer, losetas.	Fabricación de otros productos de caucho natural o sintético vulcanizado sin endurecer, losetas.	C2219.09.03	f
958	Fabricación de otros productos de caucho natural o sintético vulcanizado sin endurecer, revestimiento de pisos.	Fabricación de otros productos de caucho natural o sintético vulcanizado sin endurecer, revestimiento de pisos.	C2219.09.04	f
959	Fabricación de colchones inflables de caucho, colchones de caucho para camas de agua, globos inflables, cañones de pipa de caucho endurecido, partes de calzado de caucho, materiales de reparación de caucho.	Fabricación de colchones inflables de caucho, colchones de caucho para camas de agua, globos inflables, cañones de pipa de caucho endurecido, partes de calzado de caucho, materiales de reparación de caucho.	C2219.09.05	f
960	Fabricación de semimanufacturas (semielaboradas) de productos de plástico: planchas, láminas, películas, hojas, tiras, etcétera (autoadhesivas o no).	Fabricación de semimanufacturas (semielaboradas) de productos de plástico: planchas, láminas, películas, hojas, tiras, etcétera (autoadhesivas o no).	C2220.11.01	f
961	Fabricación de semimanufacturas (semielaboradas) de productos de plástico: láminas de acrílicos, esponja, espúmaflex, película o lámina de celofán, etcétera.	Fabricación de semimanufacturas (semielaboradas) de productos de plástico: láminas de acrílicos, esponja, espúmaflex, película o lámina de celofán, etcétera.	C2220.11.02	f
962	Fabricación de productos acabados de plásticos: tubos, caños y mangueras de plástico, accesorios para tuberías, caños y mangueras.	Fabricación de productos acabados de plásticos: tubos, caños y mangueras de plástico, accesorios para tuberías, caños y mangueras.	C2220.12.01	f
963	Fabricación de artículos plásticos para la construcción: puertas, ventanas, marcos, contrapuertas, persianas, zócalos, tanques para depósitos, etcétera.	Fabricación de artículos plásticos para la construcción: puertas, ventanas, marcos, contrapuertas, persianas, zócalos, tanques para depósitos, etcétera.	C2220.21.01	f
964	Fabricación de cubrimientos plásticos para pisos, resistentes, como vinilo, linóleo, etcétera.	Fabricación de cubrimientos plásticos para pisos, resistentes, como vinilo, linóleo, etcétera.	C2220.22.01	f
965	Fabricación de cubrimientos plásticos para paredes o techos en rollos o en forma de losetas, domos, piedra artificial (mármol artificial).	Fabricación de cubrimientos plásticos para paredes o techos en rollos o en forma de losetas, domos, piedra artificial (mármol artificial).	C2220.22.02	f
966	Fabricación de artículos plásticos sanitarios como bañeras, platos de ducha, lavabos, inodoros, cisternas de inodoros, etcétera.	Fabricación de artículos plásticos sanitarios como bañeras, platos de ducha, lavabos, inodoros, cisternas de inodoros, etcétera.	C2220.23.01	f
967	Fabricación de otros productos primarios de plástico.	Fabricación de otros productos primarios de plástico.	C2220.24.01	f
968	Servicios de apoyo a la fabricación de productos de plástico a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de productos de plástico a cambio de una retribución o por contrato.	C2220.30.01	f
969	Fabricación de artículos de plástico para el envasado de productos: bolsas, sacos, cajones, cajas, garrafones, botellas, etcétera.	Fabricación de artículos de plástico para el envasado de productos: bolsas, sacos, cajones, cajas, garrafones, botellas, etcétera.	C2220.91.01	f
971	Fabricación de utensilios de mesa de plástico.	Fabricación de utensilios de mesa de plástico.	C2220.92.02	f
972	Fabricación de utensilios de cocina de plástico.	Fabricación de utensilios de cocina de plástico.	C2220.92.03	f
973	Fabricación de artículos de tocador de plástico.	Fabricación de artículos de tocador de plástico.	C2220.92.04	f
974	Fabricación de artículos de plástico para uso escolar.	Fabricación de artículos de plástico para uso escolar.	C2220.93.01	f
975	Fabricación de artículos de plástico para oficina.	Fabricación de artículos de plástico para oficina.	C2220.93.02	f
976	Fabricación de cubrecabezas, prendas de vestir (sólo si las piezas se unen por adhesión y no por costura).	Fabricación de cubrecabezas, prendas de vestir (sólo si las piezas se unen por adhesión y no por costura).	C2220.94.01	f
977	Fabricación de piezas de lámparas y accesorios de iluminación, accesorios para aislamiento.	Fabricación de piezas de lámparas y accesorios de iluminación, accesorios para aislamiento.	C2220.95.01	f
978	Fabricación de letreros o señales no eléctricas de plásticos.	Fabricación de letreros o señales no eléctricas de plásticos.	C2220.95.02	f
979	Fabricación de accesorios de plástico para carrocerías de vehículos y artículos similares de resina de poliéster y fibra de vidrio.	Fabricación de accesorios de plástico para carrocerías de vehículos y artículos similares de resina de poliéster y fibra de vidrio.	C2220.96.01	f
980	Fabricación de otros artículos de plástico: parachoques de muelles o embarcaciones, ballenas de corse, etc.	Fabricación de otros artículos de plástico: parachoques de muelles o embarcaciones, ballenas de corse, etc.	C2220.97.01	f
981	Fabricación de otros artículos de plástico diversos: accesorios para muebles.	Fabricación de otros artículos de plástico diversos: accesorios para muebles.	C2220.99.01	f
982	Fabricación de otros artículos de plástico diversos: estatuillas, artesanías, correas de transporte y transmisión, cintas autoadhesivas, papel de empapelar, hormas de zapato, boquillas de cigarros y cigarrillos, peines, ruleros, artículos de fantasía promociónales y de regalo de plástico, canastas de plástico, etcétera.	Fabricación de otros artículos de plástico diversos: estatuillas, artesanías, correas de transporte y transmisión, cintas autoadhesivas, papel de empapelar, hormas de zapato, boquillas de cigarros y cigarrillos, peines, ruleros, artículos de fantasía promociónales y de regalo de plástico, canastas de plástico, etcétera.	C2220.99.02	f
984	Fabricación de vidrio estirado.	Fabricación de vidrio estirado.	C2310.11.02	f
985	Fabricación de vidrio soplado.	Fabricación de vidrio soplado.	C2310.11.03	f
986	Fabricación de vidrio templado o laminado.	Fabricación de vidrio templado o laminado.	C2310.11.04	f
988	Fabricación de vidrio armado de alambre, coloreado o teñido.	Fabricación de vidrio armado de alambre, coloreado o teñido.	C2310.11.06	f
989	Fabricación de vidrio en masa, en esferas (excepto microesferas), varillas o tubos, sea o no labrado, perfiles de vidrio y vidrio laminado.	Fabricación de vidrio en masa, en esferas (excepto microesferas), varillas o tubos, sea o no labrado, perfiles de vidrio y vidrio laminado.	C2310.12.01	f
990	Fabricación de espejos de vidrio.	Fabricación de espejos de vidrio.	C2310.13.01	f
991	Fabricación de espejos retrovisores para vehículos.	Fabricación de espejos retrovisores para vehículos.	C2310.13.02	f
992	Fabricación de artículos domésticos de vidrio o cristal: vasos, botellas, copas, platos, jarrones y otros recipientes de vidrio o cristal incluido piezas de vidrio utilizadas en la cocina.	Fabricación de artículos domésticos de vidrio o cristal: vasos, botellas, copas, platos, jarrones y otros recipientes de vidrio o cristal incluido piezas de vidrio utilizadas en la cocina.	C2310.21.01	f
993	Fabricación de artículos domésticos de vidrio o cristal: utilizados en servicios de mesa.	Fabricación de artículos domésticos de vidrio o cristal: utilizados en servicios de mesa.	C2310.21.02	f
994	Fabricación de recipientes de vidrio o cristal incluido piezas de vidrio utilizadas en bisutería figurillas de vidrio, etcétera.	Fabricación de recipientes de vidrio o cristal incluido piezas de vidrio utilizadas en bisutería figurillas de vidrio, etcétera.	C2310.21.03	f
995	Fabricación de bloques de vidrio para pavimentar u otros elementos para la construcción.	Fabricación de bloques de vidrio para pavimentar u otros elementos para la construcción.	C2310.22.01	f
996	Fabricación de fibras de vidrio.	Fabricación de fibras de vidrio.	C2310.23.01	f
997	Fabricación de lana de vidrio.	Fabricación de lana de vidrio.	C2310.23.02	f
998	Fabricación de hilados de fibra de vidrio.	Fabricación de hilados de fibra de vidrio.	C2310.23.03	f
999	Fabricación de productos no tejidos de lana de vidrio.	Fabricación de productos no tejidos de lana de vidrio.	C2310.23.04	f
1000	Fabricación de cristalería de laboratorio.	Fabricación de cristalería de laboratorio.	C2310.24.01	f
1001	Fabricación de cristalería higiénica y farmacéutica.	Fabricación de cristalería higiénica y farmacéutica.	C2310.24.02	f
1002	Fabricación de vidrio para relojes.	Fabricación de vidrio para relojes.	C2310.25.01	f
1003	Fabricación de vidrio óptico y elementos ópticos no trabajados ópticamente.	Fabricación de vidrio óptico y elementos ópticos no trabajados ópticamente.	C2310.25.02	f
1004	Fabricación de aisladores de vidrio y accesorios aislantes de vidrio; unidades aislantes de vidrio de capas múltiples.	Fabricación de aisladores de vidrio y accesorios aislantes de vidrio; unidades aislantes de vidrio de capas múltiples.	C2310.26.01	f
1005	Fabricación de envolturas de vidrio.	Fabricación de envolturas de vidrio.	C2310.27.01	f
1006	Fabricación de piezas de vidrio utilizadas en joyas de fantasía.	Fabricación de piezas de vidrio utilizadas en joyas de fantasía.	C2310.27.02	f
1007	Fabricación de artículos de vidrio para la oficina.	Fabricación de artículos de vidrio para la oficina.	C2310.27.03	f
1008	Fabricación de otros productos y manufacturas de vidrio: ampollas de vidrio para lámparas, tubos para lámparas fluorescentes, accesorios para alumbrado, faroles, rótulos iluminados, etcétera.	Fabricación de otros productos y manufacturas de vidrio: ampollas de vidrio para lámparas, tubos para lámparas fluorescentes, accesorios para alumbrado, faroles, rótulos iluminados, etcétera.	C2310.29.01	f
1009	Servicios de apoyo a la fabricación de vidrio y productos de vidrio a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de vidrio y productos de vidrio a cambio de una retribución o por contrato.	C2310.30.01	f
1010	Fabricación de artículos para construcción: losetas, tejas, azulejos y otros.	Fabricación de artículos para construcción: losetas, tejas, azulejos y otros.	C2391.01.01	f
1011	Fabricación de artículos para construcción: cerámica refractaria; morteros, cementos y otros materiales refractarios.	Fabricación de artículos para construcción: cerámica refractaria; morteros, cementos y otros materiales refractarios.	C2391.01.02	f
1012	Fabricación de retortas, crisoles, muflas (hornos), toberas, tubos, caños, etcétera, de cerámica refractaria.	Fabricación de retortas, crisoles, muflas (hornos), toberas, tubos, caños, etcétera, de cerámica refractaria.	C2391.02.01	f
1013	Servicios de apoyo a la fabricación de productos refractarios a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de productos refractarios a cambio de una retribución o por contrato.	C2391.03.01	f
1014	Fabricación de otros artículos de cerámica refractaria.	Fabricación de otros artículos de cerámica refractaria.	C2391.09.01	f
1015	Fabricación de otros artículos de cerámica para aislamiento térmico a base de diatomitas (tierras) silíceas.	Fabricación de otros artículos de cerámica para aislamiento térmico a base de diatomitas (tierras) silíceas.	C2391.09.02	f
1016	Fabricación de otros artículos refractarios que contienen magnesita, dolomita o cromita.	Fabricación de otros artículos refractarios que contienen magnesita, dolomita o cromita.	C2391.09.03	f
1017	Fabricación de teselas de mosaico, azulejos, baldosas y losas para pavimento etcétera, de cerámica no refractaria.	Fabricación de teselas de mosaico, azulejos, baldosas y losas para pavimento etcétera, de cerámica no refractaria.	C2392.01.01	f
1018	Fabricación de losetas para la pared y para cañones de chimeneas.	Fabricación de losetas para la pared y para cañones de chimeneas.	C2392.01.02	f
1020	Fabricación de tubos, conductos, etcétera.	Fabricación de tubos, conductos, etcétera.	C2392.02.02	f
1021	Fabricación de materiales de construcción de cerámica.	Fabricación de materiales de construcción de cerámica.	C2392.02.03	f
1022	Fabricación de materiales de construcción de cerámica no refractaria para uso estructural.	Fabricación de materiales de construcción de cerámica no refractaria para uso estructural.	C2392.02.04	f
1023	Fabricación de artículos sanitarios de cerámica.	Fabricación de artículos sanitarios de cerámica.	C2392.03.01	f
1024	Fabricación de artículos sanitarios de porcelana.	Fabricación de artículos sanitarios de porcelana.	C2392.03.02	f
1025	Fabricación de artículos sanitarios de mármol sintético.	Fabricación de artículos sanitarios de mármol sintético.	C2392.03.03	f
1026	Fabricación de artículos sanitarios de cerámica para uso no estructural.	Fabricación de artículos sanitarios de cerámica para uso no estructural.	C2392.03.04	f
1027	Servicios de apoyo a la fabricación de materiales de construcción de arcilla a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de materiales de construcción de arcilla a cambio de una retribución o por contrato.	C2392.04.01	f
1028	Fabricación de vajillas y otros artículos de uso domésticos y de aseo.	Fabricación de vajillas y otros artículos de uso domésticos y de aseo.	C2393.01.01	f
1029	Fabricación de artículos ornamentales de cerámica o porcelana.	Fabricación de artículos ornamentales de cerámica o porcelana.	C2393.02.01	f
1030	Fabricación de estatuillas, artesanías y otros.	Fabricación de estatuillas, artesanías y otros.	C2393.02.02	f
1031	Fabricación de aisladores eléctricos y accesorios aislantes de cerámica.	Fabricación de aisladores eléctricos y accesorios aislantes de cerámica.	C2393.03.01	f
1032	Fabricación de artículos de cerámica para laboratorios.	Fabricación de artículos de cerámica para laboratorios.	C2393.04.01	f
1033	Fabricación de artículos de cerámica la industria en general.	Fabricación de artículos de cerámica la industria en general.	C2393.04.02	f
1034	Fabricación de artículos de cerámica para la industria química y la agricultura.	Fabricación de artículos de cerámica para la industria química y la agricultura.	C2393.04.03	f
1035	Fabricación de tarros, vasijas y artículos similares de cerámica, utilizados para transportar o envasar productos.	Fabricación de tarros, vasijas y artículos similares de cerámica, utilizados para transportar o envasar productos.	C2393.05.01	f
1036	Servicios de apoyo a la fabricación de otros productos de porcelana y de cerámica a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de otros productos de porcelana y de cerámica a cambio de una retribución o por contrato.	C2393.06.01	f
1037	Fabricación de otros productos de cerámica n.c.p: muebles de cerámica; imanes de cerámica y ferrita, etcétera.	Fabricación de otros productos de cerámica n.c.p: muebles de cerámica; imanes de cerámica y ferrita, etcétera.	C2393.09.01	f
1038	Fabricación de cementos hidráulicos, incluido cemento de Pórtland, cemento aluminoso, cemento de escorias y cemento hipersulfatado.	Fabricación de cementos hidráulicos, incluido cemento de Pórtland, cemento aluminoso, cemento de escorias y cemento hipersulfatado.	C2394.01.01	f
1039	Fabricación de cal viva, apagada e hidráulica.	Fabricación de cal viva, apagada e hidráulica.	C2394.02.01	f
1040	Fabricación de yesos, con yeso calcinado o sulfato de calcio.	Fabricación de yesos, con yeso calcinado o sulfato de calcio.	C2394.02.02	f
1041	Fabricación de dolomita calcinada.	Fabricación de dolomita calcinada.	C2394.03.01	f
1042	Servicios de apoyo a la fabricación de cemento, cal y yeso a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de cemento, cal y yeso a cambio de una retribución o por contrato.	C2394.04.01	f
1043	Fabricación de componentes estructurales y materiales prefabricados para obras de construcción o de ingeniería civil de hormigón: losetas, losas, baldosas, ladrillos, bloques, planchas, paneles, láminas, tableros, caños, tubos, postes, etcétera.	Fabricación de componentes estructurales y materiales prefabricados para obras de construcción o de ingeniería civil de hormigón: losetas, losas, baldosas, ladrillos, bloques, planchas, paneles, láminas, tableros, caños, tubos, postes, etcétera.	C2395.01.01	f
1044	Fabricación de componentes estructurales y materiales prefabricados para obras de construcción o de ingeniería civil de cemento, piedra artificial o yeso: losetas, losas, baldosas, ladrillos, bloques, planchas, paneles, láminas, tableros, caños, tubos, postes, etcétera.	Fabricación de componentes estructurales y materiales prefabricados para obras de construcción o de ingeniería civil de cemento, piedra artificial o yeso: losetas, losas, baldosas, ladrillos, bloques, planchas, paneles, láminas, tableros, caños, tubos, postes, etcétera.	C2395.01.02	f
1045	Fabricación de materiales de yeso para la construcción.	Fabricación de materiales de yeso para la construcción.	C2395.02.01	f
1046	Fabricación de materiales para la construcción de sustancias vegetales (lana de madera, paja, cañas, juncos) aglomeradas con cemento, yeso u otro aglutinante mineral: estucados, cielos rasos de carrizo o yeso.	Fabricación de materiales para la construcción de sustancias vegetales (lana de madera, paja, cañas, juncos) aglomeradas con cemento, yeso u otro aglutinante mineral: estucados, cielos rasos de carrizo o yeso.	C2395.02.02	f
1047	Fabricación de artículos de asbesto-cemento, fibro-cemento de celulosa y materiales similares: láminas onduladas, otras laminas, paneles, tableros, losetas, tubos, caños, depósitos, tanques de agua, cisternas, lavabos, lavaderos, vasijas, muebles, marcos para ventanas, etcétera.	Fabricación de artículos de asbesto-cemento, fibro-cemento de celulosa y materiales similares: láminas onduladas, otras laminas, paneles, tableros, losetas, tubos, caños, depósitos, tanques de agua, cisternas, lavabos, lavaderos, vasijas, muebles, marcos para ventanas, etcétera.	C2395.03.01	f
1048	Fabricación de mezclas preparadas y secas para hormigón y mortero (incluso mortero en polvo).	Fabricación de mezclas preparadas y secas para hormigón y mortero (incluso mortero en polvo).	C2395.04.01	f
1080	Producción de hierro de pureza excepcional por electrolisis o mediante otros procesos químicos.	Producción de hierro de pureza excepcional por electrolisis o mediante otros procesos químicos.	C2410.13.01	f
1049	Servicios de apoyo a la fabricación de artículos de hormigón, de cemento y yeso a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de artículos de hormigón, de cemento y yeso a cambio de una retribución o por contrato.	C2395.05.01	f
1050	Fabricación de otros artículos de hormigón para la construcción.	Fabricación de otros artículos de hormigón para la construcción.	C2395.06.01	f
1051	Fabricación de otros artículos de cemento para la construcción.	Fabricación de otros artículos de cemento para la construcción.	C2395.06.02	f
1052	Fabricación de otros artículos de yeso para la construcción.	Fabricación de otros artículos de yeso para la construcción.	C2395.06.03	f
1053	Fabricación de otros artículos de hormigón, incluso los usados con fines decorativos: estatuas, muebles, bajorrelieves y altorrelieves, jarrones, macetas, etcétera.	Fabricación de otros artículos de hormigón, incluso los usados con fines decorativos: estatuas, muebles, bajorrelieves y altorrelieves, jarrones, macetas, etcétera.	C2395.09.01	f
1054	Fabricación de otros artículos de cemento o piedra artificial, incluso los usados con fines decorativos: estatuas, muebles, bajorrelieves y altorrelieves, jarrones, macetas, etcétera.	Fabricación de otros artículos de cemento o piedra artificial, incluso los usados con fines decorativos: estatuas, muebles, bajorrelieves y altorrelieves, jarrones, macetas, etcétera.	C2395.09.02	f
1055	Fabricación de otros artículos de yeso, incluso los usados con fines decorativos: estatuas, muebles, bajorrelieves y altorrelieves, jarrones, macetas, etcétera.	Fabricación de otros artículos de yeso, incluso los usados con fines decorativos: estatuas, muebles, bajorrelieves y altorrelieves, jarrones, macetas, etcétera.	C2395.09.03	f
1056	Corte, tallado y acabado de la piedra para construcción: cementerios, carreteras, techos, etcétera.	Corte, tallado y acabado de la piedra para construcción: cementerios, carreteras, techos, etcétera.	C2396.01.01	f
1057	Corte, tallado y acabado de mármol:  cementerios, carreteras, techos, etcétera.	Corte, tallado y acabado de mármol:  cementerios, carreteras, techos, etcétera.	C2396.01.02	f
1058	Fabricación de muebles de piedra.	Fabricación de muebles de piedra.	C2396.02.01	f
1059	Servicios de apoyo al corte, tallado y acabado de la piedra a cambio de una retribución o por contrato.	Servicios de apoyo al corte, tallado y acabado de la piedra a cambio de una retribución o por contrato.	C2396.03.01	f
1060	Fabricación de muelas de molino.	Fabricación de muelas de molino.	C2399.01.01	f
1061	Fabricación de piedras de amolar, pulimentar.	Fabricación de piedras de amolar, pulimentar.	C2399.01.02	f
1062	Fabricación de productos abrasivos naturales y artificiales, incluidos productos abrasivos sobre una base flexible como el papel lija.	Fabricación de productos abrasivos naturales y artificiales, incluidos productos abrasivos sobre una base flexible como el papel lija.	C2399.01.03	f
1063	Fabricación de materiales de fricción, lana de escorias, lana de roca y otras lanas minerales similares.	Fabricación de materiales de fricción, lana de escorias, lana de roca y otras lanas minerales similares.	C2399.02.01	f
1064	Fabricación de materiales de fricción, vermiculita escamada y materiales similares para aislamiento térmico y sonoro, y para absorber el sonido.	Fabricación de materiales de fricción, vermiculita escamada y materiales similares para aislamiento térmico y sonoro, y para absorber el sonido.	C2399.02.02	f
1065	Fabricación de materiales de fricción, arcillas dilatadas y materiales similares para aislamiento térmico y sonoro, y para absorber el sonido.	Fabricación de materiales de fricción, arcillas dilatadas y materiales similares para aislamiento térmico y sonoro, y para absorber el sonido.	C2399.02.03	f
1066	Fabricación de materiales de fricción y artículos sin montar de esos materiales con una base de sustancias minerales o de celulosa.	Fabricación de materiales de fricción y artículos sin montar de esos materiales con una base de sustancias minerales o de celulosa.	C2399.02.04	f
1067	Fabricación de materiales de fricción: lana de vidrio y materiales similares para aislamiento térmico y sonoro, y para absorber el sonido.	Fabricación de materiales de fricción: lana de vidrio y materiales similares para aislamiento térmico y sonoro, y para absorber el sonido.	C2399.02.05	f
1068	Fabricación de artículos de diversas sustancias minerales: de turba y de grafito (que no sean artículos eléctricos), etcétera.	Fabricación de artículos de diversas sustancias minerales: de turba y de grafito (que no sean artículos eléctricos), etcétera.	C2399.03.01	f
1069	Fabricación de artículos de diversas sustancias minerales: mica trabajada.	Fabricación de artículos de diversas sustancias minerales: mica trabajada.	C2399.03.02	f
1070	Fabricación de artículos de diversas sustancias minerales: artículos de mica, etcétera.	Fabricación de artículos de diversas sustancias minerales: artículos de mica, etcétera.	C2399.03.03	f
1071	Fabricación de artículos de asfalto o de materiales similares, por ejemplo adhesivos a base de asfalto (impermeabilizantes para la construcción), brea, alquitrán, hulla, etcétera.	Fabricación de artículos de asfalto o de materiales similares, por ejemplo adhesivos a base de asfalto (impermeabilizantes para la construcción), brea, alquitrán, hulla, etcétera.	C2399.04.01	f
1072	Fabricación de fibras y productos de carbono y grafito (excepto electrodos y aplicaciones eléctricas).	Fabricación de fibras y productos de carbono y grafito (excepto electrodos y aplicaciones eléctricas).	C2399.05.01	f
1073	Servicios de apoyo a la fabricación de otros productos minerales no metálicos n.c.p a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de otros productos minerales no metálicos n.c.p a cambio de una retribución o por contrato.	C2399.06.01	f
1074	Fabricación de hilados, tela de asbesto y artículos de hilados o tela de asbesto: ropa, cubrecabezas, calzado, cordeles, papel, fieltro, etc.	Fabricación de hilados, tela de asbesto y artículos de hilados o tela de asbesto: ropa, cubrecabezas, calzado, cordeles, papel, fieltro, etc.	C2399.07.01	f
1075	Explotación y producción de arrabio y hierro especular en lingotes, bloques y otras formas primarias, incluso hierro en granalla (granos) y en polvo.	Explotación y producción de arrabio y hierro especular en lingotes, bloques y otras formas primarias, incluso hierro en granalla (granos) y en polvo.	C2410.11.01	f
1076	Refundición de lingotes de chatarra de hierro o acero.	Refundición de lingotes de chatarra de hierro o acero.	C2410.11.02	f
1077	Explotación de altos hornos, convertidores de acero.	Explotación de altos hornos, convertidores de acero.	C2410.11.03	f
1078	Talleres de laminado y acabado, refundición de lingotes de chatarra de hierro o acero.	Talleres de laminado y acabado, refundición de lingotes de chatarra de hierro o acero.	C2410.11.04	f
1083	Fabricación de productos semiacabados de hierro por reducción directa de minerales de hierro (mena).	Fabricación de productos semiacabados de hierro por reducción directa de minerales de hierro (mena).	C2410.13.04	f
1084	Producción de acero otras formas primarias, mediante procesos neumáticos o de cocción.	Producción de acero otras formas primarias, mediante procesos neumáticos o de cocción.	C2410.14.01	f
1085	Producción de lingotes u otras formas primarias.	Producción de lingotes u otras formas primarias.	C2410.14.02	f
1086	Fabricación de productos semiacabados de acero.	Fabricación de productos semiacabados de acero.	C2410.15.01	f
1087	Fabricación de productos de acero laminados planos en caliente y frío, secciones laminadas, acero en lingotes y secciones sólidas de acero por trefilado, molido o doblado en frío.	Fabricación de productos de acero laminados planos en caliente y frío, secciones laminadas, acero en lingotes y secciones sólidas de acero por trefilado, molido o doblado en frío.	C2410.21.01	f
1088	Fabricación de barras, varillas y secciones sólidas de hierro y acero laminadas en caliente y mediante estirado en frío y en caliente, rectificación o torneado; fabricación de alambre de acero mediante estirado o alargamiento en frío.	Fabricación de barras, varillas y secciones sólidas de hierro y acero laminadas en caliente y mediante estirado en frío y en caliente, rectificación o torneado; fabricación de alambre de acero mediante estirado o alargamiento en frío.	C2410.22.01	f
1089	Fabricación de materiales para vías de ferrocarril (carriles no ensamblados) de acero.	Fabricación de materiales para vías de ferrocarril (carriles no ensamblados) de acero.	C2410.23.01	f
1090	Fabricación de tubos, tuberías perfiles, huecos de acero sin costura y caños soldados mediante conformación en frío o en caliente y soldadura, entregados en ese estado o transformados posteriormente mediante extrusión o estirado o laminación en frío o mediante conformación en caliente, soldadura y reducción. Fabricación de conexiones de soldadura a tope, roscadas, con soldadura machihembrada, conexiones de tubo de acero, como: conexiones de brida planas y conexiones de brida con collares de acero de forja.	Fabricación de tubos, tuberías perfiles, huecos de acero sin costura y caños soldados mediante conformación en frío o en caliente y soldadura, entregados en ese estado o transformados posteriormente mediante extrusión o estirado o laminación en frío o mediante conformación en caliente, soldadura y reducción. Fabricación de conexiones de soldadura a tope, roscadas, con soldadura machihembrada, conexiones de tubo de acero, como: conexiones de brida planas y conexiones de brida con collares de acero de forja.	C2410.24.01	f
1091	Fabricación de ángulos, perfiles y secciones abiertas de acero laminadas en caliente y mediante conformación progresiva en un laminador de rulos o mediante plegado en una prensa de productos laminados planos de acero.	Fabricación de ángulos, perfiles y secciones abiertas de acero laminadas en caliente y mediante conformación progresiva en un laminador de rulos o mediante plegado en una prensa de productos laminados planos de acero.	C2410.25.01	f
1092	Fabricación de ángulos, perfiles, alambre trefilado y secciones abiertas de hierro.	Fabricación de ángulos, perfiles, alambre trefilado y secciones abiertas de hierro.	C2410.26.01	f
1093	Fabricación de otros productos acabados de hierro.	Fabricación de otros productos acabados de hierro.	C2410.29.01	f
1094	Fabricación de otros productos de acero: tablestacas de acero y secciones abiertas soldadas de acero, viruta de hojas de acero.	Fabricación de otros productos de acero: tablestacas de acero y secciones abiertas soldadas de acero, viruta de hojas de acero.	C2410.29.02	f
1095	Servicios de apoyo a las industrias básicas de hierro y acero a cambio de una retribución o por contrato.	Servicios de apoyo a las industrias básicas de hierro y acero a cambio de una retribución o por contrato.	C2410.30.01	f
1096	Producción de metales preciosos básicos: producción y refinación de metales preciosos sin labrar y labrados: oro, plata, platino, etcétera a partir de minerales y residuos.	Producción de metales preciosos básicos: producción y refinación de metales preciosos sin labrar y labrados: oro, plata, platino, etcétera a partir de minerales y residuos.	C2420.11.01	f
1097	Producción de semiproductos de metales preciosos; fabricación de laminados con hojas de metales preciosos.	Producción de semiproductos de metales preciosos; fabricación de laminados con hojas de metales preciosos.	C2420.11.02	f
1098	Producción de aleaciones de metales preciosos.	Producción de aleaciones de metales preciosos.	C2420.12.01	f
1099	Fabricación de enchapados: de metales comunes con plata; de metales comunes ó plata con oro; de metales comunes, oro y plata con platino o con metales del grupo del platino.	Fabricación de enchapados: de metales comunes con plata; de metales comunes ó plata con oro; de metales comunes, oro y plata con platino o con metales del grupo del platino.	C2420.13.01	f
1101	Producción de metales comunes no ferrosos a partir de minerales en bruto o en mata, alúmina u óxidos: aluminio, plomo zinc, estaño, cobre, cromo, manganeso, níquel, etcétera.	Producción de metales comunes no ferrosos a partir de minerales en bruto o en mata, alúmina u óxidos: aluminio, plomo zinc, estaño, cobre, cromo, manganeso, níquel, etcétera.	C2420.21.01	f
1102	Producción de metales comunes no ferrosos a partir de minerales o mediante la refinación electrolítica de desechos y chatarra de plomo, zinc, estaño, cobre, cromo, manganeso, níquel, etcétera.	Producción de metales comunes no ferrosos a partir de minerales o mediante la refinación electrolítica de desechos y chatarra de plomo, zinc, estaño, cobre, cromo, manganeso, níquel, etcétera.	C2420.22.01	f
1103	Producción de aleaciones de: aluminio; plomo, zinc, estaño, cobre, cromo, manganeso, níquel, etcétera.	Producción de aleaciones de: aluminio; plomo, zinc, estaño, cobre, cromo, manganeso, níquel, etcétera.	C2420.23.01	f
1104	Fabricación de productos semielaborados de aluminio, plomo, zinc, estaño, cobre, cromo, manganeso, níquel, etcétera.	Fabricación de productos semielaborados de aluminio, plomo, zinc, estaño, cobre, cromo, manganeso, níquel, etcétera.	C2420.24.01	f
1105	Fabricación de alambre de metales comunes no ferrosos: aluminio; plomo, zinc y estaño cobre cromo, manganeso, níquel, etcétera mediante trefilado.	Fabricación de alambre de metales comunes no ferrosos: aluminio; plomo, zinc y estaño cobre cromo, manganeso, níquel, etcétera mediante trefilado.	C2420.25.01	f
1106	Producción de aluminio a partir de alúmina y de la refinación electrolítica de desechos y chatarra de aluminio incluido la producción de oxido de aluminio (alúmina), matas de níquel.	Producción de aluminio a partir de alúmina y de la refinación electrolítica de desechos y chatarra de aluminio incluido la producción de oxido de aluminio (alúmina), matas de níquel.	C2420.26.01	f
1108	Producción de aluminio a partir de alúmina y de la refinación electrolítica de desechos y chatarra de aluminio incluido la producción de oxido de aluminio (alúmina), matas de níquel.	Producción de aluminio a partir de alúmina y de la refinación electrolítica de desechos y chatarra de aluminio incluido la producción de oxido de aluminio (alúmina), matas de níquel.	C2420.26.01	f
1109	Servicios de apoyo a la fabricación de productos primarios de metales preciosos y metales no ferrosos a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de productos primarios de metales preciosos y metales no ferrosos a cambio de una retribución o por contrato.	C2420.30.01	f
1110	Fundición de hierro gris, hierro grafito esferoidal, productos de hierro maleable; productos semiacabados de hierro.	Fundición de hierro gris, hierro grafito esferoidal, productos de hierro maleable; productos semiacabados de hierro.	C2431.01.01	f
1112	Fundición de piezas de acero; productos semiacabados de acero.	Fundición de piezas de acero; productos semiacabados de acero.	C2431.02.01	f
1114	Fabricación de tubos, caños, perfiles huecos, conexiones de tubos y caños de hierro y acero sin costura mediante fundición centrífuga.	Fabricación de tubos, caños, perfiles huecos, conexiones de tubos y caños de hierro y acero sin costura mediante fundición centrífuga.	C2431.03.01	f
1115	Fundición de piezas y productos semiacabados de metales no ferrosos.	Fundición de piezas y productos semiacabados de metales no ferrosos.	C2432.01.01	f
1116	Fundición a presión de: aluminio, magnesio, titanio, etcétera.	Fundición a presión de: aluminio, magnesio, titanio, etcétera.	C2432.01.02	f
1117	Fundición de metales preciosos.	Fundición de metales preciosos.	C2432.02.01	f
1118	Fabricación de estructuras de metal marcos o armazones para construcción y partes de esas estructuras: torres, mástiles, armaduras, puentes, etcétera; marcos industriales de metal: marcos para altos hornos, equipos de elevación y manipulación, etcétera.	Fabricación de estructuras de metal marcos o armazones para construcción y partes de esas estructuras: torres, mástiles, armaduras, puentes, etcétera; marcos industriales de metal: marcos para altos hornos, equipos de elevación y manipulación, etcétera.	C2511.01.01	f
1119	Fabricación de edificios prefabricados principalmente de metal: casetas, módulos de exhibición de elementos, cabinas telefónicas, etcétera.	Fabricación de edificios prefabricados principalmente de metal: casetas, módulos de exhibición de elementos, cabinas telefónicas, etcétera.	C2511.02.01	f
1120	Fabricación de puertas y ventanas de metal y sus marcos (incluso enrollables), postigos(puertas) y portales, balcones, escaleras, rejas, tabiques de metal para fijar al suelo, etcétera.	Fabricación de puertas y ventanas de metal y sus marcos (incluso enrollables), postigos(puertas) y portales, balcones, escaleras, rejas, tabiques de metal para fijar al suelo, etcétera.	C2511.03.01	f
1121	Servicios de apoyo a la fabricación de productos metálicos para uso estructural a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de productos metálicos para uso estructural a cambio de una retribución o por contrato.	C2511.04.01	f
1122	Fabricación de otras estructuras y sus partes de metal: planchas, varillas, perfiles, tubos, ángulos, etc.	Fabricación de otras estructuras y sus partes de metal: planchas, varillas, perfiles, tubos, ángulos, etc.	C2511.05.01	f
1123	Fabricación de tanques, depósitos y recipientes similares de metal, del tipo habitualmente utilizado para almacenamiento y elaboración.	Fabricación de tanques, depósitos y recipientes similares de metal, del tipo habitualmente utilizado para almacenamiento y elaboración.	C2512.01.01	f
1124	Fabricación de recipientes de metal para gases comprimidos o licuados.	Fabricación de recipientes de metal para gases comprimidos o licuados.	C2512.02.01	f
1125	Fabricación de calderas y radiadores para calefacción central, partes y piezas.	Fabricación de calderas y radiadores para calefacción central, partes y piezas.	C2512.03.01	f
1126	Servicios de apoyo a la fabricación de tanques, depósitos y recipientes de metal a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de tanques, depósitos y recipientes de metal a cambio de una retribución o por contrato.	C2512.04.01	f
1127	Fabricación de generadores (calderas) de vapor de agua y otros vapores; instalaciones auxiliares para generadores (calderas) de vapor: condensadores, economizadores, recalentadores, recolectores y acumuladores de vapor, incluso deshollinadores, recuperadores de gases sacabarros.	Fabricación de generadores (calderas) de vapor de agua y otros vapores; instalaciones auxiliares para generadores (calderas) de vapor: condensadores, economizadores, recalentadores, recolectores y acumuladores de vapor, incluso deshollinadores, recuperadores de gases sacabarros.	C2513.01.01	f
1128	Fabricación de reactores nucleares, excepto separadores de isótopos.	Fabricación de reactores nucleares, excepto separadores de isótopos.	C2513.02.01	f
1129	Fabricación de piezas para calderas.	Fabricación de piezas para calderas.	C2513.03.01	f
1130	Servicios de apoyo a la fabricación de generadores de vapor, excepto calderas de agua caliente para calefacción central a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de generadores de vapor, excepto calderas de agua caliente para calefacción central a cambio de una retribución o por contrato.	C2513.04.01	f
1131	Fabricación de armas pesadas (artillería, cañones móviles, etcétera).	Fabricación de armas pesadas (artillería, cañones móviles, etcétera).	C2520.01.01	f
1132	Fabricación de armas pesadas lanzacohetes, lanzaproyectíles, etcétera.	Fabricación de armas pesadas lanzacohetes, lanzaproyectíles, etcétera.	C2520.01.02	f
1133	Fabricación de tubos lanzatorpedos, ametralladoras pesadas, etcétera).	Fabricación de tubos lanzatorpedos, ametralladoras pesadas, etcétera).	C2520.01.03	f
1134	Fabricación de armas ligeras (revólveres, escopetas, ametralladoras ligeras).	Fabricación de armas ligeras (revólveres, escopetas, ametralladoras ligeras).	C2520.02.01	f
1135	Fabricación de armas ligeras de fuego y municiones de caza, de deporte o de protección, etc.	Fabricación de armas ligeras de fuego y municiones de caza, de deporte o de protección, etc.	C2520.02.02	f
1136	Fabricación de armas que disparan balas de fogueo, pistolas para lanzar bengalas de señales, pistolas de matarife, etcétera.	Fabricación de armas que disparan balas de fogueo, pistolas para lanzar bengalas de señales, pistolas de matarife, etcétera.	C2520.02.03	f
1137	Fabricación de escopetas y pistolas de aire y gas comprimido.	Fabricación de escopetas y pistolas de aire y gas comprimido.	C2520.03.01	f
1451	Fabricación de máquinas imprimir direcciones.	Fabricación de máquinas imprimir direcciones.	C2817.03.03	f
1138	Fabricación de municiones de guerra; aparatos explosivos tales como bombas, minas y torpedos.	Fabricación de municiones de guerra; aparatos explosivos tales como bombas, minas y torpedos.	C2520.04.01	f
1139	Servicios de apoyo a la fabricación de armas y municiones a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de armas y municiones a cambio de una retribución o por contrato.	C2520.05.01	f
1140	Actividades de forja, prensado, estampado y laminado de metales; pulvimetalurgia, producción de objetos de metal directamente a partir de polvos de metal que se someten a tratamiento calorífico (sinterización) o de compresión.	Actividades de forja, prensado, estampado y laminado de metales; pulvimetalurgia, producción de objetos de metal directamente a partir de polvos de metal que se someten a tratamiento calorífico (sinterización) o de compresión.	C2591.00.01	f
1141	Producción de objetos metálicos, mediante pulvimetalurgia (polvos de metal sometidos a tratamiento calorífico)	Producción de objetos metálicos, mediante pulvimetalurgia (polvos de metal sometidos a tratamiento calorífico)	C2591.00.02	f
1142	Otros trabajos de metal forjado, prensado, estampado y laminado.	Otros trabajos de metal forjado, prensado, estampado y laminado.	C2591.00.03	f
1143	Actividades de servicio de tratamiento calorífico de metales, endurecimiento de metales realizadas a cambio de una retribución o por contrato.	Actividades de servicio de tratamiento calorífico de metales, endurecimiento de metales realizadas a cambio de una retribución o por contrato.	C2592.01.01	f
1144	Actividades de servicio de revestimiento de metales: enchapado, anodización, coloreado, plastificado, esmaltado, lacado, cromado, etcétera, realizadas a cambio de una retribución o por contrato.	Actividades de servicio de revestimiento de metales: enchapado, anodización, coloreado, plastificado, esmaltado, lacado, cromado, etcétera, realizadas a cambio de una retribución o por contrato.	C2592.02.01	f
1145	Actividades de servicio de limpieza de metales: desbarbado, limpieza con chorro de arena, pulimento en tambor giratorio, bruñido, pulido, limpieza de metales, realizadas a cambio de una retribución o por contrato.	Actividades de servicio de limpieza de metales: desbarbado, limpieza con chorro de arena, pulimento en tambor giratorio, bruñido, pulido, limpieza de metales, realizadas a cambio de una retribución o por contrato.	C2592.03.01	f
1146	Actividades de servicio de maquinado de metales: taladrado, torneado, fresado, erosión, alisado, lapidado, brochado, aplanado, aserrado, esmerilado, afilado, soldadura, empalme, cortado, grabado, etcétera, de piezas de metal realizadas a cambio de una retribución o por contrato.	Actividades de servicio de maquinado de metales: taladrado, torneado, fresado, erosión, alisado, lapidado, brochado, aplanado, aserrado, esmerilado, afilado, soldadura, empalme, cortado, grabado, etcétera, de piezas de metal realizadas a cambio de una retribución o por contrato.	C2592.04.01	f
1147	Fabricación de cubertería de uso doméstico, como cuchillos, tenedores, cucharas, etcétera incluso revestidos de metales preciosos.	Fabricación de cubertería de uso doméstico, como cuchillos, tenedores, cucharas, etcétera incluso revestidos de metales preciosos.	C2593.11.01	f
1148	Fabricación de otros artículos de cuchillería: destrales, cuchillos, navajas.	Fabricación de otros artículos de cuchillería: destrales, cuchillos, navajas.	C2593.12.01	f
1149	Fabricación de otros artículos de cuchillería: maquinillas de afeitar y hojas de afeitar.	Fabricación de otros artículos de cuchillería: maquinillas de afeitar y hojas de afeitar.	C2593.12.02	f
1150	Fabricación de otros artículos de cuchillería: tijeras comunes y de peluquero.	Fabricación de otros artículos de cuchillería: tijeras comunes y de peluquero.	C2593.12.03	f
1151	Fabricación de cuchillas y cizallas para máquinas y para aparatos mecánicos.	Fabricación de cuchillas y cizallas para máquinas y para aparatos mecánicos.	C2593.13.01	f
1152	Fabricación de machetes, espadas, bayonetas, etcétera.	Fabricación de machetes, espadas, bayonetas, etcétera.	C2593.14.01	f
1153	Fabricación de espadas y armas similares de metal.	Fabricación de espadas y armas similares de metal.	C2593.15.01	f
1154	Fabricación de herramientas de mano tales como alicate, destornilladores, limas, llaves inglesas, martillos, otras herramientas manuales y herramientas de mano para carpintería, ebanistería.	Fabricación de herramientas de mano tales como alicate, destornilladores, limas, llaves inglesas, martillos, otras herramientas manuales y herramientas de mano para carpintería, ebanistería.	C2593.21.01	f
1155	Fabricación de herramientas de mano tales como alicate, destornilladores, limas, llaves inglesas, martillos, otras herramientas manuales y herramientas de mano para ensambladura mecánica, chapistería.	Fabricación de herramientas de mano tales como alicate, destornilladores, limas, llaves inglesas, martillos, otras herramientas manuales y herramientas de mano para ensambladura mecánica, chapistería.	C2593.21.02	f
1156	FABRICACION DE HERRAMIENTAS DE MANO CON MOTOR ELECTRICO O NO ELECTRICO O DE FUNCIONAMIENTO CON AIRE COMPRIMIDO: TALADRADORES ROTATARIOS O DE PERCUSION , SIERRAS DE CADENA, LIMADORAS, MAQUINAS EQUIPADAS CON ESCOBILLAS DE ALAMBRE, MARTILLOS MECANICOS Y CORT	FABRICACION DE HERRAMIENTAS DE MANO CON MOTOR ELECTRICO O NO ELECTRICO O DE FUNCIONAMIENTO CON AIRE COMPRIMIDO: TALADRADORES ROTATARIOS O DE PERCUSION , SIERRAS DE CADENA, LIMADORAS, MAQUINAS EQUIPADAS CON ESCOBILLAS DE ALAMBRE, MARTILLOS MECANICOS Y CORT	C2593.21.03	f
1157	Fabricación de sierras y hojas para sierras, incluidas sierras circulares y de cadena.	Fabricación de sierras y hojas para sierras, incluidas sierras circulares y de cadena.	C2593.22.01	f
1158	Fabricación de accesorios intercambiables para herramientas de mano motorizadas o no: brocas, punzones, fresas, etcétera.	Fabricación de accesorios intercambiables para herramientas de mano motorizadas o no: brocas, punzones, fresas, etcétera.	C2593.23.01	f
1159	Fabricación de accesorios intercambiables para máquinas herramientas: brocas, punzones, fresas, etcétera.	Fabricación de accesorios intercambiables para máquinas herramientas: brocas, punzones, fresas, etcétera.	C2593.23.02	f
1160	Fabricación de herramientas de herrería: machos de forja, yunques, etcétera; moldes y cajas de moldeo (excepto lingoteras).	Fabricación de herramientas de herrería: machos de forja, yunques, etcétera; moldes y cajas de moldeo (excepto lingoteras).	C2593.24.01	f
1161	Fabricación de candados, cerraduras, pasadores, llaves, duplicación de llaves, bisagras y artículos similares, accesorios de ferretería para edificios, muebles, vehículos, etcétera.	Fabricación de candados, cerraduras, pasadores, llaves, duplicación de llaves, bisagras y artículos similares, accesorios de ferretería para edificios, muebles, vehículos, etcétera.	C2593.25.01	f
1210	Fabricación de sistemas de alarma contra incendio y robo, que transmiten señales a un centro de control.	Fabricación de sistemas de alarma contra incendio y robo, que transmiten señales a un centro de control.	C2630.05.01	f
1162	Fabricación de herramientas de mano no motorizadas: (azadones, picos, palas, etcétera) para uso agrícola, construcción, etcétera.	Fabricación de herramientas de mano no motorizadas: (azadones, picos, palas, etcétera) para uso agrícola, construcción, etcétera.	C2593.26.01	f
1163	Fabricación de mordazas, abrazaderas, estampas y troqueles de prensa.	Fabricación de mordazas, abrazaderas, estampas y troqueles de prensa.	C2593.27.01	f
1164	Servicios de apoyo a la fabricación de artículos de cuchillería, herramientas de mano y artículos de ferretería a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de artículos de cuchillería, herramientas de mano y artículos de ferretería a cambio de una retribución o por contrato.	C2593.30.01	f
1165	Fabricación de recipientes metálicos utilizados para el envase o transporte de mercancías: barriles, latas, tambores, cubos, cajas, tarros, incluso tapas corona (cierres metálicos) y latas para productos alimenticios, tubos y cajas plegables.	Fabricación de recipientes metálicos utilizados para el envase o transporte de mercancías: barriles, latas, tambores, cubos, cajas, tarros, incluso tapas corona (cierres metálicos) y latas para productos alimenticios, tubos y cajas plegables.	C2599.11.01	f
1166	Fabricación de cables de metal con o sin aislamiento que no se pueden utilizar como conductores de electricidad, trenzas de metal, alambre y artículos similares de hierro.	Fabricación de cables de metal con o sin aislamiento que no se pueden utilizar como conductores de electricidad, trenzas de metal, alambre y artículos similares de hierro.	C2599.12.01	f
1167	Fabricación de cables de metal con o sin aislamiento que no se pueden utilizar como conductores de electricidad, trenzas de metal, alambre y artículos similares de acero.	Fabricación de cables de metal con o sin aislamiento que no se pueden utilizar como conductores de electricidad, trenzas de metal, alambre y artículos similares de acero.	C2599.12.02	f
1168	Fabricación de cables de metal con o sin aislamiento que no se pueden utilizar como conductores de electricidad, trenzas de metal, alambre y artículos similares de aluminio.	Fabricación de cables de metal con o sin aislamiento que no se pueden utilizar como conductores de electricidad, trenzas de metal, alambre y artículos similares de aluminio.	C2599.12.03	f
1169	Fabricación de cables de metal con o sin aislamiento que no se pueden utilizar como conductores de electricidad, trenzas de metal, alambre y artículos similares de cobre.	Fabricación de cables de metal con o sin aislamiento que no se pueden utilizar como conductores de electricidad, trenzas de metal, alambre y artículos similares de cobre.	C2599.12.04	f
1170	Fabricación de artículos de alambre: alambre de púas, cercas de alambre, rejillas, redes, telas metálicas, etcétera.	Fabricación de artículos de alambre: alambre de púas, cercas de alambre, rejillas, redes, telas metálicas, etcétera.	C2599.13.01	f
1171	Fabricación de muelles (excepto muelles para relojes): de ballesta, helicoidales, barras de torsión, ballestas para muelles.	Fabricación de muelles (excepto muelles para relojes): de ballesta, helicoidales, barras de torsión, ballestas para muelles.	C2599.14.01	f
1172	Fabricación de productos de tortillería: tornillos, tuercas, pernos y artículos con rosca similares.	Fabricación de productos de tortillería: tornillos, tuercas, pernos y artículos con rosca similares.	C2599.15.01	f
1173	Fabricación de sujetadores hechos de metal: clavos, alfileres, tachuelas, remaches, abrazaderas, arandelas y artículos sin roscas similares.	Fabricación de sujetadores hechos de metal: clavos, alfileres, tachuelas, remaches, abrazaderas, arandelas y artículos sin roscas similares.	C2599.16.01	f
1174	Fabricación de cadenas, excepto las de transmisión de energía (mecánica).	Fabricación de cadenas, excepto las de transmisión de energía (mecánica).	C2599.17.01	f
1175	Fabricación de otros productos de tornillería, sujetadores y otros artículos hechos de alambre o metal: ruedas orientables, perchas, ganchos ( para sombreros, soportes de repisas), etc.	Fabricación de otros productos de tornillería, sujetadores y otros artículos hechos de alambre o metal: ruedas orientables, perchas, ganchos ( para sombreros, soportes de repisas), etc.	C2599.18.01	f
1176	Fabricación de artículos de metal de uso domestico: vajilla de mesa y de cocina, sean o no de metales comunes y enchapados o no con metales preciosos: platos, tazas, etcétera; servicio de mesa: boles, bandejas, etcétera; baterías de cocina: cacerolas, recipientes para hervir agua, etcétera, cazos (cazuelas), sartenes y otros utensilios no eléctricos para usar en la mesa o en la cocina.	Fabricación de artículos de metal de uso domestico: vajilla de mesa y de cocina, sean o no de metales comunes y enchapados o no con metales preciosos: platos, tazas, etcétera; servicio de mesa: boles, bandejas, etcétera; baterías de cocina: cacerolas, recipientes para hervir agua, etcétera, cazos (cazuelas), sartenes y otros utensilios no eléctricos para usar en la mesa o en la cocina.	C2599.21.01	f
1177	Fabricación de pequeños aparatos y accesorios manuales de cocina accionados a mano para preparar, acondicionar o servir alimentos.	Fabricación de pequeños aparatos y accesorios manuales de cocina accionados a mano para preparar, acondicionar o servir alimentos.	C2599.22.01	f
1178	Fabricación de artículos sanitarios de metal, bañeras, pilas (fuentes), lavabos y artículos similares.	Fabricación de artículos sanitarios de metal, bañeras, pilas (fuentes), lavabos y artículos similares.	C2599.23.01	f
1179	Servicios de apoyo a la fabricación de otros productos elaborados de metal n.c.p a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de otros productos elaborados de metal n.c.p a cambio de una retribución o por contrato.	C2599.30.01	f
1180	Fabricación de accesorios para vías de ferrocarril o tranvía por ejemplo: carriles ensamblados, plataformas giratorias, potros de contención, etcétera.	Fabricación de accesorios para vías de ferrocarril o tranvía por ejemplo: carriles ensamblados, plataformas giratorias, potros de contención, etcétera.	C2599.91.01	f
1181	Fabricación de hélices para embarcaciones y sus palas, anclas.	Fabricación de hélices para embarcaciones y sus palas, anclas.	C2599.92.01	f
1182	Fabricación de cajas fuertes o de seguridad, cajas de caudales, pórticos, puertas blindadas, etcétera.	Fabricación de cajas fuertes o de seguridad, cajas de caudales, pórticos, puertas blindadas, etcétera.	C2599.93.01	f
1183	Fabricación de imanes metálicos permanentes.	Fabricación de imanes metálicos permanentes.	C2599.94.01	f
1184	Fabricación de artículos de metal para oficina, excepto muebles.	Fabricación de artículos de metal para oficina, excepto muebles.	C2599.95.02	f
1208	Fabricación de transmisores de radio y televisión, equipos de televisión por cable (decodificadores), dispositivos de infrarrojos (control remoto).	Fabricación de transmisores de radio y televisión, equipos de televisión por cable (decodificadores), dispositivos de infrarrojos (control remoto).	C2630.04.01	f
1185	Fabricación de señales metálicas (letreros no eléctricos), marcos de metal para cuadros, placas de metal e insignias militares; artículos similares de metal (excepto metales preciosos).	Fabricación de señales metálicas (letreros no eléctricos), marcos de metal para cuadros, placas de metal e insignias militares; artículos similares de metal (excepto metales preciosos).	C2599.96.01	f
1186	Fabricación de otros artículos de metal: cascos de seguridad, etcétera.	Fabricación de otros artículos de metal: cascos de seguridad, etcétera.	C2599.99.01	f
1187	Fabricación de otros artículos de metal: cierres, hebillas, corchetes; campanas, almohadillas metálicas para fregar (estropajos); termos y otros recipientes herméticos de metal: jarros y botellas de metal; rulos para el pelo, empuñaduras y soportes para paraguas y peines de metal, bolsas de papel aluminio, etcétera.	Fabricación de otros artículos de metal: cierres, hebillas, corchetes; campanas, almohadillas metálicas para fregar (estropajos); termos y otros recipientes herméticos de metal: jarros y botellas de metal; rulos para el pelo, empuñaduras y soportes para paraguas y peines de metal, bolsas de papel aluminio, etcétera.	C2599.99.02	f
1188	Fabricación de semiconductores, condensadores electrónicos, microprocesadores, tableros de circuitos impresos y tableros sin imprimir, incluido la carga de componentes en tableros de circuitos impresos y otros componentes para aplicaciones electrónicas de electrodomésticos.	Fabricación de semiconductores, condensadores electrónicos, microprocesadores, tableros de circuitos impresos y tableros sin imprimir, incluido la carga de componentes en tableros de circuitos impresos y otros componentes para aplicaciones electrónicas de electrodomésticos.	C2610.11.01	f
1189	Fabricación de resistores electrónicos.	Fabricación de resistores electrónicos.	C2610.12.01	f
1190	Fabricación de tubos electrónicos.	Fabricación de tubos electrónicos.	C2610.13.01	f
1191	Servicios de apoyo a la fabricación de componentes y tableros electrónicos a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de componentes y tableros electrónicos a cambio de una retribución o por contrato.	C2610.20.01	f
1192	Fabricación de circuitos integrados (análogos, digitales o híbridos), tarjetas inteligentes (tarjetas bancarias, de identificación y acceso, fidelización, etcétera).	Fabricación de circuitos integrados (análogos, digitales o híbridos), tarjetas inteligentes (tarjetas bancarias, de identificación y acceso, fidelización, etcétera).	C2610.91.01	f
1193	Fabricación de diodos, transistores y dispositivos semiconductores similares.	Fabricación de diodos, transistores y dispositivos semiconductores similares.	C2610.92.01	f
1194	Fabricación de inductores (autoinductores, bobinas, transformadores) del tipo de los utilizados como componentes electrónico; cristales y juegos de cristales electrónicos; plaquetas u obleas, de semiconductores, acabados o semiacabados; solenoides, conmutadores y transductores para aplicaciones eléctricas.	Fabricación de inductores (autoinductores, bobinas, transformadores) del tipo de los utilizados como componentes electrónico; cristales y juegos de cristales electrónicos; plaquetas u obleas, de semiconductores, acabados o semiacabados; solenoides, conmutadores y transductores para aplicaciones eléctricas.	C2610.93.01	f
1195	Fabricación de tarjetas de interfaz (de sonido, video, control, red, módems).	Fabricación de tarjetas de interfaz (de sonido, video, control, red, módems).	C2610.94.01	f
1196	Fabricación de componentes de pantallas (plasma, polímeros, cristal líquido LCD) y diodos emisores de luz (LED).	Fabricación de componentes de pantallas (plasma, polímeros, cristal líquido LCD) y diodos emisores de luz (LED).	C2610.95.01	f
1197	Fabricación de otros productos electrónicos: cables de impresora, monitor, cables USB, conectores etcétera.	Fabricación de otros productos electrónicos: cables de impresora, monitor, cables USB, conectores etcétera.	C2610.99.01	f
1198	Fabricación de ordenadores (computadoras) centrales, microcomputadoras; de escritorio, portátiles (laptops, notebooks); ordenadores de mano (asistentes digitales personales), servidores informáticos.	Fabricación de ordenadores (computadoras) centrales, microcomputadoras; de escritorio, portátiles (laptops, notebooks); ordenadores de mano (asistentes digitales personales), servidores informáticos.	C2620.01.01	f
1199	Fabricación de unidades de disco magnético, unidades de USB: mp3, mp4, pen drives y otros dispositivos de almacenamiento; unidades de disco óptico (CD-RW, CD-ROM, DVD-ROM, DVD-RW).	Fabricación de unidades de disco magnético, unidades de USB: mp3, mp4, pen drives y otros dispositivos de almacenamiento; unidades de disco óptico (CD-RW, CD-ROM, DVD-ROM, DVD-RW).	C2620.02.01	f
1200	Fabricación de impresoras; monitores, teclados, todo tipo de ratones, palancas de mando y bolas rodantes, equipo de oficina multifunciones como combinaciones de fax-escáner-copiadora, escáneres.	Fabricación de impresoras; monitores, teclados, todo tipo de ratones, palancas de mando y bolas rodantes, equipo de oficina multifunciones como combinaciones de fax-escáner-copiadora, escáneres.	C2620.03.01	f
1201	Fabricación de terminales informáticas especializadas.	Fabricación de terminales informáticas especializadas.	C2620.04.01	f
1202	Fabricación de terminales como cajeros automáticos (ATM); terminales de puntos de venta, no accionados mecánicamente, monederos automáticos, lectores de códigos de barra; lectores de tarjetas inteligentes.	Fabricación de terminales como cajeros automáticos (ATM); terminales de puntos de venta, no accionados mecánicamente, monederos automáticos, lectores de códigos de barra; lectores de tarjetas inteligentes.	C2620.05.01	f
1203	Servicios de apoyo a la fabricación de ordenadores y equipo periférico a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de ordenadores y equipo periférico a cambio de una retribución o por contrato.	C2620.06.01	f
1204	Fabricación de otros equipos informáticos: cascos de realidad virtual; proyectores informáticos (proyectores de vídeo) etcétera.	Fabricación de otros equipos informáticos: cascos de realidad virtual; proyectores informáticos (proyectores de vídeo) etcétera.	C2620.09.01	f
1205	Fabricación de aparatos para la conmutación y transmisión de datos: centrales telefónicas - PBX; módems, bridges, routers, gateways, etcétera.	Fabricación de aparatos para la conmutación y transmisión de datos: centrales telefónicas - PBX; módems, bridges, routers, gateways, etcétera.	C2630.01.01	f
1206	Fabricación de teléfonos inalámbricos; equipos telefónicos y de fax, incluidos los contestadores automáticos, equipo móvil de comunicaciones.	Fabricación de teléfonos inalámbricos; equipos telefónicos y de fax, incluidos los contestadores automáticos, equipo móvil de comunicaciones.	C2630.02.01	f
1207	Fabricación de teléfonos celulares, mensáfonos, localizadores (buscapersonas).	Fabricación de teléfonos celulares, mensáfonos, localizadores (buscapersonas).	C2630.03.01	f
1209	Fabricación de cámaras de televisión.	Fabricación de cámaras de televisión.	C2630.04.02	f
1211	Servicios de apoyo a la fabricación de equipo de comunicaciones a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de equipo de comunicaciones a cambio de una retribución o por contrato.	C2630.06.01	f
1212	Fabricación de otros equipos de telecomunicaciones diversos: manipuladores morse.	Fabricación de otros equipos de telecomunicaciones diversos: manipuladores morse.	C2630.09.01	f
1213	Fabricación de otros equipos de telecomunicaciones diversos: grabadores de tipo morse.	Fabricación de otros equipos de telecomunicaciones diversos: grabadores de tipo morse.	C2630.09.02	f
1214	Fabricación de otros equipos de telecomunicaciones diversos: transmisores telegráficos.	Fabricación de otros equipos de telecomunicaciones diversos: transmisores telegráficos.	C2630.09.03	f
1215	Fabricación de otros equipos de telecomunicaciones diversos: antenas de transmisión y recepción, etcétera.	Fabricación de otros equipos de telecomunicaciones diversos: antenas de transmisión y recepción, etcétera.	C2630.09.04	f
1216	Fabricación de otros equipos de telecomunicaciones diversos: receptores telegráficos.	Fabricación de otros equipos de telecomunicaciones diversos: receptores telegráficos.	C2630.09.05	f
1217	Fabricación de otros equipos de telecomunicaciones diversos: aparatos para telefonía y telegrafía.	Fabricación de otros equipos de telecomunicaciones diversos: aparatos para telefonía y telegrafía.	C2630.09.06	f
1218	Fabricación de equipo de grabación y reproducción de video, incluso cámaras de video de tipo familiar; reproductores de DVD.	Fabricación de equipo de grabación y reproducción de video, incluso cámaras de video de tipo familiar; reproductores de DVD.	C2640.01.01	f
1219	Fabricación de televisores, incluso monitores y pantallas de televisión.	Fabricación de televisores, incluso monitores y pantallas de televisión.	C2640.02.01	f
1220	Fabricación de equipos de sonido, etcétera.	Fabricación de equipos de sonido, etcétera.	C2640.03.01	f
1221	Fabricación de equipo de grabación y reproducción de sonido; reproductores de CD; equipos estereofónicos.	Fabricación de equipo de grabación y reproducción de sonido; reproductores de CD; equipos estereofónicos.	C2640.03.02	f
1222	Fabricación de receptores de radio, incluso con dispositivos de grabación o reproducción de sonido o con un reloj.	Fabricación de receptores de radio, incluso con dispositivos de grabación o reproducción de sonido o con un reloj.	C2640.03.03	f
1223	Fabricación de receptores de radiotelefonía o radiotelegrafía, incluso con dispositivos de grabación o reproducción de sonido o con un reloj.	Fabricación de receptores de radiotelefonía o radiotelegrafía, incluso con dispositivos de grabación o reproducción de sonido o con un reloj.	C2640.03.04	f
1224	Fabricación de amplificadores para instrumentos musicales y sistemas de megafonía.	Fabricación de amplificadores para instrumentos musicales y sistemas de megafonía.	C2640.04.01	f
1225	Fabricación de micrófonos; audífonos (para radios, equipos estereofónicos, ordenadores); parlantes, sistemas de altavoces.	Fabricación de micrófonos; audífonos (para radios, equipos estereofónicos, ordenadores); parlantes, sistemas de altavoces.	C2640.04.02	f
1226	Servicios de apoyo a la fabricación de aparatos electrónicos de consumo a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de aparatos electrónicos de consumo a cambio de una retribución o por contrato.	C2640.05.01	f
1227	Fabricación de piezas y partes especiales para los aparatos receptores de radio y televisión y productos conexos: fonocaptores, platos para giradiscos, antenas,  brazos y cabezas acústicas de fonocaptores, reflectores de antena etc.	Fabricación de piezas y partes especiales para los aparatos receptores de radio y televisión y productos conexos: fonocaptores, platos para giradiscos, antenas,  brazos y cabezas acústicas de fonocaptores, reflectores de antena etc.	C2640.06.01	f
1229	Fabricación de aparatos de radiotelefonía para equipo de transporte.	Fabricación de aparatos de radiotelefonía para equipo de transporte.	C2640.07.02	f
1230	Fabricación de emisores - receptores.	Fabricación de emisores - receptores.	C2640.07.03	f
1231	Fabricación de radioteléfonos.	Fabricación de radioteléfonos.	C2640.07.04	f
1232	Fabricación de aparatos de radio telegráficos del tipo facsimile y otros respondedores.	Fabricación de aparatos de radio telegráficos del tipo facsimile y otros respondedores.	C2640.07.05	f
1233	Fabricación de tubos de imagen para cámaras de televisión y para receptores de televisión, convertidores e intensificadores de imagen.	Fabricación de tubos de imagen para cámaras de televisión y para receptores de televisión, convertidores e intensificadores de imagen.	C2640.08.01	f
1234	Fabricación de tubos de microondas.	Fabricación de tubos de microondas.	C2640.08.02	f
1235	Fabricación de tubos o válvulas termiónicos, de cátodo frio o foto catódicos, tubos o válvulas receptores o amplificadores.	Fabricación de tubos o válvulas termiónicos, de cátodo frio o foto catódicos, tubos o válvulas receptores o amplificadores.	C2640.08.03	f
1236	Fabricación de otros aparatos electrónicos diversos: aparatos de karaoke; consolas de videojuegos, rocolas (jukeboxes), etcétera.	Fabricación de otros aparatos electrónicos diversos: aparatos de karaoke; consolas de videojuegos, rocolas (jukeboxes), etcétera.	C2640.09.01	f
1237	Fabricación de instrumentos para motores de aeronaves.	Fabricación de instrumentos para motores de aeronaves.	C2651.11.01	f
1238	Fabricación de equipo de prueba de emisiones de vehículos automotores.	Fabricación de equipo de prueba de emisiones de vehículos automotores.	C2651.12.01	f
1239	Fabricación de instrumentos meteorológicos.	Fabricación de instrumentos meteorológicos.	C2651.13.01	f
1240	Fabricación de instrumentos geofísicos.	Fabricación de instrumentos geofísicos.	C2651.13.02	f
1241	Fabricación de instrumentos de prospección, nivelar, agrimensura (teodolitos).	Fabricación de instrumentos de prospección, nivelar, agrimensura (teodolitos).	C2651.13.03	f
1242	Fabricación de instrumentos hidrológicos,  oceanográficos.	Fabricación de instrumentos hidrológicos,  oceanográficos.	C2651.13.04	f
1244	Fabricación de instrumentos de geodesia, pilotes automáticos.	Fabricación de instrumentos de geodesia, pilotes automáticos.	C2651.13.06	f
1245	Fabricación de sondas ultrasónicas.	Fabricación de sondas ultrasónicas.	C2651.13.07	f
1277	Fabricación de detectores de movimiento; detectores de minas, generadores de impulsos (señales); detectores de metal.	Fabricación de detectores de movimiento; detectores de minas, generadores de impulsos (señales); detectores de metal.	C2651.32.01	f
1246	Fabricación de equipos de pruebas e inspección de propiedades físicas o químicas; polígrafos (máquinas detectoras de mentiras); instrumentos de análisis de laboratorio (equipos de análisis de sangre).	Fabricación de equipos de pruebas e inspección de propiedades físicas o químicas; polígrafos (máquinas detectoras de mentiras); instrumentos de análisis de laboratorio (equipos de análisis de sangre).	C2651.14.01	f
1247	Fabricación de instrumentos para medición y pruebas de electricidad y señales eléctricas (incluidos los destinados a actividades de telecomunicaciones).	Fabricación de instrumentos para medición y pruebas de electricidad y señales eléctricas (incluidos los destinados a actividades de telecomunicaciones).	C2651.15.01	f
1248	Fabricación de instrumentos de detección y vigilancia de radiaciones.	Fabricación de instrumentos de detección y vigilancia de radiaciones.	C2651.16.01	f
1252	Fabricación de cuentarrevoluciones.	Fabricación de cuentarrevoluciones.	C2651.17.04	f
1256	Fabricación de bancos de prueba.	Fabricación de bancos de prueba.	C2651.17.08	f
1257	Fabricación de instrumentos para verificar relojes o piezas de relojes excepto equipo de control de procesos industriales.	Fabricación de instrumentos para verificar relojes o piezas de relojes excepto equipo de control de procesos industriales.	C2651.17.09	f
1258	Fabricación de instrumentos y aparatos de medición y regulación constante y automática de variables como: temperatura, presión, viscosidad, etc., de materiales o productos durante su fabricación u otro tipo de elaboración.	Fabricación de instrumentos y aparatos de medición y regulación constante y automática de variables como: temperatura, presión, viscosidad, etc., de materiales o productos durante su fabricación u otro tipo de elaboración.	C2651.18.01	f
1259	Fabricación de termómetros de bola de vidrio rellena con líquido y de termómetros bimetálicos (excepto termómetros de uso médico).	Fabricación de termómetros de bola de vidrio rellena con líquido y de termómetros bimetálicos (excepto termómetros de uso médico).	C2651.21.01	f
1260	Fabricación de medidores de flujómetro y dispositivos contadores, manómetros, contadores totalizadores.	Fabricación de medidores de flujómetro y dispositivos contadores, manómetros, contadores totalizadores.	C2651.22.01	f
1261	Fabricación de contadores de consumo de agua, etc.	Fabricación de contadores de consumo de agua, etc.	C2651.22.02	f
1262	Fabricación de contadores de gas, etcétera.	Fabricación de contadores de gas, etcétera.	C2651.22.03	f
1263	Fabricación de balanzas y básculas.	Fabricación de balanzas y básculas.	C2651.23.01	f
1264	Fabricación de microscopios electrónicos y protónicos.	Fabricación de microscopios electrónicos y protónicos.	C2651.24.01	f
1265	Fabricación de instrumentos de dibujo, trazado o cálculo matemático, incluso instrumentos de mano para medir longitudes (cintas métricas, micrómetros, calibradores y calibres).	Fabricación de instrumentos de dibujo, trazado o cálculo matemático, incluso instrumentos de mano para medir longitudes (cintas métricas, micrómetros, calibradores y calibres).	C2651.25.01	f
1266	Fabricación de instrumentos y aparatos para efectuar análisis físicos o químicos: polarímetros, refractómetros, colorímetros, aparatos de orsat para el análisis de gases, medidores del ph, viscosímetros, etc.	Fabricación de instrumentos y aparatos para efectuar análisis físicos o químicos: polarímetros, refractómetros, colorímetros, aparatos de orsat para el análisis de gases, medidores del ph, viscosímetros, etc.	C2651.26.01	f
1267	Fabricación de máquinas y aparatos de ensayo para determinar las propiedades físicas de materiales.	Fabricación de máquinas y aparatos de ensayo para determinar las propiedades físicas de materiales.	C2651.27.01	f
1268	Fabricación de máquinas para determinar la dureza y otras propiedades de los metales, la resistencia de productos textiles, propiedades físicas del papel, plástico, linóleo, caucho, madera y hormigón.	Fabricación de máquinas para determinar la dureza y otras propiedades de los metales, la resistencia de productos textiles, propiedades físicas del papel, plástico, linóleo, caucho, madera y hormigón.	C2651.27.02	f
1269	Fabricación de aparatos para medir y verificar magnitudes eléctricas, con o sin dispositivo registrador: osciloscopios, espectroscopios.	Fabricación de aparatos para medir y verificar magnitudes eléctricas, con o sin dispositivo registrador: osciloscopios, espectroscopios.	C2651.28.01	f
1270	Fabricación de osciloscopios, espectroscopios e instrumentos para verificar la corriente, el voltaje o la resistencia.	Fabricación de osciloscopios, espectroscopios e instrumentos para verificar la corriente, el voltaje o la resistencia.	C2651.28.02	f
1271	Fabricación de otros equipos para medición y verificación: registradores de vuelo (caja negra), espectrómetros, medidores de neumáticos, incubadoras y aparatos de laboratorio similares para mediciones, pruebas, etcétera.	Fabricación de otros equipos para medición y verificación: registradores de vuelo (caja negra), espectrómetros, medidores de neumáticos, incubadoras y aparatos de laboratorio similares para mediciones, pruebas, etcétera.	C2651.29.01	f
1272	Fabricación de instrumentos y aparatos para medir y verificar el flujo, nivel, presión u otras  variables de líquidos o gases (medidores de flujo, indicadores de nivel, manómetros, calorímetros, etc.)	Fabricación de instrumentos y aparatos para medir y verificar el flujo, nivel, presión u otras  variables de líquidos o gases (medidores de flujo, indicadores de nivel, manómetros, calorímetros, etc.)	C2651.30.01	f
1273	Fabricación de equipo de control de procesos industriales.	Fabricación de equipo de control de procesos industriales.	C2651.30.02	f
1274	Fabricación de equipo aeronáutico de búsqueda, detección, incluidas sonares, sonoboyas.	Fabricación de equipo aeronáutico de búsqueda, detección, incluidas sonares, sonoboyas.	C2651.31.01	f
1275	Fabricación de equipo náutico de búsqueda, detección y navegación, incluidas sonares, sonoboyas.	Fabricación de equipo náutico de búsqueda, detección y navegación, incluidas sonares, sonoboyas.	C2651.31.02	f
1276	Fabricación de equipos de radar y fabricación de dispositivos GPS.	Fabricación de equipos de radar y fabricación de dispositivos GPS.	C2651.31.03	f
2060	Venta al por mayor de productos de tabaco.	Venta al por mayor de productos de tabaco.	G4630.96.01	f
1278	Fabricación de otros dispositivos: dispositivos de climatización y dispositivos automáticos de control para aparatos de uso doméstico, limitadores hidrónicos, dispositivos de control de la llama y del quemador, controles medioambientales y controles automáticos para diversos aparatos, instrumentos de medida de la humedad (higrostatos), etcétera.	Fabricación de otros dispositivos: dispositivos de climatización y dispositivos automáticos de control para aparatos de uso doméstico, limitadores hidrónicos, dispositivos de control de la llama y del quemador, controles medioambientales y controles automáticos para diversos aparatos, instrumentos de medida de la humedad (higrostatos), etcétera.	C2651.39.01	f
1279	Servicios de apoyo a la fabricación de equipos de medición, prueba, navegación, control y de relojes a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de equipos de medición, prueba, navegación, control y de relojes a cambio de una retribución o por contrato.	C2651.40.01	f
1280	Fabricación de relojes de todo tipo, incluido relojes para paneles de instrumentos.	Fabricación de relojes de todo tipo, incluido relojes para paneles de instrumentos.	C2652.01.01	f
1281	Fabricación de cajas de relojes, incluidas cajas de metales preciosos y sus partes.	Fabricación de cajas de relojes, incluidas cajas de metales preciosos y sus partes.	C2652.02.01	f
1282	Fabricación de aparatos para registrar la hora del día y aparatos para medir.	Fabricación de aparatos para registrar la hora del día y aparatos para medir.	C2652.03.01	f
1283	Fabricación de aparatos para registrar o indicar de otro modo intervalos de tiempo mediante un mecanismo de relojería o un motor sincrónico como: parquímetros, relojes de control de entrada, marcadores de fecha y hora, cronómetros de tiempos de fabricación, conmutadores horarios y otros dispositivos de puesta en marcha con mecanismo de relojería o con motor sincrónico (cerraduras temporizadas).	Fabricación de aparatos para registrar o indicar de otro modo intervalos de tiempo mediante un mecanismo de relojería o un motor sincrónico como: parquímetros, relojes de control de entrada, marcadores de fecha y hora, cronómetros de tiempos de fabricación, conmutadores horarios y otros dispositivos de puesta en marcha con mecanismo de relojería o con motor sincrónico (cerraduras temporizadas).	C2652.03.02	f
1284	Fabricación de piezas sueltas para relojes: muelles, rubíes, esferas, chapas, puentes.	Fabricación de piezas sueltas para relojes: muelles, rubíes, esferas, chapas, puentes.	C2652.04.01	f
1285	Fabricación de piezas para relojes, mecanismos de relojería y otras piezas.	Fabricación de piezas para relojes, mecanismos de relojería y otras piezas.	C2652.04.02	f
1286	Servicios de apoyo a la fabricación de relojes a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de relojes a cambio de una retribución o por contrato.	C2652.05.01	f
1287	Fabricación de correas , cintas y pulseras de metal para relojes de bolsillo y pulsera.	Fabricación de correas , cintas y pulseras de metal para relojes de bolsillo y pulsera.	C2652.06.01	f
1288	Fabricación de correas , cintas y pulseras de metales preciosos para relojes de bolsillo y pulsera.	Fabricación de correas , cintas y pulseras de metales preciosos para relojes de bolsillo y pulsera.	C2652.06.02	f
1289	Fabricación de aparatos de irradiación similares (industriales o de uso diagnóstico, terapéutico, científico o de investigación): equipo de rayos beta, de rayos gamma, de rayos X y otros tipos de equipo de radiación; escáneres de tomografía computadorizada (CT) y por emisión de positrones (PET); equipo de irradiación de alimentos y leche.	Fabricación de aparatos de irradiación similares (industriales o de uso diagnóstico, terapéutico, científico o de investigación): equipo de rayos beta, de rayos gamma, de rayos X y otros tipos de equipo de radiación; escáneres de tomografía computadorizada (CT) y por emisión de positrones (PET); equipo de irradiación de alimentos y leche.	C2660.01.01	f
1290	Fabricación de equipo médico para electrodiagnóstico: equipo de tomografía por resonancia magnética MRI, equipo médico de ultrasonido, electrocardiógrafos, equipo electrónico de endoscopia.	Fabricación de equipo médico para electrodiagnóstico: equipo de tomografía por resonancia magnética MRI, equipo médico de ultrasonido, electrocardiógrafos, equipo electrónico de endoscopia.	C2660.02.01	f
1291	Servicios de apoyo a la fabricación de equipo de irradiación, y equipo electrónico de uso médico y terapéutico a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de equipo de irradiación, y equipo electrónico de uso médico y terapéutico a cambio de una retribución o por contrato.	C2660.03.01	f
1292	Fabricación de otros equipos electromédicos: marcapasos, audífonos, equipo médico de láser, etcétera.	Fabricación de otros equipos electromédicos: marcapasos, audífonos, equipo médico de láser, etcétera.	C2660.09.01	f
1293	Fabricación de equipos de posicionamiento ópticos; revestimiento, pulido y montadura de lentes.	Fabricación de equipos de posicionamiento ópticos; revestimiento, pulido y montadura de lentes.	C2670.11.01	f
1294	Fabricación de espejos ópticos, lentes, prismas, etcétera.	Fabricación de espejos ópticos, lentes, prismas, etcétera.	C2670.11.02	f
1295	Fabricación de instrumentos de aumento ópticos; dispositivos ópticos de puntería (miras para armas); instrumentos ópticos de precisión para mecánicos; comparadores ópticos; ensamblados de láser.	Fabricación de instrumentos de aumento ópticos; dispositivos ópticos de puntería (miras para armas); instrumentos ópticos de precisión para mecánicos; comparadores ópticos; ensamblados de láser.	C2670.12.01	f
1296	Fabricación de instrumentos de aumento ópticos; dispositivos ópticos de puntería (miras para armas).	Fabricación de instrumentos de aumento ópticos; dispositivos ópticos de puntería (miras para armas).	C2670.12.02	f
1297	Fabricación de instrumentos de aumento ópticos; ensamblados de láser.	Fabricación de instrumentos de aumento ópticos; ensamblados de láser.	C2670.12.03	f
1298	Fabricación de instrumentos de aumento ópticos; instrumentos ópticos de precisión para mecánicos; lupas, cristales de aumento para uso manual, espejos de vidrio, mirillas de puertas, etc.	Fabricación de instrumentos de aumento ópticos; instrumentos ópticos de precisión para mecánicos; lupas, cristales de aumento para uso manual, espejos de vidrio, mirillas de puertas, etc.	C2670.12.04	f
1299	Fabricación de microscopios ópticos, telescopios y binoculares.	Fabricación de microscopios ópticos, telescopios y binoculares.	C2670.13.01	f
1300	Fabricación de microscopios ópticos.	Fabricación de microscopios ópticos.	C2670.13.02	f
1301	Fabricación de microscopios para microfotografía y microproyección, telescopios y binoculares.	Fabricación de microscopios para microfotografía y microproyección, telescopios y binoculares.	C2670.13.03	f
1302	Fabricación de instrumentos ópticos como: gemelos.	Fabricación de instrumentos ópticos como: gemelos.	C2670.14.01	f
1304	Fabricación de elementos ópticos de vidrio o de cualquier otro material (cuarzo, espato, flúor, plástico o metal).	Fabricación de elementos ópticos de vidrio o de cualquier otro material (cuarzo, espato, flúor, plástico o metal).	C2670.15.01	f
1305	Fabricación de elementos ópticos montados.	Fabricación de elementos ópticos montados.	C2670.16.01	f
1306	Fabricación de cámaras de película y cámaras digitales, para todo uso.	Fabricación de cámaras de película y cámaras digitales, para todo uso.	C2670.21.01	f
1307	Fabricación de cámaras de película y cámaras digitales, subacuáticas y aéreas.	Fabricación de cámaras de película y cámaras digitales, subacuáticas y aéreas.	C2670.21.02	f
1308	Fabricación de proyectores de películas y diapositivas.	Fabricación de proyectores de películas y diapositivas.	C2670.22.01	f
1309	Fabricación de proyectores, retroproyectores de transparencias.	Fabricación de proyectores, retroproyectores de transparencias.	C2670.22.02	f
1310	Fabricación de dispositivos e instrumentos ópticos de medición y verificación (equipos de control de tiro, fotómetros y telémetros).	Fabricación de dispositivos e instrumentos ópticos de medición y verificación (equipos de control de tiro, fotómetros y telémetros).	C2670.23.01	f
1311	Fabricación de aparatos y equipo para laboratorio fotográfico (incluso cinematografía).	Fabricación de aparatos y equipo para laboratorio fotográfico (incluso cinematografía).	C2670.24.01	f
1312	Fabricación de aparatos para la proyección del diseño de circuitos sobre materiales semiconductores sensibilizados y pantallas de protección.	Fabricación de aparatos para la proyección del diseño de circuitos sobre materiales semiconductores sensibilizados y pantallas de protección.	C2670.25.01	f
1313	Servicios de apoyo a la fabricación de instrumentos ópticos a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de instrumentos ópticos a cambio de una retribución o por contrato.	C2670.30.01	f
1314	Servicios de apoyo a la fabricación de instrumentos y equipo fotográficos a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de instrumentos y equipo fotográficos a cambio de una retribución o por contrato.	C2670.30.02	f
1315	Fabricación de cintas, cassettes, disquetes, tarjetas con bandas magnéticas, soportes para disco duro vírgenes (en blanco) de: sonido, video y datos	Fabricación de cintas, cassettes, disquetes, tarjetas con bandas magnéticas, soportes para disco duro vírgenes (en blanco) de: sonido, video y datos	C2680.01.01	f
1316	Fabricación de discos ópticos vírgenes.	Fabricación de discos ópticos vírgenes.	C2680.02.01	f
1317	Servicios de apoyo a la fabricación de soportes magnéticos y ópticos a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de soportes magnéticos y ópticos a cambio de una retribución o por contrato.	C2680.03.01	f
1318	Fabricación de transformadores de distribución, para soldadura con arco eléctrico, de subestación para la distribución de energía eléctrica, de reactancias (es decir, transformadores) para lámparas fluorescentes.	Fabricación de transformadores de distribución, para soldadura con arco eléctrico, de subestación para la distribución de energía eléctrica, de reactancias (es decir, transformadores) para lámparas fluorescentes.	C2710.11.01	f
1319	Fabricación de motores eléctricos (excepto los motores de arranque para motores de combustión interna).	Fabricación de motores eléctricos (excepto los motores de arranque para motores de combustión interna).	C2710.12.01	f
1320	Fabricación de motores eléctricos (excepto los motores de arranque para motores de combustión interna)de corriente continua.	Fabricación de motores eléctricos (excepto los motores de arranque para motores de combustión interna)de corriente continua.	C2710.12.02	f
1321	Fabricación de generadores de fuerza (excepto los alternadores cargados por baterías para motores de combustión interna); motores generadores (excepto turbogeneradores); generadores de impulsión.	Fabricación de generadores de fuerza (excepto los alternadores cargados por baterías para motores de combustión interna); motores generadores (excepto turbogeneradores); generadores de impulsión.	C2710.13.01	f
1323	Fabricación de reguladores del voltaje de transmisión y distribución; rebobinado de inducidos en fábrica.	Fabricación de reguladores del voltaje de transmisión y distribución; rebobinado de inducidos en fábrica.	C2710.14.01	f
1324	Fabricación de partes de: generadores, motores y transformadores.	Fabricación de partes de: generadores, motores y transformadores.	C2710.15.01	f
1325	Fabricación de covertidores rotatorios.	Fabricación de covertidores rotatorios.	C2710.16.01	f
1326	Fabricación de disyuntores de circuitos eléctricos; limitadores de sobretensión (para voltajes de distribución); fusibles eléctricos.	Fabricación de disyuntores de circuitos eléctricos; limitadores de sobretensión (para voltajes de distribución); fusibles eléctricos.	C2710.21.01	f
1327	Fabricación de paneles de control para la distribución de energía eléctrica; conductos para cuadros de distribución.	Fabricación de paneles de control para la distribución de energía eléctrica; conductos para cuadros de distribución.	C2710.22.01	f
1328	Fabricación de relés eléctricos.	Fabricación de relés eléctricos.	C2710.23.01	f
1329	Fabricación de conmutadores (excepto los de pulsador, de resorte, solenoidales, oscilantes), equipos de conmutación, portalámparas, clavijas, terminales y otros conectores eléctricos.	Fabricación de conmutadores (excepto los de pulsador, de resorte, solenoidales, oscilantes), equipos de conmutación, portalámparas, clavijas, terminales y otros conectores eléctricos.	C2710.24.01	f
1330	Servicios de apoyo a la fabricación de aparatos de distribución y control de la energía eléctrica a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de aparatos de distribución y control de la energía eléctrica a cambio de una retribución o por contrato.	C2710.30.01	f
1331	Servicios de apoyo a la fabricación de motores, generadores, transformadores eléctricos a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de motores, generadores, transformadores eléctricos a cambio de una retribución o por contrato.	C2710.30.02	f
1332	Fabricación de pilas y baterías primarias: pilas de dióxido de manganeso, dióxido de mercurio, óxido de plata, etc.	Fabricación de pilas y baterías primarias: pilas de dióxido de manganeso, dióxido de mercurio, óxido de plata, etc.	C2720.01.01	f
1333	Fabricación de pilas y baterías primarias: plomo-ácido, níquel-cadmio, níquel e hidruro metálico, litio, pilas secas y húmedas, etcétera (baterías para automotores).	Fabricación de pilas y baterías primarias: plomo-ácido, níquel-cadmio, níquel e hidruro metálico, litio, pilas secas y húmedas, etcétera (baterías para automotores).	C2720.01.02	f
1334	Fabricación de acumuladores eléctricos y partes de acumuladores, separadores, contenedores, tapas.	Fabricación de acumuladores eléctricos y partes de acumuladores, separadores, contenedores, tapas.	C2720.02.01	f
1335	Servicios de apoyo a la fabricación de pilas, baterías y acumuladores a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de pilas, baterías y acumuladores a cambio de una retribución o por contrato.	C2720.03.01	f
1336	Fabricación de cables de fibra óptica para la transmisión de datos o la transmisión de imágenes en directo.	Fabricación de cables de fibra óptica para la transmisión de datos o la transmisión de imágenes en directo.	C2731.01.01	f
1337	Servicios de apoyo a la fabricación de cables de fibra óptica a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de cables de fibra óptica a cambio de una retribución o por contrato.	C2731.02.01	f
1338	Fabricación de fibras ópticas y cables de fibras ópticas no recubiertas.	Fabricación de fibras ópticas y cables de fibras ópticas no recubiertas.	C2731.03.01	f
1339	Fabricación de placas de metal aislantes (utilizadas en máquinas de gran potencia o equipo de control)	Fabricación de placas de metal aislantes (utilizadas en máquinas de gran potencia o equipo de control)	C2731.04.01	f
1340	Fabricación de hilos y cables aislados de acero, cobre, aluminio y otros juegos de cables eléctricos aislados y enchufe.	Fabricación de hilos y cables aislados de acero, cobre, aluminio y otros juegos de cables eléctricos aislados y enchufe.	C2732.01.01	f
1341	Servicios de apoyo a la fabricación de otros hilos y cables eléctricos a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de otros hilos y cables eléctricos a cambio de una retribución o por contrato.	C2732.02.01	f
1342	Fabricación de juegos de cables, incluso de encendido para motores de aeronaves.	Fabricación de juegos de cables, incluso de encendido para motores de aeronaves.	C2732.03.01	f
1343	Fabricación de juegos de cables, incluso de encendido para motores de embarcaciones.	Fabricación de juegos de cables, incluso de encendido para motores de embarcaciones.	C2732.03.02	f
1344	Fabricación de juegos de cables, incluso de encendido para motores de vehículos o para otro tipo de maquinaria.	Fabricación de juegos de cables, incluso de encendido para motores de vehículos o para otro tipo de maquinaria.	C2732.03.03	f
1345	Fabricación de barras colectoras y otros conductores eléctricos (excepto del tipo de los utilizados en conmutadores).	Fabricación de barras colectoras y otros conductores eléctricos (excepto del tipo de los utilizados en conmutadores).	C2733.01.01	f
1346	Fabricación de interruptores de circuito por falta de conexión a tierra (GFCI).	Fabricación de interruptores de circuito por falta de conexión a tierra (GFCI).	C2733.02.01	f
1347	Fabricación de portalámparas, pararrayos, conmutadores (de presión, de botón, de resorte, oscilantes), enchufes y tomas de corriente, cajas para cableado (de conexiones, de toma de corriente, de conmutación).	Fabricación de portalámparas, pararrayos, conmutadores (de presión, de botón, de resorte, oscilantes), enchufes y tomas de corriente, cajas para cableado (de conexiones, de toma de corriente, de conmutación).	C2733.03.01	f
1348	Servicios de apoyo a la fabricación de dispositivos de cableado a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de dispositivos de cableado a cambio de una retribución o por contrato.	C2733.04.01	f
1349	Fabricación de otros dispositivos de cableado: dispositivos de cableado de plástico no portadores de corriente, como cajas de conexiones, chapas frontales y artículos similares, accesorios de plástico para tendidos aéreos, dispositivos para postes y líneas de transmisión, conductos y accesorios eléctricos (canaletas), etcétera.	Fabricación de otros dispositivos de cableado: dispositivos de cableado de plástico no portadores de corriente, como cajas de conexiones, chapas frontales y artículos similares, accesorios de plástico para tendidos aéreos, dispositivos para postes y líneas de transmisión, conductos y accesorios eléctricos (canaletas), etcétera.	C2733.09.01	f
1350	Fabricación de lámparas, tubos y bombillas de descarga de mesa, de pie, candelabros, etc.	Fabricación de lámparas, tubos y bombillas de descarga de mesa, de pie, candelabros, etc.	C2740.01.01	f
1351	Fabricación de lámparas de arco, incandescentes, fluorescentes.	Fabricación de lámparas de arco, incandescentes, fluorescentes.	C2740.01.02	f
1352	Fabricación de lámparas de destellos, etcétera.	Fabricación de lámparas de destellos, etcétera.	C2740.01.03	f
1353	Fabricación de lámparas de rayos ultravioletas, de rayos infrarrojos, etcétera.	Fabricación de lámparas de rayos ultravioletas, de rayos infrarrojos, etcétera.	C2740.01.04	f
1354	Fabricación de lámparas de techo, arañas colgantes, lámparas de mesa, juegos de luces para decorar árboles de Navidad, lámparas eléctricas contra insectos, troncos eléctricos para chimenea, lámparas para la iluminación de las calles (excepto señales de tráfico), proyectores de teatro.	Fabricación de lámparas de techo, arañas colgantes, lámparas de mesa, juegos de luces para decorar árboles de Navidad, lámparas eléctricas contra insectos, troncos eléctricos para chimenea, lámparas para la iluminación de las calles (excepto señales de tráfico), proyectores de teatro.	C2740.02.01	f
1355	Fabricación de linternas (de carburo, eléctricas, de gas, de gasolina, de queroseno).	Fabricación de linternas (de carburo, eléctricas, de gas, de gasolina, de queroseno).	C2740.03.01	f
1356	Fabricación de equipo de iluminación para equipo de transporte (aeronaves, embarcaciones).	Fabricación de equipo de iluminación para equipo de transporte (aeronaves, embarcaciones).	C2740.04.01	f
1357	Fabricación de equipo de iluminación para equipo de transporte (vehículos automotores).	Fabricación de equipo de iluminación para equipo de transporte (vehículos automotores).	C2740.04.02	f
1358	Fabricación de equipo de iluminación no eléctrico.	Fabricación de equipo de iluminación no eléctrico.	C2740.05.01	f
1359	Servicios de apoyo a la fabricación de equipo eléctrico de iluminación a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de equipo eléctrico de iluminación a cambio de una retribución o por contrato.	C2740.06.01	f
1360	Fabricación de aparatos con lámparas de descarga ( electrónicos) y otros con lámparas de destello, excepto bombillas de magnesio.	Fabricación de aparatos con lámparas de descarga ( electrónicos) y otros con lámparas de destello, excepto bombillas de magnesio.	C2740.07.01	f
1361	Fabricación de aparatos eléctricos de uso doméstico: refrigeradores, congeladores.	Fabricación de aparatos eléctricos de uso doméstico: refrigeradores, congeladores.	C2750.01.01	f
1362	Fabricación de aparatos eléctricos de uso doméstico: lavaplatos, lavadoras y secadoras.	Fabricación de aparatos eléctricos de uso doméstico: lavaplatos, lavadoras y secadoras.	C2750.01.02	f
1363	Fabricación de aparatos eléctricos de uso doméstico: aspiradoras.	Fabricación de aparatos eléctricos de uso doméstico: aspiradoras.	C2750.01.03	f
1364	Fabricación de aparatos eléctricos de uso doméstico: enceradoras de pisos.	Fabricación de aparatos eléctricos de uso doméstico: enceradoras de pisos.	C2750.01.04	f
1365	Fabricación de aparatos eléctricos de uso doméstico: trituradoras de desperdicios.	Fabricación de aparatos eléctricos de uso doméstico: trituradoras de desperdicios.	C2750.01.05	f
1366	Fabricación de aparatos eléctricos de uso doméstico: molinillos de café, licuadoras, exprimidoras, abrelatas.	Fabricación de aparatos eléctricos de uso doméstico: molinillos de café, licuadoras, exprimidoras, abrelatas.	C2750.01.06	f
1367	Fabricación de aparatos eléctricos de uso doméstico: máquinas de afeitar eléctricas, cepillos dentales eléctricos y otros aparatos eléctricos de cuidado personal, afiladoras de cuchillos, campanas de ventilación o de absorción de humos.	Fabricación de aparatos eléctricos de uso doméstico: máquinas de afeitar eléctricas, cepillos dentales eléctricos y otros aparatos eléctricos de cuidado personal, afiladoras de cuchillos, campanas de ventilación o de absorción de humos.	C2750.01.07	f
1368	Fabricación de aparatos termoeléctricos de uso doméstico: calentadores de agua eléctricos, calentadores eléctricos de resistencia, etcétera.	Fabricación de aparatos termoeléctricos de uso doméstico: calentadores de agua eléctricos, calentadores eléctricos de resistencia, etcétera.	C2750.02.01	f
1369	Fabricación de aparatos termoeléctricos de uso doméstico: secadores, peines, cepillos y tenacillas eléctricos, etc.	Fabricación de aparatos termoeléctricos de uso doméstico: secadores, peines, cepillos y tenacillas eléctricos, etc.	C2750.02.02	f
1370	Fabricación de aparatos termoeléctricos de uso doméstico: planchas eléctricas, etcétera.	Fabricación de aparatos termoeléctricos de uso doméstico: planchas eléctricas, etcétera.	C2750.02.03	f
1371	Fabricación de aparatos termoeléctricos de uso doméstico: calentadores de ambiente y ventiladores portátiles, etcétera.	Fabricación de aparatos termoeléctricos de uso doméstico: calentadores de ambiente y ventiladores portátiles, etcétera.	C2750.02.04	f
1372	Fabricación de aparatos termoeléctricos de uso doméstico: hornos eléctricos, hornos de microondas, cocinillas y planchas de cocinar eléctricas, tostadoras, cafeteras y teteras, sartenes, asadores, parrillas, campanas, etcétera.	Fabricación de aparatos termoeléctricos de uso doméstico: hornos eléctricos, hornos de microondas, cocinillas y planchas de cocinar eléctricas, tostadoras, cafeteras y teteras, sartenes, asadores, parrillas, campanas, etcétera.	C2750.02.05	f
1373	Fabricación de aparatos termoeléctricos de uso doméstico: mantas eléctricas, etcétera.	Fabricación de aparatos termoeléctricos de uso doméstico: mantas eléctricas, etcétera.	C2750.02.06	f
1374	Fabricación de equipo de cocina y calefacción de uso doméstico no eléctrico: calentadores de ambiente, cocinillas, parrillas, cocinas, hornos.	Fabricación de equipo de cocina y calefacción de uso doméstico no eléctrico: calentadores de ambiente, cocinillas, parrillas, cocinas, hornos.	C2750.03.01	f
1375	Fabricación de equipo de cocina y calefacción de uso doméstico no eléctrico: calentadores de agua (calefones), aparatos de cocina y calentadores de platos no eléctricos.	Fabricación de equipo de cocina y calefacción de uso doméstico no eléctrico: calentadores de agua (calefones), aparatos de cocina y calentadores de platos no eléctricos.	C2750.03.02	f
1376	Servicios de apoyo a la fabricación de aparatos de uso doméstico a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de aparatos de uso doméstico a cambio de una retribución o por contrato.	C2750.04.01	f
1377	Fabricación de invertidores, rectificadores, células energéticas, unidades de suministro de potencia regulada y no regulada de estado sólido; fabricación de cargadores de pilas, baterías de estado sólido.	Fabricación de invertidores, rectificadores, células energéticas, unidades de suministro de potencia regulada y no regulada de estado sólido; fabricación de cargadores de pilas, baterías de estado sólido.	C2790.11.01	f
1378	Fabricación de equipo eléctrico de señalización como: semáforos y señales peatonales, señales eléctricas, marcadores electrónicos.	Fabricación de equipo eléctrico de señalización como: semáforos y señales peatonales, señales eléctricas, marcadores electrónicos.	C2790.12.01	f
1379	Fabricación de equipo eléctrico de señalización como:  dispositivos eléctricos de apertura y cierre de puertas, timbres eléctricos, sirenas, etc.	Fabricación de equipo eléctrico de señalización como:  dispositivos eléctricos de apertura y cierre de puertas, timbres eléctricos, sirenas, etc.	C2790.12.02	f
1380	Fabricación de equipo eléctrico de soldadura autógena y de soldadura blanda, incluidos soldadores manuales.	Fabricación de equipo eléctrico de soldadura autógena y de soldadura blanda, incluidos soldadores manuales.	C2790.13.01	f
1381	Fabricación de limpiaparabrisas.	Fabricación de limpiaparabrisas.	C2790.14.01	f
1382	Fabricación de eliminadores de escarcha.	Fabricación de eliminadores de escarcha.	C2790.14.02	f
1383	Fabricación de desempañadores eléctricos.	Fabricación de desempañadores eléctricos.	C2790.14.03	f
1384	Fabricación de aisladores eléctricos (excepto de vidrio o de cerámica).	Fabricación de aisladores eléctricos (excepto de vidrio o de cerámica).	C2790.15.01	f
1385	Fabricación de piezas aislantes para aparatos o equipos eléctricos (excepto de cerámica o plástico), electrodos de carbón o de grafito.	Fabricación de piezas aislantes para aparatos o equipos eléctricos (excepto de cerámica o plástico), electrodos de carbón o de grafito.	C2790.15.02	f
1386	Fabricación de tubos y juntas de metal común forrados de material aislante para la conducción de electricidad.	Fabricación de tubos y juntas de metal común forrados de material aislante para la conducción de electricidad.	C2790.15.03	f
1387	Fabricación de partes electrónicas de motores.	Fabricación de partes electrónicas de motores.	C2790.16.01	f
1446	Fabricación de máquinas registradoras incluso accionadas mecánicamente.	Fabricación de máquinas registradoras incluso accionadas mecánicamente.	C2817.01.03	f
1388	Fabricación de otros tipos de equipo eléctrico: limpiadores ultrasónicos (excepto los de uso odontológico y de laboratorio), camas bronceadoras, limitadores de sobretensión (excepto para voltajes de distribución), aceleradores de partículas, unidades de suministro ininterrumpido de energía, aparatos eléctricos con funciones especiales, etcétera.	Fabricación de otros tipos de equipo eléctrico: limpiadores ultrasónicos (excepto los de uso odontológico y de laboratorio), camas bronceadoras, limitadores de sobretensión (excepto para voltajes de distribución), aceleradores de partículas, unidades de suministro ininterrumpido de energía, aparatos eléctricos con funciones especiales, etcétera.	C2790.19.01	f
1389	Servicios de apoyo a la fabricación de otros tipos de equipo eléctrico a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de otros tipos de equipo eléctrico a cambio de una retribución o por contrato.	C2790.20.01	f
1390	Fabricación de condensadores y componentes eléctricos similares.	Fabricación de condensadores y componentes eléctricos similares.	C2790.91.01	f
1391	Fabricación de resistores y componentes eléctricos similares.	Fabricación de resistores y componentes eléctricos similares.	C2790.91.02	f
1392	Fabricación de capacitores y componentes eléctricos similares.	Fabricación de capacitores y componentes eléctricos similares.	C2790.91.03	f
1394	Fabricación de electrodos y contactos de carbono y grafito y otros productos eléctricos de carbón y grafito, aisladores eléctricos (excepto los de vidrio o porcelana).	Fabricación de electrodos y contactos de carbono y grafito y otros productos eléctricos de carbón y grafito, aisladores eléctricos (excepto los de vidrio o porcelana).	C2790.94.01	f
1395	Fabricación de motores de combustión interna de pistones, excepto motores de propulsión de vehículos automotores, aeronaves y motocicletas: motores marinos, motores para locomotoras.	Fabricación de motores de combustión interna de pistones, excepto motores de propulsión de vehículos automotores, aeronaves y motocicletas: motores marinos, motores para locomotoras.	C2811.01.01	f
1396	Fabricación de pistones, aros de pistón, válvulas de admisión, escapes, carburadores y piezas similares para todo tipo de motores de combustión interna, motores diesel, etcétera.	Fabricación de pistones, aros de pistón, válvulas de admisión, escapes, carburadores y piezas similares para todo tipo de motores de combustión interna, motores diesel, etcétera.	C2811.02.01	f
1397	Fabricación de turbinas y partes de turbinas: turbinas de gas, excepto turbopropulsores de reacción o de hélice para la propulsión de aeronaves,  turboalternadores, grupos turbogeneradores.	Fabricación de turbinas y partes de turbinas: turbinas de gas, excepto turbopropulsores de reacción o de hélice para la propulsión de aeronaves,  turboalternadores, grupos turbogeneradores.	C2811.03.01	f
1398	Fabricación de turbinas y partes de turbinas: turbinas de vapor de agua y otros tipos de vapor, turbocalderas (conjuntos de caldera y turbina).	Fabricación de turbinas y partes de turbinas: turbinas de vapor de agua y otros tipos de vapor, turbocalderas (conjuntos de caldera y turbina).	C2811.03.02	f
1399	Fabricación de turbinas y partes de turbinas: turbinas hidráulicas, ruedas hidráulicas y maquinaria para su regulación, turbinas eólicas.	Fabricación de turbinas y partes de turbinas: turbinas hidráulicas, ruedas hidráulicas y maquinaria para su regulación, turbinas eólicas.	C2811.03.03	f
1400	Servicios de apoyo a la fabricación de motores y turbinas, excepto motores para aeronaves, vehículos automotores y motocicletas a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de motores y turbinas, excepto motores para aeronaves, vehículos automotores y motocicletas a cambio de una retribución o por contrato.	C2811.04.01	f
1401	Fabricación de otros motores y turbinas.	Fabricación de otros motores y turbinas.	C2811.05.01	f
1402	Fabricación de componentes hidráulicos y neumáticos: motores hidráulicos; equipo de preparación del aire para sistemas neumáticos, cilindros, válvulas, tubos y empalmes hidráulicos y neumáticos.	Fabricación de componentes hidráulicos y neumáticos: motores hidráulicos; equipo de preparación del aire para sistemas neumáticos, cilindros, válvulas, tubos y empalmes hidráulicos y neumáticos.	C2812.01.01	f
1403	Fabricación de componentes hidráulicos y neumáticos: bombas y sistemas de propulsión de fluidos, equipo de transmisión hidráulico, transmisiones hidrostáticas.	Fabricación de componentes hidráulicos y neumáticos: bombas y sistemas de propulsión de fluidos, equipo de transmisión hidráulico, transmisiones hidrostáticas.	C2812.01.02	f
1404	Servicios de apoyo a la fabricación de equipo de propulsión de fluidos a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de equipo de propulsión de fluidos a cambio de una retribución o por contrato.	C2812.02.01	f
1405	Fabricación de bombas de aire o de vacío.	Fabricación de bombas de aire o de vacío.	C2813.01.01	f
1406	Fabricación de compresores de aire.	Fabricación de compresores de aire.	C2813.01.02	f
1407	Fabricación de otros compresores de gas.	Fabricación de otros compresores de gas.	C2813.01.03	f
1408	Fabricación de bombas para líquidos, tengan o no dispositivos de medición; bombas para motores de combustión interna, bombas manuales.	Fabricación de bombas para líquidos, tengan o no dispositivos de medición; bombas para motores de combustión interna, bombas manuales.	C2813.02.01	f
1409	Fabricación de bombas de aceite, agua.	Fabricación de bombas de aceite, agua.	C2813.02.02	f
1410	Fabricación de bombas de combustible para vehículos automotores, etcétera.	Fabricación de bombas de combustible para vehículos automotores, etcétera.	C2813.02.03	f
1411	Fabricación de grifos y válvulas industriales, sanitarios, calefacción, incluidos válvulas de regulación y grifos de admisión.	Fabricación de grifos y válvulas industriales, sanitarios, calefacción, incluidos válvulas de regulación y grifos de admisión.	C2813.03.01	f
1412	Servicios de apoyo a la fabricación de otras bombas, compresores, grifos y válvulas a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de otras bombas, compresores, grifos y válvulas a cambio de una retribución o por contrato.	C2813.04.01	f
1413	Fabricación de cojinetes de bola y de rodillo y de partes de cojinetes.	Fabricación de cojinetes de bola y de rodillo y de partes de cojinetes.	C2814.01.01	f
1414	Fabricación de equipo mecánico de transmisión: ejes y manivelas de transmisión.	Fabricación de equipo mecánico de transmisión: ejes y manivelas de transmisión.	C2814.02.01	f
1415	Fabricación de equipo mecánico de transmisión: ejes de levas, cigüeñales, manivelas, etcétera.	Fabricación de equipo mecánico de transmisión: ejes de levas, cigüeñales, manivelas, etcétera.	C2814.02.02	f
1416	Fabricación de equipo mecánico de transmisión: cajas de cojinetes y cojinetes simples para ejes.	Fabricación de equipo mecánico de transmisión: cajas de cojinetes y cojinetes simples para ejes.	C2814.02.03	f
1417	Fabricación de eslabones articulados y cadenas de transmisión.	Fabricación de eslabones articulados y cadenas de transmisión.	C2814.03.01	f
1418	Fabricación de engranajes, trenes de engranajes, cajas de engranajes y otros dispositivos para cambios de marchas.	Fabricación de engranajes, trenes de engranajes, cajas de engranajes y otros dispositivos para cambios de marchas.	C2814.03.02	f
1419	Fabricación de embragues y acoplamientos de ejes; volantes y poleas.	Fabricación de embragues y acoplamientos de ejes; volantes y poleas.	C2814.03.03	f
1420	Servicios de apoyo a la fabricación de cojinetes, engranajes, trenes de engranajes y piezas de transmisión a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de cojinetes, engranajes, trenes de engranajes y piezas de transmisión a cambio de una retribución o por contrato.	C2814.04.01	f
1421	Fabricación de hornos eléctricos para uso industrial.	Fabricación de hornos eléctricos para uso industrial.	C2815.01.01	f
1422	Fabricación de hornos eléctricos de laboratorio, incluidos incineradores.	Fabricación de hornos eléctricos de laboratorio, incluidos incineradores.	C2815.01.02	f
1423	Fabricación de hornos eléctricos y de otro tipo, incluidos incineradores.	Fabricación de hornos eléctricos y de otro tipo, incluidos incineradores.	C2815.01.03	f
1424	Fabricación de equipo fijo de calefacción de uso doméstico como calefacción: solar, por vapor, de fuel y equipo similar, calentadores de ambiente eléctricos fijos y calentadores eléctricos para piscinas.	Fabricación de equipo fijo de calefacción de uso doméstico como calefacción: solar, por vapor, de fuel y equipo similar, calentadores de ambiente eléctricos fijos y calentadores eléctricos para piscinas.	C2815.02.01	f
1425	Fabricación de cargadores mecánicos, parrillas mecánicas, descargadores mecánicos de cenizas, etcétera.	Fabricación de cargadores mecánicos, parrillas mecánicas, descargadores mecánicos de cenizas, etcétera.	C2815.03.01	f
1426	Fabricación de quemadores, etcétera.	Fabricación de quemadores, etcétera.	C2815.03.02	f
1427	Servicios de apoyo a la fabricación de hornos y quemadores a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de hornos y quemadores a cambio de una retribución o por contrato.	C2815.04.01	f
1428	Fabricación de manipuladores mecánicos y robots industriales diseñados especialmente para operaciones de carga o descarga, maquinaria sencilla y compleja.	Fabricación de manipuladores mecánicos y robots industriales diseñados especialmente para operaciones de carga o descarga, maquinaria sencilla y compleja.	C2816.01.01	f
1429	Fabricación de manipuladores mecánicos y robots industriales diseñados especialmente para operaciones de carga o descarga, de acción continua o intermitente.	Fabricación de manipuladores mecánicos y robots industriales diseñados especialmente para operaciones de carga o descarga, de acción continua o intermitente.	C2816.01.02	f
1430	Fabricación de manipuladores mecánicos y robots industriales diseñados especialmente para operaciones de carga o descarga, estacionarias y móviles.	Fabricación de manipuladores mecánicos y robots industriales diseñados especialmente para operaciones de carga o descarga, estacionarias y móviles.	C2816.01.03	f
1431	Fabricación de manipuladores mecánicos y robots industriales diseñados especialmente para operaciones de carga o descarga, montadas permanentemente en bastidores con ruedas.	Fabricación de manipuladores mecánicos y robots industriales diseñados especialmente para operaciones de carga o descarga, montadas permanentemente en bastidores con ruedas.	C2816.01.04	f
1432	Fabricación de maquinaria de elevación, manipulación, carga o descarga, manual o eléctrica: polipastos y elevadores, cabrias, cabrestantes y gatos.	Fabricación de maquinaria de elevación, manipulación, carga o descarga, manual o eléctrica: polipastos y elevadores, cabrias, cabrestantes y gatos.	C2816.01.05	f
1433	Fabricación de maquinaria de elevación, manipulación, carga o descarga, manual o eléctrica: grúas de brazo móvil, grúas corrientes.	Fabricación de maquinaria de elevación, manipulación, carga o descarga, manual o eléctrica: grúas de brazo móvil, grúas corrientes.	C2816.01.06	f
1434	Fabricación de maquinaria de elevación, manipulación, carga o descarga, manual o eléctrica: bastidores elevadores móviles, etcétera.	Fabricación de maquinaria de elevación, manipulación, carga o descarga, manual o eléctrica: bastidores elevadores móviles, etcétera.	C2816.01.07	f
1435	Fabricación de maquinaria de elevación, manipulación, carga o descarga, manual o eléctrica: camiones de pórtico alto, etcétera.	Fabricación de maquinaria de elevación, manipulación, carga o descarga, manual o eléctrica: camiones de pórtico alto, etcétera.	C2816.01.08	f
1436	Fabricación de maquinaria de elevación, manipulación, carga o descarga, manual o eléctrica: carretillas de faena, estén provistas o no de equipo de elevación o manipulación, y sean autopropulsadas o no, como las que se utilizan en fábricas (incluidos carretillas y carros de mano).	Fabricación de maquinaria de elevación, manipulación, carga o descarga, manual o eléctrica: carretillas de faena, estén provistas o no de equipo de elevación o manipulación, y sean autopropulsadas o no, como las que se utilizan en fábricas (incluidos carretillas y carros de mano).	C2816.01.09	f
1437	Fabricación de elevadores de líquidos.	Fabricación de elevadores de líquidos.	C2816.01.10	f
1440	Fabricación de escaleras mecánicas y pasillos rodantes, cintas transportadoras, etcétera.	Fabricación de escaleras mecánicas y pasillos rodantes, cintas transportadoras, etcétera.	C2816.02.02	f
1441	Fabricación de teleféricos, etcétera.	Fabricación de teleféricos, etcétera.	C2816.02.03	f
1442	Fabricación de partes y piezas especiales para equipo de elevación y manipulación.	Fabricación de partes y piezas especiales para equipo de elevación y manipulación.	C2816.03.01	f
1443	Servicios de apoyo a la fabricación de equipo de elevación y manipulación a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de equipo de elevación y manipulación a cambio de una retribución o por contrato.	C2816.04.01	f
1444	Fabricación de máquinas calculadoras electrónicas o no.	Fabricación de máquinas calculadoras electrónicas o no.	C2817.01.01	f
1445	Fabricación de máquinas de contabilidad, máquinas de sumar.	Fabricación de máquinas de contabilidad, máquinas de sumar.	C2817.01.02	f
1447	Fabricación de máquinas de estenotipia, máquinas para rellenar cheques, hectógrafos, etc.	Fabricación de máquinas de estenotipia, máquinas para rellenar cheques, hectógrafos, etc.	C2817.02.01	f
1448	Fabricación de máquinas de escribir.	Fabricación de máquinas de escribir.	C2817.02.02	f
1449	Fabricación de máquinas para el franqueo y la manipulación de correspondencia.	Fabricación de máquinas para el franqueo y la manipulación de correspondencia.	C2817.03.01	f
1450	Fabricación de máquinas distribuidoras de billetes, máquinas de votación, dictáfonos.	Fabricación de máquinas distribuidoras de billetes, máquinas de votación, dictáfonos.	C2817.03.02	f
1452	Fabricación de máquinas de encolar, máquinas para contar y envolver monedas.	Fabricación de máquinas de encolar, máquinas para contar y envolver monedas.	C2817.03.04	f
1453	Fabricación de máquinas para el franqueo y la manipulación de correspondencia (máquinas para llenar y cerrar sobres, máquinas para abrir, clasificar y escanear correspondencia).	Fabricación de máquinas para el franqueo y la manipulación de correspondencia (máquinas para llenar y cerrar sobres, máquinas para abrir, clasificar y escanear correspondencia).	C2817.03.05	f
1454	Fabricación de fotocopiadoras.	Fabricación de fotocopiadoras.	C2817.04.01	f
1455	Fabricación de equipo de encuadernación del tipo utilizado en oficinas (es decir, para encuadernar con plástico o con cinta adhesiva), punzones.	Fabricación de equipo de encuadernación del tipo utilizado en oficinas (es decir, para encuadernar con plástico o con cinta adhesiva), punzones.	C2817.05.01	f
1456	Servicios de apoyo a la fabricación de maquinaria y equipo de oficina (excepto ordenadores y equipo periférico) a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de maquinaria y equipo de oficina (excepto ordenadores y equipo periférico) a cambio de una retribución o por contrato.	C2817.06.01	f
1457	Fabricación de impresoras offset de carga manual para oficinas.	Fabricación de impresoras offset de carga manual para oficinas.	C2817.07.01	f
1458	Fabricación de afiladores de lápices, grapadoras, quitagrapas, portarrollos para cinta adhesiva, cartuchos de tinta (toner), pizarras, encerados y tableros para escribir con rotulador, etcétera.	Fabricación de afiladores de lápices, grapadoras, quitagrapas, portarrollos para cinta adhesiva, cartuchos de tinta (toner), pizarras, encerados y tableros para escribir con rotulador, etcétera.	C2817.09.01	f
1459	Fabricación de herramientas de mano con motor autónomo eléctrico o no eléctrico, como: cizallas y recortadoras de chapa, etcétera.	Fabricación de herramientas de mano con motor autónomo eléctrico o no eléctrico, como: cizallas y recortadoras de chapa, etcétera.	C2818.01.01	f
1460	Fabricación de herramientas de mano con motor autónomo eléctrico o no eléctrico, como: sierras circulares o con movimiento alternativo, taladros, pulidoras, tupíes, lijadoras, afiladoras, clavadoras motorizadas, cepilladoras, etcétera.	Fabricación de herramientas de mano con motor autónomo eléctrico o no eléctrico, como: sierras circulares o con movimiento alternativo, taladros, pulidoras, tupíes, lijadoras, afiladoras, clavadoras motorizadas, cepilladoras, etcétera.	C2818.01.02	f
1461	Fabricación de herramientas de mano de aire comprimido, como: perforadoras de percusión, clavadoras neumáticas, engrapadoras, remachadoras neumáticas, aprieta tuercas neumáticos de percusión, etcétera.	Fabricación de herramientas de mano de aire comprimido, como: perforadoras de percusión, clavadoras neumáticas, engrapadoras, remachadoras neumáticas, aprieta tuercas neumáticos de percusión, etcétera.	C2818.02.01	f
1462	Servicios de apoyo a la fabricación de herramientas de mano motorizadas a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de herramientas de mano motorizadas a cambio de una retribución o por contrato.	C2818.03.01	f
1463	Fabricación de prensas para la elaboración de tableros de partículas o fibras de madera u otros materiales leñosos.	Fabricación de prensas para la elaboración de tableros de partículas o fibras de madera u otros materiales leñosos.	C2818.04.01	f
1464	Fabricación de otra maquinaria para tratar la madera o el corcho.	Fabricación de otra maquinaria para tratar la madera o el corcho.	C2818.04.02	f
1465	Fabricación de máquinas herramienta para estampar o prensar.	Fabricación de máquinas herramienta para estampar o prensar.	C2818.05.01	f
1466	Fabricación de otras máquinas herramienta para trabajar madera.	Fabricación de otras máquinas herramienta para trabajar madera.	C2818.06.01	f
1467	Fabricación de máquinas herramienta de diseño sencillo (prensas de pedal).	Fabricación de máquinas herramienta de diseño sencillo (prensas de pedal).	C2818.07.01	f
1468	Fabricación de máquinas herramienta de diseño de diseño tradicional (accionadas a mano o por motor).	Fabricación de máquinas herramienta de diseño de diseño tradicional (accionadas a mano o por motor).	C2818.07.02	f
1469	Fabricación de diseño moderno (de mando numérico y para hacer pasar el producto por  varias estaciones de trabajo).	Fabricación de diseño moderno (de mando numérico y para hacer pasar el producto por  varias estaciones de trabajo).	C2818.07.03	f
1470	Fabricación de equipo industrial de refrigeración o de congelación para uso comercial.	Fabricación de equipo industrial de refrigeración o de congelación para uso comercial.	C2819.11.01	f
1471	Fabricación de equipo industrial de refrigeración o de congelación para diversos usos.	Fabricación de equipo industrial de refrigeración o de congelación para diversos usos.	C2819.11.02	f
1472	Fabricación y ensambladura de conjuntos montados de componentes principales de equipos de refrigeración y congelación.	Fabricación y ensambladura de conjuntos montados de componentes principales de equipos de refrigeración y congelación.	C2819.11.03	f
1473	Fabricación de básculas y balanzas.	Fabricación de básculas y balanzas.	C2819.12.01	f
1474	Fabricación de balanzas de plataforma, etcétera.	Fabricación de balanzas de plataforma, etcétera.	C2819.12.02	f
1475	Fabricación de balanzas de pesada continua, etcétera.	Fabricación de balanzas de pesada continua, etcétera.	C2819.12.03	f
1476	Fabricación de balanzas para vehículos,  etcétera.	Fabricación de balanzas para vehículos,  etcétera.	C2819.12.04	f
1477	Fabricación de básculas y balanzas (excepto balanzas de precisión para laboratorios): balanzas de uso doméstico, pesas, etcétera.	Fabricación de básculas y balanzas (excepto balanzas de precisión para laboratorios): balanzas de uso doméstico, pesas, etcétera.	C2819.12.05	f
1564	Fabricación de maquinaria para la molienda de granos: partidoras de guisantes, legumbres, etc.	Fabricación de maquinaria para la molienda de granos: partidoras de guisantes, legumbres, etc.	C2825.03.02	f
1478	Fabricación de maquinaria para empaquetar y envolver: máquinas para llenar, cerrar, sellar, encapsular, etiquetar, etcétera.	Fabricación de maquinaria para empaquetar y envolver: máquinas para llenar, cerrar, sellar, encapsular, etiquetar, etcétera.	C2819.13.01	f
1479	Fabricación de maquinaria para limpiar o secar botellas.	Fabricación de maquinaria para limpiar o secar botellas.	C2819.13.02	f
1480	Fabricación de maquinaria para la aireación de bebidas.	Fabricación de maquinaria para la aireación de bebidas.	C2819.13.03	f
1481	Servicios de apoyo a la fabricación: instalación, mantenimiento y reparación de maquinaria para pesar.	Servicios de apoyo a la fabricación: instalación, mantenimiento y reparación de maquinaria para pesar.	C2819.14.01	f
1482	Servicios de apoyo a la fabricación: instalación, mantenimiento y reparación de maquinaria para embalaje y acondicionamiento.	Servicios de apoyo a la fabricación: instalación, mantenimiento y reparación de maquinaria para embalaje y acondicionamiento.	C2819.14.02	f
1483	Servicios de apoyo a la fabricación: instalación, mantenimiento, reparación y acondicionamiento y equipo de refrigeración y congelación.	Servicios de apoyo a la fabricación: instalación, mantenimiento, reparación y acondicionamiento y equipo de refrigeración y congelación.	C2819.14.03	f
1484	Fabricación de aparatos de acondicionamiento de aire, extractores.	Fabricación de aparatos de acondicionamiento de aire, extractores.	C2819.21.01	f
1485	Fabricación de ventiladores distintos de los de uso doméstico, dispositivos de ventilación de desvanes (ventiladores de tejado, etcétera), ventiladores industriales.	Fabricación de ventiladores distintos de los de uso doméstico, dispositivos de ventilación de desvanes (ventiladores de tejado, etcétera), ventiladores industriales.	C2819.21.02	f
1486	Fabricación de aparatos de acondicionamiento de aire de uso comercial, industrial o de laboratorios, campanas de ventilación.	Fabricación de aparatos de acondicionamiento de aire de uso comercial, industrial o de laboratorios, campanas de ventilación.	C2819.21.03	f
1487	Fabricación de maquinaria y aparatos de filtrado o depuración de líquidos, incluso filtros de aceite.	Fabricación de maquinaria y aparatos de filtrado o depuración de líquidos, incluso filtros de aceite.	C2819.22.01	f
1488	Fabricación de maquinaria y aparatos de filtrado o depuración de aire, gas para motores de combustión interna.	Fabricación de maquinaria y aparatos de filtrado o depuración de aire, gas para motores de combustión interna.	C2819.22.02	f
1489	Fabricación de equipo para proyectar, dispersar o pulverizar líquidos o polvos: máquinas de limpieza por chorro, máquinas de limpieza al vapor, etcétera.	Fabricación de equipo para proyectar, dispersar o pulverizar líquidos o polvos: máquinas de limpieza por chorro, máquinas de limpieza al vapor, etcétera.	C2819.23.01	f
1490	Fabricación de equipo para proyectar, dispersar o pulverizar líquidos o polvos: máquinas de limpieza por chorro, máquinas de limpieza al vapor, etcétera.	Fabricación de equipo para proyectar, dispersar o pulverizar líquidos o polvos: máquinas de limpieza por chorro, máquinas de limpieza al vapor, etcétera.	C2819.23.01	f
1491	Fabricación de equipo para proyectar, dispersar o pulverizar líquidos o polvos: pistolas de pulverización, etcétera.	Fabricación de equipo para proyectar, dispersar o pulverizar líquidos o polvos: pistolas de pulverización, etcétera.	C2819.23.02	f
1492	Fabricación de extintores de incendios.	Fabricación de extintores de incendios.	C2819.23.03	f
1493	Fabricación de equipo para proyectar, dispersar o pulverizar líquidos o polvos: máquinas de limpieza por chorro de arena, etcétera.	Fabricación de equipo para proyectar, dispersar o pulverizar líquidos o polvos: máquinas de limpieza por chorro de arena, etcétera.	C2819.23.04	f
1494	Fabricación de plantas destiladoras y rectificadoras para las refinerías de petróleo, la industria química, la industria de elaboración de bebidas, etcétera.	Fabricación de plantas destiladoras y rectificadoras para las refinerías de petróleo, la industria química, la industria de elaboración de bebidas, etcétera.	C2819.24.01	f
1495	Fabricación de maquinaria para licuar aire o gas, generadores de gas.	Fabricación de maquinaria para licuar aire o gas, generadores de gas.	C2819.24.02	f
1496	Fabricación de intercambiadores de calor.	Fabricación de intercambiadores de calor.	C2819.25.01	f
1497	Fabricación de gasógenos de gas pobre o gas de agua o gasógenos de acetileno.	Fabricación de gasógenos de gas pobre o gas de agua o gasógenos de acetileno.	C2819.26.01	f
1498	Servicios de apoyo a la fabricación de otros tipos de maquinaria de uso general a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de otros tipos de maquinaria de uso general a cambio de una retribución o por contrato.	C2819.30.01	f
1499	Servicios de apoyo a la fabricación de ventiladores.	Servicios de apoyo a la fabricación de ventiladores.	C2819.31.01	f
1500	Servicios de apoyo a la fabricación de acondicionadores de aire	Servicios de apoyo a la fabricación de acondicionadores de aire	C2819.31.02	f
1501	Servicios de apoyo a la fabricación de aparatos para la filtración, depuración y distribución de líquidos.	Servicios de apoyo a la fabricación de aparatos para la filtración, depuración y distribución de líquidos.	C2819.32.01	f
1502	Servicios de apoyo a la fabricación de aparatos para la filtración, depuración y distribución de gases.	Servicios de apoyo a la fabricación de aparatos para la filtración, depuración y distribución de gases.	C2819.32.02	f
1503	Servicios de apoyo a la fabricación de aparatos para la filtración, depuración y distribución de polvos.	Servicios de apoyo a la fabricación de aparatos para la filtración, depuración y distribución de polvos.	C2819.32.03	f
1504	Fabricación de calandrias y otras máquinas de laminado, y de rodillos para esas máquinas (excepto las laminadoras de metal y vidrio).	Fabricación de calandrias y otras máquinas de laminado, y de rodillos para esas máquinas (excepto las laminadoras de metal y vidrio).	C2819.91.01	f
1505	Fabricación de centrifugadoras (excepto descremadoras y secadoras de ropa).	Fabricación de centrifugadoras (excepto descremadoras y secadoras de ropa).	C2819.92.01	f
1506	Fabricación de juntas y piezas de empalme similares hechas de una combinación de materiales y de capas de un mismo material.	Fabricación de juntas y piezas de empalme similares hechas de una combinación de materiales y de capas de un mismo material.	C2819.93.01	f
1507	Fabricación de máquinas automáticas de venta de productos.	Fabricación de máquinas automáticas de venta de productos.	C2819.94.01	f
1619	Fabricación de tiovivos, columpios, galerías de tiro y atracciones de feria.	Fabricación de tiovivos, columpios, galerías de tiro y atracciones de feria.	C2829.96.01	f
1508	Fabricación de niveles, cintas métricas y herramientas de mano similares, herramientas de precisión para mecánicos (excepto instrumentos ópticos).	Fabricación de niveles, cintas métricas y herramientas de mano similares, herramientas de precisión para mecánicos (excepto instrumentos ópticos).	C2819.95.01	f
1509	Fabricación de equipo no eléctrico de soldadura autógena y de soldadura blanda.	Fabricación de equipo no eléctrico de soldadura autógena y de soldadura blanda.	C2819.96.01	f
1510	Fabricación de partes y piezas de maquinaria de uso general.	Fabricación de partes y piezas de maquinaria de uso general.	C2819.97.01	f
1623	Fabricación de máquinas de elaboración de matrices y planchas impresas de estereotipia.	Fabricación de máquinas de elaboración de matrices y planchas impresas de estereotipia.	C2829.97.04	f
1511	Fabricación de cajas de moldear para talleres de fundición de metal, fondos de molde, patrones para moldear, moldes para metal (excepto lingoteras), carburos metálicos, vidrio, materias minerales, caucho o plástico.	Fabricación de cajas de moldear para talleres de fundición de metal, fondos de molde, patrones para moldear, moldes para metal (excepto lingoteras), carburos metálicos, vidrio, materias minerales, caucho o plástico.	C2819.98.01	f
1512	Fabricación de máquinas para la producción o el trabajo en caliente de vidrio o productos de cristalería, fibras o hilados de vidrio por ejemplo: laminadoras de vidrio.	Fabricación de máquinas para la producción o el trabajo en caliente de vidrio o productos de cristalería, fibras o hilados de vidrio por ejemplo: laminadoras de vidrio.	C2819.99.01	f
1513	Fabricación de tractores utilizados en actividades agropecuarias y silvícola: tractores de manejo a pie (dirigidos por una persona desde fuera), motocultores, segadoras, incluidas segadoras de césped, remolques y semirremolques de carga y descarga automática para uso agrícola.	Fabricación de tractores utilizados en actividades agropecuarias y silvícola: tractores de manejo a pie (dirigidos por una persona desde fuera), motocultores, segadoras, incluidas segadoras de césped, remolques y semirremolques de carga y descarga automática para uso agrícola.	C2821.01.01	f
1514	Fabricación de máquinas utilizadas en la agricultura para preparar los suelos, plantar o abonar: arados, esparcidoras de estiércol, sembradoras, rastrilladoras, etcétera).	Fabricación de máquinas utilizadas en la agricultura para preparar los suelos, plantar o abonar: arados, esparcidoras de estiércol, sembradoras, rastrilladoras, etcétera).	C2821.02.01	f
1515	Fabricación de máquinas para la recolección y trilla: cosechadoras, trilladoras, cribadoras, etcétera.	Fabricación de máquinas para la recolección y trilla: cosechadoras, trilladoras, cribadoras, etcétera.	C2821.03.01	f
1516	Fabricación de máquinas de ordeñar, maquinas usadas en la avícultura, api	Fabricación de máquinas de ordeñar, maquinas usadas en la avícultura, api	C2821.04.01	f
1517	Fabricación de aspersores de uso agrícola.	Fabricación de aspersores de uso agrícola.	C2821.05.01	f
1518	Fabricación de otra maquinaria de uso agropecuario: equipo para la preparación de pienso, etcétera.	Fabricación de otra maquinaria de uso agropecuario: equipo para la preparación de pienso, etcétera.	C2821.06.01	f
1519	Fabricación de otra maquinaria de uso agropecuario: máquinas para limpiar, seleccionar y clasificar huevos, fruta, etcétera.	Fabricación de otra maquinaria de uso agropecuario: máquinas para limpiar, seleccionar y clasificar huevos, fruta, etcétera.	C2821.06.02	f
1520	Fabricación de otra maquinaria de uso agropecuario: máquinas utilizadas en la avicultura, apicultura, horticultura y silvicultura.	Fabricación de otra maquinaria de uso agropecuario: máquinas utilizadas en la avicultura, apicultura, horticultura y silvicultura.	C2821.06.03	f
1521	Servicios de apoyo a la fabricación de maquinaria agropecuaria y forestal a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de maquinaria agropecuaria y forestal a cambio de una retribución o por contrato.	C2821.07.01	f
1522	Fabricación de lectores magnéticos u ópticos.	Fabricación de lectores magnéticos u ópticos.	C2821.10.01	f
1523	Fabricación de máquinas para transcripción de datos codificados en materiales de grabación.	Fabricación de máquinas para transcripción de datos codificados en materiales de grabación.	C2821.10.02	f
1524	Fabricación de máquinas para procesar y descifrar datos y presentar los resultados.	Fabricación de máquinas para procesar y descifrar datos y presentar los resultados.	C2821.10.03	f
1525	Fabricación de máquinas de procesamiento analógico de datos provistas de elementos analógicos, control y programación, elementos adicionales para computadoras analógicas con función de entrada y salida.	Fabricación de máquinas de procesamiento analógico de datos provistas de elementos analógicos, control y programación, elementos adicionales para computadoras analógicas con función de entrada y salida.	C2821.11.01	f
1526	Fabricación de máquinas de procesamiento automático de datos de tipo digital, analógico o híbrido.	Fabricación de máquinas de procesamiento automático de datos de tipo digital, analógico o híbrido.	C2821.12.01	f
1527	Fabricación de máquinas híbridas (analogicodigitales).	Fabricación de máquinas híbridas (analogicodigitales).	C2821.13.01	f
1528	Fabricación de sistemas digitales compuestos de unidad central de procesamiento.	Fabricación de sistemas digitales compuestos de unidad central de procesamiento.	C2821.14.01	f
1529	Fabricación de sistemas digitales provistos de dispositivos periféricos.	Fabricación de sistemas digitales provistos de dispositivos periféricos.	C2821.14.02	f
1530	Fabricación de unidades de procesamiento central de datos o unidades periferias.	Fabricación de unidades de procesamiento central de datos o unidades periferias.	C2821.14.03	f
1531	Fabricación de unidades periféricas para maquinas analógicas (lectoras de cintas, perforadoras, graficadores, etc.).	Fabricación de unidades periféricas para maquinas analógicas (lectoras de cintas, perforadoras, graficadores, etc.).	C2821.15.01	f
1532	Fabricación de máquinas herramienta para trabajar metales que utilizan rayos láser, ondas ultrasónicas, arcos de plasma, impulsos magnéticos, etc.	Fabricación de máquinas herramienta para trabajar metales que utilizan rayos láser, ondas ultrasónicas, arcos de plasma, impulsos magnéticos, etc.	C2822.01.01	f
1533	Fabricación de máquinas herramienta para trabajar metales.	Fabricación de máquinas herramienta para trabajar metales.	C2822.01.02	f
1534	Fabricación de máquinas herramienta para trabajar otros materiales (madera, hueso, piedra, caucho endurecido, plásticos duros, vidrio en frío, etcétera)	Fabricación de máquinas herramienta para trabajar otros materiales (madera, hueso, piedra, caucho endurecido, plásticos duros, vidrio en frío, etcétera)	C2822.01.03	f
1535	Fabricación de máquinas herramienta para trabajar otros materiales que utilizan rayos láser, ondas ultrasónicas, arcos de plasma, impulsos magnéticos, etcétera.	Fabricación de máquinas herramienta para trabajar otros materiales que utilizan rayos láser, ondas ultrasónicas, arcos de plasma, impulsos magnéticos, etcétera.	C2822.01.04	f
1536	Fabricación de máquinas herramienta para tornear, perforar, fresar, conformar, cepillar, rectificar, taladrar (taladradoras rotatorias y de percusión), limadoras, remachadoras, cortadoras de láminas de metal, etcétera.	Fabricación de máquinas herramienta para tornear, perforar, fresar, conformar, cepillar, rectificar, taladrar (taladradoras rotatorias y de percusión), limadoras, remachadoras, cortadoras de láminas de metal, etcétera.	C2822.02.01	f
1812	Fabricación de bastones, bastones-asiento.	Fabricación de bastones, bastones-asiento.	C3290.23.02	f
1813	Fabricación de látigos y fustas.	Fabricación de látigos y fustas.	C3290.23.03	f
1537	Fabricación de máquinas herramienta para estampar y prensar, punzonadoras, prensas hidráulicas, machacadoras hidráulicas, martinetes, máquinas de forjar, etcétera, fabricación de bancos de trefilar, máquinas de aterrajar por laminado a presión y máquinas para trabajar alambre.	Fabricación de máquinas herramienta para estampar y prensar, punzonadoras, prensas hidráulicas, machacadoras hidráulicas, martinetes, máquinas de forjar, etcétera, fabricación de bancos de trefilar, máquinas de aterrajar por laminado a presión y máquinas para trabajar alambre.	C2822.03.01	f
1538	Fabricación de prensas para la fabricación de tableros de partículas y productos similares; maquinaria para galvanoplastia.	Fabricación de prensas para la fabricación de tableros de partículas y productos similares; maquinaria para galvanoplastia.	C2822.04.01	f
1539	Fabricación de partes, piezas y accesorios para las máquinas herramienta anteriormente enumeradas: mandriles de sujeción, cabezales divisorios y otros accesorios especiales para máquinas herramienta.	Fabricación de partes, piezas y accesorios para las máquinas herramienta anteriormente enumeradas: mandriles de sujeción, cabezales divisorios y otros accesorios especiales para máquinas herramienta.	C2822.05.01	f
1540	Servicios de apoyo a la fabricación de maquinaria para la conformación de metales y de máquinas herramienta a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de maquinaria para la conformación de metales y de máquinas herramienta a cambio de una retribución o por contrato.	C2822.06.01	f
1541	Fabricación de máquinas y equipo para la manipulación de metales en caliente: convertidores, lingoteras, calderos de colada.	Fabricación de máquinas y equipo para la manipulación de metales en caliente: convertidores, lingoteras, calderos de colada.	C2823.01.01	f
1542	Fabricación de máquinas y equipo para la manipulación de metales en caliente: máquinas de fundir.	Fabricación de máquinas y equipo para la manipulación de metales en caliente: máquinas de fundir.	C2823.01.02	f
1543	Fabricación de máquinas laminadoras de metal y de rodillos para esas máquinas.	Fabricación de máquinas laminadoras de metal y de rodillos para esas máquinas.	C2823.02.01	f
1544	Servicios de apoyo a la fabricación de maquinaria metalúrgica a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de maquinaria metalúrgica a cambio de una retribución o por contrato.	C2823.03.01	f
1545	Fabricación de elevadores y cintas transportadoras de marcha continúa para uso en obras subterráneas.	Fabricación de elevadores y cintas transportadoras de marcha continúa para uso en obras subterráneas.	C2824.01.01	f
1546	Fabricación de maquinaria para perforar, cortar, hincar y tunelar (destinada o no a obras subterráneas).	Fabricación de maquinaria para perforar, cortar, hincar y tunelar (destinada o no a obras subterráneas).	C2824.02.01	f
1547	Fabricación de maquinaria para el tratamiento de minerales mediante cribado, clasificación, separación, lavado, trituración, etcétera.	Fabricación de maquinaria para el tratamiento de minerales mediante cribado, clasificación, separación, lavado, trituración, etcétera.	C2824.03.01	f
1548	Fabricación de máquinas esparcidoras de hormigón	Fabricación de máquinas esparcidoras de hormigón	C2824.04.01	f
1549	Fabricación de máquinas esparcidoras de asfalto.	Fabricación de máquinas esparcidoras de asfalto.	C2824.04.02	f
1550	Fabricación de maquinaria para pavimentar con hormigón.	Fabricación de maquinaria para pavimentar con hormigón.	C2824.04.03	f
1551	Fabricación de máquinas para hincar y arrancar pilotes.	Fabricación de máquinas para hincar y arrancar pilotes.	C2824.04.04	f
1552	Fabricación de máquinas mezcladoras de hormigón y mortero, compactadoras, etcétera.	Fabricación de máquinas mezcladoras de hormigón y mortero, compactadoras, etcétera.	C2824.04.05	f
1553	Fabricación de maquinaria para el movimiento de tierras: topadoras corrientes, topadoras de pala angular.	Fabricación de maquinaria para el movimiento de tierras: topadoras corrientes, topadoras de pala angular.	C2824.05.01	f
1554	Fabricación de maquinaria para el movimiento de tierras: explanadoras, niveladoras, trabillas, palas mecánicas, cargadoras de cucharón, etc.	Fabricación de maquinaria para el movimiento de tierras: explanadoras, niveladoras, trabillas, palas mecánicas, cargadoras de cucharón, etc.	C2824.05.02	f
1555	Fabricación de palas para topadoras corrientes y de pala angular.	Fabricación de palas para topadoras corrientes y de pala angular.	C2824.05.03	f
1556	Fabricación de tractores de oruga, etcétera.	Fabricación de tractores de oruga, etcétera.	C2824.05.04	f
1557	Fabricación de maquinaria para el movimiento de tierras: tractores utilizados en obras de construcción y en la explotación de minas y canteras, camiones con volquete para todo terreno, etcétera.	Fabricación de maquinaria para el movimiento de tierras: tractores utilizados en obras de construcción y en la explotación de minas y canteras, camiones con volquete para todo terreno, etcétera.	C2824.05.05	f
1558	Servicios de apoyo a la fabricación de maquinaria para la explotación de minas y canteras a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de maquinaria para la explotación de minas y canteras a cambio de una retribución o por contrato.	C2824.06.01	f
1559	Servicios de apoyo a la fabricación de maquinaria para obras de construcción a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de maquinaria para obras de construcción a cambio de una retribución o por contrato.	C2824.06.02	f
1560	Fabricación de secadoras agrícolas.	Fabricación de secadoras agrícolas.	C2825.01.01	f
1561	Fabricación de maquinaria para la industria lechera: para hacer quesos (homogenizadoras, moldeadoras, prensas), etcétera.	Fabricación de maquinaria para la industria lechera: para hacer quesos (homogenizadoras, moldeadoras, prensas), etcétera.	C2825.02.01	f
1562	Fabricación de maquinaria para la industria lechera: descremadoras, maquinaria para la elaboración de la leche (homogeneizadoras), para la transformación de la leche (mantequeras, malaxadoras y moldeadoras).	Fabricación de maquinaria para la industria lechera: descremadoras, maquinaria para la elaboración de la leche (homogeneizadoras), para la transformación de la leche (mantequeras, malaxadoras y moldeadoras).	C2825.02.02	f
1563	Fabricación de maquinaria para la molienda de granos: descascarilladoras de arroz.	Fabricación de maquinaria para la molienda de granos: descascarilladoras de arroz.	C2825.03.01	f
1565	Fabricación de maquinaria para limpiar, seleccionar y clasificar semillas, granos y leguminosas secas (aventadoras, cribadoras, cintas cribadoras, separadoras, cepilladoras, etcétera).	Fabricación de maquinaria para limpiar, seleccionar y clasificar semillas, granos y leguminosas secas (aventadoras, cribadoras, cintas cribadoras, separadoras, cepilladoras, etcétera).	C2825.03.03	f
1566	Fabricación de maquinaria para la producción de harinas y sémolas, etcétera (trituradoras, alimentadoras, cribadoras, depuradoras de afrecho (salvado), mezcladoras, etc.	Fabricación de maquinaria para la producción de harinas y sémolas, etcétera (trituradoras, alimentadoras, cribadoras, depuradoras de afrecho (salvado), mezcladoras, etc.	C2825.03.04	f
1567	Fabricación de prensas, trituradoras, trapiches, etcétera, utilizadas en la elaboración de vino, sidra, jugos de frutas, etcétera.	Fabricación de prensas, trituradoras, trapiches, etcétera, utilizadas en la elaboración de vino, sidra, jugos de frutas, etcétera.	C2825.04.01	f
1568	Fabricación de maquinaria para uso en panadería y para hacer macarrones, espaguetis o productos similares: hornos de panadería, amasadoras, fraccionadoras y moldeadoras de masa, cortadoras, máquinas para depositar tartas, etcétera.	Fabricación de maquinaria para uso en panadería y para hacer macarrones, espaguetis o productos similares: hornos de panadería, amasadoras, fraccionadoras y moldeadoras de masa, cortadoras, máquinas para depositar tartas, etcétera.	C2825.05.01	f
1569	Fabricación de maquinaria para la extracción o preparación de grasas y aceites animales o vegetales.	Fabricación de maquinaria para la extracción o preparación de grasas y aceites animales o vegetales.	C2825.06.01	f
1570	Fabricación de maquinaria para la preparación del tabaco.	Fabricación de maquinaria para la preparación del tabaco.	C2825.07.01	f
1571	Fabricación de maquinaria para la elaboración de cigarrillos y cigarros, tabaco para pipa, tabaco de mascar y rapé.	Fabricación de maquinaria para la elaboración de cigarrillos y cigarros, tabaco para pipa, tabaco de mascar y rapé.	C2825.07.02	f
1572	Servicios de apoyo a la fabricación de maquinaria para la elaboración de alimentos a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de maquinaria para la elaboración de alimentos a cambio de una retribución o por contrato.	C2825.08.01	f
1573	Servicios de apoyo a la fabricación de maquinaria para la elaboración de bebidas a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de maquinaria para la elaboración de bebidas a cambio de una retribución o por contrato.	C2825.08.02	f
1574	Servicios de apoyo a la fabricación de maquinaria para la elaboración de tabaco a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de maquinaria para la elaboración de tabaco a cambio de una retribución o por contrato.	C2825.08.03	f
1575	Fabricación de otra maquinaria y equipo para la elaboración de cerveza.	Fabricación de otra maquinaria y equipo para la elaboración de cerveza.	C2825.09.01	f
1576	Fabricación de otra maquinaria y equipo para la elaboración de carne de bovino y de aves de corral.	Fabricación de otra maquinaria y equipo para la elaboración de carne de bovino y de aves de corral.	C2825.09.02	f
1577	Fabricación de otra maquinaria y equipo para la fabricación de azúcar.	Fabricación de otra maquinaria y equipo para la fabricación de azúcar.	C2825.09.03	f
1578	Fabricación de otra maquinaria y equipo para la elaboración de diversos alimentos: maquinaria para la elaboración de cacao, chocolate y productos de confitería.	Fabricación de otra maquinaria y equipo para la elaboración de diversos alimentos: maquinaria para la elaboración de cacao, chocolate y productos de confitería.	C2825.09.04	f
1579	Fabricación de otra maquinaria y equipo para la preparación de frutas, nueces y hortalizas y legumbres, etcétera.	Fabricación de otra maquinaria y equipo para la preparación de frutas, nueces y hortalizas y legumbres, etcétera.	C2825.09.05	f
1580	Fabricación de otra maquinaria y equipo para la elaboración de diversos alimentos: maquinaria para la preparación de pescado, crustáceos y moluscos y otros productos marinos comestibles, maquinaria para filtrar y depurar, otros tipos de maquinaria para la preparación y la elaboración industrial de alimentos y bebidas, maquinaria para la preparación de alimentos en hoteles y restaurantes, etcétera.	Fabricación de otra maquinaria y equipo para la elaboración de diversos alimentos: maquinaria para la preparación de pescado, crustáceos y moluscos y otros productos marinos comestibles, maquinaria para filtrar y depurar, otros tipos de maquinaria para la preparación y la elaboración industrial de alimentos y bebidas, maquinaria para la preparación de alimentos en hoteles y restaurantes, etcétera.	C2825.09.06	f
1581	Fabricación de maquinaria textil: máquinas para preparar, producir fibras textiles: desmotadoras de algodón, abridoras de balas, transformadoras de hilachas en fibra, batanes de algodón, desengrasadoras y carbonizadoras de lana, peinadoras, cardadoras, mecheras, etcétera.	Fabricación de maquinaria textil: máquinas para preparar, producir fibras textiles: desmotadoras de algodón, abridoras de balas, transformadoras de hilachas en fibra, batanes de algodón, desengrasadoras y carbonizadoras de lana, peinadoras, cardadoras, mecheras, etcétera.	C2826.11.01	f
1582	Fabricación de maquinaria textil: máquinas para extruir, estirar, texturizar o cortar fibras y materiales textiles e hilados artificiales.	Fabricación de maquinaria textil: máquinas para extruir, estirar, texturizar o cortar fibras y materiales textiles e hilados artificiales.	C2826.11.02	f
1583	Máquinas para transformar las mechas en hilos, preparar hilados textiles.	Máquinas para transformar las mechas en hilos, preparar hilados textiles.	C2826.12.01	f
1584	Máquinas para transformar las mechas en hilos, preparar hilados textiles: telares corrientes, incluidos telares manuales.	Máquinas para transformar las mechas en hilos, preparar hilados textiles: telares corrientes, incluidos telares manuales.	C2826.12.02	f
1585	Máquinas para transformar las mechas en hilos, preparar hilados textiles: telares para tejidos de punto.	Máquinas para transformar las mechas en hilos, preparar hilados textiles: telares para tejidos de punto.	C2826.12.03	f
1586	Máquinas para transformar las mechas en hilos, preparar hilados textiles: máquinas para hacer tejidos de mallas anudadas, tules, encajes, trencillas, etcétera.	Máquinas para transformar las mechas en hilos, preparar hilados textiles: máquinas para hacer tejidos de mallas anudadas, tules, encajes, trencillas, etcétera.	C2826.12.04	f
1587	Máquinas para preparar hilados textiles: devanadoras, urdidoras y máquinas similares.	Máquinas para preparar hilados textiles: devanadoras, urdidoras y máquinas similares.	C2826.12.05	f
1620	Fabricación de maquinaria para fundición de caracteres de imprenta (fundidoras manuales o automáticas de caracteres).	Fabricación de maquinaria para fundición de caracteres de imprenta (fundidoras manuales o automáticas de caracteres).	C2829.97.01	f
1588	Fabricación de máquinas y equipo auxiliar para la maquinaria textil: lizos, mecanismos de Jacquard, mecanismos de parada automáticos, mecanismos de cambio de lanzadera, husos y aletas, etcétera.	Fabricación de máquinas y equipo auxiliar para la maquinaria textil: lizos, mecanismos de Jacquard, mecanismos de parada automáticos, mecanismos de cambio de lanzadera, husos y aletas, etcétera.	C2826.13.01	f
1589	Fabricación de maquinaria para el tratamiento de tejidos: maquinaria para lavar, blanquear, teñir, aprestar, acabar.	Fabricación de maquinaria para el tratamiento de tejidos: maquinaria para lavar, blanquear, teñir, aprestar, acabar.	C2826.14.01	f
1590	Fabricación de maquinaria para el tratamiento de tejidos: maquinaria para revestir e impregnar telas.	Fabricación de maquinaria para el tratamiento de tejidos: maquinaria para revestir e impregnar telas.	C2826.14.02	f
1591	Fabricación de máquinas para enrollar, desenrollar, plegar, cortar y calar telas; maquinaria para el estampado de textiles.	Fabricación de máquinas para enrollar, desenrollar, plegar, cortar y calar telas; maquinaria para el estampado de textiles.	C2826.14.03	f
1592	Fabricación de maquinaria de lavandería: máquinas de planchar, incluidas planchas de fusión, lavadoras y secadoras comerciales.	Fabricación de maquinaria de lavandería: máquinas de planchar, incluidas planchas de fusión, lavadoras y secadoras comerciales.	C2826.15.01	f
1593	Fabricación de máquinas de limpieza en seco.	Fabricación de máquinas de limpieza en seco.	C2826.15.02	f
1594	Fabricación de máquinas de coser, de cabezales (sean o no de uso doméstico.	Fabricación de máquinas de coser, de cabezales (sean o no de uso doméstico.	C2826.16.01	f
1595	Fabricación de agujas para máquinas de coser (sean o no de uso doméstico).	Fabricación de agujas para máquinas de coser (sean o no de uso doméstico).	C2826.16.02	f
1596	Fabricación de máquinas para la manufactura y el acabado de fieltros y de textiles no tejidos.	Fabricación de máquinas para la manufactura y el acabado de fieltros y de textiles no tejidos.	C2826.16.03	f
1597	Fabricación de máquinas para la manufactura de sombreros de fieltro.	Fabricación de máquinas para la manufactura de sombreros de fieltro.	C2826.16.04	f
1598	Servicios de apoyo a la fabricación de maquinaria para la preparación, elaboración y acabados de fibras, hilados y textiles.	Servicios de apoyo a la fabricación de maquinaria para la preparación, elaboración y acabados de fibras, hilados y textiles.	C2826.17.01	f
1599	Fabricación de máquinas para cueros: maquinaria para preparar, curtir y trabajar cueros y pieles.	Fabricación de máquinas para cueros: maquinaria para preparar, curtir y trabajar cueros y pieles.	C2826.21.01	f
1600	Fabricación de maquinaria para fabricar y reparar calzado.	Fabricación de maquinaria para fabricar y reparar calzado.	C2826.22.01	f
1601	Fabricación de maquinaria para fabricar y reparar otros artículos de cuero o piel.	Fabricación de maquinaria para fabricar y reparar otros artículos de cuero o piel.	C2826.22.02	f
1602	Servicios de apoyo a la fabricación de maquinaria para la elaboración de productos textiles, prendas de vestir y cueros a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de maquinaria para la elaboración de productos textiles, prendas de vestir y cueros a cambio de una retribución o por contrato.	C2826.30.01	f
1603	Fabricación de maquinaria para la elaboración de pasta de papel.	Fabricación de maquinaria para la elaboración de pasta de papel.	C2829.11.01	f
1604	Fabricación de maquinaria para la transformación de pasta de papel.	Fabricación de maquinaria para la transformación de pasta de papel.	C2829.11.02	f
1605	Fabricación de maquinaria para la fabricación de papel y cartón.	Fabricación de maquinaria para la fabricación de papel y cartón.	C2829.11.03	f
1606	Fabricación de maquinaria para el acabado de papel y cartón.	Fabricación de maquinaria para el acabado de papel y cartón.	C2829.11.04	f
1607	Fabricación de maquinaria para la elaboración de artículos de papel o cartón.	Fabricación de maquinaria para la elaboración de artículos de papel o cartón.	C2829.11.05	f
1608	Fabricación de maquinaria para la elaboración e industria de secadoras para madera, pasta de madera, papel o cartón y artículos de papel o cartón.	Fabricación de maquinaria para la elaboración e industria de secadoras para madera, pasta de madera, papel o cartón y artículos de papel o cartón.	C2829.11.06	f
1609	Fabricación de maquinaria para trabajar el caucho y los plásticos blandos y para fabricar productos de esos materiales: máquinas para extruir, moldear.	Fabricación de maquinaria para trabajar el caucho y los plásticos blandos y para fabricar productos de esos materiales: máquinas para extruir, moldear.	C2829.12.01	f
1610	Fabricación de maquinaria para recauchutar cubiertas neumáticas y otras máquinas para fabricar determinados productos de caucho o plásticos.	Fabricación de maquinaria para recauchutar cubiertas neumáticas y otras máquinas para fabricar determinados productos de caucho o plásticos.	C2829.12.02	f
1611	Servicios de apoyo a la fabricación de otros tipos de maquinaria de uso especial a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de otros tipos de maquinaria de uso especial a cambio de una retribución o por contrato.	C2829.20.01	f
1612	Fabricación de maquinaria para imprimir.	Fabricación de maquinaria para imprimir.	C2829.91.01	f
1613	Fabricación de máquinas auxiliares para la impresión sobre diversos materiales.	Fabricación de máquinas auxiliares para la impresión sobre diversos materiales.	C2829.91.02	f
1614	Fabricación de maquinaria para encuadernar.	Fabricación de maquinaria para encuadernar.	C2829.91.03	f
1615	Fabricación de maquinaria para producir baldosas, ladrillos, pastas de cerámica moldeadas, tubos, electrodos de grafito, tiza de pizarrón, moldes de fundición, etcétera.	Fabricación de maquinaria para producir baldosas, ladrillos, pastas de cerámica moldeadas, tubos, electrodos de grafito, tiza de pizarrón, moldes de fundición, etcétera.	C2829.92.01	f
1616	Fabricación de maquinaria para la elaboración de semiconductores.	Fabricación de maquinaria para la elaboración de semiconductores.	C2829.93.01	f
1617	Fabricación de máquinas para montar lámparas, tubos (válvulas) y bombillas eléctricas y electrónicas máquinas para la producción y el trabajo en caliente de vidrio y productos de cristalería, fibras e hilados de vidrio.	Fabricación de máquinas para montar lámparas, tubos (válvulas) y bombillas eléctricas y electrónicas máquinas para la producción y el trabajo en caliente de vidrio y productos de cristalería, fibras e hilados de vidrio.	C2829.94.01	f
1618	Fabricación de máquinas de funciones especiales, sistemas centrales de engrasado.	Fabricación de máquinas de funciones especiales, sistemas centrales de engrasado.	C2829.95.01	f
1621	Fabricación de maquinaria de composición tipográfica (monotipias y otras máquinas de fundición y composición provistas de teclado).	Fabricación de maquinaria de composición tipográfica (monotipias y otras máquinas de fundición y composición provistas de teclado).	C2829.97.02	f
1622	Fabricación de caracteres de imprenta.	Fabricación de caracteres de imprenta.	C2829.97.03	f
1624	Fabricación de maquinaria de elaboración de planchas de grabado al agua fuerte y de fototipia y composición tipográfica, clichés, planchas, cilindros y otros medios de impresión (piedras tipográficas, clichés de metal o plástico para impresoras offset.	Fabricación de maquinaria de elaboración de planchas de grabado al agua fuerte y de fototipia y composición tipográfica, clichés, planchas, cilindros y otros medios de impresión (piedras tipográficas, clichés de metal o plástico para impresoras offset.	C2829.97.05	f
1625	Servicios de apoyo a la fabricación de maquinaria para imprenta.	Servicios de apoyo a la fabricación de maquinaria para imprenta.	C2829.98.01	f
1626	Fabricación de otro tipo de maquinaria y equipo de uso especial: maquinaria o aparatos para la separación de isótopos, robots industriales de uso especial para la realización de múltiples tareas, secadores de otros materiales, maquinas para fabricar cuerdas, equipo de alineación y equilibrado (balanceo) de neumáticos; equipo de equilibrado (excepto el de equilibrado de ruedas), equipo automático para boleras, artefactos de lanzamiento para aeronaves, catapultas para portaaviones y equipo conexo, etcétera.	Fabricación de otro tipo de maquinaria y equipo de uso especial: maquinaria o aparatos para la separación de isótopos, robots industriales de uso especial para la realización de múltiples tareas, secadores de otros materiales, maquinas para fabricar cuerdas, equipo de alineación y equilibrado (balanceo) de neumáticos; equipo de equilibrado (excepto el de equilibrado de ruedas), equipo automático para boleras, artefactos de lanzamiento para aeronaves, catapultas para portaaviones y equipo conexo, etcétera.	C2829.99.01	f
1627	Fabricación de automóviles de pasajeros, vehículos para todo terreno.	Fabricación de automóviles de pasajeros, vehículos para todo terreno.	C2910.01.01	f
1628	Fabricación de autobuses, trolebuses, go-carts y vehículos similares, incluidos vehículos de carreras.	Fabricación de autobuses, trolebuses, go-carts y vehículos similares, incluidos vehículos de carreras.	C2910.01.02	f
1629	Fabricación de vehículos para el transporte de mercancías: camionetas, camiones.	Fabricación de vehículos para el transporte de mercancías: camionetas, camiones.	C2910.02.01	f
1630	Fabricación de camiones, volquetas, recolectores de basura, etcétera.	Fabricación de camiones, volquetas, recolectores de basura, etcétera.	C2910.02.02	f
1631	Fabricación de tractores para semirremolques de circulación por carretera, etcétera.	Fabricación de tractores para semirremolques de circulación por carretera, etcétera.	C2910.02.03	f
1632	Fabricación de motores para vehículos automotores.	Fabricación de motores para vehículos automotores.	C2910.03.01	f
1633	Fabricación de chasis equipados con motores.	Fabricación de chasis equipados con motores.	C2910.04.01	f
1634	Fabricación de otros vehículos automotores: trineos motorizados, carritos autopropulsados para campos de golf, vehículos anfibios, camiones de bomberos, camiones barredores, bibliotecas móviles, vehículos blindados, camiones hormigonera, etcétera.	Fabricación de otros vehículos automotores: trineos motorizados, carritos autopropulsados para campos de golf, vehículos anfibios, camiones de bomberos, camiones barredores, bibliotecas móviles, vehículos blindados, camiones hormigonera, etcétera.	C2910.05.01	f
1635	Servicios de apoyo a la fabricación de vehículos automotores, reconstrucción, rectificación en fábrica de sus motores a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de vehículos automotores, reconstrucción, rectificación en fábrica de sus motores a cambio de una retribución o por contrato.	C2910.06.01	f
1636	Fabricación de carrocerías, incluidas cabinas para vehículos automotores.	Fabricación de carrocerías, incluidas cabinas para vehículos automotores.	C2920.01.01	f
1637	Fabricación de carrocerías para vehículos automotores, de turismo, camiones, vehículos de uso especial, etc.	Fabricación de carrocerías para vehículos automotores, de turismo, camiones, vehículos de uso especial, etc.	C2920.01.02	f
1638	Fabricación de remolques y semirremolques.	Fabricación de remolques y semirremolques.	C2920.02.01	f
1639	Fabricación de remolques y semirremolques: para el transporte de mercancías: camiones cisterna, de mudanzas, etcétera.	Fabricación de remolques y semirremolques: para el transporte de mercancías: camiones cisterna, de mudanzas, etcétera.	C2920.02.02	f
1640	Fabricación de remolques y semirremolques: para el transporte de pasajeros: caravanas, etcétera.	Fabricación de remolques y semirremolques: para el transporte de pasajeros: caravanas, etcétera.	C2920.02.03	f
1641	Fabricación de partes y piezas de remolques.	Fabricación de partes y piezas de remolques.	C2920.02.04	f
1642	Fabricación de partes y piezas de semirremolques.	Fabricación de partes y piezas de semirremolques.	C2920.02.05	f
1643	Fabricación de contenedores para su acarreo por uno o más medios de transporte.	Fabricación de contenedores para su acarreo por uno o más medios de transporte.	C2920.03.01	f
1644	Servicios de apoyo a la fabricación, ensamblaje y equipamiento de carrocerías para vehículos automotores, remolques y semirremolques a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación, ensamblaje y equipamiento de carrocerías para vehículos automotores, remolques y semirremolques a cambio de una retribución o por contrato.	C2920.04.01	f
1645	Fabricación de partes, piezas y accesorios de carrocerías para vehículos automotores: cinturones de seguridad, dispositivos inflables de seguridad (airbag), puertas, parachoques, asientos.	Fabricación de partes, piezas y accesorios de carrocerías para vehículos automotores: cinturones de seguridad, dispositivos inflables de seguridad (airbag), puertas, parachoques, asientos.	C2930.01.01	f
1646	Fabricación de equipo eléctrico para vehículos automotores, como generadores, alternadores, bujías.	Fabricación de equipo eléctrico para vehículos automotores, como generadores, alternadores, bujías.	C2930.02.01	f
1647	Fabricación de equipo eléctrico para vehículos automotores montaje de tableros de instrumentos, reguladores de tensión, accionadores de engranajes, etcétera.	Fabricación de equipo eléctrico para vehículos automotores montaje de tableros de instrumentos, reguladores de tensión, accionadores de engranajes, etcétera.	C2930.02.02	f
1648	Fabricación de equipo eléctrico para vehículos automotores, como cableados preformados para el sistema de encendido, sistemas eléctricos de apertura y cierre de ventanillas y puertas.	Fabricación de equipo eléctrico para vehículos automotores, como cableados preformados para el sistema de encendido, sistemas eléctricos de apertura y cierre de ventanillas y puertas.	C2930.02.03	f
1649	Servicios de apoyo a la fabricación de partes, piezas y accesorios para vehículos automotores a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de partes, piezas y accesorios para vehículos automotores a cambio de una retribución o por contrato.	C2930.03.01	f
1650	Fabricación de otras partes, piezas y accesorios para vehículos automotores: frenos, cajas de cambios, ejes, aros de ruedas, amortiguadores, radiadores, silenciadores, tubos de escape, catalizadores, embragues, volantes, columnas y cajas de dirección, etcétera.	Fabricación de otras partes, piezas y accesorios para vehículos automotores: frenos, cajas de cambios, ejes, aros de ruedas, amortiguadores, radiadores, silenciadores, tubos de escape, catalizadores, embragues, volantes, columnas y cajas de dirección, etcétera.	C2930.09.01	f
1651	Construcción de buques comerciales.	Construcción de buques comerciales.	C3011.01.01	f
1652	Construcción de buques de pasajeros.	Construcción de buques de pasajeros.	C3011.01.02	f
1653	Construcción de transbordadores, buques mercantes, petroleros, remolcadores, etcétera.	Construcción de transbordadores, buques mercantes, petroleros, remolcadores, etcétera.	C3011.01.03	f
1654	Construcción de buques de guerra.	Construcción de buques de guerra.	C3011.02.01	f
1656	Construcción de buques factoría.	Construcción de buques factoría.	C3011.03.02	f
1657	Construcción de embarcaciones diseñadas o equipadas para la investigación científica.	Construcción de embarcaciones diseñadas o equipadas para la investigación científica.	C3011.03.03	f
1658	Construcción de diques flotantes,  plataformas de perforación flotantes o sumergibles.	Construcción de diques flotantes,  plataformas de perforación flotantes o sumergibles.	C3011.04.01	f
1659	Construcción de pantalanes flotantes, pontones, embarcaderos flotantes, boyas, depósitos flotantes, balsas inflables distintas de las de recreo, etcétera.	Construcción de pantalanes flotantes, pontones, embarcaderos flotantes, boyas, depósitos flotantes, balsas inflables distintas de las de recreo, etcétera.	C3011.04.02	f
1660	Construcción de grúas flotantes.	Construcción de grúas flotantes.	C3011.04.03	f
1661	Construcción de estructuras flotantes: gabarras,, aerodeslizadores (excepto los de recreo), secciones para buques.	Construcción de estructuras flotantes: gabarras,, aerodeslizadores (excepto los de recreo), secciones para buques.	C3011.04.04	f
1662	Servicios de apoyo a la construcción de buques a cambio de una retribución o por contrato.	Servicios de apoyo a la construcción de buques a cambio de una retribución o por contrato.	C3011.05.01	f
1663	Servicios de apoyo a la construcción de estructuras flotantes a cambio de una retribución o por contrato.	Servicios de apoyo a la construcción de estructuras flotantes a cambio de una retribución o por contrato.	C3011.05.02	f
1664	Desguazamiento de embarcaciones.	Desguazamiento de embarcaciones.	C3011.06.01	f
1665	Fabricación de botes y balsas inflables.	Fabricación de botes y balsas inflables.	C3012.01.01	f
1666	Construcción de veleros, provistos o no de motor auxiliar.	Construcción de veleros, provistos o no de motor auxiliar.	C3012.02.01	f
1667	Servicios de apoyo a la construcción de embarcaciones de recreo y deporte a cambio de una retribución o por contrato.	Servicios de apoyo a la construcción de embarcaciones de recreo y deporte a cambio de una retribución o por contrato.	C3012.03.01	f
1668	Fabricación de otras embarcaciones de recreo y deporte: embarcaciones personales, esquifes aerodeslizadores de recreo, etcétera.	Fabricación de otras embarcaciones de recreo y deporte: embarcaciones personales, esquifes aerodeslizadores de recreo, etcétera.	C3012.09.01	f
1669	Fabricación de motos acuáticas, embarcaciones de motor, etcétera.	Fabricación de motos acuáticas, embarcaciones de motor, etcétera.	C3012.09.02	f
1670	Fabricación de otras embarcaciones de recreo y deporte: canoas, kayaks, botes de remo, etcétera.	Fabricación de otras embarcaciones de recreo y deporte: canoas, kayaks, botes de remo, etcétera.	C3012.09.03	f
1671	Fabricación de locomotoras eléctricas, diesel, incluido vagones para ferrocarriles mineros.	Fabricación de locomotoras eléctricas, diesel, incluido vagones para ferrocarriles mineros.	C3020.01.01	f
1672	Fabricación de locomotoras de vapor y de otros tipos, incluido vagones para ferrocarriles mineros.	Fabricación de locomotoras de vapor y de otros tipos, incluido vagones para ferrocarriles mineros.	C3020.01.02	f
1673	Fabricación de vagones de pasajeros, furgones y vagones de plataforma autopropulsados de tranvía y de ferrocarril.	Fabricación de vagones de pasajeros, furgones y vagones de plataforma autopropulsados de tranvía y de ferrocarril.	C3020.02.01	f
1674	Fabricación de vehículos autopropulsados de mantenimiento y de servicio para tranvías y ferrocarriles.	Fabricación de vehículos autopropulsados de mantenimiento y de servicio para tranvías y ferrocarriles.	C3020.02.02	f
1675	Fabricación de material rodante no autopropulsado para tranvías y ferrocarriles: vagones de pasajeros, furgones de carga.	Fabricación de material rodante no autopropulsado para tranvías y ferrocarriles: vagones de pasajeros, furgones de carga.	C3020.03.01	f
1676	Fabricación de vagones cisterna, furgones y vagones de volteo, furgones taller, vagones grúa, ténderes, etcétera.	Fabricación de vagones cisterna, furgones y vagones de volteo, furgones taller, vagones grúa, ténderes, etcétera.	C3020.03.02	f
1677	Fabricación de partes y piezas especiales de locomotoras y tranvías y de su material rodante: bogies, ejes y ruedas, frenos y piezas de frenos, ganchos y mecanismos de enganche, topes y piezas de topes, amortiguadores, bastidores de vagones y locomotoras, carrocerías, plataformas de intercomunicación, etcétera, incluido asientos para vagones de ferrocarril.	Fabricación de partes y piezas especiales de locomotoras y tranvías y de su material rodante: bogies, ejes y ruedas, frenos y piezas de frenos, ganchos y mecanismos de enganche, topes y piezas de topes, amortiguadores, bastidores de vagones y locomotoras, carrocerías, plataformas de intercomunicación, etcétera, incluido asientos para vagones de ferrocarril.	C3020.04.01	f
1706	Fabricación de vehículos de propulsión manual: carritos para equipaje, carretillas, trineos, carritos para supermercados, etcétera.	Fabricación de vehículos de propulsión manual: carritos para equipaje, carretillas, trineos, carritos para supermercados, etcétera.	C3099.01.01	f
1678	Fabricación de equipo mecánico y electromecánico de señalización, seguridad y control de tráfico para ferrocarriles, tranvías, carreteras, vías de navegación interiores, aparcamientos, aeropuertos, etcétera.	Fabricación de equipo mecánico y electromecánico de señalización, seguridad y control de tráfico para ferrocarriles, tranvías, carreteras, vías de navegación interiores, aparcamientos, aeropuertos, etcétera.	C3020.05.01	f
1679	Servicios de apoyo a la fabricación de locomotoras y material rodante a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de locomotoras y material rodante a cambio de una retribución o por contrato.	C3020.06.01	f
1680	Fabricación de aeronaves para el transporte de mercancías o de pasajeros, para defensa militar, deporte.	Fabricación de aeronaves para el transporte de mercancías o de pasajeros, para defensa militar, deporte.	C3030.01.01	f
1681	Fabricación de aviones, helicópteros; fabricación aparatos de entrenamiento de vuelo en tierra.	Fabricación de aviones, helicópteros; fabricación aparatos de entrenamiento de vuelo en tierra.	C3030.01.02	f
1682	Fabricación de dirigibles y globos de aire caliente.	Fabricación de dirigibles y globos de aire caliente.	C3030.02.01	f
1683	Fabricación de planeadores, alas delta, etc.	Fabricación de planeadores, alas delta, etc.	C3030.02.02	f
1684	Fabricación de naves espaciales y vehículos de lanzamiento de naves espaciales, satélites, sondas planetarias, estaciones orbitales y transbordadores espaciales incluido misiles balísticos intercontinentales.	Fabricación de naves espaciales y vehículos de lanzamiento de naves espaciales, satélites, sondas planetarias, estaciones orbitales y transbordadores espaciales incluido misiles balísticos intercontinentales.	C3030.03.01	f
1685	Fabricación de partes, piezas y accesorios para aeronaves de esta clase: motores del tipo utilizado generalmente en aeronaves.	Fabricación de partes, piezas y accesorios para aeronaves de esta clase: motores del tipo utilizado generalmente en aeronaves.	C3030.04.01	f
1686	Fabricación de estatorreactores, pulsorreactores y motores de cohetes.	Fabricación de estatorreactores, pulsorreactores y motores de cohetes.	C3030.04.02	f
1687	Fabricación de partes, piezas y accesorios para turbopropulsores de reacción.	Fabricación de partes, piezas y accesorios para turbopropulsores de reacción.	C3030.04.03	f
1688	Fabricación de partes, piezas y accesorios para turbopropulsores de hélice.	Fabricación de partes, piezas y accesorios para turbopropulsores de hélice.	C3030.04.04	f
1689	Fabricación de turbopropulsores de reacción y de hélice.	Fabricación de turbopropulsores de reacción y de hélice.	C3030.04.05	f
1690	Fabricación de partes, piezas y accesorios para aeronaves de esta clase: ensambladuras principales, como fuselajes, alas, puertas, asientos para aeronaves, paneles de mando, trenes de aterrizaje, depósitos de combustible, góndolas, etcétera	Fabricación de partes, piezas y accesorios para aeronaves de esta clase: ensambladuras principales, como fuselajes, alas, puertas, asientos para aeronaves, paneles de mando, trenes de aterrizaje, depósitos de combustible, góndolas, etcétera	C3030.04.06	f
1691	Fabricación de partes, piezas y accesorios para globos, dirigibles y naves especiales: ensambladuras principales, como fuselajes, alas, puertas, asientos para aeronaves, paneles de mando, trenes de aterrizaje, depósitos de combustible, góndolas, etcétera	Fabricación de partes, piezas y accesorios para globos, dirigibles y naves especiales: ensambladuras principales, como fuselajes, alas, puertas, asientos para aeronaves, paneles de mando, trenes de aterrizaje, depósitos de combustible, góndolas, etcétera	C3030.04.07	f
1692	Fabricación de partes, piezas y accesorios para aeronaves de esta clase: hélices, rotores de helicóptero y palas de hélice propulsadas.	Fabricación de partes, piezas y accesorios para aeronaves de esta clase: hélices, rotores de helicóptero y palas de hélice propulsadas.	C3030.04.08	f
1693	Servicios de apoyo a la fabricación de aeronaves y naves especiales a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de aeronaves y naves especiales a cambio de una retribución o por contrato.	C3030.05.01	f
1694	Servicios de apoyo a la fabricación de motores de aeronaves y naves especiales y maquinaria conexa a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de motores de aeronaves y naves especiales y maquinaria conexa a cambio de una retribución o por contrato.	C3030.05.02	f
1695	Fabricación de vehículos militares de combate: tanques de combate, vehículos anfibios blindados.	Fabricación de vehículos militares de combate: tanques de combate, vehículos anfibios blindados.	C3040.01.01	f
1696	Servicios de apoyo a la fabricación de vehículos militares de combate a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de vehículos militares de combate a cambio de una retribución o por contrato.	C3040.02.01	f
1698	Fabricación de velomotores y bicicletas con motor auxiliar.	Fabricación de velomotores y bicicletas con motor auxiliar.	C3091.01.02	f
1699	Fabricación de motores para motocicletas, piezas, partes y accesorios de motocicletas incluido sidecars.	Fabricación de motores para motocicletas, piezas, partes y accesorios de motocicletas incluido sidecars.	C3091.02.01	f
1700	Servicios de apoyo a la fabricación de motocicletas a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de motocicletas a cambio de una retribución o por contrato.	C3091.03.01	f
1701	Fabricación de bicicletas no motorizadas y otros vehículos similares, como triciclos de reparto o para otros usos, tándems, bicicletas y triciclos para niños.	Fabricación de bicicletas no motorizadas y otros vehículos similares, como triciclos de reparto o para otros usos, tándems, bicicletas y triciclos para niños.	C3092.01.01	f
1702	Fabricación de partes, piezas y accesorios de bicicletas.	Fabricación de partes, piezas y accesorios de bicicletas.	C3092.01.02	f
1703	Fabricación de sillas de ruedas para inválidos, motorizados o no, fabricación de partes, piezas y accesorios de sillas de ruedas para inválidos.	Fabricación de sillas de ruedas para inválidos, motorizados o no, fabricación de partes, piezas y accesorios de sillas de ruedas para inválidos.	C3092.02.01	f
1704	Fabricación de cochecitos para bebés.	Fabricación de cochecitos para bebés.	C3092.03.01	f
1705	Servicios de apoyo a la fabricación de bicicletas y de sillas de ruedas para inválidos a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de bicicletas y de sillas de ruedas para inválidos a cambio de una retribución o por contrato.	C3092.04.01	f
1707	Fabricación de vehículos de tracción animal: calesas, calesines, carrozas fúnebres, etcétera.	Fabricación de vehículos de tracción animal: calesas, calesines, carrozas fúnebres, etcétera.	C3099.02.01	f
1708	Servicios de apoyo a la fabricación de otros tipos de equipo de transporte n.c.p a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de otros tipos de equipo de transporte n.c.p a cambio de una retribución o por contrato.	C3099.03.01	f
1709	Fabricación de muebles de madera y sus partes: para el hogar.	Fabricación de muebles de madera y sus partes: para el hogar.	C3100.01.01	f
1770	Fabricación de juegos accionados con monedas, billares, mesas especiales para juegos de casino, ajedrez, etcétera.	Fabricación de juegos accionados con monedas, billares, mesas especiales para juegos de casino, ajedrez, etcétera.	C3240.03.05	f
1710	Fabricación de muebles de madera y sus partes: para oficinas, talleres, hoteles, restaurantes, iglesias, escuelas, muebles especiales para locales comerciales, muebles para máquinas de coser, televisiones, etcétera.	Fabricación de muebles de madera y sus partes: para oficinas, talleres, hoteles, restaurantes, iglesias, escuelas, muebles especiales para locales comerciales, muebles para máquinas de coser, televisiones, etcétera.	C3100.01.02	f
1711	Fabricación de muebles de metal y sus partes: para el hogar.	Fabricación de muebles de metal y sus partes: para el hogar.	C3100.02.01	f
1712	Fabricación de muebles de metal y sus partes: oficina, talleres, hoteles, restaurantes, iglesias, escuelas, muebles especiales para locales comerciales y otros usos.	Fabricación de muebles de metal y sus partes: oficina, talleres, hoteles, restaurantes, iglesias, escuelas, muebles especiales para locales comerciales y otros usos.	C3100.02.02	f
1713	Fabricación de muebles de materiales plásticos y sus partes para cualquier uso (excepto muebles para uso médico o afines).	Fabricación de muebles de materiales plásticos y sus partes para cualquier uso (excepto muebles para uso médico o afines).	C3100.03.01	f
1714	Fabricación de muebles de otros materiales y sus partes (excepto de cerámica, hormigón o piedra) para cualquier uso como: sillas y asientos de jardín.	Fabricación de muebles de otros materiales y sus partes (excepto de cerámica, hormigón o piedra) para cualquier uso como: sillas y asientos de jardín.	C3100.04.01	f
1715	Fabricación de colchones: colchones de muelles y rellenos o provistos de algún material de sustentación.	Fabricación de colchones: colchones de muelles y rellenos o provistos de algún material de sustentación.	C3100.05.01	f
1716	Fabricación de colchones: colchones de caucho celular y de plástico sin forro, fabricación de bases de colchón.	Fabricación de colchones: colchones de caucho celular y de plástico sin forro, fabricación de bases de colchón.	C3100.05.02	f
1717	Servicios de apoyo a la fabricación, reparación y acabado (tapizado de sillas y sillones, lacado, pintado, barnizado con muñequilla, etcétera) de muebles a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación, reparación y acabado (tapizado de sillas y sillones, lacado, pintado, barnizado con muñequilla, etcétera) de muebles a cambio de una retribución o por contrato.	C3100.06.01	f
1718	Servicios de apoyo a la fabricación: restauración de muebles a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación: restauración de muebles a cambio de una retribución o por contrato.	C3100.06.02	f
1719	Fabricación de muebles para todo tipo de transporte de cualquier material.	Fabricación de muebles para todo tipo de transporte de cualquier material.	C3100.07.01	f
1720	Fabricación de partes y piezas de todo tipo de muebles de cualquier material.	Fabricación de partes y piezas de todo tipo de muebles de cualquier material.	C3100.08.01	f
1722	Producción de piedras preciosas y semipreciosas labradas.	Producción de piedras preciosas y semipreciosas labradas.	C3211.01.02	f
1723	Producción de piedras de calidad industrial y de piedras preciosas y semipreciosas sintéticas y reconstruidas, talla de diamantes.	Producción de piedras de calidad industrial y de piedras preciosas y semipreciosas sintéticas y reconstruidas, talla de diamantes.	C3211.01.03	f
1724	Fabricación de joyas de metales preciosos, incluido la fabricación de correas y cintas para relojes, pulseras y pitilleras de metales preciosos.	Fabricación de joyas de metales preciosos, incluido la fabricación de correas y cintas para relojes, pulseras y pitilleras de metales preciosos.	C3211.02.01	f
1725	Fabricación de metales comunes chapados con metales preciosos, de piedras preciosas y semipreciosas; y de combinaciones de metales preciosos y piedras preciosas y semipreciosas y otros materiales.	Fabricación de metales comunes chapados con metales preciosos, de piedras preciosas y semipreciosas; y de combinaciones de metales preciosos y piedras preciosas y semipreciosas y otros materiales.	C3211.02.02	f
1726	Fabricación de artículos de orfebrería elaborados con metales preciosos o metales comunes chapados con metales preciosos: cuberterías, vajillas y servicios de mesa, artículos de tocador, artículos de escritorio y oficina, artículos de uso religioso, etcétera.	Fabricación de artículos de orfebrería elaborados con metales preciosos o metales comunes chapados con metales preciosos: cuberterías, vajillas y servicios de mesa, artículos de tocador, artículos de escritorio y oficina, artículos de uso religioso, etcétera.	C3211.03.01	f
1727	Fabricación de artículos de uso técnico y de laboratorio elaborados con metales preciosos (excepto instrumentos y piezas de instrumentos): crisoles, espátulas, ánodos de galvanoplastia, etcétera.	Fabricación de artículos de uso técnico y de laboratorio elaborados con metales preciosos (excepto instrumentos y piezas de instrumentos): crisoles, espátulas, ánodos de galvanoplastia, etcétera.	C3211.04.01	f
1728	Fabricación de monedas, incluidas monedas de curso legal, sean o no de metales preciosos.	Fabricación de monedas, incluidas monedas de curso legal, sean o no de metales preciosos.	C3211.05.01	f
1729	Servicios de apoyo a la fabricación de joyas y artículos conexos como: el grabado de objetos personales de metales preciosos y de metales no preciosos, a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de joyas y artículos conexos como: el grabado de objetos personales de metales preciosos y de metales no preciosos, a cambio de una retribución o por contrato.	C3211.06.01	f
1730	Fabricación de medallas y medallones, sean o no de metales preciosos.	Fabricación de medallas y medallones, sean o no de metales preciosos.	C3211.07.01	f
1731	Fabricación de partes y piezas de joyas o de artículos de orfebrería.	Fabricación de partes y piezas de joyas o de artículos de orfebrería.	C3211.08.01	f
1732	Fabricación y producción de otros objetos de joyería y artículos conexos.	Fabricación y producción de otros objetos de joyería y artículos conexos.	C3211.09.01	f
1767	Fabricación de mesas de ping pong.	Fabricación de mesas de ping pong.	C3240.03.02	f
1768	Fabricación de artículos para juegos de bolos.	Fabricación de artículos para juegos de bolos.	C3240.03.03	f
1769	Fabricación de artículos para juegos de mesa o juegos de salón.	Fabricación de artículos para juegos de mesa o juegos de salón.	C3240.03.04	f
1771	Fabricación de juegos electrónicos.	Fabricación de juegos electrónicos.	C3240.03.06	f
1772	Fabricación de video juegos, etc.	Fabricación de video juegos, etc.	C3240.03.07	f
1773	Fabricación de juegos de chasco.	Fabricación de juegos de chasco.	C3240.03.08	f
1774	Fabricación de juguetes con ruedas utilizables como vehículos, monopatines, incluidos bicicletas y triciclos de plástico.	Fabricación de juguetes con ruedas utilizables como vehículos, monopatines, incluidos bicicletas y triciclos de plástico.	C3240.04.01	f
1733	Fabricación de artículos de bisutería: anillos, brazaletes, collares y artículos de bisuterías similares de metales comunes chapados con metales preciosos, joyas que contienen piedras de imitación, como diamantes u otras gemas de imitación y similares, incluido la fabricación de correas de metal para relojes (excepto las de metales preciosos).	Fabricación de artículos de bisutería: anillos, brazaletes, collares y artículos de bisuterías similares de metales comunes chapados con metales preciosos, joyas que contienen piedras de imitación, como diamantes u otras gemas de imitación y similares, incluido la fabricación de correas de metal para relojes (excepto las de metales preciosos).	C3212.01.01	f
1734	Servicios de apoyo a la fabricación de bisutería y artículos conexos a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de bisutería y artículos conexos a cambio de una retribución o por contrato.	C3212.02.01	f
1735	Fabricación de instrumentos de cuerda, instrumentos de cuerda con teclado, incluidos pianos automáticos, guitarras, etcétera.	Fabricación de instrumentos de cuerda, instrumentos de cuerda con teclado, incluidos pianos automáticos, guitarras, etcétera.	C3220.01.01	f
1736	Fabricación de cajas de música.	Fabricación de cajas de música.	C3220.02.01	f
1737	Fabricación de organillos, órganos de vapor, etcétera.	Fabricación de organillos, órganos de vapor, etcétera.	C3220.02.02	f
1738	Fabricación de órganos de tubo y teclado, incluidos armonios e instrumentos de teclado similares con lengüetas metálicas libres, etc.	Fabricación de órganos de tubo y teclado, incluidos armonios e instrumentos de teclado similares con lengüetas metálicas libres, etc.	C3220.02.03	f
1739	Fabricación de acordeones e instrumentos similares, incluidas armónicas.	Fabricación de acordeones e instrumentos similares, incluidas armónicas.	C3220.03.01	f
1740	Fabricación de instrumentos de viento: de madera.	Fabricación de instrumentos de viento: de madera.	C3220.03.02	f
1741	Fabricación de instrumentos de viento: de bronce.	Fabricación de instrumentos de viento: de bronce.	C3220.03.03	f
1742	Fabricación de instrumentos de viento: cuernos de llamada y otros instrumentos sonoros de boca para llamada.	Fabricación de instrumentos de viento: cuernos de llamada y otros instrumentos sonoros de boca para llamada.	C3220.03.04	f
1743	Fabricación de instrumentos de viento: silbatos.	Fabricación de instrumentos de viento: silbatos.	C3220.03.05	f
1744	Fabricación de instrumentos de percusión: tambores.	Fabricación de instrumentos de percusión: tambores.	C3220.04.01	f
1745	Fabricación de xilófonos, castañuelas, etcétera.	Fabricación de xilófonos, castañuelas, etcétera.	C3220.04.02	f
1746	Fabricación de partes, piezas y accesorios de instrumentos: metrónomos, diapasones de percusión y de boca, tarjetas, discos y rollos para instrumentos mecánicos automáticos, etcétera.	Fabricación de partes, piezas y accesorios de instrumentos: metrónomos, diapasones de percusión y de boca, tarjetas, discos y rollos para instrumentos mecánicos automáticos, etcétera.	C3220.05.01	f
1747	Servicios de apoyo a la fabricación de instrumentos musicales a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de instrumentos musicales a cambio de una retribución o por contrato.	C3220.06.01	f
1748	Fabricación de instrumentos musicales cuyo sonido se produce electrónicamente.	Fabricación de instrumentos musicales cuyo sonido se produce electrónicamente.	C3220.09.01	f
1749	Fabricación de otros instrumentos musicales.	Fabricación de otros instrumentos musicales.	C3220.09.02	f
1750	Fabricación de equipo para gimnasio.	Fabricación de equipo para gimnasio.	C3230.01.01	f
1751	Fabricación de artículos y equipo de cualquier material para la práctica de deportes y juegos al aire libre y bajo techo.	Fabricación de artículos y equipo de cualquier material para la práctica de deportes y juegos al aire libre y bajo techo.	C3230.01.02	f
1752	Fabricación de artículos y equipo para atletismo.	Fabricación de artículos y equipo para atletismo.	C3230.01.03	f
1753	Fabricación de artículos y equipo de cualquier material para la práctica de deportes de piscina y pista de remo.	Fabricación de artículos y equipo de cualquier material para la práctica de deportes de piscina y pista de remo.	C3230.01.04	f
1754	Fabricación de artículos y equipo de cualquier material para la práctica de deportes: balones duros, blandos e inflables.	Fabricación de artículos y equipo de cualquier material para la práctica de deportes: balones duros, blandos e inflables.	C3230.01.05	f
1756	Fabricación de artículos y equipo de cualquier material para la práctica de deportes y juegos al aire libre y bajo techo: bates y mazos.	Fabricación de artículos y equipo de cualquier material para la práctica de deportes y juegos al aire libre y bajo techo: bates y mazos.	C3230.01.07	f
1757	Fabricación de artículos y equipo de cualquier material para la práctica de deportes: esquíes, fijaciones y bastones de esquí, botas de esquí, tablas de vela y de surf, patines de hielo, patines de ruedas, etcétera.	Fabricación de artículos y equipo de cualquier material para la práctica de deportes: esquíes, fijaciones y bastones de esquí, botas de esquí, tablas de vela y de surf, patines de hielo, patines de ruedas, etcétera.	C3230.01.08	f
1758	Fabricación de artículos para la caza.	Fabricación de artículos para la caza.	C3230.02.01	f
1759	Fabricación de artículos para alpinismo.	Fabricación de artículos para alpinismo.	C3230.02.02	f
1760	Fabricación de artículos para la pesca deportiva.	Fabricación de artículos para la pesca deportiva.	C3230.02.03	f
1761	Fabricación de otros artículos deportivos: redes de mano, arcos y ballestas, guantes y tocados de cuero para la práctica de deportes.	Fabricación de otros artículos deportivos: redes de mano, arcos y ballestas, guantes y tocados de cuero para la práctica de deportes.	C3230.02.04	f
1762	Servicios de apoyo a la fabricación de artículos de deporte a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de artículos de deporte a cambio de una retribución o por contrato.	C3230.03.01	f
1763	Fabricación de muñecos que representan personajes, animales de juguete, muñecas.	Fabricación de muñecos que representan personajes, animales de juguete, muñecas.	C3240.01.01	f
1764	Fabricación de piezas y accesorios (vestidos) para muñecas.	Fabricación de piezas y accesorios (vestidos) para muñecas.	C3240.01.02	f
1765	Fabricación de instrumentos musicales de juguete.	Fabricación de instrumentos musicales de juguete.	C3240.02.01	f
1766	Fabricación de artículos para juegos de ferias de atracciones.	Fabricación de artículos para juegos de ferias de atracciones.	C3240.03.01	f
1775	Servicios de apoyo a la fabricación de juegos y juguetes a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de juegos y juguetes a cambio de una retribución o por contrato.	C3240.05.01	f
1776	Fabricación de modelos a escala reducida y modelos recreativos similares.	Fabricación de modelos a escala reducida y modelos recreativos similares.	C3240.09.01	f
1777	Fabricación de rompecabezas y artículos similares.	Fabricación de rompecabezas y artículos similares.	C3240.09.02	f
1778	Fabricación de trenes y juegos eléctricos, artículos similares, etcétera.	Fabricación de trenes y juegos eléctricos, artículos similares, etcétera.	C3240.09.03	f
1779	Fabricación de otros juegos y juguetes: armas de juguetes, juguetes para mascotas, juegos de construcciones, juegos de tablero, naipes, etcétera.	Fabricación de otros juegos y juguetes: armas de juguetes, juguetes para mascotas, juegos de construcciones, juegos de tablero, naipes, etcétera.	C3240.09.04	f
1780	Fabricación de hornos para laboratorios dentales, aparatos de destilación y centrifugadoras para laboratorio.	Fabricación de hornos para laboratorios dentales, aparatos de destilación y centrifugadoras para laboratorio.	C3250.11.01	f
1781	Fabricación de maquinaria de limpieza por ultrasonidos  y esterilizadores para laboratorio.	Fabricación de maquinaria de limpieza por ultrasonidos  y esterilizadores para laboratorio.	C3250.12.01	f
1782	Fabricación de mesas de operaciones, camillas de reconocimiento médico, camas de hospital con dispositivos mecánicos, (incluidos sillones de dentista con equipo odontológico).	Fabricación de mesas de operaciones, camillas de reconocimiento médico, camas de hospital con dispositivos mecánicos, (incluidos sillones de dentista con equipo odontológico).	C3250.13.01	f
1783	Fabricación de aparatos para medicina, cirugía, odontología y veterinaria basados en el uso de rayos x.	Fabricación de aparatos para medicina, cirugía, odontología y veterinaria basados en el uso de rayos x.	C3250.13.02	f
1784	Fabricación de aparatos para medicina, cirugía, odontología y veterinaria, como: bisturís, alicates de cirugía, pinzas de cirugía, instrumentos de odontología, etc.	Fabricación de aparatos para medicina, cirugía, odontología y veterinaria, como: bisturís, alicates de cirugía, pinzas de cirugía, instrumentos de odontología, etc.	C3250.13.03	f
1785	Fabricación de instrumentos para medicina, cirugía, odontología y veterinaria como: espejos reflectores, endoscopios, etc.	Fabricación de instrumentos para medicina, cirugía, odontología y veterinaria como: espejos reflectores, endoscopios, etc.	C3250.13.04	f
1786	Fabricación de aparatos ortopédicos.	Fabricación de aparatos ortopédicos.	C3250.14.01	f
1787	Fabricación de aparatos prostéticos.	Fabricación de aparatos prostéticos.	C3250.14.02	f
1788	Fabricación de ojos de cristal, dientes postizos, puentes, etcétera, en laboratorios médicos.	Fabricación de ojos de cristal, dientes postizos, puentes, etcétera, en laboratorios médicos.	C3250.14.03	f
1789	Fabricación de aparatos de mecanoterapia.	Fabricación de aparatos de mecanoterapia.	C3250.15.01	f
1790	Fabricación de máquinas de masaje.	Fabricación de máquinas de masaje.	C3250.15.02	f
1791	Fabricación de aparatos para pruebas psicológicas.	Fabricación de aparatos para pruebas psicológicas.	C3250.15.03	f
1792	Fabricación de aparatos de ozonoterapia, oxigenoterapia y respiración artificial, aparatos respiratorios terapéuticos y otros aparatos de respiración y máscaras de gas, etcétera.	Fabricación de aparatos de ozonoterapia, oxigenoterapia y respiración artificial, aparatos respiratorios terapéuticos y otros aparatos de respiración y máscaras de gas, etcétera.	C3250.15.04	f
1793	Fabricación de otro equipo médico y quirúrgico.	Fabricación de otro equipo médico y quirúrgico.	C3250.16.01	f
1794	Fabricación de sabanillas, hilos y gasas estériles de uso quirúrgico.	Fabricación de sabanillas, hilos y gasas estériles de uso quirúrgico.	C3250.21.01	f
1795	Fabricación de empastes y cementos dentales (excepto adhesivos para dentaduras), ceras dentales y otras preparaciones de uso odontológico; fabricación de cementos para la reconstrucción de hueso.	Fabricación de empastes y cementos dentales (excepto adhesivos para dentaduras), ceras dentales y otras preparaciones de uso odontológico; fabricación de cementos para la reconstrucción de hueso.	C3250.22.01	f
1796	Fabricación de placas y tornillos para fijación de huesos, jeringuillas, agujas, catéteres, cánulas, etcétera.	Fabricación de placas y tornillos para fijación de huesos, jeringuillas, agujas, catéteres, cánulas, etcétera.	C3250.23.01	f
1797	Fabricación de productos oftálmicos, lentes.	Fabricación de productos oftálmicos, lentes.	C3250.24.01	f
1798	Fabricación de gafas, gafas de sol, lentes de graduación, lentes de contacto, anteojos de protección.	Fabricación de gafas, gafas de sol, lentes de graduación, lentes de contacto, anteojos de protección.	C3250.24.02	f
1799	Servicios de apoyo a la fabricación de instrumentos y materiales médicos y odontológicos a cambio de una retribución o por contrato.	Servicios de apoyo a la fabricación de instrumentos y materiales médicos y odontológicos a cambio de una retribución o por contrato.	C3250.30.01	f
1800	Fabricación de sellos para fechar, cerrar o numerar.	Fabricación de sellos para fechar, cerrar o numerar.	C3290.11.01	f
1801	Fabricación de aparatos manuales para imprimir y estampar en relieve, membretes, aparatos de impresión manual.	Fabricación de aparatos manuales para imprimir y estampar en relieve, membretes, aparatos de impresión manual.	C3290.11.02	f
1802	Fabricación de cintas preparadas para máquinas de escribir.	Fabricación de cintas preparadas para máquinas de escribir.	C3290.11.03	f
1803	Fabricación de almohadillas entintadas.	Fabricación de almohadillas entintadas.	C3290.11.04	f
1804	Fabricación de plumas y lápices de toda clase, sean o no mecánicos.	Fabricación de plumas y lápices de toda clase, sean o no mecánicos.	C3290.12.01	f
1805	Fabricación de minas para lápices.	Fabricación de minas para lápices.	C3290.12.02	f
1806	Fabricación de globos terráqueos y otros instrumentos, aparatos y modelos diseñados para demostraciones.	Fabricación de globos terráqueos y otros instrumentos, aparatos y modelos diseñados para demostraciones.	C3290.13.01	f
1808	Fabricación de broches de presión, corchetes de presión.	Fabricación de broches de presión, corchetes de presión.	C3290.21.02	f
1809	Fabricación de cierres de cremallera (excepto metálicos).	Fabricación de cierres de cremallera (excepto metálicos).	C3290.21.03	f
1810	Fabricación de encendedores sean o no mecánicos, eléctricos y de otro tipo incluido sus repuestos.	Fabricación de encendedores sean o no mecánicos, eléctricos y de otro tipo incluido sus repuestos.	C3290.22.01	f
1815	Fabricación peines, pasadores para el cabello.	Fabricación peines, pasadores para el cabello.	C3290.24.02	f
1817	Fabricación de barbas y cejas postizas.	Fabricación de barbas y cejas postizas.	C3290.24.04	f
1818	Fabricación de vaporizadores de perfume.	Fabricación de vaporizadores de perfume.	C3290.24.05	f
1819	Fabricación de termos para uso personal y doméstico.	Fabricación de termos para uso personal y doméstico.	C3290.25.01	f
1820	Fabricación de recipientes herméticos para uso personal y doméstico.	Fabricación de recipientes herméticos para uso personal y doméstico.	C3290.25.02	f
1821	Fabricación de otros artículos de bazar y uso personal: borlas de polvos, bloques desbastados de madera para la fabricación de pipas.	Fabricación de otros artículos de bazar y uso personal: borlas de polvos, bloques desbastados de madera para la fabricación de pipas.	C3290.26.01	f
1822	Fabricación de equipo de protección y seguridad: ropa ignífuga y otras prendas de protección, cinturones de seguridad para instaladores y celadores de líneas telefónicas y de electricidad y otros cinturones de uso ocupacional, salvavidas de corcho, cascos de plástico y otro equipo personal de seguridad de plástico (por ejemplo, cascos para deportes), ropa de protección para bomberos, cascos de metal y otro equipo personal de seguridad de metal, tapones para los oídos y la nariz (por ejemplo, para nadar o para protegerse del ruido), máscaras de gas.	Fabricación de equipo de protección y seguridad: ropa ignífuga y otras prendas de protección, cinturones de seguridad para instaladores y celadores de líneas telefónicas y de electricidad y otros cinturones de uso ocupacional, salvavidas de corcho, cascos de plástico y otro equipo personal de seguridad de plástico (por ejemplo, cascos para deportes), ropa de protección para bomberos, cascos de metal y otro equipo personal de seguridad de metal, tapones para los oídos y la nariz (por ejemplo, para nadar o para protegerse del ruido), máscaras de gas.	C3290.31.01	f
1823	Fabricación de escobas y cepillos, incluidos cepillos que forman parte de máquinas, mopas y plumeros.	Fabricación de escobas y cepillos, incluidos cepillos que forman parte de máquinas, mopas y plumeros.	C3290.32.01	f
1824	Fabricación de brochas, almohadillas y rodillos para pintar.	Fabricación de brochas, almohadillas y rodillos para pintar.	C3290.32.02	f
1825	Fabricación de barredoras mecánicos manuales.	Fabricación de barredoras mecánicos manuales.	C3290.32.03	f
1826	Fabricación de cepillos para aseo personal.	Fabricación de cepillos para aseo personal.	C3290.32.04	f
1827	Fabricación de escobillas de goma y otros cepillas, escobas, cepillos de calzado y de ropa, etcétera.	Fabricación de escobillas de goma y otros cepillas, escobas, cepillos de calzado y de ropa, etcétera.	C3290.32.05	f
1828	Fabricación de artículos de materiales animales: huesos, marfil, carey, plumas, huesos, tripas, vejigas, etcétera, incluido actividades de taxidermia.	Fabricación de artículos de materiales animales: huesos, marfil, carey, plumas, huesos, tripas, vejigas, etcétera, incluido actividades de taxidermia.	C3290.33.01	f
1829	Fabricación de ataúdes y urnas.	Fabricación de ataúdes y urnas.	C3290.34.01	f
1830	Fabricación de velas, cirios y artículos similares, manufacturas moldeadas de cera.	Fabricación de velas, cirios y artículos similares, manufacturas moldeadas de cera.	C3290.35.01	f
1831	Fabricación de artículos de broma y artículos de fantasía (piñatas).	Fabricación de artículos de broma y artículos de fantasía (piñatas).	C3290.36.01	f
1832	Fabricación de cedazos y cribas manuales.	Fabricación de cedazos y cribas manuales.	C3290.39.01	f
1833	Fabricación de maniquíes de sastre.	Fabricación de maniquíes de sastre.	C3290.39.02	f
1834	Fabricación de otros artículos diversos: ramilletes y coronas de flores, cestas con arreglos florales; flores, artificiales.	Fabricación de otros artículos diversos: ramilletes y coronas de flores, cestas con arreglos florales; flores, artificiales.	C3290.39.03	f
1835	Fabricación de frutas artificiales.	Fabricación de frutas artificiales.	C3290.39.04	f
1836	Fabricación de plantas artificiales.	Fabricación de plantas artificiales.	C3290.39.05	f
1837	Fabricación de otros artículos diversos: productos de tagua, artesanías de otros materiales (excepto plástico, porcelana, cerámica y madera), gelatinas, materias vegetales o minerales, etcétera.	Fabricación de otros artículos diversos: productos de tagua, artesanías de otros materiales (excepto plástico, porcelana, cerámica y madera), gelatinas, materias vegetales o minerales, etcétera.	C3290.39.06	f
1838	Servicios de apoyo a otras industrias manufactureras n.c.p a cambio de una retribución o por contrato.	Servicios de apoyo a otras industrias manufactureras n.c.p a cambio de una retribución o por contrato.	C3290.40.01	f
1839	Servicios de reparación de: tanques, cisternas, depósitos, tambores, contenedores de metal y recipientes de metal, incluido la reparación de la chapa de calderas y radiadores de calefacción central a cambio de una retribución o por contrato.	Servicios de reparación de: tanques, cisternas, depósitos, tambores, contenedores de metal y recipientes de metal, incluido la reparación de la chapa de calderas y radiadores de calefacción central a cambio de una retribución o por contrato.	C3311.01.01	f
1840	Servicios de reparación y mantenimiento de caños y tuberías a cambio de una retribución o por contrato.	Servicios de reparación y mantenimiento de caños y tuberías a cambio de una retribución o por contrato.	C3311.02.01	f
1841	Servicios de reparación mediante servicios móviles de soldadura a cambio de una retribución o por contrato.	Servicios de reparación mediante servicios móviles de soldadura a cambio de una retribución o por contrato.	C3311.03.01	f
1842	Servicios de reparación y mantenimiento de generadores de vapor de agua y otros vapores, instalaciones auxiliares para generadores de vapor: condensadores, economizadores, recalentadores, recolectores y acumuladores de vapor, reactores nucleares (excepto separadores de isótopos), partes para calderas marinas o de potencia a cambio de una retribución o por contrato.	Servicios de reparación y mantenimiento de generadores de vapor de agua y otros vapores, instalaciones auxiliares para generadores de vapor: condensadores, economizadores, recalentadores, recolectores y acumuladores de vapor, reactores nucleares (excepto separadores de isótopos), partes para calderas marinas o de potencia a cambio de una retribución o por contrato.	C3311.04.01	f
1981	Alquiler de grúas con operador y otros equipos de demolición que no pueden asignarse a un tipo de construcción específico con operario.	Alquiler de grúas con operador y otros equipos de demolición que no pueden asignarse a un tipo de construcción específico con operario.	F4390.20.02	f
1982	Construcción de piscinas al aire libre.	Construcción de piscinas al aire libre.	F4390.91.01	f
1843	Servicios de reparación y mantenimiento de otros productos elaborados de metal: carritos de compras y equipo de manejo de materiales, armas de fuego y municiones (incluida la reparación de escopetas deportivas y de recreo) a cambio de una retribución o por contrato.	Servicios de reparación y mantenimiento de otros productos elaborados de metal: carritos de compras y equipo de manejo de materiales, armas de fuego y municiones (incluida la reparación de escopetas deportivas y de recreo) a cambio de una retribución o por contrato.	C3311.09.01	f
1844	Servicios de reparación y mantenimiento de maquinaria y tractores de uso agropecuario, forestal y para la explotación maderera a cambio de una retribución o por contrato.	Servicios de reparación y mantenimiento de maquinaria y tractores de uso agropecuario, forestal y para la explotación maderera a cambio de una retribución o por contrato.	C3312.11.01	f
1845	Servicios de reparación y mantenimiento de maquinaria para la minería y la extracción de petróleo y gas a cambio de una retribución o por contrato.	Servicios de reparación y mantenimiento de maquinaria para la minería y la extracción de petróleo y gas a cambio de una retribución o por contrato.	C3312.12.01	f
1846	Servicios de reparación y mantenimiento de maquinaria para la construcción a cambio de una retribución o por contrato.	Servicios de reparación y mantenimiento de maquinaria para la construcción a cambio de una retribución o por contrato.	C3312.12.02	f
1847	Servicios de reparación y mantenimiento de maquinaria para la elaboración de alimentos a cambio de una retribución o por contrato.	Servicios de reparación y mantenimiento de maquinaria para la elaboración de alimentos a cambio de una retribución o por contrato.	C3312.13.01	f
1848	Servicios de reparación y mantenimiento de maquinaria para la elaboración de bebidas a cambio de una retribución o por contrato.	Servicios de reparación y mantenimiento de maquinaria para la elaboración de bebidas a cambio de una retribución o por contrato.	C3312.13.02	f
1849	Servicios de reparación y mantenimiento de maquinaria para la elaboración de tabaco a cambio de una retribución o por contrato.	Servicios de reparación y mantenimiento de maquinaria para la elaboración de tabaco a cambio de una retribución o por contrato.	C3312.13.03	f
1850	Servicios de reparación y mantenimiento de maquinaria para la producción de textiles, prendas de vestir y artículos de cuero a cambio de una retribución o por contrato.	Servicios de reparación y mantenimiento de maquinaria para la producción de textiles, prendas de vestir y artículos de cuero a cambio de una retribución o por contrato.	C3312.14.01	f
1851	Servicios de reparación y mantenimiento de maquinaria para la fabricación de papel a cambio de una retribución o por contrato.	Servicios de reparación y mantenimiento de maquinaria para la fabricación de papel a cambio de una retribución o por contrato.	C3312.15.01	f
1852	Servicios de reparación y mantenimiento de hornos para procesos industriales, maquinaria metalúrgica, herramientas y accesorios para cortar y conformar metales a cambio de una retribución o por contrato.	Servicios de reparación y mantenimiento de hornos para procesos industriales, maquinaria metalúrgica, herramientas y accesorios para cortar y conformar metales a cambio de una retribución o por contrato.	C3312.16.01	f
1853	Servicios de reparación y mantenimiento de bombas, equipo de propulsión de fluidos y equipos afines, elementos de transmisión e impulsión a cambio de una retribución o por contrato.	Servicios de reparación y mantenimiento de bombas, equipo de propulsión de fluidos y equipos afines, elementos de transmisión e impulsión a cambio de una retribución o por contrato.	C3312.17.01	f
1854	Servicios de reparación de válvulas a cambio de una retribución o por contrato.	Servicios de reparación de válvulas a cambio de una retribución o por contrato.	C3312.18.01	f
1855	Servicios de reparación y mantenimiento de máquinas y herramientas de oficina y contabilidad a cambio de una retribución o por contrato: máquinas de escribir, fotocopiadoras, básculas, calculadoras, sean o no electrónicas etcétera.	Servicios de reparación y mantenimiento de máquinas y herramientas de oficina y contabilidad a cambio de una retribución o por contrato: máquinas de escribir, fotocopiadoras, básculas, calculadoras, sean o no electrónicas etcétera.	C3312.91.01	f
1856	Servicios de reparación de maquinaria de uso comercial, máquinas de venta automática, máquinas registradoras, equipo comercial de refrigeración y purificación de aire a cambio de una retribución o por contrato.	Servicios de reparación de maquinaria de uso comercial, máquinas de venta automática, máquinas registradoras, equipo comercial de refrigeración y purificación de aire a cambio de una retribución o por contrato.	C3312.92.01	f
1857	Servicios de reparación y mantenimiento de motores distintos de los de vehículos automotores a cambio de una retribución o por contrato: motores de buques o de locomotoras.	Servicios de reparación y mantenimiento de motores distintos de los de vehículos automotores a cambio de una retribución o por contrato: motores de buques o de locomotoras.	C3312.93.01	f
1858	Servicios de reparación y mantenimiento de otros tipos de maquinaria de uso especial de la división 28 (Fabricación de maquinaria y equipo n.c.p.): equipo de manipulación de materiales (equipo de elevación y manipulación, carga y descarga) y otras herramientas de mano motorizadas a cambio de una retribución o por contrato.	Servicios de reparación y mantenimiento de otros tipos de maquinaria de uso especial de la división 28 (Fabricación de maquinaria y equipo n.c.p.): equipo de manipulación de materiales (equipo de elevación y manipulación, carga y descarga) y otras herramientas de mano motorizadas a cambio de una retribución o por contrato.	C3312.99.01	f
1876	Servicios de instalación de maquinaria industrial en plantas industriales, equipo de control de procesos industriales, actividades de mecánicos instaladores, montaje de máquinas a cambio de una retribución o por contrato.	Servicios de instalación de maquinaria industrial en plantas industriales, equipo de control de procesos industriales, actividades de mecánicos instaladores, montaje de máquinas a cambio de una retribución o por contrato.	C3320.01.01	f
1859	Servicios de reparación y mantenimiento del equipo de medición, prueba, navegación y control a cambio de una retribución o por contrato: instrumentos de motores de aeronaves, equipo de medición de emisiones de vehículos automotores, instrumentos meteorológicos, equipo de ensayo e inspección de propiedades físicas, eléctricas y químicas, instrumentos de prospección, instrumentos de detección y vigilancia de radiaciones.	Servicios de reparación y mantenimiento del equipo de medición, prueba, navegación y control a cambio de una retribución o por contrato: instrumentos de motores de aeronaves, equipo de medición de emisiones de vehículos automotores, instrumentos meteorológicos, equipo de ensayo e inspección de propiedades físicas, eléctricas y químicas, instrumentos de prospección, instrumentos de detección y vigilancia de radiaciones.	C3313.01.01	f
57	Cultivo de tomates de árbol.	Cultivo de tomates de árbol.	A0125.02.01	t
1860	Servicios de reparación y mantenimiento de equipo de irradiación y equipo electrónico de uso médico y terapéutico a cambio de una retribución o por contrato: equipo de tomografía por resonancia magnética, ultrasonidos de uso médico, marcapasos, aparatos para sordos, electrocardiógrafos, equipo electrónico de endoscopia, aparatos de irradiación.	Servicios de reparación y mantenimiento de equipo de irradiación y equipo electrónico de uso médico y terapéutico a cambio de una retribución o por contrato: equipo de tomografía por resonancia magnética, ultrasonidos de uso médico, marcapasos, aparatos para sordos, electrocardiógrafos, equipo electrónico de endoscopia, aparatos de irradiación.	C3313.02.01	f
1861	Servicios de reparación y mantenimiento de instrumentos y equipo óptico de la clase si se utilizan principalmente con fines comerciales, a cambio de una retribución o por contrato como: binoculares, microscopios (excepto los electrónicos y protónicos), telescopios, prismas y lentes (excepto las oftálmicas), equipo fotográfico.	Servicios de reparación y mantenimiento de instrumentos y equipo óptico de la clase si se utilizan principalmente con fines comerciales, a cambio de una retribución o por contrato como: binoculares, microscopios (excepto los electrónicos y protónicos), telescopios, prismas y lentes (excepto las oftálmicas), equipo fotográfico.	C3313.03.01	f
1862	Servicios de reparación y mantenimiento de transformadores de fuerza y de distribución,  transformadores para usos especiales, motores eléctricos, generadores y motores generadores, convertidores eléctricos como: rectificadores e inversores a cambio de una retribución o por contrato.	Servicios de reparación y mantenimiento de transformadores de fuerza y de distribución,  transformadores para usos especiales, motores eléctricos, generadores y motores generadores, convertidores eléctricos como: rectificadores e inversores a cambio de una retribución o por contrato.	C3314.01.01	f
1863	Servicios de reparación y mantenimiento de dispositivos y aparatos de conmutación, relés y controles industriales, dispositivos de cableado portadores de corriente y dispositivos de cableado no portadores de corriente para circuitos eléctricos a cambio de una retribución o por contrato.	Servicios de reparación y mantenimiento de dispositivos y aparatos de conmutación, relés y controles industriales, dispositivos de cableado portadores de corriente y dispositivos de cableado no portadores de corriente para circuitos eléctricos a cambio de una retribución o por contrato.	C3314.02.01	f
1864	Servicios de reparación y mantenimiento de equipo de iluminación (alumbrado) eléctrico a cambio de una retribución o por contrato.	Servicios de reparación y mantenimiento de equipo de iluminación (alumbrado) eléctrico a cambio de una retribución o por contrato.	C3314.03.01	f
1865	Servicios de reparación y mantenimiento de otros equipos eléctricos: baterías primarias y de almacenamiento, etcétera a cambio de una retribución o por contrato: multimetros, electrómetros etcétera.	Servicios de reparación y mantenimiento de otros equipos eléctricos: baterías primarias y de almacenamiento, etcétera a cambio de una retribución o por contrato: multimetros, electrómetros etcétera.	C3314.09.01	f
1866	Servicios de reparación y mantenimiento corriente de buques a cambio de una retribución o por contrato.	Servicios de reparación y mantenimiento corriente de buques a cambio de una retribución o por contrato.	C3315.01.01	f
1867	Servicios de reparación y mantenimiento de embarcaciones de recreo a cambio de una retribución o por contrato.	Servicios de reparación y mantenimiento de embarcaciones de recreo a cambio de una retribución o por contrato.	C3315.02.01	f
1868	Servicios de reparación y mantenimiento de locomotoras y vagones (excepto la reconstrucción o conversión en fábrica) a cambio de una retribución o por contrato.	Servicios de reparación y mantenimiento de locomotoras y vagones (excepto la reconstrucción o conversión en fábrica) a cambio de una retribución o por contrato.	C3315.03.01	f
1869	Servicios de reparación y mantenimiento de aeronaves (excepto la conversión, el reacondicionamiento y la reconstrucción en fábrica) a cambio de una retribución o por contrato.	Servicios de reparación y mantenimiento de aeronaves (excepto la conversión, el reacondicionamiento y la reconstrucción en fábrica) a cambio de una retribución o por contrato.	C3315.04.01	f
1870	Servicios de reparación y mantenimiento de motores de aeronaves a cambio de una retribución o por contrato.	Servicios de reparación y mantenimiento de motores de aeronaves a cambio de una retribución o por contrato.	C3315.05.01	f
1871	Servicios de reparación de vagones y vagonetas de tracción animal a cambio de una retribución o por contrato.	Servicios de reparación de vagones y vagonetas de tracción animal a cambio de una retribución o por contrato.	C3315.06.01	f
1872	Servicios de reparación de redes de pesca, incluido su remiendo, cordajes, aparejos, lonas y lonas impermeables, sacos de almacenamiento de abonos y productos químicos a cambio de una retribución o por contrato.	Servicios de reparación de redes de pesca, incluido su remiendo, cordajes, aparejos, lonas y lonas impermeables, sacos de almacenamiento de abonos y productos químicos a cambio de una retribución o por contrato.	C3319.01.01	f
1873	Servicios de reparación o reacondicionamiento de paletas, toneles, barricas y equipo similar de madera a cambio de una retribución o por contrato.	Servicios de reparación o reacondicionamiento de paletas, toneles, barricas y equipo similar de madera a cambio de una retribución o por contrato.	C3319.02.01	f
1874	Servicios de reparación de máquinas tragamonedas y otros juegos accionados con monedas a cambio de una retribución o por contrato.	Servicios de reparación de máquinas tragamonedas y otros juegos accionados con monedas a cambio de una retribución o por contrato.	C3319.03.01	f
1875	Servicios de restauración de órganos y otros instrumentos musicales históricos a cambio de una retribución o por contrato.	Servicios de restauración de órganos y otros instrumentos musicales históricos a cambio de una retribución o por contrato.	C3319.04.01	f
1877	Servicios de desmantelamiento de maquinaria y equipo en gran escala.	Servicios de desmantelamiento de maquinaria y equipo en gran escala.	C3320.02.01	f
1878	Servicios de instalación de otros tipos de equipo industrial a cambio de una retribución o por contrato, como: equipo de comunicaciones, ordenadores centrales y similares, equipo de irradiación, equipo electromédico, eléctrico, etcétera, incluido la instalación de equipo para boleras.	Servicios de instalación de otros tipos de equipo industrial a cambio de una retribución o por contrato, como: equipo de comunicaciones, ordenadores centrales y similares, equipo de irradiación, equipo electromédico, eléctrico, etcétera, incluido la instalación de equipo para boleras.	C3320.09.01	f
1879	Servicios de mantenimiento y reparación de equipo cinematográfico profesional y no profesional.	Servicios de mantenimiento y reparación de equipo cinematográfico profesional y no profesional.	C3320.09.02	f
2121	Venta al por mayor de instrumentos musicales.	Venta al por mayor de instrumentos musicales.	G4649.99.03	f
1880	Actividades de operación de instalaciones de generación de energía eléctrica, por diversos medios: térmica (turbina de gas o diesel), nuclear, hidroeléctrica, solar, mareal y de otros tipos incluso de energía renovable.	Actividades de operación de instalaciones de generación de energía eléctrica, por diversos medios: térmica (turbina de gas o diesel), nuclear, hidroeléctrica, solar, mareal y de otros tipos incluso de energía renovable.	D3510.01.01	f
1881	Operación de sistemas de transmisión y distribución de energía eléctrica (que constan de postes, medidores y cableado), que transportan la energía eléctrica recibida desde las instalaciones de generación o transmisión hacia el consumidor final.	Operación de sistemas de transmisión y distribución de energía eléctrica (que constan de postes, medidores y cableado), que transportan la energía eléctrica recibida desde las instalaciones de generación o transmisión hacia el consumidor final.	D3510.02.01	f
1882	Actividades de agentes de energía eléctrica que organiza la venta de electricidad vía sistemas de distribución de energía operados por otros. Gestión de intercambiadores eléctricos.	Actividades de agentes de energía eléctrica que organiza la venta de electricidad vía sistemas de distribución de energía operados por otros. Gestión de intercambiadores eléctricos.	D3510.03.01	f
1883	Producción de gas para su suministro mediante la destilación del carbón a partir de sub productos de la agricultura o a partir de desechos.	Producción de gas para su suministro mediante la destilación del carbón a partir de sub productos de la agricultura o a partir de desechos.	D3520.01.01	f
1884	Fabricación de combustibles gaseosos con un valor calorífico específico, mediante la purificación, la mezcla y otros procesos de gases de diversos tipos, incluido el gas natural.	Fabricación de combustibles gaseosos con un valor calorífico específico, mediante la purificación, la mezcla y otros procesos de gases de diversos tipos, incluido el gas natural.	D3520.02.01	f
1885	Actividades de transporte, distribución y suministro de combustibles gaseosos de cualquier tipo por medio de un sistema de tuberías, venta de gas a los usuarios por medio de tuberías, actividades de los agentes o corredores que venden gas a través de sistemas de distribución operados por otros y Actividades de bolsas de productos básicos y mercados de capacidad de transporte para combustibles gaseosos.	Actividades de transporte, distribución y suministro de combustibles gaseosos de cualquier tipo por medio de un sistema de tuberías, venta de gas a los usuarios por medio de tuberías, actividades de los agentes o corredores que venden gas a través de sistemas de distribución operados por otros y Actividades de bolsas de productos básicos y mercados de capacidad de transporte para combustibles gaseosos.	D3520.03.01	f
1886	Producción, captación y distribución de vapor y agua caliente para calefacción, para la producción de energía y para otros fines.	Producción, captación y distribución de vapor y agua caliente para calefacción, para la producción de energía y para otros fines.	D3530.01.01	f
1887	Producción y distribución de aire refrigerado.	Producción y distribución de aire refrigerado.	D3530.02.01	f
1888	Producción y distribución de agua fría con fines de refrigeración. Incluye la producción de hielo, incluido hielo para la elaboración de productos alimenticios y para otros fines (p. ej., para refrigeración).	Producción y distribución de agua fría con fines de refrigeración. Incluye la producción de hielo, incluido hielo para la elaboración de productos alimenticios y para otros fines (p. ej., para refrigeración).	D3530.03.01	f
1889	Actividades de captación de agua de: ríos, lagos, pozos, lluvia etcétera; purificación de agua para su distribución; tratamiento de agua para uso industrial y otros usos; distribución de agua por medio de: tuberías, camiones (tanqueros) u otros medios, a usuarios residenciales, comerciales, industriales y de otro tipo.	Actividades de captación de agua de: ríos, lagos, pozos, lluvia etcétera; purificación de agua para su distribución; tratamiento de agua para uso industrial y otros usos; distribución de agua por medio de: tuberías, camiones (tanqueros) u otros medios, a usuarios residenciales, comerciales, industriales y de otro tipo.	E3600.01.01	f
1890	Desalinización de agua de mar o agua subterránea para producir agua como principal producto de interés.	Desalinización de agua de mar o agua subterránea para producir agua como principal producto de interés.	E3600.02.01	f
1892	Servicio público de gestión de sistemas de alcantarillado y de instalaciones de tratamiento de aguas residuales; recolección y transporte de aguas residuales humanas o industriales de uno o diversos usuarios, así como de agua de lluvia, por medio de redes de alcantarillado, colectores, tanques y otros medios de transporte (camiones cisterna de recogida de aguas negras, etcétera); vaciado y limpieza de pozos negros y fosas sépticas, fosos y pozos de alcantarillados; mantenimiento y limpieza de cloacas y alcantarillas, incluido el desatasco de cloacas.	Servicio público de gestión de sistemas de alcantarillado y de instalaciones de tratamiento de aguas residuales; recolección y transporte de aguas residuales humanas o industriales de uno o diversos usuarios, así como de agua de lluvia, por medio de redes de alcantarillado, colectores, tanques y otros medios de transporte (camiones cisterna de recogida de aguas negras, etcétera); vaciado y limpieza de pozos negros y fosas sépticas, fosos y pozos de alcantarillados; mantenimiento y limpieza de cloacas y alcantarillas, incluido el desatasco de cloacas.	E3700.00.01	f
1893	Mantenimiento de inodoros de acción química, así como las actividades de disolución, cribado, filtración, sedimentación y precipitación química.	Mantenimiento de inodoros de acción química, así como las actividades de disolución, cribado, filtración, sedimentación y precipitación química.	E3700.00.02	f
1928	Montaje y levantamiento de construcciones prefabricadas en el lugar.	Montaje y levantamiento de construcciones prefabricadas en el lugar.	F4100.30.01	f
1929	Construcción de carreteras, calles, autopistas y otras vías para vehículos o peatones.	Construcción de carreteras, calles, autopistas y otras vías para vehículos o peatones.	F4210.11.01	f
1894	Servicio público de tratamiento de aguas residuales (incluidas aguas residuales humanas e industriales, agua de piscinas, etcétera) mediante procesos físicos, químicos y biológicos como los de dilución, cribado, filtración, sedimentación, etcétera	Servicio público de tratamiento de aguas residuales (incluidas aguas residuales humanas e industriales, agua de piscinas, etcétera) mediante procesos físicos, químicos y biológicos como los de dilución, cribado, filtración, sedimentación, etcétera	E3700.00.03	f
1983	Limpieza de exteriores de edificios con vapor, con chorro de arena y con otros medios.	Limpieza de exteriores de edificios con vapor, con chorro de arena y con otros medios.	F4390.92.01	f
1984	Construcción de obras subterráneas: profundización (perforación) de pozos.	Construcción de obras subterráneas: profundización (perforación) de pozos.	F4390.93.01	f
63	Cultivo de café.	Cultivo de café.	A0127.01.01	t
1895	Servicio privado de gestión de sistemas de alcantarillado y de instalaciones de tratamiento de aguas residuales; recolección y transporte de aguas residuales humanas o industriales de uno o diversos usuarios, así como de agua de lluvia, por medio de redes de alcantarillado, colectores, tanques y otros medios de transporte (camiones cisterna de recogida de aguas negras, etcétera); vaciado y limpieza de pozos negros y fosas sépticas, fosos y pozos de alcantarillados; mantenimiento y limpieza de cloacas y alcantarillas, incluido el desatasco de cloacas.	Servicio privado de gestión de sistemas de alcantarillado y de instalaciones de tratamiento de aguas residuales; recolección y transporte de aguas residuales humanas o industriales de uno o diversos usuarios, así como de agua de lluvia, por medio de redes de alcantarillado, colectores, tanques y otros medios de transporte (camiones cisterna de recogida de aguas negras, etcétera); vaciado y limpieza de pozos negros y fosas sépticas, fosos y pozos de alcantarillados; mantenimiento y limpieza de cloacas y alcantarillas, incluido el desatasco de cloacas.	E3700.00.04	f
1896	Servicio privado de tratamiento de aguas residuales (incluidas aguas residuales humanas e industriales, agua de piscinas, etcétera) mediante procesos físicos, químicos y biológicos como los de dilución, cribado, filtración, sedimentación, etcétera	Servicio privado de tratamiento de aguas residuales (incluidas aguas residuales humanas e industriales, agua de piscinas, etcétera) mediante procesos físicos, químicos y biológicos como los de dilución, cribado, filtración, sedimentación, etcétera	E3700.00.05	f
1897	Servicio público de recolección de desechos sólidos no peligrosos (basura) en una zona delimitada: residuos de hogares y empresas por medio de contenedores; desechos recuperables mezclados de materiales reciclables; aceites y grasas usados en la cocina; desperdicios colocados en lugares públicos	Servicio público de recolección de desechos sólidos no peligrosos (basura) en una zona delimitada: residuos de hogares y empresas por medio de contenedores; desechos recuperables mezclados de materiales reciclables; aceites y grasas usados en la cocina; desperdicios colocados en lugares públicos	E3811.00.01	f
1898	Servicio privado de recolección de desechos sólidos no peligrosos (basura) en una zona delimitada: residuos de hogares y empresas por medio de contenedores; desechos recuperables mezclados de materiales reciclables; aceites y grasas usados en la cocina; desperdicios colocados en lugares públicos	Servicio privado de recolección de desechos sólidos no peligrosos (basura) en una zona delimitada: residuos de hogares y empresas por medio de contenedores; desechos recuperables mezclados de materiales reciclables; aceites y grasas usados en la cocina; desperdicios colocados en lugares públicos	E3811.00.02	f
1899	Recolección de desechos de actividades provenientes de la construcción y demolición, recolección y remoción de escombros; desechos producidos por fábricas textiles. Incluye la gestión de estaciones de transferencia de desechos no peligrosos	Recolección de desechos de actividades provenientes de la construcción y demolición, recolección y remoción de escombros; desechos producidos por fábricas textiles. Incluye la gestión de estaciones de transferencia de desechos no peligrosos	E3811.00.03	f
1900	Actividades de recolección de desechos peligrosos: sustancias explosivas, oxidantes, inflamables, tóxicas, irritantes, carcinógenas, corrosivas o infecciosas y otras substancias y preparados nocivos perjudiciales para la salud humana y el medio ambiente como: aceites usados de buques o garajes, residuos biológicos peligrosos, pilas y baterías usadas; La identificación, tratamiento, embalado y etiquetado de los desechos para su transporte. Se incluyen las siguientes actividades de recolección de desechos peligrosos y gestión de estaciones de expedición de desechos peligrosos.	Actividades de recolección de desechos peligrosos: sustancias explosivas, oxidantes, inflamables, tóxicas, irritantes, carcinógenas, corrosivas o infecciosas y otras substancias y preparados nocivos perjudiciales para la salud humana y el medio ambiente como: aceites usados de buques o garajes, residuos biológicos peligrosos, pilas y baterías usadas; La identificación, tratamiento, embalado y etiquetado de los desechos para su transporte. Se incluyen las siguientes actividades de recolección de desechos peligrosos y gestión de estaciones de expedición de desechos peligrosos.	E3812.00.01	f
1901	Actividades de operación de rellenos sanitarios para la eliminación de desechos no peligrosos; eliminación de desechos no peligrosos mediante combustión o incineración o por otros métodos, con o sin producción resultante de electricidad o vapor, combustibles sustitutivos, biogás, cenizas u otros subproductos para su utilización posterior, etcétera.	Actividades de operación de rellenos sanitarios para la eliminación de desechos no peligrosos; eliminación de desechos no peligrosos mediante combustión o incineración o por otros métodos, con o sin producción resultante de electricidad o vapor, combustibles sustitutivos, biogás, cenizas u otros subproductos para su utilización posterior, etcétera.	E3821.01.01	f
1902	Actividades de tratamiento de desechos orgánicos para su transformación. Incluye la producción de compost con desechos orgánicos.	Actividades de tratamiento de desechos orgánicos para su transformación. Incluye la producción de compost con desechos orgánicos.	E3821.02.01	f
1903	Operación de instalaciones para el tratamiento de desechos peligrosos, tratamiento y eliminación de animales tóxicos vivos y muertos y otros desechos contaminados	Operación de instalaciones para el tratamiento de desechos peligrosos, tratamiento y eliminación de animales tóxicos vivos y muertos y otros desechos contaminados	E3822.00.01	f
1904	Incineración de desechos peligrosos, remoción de productos usados como refrigeradores, con objeto de eliminar los desechos peligrosos.	Incineración de desechos peligrosos, remoción de productos usados como refrigeradores, con objeto de eliminar los desechos peligrosos.	E3822.00.02	f
1905	Tratamiento, remoción y almacenamiento de desechos nucleares radiactivos, incluido el tratamiento y eliminación de desechos radiactivos de transición, es decir que se desintegran durante el período de transporte, procedentes de hospitales, encapsulación, preparación y otras formas de tratamiento de desechos nucleares para su almacenamiento.	Tratamiento, remoción y almacenamiento de desechos nucleares radiactivos, incluido el tratamiento y eliminación de desechos radiactivos de transición, es decir que se desintegran durante el período de transporte, procedentes de hospitales, encapsulación, preparación y otras formas de tratamiento de desechos nucleares para su almacenamiento.	E3822.00.03	f
2107	Venta al por mayor de artículos de cerámica.	Venta al por mayor de artículos de cerámica.	G4649.95.02	f
1985	Venta de vehículos nuevos y usados: vehículos para todo terreno (jeeps, etcétera), incluido la venta al por mayor por comisionistas.	Venta de vehículos nuevos y usados: vehículos para todo terreno (jeeps, etcétera), incluido la venta al por mayor por comisionistas.	G4510.01.01	f
2013	Intermediarios del comercio de maquinaria, equipo industrial, embarcaciones y aeronaves.	Intermediarios del comercio de maquinaria, equipo industrial, embarcaciones y aeronaves.	G4610.04.01	f
1906	Actividades de procesamiento de desperdicios metálicos para convertirlos en materias primas secundarias, normalmente mediante un proceso de transformación mecánico o químico; Recuperación de materiales de corrientes de desechos: Separación y clasificación de materiales recuperables de corrientes de desechos no peligrosos (basura); Separación y clasificación en categorías distintas de materiales recuperables mezclados como: papel, plásticos, latas de bebidas usadas, y metales. Entre los procesos de transformación mecánica o química que se realizan se cuentan los siguientes: Aplastamiento mecánico de desperdicios metálicos, como: automóviles usados, lavadoras usadas, bicicletas usadas, etcétera, para su posterior clasificación y separación; Desguace de automóviles, buques, computadoras, aparatos de televisión y otros equipos para la recuperación de materiales; Reducción mecánica de grandes volúmenes de metal, como vagones de ferrocarril; Trituración de desechos de metal, vehículos desechados, etcétera; Otros métodos de tratamiento mecánico, como el corte y el prensado para reducir el volumen.	Actividades de procesamiento de desperdicios metálicos para convertirlos en materias primas secundarias, normalmente mediante un proceso de transformación mecánico o químico; Recuperación de materiales de corrientes de desechos: Separación y clasificación de materiales recuperables de corrientes de desechos no peligrosos (basura); Separación y clasificación en categorías distintas de materiales recuperables mezclados como: papel, plásticos, latas de bebidas usadas, y metales. Entre los procesos de transformación mecánica o química que se realizan se cuentan los siguientes: Aplastamiento mecánico de desperdicios metálicos, como: automóviles usados, lavadoras usadas, bicicletas usadas, etcétera, para su posterior clasificación y separación; Desguace de automóviles, buques, computadoras, aparatos de televisión y otros equipos para la recuperación de materiales; Reducción mecánica de grandes volúmenes de metal, como vagones de ferrocarril; Trituración de desechos de metal, vehículos desechados, etcétera; Otros métodos de tratamiento mecánico, como el corte y el prensado para reducir el volumen.	E3830.01.01	f
1907	Actividades de procesamiento de desechos metálicos para convertirlos en materias primas secundarias, normalmente mediante un proceso de transformación mecánico o químico; Recuperación de materiales de corrientes de desechos: Separación y clasificación de materiales recuperables de corrientes de desechos no peligrosos (basura); Separación y clasificación en categorías distintas de materiales recuperables mezclados como: papel, plásticos, latas de bebidas usadas, y metales. Entre los procesos de transformación mecánica o química que se realizan se cuentan los siguientes: Aplastamiento mecánico de desperdicios metálicos, como: automóviles usados, lavadoras usadas, bicicletas usadas, etcétera, para su posterior clasificación y separación; Desguace de automóviles, buques, computadoras, aparatos de televisión y otros equipos para la recuperación de materiales; Reducción mecánica de grandes volúmenes de metal, como vagones de ferrocarril; Trituración de desechos de metal, vehículos desechados, etcétera; Otros métodos de tratamiento mecánico, como el corte y el prensado para reducir el volumen.	Actividades de procesamiento de desechos metálicos para convertirlos en materias primas secundarias, normalmente mediante un proceso de transformación mecánico o químico; Recuperación de materiales de corrientes de desechos: Separación y clasificación de materiales recuperables de corrientes de desechos no peligrosos (basura); Separación y clasificación en categorías distintas de materiales recuperables mezclados como: papel, plásticos, latas de bebidas usadas, y metales. Entre los procesos de transformación mecánica o química que se realizan se cuentan los siguientes: Aplastamiento mecánico de desperdicios metálicos, como: automóviles usados, lavadoras usadas, bicicletas usadas, etcétera, para su posterior clasificación y separación; Desguace de automóviles, buques, computadoras, aparatos de televisión y otros equipos para la recuperación de materiales; Reducción mecánica de grandes volúmenes de metal, como vagones de ferrocarril; Trituración de desechos de metal, vehículos desechados, etcétera; Otros métodos de tratamiento mecánico, como el corte y el prensado para reducir el volumen.	E3830.01.02	f
1908	Actividades de procesamiento de otros artículos metálicos para convertirlos en materias primas secundarias, normalmente mediante un proceso de transformación mecánico o químico; Recuperación de materiales de corrientes de desechos: Separación y clasificación de materiales recuperables de corrientes de desechos no peligrosos (basura); Separación y clasificación en categorías distintas de materiales recuperables mezclados como: papel, plásticos, latas de bebidas usadas, y metales. Entre los procesos de transformación mecánica o química que se realizan se cuentan los siguientes: Aplastamiento mecánico de desperdicios metálicos, como: automóviles usados, lavadoras usadas, bicicletas usadas, etcétera, para su posterior clasificación y separación; Desguace de automóviles, buques, computadoras, aparatos de televisión y otros equipos para la recuperación de materiales; Reducción mecánica de grandes volúmenes de metal, como vagones de ferrocarril; Trituración de desechos de metal, vehículos desechados, etcétera; Otros métodos de tratamiento mecánico, como el corte y el prensado para reducir el volumen.	Actividades de procesamiento de otros artículos metálicos para convertirlos en materias primas secundarias, normalmente mediante un proceso de transformación mecánico o químico; Recuperación de materiales de corrientes de desechos: Separación y clasificación de materiales recuperables de corrientes de desechos no peligrosos (basura); Separación y clasificación en categorías distintas de materiales recuperables mezclados como: papel, plásticos, latas de bebidas usadas, y metales. Entre los procesos de transformación mecánica o química que se realizan se cuentan los siguientes: Aplastamiento mecánico de desperdicios metálicos, como: automóviles usados, lavadoras usadas, bicicletas usadas, etcétera, para su posterior clasificación y separación; Desguace de automóviles, buques, computadoras, aparatos de televisión y otros equipos para la recuperación de materiales; Reducción mecánica de grandes volúmenes de metal, como vagones de ferrocarril; Trituración de desechos de metal, vehículos desechados, etcétera; Otros métodos de tratamiento mecánico, como el corte y el prensado para reducir el volumen.	E3830.01.03	f
1909	Actividades de procesamiento de desperdicios y desechos no metálicos para convertirlos en materias primas secundarias, normalmente mediante un proceso de transformación mecánico o químico; Recuperación de materiales de corrientes de desechos: Separación y clasificación de materiales recuperables de corrientes de desechos no peligrosos (basura); Separación y clasificación en categorías distintas de materiales recuperables mezclados como: papel, plásticos, latas de bebidas usadas, y metales. Entre los procesos de transformación mecánica o química que se realizan se cuentan los siguientes: Aplastamiento mecánico de desperdicios metálicos, como: automóviles usados, lavadoras usadas, bicicletas usadas, etcétera, para su posterior clasificación y separación; Desguace de automóviles, buques, computadoras, aparatos de televisión y otros equipos para la recuperación de materiales; Reducción mecánica de grandes volúmenes de metal, como vagones de ferrocarril; Trituración de desechos de metal, vehículos desechados, etcétera; Otros métodos de tratamiento mecánico, como el corte y el prensado para reducir el volumen.	Actividades de procesamiento de desperdicios y desechos no metálicos para convertirlos en materias primas secundarias, normalmente mediante un proceso de transformación mecánico o químico; Recuperación de materiales de corrientes de desechos: Separación y clasificación de materiales recuperables de corrientes de desechos no peligrosos (basura); Separación y clasificación en categorías distintas de materiales recuperables mezclados como: papel, plásticos, latas de bebidas usadas, y metales. Entre los procesos de transformación mecánica o química que se realizan se cuentan los siguientes: Aplastamiento mecánico de desperdicios metálicos, como: automóviles usados, lavadoras usadas, bicicletas usadas, etcétera, para su posterior clasificación y separación; Desguace de automóviles, buques, computadoras, aparatos de televisión y otros equipos para la recuperación de materiales; Reducción mecánica de grandes volúmenes de metal, como vagones de ferrocarril; Trituración de desechos de metal, vehículos desechados, etcétera; Otros métodos de tratamiento mecánico, como el corte y el prensado para reducir el volumen.	E3830.01.04	f
1980	Alquiler de grúas con operador y otros equipos de construcción que no pueden asignarse a un tipo de construcción específico con operario.	Alquiler de grúas con operador y otros equipos de construcción que no pueden asignarse a un tipo de construcción específico con operario.	F4390.20.01	f
1910	Actividades de procesamiento de otros artículos no metálicos para convertirlos en materias primas secundarias, normalmente mediante un proceso de transformación mecánico o químico; Recuperación de materiales de corrientes de desechos: Separación y clasificación de materiales recuperables de corrientes de desechos no peligrosos (basura); Separación y clasificación en categorías distintas de materiales recuperables mezclados como: papel, plásticos, latas de bebidas usadas, y metales. Entre los procesos de transformación mecánica o química que se realizan se cuentan los siguientes: Aplastamiento mecánico de desperdicios metálicos, como: automóviles usados, lavadoras usadas, bicicletas usadas, etcétera, para su posterior clasificación y separación; Desguace de automóviles, buques, computadoras, aparatos de televisión y otros equipos para la recuperación de materiales; Reducción mecánica de grandes volúmenes de metal, como vagones de ferrocarril; Trituración de desechos de metal, vehículos desechados, etcétera; Otros métodos de tratamiento mecánico, como el corte y el prensado para reducir el volumen.	Actividades de procesamiento de otros artículos no metálicos para convertirlos en materias primas secundarias, normalmente mediante un proceso de transformación mecánico o químico; Recuperación de materiales de corrientes de desechos: Separación y clasificación de materiales recuperables de corrientes de desechos no peligrosos (basura); Separación y clasificación en categorías distintas de materiales recuperables mezclados como: papel, plásticos, latas de bebidas usadas, y metales. Entre los procesos de transformación mecánica o química que se realizan se cuentan los siguientes: Aplastamiento mecánico de desperdicios metálicos, como: automóviles usados, lavadoras usadas, bicicletas usadas, etcétera, para su posterior clasificación y separación; Desguace de automóviles, buques, computadoras, aparatos de televisión y otros equipos para la recuperación de materiales; Reducción mecánica de grandes volúmenes de metal, como vagones de ferrocarril; Trituración de desechos de metal, vehículos desechados, etcétera; Otros métodos de tratamiento mecánico, como el corte y el prensado para reducir el volumen.	E3830.01.05	f
1911	Recuperación de metales que contienen los desechos de material fotográfico; por ejemplo, solución fijadora, películas o papel fotográfico.	Recuperación de metales que contienen los desechos de material fotográfico; por ejemplo, solución fijadora, películas o papel fotográfico.	E3830.02.01	f
1912	Recuperación de productos de caucho, como llantas usadas, para obtener materias primas secundarias.	Recuperación de productos de caucho, como llantas usadas, para obtener materias primas secundarias.	E3830.02.02	f
1913	Clasificación y nodulización de plásticos para producir materias primas secundarias para la fabricación de tubos, macetas, bandejas de carga y productos similares.	Clasificación y nodulización de plásticos para producir materias primas secundarias para la fabricación de tubos, macetas, bandejas de carga y productos similares.	E3830.02.03	f
1914	Procesamiento (limpieza, fusión, trituración) de desechos de plástico o caucho para convertirlos en gránulos.	Procesamiento (limpieza, fusión, trituración) de desechos de plástico o caucho para convertirlos en gránulos.	E3830.02.04	f
1915	Trituración, limpieza y clasificación de desechos de vidrio.	Trituración, limpieza y clasificación de desechos de vidrio.	E3830.02.05	f
1916	Trituración, limpieza y clasificación de otros desechos, como los de demoliciones para obtener materias primas secundarias.	Trituración, limpieza y clasificación de otros desechos, como los de demoliciones para obtener materias primas secundarias.	E3830.02.06	f
1917	Procesamiento de aceites y grasas de cocina y de otros desechos y sustancias residuales de productos alimenticios, bebidas y tabaco para obtener materias primas secundarias.	Procesamiento de aceites y grasas de cocina y de otros desechos y sustancias residuales de productos alimenticios, bebidas y tabaco para obtener materias primas secundarias.	E3830.02.07	f
1918	Descontaminación de suelos y aguas subterráneas en el lugar de contaminación utilizando; por ejemplo, métodos mecánicos, químicos o biológicos.	Descontaminación de suelos y aguas subterráneas en el lugar de contaminación utilizando; por ejemplo, métodos mecánicos, químicos o biológicos.	E3900.01.01	f
1919	Actividades de descontaminación de instalaciones o terrenos industriales, incluidos los nucleares.	Actividades de descontaminación de instalaciones o terrenos industriales, incluidos los nucleares.	E3900.02.01	f
1920	Descontaminación y limpieza de aguas superficiales tras su contaminación accidental; por ejemplo, mediante la recogida de los contaminantes o la aplicación de sustancias químicas.	Descontaminación y limpieza de aguas superficiales tras su contaminación accidental; por ejemplo, mediante la recogida de los contaminantes o la aplicación de sustancias químicas.	E3900.02.02	f
1921	Limpieza de derrames de petróleo y otras formas de contaminación en tierra, aguas superficiales, mares y océanos, incluidas zonas costeras	Limpieza de derrames de petróleo y otras formas de contaminación en tierra, aguas superficiales, mares y océanos, incluidas zonas costeras	E3900.02.03	f
1922	Eliminación de asbesto, pintura de plomo y otros materiales tóxicos.	Eliminación de asbesto, pintura de plomo y otros materiales tóxicos.	E3900.02.04	f
1923	Otras actividades especializadas de control de la contaminación, incluido la remoción de minas terrestres y artefactos similares (incluida su detonación).	Otras actividades especializadas de control de la contaminación, incluido la remoción de minas terrestres y artefactos similares (incluida su detonación).	E3900.09.01	f
1924	Construcción de todo tipo de edificios residenciales: edificios de alturas elevadas, viviendas para ancianatos, casas para beneficencia, orfanatos, cárceles, cuarteles, conventos, casas religiosas. Incluye remodelación, renovación o rehabilitación de estructuras existentes.	Construcción de todo tipo de edificios residenciales: edificios de alturas elevadas, viviendas para ancianatos, casas para beneficencia, orfanatos, cárceles, cuarteles, conventos, casas religiosas. Incluye remodelación, renovación o rehabilitación de estructuras existentes.	F4100.10.01	f
1925	Construcción de todo tipo de edificios residenciales: casas familiares individuales, edificios multifamiliares	Construcción de todo tipo de edificios residenciales: casas familiares individuales, edificios multifamiliares	F4100.10.02	f
1926	Construcción de todo tipo de edificios no residenciales: edificios de producción industrial, Ejemplo. edificios de oficinas, hoteles, almacenes, centros comerciales, bodegas, restaurantes, observatorios, iglesias, museos, Incluye remodelación, renovación o rehabilitación de estructuras existentes	Construcción de todo tipo de edificios no residenciales: edificios de producción industrial, Ejemplo. edificios de oficinas, hoteles, almacenes, centros comerciales, bodegas, restaurantes, observatorios, iglesias, museos, Incluye remodelación, renovación o rehabilitación de estructuras existentes	F4100.20.01	f
1927	Construcción de todo tipo de edificios no residenciales: edificios de producción industrial, Ejemplo, aeroportuarios. Incluye remodelación, renovación o rehabilitación de estructuras existentes	Construcción de todo tipo de edificios no residenciales: edificios de producción industrial, Ejemplo, aeroportuarios. Incluye remodelación, renovación o rehabilitación de estructuras existentes	F4100.20.02	f
1930	Obras de superficie en calles, carreteras, autopistas, puentes o túneles, asfaltado de carretera, pintura y otros tipos de marcado de carretera, instalación de barreras de emergencia, señales de tráfico y elementos similares. Incluye la construcción de pistas para aeropuertos.	Obras de superficie en calles, carreteras, autopistas, puentes o túneles, asfaltado de carretera, pintura y otros tipos de marcado de carretera, instalación de barreras de emergencia, señales de tráfico y elementos similares. Incluye la construcción de pistas para aeropuertos.	F4210.12.01	f
1931	Construcción de líneas de ferrocarril y de metro.	Construcción de líneas de ferrocarril y de metro.	F4210.20.01	f
1933	Construcción de puentes y viaductos.	Construcción de puentes y viaductos.	F4210.32.01	f
1934	Construcción de obras de ingeniería civil relacionadas con: tuberías urbanas, construcción de conductos principales y acometidas de redes de distribución de agua sistemas de riego (canales), estaciones de bombeo, depósitos.	Construcción de obras de ingeniería civil relacionadas con: tuberías urbanas, construcción de conductos principales y acometidas de redes de distribución de agua sistemas de riego (canales), estaciones de bombeo, depósitos.	F4220.11.01	f
1935	Construcción de sistemas de alcantarillado, incluida su reparación, instalaciones de evacuación de aguas residuales y perforación de pozos de agua.	Construcción de sistemas de alcantarillado, incluida su reparación, instalaciones de evacuación de aguas residuales y perforación de pozos de agua.	F4220.12.01	f
1937	Construcción de obras civiles para: centrales eléctricas, líneas de transmisión de energía eléctrica y comunicaciones; obras auxiliares en zonas urbanas.	Construcción de obras civiles para: centrales eléctricas, líneas de transmisión de energía eléctrica y comunicaciones; obras auxiliares en zonas urbanas.	F4220.20.01	f
1938	Construcción de vías de navegación, obras portuarias y fluviales, puertos deportivos, esclusas, presas y diques.	Construcción de vías de navegación, obras portuarias y fluviales, puertos deportivos, esclusas, presas y diques.	F4290.11.01	f
1939	Dragado de vías de navegación.	Dragado de vías de navegación.	F4290.12.01	f
1940	Construcción de instalaciones industriales refinerías, fábricas de productos químicos.	Construcción de instalaciones industriales refinerías, fábricas de productos químicos.	F4290.91.01	f
1941	Obras de construcciones distintas de las de edificios por ejemplo: instalaciones deportivas al aire libre.	Obras de construcciones distintas de las de edificios por ejemplo: instalaciones deportivas al aire libre.	F4290.92.01	f
1942	Subdivisión (Lotización) de tierras con mejora (por ejemplo, construcción de carreteras, infraestructura de suministro público, etcétera).	Subdivisión (Lotización) de tierras con mejora (por ejemplo, construcción de carreteras, infraestructura de suministro público, etcétera).	F4290.93.01	f
1943	Demolición o derribo de edificios y otras estructuras.	Demolición o derribo de edificios y otras estructuras.	F4311.00.01	f
1944	Limpieza de terrenos de construcción.	Limpieza de terrenos de construcción.	F4312.01.01	f
1945	Movimiento de tierras: excavación, nivelación y ordenación de terrenos de construcción, excavación de zanjas, remoción de piedras, voladura, etcétera.	Movimiento de tierras: excavación, nivelación y ordenación de terrenos de construcción, excavación de zanjas, remoción de piedras, voladura, etcétera.	F4312.02.01	f
1946	Perforaciones de prueba, sondeos de exploración y recogida de muestras de sondeo para actividades de construcción y para fines geofísicos, geológicos o similares.	Perforaciones de prueba, sondeos de exploración y recogida de muestras de sondeo para actividades de construcción y para fines geofísicos, geológicos o similares.	F4312.03.01	f
1947	Construcción de drenaje de terrenos de construcción incluido tierras agrícolas o forestales.	Construcción de drenaje de terrenos de construcción incluido tierras agrícolas o forestales.	F4312.04.01	f
1948	Preparación de terrenos para actividades de explotación de minas y canteras: remoción del estéril (destape de minas) y actividades de otro tipo para preparar y aprovechar terrenos y propiedades mineros, excepto yacimientos de petróleo y gas.	Preparación de terrenos para actividades de explotación de minas y canteras: remoción del estéril (destape de minas) y actividades de otro tipo para preparar y aprovechar terrenos y propiedades mineros, excepto yacimientos de petróleo y gas.	F4312.05.01	f
1949	Instalación de accesorios eléctricos, líneas de telecomunicaciones, redes informáticas y líneas de televisión por cable, incluidas líneas de fibra óptica, antenas parabólicas. Incluye conexión de aparatos eléctricos, equipo doméstico y sistemas de calefacción radiante (incluye mantenimiento y reparación).	Instalación de accesorios eléctricos, líneas de telecomunicaciones, redes informáticas y líneas de televisión por cable, incluidas líneas de fibra óptica, antenas parabólicas. Incluye conexión de aparatos eléctricos, equipo doméstico y sistemas de calefacción radiante (incluye mantenimiento y reparación).	F4321.01.01	f
1950	instalación, manteniemiento y reparación de centrales de energía eléctrica y transformadores.	instalación, manteniemiento y reparación de centrales de energía eléctrica y transformadores.	F4321.01.02	f
1951	Instalación de sistemas de iluminación, sistemas de alarma contra incendios (incluye mantenimiento y reparación).	Instalación de sistemas de iluminación, sistemas de alarma contra incendios (incluye mantenimiento y reparación).	F4321.02.01	f
1952	Instalación de sistemas de iluminación, sistemas de alarma contra robos(incluye mantenimiento y reparación).	Instalación de sistemas de iluminación, sistemas de alarma contra robos(incluye mantenimiento y reparación).	F4321.02.02	f
1953	Instalación de sistemas de alumbrado y señales eléctricas de calles, alumbrado de pistas de aeropuertos.	Instalación de sistemas de alumbrado y señales eléctricas de calles, alumbrado de pistas de aeropuertos.	F4321.03.01	f
1978	Trabajos en lugares de difícil acceso que requieren la utilización de técnicas de escalada y del equipo correspondiente, como, por ejemplo, los trabajos a gran altura en estructuras elevadas.	Trabajos en lugares de difícil acceso que requieren la utilización de técnicas de escalada y del equipo correspondiente, como, por ejemplo, los trabajos a gran altura en estructuras elevadas.	F4390.15.01	f
1979	Construcción de cubierta de techos y tejados de edificios residenciales.	Construcción de cubierta de techos y tejados de edificios residenciales.	F4390.16.01	f
2007	Venta al por menor de partes, piezas y accesorios para motocicletas (incluso por comisionistas y compañías de venta por correo).	Venta al por menor de partes, piezas y accesorios para motocicletas (incluso por comisionistas y compañías de venta por correo).	G4540.02.02	f
1954	Instalación en edificios y otros proyectos de construcción de: sistemas de calefacción (eléctricos, de gas y de gasóleo), calderas, torres de refrigeración, colectores de energía solar no eléctricos, equipo de fontanería y sanitario, equipo y conductos de ventilación, conducciones de gas, tuberías de vapor, sistemas de aspersores contra incendios, sistemas de riego por aspersión para el césped. (incluye ampliaciones, reparaciones, reformas y mantenimiento).	Instalación en edificios y otros proyectos de construcción de: sistemas de calefacción (eléctricos, de gas y de gasóleo), calderas, torres de refrigeración, colectores de energía solar no eléctricos, equipo de fontanería y sanitario, equipo y conductos de ventilación, conducciones de gas, tuberías de vapor, sistemas de aspersores contra incendios, sistemas de riego por aspersión para el césped. (incluye ampliaciones, reparaciones, reformas y mantenimiento).	F4322.01.01	f
1955	Instalación en edificios y otros proyectos de construcción de: sistemas de refrigeración o aire acondicionado, (incluye ampliaciones, reparaciones, reformas y mantenimiento).	Instalación en edificios y otros proyectos de construcción de: sistemas de refrigeración o aire acondicionado, (incluye ampliaciones, reparaciones, reformas y mantenimiento).	F4322.02.01	f
1956	Instalación de canalización (conductos).	Instalación de canalización (conductos).	F4322.03.01	f
1957	Instalación, mantenimiento y reparación de tuberías para procesos insustriales	Instalación, mantenimiento y reparación de tuberías para procesos insustriales	F4322.04.01	f
1958	Instalación, reparación y el mantenimiento de ascensores así como escaleras mecánicas en edificios u otros proyectos dedicados a la construcción de puertas automáticas y giratorias en edificios u otros proyectos de construcción.	Instalación, reparación y el mantenimiento de ascensores así como escaleras mecánicas en edificios u otros proyectos dedicados a la construcción de puertas automáticas y giratorias en edificios u otros proyectos de construcción.	F4329.01.01	f
1959	Instalación, reparación y el mantenimiento de pararrayos en edificios u otros proyectos de construcción.	Instalación, reparación y el mantenimiento de pararrayos en edificios u otros proyectos de construcción.	F4329.02.01	f
1960	Sistemas de limpieza por aspiración en edificios u otros proyectos de construcción.	Sistemas de limpieza por aspiración en edificios u otros proyectos de construcción.	F4329.03.01	f
1961	Aislamiento térmico, acústico o contra las vibraciones en edificios u otros proyectos de construcción.	Aislamiento térmico, acústico o contra las vibraciones en edificios u otros proyectos de construcción.	F4329.04.01	f
1962	Aplicación en edificios y otros proyectos de construcción de yeso y estuco para interiores y exteriores, con los materiales de enlistonar correspondientes.	Aplicación en edificios y otros proyectos de construcción de yeso y estuco para interiores y exteriores, con los materiales de enlistonar correspondientes.	F4330.10.01	f
1963	Instalación de puertas (excepto automáticas y giratorias), ventanas, marcos de puertas y ventanas. Instalación de accesorios de cocinas, armarios empotrados, escaleras, mobiliario de tiendas y similares de madera u otros materiales, étcetera.	Instalación de puertas (excepto automáticas y giratorias), ventanas, marcos de puertas y ventanas. Instalación de accesorios de cocinas, armarios empotrados, escaleras, mobiliario de tiendas y similares de madera u otros materiales, étcetera.	F4330.20.01	f
1964	Actividades para habilitar edficios; Acabados interiores como techos, cubierta de madera de paredes, mamparas móviles,chapistería, etcétera.	Actividades para habilitar edficios; Acabados interiores como techos, cubierta de madera de paredes, mamparas móviles,chapistería, etcétera.	F4330.20.02	f
1965	Instalación de cerámicas baldosas, losas y losetas de cerámica, hormigón o piedra tallada para paredes y pisos, accesorios de cerámica para cocinas, parqué y otros revestimientos de madera para pisos, alfombras y cubrimientos de linóleo para pisos, incluidos los de caucho o plástico.	Instalación de cerámicas baldosas, losas y losetas de cerámica, hormigón o piedra tallada para paredes y pisos, accesorios de cerámica para cocinas, parqué y otros revestimientos de madera para pisos, alfombras y cubrimientos de linóleo para pisos, incluidos los de caucho o plástico.	F4330.31.01	f
1967	Instalación de parquet y otros revestimientos de madera para paredes y pisos en edificios u otros proyectos de construcción.	Instalación de parquet y otros revestimientos de madera para paredes y pisos en edificios u otros proyectos de construcción.	F4330.33.01	f
1968	Pintura interior o exterior de edificios. Incluye pintura de obras de ingeniería civil.	Pintura interior o exterior de edificios. Incluye pintura de obras de ingeniería civil.	F4330.41.01	f
1969	Instalación de vidrios, espejos, etcétera.	Instalación de vidrios, espejos, etcétera.	F4330.42.01	f
1970	Limpieza de edificios nuevos después de su construcción.	Limpieza de edificios nuevos después de su construcción.	F4330.91.01	f
1971	Otras actividades de terminación de edificios n.c.p.: Instalación de interiores de tiendas, casas móviles, embarcaciones, insonorización, pulimiento de pisos, etcétera.	Otras actividades de terminación de edificios n.c.p.: Instalación de interiores de tiendas, casas móviles, embarcaciones, insonorización, pulimiento de pisos, etcétera.	F4330.99.01	f
1972	Actividades de construcción especializadas en un aspecto común a diferentes tipos de estructuras y que requieren conocimientos o equipo especializados: cimentación, incluida la hincadura de pilotes.	Actividades de construcción especializadas en un aspecto común a diferentes tipos de estructuras y que requieren conocimientos o equipo especializados: cimentación, incluida la hincadura de pilotes.	F4390.11.01	f
1973	Actividades de construcción especializadas en un aspecto común a diferentes tipos de estructuras y que requieren conocimientos o equipo especializados: instalación y desmontaje de andamios y plataformas de trabajo, excluido el alquiler de andamios y plataformas.	Actividades de construcción especializadas en un aspecto común a diferentes tipos de estructuras y que requieren conocimientos o equipo especializados: instalación y desmontaje de andamios y plataformas de trabajo, excluido el alquiler de andamios y plataformas.	F4390.11.02	f
1974	Colocación de mampuestos de ladrillo y de piedra.	Colocación de mampuestos de ladrillo y de piedra.	F4390.11.03	f
1975	Trabajos de tratamiento de la humedad de edificios y de impermeabilización.	Trabajos de tratamiento de la humedad de edificios y de impermeabilización.	F4390.12.01	f
1976	Montaje de piezas erección de elementos de acero no fabricados por la propia unidad constructora, curvado de acero.	Montaje de piezas erección de elementos de acero no fabricados por la propia unidad constructora, curvado de acero.	F4390.13.01	f
1977	Construcción de chimeneas y hornos industriales.	Construcción de chimeneas y hornos industriales.	F4390.14.01	f
1986	Venta de vehículos nuevos y usados: vehículos para todo terreno (jeeps, etcétera), incluido la venta al por menor por comisionistas.	Venta de vehículos nuevos y usados: vehículos para todo terreno (jeeps, etcétera), incluido la venta al por menor por comisionistas.	G4510.01.02	f
1987	Venta de vehículos nuevos y usados: camiones, remolques y semiremolques, incluido la venta al por mayor por comisionistas.	Venta de vehículos nuevos y usados: camiones, remolques y semiremolques, incluido la venta al por mayor por comisionistas.	G4510.01.03	f
1988	Venta de vehículos nuevos y usados: camiones, remolques y semiremolques, incluido la venta al por menor por comisionistas.	Venta de vehículos nuevos y usados: camiones, remolques y semiremolques, incluido la venta al por menor por comisionistas.	G4510.01.04	f
1989	Venta de vehículos nuevos y usados: vehículos especializados como: ambulancias y minibuses, incluido la venta al por mayor por comisionistas.	Venta de vehículos nuevos y usados: vehículos especializados como: ambulancias y minibuses, incluido la venta al por mayor por comisionistas.	G4510.01.05	f
1990	Venta de vehículos nuevos y usados: vehículos especializados como ambulancias y minibuses, incluido la venta al por menor por comisionistas.	Venta de vehículos nuevos y usados: vehículos especializados como ambulancias y minibuses, incluido la venta al por menor por comisionistas.	G4510.01.06	f
1991	Venta de vehículos nuevos y usados: vehículos de pasajeros, incluido la venta al por mayor por comisionistas.	Venta de vehículos nuevos y usados: vehículos de pasajeros, incluido la venta al por mayor por comisionistas.	G4510.01.07	f
1992	Venta de vehículos nuevos y usados: vehículos de pasajeros, incluido la venta al por menor por comisionistas.	Venta de vehículos nuevos y usados: vehículos de pasajeros, incluido la venta al por menor por comisionistas.	G4510.01.08	f
1993	Venta de vehículos nuevos y usados: vehículos de acampada como caravanas y autocaravanas, incluido la venta al por mayor por comisionistas.	Venta de vehículos nuevos y usados: vehículos de acampada como caravanas y autocaravanas, incluido la venta al por mayor por comisionistas.	G4510.01.09	f
1994	Venta de vehículos nuevos y usados: vehículos de acampada como caravanas y autocaravanas, incluido la venta al por menor por comisionistas.	Venta de vehículos nuevos y usados: vehículos de acampada como caravanas y autocaravanas, incluido la venta al por menor por comisionistas.	G4510.01.10	f
1995	Venta de otros vehículos nuevos y usados, incluido la venta al por mayor por comisionistas.	Venta de otros vehículos nuevos y usados, incluido la venta al por mayor por comisionistas.	G4510.01.11	f
1996	Venta de otros vehículos nuevos y usados, incluido la venta al por menor por comisionistas.	Venta de otros vehículos nuevos y usados, incluido la venta al por menor por comisionistas.	G4510.01.12	f
1998	Mantenimiento y reparación de vehículos automotores: reparación mecánica, eléctrica, sistemas de inyección eléctricos.	Mantenimiento y reparación de vehículos automotores: reparación mecánica, eléctrica, sistemas de inyección eléctricos.	G4520.01.01	f
1999	Mantenimiento y reparación de vehículos automotores: carrocerías, partes de vehículos automotores: parabrisas, ventanas, asientos y tapicerías. Incluye el tratamiento anti óxido, pinturas a pistola o brocha a los vehículos y automotores y carga de baterias.	Mantenimiento y reparación de vehículos automotores: carrocerías, partes de vehículos automotores: parabrisas, ventanas, asientos y tapicerías. Incluye el tratamiento anti óxido, pinturas a pistola o brocha a los vehículos y automotores y carga de baterias.	G4520.01.02	f
2000	Mantenimiento y reparación, instalación, cambio de neumáticos (llantas) y tubos (Vulcanizadoras).	Mantenimiento y reparación, instalación, cambio de neumáticos (llantas) y tubos (Vulcanizadoras).	G4520.02.01	f
2001	Servicios de lavado, engrasado, pulverizado, encerado, cambios de aceite, etcétera.	Servicios de lavado, engrasado, pulverizado, encerado, cambios de aceite, etcétera.	G4520.03.01	f
2002	Venta al por mayor de todo tipo de partes, componentes, suministros, herramientas y accesorios para vehículos automotores como: neumáticos (llantas), cámaras de aire para neumáticos (tubos). Incluye bujías, baterías, equipo de iluminación partes y piezas eléctricas.	Venta al por mayor de todo tipo de partes, componentes, suministros, herramientas y accesorios para vehículos automotores como: neumáticos (llantas), cámaras de aire para neumáticos (tubos). Incluye bujías, baterías, equipo de iluminación partes y piezas eléctricas.	G4530.00.01	f
2003	Venta al por menor de todo tipo de partes, componentes, suministros, herramientas y accesorios para vehículos automotores como: neumáticos (llantas), cámaras de aire para neumáticos (tubos). Incluye bujías, baterías, equipo de iluminación partes y piezas eléctricas.	Venta al por menor de todo tipo de partes, componentes, suministros, herramientas y accesorios para vehículos automotores como: neumáticos (llantas), cámaras de aire para neumáticos (tubos). Incluye bujías, baterías, equipo de iluminación partes y piezas eléctricas.	G4530.00.02	f
2004	Venta al por mayor de motocicletas, incluso ciclomotores (velomotores), tricimotos.	Venta al por mayor de motocicletas, incluso ciclomotores (velomotores), tricimotos.	G4540.01.01	f
2005	Venta al por menor de motocicletas, incluso ciclomotores (velomotores), tricimotos.	Venta al por menor de motocicletas, incluso ciclomotores (velomotores), tricimotos.	G4540.01.02	f
2006	Venta al por mayor de partes, piezas y accesorios para motocicletas (incluso por comisionistas y compañías de venta por correo).	Venta al por mayor de partes, piezas y accesorios para motocicletas (incluso por comisionistas y compañías de venta por correo).	G4540.02.01	f
2008	Actividades de mantenimiento y reparación de motocicletas.	Actividades de mantenimiento y reparación de motocicletas.	G4540.03.01	f
2009	Otras actividades concernientes a la venta, mantenimiento y reparación de motocicletas y trineos motorizados.	Otras actividades concernientes a la venta, mantenimiento y reparación de motocicletas y trineos motorizados.	G4540.04.01	f
2010	Intermediarios del comercio de materias primas agrarias, animales vivos, materias primas textiles y productos semielaborados.	Intermediarios del comercio de materias primas agrarias, animales vivos, materias primas textiles y productos semielaborados.	G4610.01.01	f
2011	Intermediarios del comercio de combustibles, minerales, metales, y productos químicos industriales, incluidos abonos.	Intermediarios del comercio de combustibles, minerales, metales, y productos químicos industriales, incluidos abonos.	G4610.02.01	f
2012	Intermediarios del comercio de la madera y materiales de construcción.	Intermediarios del comercio de la madera y materiales de construcción.	G4610.03.01	f
2118	Venta al por mayor de cubiertos, utensilios domésticos de metal.	Venta al por mayor de cubiertos, utensilios domésticos de metal.	G4649.98.01	f
2014	Intermediarios del comercio de muebles, artículos para el hogar y ferretería.	Intermediarios del comercio de muebles, artículos para el hogar y ferretería.	G4610.05.01	f
2015	Intermediarios del comercio de textiles, prendas de vestir, peletería, calzado y artículos de cuero.	Intermediarios del comercio de textiles, prendas de vestir, peletería, calzado y artículos de cuero.	G4610.06.01	f
2016	Intermediarios del comercio de productos alimenticios, bebidas y tabaco.	Intermediarios del comercio de productos alimenticios, bebidas y tabaco.	G4610.07.01	f
2017	Actividades de casas de subastas al por mayor.	Actividades de casas de subastas al por mayor.	G4610.08.01	f
2018	Intermediarios del comercio de productos diversos.	Intermediarios del comercio de productos diversos.	G4610.09.01	f
2019	Venta al por mayor de cereales (granos).	Venta al por mayor de cereales (granos).	G4620.11.01	f
2021	Venta al por mayor de semillas.	Venta al por mayor de semillas.	G4620.11.02	f
2022	Venta al por mayor de frutos y semillas oleaginosas.	Venta al por mayor de frutos y semillas oleaginosas.	G4620.12.01	f
2023	Venta al por mayor de tabaco sin elaborar.	Venta al por mayor de tabaco sin elaborar.	G4620.13.01	f
2024	Venta al por mayor de desechos, residuos y productos derivados usados para alimentar animales (forraje), incluye materias primas agrarias.	Venta al por mayor de desechos, residuos y productos derivados usados para alimentar animales (forraje), incluye materias primas agrarias.	G4620.14.01	f
2026	Venta al por mayor de plantas.	Venta al por mayor de plantas.	G4620.15.02	f
2027	Venta al por mayor de otras materias primas agropecuarias.	Venta al por mayor de otras materias primas agropecuarias.	G4620.19.01	f
2028	Venta al por mayor de animales vivos.	Venta al por mayor de animales vivos.	G4620.21.01	f
2029	Venta al por mayor de cueros, pieles.	Venta al por mayor de cueros, pieles.	G4620.22.01	f
2030	Venta al por mayor de otros productos animales.	Venta al por mayor de otros productos animales.	G4620.22.02	f
2031	Venta al por mayor de banano y plátano.	Venta al por mayor de banano y plátano.	G4630.11.01	f
2033	Venta al por mayor de legumbres.	Venta al por mayor de legumbres.	G4630.12.02	f
2034	Venta al por mayor de hortalizas.	Venta al por mayor de hortalizas.	G4630.12.03	f
2035	Venta al por mayor de verduras.	Venta al por mayor de verduras.	G4630.12.04	f
2036	Venta al por mayor de papa y tubérculos.	Venta al por mayor de papa y tubérculos.	G4630.13.01	f
2040	Venta al por mayor de especias.	Venta al por mayor de especias.	G4630.14.04	f
2041	Venta al por mayor de productos lácteos.	Venta al por mayor de productos lácteos.	G4630.21.01	f
2042	Venta al por mayor de helados, bolos, etcétera.	Venta al por mayor de helados, bolos, etcétera.	G4630.21.02	f
2044	Venta al por mayor de productos a base de huevos.	Venta al por mayor de productos a base de huevos.	G4630.22.02	f
2045	Venta al por mayor de aceites y grasas comestibles de origen animal o vegetal.	Venta al por mayor de aceites y grasas comestibles de origen animal o vegetal.	G4630.23.01	f
2046	Venta al por mayor de carne y productos cárnicos.	Venta al por mayor de carne y productos cárnicos.	G4630.31.01	f
2047	Venta al por mayor de carne y productos cárnicos.	Venta al por mayor de carne y productos cárnicos.	G4630.31.01	f
2048	Venta al por mayor de carnes de aves de corral.	Venta al por mayor de carnes de aves de corral.	G4630.31.02	f
2049	Venta al por mayor de camarón y langostinos.	Venta al por mayor de camarón y langostinos.	G4630.32.01	f
2050	Venta al por mayor de pescado, crustáceos, moluscos y productos de la pesca.	Venta al por mayor de pescado, crustáceos, moluscos y productos de la pesca.	G4630.33.01	f
2051	Venta al por mayor de productos de la caza.	Venta al por mayor de productos de la caza.	G4630.34.01	f
2054	Venta al por mayor de productos de confitería.	Venta al por mayor de productos de confitería.	G4630.92.02	f
2055	Venta al por mayor de chocolate.	Venta al por mayor de chocolate.	G4630.92.03	f
2056	Venta al por mayor de productos de panadería.	Venta al por mayor de productos de panadería.	G4630.93.01	f
2057	Venta al por mayor de productos de repostería.	Venta al por mayor de productos de repostería.	G4630.93.02	f
2058	Venta al por mayor de bebidas no alcohólicas (jugos, gaseosas, agua mineral, etcétera).	Venta al por mayor de bebidas no alcohólicas (jugos, gaseosas, agua mineral, etcétera).	G4630.94.01	f
2059	Venta al por mayor de bebidas alcohólicas, incluso el envasado de vino a granel sin transformación.	Venta al por mayor de bebidas alcohólicas, incluso el envasado de vino a granel sin transformación.	G4630.95.01	f
2061	Venta al por mayor de alimento para mascotas (animales domésticos).	Venta al por mayor de alimento para mascotas (animales domésticos).	G4630.97.01	f
2062	Venta al por mayor de otros productos comestibles (enlatados y conservas).	Venta al por mayor de otros productos comestibles (enlatados y conservas).	G4630.99.01	f
2063	Venta al por mayor de hilos (hilados), lanas  y tejidos (telas).	Venta al por mayor de hilos (hilados), lanas  y tejidos (telas).	G4641.11.01	f
2064	Venta al por mayor de lencería para el hogar cortinas, visillos, mantelería, toallas y diversos artículos domésticos.	Venta al por mayor de lencería para el hogar cortinas, visillos, mantelería, toallas y diversos artículos domésticos.	G4641.12.01	f
2065	Venta al por mayor de artículos de mercerías: agujas, hilo de costura, botones, cierres, cintas, encajes, alfileres, etcétera.	Venta al por mayor de artículos de mercerías: agujas, hilo de costura, botones, cierres, cintas, encajes, alfileres, etcétera.	G4641.13.01	f
2066	Venta al por mayor de prendas de vestir, incluidas prendas (ropa) deportivas.	Venta al por mayor de prendas de vestir, incluidas prendas (ropa) deportivas.	G4641.21.01	f
2067	Venta al por mayor de accesorios de vestir guantes, corbatas, incluye paraguas y tirantes.	Venta al por mayor de accesorios de vestir guantes, corbatas, incluye paraguas y tirantes.	G4641.22.01	f
2068	Venta al por mayor de prendas de cuero.	Venta al por mayor de prendas de cuero.	G4641.23.01	f
2069	Venta al por mayor de prendas de piel.	Venta al por mayor de prendas de piel.	G4641.23.02	f
2070	Venta al por mayor de artículos de bazar en general.	Venta al por mayor de artículos de bazar en general.	G4641.24.01	f
2071	Venta al por mayor de artículos de bazar en general.	Venta al por mayor de artículos de bazar en general.	G4641.24.01	f
2072	Venta al por mayor de calzado.	Venta al por mayor de calzado.	G4641.31.01	f
2073	Venta al por mayor de artículos de cuero (con pelo natural).	Venta al por mayor de artículos de cuero (con pelo natural).	G4641.32.01	f
2074	Venta al por mayor de productos de zapatería: plantillas, taloneras y artículos análogos.	Venta al por mayor de productos de zapatería: plantillas, taloneras y artículos análogos.	G4641.33.01	f
2075	Venta al por mayor de electrodomésticos: refrigeradoras, cocinas, lavadoras, etcétera.	Venta al por mayor de electrodomésticos: refrigeradoras, cocinas, lavadoras, etcétera.	G4649.11.01	f
2076	Venta al por mayor de aparatos de uso doméstico: Incluye equipos de televisión, estéreos (equipos de sonido), equipos de grabación y reproductores de CD y DVD.	Venta al por mayor de aparatos de uso doméstico: Incluye equipos de televisión, estéreos (equipos de sonido), equipos de grabación y reproductores de CD y DVD.	G4649.11.02	f
2077	Venta al por mayor de aparatos de uso doméstico: cintas de audio y video CDs, DVD grabadas.	Venta al por mayor de aparatos de uso doméstico: cintas de audio y video CDs, DVD grabadas.	G4649.11.03	f
2078	Venta al por mayor de artículos y accesorios fotográficos.	Venta al por mayor de artículos y accesorios fotográficos.	G4649.12.01	f
2079	Venta al por mayor de artículos y accesorios ópticos (lentes de sol, binoculares, lupas).	Venta al por mayor de artículos y accesorios ópticos (lentes de sol, binoculares, lupas).	G4649.12.02	f
2080	Venta al por mayor de muebles de hogar.	Venta al por mayor de muebles de hogar.	G4649.13.01	f
2081	Venta al por mayor de colchones.	Venta al por mayor de colchones.	G4649.13.02	f
2082	Venta al por mayor de alfombras.	Venta al por mayor de alfombras.	G4649.13.03	f
2083	Venta al por mayor de equipos de iluminación.	Venta al por mayor de equipos de iluminación.	G4649.14.01	f
2084	Venta al por mayor de artefactos de iluminación.	Venta al por mayor de artefactos de iluminación.	G4649.14.02	f
2085	Venta al por mayor de juegos de luces para árboles de navidad.	Venta al por mayor de juegos de luces para árboles de navidad.	G4649.15.01	f
2086	Venta al por mayor de productos de perfumería, cosméticos (productos de belleza) artículos de uso personal (jabones).	Venta al por mayor de productos de perfumería, cosméticos (productos de belleza) artículos de uso personal (jabones).	G4649.21.01	f
2087	Venta al por mayor de cosméticos (productos de belleza).	Venta al por mayor de cosméticos (productos de belleza).	G4649.21.02	f
2088	Venta al por mayor de artículos de uso personal (jabones).	Venta al por mayor de artículos de uso personal (jabones).	G4649.21.03	f
2089	Venta al por mayor de productos farmacéuticos.	Venta al por mayor de productos farmacéuticos.	G4649.22.01	f
2090	Venta al por mayor de productos veterinarios.	Venta al por mayor de productos veterinarios.	G4649.22.02	f
2091	Venta al por mayor de productos medicinales (naturistas).	Venta al por mayor de productos medicinales (naturistas).	G4649.23.01	f
2092	Venta al por mayor de instrumentos, dispositivos, materiales médicos y quirúrgicos, dentales.	Venta al por mayor de instrumentos, dispositivos, materiales médicos y quirúrgicos, dentales.	G4649.24.01	f
2093	Venta al por mayor de artículos ortopédicos.	Venta al por mayor de artículos ortopédicos.	G4649.24.02	f
2094	Venta al por mayor de artículos de madera.	Venta al por mayor de artículos de madera.	G4649.91.01	f
2095	Venta al por mayor de artículos de corcho.	Venta al por mayor de artículos de corcho.	G4649.91.02	f
2096	Venta al por mayor de artículos de mimbre.	Venta al por mayor de artículos de mimbre.	G4649.91.03	f
2097	Venta al por mayor de artículos de tonelería, etcétera.	Venta al por mayor de artículos de tonelería, etcétera.	G4649.91.04	f
2098	Venta al por mayor de bicicletas, partes y accesorios incluyen los artículos deportivos.	Venta al por mayor de bicicletas, partes y accesorios incluyen los artículos deportivos.	G4649.92.01	f
2099	Venta al por mayor de material de papelería.	Venta al por mayor de material de papelería.	G4649.93.01	f
2101	Venta al por mayor de revistas.	Venta al por mayor de revistas.	G4649.93.03	f
2102	Venta al por mayor de periódicos.	Venta al por mayor de periódicos.	G4649.93.04	f
2103	Venta al por mayor de útiles de escritorio.	Venta al por mayor de útiles de escritorio.	G4649.93.05	f
2104	Venta al por mayor de artículos de cuero.	Venta al por mayor de artículos de cuero.	G4649.94.01	f
2105	Venta al por mayor de accesorios de viaje.	Venta al por mayor de accesorios de viaje.	G4649.94.02	f
2106	Venta al por mayor de artículos de porcelana.	Venta al por mayor de artículos de porcelana.	G4649.95.01	f
2108	Venta al por mayor de artículos de cristalería.	Venta al por mayor de artículos de cristalería.	G4649.95.03	f
2109	Venta al por mayor de artículos de plástico.	Venta al por mayor de artículos de plástico.	G4649.95.04	f
2110	Venta al por mayor de artículos de caucho.	Venta al por mayor de artículos de caucho.	G4649.95.05	f
2111	Venta al por mayor de artículos artículos ornamentales.	Venta al por mayor de artículos artículos ornamentales.	G4649.95.06	f
2112	Venta al por mayor de artículos de cubertería (cubiertos), vajilla, incluido desechables.	Venta al por mayor de artículos de cubertería (cubiertos), vajilla, incluido desechables.	G4649.95.07	f
2113	Venta al por mayor de artículos de limpieza.	Venta al por mayor de artículos de limpieza.	G4649.96.01	f
2114	Venta al por mayor de productos de limpieza.	Venta al por mayor de productos de limpieza.	G4649.96.02	f
2115	Venta al por mayor de relojes.	Venta al por mayor de relojes.	G4649.97.01	f
2117	Venta al por mayor de bisutería.	Venta al por mayor de bisutería.	G4649.97.03	f
2122	Venta al por mayor de partituras, etcétera.	Venta al por mayor de partituras, etcétera.	G4649.99.04	f
2123	Venta al por mayor de computadoras y equipo periférico.	Venta al por mayor de computadoras y equipo periférico.	G4651.01.01	f
2124	Venta al por mayor de programas informáticos (software).	Venta al por mayor de programas informáticos (software).	G4651.02.01	f
2125	Venta al por mayor de válvulas y tubos electrónicos, dispositivos de semiconductores, microchips, circuitos integrados y de impresión.	Venta al por mayor de válvulas y tubos electrónicos, dispositivos de semiconductores, microchips, circuitos integrados y de impresión.	G4652.01.01	f
2126	Venta al por mayor de teléfonos y equipos de comunicación.	Venta al por mayor de teléfonos y equipos de comunicación.	G4652.02.01	f
2127	Venta al por mayor de partes y piezas para aparatos y equipos de comunicación.	Venta al por mayor de partes y piezas para aparatos y equipos de comunicación.	G4652.02.02	f
2128	Venta al por mayor de cintas y disquetes de sonido y de vídeo no grabadas.	Venta al por mayor de cintas y disquetes de sonido y de vídeo no grabadas.	G4652.03.01	f
2129	Venta al por mayor de discos magnéticos y ópticos (CD, DVD) de sonido y de vídeo no grabadas.	Venta al por mayor de discos magnéticos y ópticos (CD, DVD) de sonido y de vídeo no grabadas.	G4652.03.02	f
2130	Venta al por mayor de maquinaria y equipo agropecuarios: arados, esparcidoras de estiércol, sembradoras, cosechadoras, trilladoras, máquinas de ordeñar, máquinas utilizadas en la avicultura y la apicultura, tractores utilizados en actividades agropecuarias y silvícolas, segadoras de césped de todo tipo, etcétera.	Venta al por mayor de maquinaria y equipo agropecuarios: arados, esparcidoras de estiércol, sembradoras, cosechadoras, trilladoras, máquinas de ordeñar, máquinas utilizadas en la avicultura y la apicultura, tractores utilizados en actividades agropecuarias y silvícolas, segadoras de césped de todo tipo, etcétera.	G4653.01.01	f
2131	Venta al por mayor de maquinaria y equipo agropecuarios: arados, esparcidoras de estiércol,  trilladoras, máquinas de ordeñar, máquinas utilizadas en la avicultura y la apicultura, tractores utilizados en actividades agropecuarias y silvícolas, etcétera.	Venta al por mayor de maquinaria y equipo agropecuarios: arados, esparcidoras de estiércol,  trilladoras, máquinas de ordeñar, máquinas utilizadas en la avicultura y la apicultura, tractores utilizados en actividades agropecuarias y silvícolas, etcétera.	G4653.01.02	f
2132	Venta al por mayor de maquinaria y equipo de oficina: calculadora, máquinas de escribir, contadora de monedas, excepto computadoras y equipo informático.	Venta al por mayor de maquinaria y equipo de oficina: calculadora, máquinas de escribir, contadora de monedas, excepto computadoras y equipo informático.	G4659.11.01	f
2133	Venta al por mayor de muebles de oficina.	Venta al por mayor de muebles de oficina.	G4659.12.01	f
2134	Venta al por mayor de máquinas herramienta controladas o no por computadora para la industria textil, incluye la venta al por mayor de sus partes y piezas.	Venta al por mayor de máquinas herramienta controladas o no por computadora para la industria textil, incluye la venta al por mayor de sus partes y piezas.	G4659.21.01	f
2135	Venta al por mayor de máquinas herramienta controladas o no por computadora para la industria de la madera, incluye la venta al por mayor de sus partes y piezas.	Venta al por mayor de máquinas herramienta controladas o no por computadora para la industria de la madera, incluye la venta al por mayor de sus partes y piezas.	G4659.21.02	f
2136	Venta al por mayor de máquinas herramienta controladas o no por computadora para la industria de cuero y otras industrias, incluye la venta al por mayor de sus partes y piezas.	Venta al por mayor de máquinas herramienta controladas o no por computadora para la industria de cuero y otras industrias, incluye la venta al por mayor de sus partes y piezas.	G4659.21.03	f
2137	Venta al por mayor de maquinaría y equipos para la minería; incluye partes y piezas.	Venta al por mayor de maquinaría y equipos para la minería; incluye partes y piezas.	G4659.22.01	f
2138	Venta al por mayor de maquinaría y equipos para la construcción; incluye partes y piezas.	Venta al por mayor de maquinaría y equipos para la construcción; incluye partes y piezas.	G4659.22.02	f
2139	Venta al por mayor de máquinas, equípos y herramientas para la metalurgia; incluye partes y piezas.	Venta al por mayor de máquinas, equípos y herramientas para la metalurgia; incluye partes y piezas.	G4659.23.01	f
2140	Venta al por mayor de máquinas para la elaboración de alimentos, bebidas y tabaco (incluso para hoteles y restaurantes), máquinas para lavar, secar y sellar botellas, incluye la venta al por mayor de sus partes y piezas.	Venta al por mayor de máquinas para la elaboración de alimentos, bebidas y tabaco (incluso para hoteles y restaurantes), máquinas para lavar, secar y sellar botellas, incluye la venta al por mayor de sus partes y piezas.	G4659.24.01	f
2141	Venta al por mayor de equipo de transporte (lanchas, aviones, trenes, etcétera.) excepto vehículos motorizados, motocicletas y bicicletas.	Venta al por mayor de equipo de transporte (lanchas, aviones, trenes, etcétera.) excepto vehículos motorizados, motocicletas y bicicletas.	G4659.91.01	f
2142	Venta al por mayor de instrumentos y equipo de medición y precisión.	Venta al por mayor de instrumentos y equipo de medición y precisión.	G4659.92.01	f
2143	Venta al por mayor de equipo eléctrico como: motores eléctricos, transformadores, (incluye bombas para líquidos), cables, conmutadores y de otros tipos de equipo de instalación de uso industrial, incluso partes y piezas.	Venta al por mayor de equipo eléctrico como: motores eléctricos, transformadores, (incluye bombas para líquidos), cables, conmutadores y de otros tipos de equipo de instalación de uso industrial, incluso partes y piezas.	G4659.93.01	f
2144	Venta al por mayor de equipo médico, incluso partes y piezas y materiales conexos.	Venta al por mayor de equipo médico, incluso partes y piezas y materiales conexos.	G4659.94.01	f
2145	Venta al por mayor de equipo de laboratorio.	Venta al por mayor de equipo de laboratorio.	G4659.94.02	f
2146	Venta al por mayor de equipo de seguridad, incluso partes y piezas y materiales conexos.	Venta al por mayor de equipo de seguridad, incluso partes y piezas y materiales conexos.	G4659.95.01	f
2147	Venta al por mayor de equipo de refrigeración, incluso partes, piezas y materiales conexos.	Venta al por mayor de equipo de refrigeración, incluso partes, piezas y materiales conexos.	G4659.96.01	f
2148	Venta al por mayor de equipo de calefacción, incluso partes, piezas y materiales conexos.	Venta al por mayor de equipo de calefacción, incluso partes, piezas y materiales conexos.	G4659.97.01	f
2149	Venta al por mayor de equipo para imprenta, incluso partes, piezas y materiales conexos.	Venta al por mayor de equipo para imprenta, incluso partes, piezas y materiales conexos.	G4659.98.01	f
2150	Venta al por mayor de máquinas herramienta de cualquier tipo y para cualquier material: madera, acero, etcétera.	Venta al por mayor de máquinas herramienta de cualquier tipo y para cualquier material: madera, acero, etcétera.	G4659.99.01	f
2151	Venta  al por mayor de otros tipos de maquinaria n.c.p. para uso en la industria, el comercio, la navegación y otros servicios. Incluye venta al por mayor de robots para cadenas de montaje, armas, etcétera.	Venta  al por mayor de otros tipos de maquinaria n.c.p. para uso en la industria, el comercio, la navegación y otros servicios. Incluye venta al por mayor de robots para cadenas de montaje, armas, etcétera.	G4659.99.02	f
2152	Venta al por mayor de petróleo crudo.	Venta al por mayor de petróleo crudo.	G4661.01.01	f
2153	Venta al por mayor de aceite de petróleo.	Venta al por mayor de aceite de petróleo.	G4661.01.02	f
2154	Venta al por mayor de combustibles sólidos: carbón, carbón vegetal, leña madera turba.	Venta al por mayor de combustibles sólidos: carbón, carbón vegetal, leña madera turba.	G4661.02.01	f
2155	Venta al por mayor de combustibles líquidos nafta, gasolina, biocombustible incluye grasas, lubricantes y aceites.	Venta al por mayor de combustibles líquidos nafta, gasolina, biocombustible incluye grasas, lubricantes y aceites.	G4661.03.01	f
2156	Venta al por mayor de combustibles: gases licuados de petróleo, butano y propano.	Venta al por mayor de combustibles: gases licuados de petróleo, butano y propano.	G4661.03.02	f
2157	Venta al por mayor de otros combustibles y productos conexos.	Venta al por mayor de otros combustibles y productos conexos.	G4661.04.01	f
2158	Venta al por mayor de minerales metalíferos ferrosos y no ferrosos; incluye la venta al por mayor de metales no ferrosos en formas primarias.	Venta al por mayor de minerales metalíferos ferrosos y no ferrosos; incluye la venta al por mayor de metales no ferrosos en formas primarias.	G4662.01.01	f
2159	Venta al por mayor de metales ferrosos en formas primarias.	Venta al por mayor de metales ferrosos en formas primarias.	G4662.01.02	f
2160	Venta al por mayor de productos semiacabados de metales ferrosos y no ferrosos n.c.p.	Venta al por mayor de productos semiacabados de metales ferrosos y no ferrosos n.c.p.	G4662.02.01	f
2161	Venta al por mayor de oro y otros metales preciosos.	Venta al por mayor de oro y otros metales preciosos.	G4662.03.01	f
2162	Venta al por mayor de productos de acero.	Venta al por mayor de productos de acero.	G4662.04.01	f
2163	Venta al por mayor de madera no trabajada (en bruto).	Venta al por mayor de madera no trabajada (en bruto).	G4663.11.01	f
2164	Venta al por mayor de productos de la elaboración primaria de madera: tableros aglomerados.	Venta al por mayor de productos de la elaboración primaria de madera: tableros aglomerados.	G4663.11.02	f
2165	Venta al por mayor de pintura, barnices y lacas.	Venta al por mayor de pintura, barnices y lacas.	G4663.12.01	f
2166	Venta al por mayor de materiales de construcción: piedra, arena, grava, cemento, etcétera.	Venta al por mayor de materiales de construcción: piedra, arena, grava, cemento, etcétera.	G4663.13.01	f
2167	Venta al por mayor de papel tapiz y revestimiento de pisos (baldosas, linóleo).	Venta al por mayor de papel tapiz y revestimiento de pisos (baldosas, linóleo).	G4663.14.01	f
2168	Venta al por mayor de vidrio plano y espejos.	Venta al por mayor de vidrio plano y espejos.	G4663.15.01	f
2169	Venta al por mayor de artículos de ferreterías y cerraduras: martillos, sierras, destornilladores, y otras herramientas de mano, accesorios y dispositivos; cajas fuertes, extintores.	Venta al por mayor de artículos de ferreterías y cerraduras: martillos, sierras, destornilladores, y otras herramientas de mano, accesorios y dispositivos; cajas fuertes, extintores.	G4663.21.01	f
2170	Venta al por mayor de aparatos, accesorios de calefacción y calentadores de agua.	Venta al por mayor de aparatos, accesorios de calefacción y calentadores de agua.	G4663.22.01	f
2171	Venta al por mayor de equipo sanitario y fontanería (bañeras, inodoros, lavabos tocadores y otra porcelana sanitaria) incluye artículos para la instalación sanitaria: tubos, tuberías, accesorios, grifos, derivaciones, conexiones, tuberías de caucho, etcétera.	Venta al por mayor de equipo sanitario y fontanería (bañeras, inodoros, lavabos tocadores y otra porcelana sanitaria) incluye artículos para la instalación sanitaria: tubos, tuberías, accesorios, grifos, derivaciones, conexiones, tuberías de caucho, etcétera.	G4663.23.01	f
2172	VENTA AL POR MAYOR DE MATERIAL ELECTRICO.	VENTA AL POR MAYOR DE MATERIAL ELECTRICO.	G4663.24.01	f
2173	Venta al por mayor de productos químicos industriales: anilina, tinta de impresión, aceites esenciales, gases industriales (oxígeno), pegamento químico, colorantes, resina sintética, metanol, parafina, aromatizantes y potenciadores del sabor, soda cáustica, sal industrial, ácidos y sulfuros, derivados de almidón, etcétera.	Venta al por mayor de productos químicos industriales: anilina, tinta de impresión, aceites esenciales, gases industriales (oxígeno), pegamento químico, colorantes, resina sintética, metanol, parafina, aromatizantes y potenciadores del sabor, soda cáustica, sal industrial, ácidos y sulfuros, derivados de almidón, etcétera.	G4669.11.01	f
2175	Venta al por mayor de productos químicos de uso agrícola.	Venta al por mayor de productos químicos de uso agrícola.	G4669.12.02	f
2176	Venta al por mayor de sustancias adhesivas.	Venta al por mayor de sustancias adhesivas.	G4669.13.01	f
2177	Venta al por mayor de productos orgánicos.	Venta al por mayor de productos orgánicos.	G4669.13.02	f
2178	Venta al por mayor de productos inorgánicos.	Venta al por mayor de productos inorgánicos.	G4669.13.03	f
2179	Venta al por mayor de otros productos químicos n.c.p.	Venta al por mayor de otros productos químicos n.c.p.	G4669.13.04	f
2180	Venta al por mayor de materiales plásticos en formas primarias.	Venta al por mayor de materiales plásticos en formas primarias.	G4669.21.01	f
2181	Venta al por mayor de materiales de caucho, etcétera.	Venta al por mayor de materiales de caucho, etcétera.	G4669.21.02	f
2182	Venta al por mayor de fibras textiles, etcétera.	Venta al por mayor de fibras textiles, etcétera.	G4669.21.03	f
2183	Venta al por mayor del papel y cartón.	Venta al por mayor del papel y cartón.	G4669.22.01	f
2184	Venta al por mayor de piedras preciosas, productos abrasivos y otros minerales.	Venta al por mayor de piedras preciosas, productos abrasivos y otros minerales.	G4669.23.01	f
2213	Venta al por menor de combustibles para vehículos automotores y motocicletas en establecimientos especializados.	Venta al por menor de combustibles para vehículos automotores y motocicletas en establecimientos especializados.	G4730.01.01	f
2765	Servicios de vehículos blindados (transporte de valores).	Servicios de vehículos blindados (transporte de valores).	N8010.01.01	f
2185	Venta al por mayor de desperdicios y desechos, chatarra metálica y de materiales para el reciclado, incluido la recolección, clasificación, separación y el desguace de productos usados, como: automóviles, ordenadores, aparatos de televisión y otros tipos de equipo, para obtener partes y piezas reutilizables. El embalaje y reembalaje, almacenamiento y entrega, aunque sin un proceso de transformación real. Además, los materiales comprados y vendidos tienen un valor remanente.	Venta al por mayor de desperdicios y desechos, chatarra metálica y de materiales para el reciclado, incluido la recolección, clasificación, separación y el desguace de productos usados, como: automóviles, ordenadores, aparatos de televisión y otros tipos de equipo, para obtener partes y piezas reutilizables. El embalaje y reembalaje, almacenamiento y entrega, aunque sin un proceso de transformación real. Además, los materiales comprados y vendidos tienen un valor remanente.	G4669.30.01	f
2186	Actividades de venta de materiales procedentes de estructuras demolidas.	Actividades de venta de materiales procedentes de estructuras demolidas.	G4669.30.02	f
2187	Venta al por mayor de otros productos intermedios n.c.p.	Venta al por mayor de otros productos intermedios n.c.p.	G4669.31.01	f
2188	Venta al por mayor de otros productos metálicos elaborados, (excepto maquinaria y equipo), excepto los prestados a comisión o por contrato.	Venta al por mayor de otros productos metálicos elaborados, (excepto maquinaria y equipo), excepto los prestados a comisión o por contrato.	G4669.40.01	f
2189	Venta al por mayor de diversos productos sin especialización.	Venta al por mayor de diversos productos sin especialización.	G4690.00.01	f
2190	Venta al por mayor de otros productos diversos para el consumidor.	Venta al por mayor de otros productos diversos para el consumidor.	G4690.00.02	f
2191	Venta al por menor de gran variedad de productos en tiendas, entre los que predominan, los productos alimenticios, las bebidas o el tabaco, como productos de primera necesidad y varios otros tipos de productos.	Venta al por menor de gran variedad de productos en tiendas, entre los que predominan, los productos alimenticios, las bebidas o el tabaco, como productos de primera necesidad y varios otros tipos de productos.	G4711.01.01	f
2192	Venta al por menor de gran variedad de productos en supermercados, entre los que predominan, los productos alimenticios, las bebidas o el tabaco, como productos de primera necesidad y varios otros tipos de productos, como prendas de vestir, muebles, aparatos, artículos de ferretería, cosméticos, etcétera.	Venta al por menor de gran variedad de productos en supermercados, entre los que predominan, los productos alimenticios, las bebidas o el tabaco, como productos de primera necesidad y varios otros tipos de productos, como prendas de vestir, muebles, aparatos, artículos de ferretería, cosméticos, etcétera.	G4711.02.01	f
2193	Venta al por menor de gran variedad de productos entre los que no predominan los productos alimenticios, las bebidas o el tabaco, actividades de venta de: prendas de vestir, muebles, aparatos, artículos de ferretería, cosméticos, artículos de joyería y bisutería, juguetes, artículos de deporte, etcétera.	Venta al por menor de gran variedad de productos entre los que no predominan los productos alimenticios, las bebidas o el tabaco, actividades de venta de: prendas de vestir, muebles, aparatos, artículos de ferretería, cosméticos, artículos de joyería y bisutería, juguetes, artículos de deporte, etcétera.	G4719.00.01	f
2194	Venta al por menor de frutas frescas en establecimientos especializados.	Venta al por menor de frutas frescas en establecimientos especializados.	G4721.01.01	f
2195	Venta al por menor de frutas, legumbres y hortalizas frescas  en conserva en establecimientos especializados.	Venta al por menor de frutas, legumbres y hortalizas frescas  en conserva en establecimientos especializados.	G4721.01.02	f
2196	Venta al por menor de verduras, legumbres y hortalizas frescas en establecimientos especializados.	Venta al por menor de verduras, legumbres y hortalizas frescas en establecimientos especializados.	G4721.01.03	f
2197	Venta al por menor de lácteos en establecimientos especializados.	Venta al por menor de lácteos en establecimientos especializados.	G4721.02.01	f
2198	Venta al por menor de huevos en establecimientos especializados.	Venta al por menor de huevos en establecimientos especializados.	G4721.03.01	f
2199	Venta al por menor de pescado, crustáceos, moluscos y productos de la pesca en establecimientos especializados.	Venta al por menor de pescado, crustáceos, moluscos y productos de la pesca en establecimientos especializados.	G4721.04.01	f
2200	Venta al por menor de productos de panadería en establecimientos especializados.	Venta al por menor de productos de panadería en establecimientos especializados.	G4721.05.01	f
2202	Venta al por menor de productos de confitería en establecimientos especializados.	Venta al por menor de productos de confitería en establecimientos especializados.	G4721.05.03	f
2203	Venta al por menor de productos de repostería en establecimientos especializados.	Venta al por menor de productos de repostería en establecimientos especializados.	G4721.05.04	f
2204	Venta al por menor de carne (incluidos los de aves de corral) en establecimientos especializados.	Venta al por menor de carne (incluidos los de aves de corral) en establecimientos especializados.	G4721.06.01	f
2205	Venta al por menor de derivados de la carne.	Venta al por menor de derivados de la carne.	G4721.06.02	f
2206	Venta al por menor de productos cárnicos en establecimientos especializados.	Venta al por menor de productos cárnicos en establecimientos especializados.	G4721.06.03	f
2207	Venta al por menor de otros productos alimenticios en establecimientos especializados.	Venta al por menor de otros productos alimenticios en establecimientos especializados.	G4721.09.01	f
2208	Venta al por menor de bebidas no alcohólicas (no destinadas al consumo en el lugar de venta) en establecimientos especializados, bolos, helados, hielo, etcétera.	Venta al por menor de bebidas no alcohólicas (no destinadas al consumo en el lugar de venta) en establecimientos especializados, bolos, helados, hielo, etcétera.	G4722.01.01	f
2209	Venta al por menor de bebidas alcohólicas (no destinadas al consumo en el lugar de venta) en establecimientos especializados.	Venta al por menor de bebidas alcohólicas (no destinadas al consumo en el lugar de venta) en establecimientos especializados.	G4722.02.01	f
2210	Venta al por menor de otras bebidas en almacenes especializados.	Venta al por menor de otras bebidas en almacenes especializados.	G4722.03.01	f
2211	Venta al por menor de productos de tabaco en establecimientos especializados.	Venta al por menor de productos de tabaco en establecimientos especializados.	G4723.00.01	f
2212	Venta al por menor de tabaco en establecimientos especializados.	Venta al por menor de tabaco en establecimientos especializados.	G4723.00.02	f
64	Cultivo de cacao.	Cultivo de cacao.	A0127.02.01	t
2214	Venta al por menor de productos de limpieza, lubricantes y refrigerantes para vehículos automotores en establecimientos especializados.	Venta al por menor de productos de limpieza, lubricantes y refrigerantes para vehículos automotores en establecimientos especializados.	G4730.02.01	f
2215	Venta al por menor de computadoras en establecimientos especializados.	Venta al por menor de computadoras en establecimientos especializados.	G4741.11.01	f
2216	Venta al por menor de equipo periférico computacional en establecimientos especializados.	Venta al por menor de equipo periférico computacional en establecimientos especializados.	G4741.11.02	f
2217	Venta al por menor de programas informáticos no personalizados, en establecimientos especializados.	Venta al por menor de programas informáticos no personalizados, en establecimientos especializados.	G4741.12.01	f
2218	Venta al por menor de videojuegos, incluye consolas de videojuegos en establecimientos especializados.	Venta al por menor de videojuegos, incluye consolas de videojuegos en establecimientos especializados.	G4741.12.02	f
2219	Venta al por menor de discos y cintas grabadas en establecimientos especializados.	Venta al por menor de discos y cintas grabadas en establecimientos especializados.	G4741.12.03	f
2220	Venta al por menor de equipos de telecomunicaciones: celulares, tubos electrónicos, etcétera. Incluye partes y piezas en establecimientos especializados.	Venta al por menor de equipos de telecomunicaciones: celulares, tubos electrónicos, etcétera. Incluye partes y piezas en establecimientos especializados.	G4741.13.01	f
2221	Venta al por menor de maquinaria y aparatos eléctricos: motores, generadores, transformadores eléctricos, aparatos de distribución, control de energía eléctrica, cables acumuladores y otro material eléctrico.	Venta al por menor de maquinaria y aparatos eléctricos: motores, generadores, transformadores eléctricos, aparatos de distribución, control de energía eléctrica, cables acumuladores y otro material eléctrico.	G4741.14.01	f
2222	Venta al por menor de otros materiales y equipos.	Venta al por menor de otros materiales y equipos.	G4741.15.01	f
2223	Venta al por menor de equipos de radio en establecimientos especializados.	Venta al por menor de equipos de radio en establecimientos especializados.	G4742.00.01	f
2224	Venta al por menor de equipos de televisión en establecimientos especializados.	Venta al por menor de equipos de televisión en establecimientos especializados.	G4742.00.02	f
2225	Venta al por menor de equipos de estereofónicos, reproductores y grabadores de CD y DVD en establecimientos especializados.	Venta al por menor de equipos de estereofónicos, reproductores y grabadores de CD y DVD en establecimientos especializados.	G4742.00.03	f
2226	Venta al por menor de artículos para el hogar en general.	Venta al por menor de artículos para el hogar en general.	G4742.00.04	f
2227	Venta al por menor de telas, lanas y otros hilados para tejer, en establecimientos especializados.	Venta al por menor de telas, lanas y otros hilados para tejer, en establecimientos especializados.	G4751.01.01	f
2228	Venta al por menor de artículos de mercería (agujas e hilo de coser) en establecimientos especializados.	Venta al por menor de artículos de mercería (agujas e hilo de coser) en establecimientos especializados.	G4751.01.02	f
2229	Venta al por menor de artículos textiles: sábanas, toallas, juegos de mesa en establecimientos especializados.	Venta al por menor de artículos textiles: sábanas, toallas, juegos de mesa en establecimientos especializados.	G4751.02.01	f
2230	Venta al por menor de otros artículos textiles; materiales básicos para hacer alfombras, tapices o bordados en establecimientos especializados.	Venta al por menor de otros artículos textiles; materiales básicos para hacer alfombras, tapices o bordados en establecimientos especializados.	G4751.02.02	f
2231	Venta al por menor de artículos de ferretería: martillos, sierras, destornilladores y pequeñas herramientas en general, equipo y materiales de prefabricados para armado casero (equipo de bricolaje); alambres y cables eléctricos, cerraduras, montajes y adornos, extintores, segadoras de césped de cualquier tipo, etcétera en establecimientos especializados.	Venta al por menor de artículos de ferretería: martillos, sierras, destornilladores y pequeñas herramientas en general, equipo y materiales de prefabricados para armado casero (equipo de bricolaje); alambres y cables eléctricos, cerraduras, montajes y adornos, extintores, segadoras de césped de cualquier tipo, etcétera en establecimientos especializados.	G4752.01.01	f
2232	Venta al por menor de pinturas, barnices y lacas en establecimientos especializados.	Venta al por menor de pinturas, barnices y lacas en establecimientos especializados.	G4752.02.01	f
2233	Venta al por menor de vidrio plano en establecimientos especializados.	Venta al por menor de vidrio plano en establecimientos especializados.	G4752.03.01	f
2234	Venta al por menor de espejos en establecimientos especializados.	Venta al por menor de espejos en establecimientos especializados.	G4752.03.02	f
2235	Venta al por menor de artículos de vidrio en establecimientos especializados.	Venta al por menor de artículos de vidrio en establecimientos especializados.	G4752.03.03	f
2236	Venta al por menor de materiales de construcción como: ladrillos, ripio, cemento, etcétera en establecimientos especializados.	Venta al por menor de materiales de construcción como: ladrillos, ripio, cemento, etcétera en establecimientos especializados.	G4752.04.01	f
2237	Venta al por menor de materiales de construcción de madera en establecimientos especializados.	Venta al por menor de materiales de construcción de madera en establecimientos especializados.	G4752.04.02	f
2238	Venta al por menor de materiales de construcción de productos metálicos y no metálicos para estructuras en establecimientos especializados.	Venta al por menor de materiales de construcción de productos metálicos y no metálicos para estructuras en establecimientos especializados.	G4752.04.03	f
2239	Venta al por menor de equipo sanitario y material de fontanería: cañerías, conexiones, tuberías de caucho, accesorios, grifos y material de calefacción y calefones en establecimientos especializados.	Venta al por menor de equipo sanitario y material de fontanería: cañerías, conexiones, tuberías de caucho, accesorios, grifos y material de calefacción y calefones en establecimientos especializados.	G4752.05.01	f
2240	Venta al por menor especializada de otros artículos de ferretería: saunas (baños de calor seco y vapor), etcétera en establecimientos especializados.	Venta al por menor especializada de otros artículos de ferretería: saunas (baños de calor seco y vapor), etcétera en establecimientos especializados.	G4752.09.01	f
2241	Venta al por menor especializada de otros artículos de ferretería: artículos de plástico en establecimientos especializados.	Venta al por menor especializada de otros artículos de ferretería: artículos de plástico en establecimientos especializados.	G4752.09.02	f
2242	Venta al por menor especializada de otros artículos de ferretería: de caucho, en establecimientos especializados.	Venta al por menor especializada de otros artículos de ferretería: de caucho, en establecimientos especializados.	G4752.09.03	f
2243	Venta al por menor de alfombras, tapices, moquetas en establecimientos especializados.	Venta al por menor de alfombras, tapices, moquetas en establecimientos especializados.	G4753.01.01	f
2244	Venta al por menor de cortinas, visillos y tapetes en establecimientos especializados.	Venta al por menor de cortinas, visillos y tapetes en establecimientos especializados.	G4753.01.02	f
2245	Venta al por menor de papel tapiz en establecimientos especializados.	Venta al por menor de papel tapiz en establecimientos especializados.	G4753.02.01	f
2246	Venta al por menor de revestimientos de pisos en establecimientos especializados.	Venta al por menor de revestimientos de pisos en establecimientos especializados.	G4753.02.02	f
2247	Venta al por menor de muebles de uso doméstico, colchones y somieres en establecimientos especializados.	Venta al por menor de muebles de uso doméstico, colchones y somieres en establecimientos especializados.	G4759.01.01	f
2248	Venta al por menor de muebles de uso doméstico, colchones y somieres en establecimientos especializados.	Venta al por menor de muebles de uso doméstico, colchones y somieres en establecimientos especializados.	G4759.01.01	f
2249	Venta al por menor de artículos de iluminación en establecimientos especializados.	Venta al por menor de artículos de iluminación en establecimientos especializados.	G4759.02.01	f
2250	Venta al por menor de artefactos y equipos de iluminación.	Venta al por menor de artefactos y equipos de iluminación.	G4759.02.02	f
2251	Venta al por menor de utensilios de uso doméstico, cubiertos, vajilla en establecimientos especializados.	Venta al por menor de utensilios de uso doméstico, cubiertos, vajilla en establecimientos especializados.	G4759.03.01	f
2252	Venta al por menor de utensilios de cristalería en establecimientos especializados.	Venta al por menor de utensilios de cristalería en establecimientos especializados.	G4759.03.02	f
2253	Venta al por menor de objetos de porcelana y de cerámica en establecimientos especializados.	Venta al por menor de objetos de porcelana y de cerámica en establecimientos especializados.	G4759.03.03	f
2254	Venta al por menor de utensilios de plásticos en establecimientos especializados.	Venta al por menor de utensilios de plásticos en establecimientos especializados.	G4759.03.04	f
2255	Venta al por menor de artículos de madera.	Venta al por menor de artículos de madera.	G4759.04.01	f
2256	Venta al por menor de artículos de mimbre en establecimientos especializados.	Venta al por menor de artículos de mimbre en establecimientos especializados.	G4759.04.02	f
2257	Venta al por menor de artículos de corcho y tonelería en establecimientos especializados.	Venta al por menor de artículos de corcho y tonelería en establecimientos especializados.	G4759.04.03	f
2258	Venta al por menor de artículos desechables en establecimientos especializados.	Venta al por menor de artículos desechables en establecimientos especializados.	G4759.04.04	f
2259	Venta al por menor de electrodomésticos en establecimientos especializados: refrigeradoras, cocinas, microondas, etcétera.	Venta al por menor de electrodomésticos en establecimientos especializados: refrigeradoras, cocinas, microondas, etcétera.	G4759.05.01	f
2260	Venta al por menor de instrumentos musicales y partituras en establecimientos especializados.	Venta al por menor de instrumentos musicales y partituras en establecimientos especializados.	G4759.06.01	f
2261	Venta al por menor de aparatos de uso doméstico n.c.p.	Venta al por menor de aparatos de uso doméstico n.c.p.	G4759.09.01	f
2262	Venta al por menor de otros enseres de uso doméstico n.c.p.	Venta al por menor de otros enseres de uso doméstico n.c.p.	G4759.09.02	f
2263	Venta al por menor de sistemas de seguridad, como dispositivos de cierre, cajas de caudales, vidrios blindados y cajas fuertes, sin servicio de instalación ni de mantenimiento en establecimientos especializados.	Venta al por menor de sistemas de seguridad, como dispositivos de cierre, cajas de caudales, vidrios blindados y cajas fuertes, sin servicio de instalación ni de mantenimiento en establecimientos especializados.	G4759.09.03	f
2264	Venta al por menor de libros de todo tipo en establecimientos especializados.	Venta al por menor de libros de todo tipo en establecimientos especializados.	G4761.01.01	f
2265	Venta al por menor de periódicos en establecimientos especializados.	Venta al por menor de periódicos en establecimientos especializados.	G4761.02.01	f
2266	Venta al por menor de artículos de papelería como lápices, bolígrafos, papel, etcétera, en establecimientos especializados.	Venta al por menor de artículos de papelería como lápices, bolígrafos, papel, etcétera, en establecimientos especializados.	G4761.03.01	f
2267	Venta al por menor de artículos de oficina en establecimientos especializados.	Venta al por menor de artículos de oficina en establecimientos especializados.	G4761.03.02	f
2268	VENTA AL POR MENOR DE REVISTAS.	VENTA AL POR MENOR DE REVISTAS.	G4761.04.01	f
2304	Venta al por menor de tarjetas electrónicas en establecimientos especializados.	Venta al por menor de tarjetas electrónicas en establecimientos especializados.	G4773.95.02	f
2269	Venta al por menor de discos de vinilo, cintas magnetofónicas, discos compactos y casetes de música, cintas de vídeo y DVD, cintas y discos en blanco en establecimientos especializados.	Venta al por menor de discos de vinilo, cintas magnetofónicas, discos compactos y casetes de música, cintas de vídeo y DVD, cintas y discos en blanco en establecimientos especializados.	G4762.00.01	f
2270	Venta al por menor de artículos de deporte, de pesca y de acampada y embarcaciones en establecimientos especializados.	Venta al por menor de artículos de deporte, de pesca y de acampada y embarcaciones en establecimientos especializados.	G4763.00.01	f
2271	Venta al por menor de bicicletas en establecimientos especializados.	Venta al por menor de bicicletas en establecimientos especializados.	G4763.00.02	f
2272	Venta al por menor de juegos y juguetes de todos los materiales en establecimientos especializados.	Venta al por menor de juegos y juguetes de todos los materiales en establecimientos especializados.	G4764.00.01	f
2273	Venta al por menor de prendas de vestir y peletería en establecimientos especializados.	Venta al por menor de prendas de vestir y peletería en establecimientos especializados.	G4771.11.01	f
2274	Venta al por menor de prendas de peletería en establecimientos especializados.	Venta al por menor de prendas de peletería en establecimientos especializados.	G4771.11.02	f
2367	Otras formas de transportación aérea no regular de carga internacional.	Otras formas de transportación aérea no regular de carga internacional.	H5120.05.01	f
2275	Venta al por menor de accesorios de vestir en establecimientos especializados.	Venta al por menor de accesorios de vestir en establecimientos especializados.	G4771.12.01	f
2276	Venta al por menor de calzado en establecimientos especializados.	Venta al por menor de calzado en establecimientos especializados.	G4771.21.01	f
2277	Venta al por menor de material de zapatería (plantillas, taloneras, suela y artículos análogos) en establecimientos especializados.	Venta al por menor de material de zapatería (plantillas, taloneras, suela y artículos análogos) en establecimientos especializados.	G4771.21.02	f
2278	Venta al por menor de artículos de cuero y sustitutos, excepto prendas de vestir en establecimientos especializados.	Venta al por menor de artículos de cuero y sustitutos, excepto prendas de vestir en establecimientos especializados.	G4771.22.01	f
2279	Venta al por menor de accesorios de viaje en establecimientos especializados.	Venta al por menor de accesorios de viaje en establecimientos especializados.	G4771.22.02	f
2280	Venta al por menor de productos farmacéuticos en establecimientos especializados.	Venta al por menor de productos farmacéuticos en establecimientos especializados.	G4772.01.01	f
2281	Venta al por menor de productos ortopédicos.	Venta al por menor de productos ortopédicos.	G4772.01.02	f
2282	Venta al por menor de productos naturistas en establecimientos especializados.	Venta al por menor de productos naturistas en establecimientos especializados.	G4772.02.01	f
2283	Venta al por menor de instrumentos y aparatos medicinales y ortopédicos en establecimientos especializados.	Venta al por menor de instrumentos y aparatos medicinales y ortopédicos en establecimientos especializados.	G4772.03.01	f
2284	Venta al por menor de productos veterinarios en establecimientos especializados.	Venta al por menor de productos veterinarios en establecimientos especializados.	G4772.04.01	f
2285	Venta al por menor de perfumes y artículos cosméticos en establecimientos especializados.	Venta al por menor de perfumes y artículos cosméticos en establecimientos especializados.	G4772.05.01	f
2286	Venta al por menor de pañales y artículos de uso personal en establecimientos especializados.	Venta al por menor de pañales y artículos de uso personal en establecimientos especializados.	G4772.05.02	f
2287	Venta al por menor de equipo fotográfico en establecimientos especializados.	Venta al por menor de equipo fotográfico en establecimientos especializados.	G4773.11.01	f
2288	Venta al por menor de equipo de precisión en establecimientos especializados.	Venta al por menor de equipo de precisión en establecimientos especializados.	G4773.11.02	f
2289	Venta al por menor de equipo óptico y actividades de las ópticas en establecimientos especializados.	Venta al por menor de equipo óptico y actividades de las ópticas en establecimientos especializados.	G4773.12.01	f
2290	Venta al por menor de flores en establecimientos especializados, incluso arreglos florales.	Venta al por menor de flores en establecimientos especializados, incluso arreglos florales.	G4773.21.01	f
2291	Venta al por menor de plantas en establecimientos especializados.	Venta al por menor de plantas en establecimientos especializados.	G4773.21.02	f
2292	Venta al por menor de semillas en establecimientos especializados.	Venta al por menor de semillas en establecimientos especializados.	G4773.21.03	f
2293	Venta al por menor de fertilizantes en establecimientos especializados.	Venta al por menor de fertilizantes en establecimientos especializados.	G4773.22.01	f
2294	Venta al por menor de balanceados y abonos en establecimientos especializados.	Venta al por menor de balanceados y abonos en establecimientos especializados.	G4773.22.02	f
2295	Venta al por menor de mascotas en establecimientos especializados.	Venta al por menor de mascotas en establecimientos especializados.	G4773.23.01	f
2296	Venta al por menor de alimento para mascotas en establecimientos especializados.	Venta al por menor de alimento para mascotas en establecimientos especializados.	G4773.23.02	f
2297	Venta al por menor de recuerdos, sellos, monedas, artículos religiosos y artesanía en establecimientos especializados.	Venta al por menor de recuerdos, sellos, monedas, artículos religiosos y artesanía en establecimientos especializados.	G4773.91.01	f
2298	Actividades de galerías de arte comerciales en establecimientos especializados.	Actividades de galerías de arte comerciales en establecimientos especializados.	G4773.92.01	f
2299	Venta al por menor de fuel para uso doméstico en establecimientos especializados.	Venta al por menor de fuel para uso doméstico en establecimientos especializados.	G4773.93.01	f
2300	Venta al por menor de gas en bombonas para uso doméstico en establecimientos especializados.	Venta al por menor de gas en bombonas para uso doméstico en establecimientos especializados.	G4773.93.02	f
2301	Venta al por menor de carbón y leña para uso doméstico en establecimientos especializados.	Venta al por menor de carbón y leña para uso doméstico en establecimientos especializados.	G4773.93.03	f
2302	Venta al por menor de relojes y joyas en establecimientos especializados.	Venta al por menor de relojes y joyas en establecimientos especializados.	G4773.94.01	f
2303	Venta al por menor de recargas electrónicas en establecimientos especializados.	Venta al por menor de recargas electrónicas en establecimientos especializados.	G4773.95.01	f
2359	Transporte aéreo local de carga con itinerarios y horarios establecidos.	Transporte aéreo local de carga con itinerarios y horarios establecidos.	H5120.01.01	f
2305	Venta al por menor de productos para fiestas infantiles en establecimientos especializados.	Venta al por menor de productos para fiestas infantiles en establecimientos especializados.	G4773.96.01	f
2306	Venta al por menor de productos no alimenticios n.c.p.: materiales de limpieza, armas y municiones, etcétera, en establecimientos especializados.	Venta al por menor de productos no alimenticios n.c.p.: materiales de limpieza, armas y municiones, etcétera, en establecimientos especializados.	G4773.99.01	f
2307	Venta al por menor de libros de segunda mano en establecimientos especializados.	Venta al por menor de libros de segunda mano en establecimientos especializados.	G4774.01.01	f
2308	Venta al por menor de antigüedades en establecimientos especializados.	Venta al por menor de antigüedades en establecimientos especializados.	G4774.02.01	f
2309	Actividades de casas de empeño.	Actividades de casas de empeño.	G4774.03.01	f
2310	Otros tipos de actividades de venta al por menor de artículos de segunda mano, usados, incluidas actividades de casas de subastas de estos artículos en establecimientos especializados.	Otros tipos de actividades de venta al por menor de artículos de segunda mano, usados, incluidas actividades de casas de subastas de estos artículos en establecimientos especializados.	G4774.09.01	f
2311	Venta al por menor de alimentos, bebidas y productos del tabaco en puestos de venta o mercados.	Venta al por menor de alimentos, bebidas y productos del tabaco en puestos de venta o mercados.	G4781.00.01	f
2312	Venta al por menor de productos textiles, prendas de vestir y calzado en puestos de venta.	Venta al por menor de productos textiles, prendas de vestir y calzado en puestos de venta.	G4782.00.01	f
2313	Venta al por menor de productos textiles, prendas de vestir y calzado en mercados.	Venta al por menor de productos textiles, prendas de vestir y calzado en mercados.	G4782.00.02	f
2314	Venta al por menor de otros artículos en puestos de venta como: alfombras, tapices, libros, juegos y juguetes, aparatos electrodomésticos grabaciones de música, video, etcétera.	Venta al por menor de otros artículos en puestos de venta como: alfombras, tapices, libros, juegos y juguetes, aparatos electrodomésticos grabaciones de música, video, etcétera.	G4789.00.01	f
2315	Venta al por menor de otros artículos en mercado como: alfombras, tapices, libros, juegos y juguetes, aparatos electrodomésticos grabaciones de música, video, etcétera.	Venta al por menor de otros artículos en mercado como: alfombras, tapices, libros, juegos y juguetes, aparatos electrodomésticos grabaciones de música, video, etcétera.	G4789.00.02	f
2316	Venta al por menor de cualquier tipo de producto por correo, por internet, incluido subastas por internet, catálogo y envió de productos al cliente.	Venta al por menor de cualquier tipo de producto por correo, por internet, incluido subastas por internet, catálogo y envió de productos al cliente.	G4791.00.01	f
2317	Venta al por menor de cualquier tipo de producto por teléfono, televisión, radio, periódicos y envió de productos al cliente.	Venta al por menor de cualquier tipo de producto por teléfono, televisión, radio, periódicos y envió de productos al cliente.	G4791.00.02	f
2318	Venta al por menor de cualquier tipo de producto no realizada en almacenes ni puestos de mercado: venta directa o por vendedores a domicilio.	Venta al por menor de cualquier tipo de producto no realizada en almacenes ni puestos de mercado: venta directa o por vendedores a domicilio.	G4799.01.01	f
2319	Venta al por menor de cualquier tipo de producto no realizada en almacenes ni puestos de mercado: venta mediante máquinas expendedoras, etcétera.	Venta al por menor de cualquier tipo de producto no realizada en almacenes ni puestos de mercado: venta mediante máquinas expendedoras, etcétera.	G4799.01.02	f
2320	Venta al por menor por comisionistas (no dependientes de comercios); Incluye actividades de casas de subastas (al por menor).	Venta al por menor por comisionistas (no dependientes de comercios); Incluye actividades de casas de subastas (al por menor).	G4799.02.01	f
2321	Venta directa de combustibles (combustible de calefacción, leña, etcétera) con entrega en el domicilio del cliente.	Venta directa de combustibles (combustible de calefacción, leña, etcétera) con entrega en el domicilio del cliente.	G4799.03.01	f
2322	Transporte de pasajeros por ferrocarriles interurbanos, incluye servicios de coches cama y coches restaurante integrados en los servicios de las compañías de ferrocarril.	Transporte de pasajeros por ferrocarriles interurbanos, incluye servicios de coches cama y coches restaurante integrados en los servicios de las compañías de ferrocarril.	H4911.00.01	f
2323	Transporte de carga por líneas principales de ferrocarril.	Transporte de carga por líneas principales de ferrocarril.	H4912.00.01	f
2324	Transporte de carga por líneas secundarias de ferrocarril.	Transporte de carga por líneas secundarias de ferrocarril.	H4912.00.02	f
2325	Transporte terrestre de pasajeros por sistemas de transporte urbano que pueden abarcar líneas de autobús, tranvía, trolebús, metro, ferrocarril elevado, líneas de transporte entre la ciudad y el aeropuerto o la estación etcétera. El transporte se realiza por rutas establecidas siguiendo normalmente un horario fijo, y el embarque y desembarque de pasajeros en paradas establecidas. Incluye la explotación de funiculares, teleféricos, etcétera, que formen parte del sistema de transporte urbano.	Transporte terrestre de pasajeros por sistemas de transporte urbano que pueden abarcar líneas de autobús, tranvía, trolebús, metro, ferrocarril elevado, líneas de transporte entre la ciudad y el aeropuerto o la estación etcétera. El transporte se realiza por rutas establecidas siguiendo normalmente un horario fijo, y el embarque y desembarque de pasajeros en paradas establecidas. Incluye la explotación de funiculares, teleféricos, etcétera, que formen parte del sistema de transporte urbano.	H4921.01.01	f
2326	Transporte terrestre de pasajeros por sistemas de transporte suburbano, que pueden abarcar líneas de parroquial. El transporte se realiza por rutas establecidas siguiendo normalmente un horario fijo, y el embarque y desembarque de pasajeros en paradas establecidas. Incluye la explotación de funiculares, teleféricos, etcétera, que formen parte del sistema de transporte suburbano.	Transporte terrestre de pasajeros por sistemas de transporte suburbano, que pueden abarcar líneas de parroquial. El transporte se realiza por rutas establecidas siguiendo normalmente un horario fijo, y el embarque y desembarque de pasajeros en paradas establecidas. Incluye la explotación de funiculares, teleféricos, etcétera, que formen parte del sistema de transporte suburbano.	H4921.02.01	f
2357	Vuelos panorámicos y turísticos incluye actividades generales de aviación, como: transporte de pasajeros por clubes aéreos con fines de instrucción o de recreo.	Vuelos panorámicos y turísticos incluye actividades generales de aviación, como: transporte de pasajeros por clubes aéreos con fines de instrucción o de recreo.	H5110.02.01	f
2327	Transporte terrestre de pasajeros por sistemas de transporte interurbano, que pueden abarcar líneas de autobús provincial. El transporte se realiza por rutas establecidas siguiendo normalmente un horario fijo, y el embarque y desembarque de pasajeros en paradas establecidas. Incluye la explotación de funiculares, teleféricos, etcétera, que formen parte del sistema de transporte interurbano.	Transporte terrestre de pasajeros por sistemas de transporte interurbano, que pueden abarcar líneas de autobús provincial. El transporte se realiza por rutas establecidas siguiendo normalmente un horario fijo, y el embarque y desembarque de pasajeros en paradas establecidas. Incluye la explotación de funiculares, teleféricos, etcétera, que formen parte del sistema de transporte interurbano.	H4921.02.02	f
2328	Actividades de transporte de pasajeros por carretera: servicios regulares de autobuses de larga distancia servicios de viajes contratados y otros servicios ocasionales de transporte en autobús, tricimotos, servicios de enlace con aeropuertos.	Actividades de transporte de pasajeros por carretera: servicios regulares de autobuses de larga distancia servicios de viajes contratados y otros servicios ocasionales de transporte en autobús, tricimotos, servicios de enlace con aeropuertos.	H4922.01.01	f
2368	Otras formas de transportación aérea no regular de carga local.	Otras formas de transportación aérea no regular de carga local.	H5120.05.02	f
65	Cultivo de té.	Cultivo de té.	A0127.09.01	t
2329	Actividades de transporte de pasajeros por carretera; servicios regulares de excursiones y otros servicios ocasionales de transporte.	Actividades de transporte de pasajeros por carretera; servicios regulares de excursiones y otros servicios ocasionales de transporte.	H4922.01.02	f
2331	Servicios de teleféricos, funiculares, telesillas y telecabinas, si no forman parte de sistemas de transporte urbano o suburbano.	Servicios de teleféricos, funiculares, telesillas y telecabinas, si no forman parte de sistemas de transporte urbano o suburbano.	H4922.03.01	f
2332	Actividades de alquiler de automóviles privados con conductor.	Actividades de alquiler de automóviles privados con conductor.	H4922.04.01	f
2333	Servicios de autobuses escolares y autobuses para el transporte de empleados.	Servicios de autobuses escolares y autobuses para el transporte de empleados.	H4922.05.01	f
2334	Transporte de pasajeros en vehículos de tracción humana.	Transporte de pasajeros en vehículos de tracción humana.	H4922.06.01	f
2335	Transporte de pasajeros en vehículos de tracción animal.	Transporte de pasajeros en vehículos de tracción animal.	H4922.06.02	f
2336	Todas las actividades de transporte de carga por carretera, incluido en camionetas de: troncos, ganado, transporte refrigerado, carga pesada, carga a granel, incluido el transporte en camiones cisterna, automóviles, desperdicios y materiales de desecho, sin recogida ni eliminación.	Todas las actividades de transporte de carga por carretera, incluido en camionetas de: troncos, ganado, transporte refrigerado, carga pesada, carga a granel, incluido el transporte en camiones cisterna, automóviles, desperdicios y materiales de desecho, sin recogida ni eliminación.	H4923.01.01	f
2337	Servicio de alquiler de camiones con conductor.	Servicio de alquiler de camiones con conductor.	H4923.02.01	f
2338	Transporte de carga en vehículos de tracción humana.	Transporte de carga en vehículos de tracción humana.	H4923.03.01	f
2339	Transporte de carga en vehículos de tracción animal.	Transporte de carga en vehículos de tracción animal.	H4923.03.02	f
2340	Servicios de mudanzas de muebles.	Servicios de mudanzas de muebles.	H4923.04.01	f
2341	Otros tipos de transporte regular o no regular de carga por carretera.	Otros tipos de transporte regular o no regular de carga por carretera.	H4923.05.01	f
2342	Otros tipos de transporte no regular de pasajeros por via terrestre n.c.p.	Otros tipos de transporte no regular de pasajeros por via terrestre n.c.p.	H4923.06.01	f
2343	Servicio de estaciones de bombeo.	Servicio de estaciones de bombeo.	H4930.00.01	f
2344	Servicio de transporte de petroleo por tuberias	Servicio de transporte de petroleo por tuberias	H4930.00.02	f
2345	Servicio de transporte de gases por tuberías.	Servicio de transporte de gases por tuberías.	H4930.00.03	f
2346	Servicio de transporte de lìquidos, agua, lechada y otros productos por tuberías.	Servicio de transporte de lìquidos, agua, lechada y otros productos por tuberías.	H4930.00.04	f
2347	Transporte marítimo y de cabotaje, regular y no regular, de pasajeros; explotación de embarcaciones de excursión, de crucero o de turismo, explotación de transbordadores, taxis acuáticas, etcétera.	Transporte marítimo y de cabotaje, regular y no regular, de pasajeros; explotación de embarcaciones de excursión, de crucero o de turismo, explotación de transbordadores, taxis acuáticas, etcétera.	H5011.01.01	f
2348	Alquiler de embarcaciones de placer con tripulación para el transporte marítimo.	Alquiler de embarcaciones de placer con tripulación para el transporte marítimo.	H5011.02.01	f
2349	Transporte marítimo y de cabotaje, regular y no regular, de carga.	Transporte marítimo y de cabotaje, regular y no regular, de carga.	H5012.01.01	f
2350	Transporte de barcazas, plataformas petrolíferas, etc., remolcadas o empujadas por remolcadores.	Transporte de barcazas, plataformas petrolíferas, etc., remolcadas o empujadas por remolcadores.	H5012.02.01	f
2351	Alquiler de embarcaciones con tripulación para el transporte marítimo (incluido el costero) de mercancías.	Alquiler de embarcaciones con tripulación para el transporte marítimo (incluido el costero) de mercancías.	H5012.03.01	f
2352	Transporte de pasajeros por ríos, canales, lagos y otras vías de navegación interiores, incluidos puertos interiores.	Transporte de pasajeros por ríos, canales, lagos y otras vías de navegación interiores, incluidos puertos interiores.	H5021.01.01	f
2353	Alquiler de embarcaciones de placer con tripulación para el transporte por vías de navegación interiores.	Alquiler de embarcaciones de placer con tripulación para el transporte por vías de navegación interiores.	H5021.02.01	f
2354	Transporte de carga por ríos, canales, lagos y otras vías de navegación interiores, incluidos puertos interiores.	Transporte de carga por ríos, canales, lagos y otras vías de navegación interiores, incluidos puertos interiores.	H5022.01.01	f
2355	Alquiler de embarcaciones con tripulación para el transporte de mercancías por: ríos, canales, lagos y otras vías de navegación interiores.	Alquiler de embarcaciones con tripulación para el transporte de mercancías por: ríos, canales, lagos y otras vías de navegación interiores.	H5022.02.01	f
2356	Transporte aéreo de pasajeros con itinerarios y horarios establecidos.	Transporte aéreo de pasajeros con itinerarios y horarios establecidos.	H5110.01.01	f
2358	Alquiler de equipo de transporte aéreo con operadores para el transporte de pasajeros, vuelos contratados (chárter) para pasajeros.	Alquiler de equipo de transporte aéreo con operadores para el transporte de pasajeros, vuelos contratados (chárter) para pasajeros.	H5110.03.01	f
2360	Transporte aéreo internacional de carga con itinerarios y horarios establecidos.	Transporte aéreo internacional de carga con itinerarios y horarios establecidos.	H5120.01.02	f
2361	Transporte aéreo de carga con itinerarios y horarios establecidos, desde y hacia la provincia de Galápagos.	Transporte aéreo de carga con itinerarios y horarios establecidos, desde y hacia la provincia de Galápagos.	H5120.01.03	f
2362	Alquiler de equipo de transporte aéreo con operadores para el transporte de carga.	Alquiler de equipo de transporte aéreo con operadores para el transporte de carga.	H5120.02.01	f
2363	Transporte espacial y lanzamiento de satélites y vehículos espaciales.	Transporte espacial y lanzamiento de satélites y vehículos espaciales.	H5120.03.01	f
2364	Transporte aéreo no regular de carga local.	Transporte aéreo no regular de carga local.	H5120.04.01	f
2365	Transporte aéreo no regular de carga internacional.	Transporte aéreo no regular de carga internacional.	H5120.04.02	f
2366	Transporte aéreo no regular de carga desde y hacia la provincia de Galápagos.	Transporte aéreo no regular de carga desde y hacia la provincia de Galápagos.	H5120.04.03	f
2369	Otras formas de transportación aérea no regular de carga desde y hacia la provincia de Galápagos.	Otras formas de transportación aérea no regular de carga desde y hacia la provincia de Galápagos.	H5120.05.03	f
2370	Actividades de almacenamiento y depósito para todo tipo de productos: explotación de silos de granos, cámaras frigoríficas. Incluye la congelación por corriente de aire.	Actividades de almacenamiento y depósito para todo tipo de productos: explotación de silos de granos, cámaras frigoríficas. Incluye la congelación por corriente de aire.	H5210.00.01	f
2371	Actividades de almacenamiento y depósito para todo tipo de productos: tanques de almacenamiento, etcétera.	Actividades de almacenamiento y depósito para todo tipo de productos: tanques de almacenamiento, etcétera.	H5210.00.02	f
2372	Actividades de almacenamiento y depósito para todo tipo de productos:  almacenes para mercancías diversas, almacenamiento de productos en zonas francas.	Actividades de almacenamiento y depósito para todo tipo de productos:  almacenes para mercancías diversas, almacenamiento de productos en zonas francas.	H5210.00.03	f
2373	Actividades relacionadas con el transporte terrestre de pasajeros: explotación de terminales, estaciones ferroviarias, de autobuses, de manipulación de mercancías.	Actividades relacionadas con el transporte terrestre de pasajeros: explotación de terminales, estaciones ferroviarias, de autobuses, de manipulación de mercancías.	H5221.01.01	f
2374	Actividades relacionadas con el transporte terrestre de carga: explotación de terminales, estaciones ferroviarias, de autobuses, de manipulación de mercancías.	Actividades relacionadas con el transporte terrestre de carga: explotación de terminales, estaciones ferroviarias, de autobuses, de manipulación de mercancías.	H5221.01.02	f
2375	Actividades relacionadas con el transporte terrestre de animales: explotación de terminales, estaciones ferroviarias, de autobuses, de manipulación de mercancías.	Actividades relacionadas con el transporte terrestre de animales: explotación de terminales, estaciones ferroviarias, de autobuses, de manipulación de mercancías.	H5221.01.03	f
2376	Operación de infraestructura de transporte ferroviario su reparación y mantenimiento (limpieza exterior de las unidades, mantenimiento de vías y de equipos, instalación y mantenimiento electromecánico de maquinaria y conducción de líneas), operaciones de cambio de vías o de agujas	Operación de infraestructura de transporte ferroviario su reparación y mantenimiento (limpieza exterior de las unidades, mantenimiento de vías y de equipos, instalación y mantenimiento electromecánico de maquinaria y conducción de líneas), operaciones de cambio de vías o de agujas	H5221.01.04	f
2377	Actividades relacionadas con administración y operaciones de servicios de: carreteras, puentes, túneles, aparcamientos o garajes, aparcamientos para bicicletas.	Actividades relacionadas con administración y operaciones de servicios de: carreteras, puentes, túneles, aparcamientos o garajes, aparcamientos para bicicletas.	H5221.02.01	f
2378	Actividades de remolque y asistencia en carreteras.	Actividades de remolque y asistencia en carreteras.	H5221.03.01	f
2379	Actividades de licuefacción de gas para facilitar su transporte.	Actividades de licuefacción de gas para facilitar su transporte.	H5221.04.01	f
2380	Actividades relacionadas con el transporte acuático de pasajeros, animales o carga: explotación de instalaciones terminales, como puertos y malecones, explotación de exclusas de vías de navegación interiores, etcétera, actividades de navegación, practicaje y atracada, actividades de gabarraje y salvamento, incluye actividades de faros.	Actividades relacionadas con el transporte acuático de pasajeros, animales o carga: explotación de instalaciones terminales, como puertos y malecones, explotación de exclusas de vías de navegación interiores, etcétera, actividades de navegación, practicaje y atracada, actividades de gabarraje y salvamento, incluye actividades de faros.	H5222.00.01	f
2381	Actividades relacionadas con el transporte aéreo de pasajeros, animales o carga: explotación de instalaciones terminales, como terminales aéreas, etc. Actividades aeroportuarias y de control de tráfico aéreo. Actividades de servicio en tierra realizadas en aeropuertos, etcétera.	Actividades relacionadas con el transporte aéreo de pasajeros, animales o carga: explotación de instalaciones terminales, como terminales aéreas, etc. Actividades aeroportuarias y de control de tráfico aéreo. Actividades de servicio en tierra realizadas en aeropuertos, etcétera.	H5223.01.01	f
2382	Servicios de prevención y extinción de incendios en los aeropuertos.	Servicios de prevención y extinción de incendios en los aeropuertos.	H5223.02.01	f
2383	Carga y descarga de mercancías y equipaje, independientemente del modo de transporte utilizado, estiba y desestiba, incluye carga y descarga de vagones ferroviarios de carga.	Carga y descarga de mercancías y equipaje, independientemente del modo de transporte utilizado, estiba y desestiba, incluye carga y descarga de vagones ferroviarios de carga.	H5224.00.01	f
2384	Servicios transitorios de organización o coordinación de operaciones de transporte y flete por mar y aire.	Servicios transitorios de organización o coordinación de operaciones de transporte y flete por mar y aire.	H5229.01.01	f
2385	Servicios transitorios de organización o coordinación de operaciones de transporte y flete por tierra.	Servicios transitorios de organización o coordinación de operaciones de transporte y flete por tierra.	H5229.01.02	f
2386	Actividades logísticas: planificación, diseño y apoyo de operaciones de transporte, almacenamiento y distribución; contratación de espacio en buques y aeronaves, organización de envíos de grupo e individuales (incluidas la recogida y entrega de mercancías y la agrupación de envíos); Manipulación de mercancías, como: el embalaje temporal con la exclusiva finalidad de proteger las mercancías durante el tránsito, desembalaje, muestreo y pesaje de la carga.	Actividades logísticas: planificación, diseño y apoyo de operaciones de transporte, almacenamiento y distribución; contratación de espacio en buques y aeronaves, organización de envíos de grupo e individuales (incluidas la recogida y entrega de mercancías y la agrupación de envíos); Manipulación de mercancías, como: el embalaje temporal con la exclusiva finalidad de proteger las mercancías durante el tránsito, desembalaje, muestreo y pesaje de la carga.	H5229.02.01	f
2387	Actividades de agentes de aduanas; emisión y tramitación de documentos de transporte y conocimientos de embarque.	Actividades de agentes de aduanas; emisión y tramitación de documentos de transporte y conocimientos de embarque.	H5229.03.01	f
2388	Servicios de fletes de autobuses, incluso para excursiones y demás servicios ocasionales.	Servicios de fletes de autobuses, incluso para excursiones y demás servicios ocasionales.	H5229.04.01	f
2390	Servicios de recolección de correspondencia y paquetes depositados en buzones públicos o en oficinas de correos.	Servicios de recolección de correspondencia y paquetes depositados en buzones públicos o en oficinas de correos.	H5310.00.01	f
2391	Servicios de distribución y entrega de correspondencia y paquetes. La actividad puede realizarse en uno o varios medios de transporte propios (transporte privado) o de transporte público.	Servicios de distribución y entrega de correspondencia y paquetes. La actividad puede realizarse en uno o varios medios de transporte propios (transporte privado) o de transporte público.	H5310.00.02	f
2392	Actividades de venta de sellos de correo.	Actividades de venta de sellos de correo.	H5310.00.03	f
2393	Actividades de clasificación de la correspondencia y alquiler de buzones postales.	Actividades de clasificación de la correspondencia y alquiler de buzones postales.	H5310.01.01	f
2394	Servicios de apartado postales.	Servicios de apartado postales.	H5310.01.02	f
2395	Otras actividades de correo distintas de las postales nacionales.	Otras actividades de correo distintas de las postales nacionales.	H5310.02.01	f
2396	Servicios de recolección (nacional o internacional) de correspondencia ordinaria y paquetes (que cumplan determinadas especificaciones) por parte de empresas no sujetas a la obligación de servicio universal.  La actividad puede realizarse en uno o varios medios de transporte propios (transporte privado) o de transporte público. Incluye la distribución y entrega de correspondencia y paquetes y la entrega a domicilio.	Servicios de recolección (nacional o internacional) de correspondencia ordinaria y paquetes (que cumplan determinadas especificaciones) por parte de empresas no sujetas a la obligación de servicio universal.  La actividad puede realizarse en uno o varios medios de transporte propios (transporte privado) o de transporte público. Incluye la distribución y entrega de correspondencia y paquetes y la entrega a domicilio.	H5320.00.01	f
2397	Servicios de recolección, clasificación, transporte y entrega de correspondencia ordinaria y paquetes (que cumplan determinadas especificaciones) por parte de empresas no sujetas a la obligación de servicio universal. La actividad puede realizarse en uno o varios medios de transporte propios (transporte privado) o de transporte público. Incluye la distribución y entrega de correspondencia y paquetes y la entrega a domicilio.	Servicios de recolección, clasificación, transporte y entrega de correspondencia ordinaria y paquetes (que cumplan determinadas especificaciones) por parte de empresas no sujetas a la obligación de servicio universal. La actividad puede realizarse en uno o varios medios de transporte propios (transporte privado) o de transporte público. Incluye la distribución y entrega de correspondencia y paquetes y la entrega a domicilio.	H5320.00.02	f
2398	Servicios de alojamiento prestados por hoteles.	Servicios de alojamiento prestados por hoteles.	I5510.01.01	f
2399	Servicios de alojamiento prestados por hoteles de suites.	Servicios de alojamiento prestados por hoteles de suites.	I5510.01.02	f
2400	Servicios de alojamiento prestados por apart hoteles.	Servicios de alojamiento prestados por apart hoteles.	I5510.01.03	f
2401	Servicios de alojamiento prestados por complejos turísticos.	Servicios de alojamiento prestados por complejos turísticos.	I5510.01.04	f
2402	Servicios de alojamiento prestados por hosterías.	Servicios de alojamiento prestados por hosterías.	I5510.01.05	f
2403	Servicios de alojamiento prestados por moteles.	Servicios de alojamiento prestados por moteles.	I5510.02.01	f
2404	Otros servicios de alojamientos por corto tiempo en casas de huéspedes.	Otros servicios de alojamientos por corto tiempo en casas de huéspedes.	I5510.09.01	f
2405	Otros servicios de alojamientos por corto tiempo en cabañas, chalets, cabañas con servicio de mantenimiento y limpieza.	Otros servicios de alojamientos por corto tiempo en cabañas, chalets, cabañas con servicio de mantenimiento y limpieza.	I5510.09.02	f
2406	Otros servicios de alojamientos por corto tiempo en hostales juveniles y refugios de montaña.	Otros servicios de alojamientos por corto tiempo en hostales juveniles y refugios de montaña.	I5510.09.03	f
2407	Provisión de alojamiento en campamentos, parques para caravanas, campamentos recreativos y campamentos de caza y de pesca para estancias cortas.	Provisión de alojamiento en campamentos, parques para caravanas, campamentos recreativos y campamentos de caza y de pesca para estancias cortas.	I5520.00.01	f
2408	Espacio e instalaciones para vehículos de recreo. Se incluye refugios o simples instalaciones de acampada para plantar tiendas o pernoctar en sacos de dormir.	Espacio e instalaciones para vehículos de recreo. Se incluye refugios o simples instalaciones de acampada para plantar tiendas o pernoctar en sacos de dormir.	I5520.00.02	f
2409	Servicio de residencias de estudiantes, dormitorios escolares.	Servicio de residencias de estudiantes, dormitorios escolares.	I5590.01.01	f
2410	Servicio de albergues para trabajadores, casas de huéspedes e internados.	Servicio de albergues para trabajadores, casas de huéspedes e internados.	I5590.01.02	f
2411	Servicios de coches cama ferroviarios.	Servicios de coches cama ferroviarios.	I5590.02.01	f
2412	Venta de comidas y bebidas en Restaurantes, incluso  para llevar.	Venta de comidas y bebidas en Restaurantes, incluso  para llevar.	I5610.01.01	f
2413	Venta de comidas y bebidas en Cevicherías, incluso  para llevar.	Venta de comidas y bebidas en Cevicherías, incluso  para llevar.	I5610.01.02	f
2414	Venta de comidas y bebidas en Picanterías, incluso  para llevar.	Venta de comidas y bebidas en Picanterías, incluso  para llevar.	I5610.01.03	f
2415	Venta de comidas y bebidas en Cafeterías, incluso  para llevar.	Venta de comidas y bebidas en Cafeterías, incluso  para llevar.	I5610.01.04	f
2416	Venta de comidas y bebidas en Fondas y comedores populares, incluso  para llevar.	Venta de comidas y bebidas en Fondas y comedores populares, incluso  para llevar.	I5610.01.05	f
2417	Venta de comidas y bebidas en Bares- Restaurantes, incluso  para llevar.	Venta de comidas y bebidas en Bares- Restaurantes, incluso  para llevar.	I5610.01.06	f
2418	Restaurantes de comida rápida, puestos de refrigerio y establecimientos que ofrecen comida para llevar, reparto de pizza, etcétera; heladerías, fuentes de soda, etcétera.	Restaurantes de comida rápida, puestos de refrigerio y establecimientos que ofrecen comida para llevar, reparto de pizza, etcétera; heladerías, fuentes de soda, etcétera.	I5610.02.01	f
2419	Preparación y suministro de comidas para su consumo inmediato de manera ambulante, mediante un vehículo motorizado o carro no motorizado.	Preparación y suministro de comidas para su consumo inmediato de manera ambulante, mediante un vehículo motorizado o carro no motorizado.	I5610.03.01	f
2420	Vendedores de helados en carros móviles, carritos ambulantes de comida.	Vendedores de helados en carros móviles, carritos ambulantes de comida.	I5610.03.02	f
2744	Alquiler con fines operativos de equipo de transporte aéreo sin operador: aeronaves, globos de aire caliente a corto plazo.	Alquiler con fines operativos de equipo de transporte aéreo sin operador: aeronaves, globos de aire caliente a corto plazo.	N7730.24.01	f
2422	Servicios de restaurantes y bares en conexión con transporte cuando son proporcionadas por unidades independientes: bares del aeropuerto, bares terminales terrestres, etcétera.	Servicios de restaurantes y bares en conexión con transporte cuando son proporcionadas por unidades independientes: bares del aeropuerto, bares terminales terrestres, etcétera.	I5610.04.01	f
2423	Servicio de comidas basado en acuerdos contractuales con el cliente para un evento como banquetes, bodas, fiestas y otras celebraciones, en la localización especificada por el cliente.	Servicio de comidas basado en acuerdos contractuales con el cliente para un evento como banquetes, bodas, fiestas y otras celebraciones, en la localización especificada por el cliente.	I5621.00.01	f
2424	Servicio de comidas basado en acuerdos contractuales con el cliente para un evento como buffets en la localización especificada por el cliente.	Servicio de comidas basado en acuerdos contractuales con el cliente para un evento como buffets en la localización especificada por el cliente.	I5621.00.02	f
2425	Servicio de restaurantes a domicilio	Servicio de restaurantes a domicilio	I5621.00.03	f
2426	Actividades de contratistas de servicio de comidas como las compañías de transporte, catering.	Actividades de contratistas de servicio de comidas como las compañías de transporte, catering.	I5629.01.01	f
2427	Concesiones de servicio de comidas en instalaciones deportivas e instalaciones similares, cantinas o cafeterías (por ejemplo, para fábricas, oficinas, hospitales o escuelas) en régimen de concesión.	Concesiones de servicio de comidas en instalaciones deportivas e instalaciones similares, cantinas o cafeterías (por ejemplo, para fábricas, oficinas, hospitales o escuelas) en régimen de concesión.	I5629.02.01	f
2428	Actividades de preparación y servicio de bebidas para su consumo inmediato en bares (con suministro predominante de bebidas).	Actividades de preparación y servicio de bebidas para su consumo inmediato en bares (con suministro predominante de bebidas).	I5630.01.01	f
2429	Actividades de preparación y servicio de bebidas para su consumo inmediato en tabernas (con suministro predominante de bebidas).	Actividades de preparación y servicio de bebidas para su consumo inmediato en tabernas (con suministro predominante de bebidas).	I5630.01.02	f
2430	Actividades de preparación y servicio de bebidas para su consumo inmediato en coctelerías (con suministro predominante de bebidas).	Actividades de preparación y servicio de bebidas para su consumo inmediato en coctelerías (con suministro predominante de bebidas).	I5630.01.03	f
2431	Actividades de preparación y servicio de bebidas para su consumo inmediato en discotecas (con suministro predominante de bebidas).	Actividades de preparación y servicio de bebidas para su consumo inmediato en discotecas (con suministro predominante de bebidas).	I5630.01.04	f
2432	Actividades de preparación y servicio de bebidas para su consumo inmediato en cervecerías y pubs (con suministro predominante de bebidas).	Actividades de preparación y servicio de bebidas para su consumo inmediato en cervecerías y pubs (con suministro predominante de bebidas).	I5630.01.05	f
2433	Actividades de preparación y servicio de bebidas para su consumo inmediato en cafés.	Actividades de preparación y servicio de bebidas para su consumo inmediato en cafés.	I5630.02.01	f
2434	Actividades de preparación y servicio de bebidas para su consumo inmediato en tiendas de jugos de fruta.	Actividades de preparación y servicio de bebidas para su consumo inmediato en tiendas de jugos de fruta.	I5630.02.02	f
2435	Actividades de preparación y servicio de bebidas para su consumo inmediato, vendedores ambulantes de bebidas.	Actividades de preparación y servicio de bebidas para su consumo inmediato, vendedores ambulantes de bebidas.	I5630.02.03	f
2437	Publicación de folletos impresos.	Publicación de folletos impresos.	J5811.01.02	f
2438	Publicación de diccionarios, enciclopedias y similares.	Publicación de diccionarios, enciclopedias y similares.	J5811.01.03	f
2439	Publicación de atlas, mapas y planos.	Publicación de atlas, mapas y planos.	J5811.01.04	f
2440	Publicación y venta de espacios publicitarios.	Publicación y venta de espacios publicitarios.	J5811.01.05	f
2441	Publicación de libros en formato de audio y de enciclopedias en CD-ROM.	Publicación de libros en formato de audio y de enciclopedias en CD-ROM.	J5811.02.01	f
2442	Publicación de: guías de direcciones, postales, guías telefónicas, registros oficiales, jurisprudencia (ley), vademécum farmacéuticos, etcétera. Incluye venta de espacios publicitarios.	Publicación de: guías de direcciones, postales, guías telefónicas, registros oficiales, jurisprudencia (ley), vademécum farmacéuticos, etcétera. Incluye venta de espacios publicitarios.	J5812.00.01	f
2443	Actividades de publicación y edición de periódicos, incluidos los publicitarios con una periodicidad mayor a cuatro veces por semana. Esta información puede ser editada en formato impresos o electrónicos, incluido Internet.	Actividades de publicación y edición de periódicos, incluidos los publicitarios con una periodicidad mayor a cuatro veces por semana. Esta información puede ser editada en formato impresos o electrónicos, incluido Internet.	J5813.01.01	f
2444	Edición de revistas de industrias, humorísticas, etc. (esté, o no relacionada con la impresión).	Edición de revistas de industrias, humorísticas, etc. (esté, o no relacionada con la impresión).	J5813.01.02	f
2445	Actividades de edición y publicación de las programaciones de radio. Incluso la venta de espacios publicitarios.	Actividades de edición y publicación de las programaciones de radio. Incluso la venta de espacios publicitarios.	J5813.02.01	f
2446	Actividades de edición y publicación de las programaciones de televisión. Incluso la venta de espacios publicitarios.	Actividades de edición y publicación de las programaciones de televisión. Incluso la venta de espacios publicitarios.	J5813.02.02	f
2447	Otras actividades de radio y televisión.	Otras actividades de radio y televisión.	J5813.02.03	f
2448	Publicación (incluida la edición on-line) de catálogos de fotografías, grabados, reproducciones de obras de arte.	Publicación (incluida la edición on-line) de catálogos de fotografías, grabados, reproducciones de obras de arte.	J5819.01.01	f
2449	Publicación (incluida la edición on-line) de tarjetas postales, tarjetas de felicitación, formularios, carteles.	Publicación (incluida la edición on-line) de tarjetas postales, tarjetas de felicitación, formularios, carteles.	J5819.01.02	f
2450	Publicación de otro material impreso.	Publicación de otro material impreso.	J5819.01.03	f
2451	Publicación de estadísticas en línea y otra información.	Publicación de estadísticas en línea y otra información.	J5819.02.01	f
2766	Servicios de escolta (guardaespaldas).	Servicios de escolta (guardaespaldas).	N8010.02.01	f
2452	Actividades de publicación de programas informáticos comerciales (no personalizados): sistemas operativos, aplicaciones comerciales y otras aplicaciones.	Actividades de publicación de programas informáticos comerciales (no personalizados): sistemas operativos, aplicaciones comerciales y otras aplicaciones.	J5820.00.01	f
2453	Actividades de publicación de juegos informáticos para todas las plataformas.	Actividades de publicación de juegos informáticos para todas las plataformas.	J5820.00.02	f
2454	Formulación, producción y suministro de programas encargados por los usuarios, incluida documentación pertinente y programas listos para ser utilizados (programas comerciales o del fácil confección).	Formulación, producción y suministro de programas encargados por los usuarios, incluida documentación pertinente y programas listos para ser utilizados (programas comerciales o del fácil confección).	J5820.00.03	f
2455	Actividades de producción de películas cinematográficas, videos, Producción programas y anuncios de televisión.	Actividades de producción de películas cinematográficas, videos, Producción programas y anuncios de televisión.	J5911.00.01	f
2456	Producción de estudios cinematográficos o laboratorios especiales (para la creación de dibujos animados por ejemplo).	Producción de estudios cinematográficos o laboratorios especiales (para la creación de dibujos animados por ejemplo).	J5911.00.02	f
2457	Actividades de postproducción, como: edición, rotulación, subtitulado, créditos subtitulados para sordos, gráficos, animación y efectos especiales producidos por ordenador, transferencia de película a cinta; actividades de laboratorios cinematográficos y de laboratorios especiales para películas de animación, incluido el revelado de estas cintas.	Actividades de postproducción, como: edición, rotulación, subtitulado, créditos subtitulados para sordos, gráficos, animación y efectos especiales producidos por ordenador, transferencia de película a cinta; actividades de laboratorios cinematográficos y de laboratorios especiales para películas de animación, incluido el revelado de estas cintas.	J5912.01.01	f
2458	Actividades de reproducción de películas cinematográficas para su distribución en cines. Se incluyen actividades de archivos cinematográficos, etcétera.	Actividades de reproducción de películas cinematográficas para su distribución en cines. Se incluyen actividades de archivos cinematográficos, etcétera.	J5912.02.01	f
2459	Distribución de películas, cintas de vídeo, DVD y productos similares a cines, cadenas y emisoras de televisión y exhibidores. Se incluyen adquisición de los derechos de distribución de películas, cintas de vídeo y DVD.	Distribución de películas, cintas de vídeo, DVD y productos similares a cines, cadenas y emisoras de televisión y exhibidores. Se incluyen adquisición de los derechos de distribución de películas, cintas de vídeo y DVD.	J5913.00.01	f
2460	Actividades de distribución de películas, cintas de vídeo, DVD y productos similares a cines, cadenas y emisoras de televisión y exhibidores. Se incluyen adquisición de los derechos de distribución de películas, cintas de vídeo y DVD.	Actividades de distribución de películas, cintas de vídeo, DVD y productos similares a cines, cadenas y emisoras de televisión y exhibidores. Se incluyen adquisición de los derechos de distribución de películas, cintas de vídeo y DVD.	J5913.00.02	f
2461	Proyección de películas cinematográficas y cintas de vídeo en cines, al aire libre o en otros locales de proyección y actividades de cineclubes.	Proyección de películas cinematográficas y cintas de vídeo en cines, al aire libre o en otros locales de proyección y actividades de cineclubes.	J5914.00.01	f
2462	Actividades de producción de grabaciones matrices originales de sonido, como cintas magnetofónicas, CD.	Actividades de producción de grabaciones matrices originales de sonido, como cintas magnetofónicas, CD.	J5920.01.01	f
2463	Edición de materiales grabados en discos gramofónicos.	Edición de materiales grabados en discos gramofónicos.	J5920.01.02	f
2464	Edición de materiales grabados en otros medios de reproducción.	Edición de materiales grabados en otros medios de reproducción.	J5920.01.03	f
2465	Reproducción de discos gramofónicos.	Reproducción de discos gramofónicos.	J5920.01.04	f
2466	Reproducción de cintas magnetofónicas.	Reproducción de cintas magnetofónicas.	J5920.01.05	f
2467	Reproducción de cintas de video y cintas de computadora a partir de grabaciones originales.	Reproducción de cintas de video y cintas de computadora a partir de grabaciones originales.	J5920.01.06	f
2468	Reproducción de discos flexibles, duros o compactos de computadora.	Reproducción de discos flexibles, duros o compactos de computadora.	J5920.01.07	f
2469	Reproducción de programas comerciales de computadora.	Reproducción de programas comerciales de computadora.	J5920.01.08	f
2470	La publicación, lanzamiento, promoción y distribución de grabaciones de sonido para comerciantes mayoristas, minoristas o directamente para el público.	La publicación, lanzamiento, promoción y distribución de grabaciones de sonido para comerciantes mayoristas, minoristas o directamente para el público.	J5920.02.01	f
2600	Actividades de diseño de ingeniería y consultoría de ingeniería para proyectos de ordenación hídrica.	Actividades de diseño de ingeniería y consultoría de ingeniería para proyectos de ordenación hídrica.	M7110.23.01	f
2471	Actividades de servicios de grabación de sonido en estudio o en otros lugares, incluida la producción de programas de radio grabados (es decir, no emitidos en directo).	Actividades de servicios de grabación de sonido en estudio o en otros lugares, incluida la producción de programas de radio grabados (es decir, no emitidos en directo).	J5920.03.01	f
2472	Actividades de bandas sonoras de películas cinematográficas, grabaciones de sonido para programas de televisión, etcétera.	Actividades de bandas sonoras de películas cinematográficas, grabaciones de sonido para programas de televisión, etcétera.	J5920.04.01	f
2473	Edición de música, es decir, actividades de: adquisición y registro de los derechos de autor de composiciones musicales, promoción, autorización y utilización de esas composiciones en grabaciones, en la radio, en la televisión, en películas, en interpretaciones en vivo, en medios impresos y en otros medios, distribución de grabaciones de sonido a mayoristas o minoristas o directamente al público, incluye la edición de libros de música	Edición de música, es decir, actividades de: adquisición y registro de los derechos de autor de composiciones musicales, promoción, autorización y utilización de esas composiciones en grabaciones, en la radio, en la televisión, en películas, en interpretaciones en vivo, en medios impresos y en otros medios, distribución de grabaciones de sonido a mayoristas o minoristas o directamente al público, incluye la edición de libros de música	J5920.05.01	f
2767	Servicios de guardias de seguridad.	Servicios de guardias de seguridad.	N8010.03.01	f
75	Cultivo de plantas aromáticas	Cultivo de plantas aromáticas	A0128.03.05	t
2475	Actividades de emisión de señales de audiofrecuencia a través de estudios e instalaciones de emisión de radio para la transmisión de programas sonoros al público, a entidades afiliadas o a suscriptores.	Actividades de emisión de señales de audiofrecuencia a través de estudios e instalaciones de emisión de radio para la transmisión de programas sonoros al público, a entidades afiliadas o a suscriptores.	J6010.01.01	f
2476	Actividades de cadenas de radio, es decir, la reunión de programas sonoros y su transmisión a los afiliados o suscriptores por el aire, por cable o por satélite; transmisiones de radio por Internet (estaciones de radio por Internet). Incluye la transmisión de datos integrada con transmisiones de radio.	Actividades de cadenas de radio, es decir, la reunión de programas sonoros y su transmisión a los afiliados o suscriptores por el aire, por cable o por satélite; transmisiones de radio por Internet (estaciones de radio por Internet). Incluye la transmisión de datos integrada con transmisiones de radio.	J6010.02.01	f
2477	Actividades de creación del programa completo de una cadena de televisión para un canal, desde la compra de los componentes del programa (películas, documentales, etcétera.) hasta la producción propia de los componentes del programa auto producidos (noticias locales, reportajes en vivo) o una combinación de las dos opciones. El programa completo de televisión puede ser emitido por las unidades de producción o bien producirse para su transmisión por terceros distribuidores, como compañías de emisión por cable o proveedores de televisión por satélite, incluye la programación de canales de video a la carta.	Actividades de creación del programa completo de una cadena de televisión para un canal, desde la compra de los componentes del programa (películas, documentales, etcétera.) hasta la producción propia de los componentes del programa auto producidos (noticias locales, reportajes en vivo) o una combinación de las dos opciones. El programa completo de televisión puede ser emitido por las unidades de producción o bien producirse para su transmisión por terceros distribuidores, como compañías de emisión por cable o proveedores de televisión por satélite, incluye la programación de canales de video a la carta.	J6020.01.01	f
2478	Actividades de transmisión de datos integrados con emisiones de televisión.	Actividades de transmisión de datos integrados con emisiones de televisión.	J6020.02.01	f
2479	Actividades de operación, mantenimiento o facilitación del acceso a servicios de transmisión de voz, datos, texto, sonido y vídeo utilizando una infraestructura de telecomunicaciones alambricas, como: operación y mantenimiento de sistemas de conmutación y transmisión para suministrar servicios de comunicaciones de punto a punto por líneas alambricas, por microondas o por una combinación de líneas alambricas y conexiones por satélite.	Actividades de operación, mantenimiento o facilitación del acceso a servicios de transmisión de voz, datos, texto, sonido y vídeo utilizando una infraestructura de telecomunicaciones alambricas, como: operación y mantenimiento de sistemas de conmutación y transmisión para suministrar servicios de comunicaciones de punto a punto por líneas alambricas, por microondas o por una combinación de líneas alambricas y conexiones por satélite.	J6110.01.01	f
2481	Servicios telegráficos y Radiotelegráficos.	Servicios telegráficos y Radiotelegráficos.	J6110.01.03	f
2482	Actividades de operación en sistemas de distribución por cable (por ejemplo, para la distribución de datos y señales de televisión).	Actividades de operación en sistemas de distribución por cable (por ejemplo, para la distribución de datos y señales de televisión).	J6110.02.01	f
2483	Transmisión de sonido, imágenes, datos u otro tipo de información por cable (transmisión tv. por cable).	Transmisión de sonido, imágenes, datos u otro tipo de información por cable (transmisión tv. por cable).	J6110.02.02	f
2484	Actividades de compra en derechos de acceso y capacidad de red a los propietarios y operadores de redes y utilización de esa capacidad para suministrar servicios de telecomunicaciones a empresas y hogares.	Actividades de compra en derechos de acceso y capacidad de red a los propietarios y operadores de redes y utilización de esa capacidad para suministrar servicios de telecomunicaciones a empresas y hogares.	J6110.03.01	f
2485	Actividades de suministro en acceso a Internet por los operadores de la infraestructura de telecomunicaciones alambricas.	Actividades de suministro en acceso a Internet por los operadores de la infraestructura de telecomunicaciones alambricas.	J6110.04.01	f
2486	Operación, mantenimiento o facilitación del acceso a servicios de transmisión de voz, datos, texto, sonido y vídeo utilizando una infraestructura de telecomunicaciones inalámbricas.	Operación, mantenimiento o facilitación del acceso a servicios de transmisión de voz, datos, texto, sonido y vídeo utilizando una infraestructura de telecomunicaciones inalámbricas.	J6120.01.01	f
2487	Actividades de mantenimiento y explotación de telefonía móvil y otras redes de telecomunicaciones inalámbricas.	Actividades de mantenimiento y explotación de telefonía móvil y otras redes de telecomunicaciones inalámbricas.	J6120.01.02	f
2488	Actividades de mantenimiento y explotación de redes de radio búsqueda.	Actividades de mantenimiento y explotación de redes de radio búsqueda.	J6120.01.03	f
2601	Elaboración y realización de proyectos de ingeniería de minas.	Elaboración y realización de proyectos de ingeniería de minas.	M7110.24.01	f
2489	Transmisión de sonido, imágenes, datos u otro tipo de información  por estaciones de difusión y retransmisión, (transmisiones de radio y tv. por estaciones repetidoras).	Transmisión de sonido, imágenes, datos u otro tipo de información  por estaciones de difusión y retransmisión, (transmisiones de radio y tv. por estaciones repetidoras).	J6120.01.04	f
2490	Actividades de compra de acceso y capacidad de red concedida por los dueños y operadores de las redes y el abastecimiento de servicios de telecomunicaciones inalámbrico (excepto el satélite) que utilizan esta capacidad a empresas y hogares.	Actividades de compra de acceso y capacidad de red concedida por los dueños y operadores de las redes y el abastecimiento de servicios de telecomunicaciones inalámbrico (excepto el satélite) que utilizan esta capacidad a empresas y hogares.	J6120.02.01	f
2491	Actividades de suministro de acceso a Internet por los operadores de la infraestructura de telecomunicaciones inalámbricas.	Actividades de suministro de acceso a Internet por los operadores de la infraestructura de telecomunicaciones inalámbricas.	J6120.03.01	f
2511	Actividades de procesamiento y suministro de servicio de registro de datos: elaboración completa de datos facilitados por los clientes, generación de informes especializados a partir de datos facilitados por los clientes.	Actividades de procesamiento y suministro de servicio de registro de datos: elaboración completa de datos facilitados por los clientes, generación de informes especializados a partir de datos facilitados por los clientes.	J6311.02.01	f
77	Cultivo de palmito.	Cultivo de palmito.	A0129.02.01	t
2492	Actividades de operación, mantenimiento o facilitación del acceso a servicios de transmisión de voz, datos, texto, sonido y vídeo utilizando una infraestructura de telecomunicaciones por satélite, actividades de suministro de acceso a Internet por el operador de la infraestructura de telecomunicaciones por satélite.	Actividades de operación, mantenimiento o facilitación del acceso a servicios de transmisión de voz, datos, texto, sonido y vídeo utilizando una infraestructura de telecomunicaciones por satélite, actividades de suministro de acceso a Internet por el operador de la infraestructura de telecomunicaciones por satélite.	J6130.01.01	f
2493	Actividades de transmisión a los consumidores por sistemas de comunicación directa por satélite de programas visuales, sonoros o de texto recibidos de redes de cable o estaciones de televisión o cadenas de radio locales. (Las unidades clasificadas en esa clase no producen por lo general material de programación).	Actividades de transmisión a los consumidores por sistemas de comunicación directa por satélite de programas visuales, sonoros o de texto recibidos de redes de cable o estaciones de televisión o cadenas de radio locales. (Las unidades clasificadas en esa clase no producen por lo general material de programación).	J6130.02.01	f
2494	Suministro de aplicaciones especializadas de telecomunicaciones, como detección por satélite, telemetría de comunicaciones y utilización de estaciones de radar.	Suministro de aplicaciones especializadas de telecomunicaciones, como detección por satélite, telemetría de comunicaciones y utilización de estaciones de radar.	J6190.01.01	f
2495	Operación de estaciones terminales de comunicaciones por satélite e instalaciones conexas operacionalmente conectadas con uno o varios sistemas de comunicaciones terrestres y capaces de transmitir o recibir telecomunicaciones por satélite.	Operación de estaciones terminales de comunicaciones por satélite e instalaciones conexas operacionalmente conectadas con uno o varios sistemas de comunicaciones terrestres y capaces de transmitir o recibir telecomunicaciones por satélite.	J6190.02.01	f
2496	Suministro de acceso a Internet por redes que no posee ni controla el proveedor de servicios de Internet, como el acceso telefónico a Internet, etc.	Suministro de acceso a Internet por redes que no posee ni controla el proveedor de servicios de Internet, como el acceso telefónico a Internet, etc.	J6190.03.01	f
2497	Actividades de reventa de servicios de telecomunicaciones (suministro de servicios telefónicos y de Internet en instalaciones abiertas al público: cabinas telefónicas y cibercafés.)	Actividades de reventa de servicios de telecomunicaciones (suministro de servicios telefónicos y de Internet en instalaciones abiertas al público: cabinas telefónicas y cibercafés.)	J6190.04.01	f
2498	Suministro de servicios de telecomunicaciones por las conexiones de telecomunicaciones existentes: suministro de servicios de telefonía por Internet (VoIP: Voice over Internet Protocol).	Suministro de servicios de telecomunicaciones por las conexiones de telecomunicaciones existentes: suministro de servicios de telefonía por Internet (VoIP: Voice over Internet Protocol).	J6190.05.01	f
2499	Actividades de gestión y consultoría para la transmisión de datos.	Actividades de gestión y consultoría para la transmisión de datos.	J6190.06.01	f
2500	Otras actividades de telecomunicaciones.	Otras actividades de telecomunicaciones.	J6190.09.01	f
2501	Mantenimiento y reparación de las redes de telecomunicación.	Mantenimiento y reparación de las redes de telecomunicación.	J6190.09.02	f
2502	Actividades de diseño de la estructura y el contenido de los elementos siguientes (y/o escritura del código informático necesario para su creación y aplicación): programas de sistemas operativos (incluidas actualizaciones y parches de corrección), aplicaciones informáticas (incluidas actualizaciones y parches de corrección), bases de datos y páginas web.	Actividades de diseño de la estructura y el contenido de los elementos siguientes (y/o escritura del código informático necesario para su creación y aplicación): programas de sistemas operativos (incluidas actualizaciones y parches de corrección), aplicaciones informáticas (incluidas actualizaciones y parches de corrección), bases de datos y páginas web.	J6201.01.01	f
2503	Adaptación de programas informáticos a las necesidades de los clientes, es decir, modificación y configuración de una aplicación existente para que pueda funcionar adecuadamente con los sistemas de información de que dispone el cliente.	Adaptación de programas informáticos a las necesidades de los clientes, es decir, modificación y configuración de una aplicación existente para que pueda funcionar adecuadamente con los sistemas de información de que dispone el cliente.	J6201.02.01	f
2504	Actividades de planificación y diseño de sistemas informáticos que integran equipo y programas informáticos y tecnología de las comunicaciones.	Actividades de planificación y diseño de sistemas informáticos que integran equipo y programas informáticos y tecnología de las comunicaciones.	J6202.10.01	f
2505	Servicios de gestión y manejo in situ de sistemas informáticos y/o instalaciones de procesamiento de datos de los clientes, y servicios de apoyo conexos.	Servicios de gestión y manejo in situ de sistemas informáticos y/o instalaciones de procesamiento de datos de los clientes, y servicios de apoyo conexos.	J6202.20.01	f
2506	Actividades relacionadas a la informática como: recuperación en casos de desastre informático, instalación de programas informáticos.	Actividades relacionadas a la informática como: recuperación en casos de desastre informático, instalación de programas informáticos.	J6209.01.01	f
2507	Actividades de informática no clasificadas en otra parte.	Actividades de informática no clasificadas en otra parte.	J6209.01.02	f
2508	Actividades de instalación (montaje) de computadoras personales.	Actividades de instalación (montaje) de computadoras personales.	J6209.02.01	f
3099	Actividades de clubes nocturnos (night clubs).	Actividades de clubes nocturnos (night clubs).	S9609.03.01	f
2509	Suministro de infraestructura para servicios de hospedaje, servicios de procesamiento de datos y actividades conexas. Incluye actividades especializadas de hospedaje, como: hospedaje de sitios web, aplicaciones, servicios de transmisión de secuencias de vídeo por Internet.	Suministro de infraestructura para servicios de hospedaje, servicios de procesamiento de datos y actividades conexas. Incluye actividades especializadas de hospedaje, como: hospedaje de sitios web, aplicaciones, servicios de transmisión de secuencias de vídeo por Internet.	J6311.01.01	f
2510	Preparación de registros computarizados que contengan datos de una manera preestablecida.	Preparación de registros computarizados que contengan datos de una manera preestablecida.	J6311.01.02	f
2540	Actividades de suscripción de créditos recíprocos y otras operaciones financieras de cobertura. Además las actividades de las sociedades de cartera.	Actividades de suscripción de créditos recíprocos y otras operaciones financieras de cobertura. Además las actividades de las sociedades de cartera.	K6499.01.02	f
2512	Actividades de suministro de datos con arreglo a un cierto orden o a una determinada secuencia, mediante su recuperación en línea o el acceso a ellos en  línea (gestión computarizada), los datos pueden ser: financieros, económicos, estadísticos o técnicos.	Actividades de suministro de datos con arreglo a un cierto orden o a una determinada secuencia, mediante su recuperación en línea o el acceso a ellos en  línea (gestión computarizada), los datos pueden ser: financieros, económicos, estadísticos o técnicos.	J6311.02.02	f
2514	Procesamiento o tabulación de datos por hora o bajo un régimen de tiempo compartido.	Procesamiento o tabulación de datos por hora o bajo un régimen de tiempo compartido.	J6311.03.02	f
2515	Suministro a los clientes de acceso en tiempo compartido a servicios centrales.	Suministro a los clientes de acceso en tiempo compartido a servicios centrales.	J6311.04.01	f
2516	Actividades de procesamiento y suministro de servicio de registro de datos: Tecleado u otro tipo de entrada de datos, conversión (tarjetas o cintas), reconocimiento óptico de caracteres.	Actividades de procesamiento y suministro de servicio de registro de datos: Tecleado u otro tipo de entrada de datos, conversión (tarjetas o cintas), reconocimiento óptico de caracteres.	J6311.04.02	f
2517	Operación de sitios web que funcionan como portales de Internet, como los sitios de medios de difusión que proporcionan contenidos que se actualizan periódicamente y los que utilizan un motor de búsqueda para generar y mantener amplias bases de datos de direcciones de Internet y de contenidos en un formato que facilite la búsqueda.	Operación de sitios web que funcionan como portales de Internet, como los sitios de medios de difusión que proporcionan contenidos que se actualizan periódicamente y los que utilizan un motor de búsqueda para generar y mantener amplias bases de datos de direcciones de Internet y de contenidos en un formato que facilite la búsqueda.	J6312.00.01	f
2518	Actividades de preparación de base de datos: reunión de datos procedentes de una o más fuentes.	Actividades de preparación de base de datos: reunión de datos procedentes de una o más fuentes.	J6312.00.02	f
2519	Actividades de consorcios y agencias de noticias que suministran noticias, fotografías y artículos periodísticos a los medios de difusión.	Actividades de consorcios y agencias de noticias que suministran noticias, fotografías y artículos periodísticos a los medios de difusión.	J6391.00.01	f
2520	Entrega de material noticiero, fotográfico y periodístico  a los medios de difusión.	Entrega de material noticiero, fotográfico y periodístico  a los medios de difusión.	J6391.00.02	f
2521	Otras actividades de servicios de información n.c.p.: servicios de información telefónica, búsqueda de información a cambio de una retribución o por contrato, selección de noticias, de recortes de prensa, etcétera.	Otras actividades de servicios de información n.c.p.: servicios de información telefónica, búsqueda de información a cambio de una retribución o por contrato, selección de noticias, de recortes de prensa, etcétera.	J6399.00.01	f
2522	Prestación de servicios de noticias a estaciones de radio.	Prestación de servicios de noticias a estaciones de radio.	J6399.00.02	f
2523	Prestación de servicios de noticias a estaciones de televisión.	Prestación de servicios de noticias a estaciones de televisión.	J6399.00.03	f
2524	Actividades de emisión y administración de la moneda nacional; supervisión y control de la masa monetaria; recepción de depósitos para operaciones de compensación entre instituciones financieras; supervisión de las operaciones bancarias; mantenimiento de las reservas nacionales de divisas; función de banco del gobierno. Las actividades de los bancos centrales pueden variar por razones institucionales.	Actividades de emisión y administración de la moneda nacional; supervisión y control de la masa monetaria; recepción de depósitos para operaciones de compensación entre instituciones financieras; supervisión de las operaciones bancarias; mantenimiento de las reservas nacionales de divisas; función de banco del gobierno. Las actividades de los bancos centrales pueden variar por razones institucionales.	K6411.00.01	f
2525	Actividades relacionadas con la banca central.	Actividades relacionadas con la banca central.	K6411.00.02	f
2526	Actividades de recepción de depósitos y/o similares cercanos de depósitos y la concesión de créditos o préstamos de fondos. La concesión de crédito puede adoptar diversas formas, como préstamos, hipotecas, transacciones con tarjetas de crédito, etc. Esas actividades son realizadas por bancos diferentes del Banco Central.	Actividades de recepción de depósitos y/o similares cercanos de depósitos y la concesión de créditos o préstamos de fondos. La concesión de crédito puede adoptar diversas formas, como préstamos, hipotecas, transacciones con tarjetas de crédito, etc. Esas actividades son realizadas por bancos diferentes del Banco Central.	K6419.01.01	f
2527	Actividades de intermediación monetaria realizada por la banca comercial.	Actividades de intermediación monetaria realizada por la banca comercial.	K6419.01.02	f
2528	Actividades de recepción de depósitos y/o similares cercanos de depósitos y la concesión de créditos o préstamos de fondos. La concesión de crédito puede adoptar diversas formas, como préstamos, hipotecas, transacciones con tarjetas de crédito, etc. Esas actividades son realizadas en general por instituciones monetarias diferentes de los bancos centrales, como: cajas de ahorros.	Actividades de recepción de depósitos y/o similares cercanos de depósitos y la concesión de créditos o préstamos de fondos. La concesión de crédito puede adoptar diversas formas, como préstamos, hipotecas, transacciones con tarjetas de crédito, etc. Esas actividades son realizadas en general por instituciones monetarias diferentes de los bancos centrales, como: cajas de ahorros.	K6419.02.01	f
2529	Actividades de recepción de depósitos y/o similares cercanos de depósitos y la concesión de créditos o préstamos de fondos. La concesión de crédito puede adoptar diversas formas, como préstamos, hipotecas, transacciones con tarjetas de crédito, etc. Esas actividades son realizadas en general por instituciones monetarias diferentes de los bancos centrales, como: cooperativas de crédito y actividades de giro postal.	Actividades de recepción de depósitos y/o similares cercanos de depósitos y la concesión de créditos o préstamos de fondos. La concesión de crédito puede adoptar diversas formas, como préstamos, hipotecas, transacciones con tarjetas de crédito, etc. Esas actividades son realizadas en general por instituciones monetarias diferentes de los bancos centrales, como: cooperativas de crédito y actividades de giro postal.	K6419.02.02	f
2541	Actividades de inversión por cuenta propia, como las de compañías de capital riesgo, clubes de inversión, etcétera.	Actividades de inversión por cuenta propia, como las de compañías de capital riesgo, clubes de inversión, etcétera.	K6499.02.01	f
2745	Alquiler con fines operativos de equipo de transporte aéreo sin operador: aeronaves, globos de aire caliente a largo plazo.	Alquiler con fines operativos de equipo de transporte aéreo sin operador: aeronaves, globos de aire caliente a largo plazo.	N7730.24.02	f
2530	Actividades de recepción de depósitos y/o similares cercanos de depósitos y la concesión de créditos o préstamos de fondos. La concesión de crédito puede adoptar diversas formas, como préstamos, hipotecas, transacciones con tarjetas de crédito, etc. Esas actividades son realizadas en general por instituciones monetarias diferentes de los bancos centrales, como; Actividades de concesión de crédito para compra de vivienda de instituciones especializadas que reciben depósitos (mutualistas).	Actividades de recepción de depósitos y/o similares cercanos de depósitos y la concesión de créditos o préstamos de fondos. La concesión de crédito puede adoptar diversas formas, como préstamos, hipotecas, transacciones con tarjetas de crédito, etc. Esas actividades son realizadas en general por instituciones monetarias diferentes de los bancos centrales, como; Actividades de concesión de crédito para compra de vivienda de instituciones especializadas que reciben depósitos (mutualistas).	K6419.03.01	f
2531	Actividades de sociedades de cartera, es decir, unidades tenedoras de activos de un grupo de empresas filiales (con participación de control en su capital social) y cuya actividad principal consiste en la propiedad del grupo. Las sociedades de cartera clasificadas en esta clase no suministran ningún otro servicio a las empresas participadas, es decir, no administran ni gestionan otras unidades.	Actividades de sociedades de cartera, es decir, unidades tenedoras de activos de un grupo de empresas filiales (con participación de control en su capital social) y cuya actividad principal consiste en la propiedad del grupo. Las sociedades de cartera clasificadas en esta clase no suministran ningún otro servicio a las empresas participadas, es decir, no administran ni gestionan otras unidades.	K6420.00.01	f
2532	Actividades de inversiones en bienes inmuebles efectuados por cuenta de otros intermediarios financieros (sociedades de inversión inmobiliaria).	Actividades de inversiones en bienes inmuebles efectuados por cuenta de otros intermediarios financieros (sociedades de inversión inmobiliaria).	K6420.00.02	f
2533	Actividades de entidades jurídicas organizadas para la mancomunión de valores u otros activos financieros, sin gestión, en nombre de accionistas o beneficiarios. Las carteras se adaptan a especificaciones concretas para lograr determinadas características; por ejemplo, de diversificación, riesgo, rendimiento y variabilidad de precio. Esas entidades obtienen intereses, dividendos y otras rentas de la propiedad, pero tienen pocos empleados y no obtienen ingresos por concepto de venta de servicios. Se incluyen las siguientes actividades: fondos de inversión de participación abierta; fondos de inversión cerrados; fideicomisos, legados o cuentas de agencia, administrados en nombre de los beneficiarios en virtud de un contrato de fiducia, un testamento o un contrato de representación; sociedades de inversión mobiliaria.	Actividades de entidades jurídicas organizadas para la mancomunión de valores u otros activos financieros, sin gestión, en nombre de accionistas o beneficiarios. Las carteras se adaptan a especificaciones concretas para lograr determinadas características; por ejemplo, de diversificación, riesgo, rendimiento y variabilidad de precio. Esas entidades obtienen intereses, dividendos y otras rentas de la propiedad, pero tienen pocos empleados y no obtienen ingresos por concepto de venta de servicios. Se incluyen las siguientes actividades: fondos de inversión de participación abierta; fondos de inversión cerrados; fideicomisos, legados o cuentas de agencia, administrados en nombre de los beneficiarios en virtud de un contrato de fiducia, un testamento o un contrato de representación; sociedades de inversión mobiliaria.	K6430.00.01	f
2534	Actividades de inversiones en valores mobiliarios (acciones obligaciones, efectos, lotes de valores mobiliarios de las sociedades de inversión, etc.).	Actividades de inversiones en valores mobiliarios (acciones obligaciones, efectos, lotes de valores mobiliarios de las sociedades de inversión, etc.).	K6430.00.02	f
2535	Actividades de transacciones por cuenta propia de corredores de bolsa.	Actividades de transacciones por cuenta propia de corredores de bolsa.	K6430.00.03	f
2536	Actividades de arrendamiento que cubre aproximadamente toda la vida útil prevista de un activo y en el que el arrendatario adquiere prácticamente todos los derechos de usufructo y asume todos los riesgos relacionados con la propiedad del activo, que puede o no ser objeto de traspaso. Esa modalidad de arrendamiento cubre la totalidad o la práctica totalidad de los costos, incluidos intereses.	Actividades de arrendamiento que cubre aproximadamente toda la vida útil prevista de un activo y en el que el arrendatario adquiere prácticamente todos los derechos de usufructo y asume todos los riesgos relacionados con la propiedad del activo, que puede o no ser objeto de traspaso. Esa modalidad de arrendamiento cubre la totalidad o la práctica totalidad de los costos, incluidos intereses.	K6491.00.01	f
2537	Actividades de otorgamiento de crédito de instituciones dedicadas a la intermediación monetaria en las que el crédito puede adoptar diferentes formas como: préstamos, hipotecas, tarjetas de crédito, etcétera. Proporcionando los servicios de: financiamiento para comercio internacional, provisión de financiamiento a largo plazo para la industria a través de bancos industriales, concesión de crédito a los consumidores.	Actividades de otorgamiento de crédito de instituciones dedicadas a la intermediación monetaria en las que el crédito puede adoptar diferentes formas como: préstamos, hipotecas, tarjetas de crédito, etcétera. Proporcionando los servicios de: financiamiento para comercio internacional, provisión de financiamiento a largo plazo para la industria a través de bancos industriales, concesión de crédito a los consumidores.	K6492.01.01	f
2538	Actividades de préstamos fuera del sistema bancario, otorgamiento de créditos para vivienda por instituciones especializadas que no reciben depósitos, se incluyen actividades realizadas por las casas de empeño y montes de piedad.	Actividades de préstamos fuera del sistema bancario, otorgamiento de créditos para vivienda por instituciones especializadas que no reciben depósitos, se incluyen actividades realizadas por las casas de empeño y montes de piedad.	K6492.02.01	f
2602	Elaboración y realización de proyectos de ingeniería química.	Elaboración y realización de proyectos de ingeniería química.	M7110.24.02	f
2603	Elaboración y realización de proyectos de ingeniería industrial.	Elaboración y realización de proyectos de ingeniería industrial.	M7110.24.03	f
2539	Otras actividades de servicios financieros consistentes principalmente en modalidades de distribución de fondos distintas de la concesión de préstamos: actividades de factorización, suscripción de permutas financieras, opciones y otros instrumentos de cobertura y actividades de compañías de liquidación por adelantado.	Otras actividades de servicios financieros consistentes principalmente en modalidades de distribución de fondos distintas de la concesión de préstamos: actividades de factorización, suscripción de permutas financieras, opciones y otros instrumentos de cobertura y actividades de compañías de liquidación por adelantado.	K6499.01.01	f
2721	Alquiler de aparatos eléctricos de uso doméstico.	Alquiler de aparatos eléctricos de uso doméstico.	N7729.02.03	f
78	Cultivo de caucho.	Cultivo de caucho.	A0129.09.01	t
2542	Actividades de intermediación financiera realizada por instituciones que no practican la intermediación monetaria y cuya función principal constituye la concesión de préstamos fuera del sistema bancario, financiación a largo plazo para el sector industrial, crédito a los consumidores (tarjetas de crédito). También se incluyen el crédito para la adquisición de vivienda por  parte de instituciones especializadas que también reciben depósitos.	Actividades de intermediación financiera realizada por instituciones que no practican la intermediación monetaria y cuya función principal constituye la concesión de préstamos fuera del sistema bancario, financiación a largo plazo para el sector industrial, crédito a los consumidores (tarjetas de crédito). También se incluyen el crédito para la adquisición de vivienda por  parte de instituciones especializadas que también reciben depósitos.	K6499.02.02	f
2543	Concertación de contratos de anualidades y pólizas de seguros de vida, seguros de invalidez y seguros de doble indemnización (tengan o no un componente importante de ahorro).	Concertación de contratos de anualidades y pólizas de seguros de vida, seguros de invalidez y seguros de doble indemnización (tengan o no un componente importante de ahorro).	K6511.00.01	f
2544	Suministros de servicios de seguros distintos de los seguros de vida: seguros de accidentes y contra incendios, seguros médicos, seguros de viajes, seguros de cosas, seguros de transporte por carretera, marítimo y aéreo, seguros contra pérdidas pecuniarias y de responsabilidad civil.	Suministros de servicios de seguros distintos de los seguros de vida: seguros de accidentes y contra incendios, seguros médicos, seguros de viajes, seguros de cosas, seguros de transporte por carretera, marítimo y aéreo, seguros contra pérdidas pecuniarias y de responsabilidad civil.	K6512.01.01	f
2545	Servicios de seguro de medicina pre pagada.	Servicios de seguro de medicina pre pagada.	K6512.02.01	f
2546	Actividades de asunción de la totalidad o una parte de los riesgos de pólizas de seguros existentes emitidas originariamente por otras compañías de seguros.	Actividades de asunción de la totalidad o una parte de los riesgos de pólizas de seguros existentes emitidas originariamente por otras compañías de seguros.	K6520.00.01	f
2547	Actividades de entidades jurídicas (es decir, de fondos, planes y/o programas) organizadas para proporcionar prestaciones de jubilación exclusivamente para los empleados o miembros de la entidad patrocinadora. Abarca planes de pensiones con prestaciones definidas y planes individuales en los que las prestaciones dependen de las contribuciones del afiliado. Se incluyen las siguientes actividades: Planes de prestaciones sociales para los empleados, fondos y planes de pensiones, planes de jubilación.	Actividades de entidades jurídicas (es decir, de fondos, planes y/o programas) organizadas para proporcionar prestaciones de jubilación exclusivamente para los empleados o miembros de la entidad patrocinadora. Abarca planes de pensiones con prestaciones definidas y planes individuales en los que las prestaciones dependen de las contribuciones del afiliado. Se incluyen las siguientes actividades: Planes de prestaciones sociales para los empleados, fondos y planes de pensiones, planes de jubilación.	K6530.00.01	f
2548	Gestión y supervisión de los mercados financieros por entidades distintas de las autoridades públicas, como: mercado (bolsas) de contratos de productos básicos, mercado (bolsas) de futuros, mercado (bolsas) de valores, mercados bursátiles, mercado (bolsas) de opciones sobre acciones o sobre productos básicos, etcétera.	Gestión y supervisión de los mercados financieros por entidades distintas de las autoridades públicas, como: mercado (bolsas) de contratos de productos básicos, mercado (bolsas) de futuros, mercado (bolsas) de valores, mercados bursátiles, mercado (bolsas) de opciones sobre acciones o sobre productos básicos, etcétera.	K6611.00.01	f
2549	Gestión y supervisión de los mercados financieros por entidades distintas de las autoridades públicas, como: mercado (bolsas) de valores.	Gestión y supervisión de los mercados financieros por entidades distintas de las autoridades públicas, como: mercado (bolsas) de valores.	K6611.00.02	f
2550	Actividades de administración de mercados financieros.	Actividades de administración de mercados financieros.	K6611.00.03	f
2551	Actividades de oficinas de cambio.	Actividades de oficinas de cambio.	K6612.01.01	f
2552	Operaciones en los mercados financieros por cuenta ajena (por ejemplo, correduría de bolsa) y actividades conexas. Incluye corretaje de contratos de productos básicos y corretaje de valores.	Operaciones en los mercados financieros por cuenta ajena (por ejemplo, correduría de bolsa) y actividades conexas. Incluye corretaje de contratos de productos básicos y corretaje de valores.	K6612.02.01	f
2553	Actividades auxiliares de las actividades de servicios financieros n.c.p., como: actividades de tramitación y liquidación de transacciones financieras, incluidas las transacciones con tarjetas de crédito.	Actividades auxiliares de las actividades de servicios financieros n.c.p., como: actividades de tramitación y liquidación de transacciones financieras, incluidas las transacciones con tarjetas de crédito.	K6619.01.01	f
2554	Actividades de Asesores Financieros.	Actividades de Asesores Financieros.	K6619.01.02	f
2555	Actividades de servicios de asesoramiento en inversiones y corredores hipotecarios.	Actividades de servicios de asesoramiento en inversiones y corredores hipotecarios.	K6619.02.01	f
2556	Servicios de administración fiduciaria y de custodia a cambio de una retribución o por contrato.	Servicios de administración fiduciaria y de custodia a cambio de una retribución o por contrato.	K6619.03.01	f
2604	Elaboración y realización de proyectos de ingeniería mecánica.	Elaboración y realización de proyectos de ingeniería mecánica.	M7110.24.04	f
2557	Actividades de prestación de servicios administrativos relacionados con los seguros, como la tasación y liquidación de reclamaciones. Se incluyen las siguientes actividades: evaluación de las reclamaciones, tasación de solicitudes de indemnización, evaluación del riesgo, evaluación de riesgos y daños, tasación de averías y pérdidas. Incluye la liquidación de solicitudes de indemnización.	Actividades de prestación de servicios administrativos relacionados con los seguros, como la tasación y liquidación de reclamaciones. Se incluyen las siguientes actividades: evaluación de las reclamaciones, tasación de solicitudes de indemnización, evaluación del riesgo, evaluación de riesgos y daños, tasación de averías y pérdidas. Incluye la liquidación de solicitudes de indemnización.	K6621.00.01	f
2558	Actividades de agentes y corredores de seguros (intermediarios de seguros) que venden, negocian u ofertan contratos de anualidades y pólizas de seguros y reaseguros.	Actividades de agentes y corredores de seguros (intermediarios de seguros) que venden, negocian u ofertan contratos de anualidades y pólizas de seguros y reaseguros.	K6622.00.01	f
2722	Alquiler de otros artículos de uso doméstico.	Alquiler de otros artículos de uso doméstico.	N7729.02.04	f
2559	Actividades estrechamente relacionadas con seguros y fondos de pensiones (excepto el ajuste de reclamaciones y las actividades de agentes de seguros) administración de salvamentos, servicios actuariales, etcétera.	Actividades estrechamente relacionadas con seguros y fondos de pensiones (excepto el ajuste de reclamaciones y las actividades de agentes de seguros) administración de salvamentos, servicios actuariales, etcétera.	K6629.00.01	f
2560	Actividades de personas, empresas y otras entidades que gestionan carteras y fondos a cambio de una retribución o por contrato. Se incluyen las siguientes actividades: gestión de fondos de pensiones, gestión de fondos mutuos de inversión y gestión de otros fondos de inversión.	Actividades de personas, empresas y otras entidades que gestionan carteras y fondos a cambio de una retribución o por contrato. Se incluyen las siguientes actividades: gestión de fondos de pensiones, gestión de fondos mutuos de inversión y gestión de otros fondos de inversión.	K6630.00.01	f
2561	Servicios de emisión de registro de valores.	Servicios de emisión de registro de valores.	K6630.00.02	f
2562	Compra - venta, alquiler y explotación de bienes inmuebles propios o arrendados, como: edificios de apartamentos y viviendas; edificios no residenciales, incluso salas de exposiciones; instalaciones para almacenaje, centros comerciales y terrenos; incluye el alquiler de casas y apartamentos amueblados o sin amueblar por períodos largos, en general por meses o por años.	Compra - venta, alquiler y explotación de bienes inmuebles propios o arrendados, como: edificios de apartamentos y viviendas; edificios no residenciales, incluso salas de exposiciones; instalaciones para almacenaje, centros comerciales y terrenos; incluye el alquiler de casas y apartamentos amueblados o sin amueblar por períodos largos, en general por meses o por años.	L6810.01.01	f
2563	Explotación de campamentos residenciales para casas móviles.	Explotación de campamentos residenciales para casas móviles.	L6810.02.01	f
2564	Promoción de proyectos de construcción (promoción inmobiliaria) para su posterior explotación, es decir, para alquilar espacio en esos edificios.	Promoción de proyectos de construcción (promoción inmobiliaria) para su posterior explotación, es decir, para alquilar espacio en esos edificios.	L6810.03.01	f
2565	Lotización y parcelación de propiedades inmobiliarias en lotes, sin mejora de los terrenos.	Lotización y parcelación de propiedades inmobiliarias en lotes, sin mejora de los terrenos.	L6810.04.01	f
2566	Actividades de acondicionamiento, urbanización (por cuenta de terceros), fraccionamiento de terrenos en solares y venta de terrenos.	Actividades de acondicionamiento, urbanización (por cuenta de terceros), fraccionamiento de terrenos en solares y venta de terrenos.	L6810.04.02	f
2567	Explotación de apartamentos con servicio de hotel.	Explotación de apartamentos con servicio de hotel.	L6810.04.03	f
2568	Venta de lotes de cementerios.	Venta de lotes de cementerios.	L6810.04.04	f
2569	Actividades de agentes y corredores inmobiliarios.	Actividades de agentes y corredores inmobiliarios.	L6820.01.01	f
2570	Intermediación en la compra, venta y alquiler de bienes inmuebles a cambio de una retribución o por contrato.	Intermediación en la compra, venta y alquiler de bienes inmuebles a cambio de una retribución o por contrato.	L6820.02.01	f
2571	Actividades de alquiler de bienes inmuebles a cambio de una retribución o por contrato (locales comerciales).	Actividades de alquiler de bienes inmuebles a cambio de una retribución o por contrato (locales comerciales).	L6820.02.02	f
2572	Actividades de alquiler de bienes inmuebles a cambio de una retribución o por contrato (vivienda).	Actividades de alquiler de bienes inmuebles a cambio de una retribución o por contrato (vivienda).	L6820.02.03	f
2573	Administración de bienes inmuebles a cambio de una retribución o por contrato.	Administración de bienes inmuebles a cambio de una retribución o por contrato.	L6820.03.01	f
2574	Administración de edificios de la administración pública propios o arrendados y administración de servicios de oficinas  centrales.	Administración de edificios de la administración pública propios o arrendados y administración de servicios de oficinas  centrales.	L6820.03.02	f
2575	Servicios de tasación inmobiliaria.	Servicios de tasación inmobiliaria.	L6820.04.01	f
2576	Actividades de agentes inmobiliarios neutrales que garantizan el cumplimiento de todas las condiciones de una transacción inmobiliaria (plicas inmobiliarias).	Actividades de agentes inmobiliarios neutrales que garantizan el cumplimiento de todas las condiciones de una transacción inmobiliaria (plicas inmobiliarias).	L6820.05.01	f
2577	Actividades de representación jurídica de los intereses de una parte contra otra, sea o no ante tribunales u otros órganos judiciales, realizadas por abogados o bajo la supervisión de abogados: asesoramiento y representación en procedimientos civiles.	Actividades de representación jurídica de los intereses de una parte contra otra, sea o no ante tribunales u otros órganos judiciales, realizadas por abogados o bajo la supervisión de abogados: asesoramiento y representación en procedimientos civiles.	M6910.01.01	f
2578	Actividades de representación jurídica de los intereses de una parte contra otra, sea o no ante tribunales u otros órganos judiciales, realizadas por abogados o bajo la supervisión de abogados: asesoramiento y representación en procedimientos penales.	Actividades de representación jurídica de los intereses de una parte contra otra, sea o no ante tribunales u otros órganos judiciales, realizadas por abogados o bajo la supervisión de abogados: asesoramiento y representación en procedimientos penales.	M6910.01.02	f
2605	Elaboración y realización de proyectos de ingeniería eléctrica y electrónica.	Elaboración y realización de proyectos de ingeniería eléctrica y electrónica.	M7110.24.05	f
2579	Actividades de representación jurídica de los intereses de una parte contra otra, sea o no ante tribunales u otros órganos judiciales, realizadas por abogados o bajo la supervisión de abogados: asesoramiento y representación en procedimientos en relación con conflictos laborales.	Actividades de representación jurídica de los intereses de una parte contra otra, sea o no ante tribunales u otros órganos judiciales, realizadas por abogados o bajo la supervisión de abogados: asesoramiento y representación en procedimientos en relación con conflictos laborales.	M6910.01.03	f
2580	Preparacion de documentos juridicos distintos de los relacionados con pleitos (escrituras de constitucion, contratos para la formacion de sociedades, patentes, derechos de autor, testamentos, etc.).	Preparacion de documentos juridicos distintos de los relacionados con pleitos (escrituras de constitucion, contratos para la formacion de sociedades, patentes, derechos de autor, testamentos, etc.).	M6910.01.04	f
2724	Alquiler de instrumentos musicales.	Alquiler de instrumentos musicales.	N7729.03.02	f
2725	Alquiler de material de escenografía y de vestuario.	Alquiler de material de escenografía y de vestuario.	N7729.03.03	f
2581	Actividades de notarios públicos, prestación de asesoramiento en general, preparación de documentos jurídicos: escrituras de constitución, contratos de sociedad y documentos similares para la formación de sociedades, patentes y derechos de autor, escrituras, testamentos, fideicomisos, etcétera.	Actividades de notarios públicos, prestación de asesoramiento en general, preparación de documentos jurídicos: escrituras de constitución, contratos de sociedad y documentos similares para la formación de sociedades, patentes y derechos de autor, escrituras, testamentos, fideicomisos, etcétera.	M6910.02.01	f
2582	Otras actividades de ejecutores judiciales, alguaciles, árbitros, examinadores y mediadores.	Otras actividades de ejecutores judiciales, alguaciles, árbitros, examinadores y mediadores.	M6910.03.01	f
2583	Otras actividades de asesoramiento y representación en procedimientos jurídicos (derecho constitucional, administrativo, militar, etcétera).	Otras actividades de asesoramiento y representación en procedimientos jurídicos (derecho constitucional, administrativo, militar, etcétera).	M6910.09.01	f
2584	Actividades de registro de las transacciones comerciales de empresas y otras entidades.	Actividades de registro de las transacciones comerciales de empresas y otras entidades.	M6920.01.01	f
2585	Actividades de preparación o auditoria de las cuentas financieras y examen y certificación de cuentas.	Actividades de preparación o auditoria de las cuentas financieras y examen y certificación de cuentas.	M6920.02.01	f
2586	Actividades de preparación de las declaraciones tributarias de las personas y empresas; asesoramiento y de representación de clientes ante las autoridades tributarias.	Actividades de preparación de las declaraciones tributarias de las personas y empresas; asesoramiento y de representación de clientes ante las autoridades tributarias.	M6920.03.01	f
2587	Registro contable de transacciones comerciales para empresas u otras entidades.	Registro contable de transacciones comerciales para empresas u otras entidades.	M6920.04.01	f
2588	Otras actividades de contabilidad, teneduría de libros.	Otras actividades de contabilidad, teneduría de libros.	M6920.09.01	f
2589	Otras actividades de auditoria.	Otras actividades de auditoria.	M6920.09.02	f
2590	Otras actividades de consultoría fiscal (procesamiento de nómina, etcétera).	Otras actividades de consultoría fiscal (procesamiento de nómina, etcétera).	M6920.09.03	f
2591	Supervisión y gestión de otras unidades de la misma compañía o empresa, asumiendo la planificación estratégica, organizativa y la función de toma de decisiones de la compañía o empresa; ejerciendo el control operativo y la gestión de las operaciones corrientes de las otras unidades: oficinas principales, oficinas administrativas centralizadas, sedes, oficinas de distrito, regionales y oficinas subsidiarias de gestión.	Supervisión y gestión de otras unidades de la misma compañía o empresa, asumiendo la planificación estratégica, organizativa y la función de toma de decisiones de la compañía o empresa; ejerciendo el control operativo y la gestión de las operaciones corrientes de las otras unidades: oficinas principales, oficinas administrativas centralizadas, sedes, oficinas de distrito, regionales y oficinas subsidiarias de gestión.	M7010.00.01	f
2592	Servicios de asesoramiento, orientación y asistencia operativa a las empresas y a la administración pública en materia de: relaciones públicas y comunicaciones.	Servicios de asesoramiento, orientación y asistencia operativa a las empresas y a la administración pública en materia de: relaciones públicas y comunicaciones.	M7020.01.01	f
2593	Servicios de asesoramiento, orientación y asistencia operativa a las empresas y a la administración pública en materia de: actividades de cabildeo (grupos de presión (lobbies)).	Servicios de asesoramiento, orientación y asistencia operativa a las empresas y a la administración pública en materia de: actividades de cabildeo (grupos de presión (lobbies)).	M7020.02.01	f
2594	Servicios de  asesoramiento, orientación y asistencia operativa a las empresas y a la administración pública en materia de: diseño de métodos o procedimientos contables, programas de contabilidad de costos y procedimientos de control presupuestario.	Servicios de  asesoramiento, orientación y asistencia operativa a las empresas y a la administración pública en materia de: diseño de métodos o procedimientos contables, programas de contabilidad de costos y procedimientos de control presupuestario.	M7020.03.01	f
2595	Prestación de asesoramiento y ayuda a las empresas y las administraciones públicas en materia de planificación, organización, eficiencia y control, información administrativa, etcétera.	Prestación de asesoramiento y ayuda a las empresas y las administraciones públicas en materia de planificación, organización, eficiencia y control, información administrativa, etcétera.	M7020.04.01	f
2596	Actividades de asesoramiento técnico de arquitectura en diseño de edificios y dibujo de planos de construcción.	Actividades de asesoramiento técnico de arquitectura en diseño de edificios y dibujo de planos de construcción.	M7110.11.01	f
2597	Actividades de asesoramiento técnico de arquitectura en planificación urbana y arquitectura paisajista.	Actividades de asesoramiento técnico de arquitectura en planificación urbana y arquitectura paisajista.	M7110.12.01	f
2598	Actividades de diseño de ingeniería (es decir, aplicación de las leyes físicas y de los principios de ingeniería al diseño de máquinas, materiales, instrumentos, estructuras, procesos y sistemas) y asesoría de ingeniería para maquinaría, procesos y plantas industriales.	Actividades de diseño de ingeniería (es decir, aplicación de las leyes físicas y de los principios de ingeniería al diseño de máquinas, materiales, instrumentos, estructuras, procesos y sistemas) y asesoría de ingeniería para maquinaría, procesos y plantas industriales.	M7110.21.01	f
2599	Actividades de diseño de ingeniería y consultoría de ingeniería para proyectos de ingeniería civil, hidráulica y de tráfico.	Actividades de diseño de ingeniería y consultoría de ingeniería para proyectos de ingeniería civil, hidráulica y de tráfico.	M7110.22.01	f
2606	Elaboración y realización de proyectos de ingeniería eléctrica y electrónica.	Elaboración y realización de proyectos de ingeniería eléctrica y electrónica.	M7110.24.05	f
2607	Elaboración y realización de proyectos de ingeniería de sistemas.	Elaboración y realización de proyectos de ingeniería de sistemas.	M7110.24.06	f
2608	Actividades de diseño de ingeniería y consultoría de ingeniería para gestión de proyectos relacionados con la construcción.	Actividades de diseño de ingeniería y consultoría de ingeniería para gestión de proyectos relacionados con la construcción.	M7110.25.01	f
2726	Alquiler de libros, periódicos y revistas.	Alquiler de libros, periódicos y revistas.	N7729.04.01	f
2746	Alquiler de construcciones móviles temporales para alojamiento u oficinas.	Alquiler de construcciones móviles temporales para alojamiento u oficinas.	N7730.31.01	f
2609	Elaboración de proyectos de ingeniería especializada en sistemas de acondicionado de aire, refrigeración, saneamiento, control de la contaminación, acondicionamiento acústico, etcétera.	Elaboración de proyectos de ingeniería especializada en sistemas de acondicionado de aire, refrigeración, saneamiento, control de la contaminación, acondicionamiento acústico, etcétera.	M7110.26.01	f
2610	Actividades de direccion de obras.	Actividades de direccion de obras.	M7110.27.01	f
2611	Otras actividades de diseño y asesoría de ingeniería.	Otras actividades de diseño y asesoría de ingeniería.	M7110.29.01	f
2612	Actividades de topografía (agrimensura, medición de tierras y límites), actividades de estudios hidrológicos y actividades de estudios de subsuelo.	Actividades de topografía (agrimensura, medición de tierras y límites), actividades de estudios hidrológicos y actividades de estudios de subsuelo.	M7110.31.01	f
2613	Actividades cartográficas y de información espacial.	Actividades cartográficas y de información espacial.	M7110.32.01	f
2614	Actividades de estudios geofísicos, geológicos y sismográficos.	Actividades de estudios geofísicos, geológicos y sismográficos.	M7110.33.01	f
2615	Actividades geológicas y de prospección: medición y observación de superficie para determinar la estructura del subsuelo, la ubicación de yacimientos de petroleo, gas natural, minerales y depositos de aguas, subterraneos; estudios aerogeofísicos.	Actividades geológicas y de prospección: medición y observación de superficie para determinar la estructura del subsuelo, la ubicación de yacimientos de petroleo, gas natural, minerales y depositos de aguas, subterraneos; estudios aerogeofísicos.	M7110.34.01	f
2616	Otras actividades de arquitectura e ingeniería y actividades conexas de consultoría técnica.	Otras actividades de arquitectura e ingeniería y actividades conexas de consultoría técnica.	M7110.90.01	f
2617	Realización de ensayos físicos, químicos y otros ensayos analíticos de todo tipo de materiales y productos: ensayos acústicos y de vibraciones, ensayos de calificación, fiabilidad y análisis de defectos.	Realización de ensayos físicos, químicos y otros ensayos analíticos de todo tipo de materiales y productos: ensayos acústicos y de vibraciones, ensayos de calificación, fiabilidad y análisis de defectos.	M7120.11.01	f
2618	Actividades de análisis de la composición y pureza de minerales, etcétera.	Actividades de análisis de la composición y pureza de minerales, etcétera.	M7120.12.01	f
2619	Actividades de ensayos en el campo de la higiene alimentaria, incluidas actividades de ensayo y control veterinario en relación con la producción de alimentos.	Actividades de ensayos en el campo de la higiene alimentaria, incluidas actividades de ensayo y control veterinario en relación con la producción de alimentos.	M7120.13.01	f
2620	Actividades de ensayos para determinar las propiedades físicas y el rendimiento de productos y materiales en cuanto, a su resistencia, espesor, durabilidad, radiactividad, etcétera.	Actividades de ensayos para determinar las propiedades físicas y el rendimiento de productos y materiales en cuanto, a su resistencia, espesor, durabilidad, radiactividad, etcétera.	M7120.14.01	f
2621	Actividades de ensayos y mediciones de indicadores ambientales: contaminación del aire y del agua etcétera.	Actividades de ensayos y mediciones de indicadores ambientales: contaminación del aire y del agua etcétera.	M7120.15.01	f
2622	Actividades de ensayos de ensayos radiográficos de soldaduras y juntas y rendimiento de maquinaría completa: motores, automóviles, equipo electrónico, etcétera.	Actividades de ensayos de ensayos radiográficos de soldaduras y juntas y rendimiento de maquinaría completa: motores, automóviles, equipo electrónico, etcétera.	M7120.16.01	f
2623	Actividades de certificación de productos, como bienes de consumo, vehículos automotores, aeronaves, contenedores presurizados, centrales nucleares, etcétera.	Actividades de certificación de productos, como bienes de consumo, vehículos automotores, aeronaves, contenedores presurizados, centrales nucleares, etcétera.	M7120.91.01	f
2624	Pruebas periódicas de seguridad vial de vehículos automotores.	Pruebas periódicas de seguridad vial de vehículos automotores.	M7120.92.01	f
2625	Pruebas periódicas de seguridad de instrumentos o equipo electrónico.	Pruebas periódicas de seguridad de instrumentos o equipo electrónico.	M7120.92.02	f
2626	Actividades de análisis y pruebas relacionadas a campos científicos.	Actividades de análisis y pruebas relacionadas a campos científicos.	M7120.93.01	f
2627	Ensayos radiograficos de soldaduras y articulaciones.	Ensayos radiograficos de soldaduras y articulaciones.	M7120.93.02	f
2628	Actividades de laboratorios policiales.	Actividades de laboratorios policiales.	M7120.94.01	f
2629	Otras actividades de ensayos y análisis técnicos: ensayos basados en la utilización de maquetas o modelos (de aeronaves, de embarcaciones, de presas, etcétera).	Otras actividades de ensayos y análisis técnicos: ensayos basados en la utilización de maquetas o modelos (de aeronaves, de embarcaciones, de presas, etcétera).	M7120.99.01	f
2630	Investigaciones y desarrollo experimental en el campo de la biotecnología de: ADN/ARN, genómica, farmacogenómica, sondas genéticas, ingeniería genética, secuenciación y amplificación de ADN y ARN, patrones de expresión génica el uso de tecnología antisense, vectores genéticos y de ARN, terapia genética y vectores virales.	Investigaciones y desarrollo experimental en el campo de la biotecnología de: ADN/ARN, genómica, farmacogenómica, sondas genéticas, ingeniería genética, secuenciación y amplificación de ADN y ARN, patrones de expresión génica el uso de tecnología antisense, vectores genéticos y de ARN, terapia genética y vectores virales.	M7210.11.01	f
2662	Creación y colocación de anuncios de publicidad al aire libre en: carteles, tableros, boletines y carteleras.	Creación y colocación de anuncios de publicidad al aire libre en: carteles, tableros, boletines y carteleras.	M7310.02.01	f
2664	Diseño de salas de exhibicion.	Diseño de salas de exhibicion.	M7310.02.03	f
2631	Investigaciones y desarrollo experimental en el campo de la biotecnología de: proteínas y otras moléculas secuenciación, síntesis e ingeniería de proteínas y péptidos (que incluye hormonas de gran tamaño molecular), mejora de métodos de liberación de drogas de gran tamaño, proteómica, aislamiento y purificación de proteínas, señalización e identificación de receptores celulares.	Investigaciones y desarrollo experimental en el campo de la biotecnología de: proteínas y otras moléculas secuenciación, síntesis e ingeniería de proteínas y péptidos (que incluye hormonas de gran tamaño molecular), mejora de métodos de liberación de drogas de gran tamaño, proteómica, aislamiento y purificación de proteínas, señalización e identificación de receptores celulares.	M7210.12.01	f
2632	Investigaciones y desarrollo experimental en el campo de la biotecnología de: cultivos e ingeniería celulares y de tejidos, ingeniería tisular (que incluyen implantes de tejido e ingeniería biomédica) en fusión celular, vacunas/estimulantes del sistema inmune, manipulación embrionaria.	Investigaciones y desarrollo experimental en el campo de la biotecnología de: cultivos e ingeniería celulares y de tejidos, ingeniería tisular (que incluyen implantes de tejido e ingeniería biomédica) en fusión celular, vacunas/estimulantes del sistema inmune, manipulación embrionaria.	M7210.13.01	f
2633	Investigaciones y desarrollo experimental en el campo de la técnicas de proceso biotecnológicos: fermentación mediante el uso de biorreactores, procesado biológico, biodecantación, biopulping, bioblanqueo, biodesulfurización, biorremediación, biofiltración y fitorremediación.	Investigaciones y desarrollo experimental en el campo de la técnicas de proceso biotecnológicos: fermentación mediante el uso de biorreactores, procesado biológico, biodecantación, biopulping, bioblanqueo, biodesulfurización, biorremediación, biofiltración y fitorremediación.	M7210.14.01	f
2634	Investigaciones y desarrollo experimental en el campo de la Bioinformática: construcción de bases de datos genómicas, secuencias de proteínas, modelización de procesos biológicos complejos que incluyen biología de sistemas.	Investigaciones y desarrollo experimental en el campo de la Bioinformática: construcción de bases de datos genómicas, secuencias de proteínas, modelización de procesos biológicos complejos que incluyen biología de sistemas.	M7210.15.01	f
2635	Investigaciones y desarrollo experimental en el campo de la Nanobiotecnología: aplicación de técnicas y procesos de nano/micro fabricación para la construcción de aparatos para el estudio de biosistemas y aplicaciones en liberación de drogas, diagnósticos, etcétera.	Investigaciones y desarrollo experimental en el campo de la Nanobiotecnología: aplicación de técnicas y procesos de nano/micro fabricación para la construcción de aparatos para el estudio de biosistemas y aplicaciones en liberación de drogas, diagnósticos, etcétera.	M7210.16.01	f
2636	Investigación y desarrollo experimental en ciencias química.	Investigación y desarrollo experimental en ciencias química.	M7210.21.01	f
2637	Investigación y desarrollo experimental en ciencias biología.	Investigación y desarrollo experimental en ciencias biología.	M7210.21.02	f
2638	Investigación y desarrollo experimental en ciencias física.	Investigación y desarrollo experimental en ciencias física.	M7210.21.03	f
2639	Investigación y desarrollo experimental en ciencias geología.	Investigación y desarrollo experimental en ciencias geología.	M7210.21.04	f
2640	Investigación y desarrollo experimental en ciencias astronomía.	Investigación y desarrollo experimental en ciencias astronomía.	M7210.21.05	f
2641	Investigación y desarrollo en ingeniería y tecnología.	Investigación y desarrollo en ingeniería y tecnología.	M7210.22.01	f
2642	Investigación y desarrollo en ciencias médicas y farmacéticas.	Investigación y desarrollo en ciencias médicas y farmacéticas.	M7210.23.01	f
2643	Investigación y desarrollo en ciencias agropecuarias.	Investigación y desarrollo en ciencias agropecuarias.	M7210.24.01	f
2644	Investigación y desarrollo interdisciplinarios centrados principalmente en las ciencias naturales.	Investigación y desarrollo interdisciplinarios centrados principalmente en las ciencias naturales.	M7210.25.01	f
2645	Investigación y desarrollo interdisciplinarios centrados principalmente en la ingeniería.	Investigación y desarrollo interdisciplinarios centrados principalmente en la ingeniería.	M7210.25.02	f
2646	Investigacion y desarrollo de las ciencias Matematicas y Físicas.	Investigacion y desarrollo de las ciencias Matematicas y Físicas.	M7210.26.01	f
2647	Investigacion y desarrollo en la Agronomia.	Investigacion y desarrollo en la Agronomia.	M7210.27.01	f
2648	Otras actividades de investigación y desarrollo experimental en ciencias naturales y la ingeniería (propiedad intelectual, secreto comercial, patentes, etcétera).	Otras actividades de investigación y desarrollo experimental en ciencias naturales y la ingeniería (propiedad intelectual, secreto comercial, patentes, etcétera).	M7210.29.01	f
2649	Investigación y desarrollo en ciencias sociales y humanidades.	Investigación y desarrollo en ciencias sociales y humanidades.	M7220.01.01	f
2650	Investigacion y desarrollo en letras.	Investigacion y desarrollo en letras.	M7220.02.01	f
2651	Investigacion y desarrollo en sociologia.	Investigacion y desarrollo en sociologia.	M7220.02.02	f
2652	Investigacion y desarrollo en psicologia.	Investigacion y desarrollo en psicologia.	M7220.02.03	f
2653	Investigacion y desarrollo en las ciencias economicas.	Investigacion y desarrollo en las ciencias economicas.	M7220.03.01	f
2654	Investigacion y desarrollo en el derecho y jurisprudencia.	Investigacion y desarrollo en el derecho y jurisprudencia.	M7220.04.01	f
2655	Investigacion y desarrollo en la linguistica y los idiomas.	Investigacion y desarrollo en la linguistica y los idiomas.	M7220.05.01	f
2656	Otras actividades de investigación y desarrollo experimental en el campo de las ciencias sociales y las humanidades e interdisciplinarios.	Otras actividades de investigación y desarrollo experimental en el campo de las ciencias sociales y las humanidades e interdisciplinarios.	M7220.09.01	f
2657	Creación e inserción de anuncios en periódicos.	Creación e inserción de anuncios en periódicos.	M7310.01.01	f
2658	Creación e inserción de anuncios en revistas.	Creación e inserción de anuncios en revistas.	M7310.01.02	f
2659	Creación e inserción de anuncios en programas de radio.	Creación e inserción de anuncios en programas de radio.	M7310.01.03	f
2660	Creación e inserción de anuncios en programas de televisión.	Creación e inserción de anuncios en programas de televisión.	M7310.01.04	f
2661	Creación e inserción de anuncios en Internet y otros medios de difusión.	Creación e inserción de anuncios en Internet y otros medios de difusión.	M7310.01.05	f
2666	Distribucion de materiales o muestras de publicidad y alquiler de espacios de publicidad.	Distribucion de materiales o muestras de publicidad y alquiler de espacios de publicidad.	M7310.02.05	f
2667	Representación de medios de difusión, venta de tiempo y espacio en diversos medios de difusión interesados en la obtención de anuncios y publicidad aérea.	Representación de medios de difusión, venta de tiempo y espacio en diversos medios de difusión interesados en la obtención de anuncios y publicidad aérea.	M7310.03.01	f
2742	Alquiler con fines operativos de equipo de transporte acuático sin operador: barcos y buques comerciales, a corto plazo.	Alquiler con fines operativos de equipo de transporte acuático sin operador: barcos y buques comerciales, a corto plazo.	N7730.23.01	f
2668	Realización de campañas de comercialización y otros servicios de publicidad dirigidos a atraer y retener clientes: promoción de productos, comercialización en el punto de venta, publicidad directa por correo y asesoramiento en marketing, creación de stands, otras estructuras y lugares de exhibición, distribución o entrega de materiales o muestras de publicidad.	Realización de campañas de comercialización y otros servicios de publicidad dirigidos a atraer y retener clientes: promoción de productos, comercialización en el punto de venta, publicidad directa por correo y asesoramiento en marketing, creación de stands, otras estructuras y lugares de exhibición, distribución o entrega de materiales o muestras de publicidad.	M7310.04.01	f
2669	Alquiler de espacios de publicidad en vallas publicitarias, etcétera.	Alquiler de espacios de publicidad en vallas publicitarias, etcétera.	M7310.05.01	f
2670	Otros servicios de publicidad n.c.p.	Otros servicios de publicidad n.c.p.	M7310.09.01	f
2671	Estudios sobre las posibilidades de comercialización (mercados potenciales), la aceptación y el grado de conocimiento de los productos y los hábitos de compra de los consumidores con el objeto de promover las ventas y desarrollar nuevos productos, incluidos análisis estadísticos de los resultados.	Estudios sobre las posibilidades de comercialización (mercados potenciales), la aceptación y el grado de conocimiento de los productos y los hábitos de compra de los consumidores con el objeto de promover las ventas y desarrollar nuevos productos, incluidos análisis estadísticos de los resultados.	M7320.01.01	f
2672	Encuestas de opinión públicas sobre cuestiones políticas, económicas y sociales, así como sus análisis estadísticos de los resultados de esas encuestas.	Encuestas de opinión públicas sobre cuestiones políticas, económicas y sociales, así como sus análisis estadísticos de los resultados de esas encuestas.	M7320.02.01	f
2673	Diseño de telas, prendas de vestir, calzado, joyas, muebles y otros artículos de decoración interior y de moda, así como de otros efectos personales y enseres domésticos.	Diseño de telas, prendas de vestir, calzado, joyas, muebles y otros artículos de decoración interior y de moda, así como de otros efectos personales y enseres domésticos.	M7410.01.01	f
2674	Diseño industrial, es decir creación y desarrollo de diseños y especificaciones que optimizan la utilización, el valor y la apariencia de los productos, incluyendo la determinación de los materiales, la construcción, el mecanismo, la forma, el color y el acabado del producto, teniendo en cuenta las características y necesidades humanas y consideraciones relacionadas con la seguridad, el atractivo en el mercado, la eficiencia en la producción, la distribución, la utilización, y la facilidad de mantenimiento.	Diseño industrial, es decir creación y desarrollo de diseños y especificaciones que optimizan la utilización, el valor y la apariencia de los productos, incluyendo la determinación de los materiales, la construcción, el mecanismo, la forma, el color y el acabado del producto, teniendo en cuenta las características y necesidades humanas y consideraciones relacionadas con la seguridad, el atractivo en el mercado, la eficiencia en la producción, la distribución, la utilización, y la facilidad de mantenimiento.	M7410.02.01	f
2675	Actividades de diseñadores gráficos.	Actividades de diseñadores gráficos.	M7410.03.01	f
2676	Actividades de decoradores de interiores.	Actividades de decoradores de interiores.	M7410.04.01	f
2677	Otras actividades especializadas de diseño.	Otras actividades especializadas de diseño.	M7410.09.01	f
2678	Realización de retratos fotográficos para pasaportes, actos académicos, bodas, etcétera, incluido las filmaciones en vídeo de acontecimientos.	Realización de retratos fotográficos para pasaportes, actos académicos, bodas, etcétera, incluido las filmaciones en vídeo de acontecimientos.	M7420.01.01	f
2679	Realización de fotografías para anuncios comerciales, para editoriales, y para actividades relacionadas con la moda, los bienes raíces o el turismo, actividades de fotógrafos de prensa.	Realización de fotografías para anuncios comerciales, para editoriales, y para actividades relacionadas con la moda, los bienes raíces o el turismo, actividades de fotógrafos de prensa.	M7420.02.01	f
2680	Realización de fotografía especializada como: fotografía aérea, fotografía submarina, fotografía médica, etcétera.	Realización de fotografía especializada como: fotografía aérea, fotografía submarina, fotografía médica, etcétera.	M7420.03.01	f
2681	Actividades de revelado, impresión, ampliación de fotografías y películas de los clientes, laboratorios de revelado de películas e impresión de fotografías; copia, restauración y retoque de fotografías, negativos de fotografías y películas, incluido actividades de tiendas de revelado rápido (que no formen parte de comercios de venta al por menor de cámaras).	Actividades de revelado, impresión, ampliación de fotografías y películas de los clientes, laboratorios de revelado de películas e impresión de fotografías; copia, restauración y retoque de fotografías, negativos de fotografías y películas, incluido actividades de tiendas de revelado rápido (que no formen parte de comercios de venta al por menor de cámaras).	M7420.04.01	f
2682	Otras actividades de fotografía: montaje de diapositivas, microfilmación de documentos, etcétera.	Otras actividades de fotografía: montaje de diapositivas, microfilmación de documentos, etcétera.	M7420.09.01	f
2683	Prestacion de servicios profesionales.	Prestacion de servicios profesionales.	M7490.10.01	f
2684	Actividades de traducción e interpretación.	Actividades de traducción e interpretación.	M7490.11.01	f
2685	Actividades de corretaje empresarial, gestión de la compra o venta de pequeñas y medianas empresas, incluidas prácticas profesionales y excluidas las actividades de corretaje inmobiliario.	Actividades de corretaje empresarial, gestión de la compra o venta de pequeñas y medianas empresas, incluidas prácticas profesionales y excluidas las actividades de corretaje inmobiliario.	M7490.12.01	f
2686	Actividades de intermediación en materia de patentes (gestión de la compra y venta de patentes).	Actividades de intermediación en materia de patentes (gestión de la compra y venta de patentes).	M7490.13.01	f
2687	Actividades de tasación para antigüedades, joyas, etcétera, distintas de la tasación de inmuebles y de la relacionada con los seguros.	Actividades de tasación para antigüedades, joyas, etcétera, distintas de la tasación de inmuebles y de la relacionada con los seguros.	M7490.14.01	f
2688	Actividades de pronóstico del tiempo (previsión meteorológica).	Actividades de pronóstico del tiempo (previsión meteorológica).	M7490.15.01	f
2743	Alquiler con fines operativos de equipo de transporte acuático sin operador: barcos y buques comerciales, a largo plazo.	Alquiler con fines operativos de equipo de transporte acuático sin operador: barcos y buques comerciales, a largo plazo.	N7730.23.02	f
2690	Otras actividades profesionales, científicas y técnicas: redacción, diseños detallados realizados por dibujantes arquitectónicos, lectura de contadores de gas, agua y energía eléctrica, auditoría de efectos e información sobre fletes, medidores de cantidades de obra (certificación de obra), etcétera.	Otras actividades profesionales, científicas y técnicas: redacción, diseños detallados realizados por dibujantes arquitectónicos, lectura de contadores de gas, agua y energía eléctrica, auditoría de efectos e información sobre fletes, medidores de cantidades de obra (certificación de obra), etcétera.	M7490.19.01	f
2691	Actividades de consultoría de seguridad.	Actividades de consultoría de seguridad.	M7490.21.01	f
2692	Actividades de consultoría de agronomía.	Actividades de consultoría de agronomía.	M7490.22.01	f
2693	Actividades de consultoría ambiental.	Actividades de consultoría ambiental.	M7490.23.01	f
2694	Actividades de consultoría distintas de las de arquitectura, ingeniería y gestión.	Actividades de consultoría distintas de las de arquitectura, ingeniería y gestión.	M7490.24.01	f
2695	Otros tipos de consultoría técnica.	Otros tipos de consultoría técnica.	M7490.29.01	f
2696	Actividades realizadas por agencias en nombre de particulares para obtener contratos de actuación en películas, obras de teatro y otros espectáculos culturales y deportivos.	Actividades realizadas por agencias en nombre de particulares para obtener contratos de actuación en películas, obras de teatro y otros espectáculos culturales y deportivos.	M7490.90.01	f
2697	Actividades realizadas por agencias en nombre de particulares para ofertar libros, guiones, obras de arte, fotografías, etcétera, a editores, productores, etcétera.	Actividades realizadas por agencias en nombre de particulares para ofertar libros, guiones, obras de arte, fotografías, etcétera, a editores, productores, etcétera.	M7490.90.02	f
2698	Actividades de atención médica y control de animales, excluido los domésticos. Estas actividades son llevadas a cabo por veterinarios cualificados que prestan servicios en hospitales veterinarios así como también en establecimientos agropecuarios, a domicilio, en consultorios, quirófanos privados y en otros lugares.	Actividades de atención médica y control de animales, excluido los domésticos. Estas actividades son llevadas a cabo por veterinarios cualificados que prestan servicios en hospitales veterinarios así como también en establecimientos agropecuarios, a domicilio, en consultorios, quirófanos privados y en otros lugares.	M7500.01.01	f
2699	Actividades de atención medica, quirúrgica u odontológica de animales, realizados por instituciones distintas a los hospitales; establecimientos agropecuarios, perreras, consultorios y salas de cirugía privados o en otros lugares.	Actividades de atención medica, quirúrgica u odontológica de animales, realizados por instituciones distintas a los hospitales; establecimientos agropecuarios, perreras, consultorios y salas de cirugía privados o en otros lugares.	M7500.01.02	f
2700	Actividades de atención médica y control de animales domésticos. Estas actividades son llevadas a cabo por veterinarios cualificados que prestan servicios en hospitales veterinarios así como también en establecimientos agropecuarios, en perreras, a domicilio, en consultorios, quirófanos privados y en otros lugares.	Actividades de atención médica y control de animales domésticos. Estas actividades son llevadas a cabo por veterinarios cualificados que prestan servicios en hospitales veterinarios así como también en establecimientos agropecuarios, en perreras, a domicilio, en consultorios, quirófanos privados y en otros lugares.	M7500.02.01	f
2701	Actividades de asistentes de veterinario u otro personal veterinario auxiliar.	Actividades de asistentes de veterinario u otro personal veterinario auxiliar.	M7500.03.01	f
2702	Actividades clínico patológicas y otras actividades de diagnóstico relacionadas con los animales.	Actividades clínico patológicas y otras actividades de diagnóstico relacionadas con los animales.	M7500.04.01	f
2703	Actividades de veterinaria que requieren la utilización de ambulancia.	Actividades de veterinaria que requieren la utilización de ambulancia.	M7500.05.01	f
2704	Actividades de alquiler con fines operativos de automóviles de pasajeros, camiones, camionetas, remolques y vehículos de recreo. (sin conductor).	Actividades de alquiler con fines operativos de automóviles de pasajeros, camiones, camionetas, remolques y vehículos de recreo. (sin conductor).	N7710.00.01	f
2705	Actividades de alquiler con fines operativos de remolques y vehículos de recreo sin conductor.	Actividades de alquiler con fines operativos de remolques y vehículos de recreo sin conductor.	N7710.00.02	f
2706	Alquiler de motocicletas o casas rodantes, sin conductor. el alquiler puede ser a corto y largo plazo, incluye o no servicios de mantenimiento.	Alquiler de motocicletas o casas rodantes, sin conductor. el alquiler puede ser a corto y largo plazo, incluye o no servicios de mantenimiento.	N7710.00.03	f
2707	Alquiler de locomotoras y vagones de ferrocarril sin conductor.  el alquiler puede ser a corto y largo plazo, incluye o no servicios de mantenimiento.	Alquiler de locomotoras y vagones de ferrocarril sin conductor.  el alquiler puede ser a corto y largo plazo, incluye o no servicios de mantenimiento.	N7710.00.04	f
2708	Alquiler de embarcaciones de recreo, canoas y veleros.	Alquiler de embarcaciones de recreo, canoas y veleros.	N7721.01.01	f
2709	Alquiler de caballos de montar.	Alquiler de caballos de montar.	N7721.01.02	f
2711	Alquiler de hamacas de playa y sombrillas (parasoles).	Alquiler de hamacas de playa y sombrillas (parasoles).	N7721.03.01	f
2713	Alquiler de otros tipos de equipo de deporte, alas delta con motor y sin motor, etcétera.	Alquiler de otros tipos de equipo de deporte, alas delta con motor y sin motor, etcétera.	N7721.09.01	f
2714	Alquiler de cintas de video, discos, CD, DVD, etcétera.	Alquiler de cintas de video, discos, CD, DVD, etcétera.	N7722.00.01	f
2715	Alquiler de cintas de video, discos, CD, DVD, etcétera.	Alquiler de cintas de video, discos, CD, DVD, etcétera.	N7722.00.01	f
2716	Alquiler de prendas de vestir y calzado.	Alquiler de prendas de vestir y calzado.	N7729.01.01	f
2717	Alquiler de productos textiles.	Alquiler de productos textiles.	N7729.01.02	f
2719	Alquiler de artículos de cerámica y de vidrio, utensilios de cocina, vajillas.	Alquiler de artículos de cerámica y de vidrio, utensilios de cocina, vajillas.	N7729.02.02	f
2720	Alquiler de artículos de cerámica y de vidrio, utensilios de cocina, vajillas.	Alquiler de artículos de cerámica y de vidrio, utensilios de cocina, vajillas.	N7729.02.02	f
2727	Alquiler y arrendamiento de otros efectos personales y enseres domésticos: maquinaría y equipo de bricolaje, por ejemplo: herramientas para reparaciones domésticas, flores y plantas, equipo electrónico de uso doméstico, etcétera.	Alquiler y arrendamiento de otros efectos personales y enseres domésticos: maquinaría y equipo de bricolaje, por ejemplo: herramientas para reparaciones domésticas, flores y plantas, equipo electrónico de uso doméstico, etcétera.	N7729.09.01	f
2728	Alquiler con fines operativos, sin operadores, de otros tipos de maquinaria y equipo operacional que suelen ser utilizados como bienes de capital por las industrias: motores y turbinas, máquinas herramienta, equipo de minería y de extracción de petróleo.	Alquiler con fines operativos, sin operadores, de otros tipos de maquinaria y equipo operacional que suelen ser utilizados como bienes de capital por las industrias: motores y turbinas, máquinas herramienta, equipo de minería y de extracción de petróleo.	N7730.11.01	f
2729	Alquiler con fines operativos, sin operadores, de otros tipos de maquinaria y equipo operacional que suelen ser utilizados como bienes de capital por las industrias: máquinas herramienta, equipo de minería y de extracción de petróleo.	Alquiler con fines operativos, sin operadores, de otros tipos de maquinaria y equipo operacional que suelen ser utilizados como bienes de capital por las industrias: máquinas herramienta, equipo de minería y de extracción de petróleo.	N7730.11.02	f
2730	Alquiler con fines operativos, sin operadores, de otros tipos de maquinaria y equipo operacional que suelen ser utilizados como bienes de capital por las industrias: equipo profesional de radio, televisión y comunicaciones; equipo de producción de películas cinematográficas.	Alquiler con fines operativos, sin operadores, de otros tipos de maquinaria y equipo operacional que suelen ser utilizados como bienes de capital por las industrias: equipo profesional de radio, televisión y comunicaciones; equipo de producción de películas cinematográficas.	N7730.12.01	f
2731	Alquiler con fines operativos, sin operadores, de otros tipos de maquinaria y equipo operacional que suelen ser utilizados como bienes de capital por las industrias: equipo de medición y control.	Alquiler con fines operativos, sin operadores, de otros tipos de maquinaria y equipo operacional que suelen ser utilizados como bienes de capital por las industrias: equipo de medición y control.	N7730.13.01	f
2732	Alquiler con fines operativos de maquinaria y equipo de uso agrícola y forestal sin operadores: tractores utilizados en actividades agropecuarias y silvícolas; tractores de manejo a pie (dirigidos por una persona desde fuera), segadoras, incluidas segadoras de césped, remolques y semirremolques de carga y descarga automática, máquinas utilizadas en la agricultura para preparar los suelos, plantar o abonar, como arados, esparcidoras de estiércol, sembradoras, rastrilladoras, máquinas de ordeñar; aspersores de uso agrícola, máquinas para la recolección y trilla, como cosechadoras, trilladoras, cribadoras; máquinas utilizadas en la avicultura y apicultura, equipo para la preparación de pienso, máquinas para limpiar, seleccionar y clasificar huevos, fruta, etcétera.	Alquiler con fines operativos de maquinaria y equipo de uso agrícola y forestal sin operadores: tractores utilizados en actividades agropecuarias y silvícolas; tractores de manejo a pie (dirigidos por una persona desde fuera), segadoras, incluidas segadoras de césped, remolques y semirremolques de carga y descarga automática, máquinas utilizadas en la agricultura para preparar los suelos, plantar o abonar, como arados, esparcidoras de estiércol, sembradoras, rastrilladoras, máquinas de ordeñar; aspersores de uso agrícola, máquinas para la recolección y trilla, como cosechadoras, trilladoras, cribadoras; máquinas utilizadas en la avicultura y apicultura, equipo para la preparación de pienso, máquinas para limpiar, seleccionar y clasificar huevos, fruta, etcétera.	N7730.14.01	f
2733	Alquiler con fines operativos de maquinaria y equipo para la construcción e ingeniería civil sin operadores: camiones grúa, andamios y plataformas de trabajo, sin montaje ni desmantelamiento, a corto plazo.	Alquiler con fines operativos de maquinaria y equipo para la construcción e ingeniería civil sin operadores: camiones grúa, andamios y plataformas de trabajo, sin montaje ni desmantelamiento, a corto plazo.	N7730.15.01	f
2734	Alquiler con fines operativos de maquinaria y equipo para la construcción e ingeniería civil sin operadores: camiones grúa, andamios y plataformas de trabajo, sin montaje ni desmantelamiento a largo plazo.	Alquiler con fines operativos de maquinaria y equipo para la construcción e ingeniería civil sin operadores: camiones grúa, andamios y plataformas de trabajo, sin montaje ni desmantelamiento a largo plazo.	N7730.15.02	f
2735	Alquiler con fines operativos  máquinas de escribir y máquinas de procesamiento de texto.	Alquiler con fines operativos  máquinas de escribir y máquinas de procesamiento de texto.	N7730.16.01	f
2736	Alquiler con fines operativos de maquinaria y equipo de oficina sin operador, máquinas registradoras, calculadoras electrónicas, etcétera.	Alquiler con fines operativos de maquinaria y equipo de oficina sin operador, máquinas registradoras, calculadoras electrónicas, etcétera.	N7730.16.02	f
2737	Alquiler con fines operativos de maquinaria y equipo de oficina sin operador: computadoras y equipo periférico.	Alquiler con fines operativos de maquinaria y equipo de oficina sin operador: computadoras y equipo periférico.	N7730.16.03	f
2738	Alquiler con fines operativos de maquinaria y equipo de oficina sin operador: mobiliario de oficina, máquinas copiadoras.	Alquiler con fines operativos de maquinaria y equipo de oficina sin operador: mobiliario de oficina, máquinas copiadoras.	N7730.16.04	f
2739	Alquiler con fines operativos, sin operadores, de otros tipos de maquinaria científica, comercial e industrial y equipo operacional que suelen ser utilizados como bienes de capital por las industrias.	Alquiler con fines operativos, sin operadores, de otros tipos de maquinaria científica, comercial e industrial y equipo operacional que suelen ser utilizados como bienes de capital por las industrias.	N7730.19.01	f
3120	Actividades de organizaciones internacionales, como la Asociación Europea de Libre Comercio, etcétera.	Actividades de organizaciones internacionales, como la Asociación Europea de Libre Comercio, etcétera.	U9900.01.06	f
2740	Alquiler con fines operativos de equipo de transporte terrestre (excepto vehículos automotores) sin conductor de motocicletas, caravanas, furgonetas de acampada (campers), etcétera.	Alquiler con fines operativos de equipo de transporte terrestre (excepto vehículos automotores) sin conductor de motocicletas, caravanas, furgonetas de acampada (campers), etcétera.	N7730.21.01	f
2741	Alquiler con fines operativos de equipo de transporte terrestre (excepto vehículos automotores) sin conductor de vehículos ferroviarios.	Alquiler con fines operativos de equipo de transporte terrestre (excepto vehículos automotores) sin conductor de vehículos ferroviarios.	N7730.22.02	f
2749	Alquiler de animales: rebaños, caballos de carreras, etcétera.	Alquiler de animales: rebaños, caballos de carreras, etcétera.	N7730.34.01	f
79	Cultivo de látex.	Cultivo de látex.	A0129.09.02	t
2750	Arrendamiento de productos de propiedad intelectual (excepto obras protegidas por derechos de autor, como libros o programas informáticos).	Arrendamiento de productos de propiedad intelectual (excepto obras protegidas por derechos de autor, como libros o programas informáticos).	N7740.01.01	f
2751	Recepción de regalías o derechos de licencia por la utilización de: franquicias, entidades patentadas, marcas de fábrica o de comercio o marcas de servicios y nombres comerciales.	Recepción de regalías o derechos de licencia por la utilización de: franquicias, entidades patentadas, marcas de fábrica o de comercio o marcas de servicios y nombres comerciales.	N7740.02.01	f
2752	Recepción de regalías o derechos de licencia por la utilización de: prospección, explotación y evaluación de recursos minerales.	Recepción de regalías o derechos de licencia por la utilización de: prospección, explotación y evaluación de recursos minerales.	N7740.03.01	f
2753	Otras actividades de arrendamiento de propiedad intelectual y productos similares, excepto obras protegidas por derecho de autor.	Otras actividades de arrendamiento de propiedad intelectual y productos similares, excepto obras protegidas por derecho de autor.	N7740.09.01	f
2754	Actividades de búsqueda, selección, recomendación y colocación de personal, incluida la colocación o búsqueda de ejecutivos, Actividades de las agencias y oficinas de selección de actores, por ejemplo, para obras de teatro y Actividades de agencia de colocación por Internet (On line).	Actividades de búsqueda, selección, recomendación y colocación de personal, incluida la colocación o búsqueda de ejecutivos, Actividades de las agencias y oficinas de selección de actores, por ejemplo, para obras de teatro y Actividades de agencia de colocación por Internet (On line).	N7810.00.01	f
2755	Actividades de las agencias y oficinas de selección de actores, por ejemplo, para obras de teatro y Actividades de agencia de colocación por Internet (On line).	Actividades de las agencias y oficinas de selección de actores, por ejemplo, para obras de teatro y Actividades de agencia de colocación por Internet (On line).	N7810.00.02	f
2756	Suministro de trabajadores para las actividades de los clientes por períodos limitados de tiempo con el fin de reemplazar a empleados de los clientes o suplementar temporalmente su fuerza de trabajo, cuando los trabajadores suministrados son empleados de las propias agencias de empleo temporal. Las unidades clasificadas en esta clase no se encargan de la supervisión directa de sus empleados en los lugares de trabajo de los clientes.	Suministro de trabajadores para las actividades de los clientes por períodos limitados de tiempo con el fin de reemplazar a empleados de los clientes o suplementar temporalmente su fuerza de trabajo, cuando los trabajadores suministrados son empleados de las propias agencias de empleo temporal. Las unidades clasificadas en esta clase no se encargan de la supervisión directa de sus empleados en los lugares de trabajo de los clientes.	N7820.00.01	f
2757	Suministro de recursos humanos para las actividades de los clientes. La provisión de recursos humanos se realiza por lo general a largo plazo o de forma permanente, y las unidades clasificadas en esta clase pueden desempeñar una amplia gama de funciones conexas de gestión de recursos humanos. Las unidades clasificadas aquí constituyen los empleadores oficiales de los empleados en lo que respecta a la nómina, los impuestos y otros aspectos fiscales y de recursos humanos, pero no se encargan de la dirección ni de la supervisión del trabajo de esos empleados.	Suministro de recursos humanos para las actividades de los clientes. La provisión de recursos humanos se realiza por lo general a largo plazo o de forma permanente, y las unidades clasificadas en esta clase pueden desempeñar una amplia gama de funciones conexas de gestión de recursos humanos. Las unidades clasificadas aquí constituyen los empleadores oficiales de los empleados en lo que respecta a la nómina, los impuestos y otros aspectos fiscales y de recursos humanos, pero no se encargan de la dirección ni de la supervisión del trabajo de esos empleados.	N7830.00.01	f
2758	Actividades de las agencias de viajes dedicadas principalmente a vender servicios de viajes, de viajes organizados, de transporte y de alojamiento, al por mayor o al por menor, al público en general y a clientes comerciales.	Actividades de las agencias de viajes dedicadas principalmente a vender servicios de viajes, de viajes organizados, de transporte y de alojamiento, al por mayor o al por menor, al público en general y a clientes comerciales.	N7911.00.01	f
2777	Actividades de limpieza exterior de edificios de todo tipo, como oficinas, fábricas, establecimientos comerciales, instituciones y otros locales comerciales, profesionales y edificios con múltiples unidades residenciales (multifamiliares).	Actividades de limpieza exterior de edificios de todo tipo, como oficinas, fábricas, establecimientos comerciales, instituciones y otros locales comerciales, profesionales y edificios con múltiples unidades residenciales (multifamiliares).	N8129.11.01	f
2759	Actividad de Operadores turísticos que se encargan de la planificación y organización de paquetes de servicios de viajes (tours) para su venta a través de agencias de viajes o por los propios operadores turísticos. Esos viajes organizados (tours) pueden incluir la totalidad o parte de las siguientes características: transporte, alojamiento, comidas, visitas a museos, lugares históricos o culturales, espectáculos teatrales, musicales o deportivos.	Actividad de Operadores turísticos que se encargan de la planificación y organización de paquetes de servicios de viajes (tours) para su venta a través de agencias de viajes o por los propios operadores turísticos. Esos viajes organizados (tours) pueden incluir la totalidad o parte de las siguientes características: transporte, alojamiento, comidas, visitas a museos, lugares históricos o culturales, espectáculos teatrales, musicales o deportivos.	N7912.00.01	f
2760	Prestación de otros servicios de reservas relacionados con los viajes: reservas de transporte, hoteles, restaurantes, alquiler de automóviles, entretenimiento y deporte, etcétera.	Prestación de otros servicios de reservas relacionados con los viajes: reservas de transporte, hoteles, restaurantes, alquiler de automóviles, entretenimiento y deporte, etcétera.	N7990.01.01	f
2761	Prestación de servicios de intercambio en régimen de tiempo compartido o multipropiedad.	Prestación de servicios de intercambio en régimen de tiempo compartido o multipropiedad.	N7990.02.01	f
2762	Actividades de venta de boletos para obras de teatro, competiciones deportivas y otras actividades de diversión y entretenimiento.	Actividades de venta de boletos para obras de teatro, competiciones deportivas y otras actividades de diversión y entretenimiento.	N7990.03.01	f
2763	Prestación de servicios de asistencia a los turistas: suministro a los clientes de información sobre los viajes, actividades de guías de turismo.	Prestación de servicios de asistencia a los turistas: suministro a los clientes de información sobre los viajes, actividades de guías de turismo.	N7990.04.01	f
2764	Actividades de promoción turística.	Actividades de promoción turística.	N7990.05.01	f
84	Cultivo de flores en viveros.	Cultivo de flores en viveros.	A0130.00.04	t
2768	Actividades de vigilancia y proteccion realizado a traves del patrullaje de calles.	Actividades de vigilancia y proteccion realizado a traves del patrullaje de calles.	N8010.04.01	f
2769	Actividades de protección a traves de guarda-espaldas.	Actividades de protección a traves de guarda-espaldas.	N8010.05.01	f
2770	Otras actividades de seguridad privada: detector de mentiras (polígrafo), huellas dactilares, etcétera.	Otras actividades de seguridad privada: detector de mentiras (polígrafo), huellas dactilares, etcétera.	N8010.09.01	f
2771	Actividades de supervisión a distancia de sistemas electrónicos de seguridad, como los de alarma contra robos y contra incendios, incluido su instalación y mantenimiento. La unidad que lleva a cabo esta actividad puede dedicarse también a la venta de estos sistemas de seguridad.	Actividades de supervisión a distancia de sistemas electrónicos de seguridad, como los de alarma contra robos y contra incendios, incluido su instalación y mantenimiento. La unidad que lleva a cabo esta actividad puede dedicarse también a la venta de estos sistemas de seguridad.	N8020.01.01	f
2772	Actividades de instalación, reparación, reconstrucción y ajuste de dispositivos mecánicos o eléctricos de cierre, cajas de caudales y cajas fuertes. La unidad que lleva a cabo esta actividad puede dedicarse también a la venta de estos dispositivos mecánicos o eléctricos de cierre, cajas de caudales y cajas fuertes.	Actividades de instalación, reparación, reconstrucción y ajuste de dispositivos mecánicos o eléctricos de cierre, cajas de caudales y cajas fuertes. La unidad que lleva a cabo esta actividad puede dedicarse también a la venta de estos dispositivos mecánicos o eléctricos de cierre, cajas de caudales y cajas fuertes.	N8020.02.01	f
2773	Actividades de todo tipo de investigadores privados, independientemente del tipo de cliente y de la finalidad de la investigación, servicios de investigación y de detectives y otras actividades de investigación.	Actividades de todo tipo de investigadores privados, independientemente del tipo de cliente y de la finalidad de la investigación, servicios de investigación y de detectives y otras actividades de investigación.	N8030.00.01	f
2774	Actividades de todo tipo de investigadores privados, independientemente del tipo de cliente y de la finalidad de la investigación, servicios de investigación y de detectives y otras actividades de investigación.	Actividades de todo tipo de investigadores privados, independientemente del tipo de cliente y de la finalidad de la investigación, servicios de investigación y de detectives y otras actividades de investigación.	N8030.00.01	f
2775	Prestación de una combinación de servicios de apoyo en las instalaciones de los clientes, como limpieza general de interiores, mantenimiento, eliminación de la basuras, seguridad y vigilancia, envío de correo, recepción, lavandería y servicios conexos, a fin de facilitar el funcionamiento de las instalaciones. Las unidades clasificadas en esta clase proporcionan personal para la realización de estas actividades de apoyo, pero no participan en las actividades principales de los clientes ni son responsables de ellas.	Prestación de una combinación de servicios de apoyo en las instalaciones de los clientes, como limpieza general de interiores, mantenimiento, eliminación de la basuras, seguridad y vigilancia, envío de correo, recepción, lavandería y servicios conexos, a fin de facilitar el funcionamiento de las instalaciones. Las unidades clasificadas en esta clase proporcionan personal para la realización de estas actividades de apoyo, pero no participan en las actividades principales de los clientes ni son responsables de ellas.	N8110.00.01	f
2776	Limpieza general (no especializada) de todo tipo de edificios, estudios profesionales, locales comerciales,  profesionales y edificios con múltiples unidades residenciales como: oficinas, casas y departamentos, fábricas, establecimientos comerciales e instituciones. Estas actividades consisten sobre todo en la limpieza de interiores, aunque pueden abarcar la limpieza de zonas exteriores conexas, como ventanas y pasadizos.	Limpieza general (no especializada) de todo tipo de edificios, estudios profesionales, locales comerciales,  profesionales y edificios con múltiples unidades residenciales como: oficinas, casas y departamentos, fábricas, establecimientos comerciales e instituciones. Estas actividades consisten sobre todo en la limpieza de interiores, aunque pueden abarcar la limpieza de zonas exteriores conexas, como ventanas y pasadizos.	N8121.00.01	f
2971	Actividades de asesoramiento y orientacion a personas que se encuentran en libertad bajo palabra o en libertad condicional	Actividades de asesoramiento y orientacion a personas que se encuentran en libertad bajo palabra o en libertad condicional	Q8890.04.05	f
2778	Actividades de limpieza especializada de edificios, como limpieza de ventanas, limpieza de chimeneas y hogares de chimenea, hornos, incineradores, limpieza de maquinaria industrial, calderas, conductos de ventilación, extractores de aire, actividades de limpieza de edificios e instalaciones industriales n.c.p.	Actividades de limpieza especializada de edificios, como limpieza de ventanas, limpieza de chimeneas y hogares de chimenea, hornos, incineradores, limpieza de maquinaria industrial, calderas, conductos de ventilación, extractores de aire, actividades de limpieza de edificios e instalaciones industriales n.c.p.	N8129.12.01	f
2779	Limpieza de interiores (limpieza y encerado de pisos, limpieza de paredes, pulimento de muebles, etc.).	Limpieza de interiores (limpieza y encerado de pisos, limpieza de paredes, pulimento de muebles, etc.).	N8129.12.02	f
2780	Servicios de limpieza y mantenimiento de piscinas.	Servicios de limpieza y mantenimiento de piscinas.	N8129.91.01	f
2781	Limpieza de trenes, autobuses, aeronaves, etcétera.	Limpieza de trenes, autobuses, aeronaves, etcétera.	N8129.92.01	f
2782	Limpieza del interior de camiones cisterna y buques petroleros.	Limpieza del interior de camiones cisterna y buques petroleros.	N8129.93.01	f
2783	Actividades de desinfección, desratización y exterminio de plagas.	Actividades de desinfección, desratización y exterminio de plagas.	N8129.94.01	f
2784	Servicio público de barrido de calles, retirada de nieve, hielo y Limpieza de playas	Servicio público de barrido de calles, retirada de nieve, hielo y Limpieza de playas	N8129.95.01	f
2785	Servicio privado de barrido de calles, retirada de nieve, hielo y Limpieza de playas	Servicio privado de barrido de calles, retirada de nieve, hielo y Limpieza de playas	N8129.95.01	f
2786	Otras actividades de limpieza: limpieza de botellas, etcétera.	Otras actividades de limpieza: limpieza de botellas, etcétera.	N8129.99.01	f
2787	Plantación, cuidado y mantenimiento de parques y jardines para: viviendas con jardín de uso privado o comunitario, edificios públicos y semipúblicos (hospitales, escuelas, edificios administrativos, iglesias, etcétera), edificios industriales y comerciales.	Plantación, cuidado y mantenimiento de parques y jardines para: viviendas con jardín de uso privado o comunitario, edificios públicos y semipúblicos (hospitales, escuelas, edificios administrativos, iglesias, etcétera), edificios industriales y comerciales.	N8130.11.01	f
2788	Plantación, cuidado y mantenimiento de parques y jardines para: terrenos municipales (parques, zonas verdes, cementerios, etcétera) y ajardinamiento de vías públicas (carreteras, líneas de ferrocarril y de tranvía, vías de navegación interior, puertos).	Plantación, cuidado y mantenimiento de parques y jardines para: terrenos municipales (parques, zonas verdes, cementerios, etcétera) y ajardinamiento de vías públicas (carreteras, líneas de ferrocarril y de tranvía, vías de navegación interior, puertos).	N8130.12.01	f
2789	Plantación, cuidado y mantenimiento de vegetación en edificios (azoteas, fachadas, patios interiores), terrenos deportivos (campos de fútbol, campos de golf, etcétera), parques infantiles, praderas para tomar el sol y otros parques de recreo.	Plantación, cuidado y mantenimiento de vegetación en edificios (azoteas, fachadas, patios interiores), terrenos deportivos (campos de fútbol, campos de golf, etcétera), parques infantiles, praderas para tomar el sol y otros parques de recreo.	N8130.21.01	f
2790	Plantación, cuidado y mantenimiento de vegetación en agua embalsada y corriente (fuentes, estanques, piscinas, acequias, cursos de agua, sistemas de aguas residuales).	Plantación, cuidado y mantenimiento de vegetación en agua embalsada y corriente (fuentes, estanques, piscinas, acequias, cursos de agua, sistemas de aguas residuales).	N8130.22.01	f
2791	Actividades de mantenimiento de terrenos en buenas condiciones ecológicas como la plantación de plantas de protección contra el ruido, el viento, la erosión, la visibilidad y el deslumbramiento.	Actividades de mantenimiento de terrenos en buenas condiciones ecológicas como la plantación de plantas de protección contra el ruido, el viento, la erosión, la visibilidad y el deslumbramiento.	N8130.23.01	f
2792	Actividades de prestación de una serie de servicios administrativos de oficina corrientes, como recepción, planificación financiera, facturación y registro, personal y distribución física (servicios de mensajería) y logística, a cambio de una retribución o por contrato.	Actividades de prestación de una serie de servicios administrativos de oficina corrientes, como recepción, planificación financiera, facturación y registro, personal y distribución física (servicios de mensajería) y logística, a cambio de una retribución o por contrato.	N8211.00.01	f
2793	Servicios de apoyo de secretaría, transcripción de documentos y otros servicios de secretaría; escritura de cartas o historiales profesionales (currículum), preparación de documentos, edición de documentos y corrección de pruebas; actividades de mecanografía, procesamiento de texto y edición electrónica.	Servicios de apoyo de secretaría, transcripción de documentos y otros servicios de secretaría; escritura de cartas o historiales profesionales (currículum), preparación de documentos, edición de documentos y corrección de pruebas; actividades de mecanografía, procesamiento de texto y edición electrónica.	N8219.01.01	f
2794	Servicios de apoyo de secretaría: corrección de pruebas; edición electrónica.	Servicios de apoyo de secretaría: corrección de pruebas; edición electrónica.	N8219.01.02	f
2795	Alquiler de apartados de correo y otras actividades relacionadas con el correo (excepto la publicidad directa por correo).	Alquiler de apartados de correo y otras actividades relacionadas con el correo (excepto la publicidad directa por correo).	N8219.02.01	f
2796	Actividades de fotocopiado y realización de duplicados.	Actividades de fotocopiado y realización de duplicados.	N8219.03.01	f
2797	Otros servicios de copia de documentos no acompañados de servicios de impresión, como los de impresión en Offset, impresión rápida, impresión digital o servicios de preparación para la prensa, y otros servicios especializados de oficina, diseño de procesos (cianotipia, blueprinting), etcétera.	Otros servicios de copia de documentos no acompañados de servicios de impresión, como los de impresión en Offset, impresión rápida, impresión digital o servicios de preparación para la prensa, y otros servicios especializados de oficina, diseño de procesos (cianotipia, blueprinting), etcétera.	N8219.09.01	f
2816	Administración y gestión de los servicios generales de planificación económica, social y de estadística en los diversos niveles de la administración pública.	Administración y gestión de los servicios generales de planificación económica, social y de estadística en los diversos niveles de la administración pública.	O8411.06.01	f
2817	Otras Actividades de la Administracion Publica en General.	Otras Actividades de la Administracion Publica en General.	O8411.07.01	f
2798	Actividades de centros que atienden a llamadas de clientes utilizando operadores humanos, sistemas de distribución automática de llamadas, sistemas informatizados de telefonía, sistemas interactivos de respuesta de voz o métodos similares para recibir pedidos, proporcionar información sobre productos, responder a solicitudes de asistencia de los clientes o atender reclamaciones (call – center).	Actividades de centros que atienden a llamadas de clientes utilizando operadores humanos, sistemas de distribución automática de llamadas, sistemas informatizados de telefonía, sistemas interactivos de respuesta de voz o métodos similares para recibir pedidos, proporcionar información sobre productos, responder a solicitudes de asistencia de los clientes o atender reclamaciones (call – center).	N8220.01.01	f
2799	Actividades de centros que realizan llamadas, usando técnicas similares, para vender o promocionar bienes o servicios a clientes potenciales, realizar estudios de mercado o encuestas de opinión pública y actividades similares para los clientes.	Actividades de centros que realizan llamadas, usando técnicas similares, para vender o promocionar bienes o servicios a clientes potenciales, realizar estudios de mercado o encuestas de opinión pública y actividades similares para los clientes.	N8220.02.01	f
2800	Organización, promoción y/o gestión de eventos como exposiciones comerciales o empresariales, convenciones, conferencias y reuniones, estén incluidas o no la gestión de esas instalaciones y la dotación de personal necesario para su funcionamiento.	Organización, promoción y/o gestión de eventos como exposiciones comerciales o empresariales, convenciones, conferencias y reuniones, estén incluidas o no la gestión de esas instalaciones y la dotación de personal necesario para su funcionamiento.	N8230.00.01	f
2801	Actividades de cobro de cantidades adeudadas y entrega de esos fondos a los clientes, como servicios de cobro de deudas o facturas.	Actividades de cobro de cantidades adeudadas y entrega de esos fondos a los clientes, como servicios de cobro de deudas o facturas.	N8291.01.01	f
2822	Administración pública de programas destinados a promover el bienestar personal en vivienda; administración de políticas de investigación y desarrollo adoptadas en este ámbito y de los fondos correspondientes, administración de programas de vivienda.	Administración pública de programas destinados a promover el bienestar personal en vivienda; administración de políticas de investigación y desarrollo adoptadas en este ámbito y de los fondos correspondientes, administración de programas de vivienda.	O8412.15.01	f
2802	Actividades de recopilación de información, como historiales de crédito y de empleo de personas e historiales de crédito de empresas, y suministro de esa información a instituciones financieras, empresas de venta al por menor y otras entidades que necesitan poder evaluar la solvencia de esas personas y empresas.	Actividades de recopilación de información, como historiales de crédito y de empleo de personas e historiales de crédito de empresas, y suministro de esa información a instituciones financieras, empresas de venta al por menor y otras entidades que necesitan poder evaluar la solvencia de esas personas y empresas.	N8291.02.01	f
2803	Actividades de envasado y empaquetado a cambio de una retribución o por contrato, con intervención o no de procesos automatizados: embotellado de líquidos, incluidos alimentos y bebidas, envasado o empaquetado de sólidos (embalaje con plástico de burbujas, recubrimiento con papel aluminio, etcétera).	Actividades de envasado y empaquetado a cambio de una retribución o por contrato, con intervención o no de procesos automatizados: embotellado de líquidos, incluidos alimentos y bebidas, envasado o empaquetado de sólidos (embalaje con plástico de burbujas, recubrimiento con papel aluminio, etcétera).	N8292.01.01	f
2804	Actividades de etiquetado, estampado e impresión.	Actividades de etiquetado, estampado e impresión.	N8292.02.01	f
2805	Otras actividades de envasado y empaquetado: actividades de empaquetado de envíos y envoltura de regalos.	Otras actividades de envasado y empaquetado: actividades de empaquetado de envíos y envoltura de regalos.	N8292.09.01	f
2806	Actividades de elaboración de actas textuales y registro en taquigrafía (estenotipia) de procedimientos jurídicos en directo y transcripción de los materiales correspondientes, como: servicios de redacción de actas judiciales o de registro en estenotipia, servicios públicos de estenografía.	Actividades de elaboración de actas textuales y registro en taquigrafía (estenotipia) de procedimientos jurídicos en directo y transcripción de los materiales correspondientes, como: servicios de redacción de actas judiciales o de registro en estenotipia, servicios públicos de estenografía.	N8299.01.01	f
2807	Actividades de subtitulado simultáneo para sordos en tiempo real de retransmisiones en directo por televisión, reuniones, conferencias, etcétera.	Actividades de subtitulado simultáneo para sordos en tiempo real de retransmisiones en directo por televisión, reuniones, conferencias, etcétera.	N8299.02.01	f
2808	Servicios de organización de la recaudación de fondos a cambio de una retribución o por contrata, servicios de recuperación.	Servicios de organización de la recaudación de fondos a cambio de una retribución o por contrata, servicios de recuperación.	N8299.03.01	f
2809	Otras actividades de apoyo que se proporcionan habitualmente a las empresas y que no clasifican en otra parte: servicio de recogida de monedas de parquímetros, servicios de anillados y plastificados, preclasificación de correo, impresión de código de barras, codificación de la barra de dirección, programas de fidelización, subasta por cuenta propia, etcétera.	Otras actividades de apoyo que se proporcionan habitualmente a las empresas y que no clasifican en otra parte: servicio de recogida de monedas de parquímetros, servicios de anillados y plastificados, preclasificación de correo, impresión de código de barras, codificación de la barra de dirección, programas de fidelización, subasta por cuenta propia, etcétera.	N8299.09.01	f
2810	Desempeño de las funciones ejecutivas y legislativas de los órganos y organismos centrales, regionales y locales.	Desempeño de las funciones ejecutivas y legislativas de los órganos y organismos centrales, regionales y locales.	O8411.01.01	f
2811	Administración y supervisión de los asuntos fiscales: aplicación de los sistemas tributarios, recaudación de derechos e impuestos sobre bienes e investigación de casos de evasión de impuestos.	Administración y supervisión de los asuntos fiscales: aplicación de los sistemas tributarios, recaudación de derechos e impuestos sobre bienes e investigación de casos de evasión de impuestos.	O8411.02.01	f
2812	Administración y supervisión de los asuntos fiscalesy finanieros	Administración y supervisión de los asuntos fiscalesy finanieros	O8411.02.02	f
2814	Ejecución presupuestaria y administración de fondos públicos (hacienda) y de la deuda pública: obtención y recepción de fondos y fiscalización de su desembolso.	Ejecución presupuestaria y administración de fondos públicos (hacienda) y de la deuda pública: obtención y recepción de fondos y fiscalización de su desembolso.	O8411.04.01	f
2815	Aplicación de la política general de investigación y desarrollo (civiles) y administración de los fondos correspondientes.	Aplicación de la política general de investigación y desarrollo (civiles) y administración de los fondos correspondientes.	O8411.05.01	f
2860	Fuerzas de vigilancia portuaria, fronteriza y costera.	Fuerzas de vigilancia portuaria, fronteriza y costera.	O8423.01.02	f
2818	Administración pública de programas destinados a promover el bienestar personal en salud; administración de políticas de investigación y desarrollo adoptadas en este ámbito y de los fondos correspondientes.	Administración pública de programas destinados a promover el bienestar personal en salud; administración de políticas de investigación y desarrollo adoptadas en este ámbito y de los fondos correspondientes.	O8412.11.01	f
2819	Administración pública de programas destinados a promover el bienestar personal en educación, cultura y deporte; administración de políticas de investigación y desarrollo adoptadas en esos ámbitos y de los fondos correspondientes, concesión de becas públicas a artistas.	Administración pública de programas destinados a promover el bienestar personal en educación, cultura y deporte; administración de políticas de investigación y desarrollo adoptadas en esos ámbitos y de los fondos correspondientes, concesión de becas públicas a artistas.	O8412.12.01	f
2820	Administración pública de programas destinados a promover el bienestar personal en esparcimiento; administración de políticas de investigación y desarrollo adoptadas en este ámbito y de los fondos correspondientes, patrocinio de actividades recreativas y culturales.	Administración pública de programas destinados a promover el bienestar personal en esparcimiento; administración de políticas de investigación y desarrollo adoptadas en este ámbito y de los fondos correspondientes, patrocinio de actividades recreativas y culturales.	O8412.13.01	f
2821	Administración pública de programas destinados a promover el bienestar personal en medio ambiente; administración de políticas de investigación y desarrollo adoptadas en este ámbito y de los fondos correspondientes, administración de programas de protección del medio ambiente.	Administración pública de programas destinados a promover el bienestar personal en medio ambiente; administración de políticas de investigación y desarrollo adoptadas en este ámbito y de los fondos correspondientes, administración de programas de protección del medio ambiente.	O8412.14.01	f
105	Cría y reproducción de cuyes.	Cría y reproducción de cuyes.	A0149.21.01	t
2823	Administración pública de programas destinados a promover el bienestar personal en servicios sociales; administración de políticas de investigación y desarrollo adoptadas en este ámbito y de los fondos correspondientes.	Administración pública de programas destinados a promover el bienestar personal en servicios sociales; administración de políticas de investigación y desarrollo adoptadas en este ámbito y de los fondos correspondientes.	O8412.16.01	f
2824	Actividades de administracion de programas de enseñanza primaria.	Actividades de administracion de programas de enseñanza primaria.	O8412.17.01	f
2825	Actividades de administracion de programas de enseñanza  secundaria.	Actividades de administracion de programas de enseñanza  secundaria.	O8412.17.02	f
2826	Actividades de administracion de programas de enseñanza postsecundaria y de programas especiales de reeducacion profesional	Actividades de administracion de programas de enseñanza postsecundaria y de programas especiales de reeducacion profesional	O8412.17.03	f
2827	Administración y funcionamiento de los servicios de personal para el gobierno en general: formulación y aplicación de normas de selección de personal, calificación y ascensos, descripción de funciones, cumplimiento de los reglamentos de personal, evaluación	Administración y funcionamiento de los servicios de personal para el gobierno en general: formulación y aplicación de normas de selección de personal, calificación y ascensos, descripción de funciones, cumplimiento de los reglamentos de personal, evaluación	O8412.18.01	f
2828	Administración y funcionamiento de los servicios de personal para el gobierno en general: formulación y aplicación de normas de selección de personal, calificación y ascensos, descripción de funciones, cumplimiento de los reglamentos de personal, evaluación	Administración y funcionamiento de los servicios de personal para el gobierno en general: formulación y aplicación de normas de selección de personal, calificación y ascensos, descripción de funciones, cumplimiento de los reglamentos de personal, evaluación	O8412.19.01	f
2829	Administración de edificios de la administración publica propios o arrendados y administración de servicios de oficinas centrales.	Administración de edificios de la administración publica propios o arrendados y administración de servicios de oficinas centrales.	O8412.20.01	f
2830	Conservación y custodia de registros y archivos públicos.	Conservación y custodia de registros y archivos públicos.	O8412.20.02	f
2831	Administración y dirección de los servicios de suministro y compra centralizados.	Administración y dirección de los servicios de suministro y compra centralizados.	O8412.20.03	f
2832	Actividades de administración de programa de suministro de agua potable.	Actividades de administración de programa de suministro de agua potable.	O8412.91.01	f
2833	Actividades de administración de servicios de recolección y eliminación de desperdicios.	Actividades de administración de servicios de recolección y eliminación de desperdicios.	O8412.92.01	f
2834	Administración y regulación pública, incluida la concesión de subvenciones, de los distintos sectores económicos de la agricultura, ganadería, silvicultura y pesca.	Administración y regulación pública, incluida la concesión de subvenciones, de los distintos sectores económicos de la agricultura, ganadería, silvicultura y pesca.	O8413.11.01	f
2835	Administración y regulación públicas, incluida la concesión de subvenciones, de los distintos sectores económicos de la ordenación de tierras.	Administración y regulación públicas, incluida la concesión de subvenciones, de los distintos sectores económicos de la ordenación de tierras.	O8413.12.01	f
2836	Administración y regulación públicas, incluida la concesión de subvenciones, de los distintos sectores económicos de energía y minería.	Administración y regulación públicas, incluida la concesión de subvenciones, de los distintos sectores económicos de energía y minería.	O8413.13.01	f
2837	Administración y regulación públicas, incluidas las relacionadas con la energía eléctrica.	Administración y regulación públicas, incluidas las relacionadas con la energía eléctrica.	O8413.13.02	f
2838	Administración y regulación públicas, incluida la concesión de subvenciones, de los distintos sectores económicos de infraestructura, como las instalaciones de agua potable.	Administración y regulación públicas, incluida la concesión de subvenciones, de los distintos sectores económicos de infraestructura, como las instalaciones de agua potable.	O8413.14.01	f
2839	Administración y regulación públicas, incluida la concesión de subvenciones, de los distintos sectores económicos de transporte, como son los referentes a caminos y carreteras	Administración y regulación públicas, incluida la concesión de subvenciones, de los distintos sectores económicos de transporte, como son los referentes a caminos y carreteras	O8413.15.01	f
2840	Administración y regulación públicas, incluida la concesión de subvenciones, de los distintos sectores económicos de transporte, como son los ferrocarriles, trenes urbanos y construccion de instalaciones para el transporte aéreo.	Administración y regulación públicas, incluida la concesión de subvenciones, de los distintos sectores económicos de transporte, como son los ferrocarriles, trenes urbanos y construccion de instalaciones para el transporte aéreo.	O8413.15.02	f
2841	Administración y regulación públicas, incluida la concesión de subvenciones, de los distintos sectores económicos de comunicaciones.	Administración y regulación públicas, incluida la concesión de subvenciones, de los distintos sectores económicos de comunicaciones.	O8413.16.01	f
2842	Administración y regulación públicas, incluida la concesión de subvenciones, de los distintos sectores económicos de hoteles, turismo y restaurantes.	Administración y regulación públicas, incluida la concesión de subvenciones, de los distintos sectores económicos de hoteles, turismo y restaurantes.	O8413.17.01	f
2843	Administración y regulación públicas, incluida la concesión de subvenciones, de los distintos sectores económicos de comercio al por mayor y al por menor.	Administración y regulación públicas, incluida la concesión de subvenciones, de los distintos sectores económicos de comercio al por mayor y al por menor.	O8413.18.01	f
2844	Administración y regulación públicas, incluida la concesión de subvenciones, concesión de licencias e inspección relacionadas con sectores comerciales.	Administración y regulación públicas, incluida la concesión de subvenciones, concesión de licencias e inspección relacionadas con sectores comerciales.	O8413.18.02	f
2845	Administración de las políticas de investigación y desarrollo destinadas a mejorar los resultados económicos y de los fondos correspondientes.	Administración de las políticas de investigación y desarrollo destinadas a mejorar los resultados económicos y de los fondos correspondientes.	O8413.91.01	f
114	Producción de cera.	Producción de cera.	A0149.94.02	t
2846	Administración de las cuestiones laborales de carácter general y aplicación de medidas de desarrollo regional, por ejemplo: medidas tendientes a reducir el desempleo.	Administración de las cuestiones laborales de carácter general y aplicación de medidas de desarrollo regional, por ejemplo: medidas tendientes a reducir el desempleo.	O8413.92.01	f
2847	Administración y funcionamiento del ministerio de relaciones exteriores de las misiones diplomáticas, consulares acreditadas en el extranjero y ante organizaciones internacionales.	Administración y funcionamiento del ministerio de relaciones exteriores de las misiones diplomáticas, consulares acreditadas en el extranjero y ante organizaciones internacionales.	O8421.01.01	f
2848	Administración, dirección y respaldo de servicios informativos y culturales que se prestan en el extranjero.	Administración, dirección y respaldo de servicios informativos y culturales que se prestan en el extranjero.	O8421.01.02	f
2849	Gestión de asuntos relacionados con el comercio exterior, la financiación internacional y cuestiones de carácter técnico.	Gestión de asuntos relacionados con el comercio exterior, la financiación internacional y cuestiones de carácter técnico.	O8421.02.01	f
2850	Suministro de ayuda a otros países, sea o no canalizado a través de organismos internacionales, (Programas de socorro a refugiados, lucha contra el hambre, etc.).	Suministro de ayuda a otros países, sea o no canalizado a través de organismos internacionales, (Programas de socorro a refugiados, lucha contra el hambre, etc.).	O8421.03.01	f
2851	Suministro de asistencia militar a otros países.	Suministro de asistencia militar a otros países.	O8421.04.01	f
2852	Administración, supervisión y gestión de asuntos y fuerzas de defensa militar del ejército de tierra, marina, fuerza aérea y espacial como: actividades de fuerzas de reserva y auxiliares del sistema de defensa.	Administración, supervisión y gestión de asuntos y fuerzas de defensa militar del ejército de tierra, marina, fuerza aérea y espacial como: actividades de fuerzas de reserva y auxiliares del sistema de defensa.	O8422.01.01	f
2853	Administración, supervisión y gestión de asuntos y fuerzas de defensa militar del ejército de tierra, marina, fuerza aérea y espacial como: abastecimiento de equipo, estructuras, suministros, etcétera.	Administración, supervisión y gestión de asuntos y fuerzas de defensa militar del ejército de tierra, marina, fuerza aérea y espacial como: abastecimiento de equipo, estructuras, suministros, etcétera.	O8422.01.02	f
2854	Administración, supervisión y gestión de asuntos y fuerzas de defensa militar del ejército de tierra, marina, fuerza aérea y espacial como: ctividades sanitarias para el personal militar en campaña.	Administración, supervisión y gestión de asuntos y fuerzas de defensa militar del ejército de tierra, marina, fuerza aérea y espacial como: ctividades sanitarias para el personal militar en campaña.	O8422.01.03	f
2855	Administración, supervisión y gestión de asuntos y fuerzas de defensa militar; fuerza aérea, marina y ejercito: administración de personal militar, fuerzas auxiliares de reserva para el sistema de defensa y otros de índole conexas.	Administración, supervisión y gestión de asuntos y fuerzas de defensa militar; fuerza aérea, marina y ejercito: administración de personal militar, fuerzas auxiliares de reserva para el sistema de defensa y otros de índole conexas.	O8422.01.04	f
2856	Actividades de mandos y fuerzas de ingeniería, transporte, comunicaciones, inteligencia, suministro de materiales, personal y otras fuerzas conexas no destinados al combate.	Actividades de mandos y fuerzas de ingeniería, transporte, comunicaciones, inteligencia, suministro de materiales, personal y otras fuerzas conexas no destinados al combate.	O8422.02.01	f
2857	Actividades de administración, gestión y el respaldo de fuerzas de defensa civil, prestación de apoyo a la elaboración de planes de emergencia y la ejecución de maniobras con la participación de instituciones civiles y de la población.	Actividades de administración, gestión y el respaldo de fuerzas de defensa civil, prestación de apoyo a la elaboración de planes de emergencia y la ejecución de maniobras con la participación de instituciones civiles y de la población.	O8422.03.01	f
2858	Administración de políticas de investigación y desarrollo relacionadas con la defensa y los fondos correspondientes.	Administración de políticas de investigación y desarrollo relacionadas con la defensa y los fondos correspondientes.	O8422.04.01	f
2859	Administración y dirección de fuerzas de policía, regulares y auxiliares que dependen de las autoridades públicas.	Administración y dirección de fuerzas de policía, regulares y auxiliares que dependen de las autoridades públicas.	O8423.01.01	f
2861	 Fuerzas especiales de policía entre cuyas funciones se cuentan la ordenación del tráfico, el registro de extranjeros y el mantenimiento de ficheros de detenidos.	 Fuerzas especiales de policía entre cuyas funciones se cuentan la ordenación del tráfico, el registro de extranjeros y el mantenimiento de ficheros de detenidos.	O8423.01.03	f
2862	Prevención y extinción de incendios: administración y funcionamiento de cuerpos ordinarios y auxiliares de bomberos que dependen de las autoridades públicas que realizan actividades de prevención y extinción de incendios, rescate de personas y animales, asistencia en desastres cívicos, inundaciones, accidentes de tráfico, etcétera.	Prevención y extinción de incendios: administración y funcionamiento de cuerpos ordinarios y auxiliares de bomberos que dependen de las autoridades públicas que realizan actividades de prevención y extinción de incendios, rescate de personas y animales, asistencia en desastres cívicos, inundaciones, accidentes de tráfico, etcétera.	O8423.02.01	f
2863	Administración y funcionamiento de tribunales civiles	Administración y funcionamiento de tribunales civiles	O8423.03.01	f
2864	Administración y funcionamiento de tribunales administrativos.	Administración y funcionamiento de tribunales administrativos.	O8423.03.02	f
2865	Administración y funcionamiento de tribunales penales	Administración y funcionamiento de tribunales penales	O8423.03.03	f
2866	Administración y funcionamiento de tribunales militares	Administración y funcionamiento de tribunales militares	O8423.03.04	f
2867	Administración y funcionamiento de funciones de representación jurídica y asistencia letrada en nombre del sector público y en nombre de terceros, cuando hay fondos o servicios públicos previstos con ese objeto; emisión de fallos e interpretación de la ley y arbitraje en procedimientos civiles.	Administración y funcionamiento de funciones de representación jurídica y asistencia letrada en nombre del sector público y en nombre de terceros, cuando hay fondos o servicios públicos previstos con ese objeto; emisión de fallos e interpretación de la ley y arbitraje en procedimientos civiles.	O8423.03.05	f
2978	Actividades escénicas como las actividades de grupos, circos o compañías.	Actividades escénicas como las actividades de grupos, circos o compañías.	R9000.01.02	f
2868	Administración de prisiones y prestación de servicios correccionales, incluidos los de rehabilitación, independientemente de que su administración y gestión se encomiende a unidades públicas o a unidades privadas a cambio de una retribución o por contrato.	Administración de prisiones y prestación de servicios correccionales, incluidos los de rehabilitación, independientemente de que su administración y gestión se encomiende a unidades públicas o a unidades privadas a cambio de una retribución o por contrato.	O8423.04.01	f
2869	Actividades de abastecimiento de suministros para su utilización en situaciones de emergencia interna en tiempos de paz causadas por desastres.	Actividades de abastecimiento de suministros para su utilización en situaciones de emergencia interna en tiempos de paz causadas por desastres.	O8423.05.01	f
2870	Financiación y administración de los programas de servicios públicos de seguridad social: Realización de pagos de transferencia para compensar la reducción o perdida de ingresos y para compensar la insuficiente capacidad de producir ingresos	Financiación y administración de los programas de servicios públicos de seguridad social: Realización de pagos de transferencia para compensar la reducción o perdida de ingresos y para compensar la insuficiente capacidad de producir ingresos	O8430.00.01	f
2871	Financiación y administración de los programas de servicios públicos de seguridad social: seguros de enfermedad, contra accidentes laborales y de desempleo, pensiones de jubilación, programas que cubren la pérdida de ingresos en casos de maternidad, incapacidad temporal, viudez, etcétera.	Financiación y administración de los programas de servicios públicos de seguridad social: seguros de enfermedad, contra accidentes laborales y de desempleo, pensiones de jubilación, programas que cubren la pérdida de ingresos en casos de maternidad, incapacidad temporal, viudez, etcétera.	O8430.00.02	f
2872	Otros servicios públicos de seguridad social.	Otros servicios públicos de seguridad social.	O8430.01.01	f
2873	La educación preprimaria o inicial (es el proceso de acompañamiento al desarrollo integral que considera los aspectos cognitivos, afectivo, psicomotriz, social, de identidad, autonomía y pertinencia a la comunidad diseñada principalmente para introducir a los niños y niñas, desde los tres años hasta los cinco años de edad en un entorno educativo de tipo escolar, es decir, servir de puente entre el hogar y el medio escolar).	La educación preprimaria o inicial (es el proceso de acompañamiento al desarrollo integral que considera los aspectos cognitivos, afectivo, psicomotriz, social, de identidad, autonomía y pertinencia a la comunidad diseñada principalmente para introducir a los niños y niñas, desde los tres años hasta los cinco años de edad en un entorno educativo de tipo escolar, es decir, servir de puente entre el hogar y el medio escolar).	P8510.11.01	f
2874	Educación preprimaria ó inicial especial, para alumnos con discapacidad.	Educación preprimaria ó inicial especial, para alumnos con discapacidad.	P8510.12.01	f
2875	Educación primaria (desarrolla las capacidades, habilidades, destrezas y competencias de las niñas, niños y adolescentes, está compuesta por siete años de estudios, comprende el impartir formación académica y otras tareas relacionadas a los estudiantes de primero hasta séptimo de básica, que proporcionan una sólida educación para lectura, escritura y matemáticas, así como un nivel elemental de comprensión de disciplinas como: historia, geografía, ciencias, etcétera; puede ser provista en salones de clases o a través de radio, televisión, Internet, correspondencia o en el hogar, incluye las actividades de escuelas unidocentes).	Educación primaria (desarrolla las capacidades, habilidades, destrezas y competencias de las niñas, niños y adolescentes, está compuesta por siete años de estudios, comprende el impartir formación académica y otras tareas relacionadas a los estudiantes de primero hasta séptimo de básica, que proporcionan una sólida educación para lectura, escritura y matemáticas, así como un nivel elemental de comprensión de disciplinas como: historia, geografía, ciencias, etcétera; puede ser provista en salones de clases o a través de radio, televisión, Internet, correspondencia o en el hogar, incluye las actividades de escuelas unidocentes).	P8510.21.01	f
2876	Educación primaria especial, para alumnos con discapacidad.	Educación primaria especial, para alumnos con discapacidad.	P8510.22.01	f
2877	Programas de alfabetización para adultos en el nivel primario educativo. La educación puede ser provista en salones de clases o a través de radio, televisión, Internet, correspondencia o en el hogar.	Programas de alfabetización para adultos en el nivel primario educativo. La educación puede ser provista en salones de clases o a través de radio, televisión, Internet, correspondencia o en el hogar.	P8510.23.01	f
2945	Actividades de casas de convalecencia, clínicas de reposo con atención de enfermería y residencias con cuidados de enfermería.	Actividades de casas de convalecencia, clínicas de reposo con atención de enfermería y residencias con cuidados de enfermería.	Q8710.02.01	f
2878	Programas de alfabetización para adultos en el nivel primario educativo. La educación puede ser provista en salones de clases o a través de radio, televisión, Internet, correspondencia o en el hogar.	Programas de alfabetización para adultos en el nivel primario educativo. La educación puede ser provista en salones de clases o a través de radio, televisión, Internet, correspondencia o en el hogar.	P8510.23.01	f
2879	PROGRAMAS DE INSTRUCCION ELEMENTAL PARA NIÑOS QUE NO TIENEN OPORTUNIDAD DE ASISTIR A LA ESCUELA.	PROGRAMAS DE INSTRUCCION ELEMENTAL PARA NIÑOS QUE NO TIENEN OPORTUNIDAD DE ASISTIR A LA ESCUELA.	P8510.24.01	f
2880	Educación secundaria (comprende seis años de educación a continuación de la educación primaria, desde octavo de básica hasta tercero de bachillerato, cursando un tronco común de asignaturas generales, optando por un bachillerato en ciencias o técnico. La educación puede ser provista en salones de clases o a través de radio, televisión, Internet, correspondencia o en el hogar.	Educación secundaria (comprende seis años de educación a continuación de la educación primaria, desde octavo de básica hasta tercero de bachillerato, cursando un tronco común de asignaturas generales, optando por un bachillerato en ciencias o técnico. La educación puede ser provista en salones de clases o a través de radio, televisión, Internet, correspondencia o en el hogar.	P8521.01.01	f
2881	Educación en bachilleratos complementarios (fortalece la formación obtenida en el bachillerato general unificado, es de carácter optativo y su duración es de un año adicional y pueden ser del tipo: bachillerato técnico productivo y bachillerato artístico. La educación puede ser provista en salones de clases o a través de radio, televisión, Internet, correspondencia o en el hogar).	Educación en bachilleratos complementarios (fortalece la formación obtenida en el bachillerato general unificado, es de carácter optativo y su duración es de un año adicional y pueden ser del tipo: bachillerato técnico productivo y bachillerato artístico. La educación puede ser provista en salones de clases o a través de radio, televisión, Internet, correspondencia o en el hogar).	P8521.02.01	f
2882	Educación especial secundaria para estudiantes discapacitados. La educación puede ser provista en salones de clases o a través de radio, televisión, Internet, correspondencia o en el hogar.	Educación especial secundaria para estudiantes discapacitados. La educación puede ser provista en salones de clases o a través de radio, televisión, Internet, correspondencia o en el hogar.	P8521.03.01	f
2883	Enseñanza técnica y profesional de nivel inferior al de la enseñanza superior.	Enseñanza técnica y profesional de nivel inferior al de la enseñanza superior.	P8522.01.01	f
2884	Capacitación para guías turísticos, cocineros y otro personal de hoteles y restaurantes.	Capacitación para guías turísticos, cocineros y otro personal de hoteles y restaurantes.	P8522.01.02	f
2885	Escuelas de conducir para chóferes profesionales: de camiones, buses, etcétera.	Escuelas de conducir para chóferes profesionales: de camiones, buses, etcétera.	P8522.02.01	f
2887	Educación especial, enseñanza de formación técnica y profesional para alumnos con discapacidad.	Educación especial, enseñanza de formación técnica y profesional para alumnos con discapacidad.	P8522.04.01	f
2888	Capacitación en reparación de computadoras.	Capacitación en reparación de computadoras.	P8522.05.01	f
2889	Educación de postbachillerato y nivel técnico superior, destinado a la formación y capacitación para labores de carácter operativo, corresponden a este nivel los títulos profesionales de técnico o tecnólogo.	Educación de postbachillerato y nivel técnico superior, destinado a la formación y capacitación para labores de carácter operativo, corresponden a este nivel los títulos profesionales de técnico o tecnólogo.	P8530.01.01	f
2890	Educación de tercer nivel, destinado a la formación básica en una disciplina o a la capacitación para el ejercicio de una profesión. Corresponden a este nivel el grado de licenciado y los títulos profesionales universitarios o politécnicos, que son equivalentes, incluido las actividades de escuelas de artes interpretativas que imparten enseñanza superior.	Educación de tercer nivel, destinado a la formación básica en una disciplina o a la capacitación para el ejercicio de una profesión. Corresponden a este nivel el grado de licenciado y los títulos profesionales universitarios o politécnicos, que son equivalentes, incluido las actividades de escuelas de artes interpretativas que imparten enseñanza superior.	P8530.02.01	f
2891	Educación de cuarto nivel o de posgrado, destinado a la especialización científica o entrenamiento profesional avanzado. Corresponden a este nivel los títulos intermedios de postgrado de especialista y diploma superior y los grados de magíster y doctor.	Educación de cuarto nivel o de posgrado, destinado a la especialización científica o entrenamiento profesional avanzado. Corresponden a este nivel los títulos intermedios de postgrado de especialista y diploma superior y los grados de magíster y doctor.	P8530.03.01	f
2892	Enseñanza en adiestramiento deportivo: béisbol, basketball, volleyball, fútbol, etcétera.	Enseñanza en adiestramiento deportivo: béisbol, basketball, volleyball, fútbol, etcétera.	P8541.01.01	f
2894	Enseñanza de equitación en academias o escuelas.	Enseñanza de equitación en academias o escuelas.	P8541.03.01	f
2897	Otro tipo de enseñanza deportiva y recreativa como: actividades de adiestramiento en campamentos deportivos, clases de juego de cartas por ejemplo bridge, actividades de instructores, profesores y entrenadores deportivos, enseñanza para animadores deportivos	Otro tipo de enseñanza deportiva y recreativa como: actividades de adiestramiento en campamentos deportivos, clases de juego de cartas por ejemplo bridge, actividades de instructores, profesores y entrenadores deportivos, enseñanza para animadores deportivos	P8541.09.01	f
2898	Clases de piano y otras actividades de formación musical.	Clases de piano y otras actividades de formación musical.	P8542.01.01	f
2899	Actividades de formación artística, escuelas de teatro, escuelas de bellas artes y escuelas de artes interpretativas (excepto las académicas).	Actividades de formación artística, escuelas de teatro, escuelas de bellas artes y escuelas de artes interpretativas (excepto las académicas).	P8542.02.01	f
2900	Escuelas y academias de baile.	Escuelas y academias de baile.	P8542.03.01	f
2901	Escuelas de fotografía (excepto las comerciales).	Escuelas de fotografía (excepto las comerciales).	P8542.04.01	f
2946	Actividades de casas de salud.	Actividades de casas de salud.	Q8710.03.01	f
2902	Actividades de enseñanza que no puede asignarse a un nivel determinado, incluye los procesos de formación docente de capacitación y perfeccionamiento.	Actividades de enseñanza que no puede asignarse a un nivel determinado, incluye los procesos de formación docente de capacitación y perfeccionamiento.	P8549.11.01	f
2903	Actividades de servicios de  deberes dirigidos, tutoría académica, preparación para el ingreso a la universidad, centros de enseñanza que ofrecen cursos de recuperación y cursos de repaso para exámenes profesionales.	Actividades de servicios de  deberes dirigidos, tutoría académica, preparación para el ingreso a la universidad, centros de enseñanza que ofrecen cursos de recuperación y cursos de repaso para exámenes profesionales.	P8549.12.01	f
2904	Actividades de enseñanza de idiomas y clases de conversación.	Actividades de enseñanza de idiomas y clases de conversación.	P8549.13.01	f
2905	Actividades de enseñanza de métodos de lectura rápida y cursos de oratoria.	Actividades de enseñanza de métodos de lectura rápida y cursos de oratoria.	P8549.14.01	f
2907	Actividades de centros de capacitación artesanal: corte y confección, carpintería, tallado en madera, manualidades, etcétera.	Actividades de centros de capacitación artesanal: corte y confección, carpintería, tallado en madera, manualidades, etcétera.	P8549.16.01	f
2908	Actividades de capacitación en informática.	Actividades de capacitación en informática.	P8549.17.01	f
2909	Actividades de escuelas de conducir que no conceden certificados ni permisos profesionales.	Actividades de escuelas de conducir que no conceden certificados ni permisos profesionales.	P8549.91.01	f
2910	Actividades de escuelas de vuelo.	Actividades de escuelas de vuelo.	P8549.92.01	f
2911	Actividades de capacitación de socorristas y cursos de supervivencia.	Actividades de capacitación de socorristas y cursos de supervivencia.	P8549.93.01	f
2912	OTROS TIPOS DE ENSEÑANZA N.C.P.	OTROS TIPOS DE ENSEÑANZA N.C.P.	P8549.94.01	f
2979	Actividades de cantantes, orquestas o bandas,  incluido actividades complementarias para la producción.	Actividades de cantantes, orquestas o bandas,  incluido actividades complementarias para la producción.	R9000.01.03	f
2913	Prestación de servicios no educativos de apoyo a procesos o sistemas educativos como consultoría de educación, orientación educativa, servicios de exámenes y evaluación de los mismos.	Prestación de servicios no educativos de apoyo a procesos o sistemas educativos como consultoría de educación, orientación educativa, servicios de exámenes y evaluación de los mismos.	P8550.00.01	f
2914	Actividades de organización de programas de intercambio de estudiantes.	Actividades de organización de programas de intercambio de estudiantes.	P8550.00.02	f
2915	Actividades a corto y a largo plazo de los hospitales básicos y generales, es decir, actividades médicas, de diagnóstico y de tratamiento (hospitales: comunitarios y regionales, de organizaciones sin fines de lucro, universitarios, de bases militares y de prisiones, del Ministerio de gobierno y policía, del Ministerio de defensa nacional, de la Junta de Beneficencia, del Seguro Social, Fisco Misionales).	Actividades a corto y a largo plazo de los hospitales básicos y generales, es decir, actividades médicas, de diagnóstico y de tratamiento (hospitales: comunitarios y regionales, de organizaciones sin fines de lucro, universitarios, de bases militares y de prisiones, del Ministerio de gobierno y policía, del Ministerio de defensa nacional, de la Junta de Beneficencia, del Seguro Social, Fisco Misionales).	Q8610.01.01	f
2916	Actividades a corto y a largo plazo de clínicas del día, básicas, odontológicas y generales, es decir, actividades médicas, de diagnóstico y de tratamiento.	Actividades a corto y a largo plazo de clínicas del día, básicas, odontológicas y generales, es decir, actividades médicas, de diagnóstico y de tratamiento.	Q8610.02.01	f
2917	Actividades a corto y a largo plazo de los hospitales especializados, es decir, actividades médicas, de diagnóstico y de tratamiento (hospitales para enfermos mentales, centros de rehabilitación, hospitales para enfermedades infecciosas, de maternidad, sanatorios especializados, bases militares, prisiones, etcétera).	Actividades a corto y a largo plazo de los hospitales especializados, es decir, actividades médicas, de diagnóstico y de tratamiento (hospitales para enfermos mentales, centros de rehabilitación, hospitales para enfermedades infecciosas, de maternidad, sanatorios especializados, bases militares, prisiones, etcétera).	Q8610.03.01	f
2918	Actividades a corto y a largo plazo de los hospitales especializados, es decir, actividades médicas, de diagnóstico y de tratamiento (hospitales para enfermos mentales, centros de rehabilitación, hospitales para enfermedades infecciosas, de maternidad, sanatorios especializados, bases militares, prisiones, etcétera).	Actividades a corto y a largo plazo de los hospitales especializados, es decir, actividades médicas, de diagnóstico y de tratamiento (hospitales para enfermos mentales, centros de rehabilitación, hospitales para enfermedades infecciosas, de maternidad, sanatorios especializados, bases militares, prisiones, etcétera).	Q8610.03.01	f
2919	Actividades a corto y a largo plazo de clínicas especializadas, es decir, actividades médicas, de diagnóstico y de tratamiento (clínicas para enfermos mentales, de rehabilitación, para enfermedades infecciosas, de maternidad, etcétera).	Actividades a corto y a largo plazo de clínicas especializadas, es decir, actividades médicas, de diagnóstico y de tratamiento (clínicas para enfermos mentales, de rehabilitación, para enfermedades infecciosas, de maternidad, etcétera).	Q8610.04.01	f
2920	Servicios de centros de planificación familiar que provee tratamientos médicos, como los de esterilización y de interrupción del embarazo, con alojamiento.	Servicios de centros de planificación familiar que provee tratamientos médicos, como los de esterilización y de interrupción del embarazo, con alojamiento.	Q8610.05.01	f
2921	Consulta y tratamiento por médicos generales y especialistas en consultorios privados.	Consulta y tratamiento por médicos generales y especialistas en consultorios privados.	Q8620.01.01	f
2922	Consulta y tratamiento por médicos generales y especialista en centros médicos de las diferentes instituciones y a domicilio.	Consulta y tratamiento por médicos generales y especialista en centros médicos de las diferentes instituciones y a domicilio.	Q8620.01.02	f
2923	Consulta y tratamiento por médicos generales y especialistas. Estas actividades pueden realizarse en consultorios colectivos, en clínicas ambulatorias, en clínicas anexas a empresas, escuelas, residencias de ancianos u organizaciones sindicales o fraternales.	Consulta y tratamiento por médicos generales y especialistas. Estas actividades pueden realizarse en consultorios colectivos, en clínicas ambulatorias, en clínicas anexas a empresas, escuelas, residencias de ancianos u organizaciones sindicales o fraternales.	Q8620.01.03	f
2947	Servicios de atención en instalaciones para el tratamiento del alcoholismo y la drogodependencia.	Servicios de atención en instalaciones para el tratamiento del alcoholismo y la drogodependencia.	Q8720.01.01	f
2924	Actividades de atención odontológica de carácter general o especializado, por ejemplo, odontología, endodoncia y odontología pediátrica; estomatología; ortodoncia en consultorios privados	Actividades de atención odontológica de carácter general o especializado, por ejemplo, odontología, endodoncia y odontología pediátrica; estomatología; ortodoncia en consultorios privados	Q8620.02.01	f
2925	Actividades de atención odontológica de carácter general o especializado, por ejemplo, odontología, endodoncia y odontología pediátrica; estomatología; ortodoncia en clinicas ambulatorias	Actividades de atención odontológica de carácter general o especializado, por ejemplo, odontología, endodoncia y odontología pediátrica; estomatología; ortodoncia en clinicas ambulatorias	Q8620.02.02	f
2926	Actividades de atención odontológica de carácter general o especializado, por ejemplo, odontología, endodoncia y odontología pediátrica; estomatología; ortodoncia en centros medicos de instituciones	Actividades de atención odontológica de carácter general o especializado, por ejemplo, odontología, endodoncia y odontología pediátrica; estomatología; ortodoncia en centros medicos de instituciones	Q8620.02.03	f
2927	Servicios de centros de planificación familiar que provee tratamientos médicos, como los de esterilización y de interrupción del embarazo, sin alojamiento.	Servicios de centros de planificación familiar que provee tratamientos médicos, como los de esterilización y de interrupción del embarazo, sin alojamiento.	Q8620.03.01	f
2928	Actividades de atención odontológica en salas de operaciones.	Actividades de atención odontológica en salas de operaciones.	Q8620.04.01	f
2929	Servicios de asistencia médica privada a pacientes internos por médicos externos.	Servicios de asistencia médica privada a pacientes internos por médicos externos.	Q8620.05.01	f
2930	Actividades de atención de la salud humana realizadas por enfermeros, enfermeras y auxiliares de enfermería, que no se llevan a cabo en hospitales ni tengan la participación de médicos ni de odontólogos.	Actividades de atención de la salud humana realizadas por enfermeros, enfermeras y auxiliares de enfermería, que no se llevan a cabo en hospitales ni tengan la participación de médicos ni de odontólogos.	Q8690.11.01	f
2931	Actividades de atención de la salud humana realizadas por personal paramédico especializado que no se llevan a cabo en hospitales ni tengan la participación de médicos ni de odontólogos.	Actividades de atención de la salud humana realizadas por personal paramédico especializado que no se llevan a cabo en hospitales ni tengan la participación de médicos ni de odontólogos.	Q8690.12.01	f
2932	Actividades de atención de la salud humana realizadas por personal especializado en optometría y oftalmología que no se llevan a cabo en hospitales ni tengan la participación de médicos ni de odontólogos.	Actividades de atención de la salud humana realizadas por personal especializado en optometría y oftalmología que no se llevan a cabo en hospitales ni tengan la participación de médicos ni de odontólogos.	Q8690.13.01	f
2933	Actividades de atención de la salud humana realizadas por personal especializado en quiropráctica, que no se llevan a cabo en hospitales ni tengan la participación de médicos ni de odontólogos.	Actividades de atención de la salud humana realizadas por personal especializado en quiropráctica, que no se llevan a cabo en hospitales ni tengan la participación de médicos ni de odontólogos.	Q8690.14.01	f
2934	Actividades de atención de la salud humana realizadas por personal especializado en acupuntura, que no se llevan a cabo en hospitales ni tengan la participación de médicos ni de odontólogos.	Actividades de atención de la salud humana realizadas por personal especializado en acupuntura, que no se llevan a cabo en hospitales ni tengan la participación de médicos ni de odontólogos.	Q8690.15.01	f
2935	Actividades de atención de la salud humana realizadas por personal especializado en homeopatía, que no se llevan a cabo en hospitales ni tengan la participación de médicos ni de odontólogos.	Actividades de atención de la salud humana realizadas por personal especializado en homeopatía, que no se llevan a cabo en hospitales ni tengan la participación de médicos ni de odontólogos.	Q8690.16.01	f
2936	Actividades de atención de la salud humana realizadas por: parteras,  personal especializado en fisioterapia, hidroterapia, masaje terapéutico, ergoterapia, logoterapia, podología, etcétera; que no se llevan a cabo en hospitales ni tengan la participación de médicos ni de odontólogos.	Actividades de atención de la salud humana realizadas por: parteras,  personal especializado en fisioterapia, hidroterapia, masaje terapéutico, ergoterapia, logoterapia, podología, etcétera; que no se llevan a cabo en hospitales ni tengan la participación de médicos ni de odontólogos.	Q8690.17.01	f
2937	Actividades de personal paramédico de odontología,  como terapeutas dentales, enfermeros escolares con conocimientos de odontología e higienistas dentales, que pueden atender a pacientes sin la presencia del odontólogo pero son supervisados periódicamente por éste.	Actividades de personal paramédico de odontología,  como terapeutas dentales, enfermeros escolares con conocimientos de odontología e higienistas dentales, que pueden atender a pacientes sin la presencia del odontólogo pero son supervisados periódicamente por éste.	Q8690.18.01	f
2938	Actividades de Laboratorios de radiología (rayos X) y otros centros de diagnóstico por imagen.	Actividades de Laboratorios de radiología (rayos X) y otros centros de diagnóstico por imagen.	Q8690.21.01	f
2939	Actividades de laboratorios clínicos de análisis de sangre, orina, etcétera.	Actividades de laboratorios clínicos de análisis de sangre, orina, etcétera.	Q8690.22.01	f
2940	Transporte de pacientes en ambulancias corrientes. Estos servicios se prestan a menudo durante una situación de emergencia médica.	Transporte de pacientes en ambulancias corrientes. Estos servicios se prestan a menudo durante una situación de emergencia médica.	Q8690.91.01	f
2941	Transporte de pacientes en  ambulancias aéreas. Estos servicios se prestan a menudo durante una situación de emergencia médica.	Transporte de pacientes en  ambulancias aéreas. Estos servicios se prestan a menudo durante una situación de emergencia médica.	Q8690.91.02	f
2942	Actividades de banco de sangre, de esperma, de órganos para transplantes, etcétera.	Actividades de banco de sangre, de esperma, de órganos para transplantes, etcétera.	Q8690.92.01	f
2943	Otros servicios auxiliares al tratamiento médico n.c.p. como aplicación de vacunas, medición de la presión arterial y la capacidad auditiva, etcétera.	Otros servicios auxiliares al tratamiento médico n.c.p. como aplicación de vacunas, medición de la presión arterial y la capacidad auditiva, etcétera.	Q8690.99.01	f
2944	Actividades de residencias de ancianos con atención de enfermería.	Actividades de residencias de ancianos con atención de enfermería.	Q8710.01.01	f
2970	Servicios de asesoramiento en cuestiones crediticias y de deuda.	Servicios de asesoramiento en cuestiones crediticias y de deuda.	Q8890.04.04	f
2948	Servicios de atención en casas de convalecencia psiquiátrica, servicios de atención en hogares residenciales colectivos para personas con perturbaciones emocionales.	Servicios de atención en casas de convalecencia psiquiátrica, servicios de atención en hogares residenciales colectivos para personas con perturbaciones emocionales.	Q8720.02.01	f
2949	Servicios de atención en hogares de transición para enfermos mentales.	Servicios de atención en hogares de transición para enfermos mentales.	Q8720.02.02	f
2950	Actividades de asistencia social prestadas por hogares para personas discapacitadas físicamente, incluso ciegos y sordomudos.	Actividades de asistencia social prestadas por hogares para personas discapacitadas físicamente, incluso ciegos y sordomudos.	Q8720.02.03	f
2951	Servicios de atención en instalaciones para personas con retraso mental.	Servicios de atención en instalaciones para personas con retraso mental.	Q8720.03.01	f
2952	Actividades de atención en instalaciones residenciales con asistencia para la vida cotidiana.	Actividades de atención en instalaciones residenciales con asistencia para la vida cotidiana.	Q8730.01.01	f
2953	Actividades de atención en hogares de ancianos con atención mínima de enfermería.	Actividades de atención en hogares de ancianos con atención mínima de enfermería.	Q8730.02.01	f
2954	Actividades de atención en casas de reposo sin atención de enfermería	Actividades de atención en casas de reposo sin atención de enfermería	Q8730.02.02	f
2955	Actividades de atención en comunidades de jubilados con atención permanente.	Actividades de atención en comunidades de jubilados con atención permanente.	Q8730.02.03	f
2980	Otras actividades escénicas realizadas en directo como: actividades de directores, productores, diseñadores y constructores de escenarios, tramoyistas, manejo de telones, técnicos de iluminación y sonido, etcétera.	Otras actividades escénicas realizadas en directo como: actividades de directores, productores, diseñadores y constructores de escenarios, tramoyistas, manejo de telones, técnicos de iluminación y sonido, etcétera.	R9000.01.04	f
115	Producción de miel de abeja.	Producción de miel de abeja.	A0149.94.03	t
2956	Actividades destinadas a proporcionar asistencia social las 24 horas del día a niños y a determinadas categorías de personas que no pueden valerse plenamente por sí mismas, en las que el tratamiento médico o la enseñanza no son componentes importantes, como: orfanatos, hogares y albergues infantiles, albergues temporales para personas sin hogar. Estas actividades pueden ser realizadas por organizaciones públicas o privadas.	Actividades destinadas a proporcionar asistencia social las 24 horas del día a niños y a determinadas categorías de personas que no pueden valerse plenamente por sí mismas, en las que el tratamiento médico o la enseñanza no son componentes importantes, como: orfanatos, hogares y albergues infantiles, albergues temporales para personas sin hogar. Estas actividades pueden ser realizadas por organizaciones públicas o privadas.	Q8790.01.01	f
2957	Actividades destinadas a proporcionar asistencia social las 24 horas del día a niños y a determinadas categorías de personas que no pueden valerse plenamente por sí mismas, en las que el tratamiento médico o la enseñanza no son componentes importantes, en instituciones que atienden a madres solteras y a sus hijos. Estas actividades pueden ser realizadas por organizaciones públicas o privadas.	Actividades destinadas a proporcionar asistencia social las 24 horas del día a niños y a determinadas categorías de personas que no pueden valerse plenamente por sí mismas, en las que el tratamiento médico o la enseñanza no son componentes importantes, en instituciones que atienden a madres solteras y a sus hijos. Estas actividades pueden ser realizadas por organizaciones públicas o privadas.	Q8790.01.02	f
2958	Actividades de atención en hogares de transición colectivos para personas con problemas sociales o personales; como correccionales para jovenes.	Actividades de atención en hogares de transición colectivos para personas con problemas sociales o personales; como correccionales para jovenes.	Q8790.02.01	f
2959	Actividades de atención en hogares de transición para delincuentes y campamentos disciplinarios.	Actividades de atención en hogares de transición para delincuentes y campamentos disciplinarios.	Q8790.02.02	f
2960	Servicios sociales, de asesoramiento, de bienestar social, de remisión y servicios similares que prestan a personas con discapacidad, en sus domicilios o en otros lugares, organizaciones públicas o privadas, organizaciones nacionales o locales de autoayuda y especialistas en servicios de asesoramiento como visitas a enfermos.	Servicios sociales, de asesoramiento, de bienestar social, de remisión y servicios similares que prestan a personas con discapacidad, en sus domicilios o en otros lugares, organizaciones públicas o privadas, organizaciones nacionales o locales de autoayuda y especialistas en servicios de asesoramiento como visitas a enfermos.	Q8810.00.01	f
2961	Servicios sociales, de asesoramiento, de bienestar social, de remisión y servicios similares que prestan a personas de edad, en sus domicilios o en otros lugares, organizaciones públicas o privadas, organizaciones nacionales o locales de autoayuda y especialistas en servicios de asesoramiento como visitas a ancianos y enfermos.	Servicios sociales, de asesoramiento, de bienestar social, de remisión y servicios similares que prestan a personas de edad, en sus domicilios o en otros lugares, organizaciones públicas o privadas, organizaciones nacionales o locales de autoayuda y especialistas en servicios de asesoramiento como visitas a ancianos y enfermos.	Q8810.00.02	f
2962	Actividades de atención diurna para ancianos y adultos con discapacidad y actividades de adiestramiento y readaptación profesional para personas con discapacidad, siempre que el componente de educación sea limitado.	Actividades de atención diurna para ancianos y adultos con discapacidad y actividades de adiestramiento y readaptación profesional para personas con discapacidad, siempre que el componente de educación sea limitado.	Q8810.00.03	f
2963	Actividades de guardería o atención diurna de niños, incluyendo el cuidado diurno de niños con discapacidad	Actividades de guardería o atención diurna de niños, incluyendo el cuidado diurno de niños con discapacidad	Q8890.01.01	f
2964	Actividades de guardería o atención diurna de niños, incluyendo el cuidado diurno de niños con discapacidad	Actividades de guardería o atención diurna de niños, incluyendo el cuidado diurno de niños con discapacidad	Q8890.01.01	f
2965	Servicios diurnos para personas sin hogar y otros grupos socialmente desfavorecidos.	Servicios diurnos para personas sin hogar y otros grupos socialmente desfavorecidos.	Q8890.02.01	f
2966	Actividades de bienestar social y de orientación para niños y adolescentes, actividades de adopción y actividades para prevenir la crueldad contra los niños y otras personas.	Actividades de bienestar social y de orientación para niños y adolescentes, actividades de adopción y actividades para prevenir la crueldad contra los niños y otras personas.	Q8890.03.01	f
2967	Servicios de asesoramiento en economía doméstica, de orientación matrimonial y familiar.	Servicios de asesoramiento en economía doméstica, de orientación matrimonial y familiar.	Q8890.04.01	f
2968	Actividades de rehabilitación y habilitación profesional para personas desempleadas, siempre que el componente de educación sea limitado.	Actividades de rehabilitación y habilitación profesional para personas desempleadas, siempre que el componente de educación sea limitado.	Q8890.04.02	f
2969	Actividades comunitarias y vecinales.	Actividades comunitarias y vecinales.	Q8890.04.03	f
2972	Actividades de determinación del derecho a recibir prestaciones sociales, subsidios de alquiler o cupones de alimentos.	Actividades de determinación del derecho a recibir prestaciones sociales, subsidios de alquiler o cupones de alimentos.	Q8890.05.01	f
2973	Actividades de ayuda a refugiados, inmigrantes, etcétera, incluido el suministro de alojamiento a esas personas a título temporal o por períodos prolongados.	Actividades de ayuda a refugiados, inmigrantes, etcétera, incluido el suministro de alojamiento a esas personas a título temporal o por períodos prolongados.	Q8890.09.01	f
2974	Actividades de ayuda a víctimas de desastres, etcétera, incluido el suministro de alojamiento a esas personas a título temporal o por períodos prolongados.	Actividades de ayuda a víctimas de desastres, etcétera, incluido el suministro de alojamiento a esas personas a título temporal o por períodos prolongados.	Q8890.09.02	f
2975	Actividades de beneficencia, como recaudación de fondos y otras actividades de apoyo con fines de asistencia social.	Actividades de beneficencia, como recaudación de fondos y otras actividades de apoyo con fines de asistencia social.	Q8890.09.03	f
2976	Asistencia para personas incapacitadas o desempleadas (siempre que el componente de educacion sea limitado).	Asistencia para personas incapacitadas o desempleadas (siempre que el componente de educacion sea limitado).	Q8890.10.01	f
2977	Producción de obras de teatro, conciertos, óperas y espectáculos de danza.	Producción de obras de teatro, conciertos, óperas y espectáculos de danza.	R9000.01.01	f
117	Cría de diversos animales.	Cría de diversos animales.	A0149.96.01	t
2981	Actividades de artistas individuales, como escritores, directores, escenógrafos, constructores de decorados, actrices, etcétera; escritores de todo tipo, por ejemplo, obras de ficción, de obras técnicas, etcétera.	Actividades de artistas individuales, como escritores, directores, escenógrafos, constructores de decorados, actrices, etcétera; escritores de todo tipo, por ejemplo, obras de ficción, de obras técnicas, etcétera.	R9000.02.01	f
2982	Actividades de artistas individuales, como conferencistas u oradores.	Actividades de artistas individuales, como conferencistas u oradores.	R9000.02.02	f
2983	Actividades individuales prestados por músicos.	Actividades individuales prestados por músicos.	R9000.02.03	f
2984	Actividades de artistas individuales, como escultores, pintores, dibujantes, caricaturistas, grabadores, etcétera, se incluye la restauración de obras de arte, como cuadros, etcétera.	Actividades de artistas individuales, como escultores, pintores, dibujantes, caricaturistas, grabadores, etcétera, se incluye la restauración de obras de arte, como cuadros, etcétera.	R9000.02.04	f
2985	Actividades realizadas por modelos independientes.	Actividades realizadas por modelos independientes.	R9000.02.05	f
2986	Gestión de salas de conciertos, teatros y otras instalaciones similares.	Gestión de salas de conciertos, teatros y otras instalaciones similares.	R9000.03.01	f
2987	Actividades de productores o empresarios de espectáculos artísticos en vivo, aporten o no ellos mismos las instalaciones correspondientes.	Actividades de productores o empresarios de espectáculos artísticos en vivo, aporten o no ellos mismos las instalaciones correspondientes.	R9000.04.01	f
2988	Actividades de periodistas independientes.	Actividades de periodistas independientes.	R9000.05.01	f
2989	Actividades de documentación e información realizadas por bibliotecas de todo tipo, salas de lectura, audición y proyección, archivos públicos abiertos al público en general o a determinadas categorías de personas, como estudiantes, científicos, empleados de la organización a la que pertenece la biblioteca, y gestión de archivos de la administración pública.	Actividades de documentación e información realizadas por bibliotecas de todo tipo, salas de lectura, audición y proyección, archivos públicos abiertos al público en general o a determinadas categorías de personas, como estudiantes, científicos, empleados de la organización a la que pertenece la biblioteca, y gestión de archivos de la administración pública.	R9101.00.01	f
2990	Actividades de organización de fondos bibliográficos, catalogación de colecciones y preparación de catálogos.	Actividades de organización de fondos bibliográficos, catalogación de colecciones y preparación de catálogos.	R9101.00.02	f
2991	Actividades de mantenimiento y préstamo de libros, mapas, revistas, etcétera; actividades de búsqueda para atender a solicitudes de información.	Actividades de mantenimiento y préstamo de libros, mapas, revistas, etcétera; actividades de búsqueda para atender a solicitudes de información.	R9101.00.03	f
2992	Actividades de mantenimiento y préstamo de películas, discos, cintas grabadas, obras de arte, etcétera; actividades de búsqueda para atender a solicitudes de información.	Actividades de mantenimiento y préstamo de películas, discos, cintas grabadas, obras de arte, etcétera; actividades de búsqueda para atender a solicitudes de información.	R9101.00.04	f
2993	Servicio de archivos fotográficos y bancos de imágenes.	Servicio de archivos fotográficos y bancos de imágenes.	R9101.00.05	f
2994	Actividades de museos de arte, orfebrería, muebles, trajes,  cerámica, platería.	Actividades de museos de arte, orfebrería, muebles, trajes,  cerámica, platería.	R9102.00.01	f
2995	Actividades de museos de historia natural y de ciencias, museos tecnológicos e históricos.	Actividades de museos de historia natural y de ciencias, museos tecnológicos e históricos.	R9102.00.02	f
2996	Actividades de museos militares y al aire libre; se incluye la gestión de lugares y edificios históricos y otros museos especializados.	Actividades de museos militares y al aire libre; se incluye la gestión de lugares y edificios históricos y otros museos especializados.	R9102.00.03	f
2997	Gestión de jardines botánicos y zoológicos, incluidos zoológicos infantiles.	Gestión de jardines botánicos y zoológicos, incluidos zoológicos infantiles.	R9103.01.01	f
2998	Gestión de reservas naturales, incluidas las actividades de preservación de la flora y fauna silvestres, etcétera.	Gestión de reservas naturales, incluidas las actividades de preservación de la flora y fauna silvestres, etcétera.	R9103.02.01	f
3000	Gestión (explotación) de máquinas de juegos de azar accionadas con monedas y explotación de casinos, incluidos casinos flotantes, billares, etcétera.	Gestión (explotación) de máquinas de juegos de azar accionadas con monedas y explotación de casinos, incluidos casinos flotantes, billares, etcétera.	R9200.02.01	f
3001	Gestión de sitios de Internet dedicados a los juegos de azar virtuales, videojuegos.	Gestión de sitios de Internet dedicados a los juegos de azar virtuales, videojuegos.	R9200.03.01	f
3002	Apuestas sobre carreras de caballos en el propio hipódromo y fuera del hipódromo y otros servicios de apuestas.	Apuestas sobre carreras de caballos en el propio hipódromo y fuera del hipódromo y otros servicios de apuestas.	R9200.04.01	f
3003	Explotación de instalaciones para actividades deportivas bajo techo o al aire libre (abiertas, cerradas o techadas, con asientos para espectadores): campos y estadios de fútbol, hockey, béisbol, estadios de atletismo, piscinas, campos de golf, circuitos de carreras de automóviles, canódromos, hipódromos, pistas y estadios para deportes de invierno y pistas de hockey sobre hielo.	Explotación de instalaciones para actividades deportivas bajo techo o al aire libre (abiertas, cerradas o techadas, con asientos para espectadores): campos y estadios de fútbol, hockey, béisbol, estadios de atletismo, piscinas, campos de golf, circuitos de carreras de automóviles, canódromos, hipódromos, pistas y estadios para deportes de invierno y pistas de hockey sobre hielo.	R9311.01.01	f
3004	Explotación de instalaciones para actividades deportivas bajo techo o al aire libre (abiertas, cerradas o techadas, con asientos o sin ellos para espectadores): pabellones de boxeo y gimnasios.	Explotación de instalaciones para actividades deportivas bajo techo o al aire libre (abiertas, cerradas o techadas, con asientos o sin ellos para espectadores): pabellones de boxeo y gimnasios.	R9311.02.01	f
3005	Organización y gestión de competencias deportivas al aire libre o bajo techo con participación de deportistas profesionales o aficionados, por parte de organizaciones con instalaciones propias. Se incluyen la gestión de esas instalaciones y la dotación del personal necesario para su funcionamiento.	Organización y gestión de competencias deportivas al aire libre o bajo techo con participación de deportistas profesionales o aficionados, por parte de organizaciones con instalaciones propias. Se incluyen la gestión de esas instalaciones y la dotación del personal necesario para su funcionamiento.	R9311.03.01	f
3006	Explotación de instalaciones para actividades deportivas bajo techo o al aire libre (abiertas, cerradas o techadas, con asientos o sin ellos para espectadores): boleras.	Explotación de instalaciones para actividades deportivas bajo techo o al aire libre (abiertas, cerradas o techadas, con asientos o sin ellos para espectadores): boleras.	R9311.04.01	f
3007	Actividades de clubes deportivos profesionales, semiprofesionales o de aficionados que ofrecen a sus miembros la oportunidad de participar en actividades deportivas, se incluyen las siguientes actividades: clubes de fútbol, clubes de bolos, clubes de natación, clubes de golf, clubes de boxeo, clubes de físico culturismo, clubes de deportes de invierno, clubes de ajedrez, clubes de atletismo, clubes de tiro, etcétera.	Actividades de clubes deportivos profesionales, semiprofesionales o de aficionados que ofrecen a sus miembros la oportunidad de participar en actividades deportivas, se incluyen las siguientes actividades: clubes de fútbol, clubes de bolos, clubes de natación, clubes de golf, clubes de boxeo, clubes de físico culturismo, clubes de deportes de invierno, clubes de ajedrez, clubes de atletismo, clubes de tiro, etcétera.	R9312.00.01	f
3008	Actividades de productores promotores y actividades relacionadas con la promoción de competencias deportivas, con o sin instalaciones.	Actividades de productores promotores y actividades relacionadas con la promoción de competencias deportivas, con o sin instalaciones.	R9319.01.01	f
3009	Actividades por cuenta propia de deportistas y atletas.	Actividades por cuenta propia de deportistas y atletas.	R9319.02.01	f
3010	Actividades por cuenta propia de árbitros, jueces, cronometradores, profesores, entrenadores, etcétera.	Actividades por cuenta propia de árbitros, jueces, cronometradores, profesores, entrenadores, etcétera.	R9319.02.02	f
3011	Actividades de las ligas deportivas y de órganos reguladores.	Actividades de las ligas deportivas y de órganos reguladores.	R9319.03.01	f
3012	Actividades de los guías de montaña.	Actividades de los guías de montaña.	R9319.04.01	f
3013	Actividades relacionadas con carreras de caballos y galgos.	Actividades relacionadas con carreras de caballos y galgos.	R9319.05.01	f
3014	Actividades relacionadas con automóviles.	Actividades relacionadas con automóviles.	R9319.05.02	f
3015	Gestión de reservas y actividades de apoyo para la caza y pesca deportiva o recreativa.	Gestión de reservas y actividades de apoyo para la caza y pesca deportiva o recreativa.	R9319.06.01	f
3016	Actividades de parques de atracción y parques temáticos, incluida la explotación de diversas atracciones mecánicas y acuáticas, juegos, espectáculos, exposiciones temáticas y lugares de picnics.	Actividades de parques de atracción y parques temáticos, incluida la explotación de diversas atracciones mecánicas y acuáticas, juegos, espectáculos, exposiciones temáticas y lugares de picnics.	R9321.00.01	f
3017	Actividades de espectaculos de rodeo	Actividades de espectaculos de rodeo	R9321.00.02	f
3018	Contratación de actores y actrices para obras cinematográficas de televisión o de teatro a cambio de una retribución o por contrato.	Contratación de actores y actrices para obras cinematográficas de televisión o de teatro a cambio de una retribución o por contrato.	R9321.00.03	f
3019	Agencias de contratación de espectáculos teatrales o de otros tipos de espectáculos recreativos a cambio de una retribución o por contrato.	Agencias de contratación de espectáculos teatrales o de otros tipos de espectáculos recreativos a cambio de una retribución o por contrato.	R9321.00.04	f
3020	Servicios de grabación de sonidos en discos gramofónicos o en cintas magnetofónicas a cambio de una retribución o por contrato.	Servicios de grabación de sonidos en discos gramofónicos o en cintas magnetofónicas a cambio de una retribución o por contrato.	R9321.00.05	f
3021	Actividades de parques recreativos y playas, incluido el alquiler de casetas, casilleros, sillas, hamacas; la gestión de instalaciones de transporte recreativo; por ejemplo, puertos deportivos, y el alquiler de equipo de esparcimiento y recreo como parte integral de los servicios de esparcimiento, bananas, lanchas, etcétera.	Actividades de parques recreativos y playas, incluido el alquiler de casetas, casilleros, sillas, hamacas; la gestión de instalaciones de transporte recreativo; por ejemplo, puertos deportivos, y el alquiler de equipo de esparcimiento y recreo como parte integral de los servicios de esparcimiento, bananas, lanchas, etcétera.	R9329.01.01	f
3022	Actividades de explotación de ferias y exposiciones de carácter recreativo, incluido la explotación de juegos accionados con monedas.	Actividades de explotación de ferias y exposiciones de carácter recreativo, incluido la explotación de juegos accionados con monedas.	R9329.02.01	f
3023	Actividades de explotación de pistas de baile incluye karaokes, etcétera.	Actividades de explotación de pistas de baile incluye karaokes, etcétera.	R9329.03.01	f
3024	Actividades de explotación de discotecas.	Actividades de explotación de discotecas.	R9329.03.02	f
3025	Actividades de productores o empresarios de espectáculos en vivo distintos de los artísticos o deportivos, aporten o no ellos mismos las instalaciones correspondientes.	Actividades de productores o empresarios de espectáculos en vivo distintos de los artísticos o deportivos, aporten o no ellos mismos las instalaciones correspondientes.	R9329.04.01	f
3026	Otras actividades de esparcimiento y recreativas (excepto las de parques de atracciones y parques temáticos) no clasificadas en otra parte, incluye la gestión de estaciones de esquí, galleras, plazas de toros, etcétera.	Otras actividades de esparcimiento y recreativas (excepto las de parques de atracciones y parques temáticos) no clasificadas en otra parte, incluye la gestión de estaciones de esquí, galleras, plazas de toros, etcétera.	R9329.09.01	f
3027	Actividades de organizaciones cuyos miembros se interesan principalmente por el desarrollo y la prosperidad de las empresas de un determinado sector empresarial o comercial incluido el sector agropecuario, o en la situación y el crecimiento económico de una determinada zona geográfica o subdivisión política, independientemente de la rama de actividad y actividades de cámaras de comercio, gremios y organizaciones similares.	Actividades de organizaciones cuyos miembros se interesan principalmente por el desarrollo y la prosperidad de las empresas de un determinado sector empresarial o comercial incluido el sector agropecuario, o en la situación y el crecimiento económico de una determinada zona geográfica o subdivisión política, independientemente de la rama de actividad y actividades de cámaras de comercio, gremios y organizaciones similares.	S9411.00.01	f
3028	Actividades de federaciones empresariales y patronales .	Actividades de federaciones empresariales y patronales .	S9411.00.02	f
3050	Actividades de clubes y organizaciones fraternales de estudiantes, etcétera.	Actividades de clubes y organizaciones fraternales de estudiantes, etcétera.	S9499.05.02	f
198	Extracción de cobre.	Extracción de cobre.	B0729.01.02	t
3029	 Difusión de la información, establecimiento y fiscalización del cumplimiento de normas profesionales, representación ante organismos públicos, relaciones públicas y negociaciones laborales de las asociaciones empresariales y de empleadores.	 Difusión de la información, establecimiento y fiscalización del cumplimiento de normas profesionales, representación ante organismos públicos, relaciones públicas y negociaciones laborales de las asociaciones empresariales y de empleadores.	S9411.00.03	f
3030	ACTIVIDADES DE CAMARAS DE COMERCIO, GREMIOS Y ORGANIZACIONES SIMILARES.	ACTIVIDADES DE CAMARAS DE COMERCIO, GREMIOS Y ORGANIZACIONES SIMILARES.	S9411.00.04	f
3031	Actividades de las organizaciones cuyos miembros están interesados principalmente en una disciplina científica, práctica profesional o esfera técnica concreta, como: colegios de médicos, abogados, contables, ingenieros, arquitectos, etcétera.	Actividades de las organizaciones cuyos miembros están interesados principalmente en una disciplina científica, práctica profesional o esfera técnica concreta, como: colegios de médicos, abogados, contables, ingenieros, arquitectos, etcétera.	S9412.00.01	f
3032	Actividades de asociaciones de especialistas en el campo científico, académico o cultural, como sociedades científicas, asociaciones de escritores, pintores, artistas de diversos tipos, periodistas, etcétera.	Actividades de asociaciones de especialistas en el campo científico, académico o cultural, como sociedades científicas, asociaciones de escritores, pintores, artistas de diversos tipos, periodistas, etcétera.	S9412.00.02	f
3033	Establecimiento y fiscalización del cumplimiento de normas profesionales.	Establecimiento y fiscalización del cumplimiento de normas profesionales.	S9412.00.03	f
3034	Difusión de información, representación ante organismos públicos y relaciones públicas de las asociaciones profesionales.	Difusión de información, representación ante organismos públicos y relaciones públicas de las asociaciones profesionales.	S9412.00.04	f
3035	Defensa de los intereses de los sindicatos y de sus afiliados; actividades de asociaciones cuyos afiliados son empleados interesados principalmente en dar a conocer sus opiniones sobre la situación laboral y salarial y en tomar medidas concertadas por conducto de su organización.	Defensa de los intereses de los sindicatos y de sus afiliados; actividades de asociaciones cuyos afiliados son empleados interesados principalmente en dar a conocer sus opiniones sobre la situación laboral y salarial y en tomar medidas concertadas por conducto de su organización.	S9420.00.01	f
3036	Actividades de sindicatos de empresas, sindicatos con filiales y organizaciones sindicales integradas por sindicatos afiliados y constituidas en función del oficio de sus miembros o en función de criterios geográficos, estructurales o de otra índole.	Actividades de sindicatos de empresas, sindicatos con filiales y organizaciones sindicales integradas por sindicatos afiliados y constituidas en función del oficio de sus miembros o en función de criterios geográficos, estructurales o de otra índole.	S9420.00.02	f
3037	Actividades de las organizaciones religiosas o de particulares que prestan servicios directamente a los fieles en iglesias, mezquitas, templos, sinagogas y otros lugares de culto y servicios religiosos de honras fúnebres.	Actividades de las organizaciones religiosas o de particulares que prestan servicios directamente a los fieles en iglesias, mezquitas, templos, sinagogas y otros lugares de culto y servicios religiosos de honras fúnebres.	S9491.01.01	f
3038	Actividades de monasterios y conventos, actividades de retiro religioso.	Actividades de monasterios y conventos, actividades de retiro religioso.	S9491.02.01	f
3039	Actividades de organizaciones políticas y organizaciones auxiliares: organizaciones juveniles vinculadas a un partido político, cuya finalidad es influir en los procesos de adopción de decisiones de los órganos públicos colocando en puestos políticos a miembros y simpatizantes del partido, y realizan actividades de información, relaciones públicas, recaudación de fondos, etcétera.	Actividades de organizaciones políticas y organizaciones auxiliares: organizaciones juveniles vinculadas a un partido político, cuya finalidad es influir en los procesos de adopción de decisiones de los órganos públicos colocando en puestos políticos a miembros y simpatizantes del partido, y realizan actividades de información, relaciones públicas, recaudación de fondos, etcétera.	S9492.00.01	f
3062	Reparación y mantenimiento de otro tipo de equipo de comunicaciones: equipo de transmisión de comunicaciones (por ejemplo, enrutadores, puentes, módems).	Reparación y mantenimiento de otro tipo de equipo de comunicaciones: equipo de transmisión de comunicaciones (por ejemplo, enrutadores, puentes, módems).	S9512.09.01	f
3040	Actividades de organizaciones no afiliadas directamente a un partido político que promueven una causa o cuestión pública mediante campañas de educación del público, influencia política, recaudación de fondos, etcétera; como iniciativas ciudadanas y movimientos de protesta.	Actividades de organizaciones no afiliadas directamente a un partido político que promueven una causa o cuestión pública mediante campañas de educación del público, influencia política, recaudación de fondos, etcétera; como iniciativas ciudadanas y movimientos de protesta.	S9499.01.01	f
3041	Actividades de movimientos ambientalistas o ecologista.	Actividades de movimientos ambientalistas o ecologista.	S9499.01.02	f
3042	Actividades de organizaciones de apoyo a servicios comunitarios y educativos n.c.p.	Actividades de organizaciones de apoyo a servicios comunitarios y educativos n.c.p.	S9499.01.03	f
3043	Actividades de organizaciones para la protección y del adelanto de grupos especiales; por ejemplo, grupos étnicos y minoritarios.	Actividades de organizaciones para la protección y del adelanto de grupos especiales; por ejemplo, grupos étnicos y minoritarios.	S9499.01.04	f
3044	Actividades de asociaciones con fines patrióticos, incluidas asociaciones de veteranos de guerra.	Actividades de asociaciones con fines patrióticos, incluidas asociaciones de veteranos de guerra.	S9499.01.05	f
3045	Actividades de asociaciones de consumidores.	Actividades de asociaciones de consumidores.	S9499.02.01	f
3046	Actividades de asociaciones de automovilistas.	Actividades de asociaciones de automovilistas.	S9499.03.01	f
3047	Actividades de asociaciones que facilitan el contacto con otras personas con intereses similares, como clubes rotarios, etcetera.	Actividades de asociaciones que facilitan el contacto con otras personas con intereses similares, como clubes rotarios, etcetera.	S9499.04.01	f
3048	Actividades de asociaciones que facilitan el contacto con otras personas con intereses similares, como logias masónicas, asociaciones cristianas o hebreas de jovenes.	Actividades de asociaciones que facilitan el contacto con otras personas con intereses similares, como logias masónicas, asociaciones cristianas o hebreas de jovenes.	S9499.04.02	f
3049	Actividades de asociaciones de jóvenes.	Actividades de asociaciones de jóvenes.	S9499.05.01	f
7	Cultivo de lenteja.	Cultivo de lenteja.	A0111.23.01	t
3051	Actividades de asociaciones que promueven actividades culturales o recreativas o reúnen a personas que comparten una afición (diferente de un deporte o juego), como clubes de poesía, literarios o de libros, clubes de historia.	Actividades de asociaciones que promueven actividades culturales o recreativas o reúnen a personas que comparten una afición (diferente de un deporte o juego), como clubes de poesía, literarios o de libros, clubes de historia.	S9499.05.03	f
3052	Actividades de asociaciones que promueven actividades culturales o recreativas o reúnen a personas que comparten una afición (diferente de un deporte o juego), como clubes de jardinería.	Actividades de asociaciones que promueven actividades culturales o recreativas o reúnen a personas que comparten una afición (diferente de un deporte o juego), como clubes de jardinería.	S9499.05.04	f
3053	Actividades de asociaciones que promueven actividades culturales o recreativas o reúnen a personas que comparten una afición (diferente de un deporte o juego) clubes de cine y fotografía.	Actividades de asociaciones que promueven actividades culturales o recreativas o reúnen a personas que comparten una afición (diferente de un deporte o juego) clubes de cine y fotografía.	S9499.05.05	f
3054	Actividades de asociaciones que promueven actividades culturales o recreativas o reúnen a personas que comparten una afición(diferente de un deporte o juego), clubes musicales y artísticos.	Actividades de asociaciones que promueven actividades culturales o recreativas o reúnen a personas que comparten una afición(diferente de un deporte o juego), clubes musicales y artísticos.	S9499.05.06	f
3055	Actividades de asociaciones que promueven actividades culturales o recreativas o reúnen a personas que comparten una afición (diferente de un deporte o juego), clubes de artesanía y de coleccionistas.	Actividades de asociaciones que promueven actividades culturales o recreativas o reúnen a personas que comparten una afición (diferente de un deporte o juego), clubes de artesanía y de coleccionistas.	S9499.05.07	f
3056	Actividades de asociaciones que promueven actividades culturales o recreativas o reúnen a personas que comparten una afición (diferente de un deporte o juego), clubes sociales, clubes de carnaval, etcétera.	Actividades de asociaciones que promueven actividades culturales o recreativas o reúnen a personas que comparten una afición (diferente de un deporte o juego), clubes sociales, clubes de carnaval, etcétera.	S9499.05.08	f
3057	Actividades de concesión de donaciones realizadas por asociaciones u otras organizaciones.	Actividades de concesión de donaciones realizadas por asociaciones u otras organizaciones.	S9499.06.01	f
3058	Reparación y mantenimiento de: computadoras de escritorio, computadoras portátiles, servidores informáticos, computadoras de mano (asistentes digitales personales), unidades de disco magnético, unidades de memoria USB y otros dispositivos de almacenamiento; unidades de disco óptico (CD-RW, CD-ROM, DVD-ROM, DVD-RW), módems internos y externos, impresoras, pantallas, teclados, ratones, palancas de mando y bolas rodantes, proyectores informáticos, escáneres, incluidos lectores de código de barras.	Reparación y mantenimiento de: computadoras de escritorio, computadoras portátiles, servidores informáticos, computadoras de mano (asistentes digitales personales), unidades de disco magnético, unidades de memoria USB y otros dispositivos de almacenamiento; unidades de disco óptico (CD-RW, CD-ROM, DVD-ROM, DVD-RW), módems internos y externos, impresoras, pantallas, teclados, ratones, palancas de mando y bolas rodantes, proyectores informáticos, escáneres, incluidos lectores de código de barras.	S9511.01.01	f
3059	Reparación y mantenimiento de otras terminales informáticas especializadas, lectores de tarjetas inteligentes, cascos de realidad virtual, terminales informáticas, como monederos automáticos y terminales de punto de venta no accionadas mecánicamente.	Reparación y mantenimiento de otras terminales informáticas especializadas, lectores de tarjetas inteligentes, cascos de realidad virtual, terminales informáticas, como monederos automáticos y terminales de punto de venta no accionadas mecánicamente.	S9511.09.01	f
3060	Reparación y mantenimiento de teléfonos inalámbricos, teléfonos celulares y aparatos de fax.	Reparación y mantenimiento de teléfonos inalámbricos, teléfonos celulares y aparatos de fax.	S9512.01.01	f
3061	Reparación y mantenimiento de emisores-receptores de radio, cámaras de televisión y de video de uso comercial.	Reparación y mantenimiento de emisores-receptores de radio, cámaras de televisión y de video de uso comercial.	S9512.02.01	f
3063	Reparación y mantenimiento de aparatos electrónicos de uso doméstico: aparatos de televisión y de radio, grabadoras de video (VCR), reproductores de CD y cámaras de video para uso familiar.	Reparación y mantenimiento de aparatos electrónicos de uso doméstico: aparatos de televisión y de radio, grabadoras de video (VCR), reproductores de CD y cámaras de video para uso familiar.	S9521.00.01	f
3064	Reparación y mantenimiento de aparatos de uso doméstico, como refrigeradores, cocinas, lavadoras, secadores de ropa, aparatos de aire acondicionado, etcétera.	Reparación y mantenimiento de aparatos de uso doméstico, como refrigeradores, cocinas, lavadoras, secadores de ropa, aparatos de aire acondicionado, etcétera.	S9522.01.01	f
3065	Reparación y mantenimiento de equipo doméstico y de jardinería, como segadoras de césped, bordeadores, soplantes para nieve y para hojas, cortasetos, etcétera.	Reparación y mantenimiento de equipo doméstico y de jardinería, como segadoras de césped, bordeadores, soplantes para nieve y para hojas, cortasetos, etcétera.	S9522.02.01	f
3066	Reparación y mantenimiento de calzado: zapatos, botas, etcétera.	Reparación y mantenimiento de calzado: zapatos, botas, etcétera.	S9523.01.01	f
3067	Reparación y mantenimiento de artículos de cuero, maletas y artículos similares.	Reparación y mantenimiento de artículos de cuero, maletas y artículos similares.	S9523.02.01	f
3068	Retapizado y restauración de muebles y accesorios domésticos, incluidos muebles de oficina.	Retapizado y restauración de muebles y accesorios domésticos, incluidos muebles de oficina.	S9524.01.01	f
3069	Restauración de muebles y accesorios domésticos, incluidos muebles de oficina.	Restauración de muebles y accesorios domésticos, incluidos muebles de oficina.	S9524.01.02	f
3070	Montaje de muebles no empotrados.	Montaje de muebles no empotrados.	S9524.02.01	f
3072	Reparación y arreglo de prendas de vestir.	Reparación y arreglo de prendas de vestir.	S9529.02.01	f
3073	Reparación y arreglo de joyas.	Reparación y arreglo de joyas.	S9529.03.01	f
3074	Reparación de relojes de pulsera y de pared y de sus partes, como cajas y bastidores de todos los materiales; mecanismos, cronómetros, etcétera.	Reparación de relojes de pulsera y de pared y de sus partes, como cajas y bastidores de todos los materiales; mecanismos, cronómetros, etcétera.	S9529.03.02	f
199	Extracción de plomo.	Extracción de plomo.	B0729.01.03	t
3075	Reparación de instrumentos musicales y afinación de pianos.	Reparación de instrumentos musicales y afinación de pianos.	S9529.04.01	f
3077	Reparación de libros, juguetes, artículos similares, etcétera.	Reparación de libros, juguetes, artículos similares, etcétera.	S9529.09.01	f
3078	Reparación de artículos deportivos (excepto armas deportivas).	Reparación de artículos deportivos (excepto armas deportivas).	S9529.09.02	f
3079	Lavado y limpieza en seco, planchado, etcétera, de todo tipo de prendas de vestir (incluso de piel) y de productos textiles que se realizan con equipo mecánico, a mano o en máquinas accionadas con monedas para el público en general o para clientes industriales o comerciales.	Lavado y limpieza en seco, planchado, etcétera, de todo tipo de prendas de vestir (incluso de piel) y de productos textiles que se realizan con equipo mecánico, a mano o en máquinas accionadas con monedas para el público en general o para clientes industriales o comerciales.	S9601.01.01	f
3080	Actividades de reparación y arreglos menores de prendas de vestir y otros artículos textiles, si se realizan en combinación con las de limpieza, recogida y entrega de ropa por las lavanderías.	Actividades de reparación y arreglos menores de prendas de vestir y otros artículos textiles, si se realizan en combinación con las de limpieza, recogida y entrega de ropa por las lavanderías.	S9601.01.02	f
3081	Lavado de alfombras y tapices con champú, se realicen o no en el local o la residencia del cliente.	Lavado de alfombras y tapices con champú, se realicen o no en el local o la residencia del cliente.	S9601.02.01	f
3082	Limpieza de cortinas y colgaduras, se realicen o no en el local o la residencia del cliente.	Limpieza de cortinas y colgaduras, se realicen o no en el local o la residencia del cliente.	S9601.02.02	f
3083	Suministro de ropa blanca, uniformes de trabajo y artículos similares por las lavanderías.	Suministro de ropa blanca, uniformes de trabajo y artículos similares por las lavanderías.	S9601.03.01	f
3085	Actividades de lavado y limpieza de prendas de tela o piel	Actividades de lavado y limpieza de prendas de tela o piel	S9601.04.01	f
3086	Actividades de lavado, corte, recorte, peinado, teñido, coloración, ondulación y alisado del cabello y otras actividades similares para hombres y mujeres.	Actividades de lavado, corte, recorte, peinado, teñido, coloración, ondulación y alisado del cabello y otras actividades similares para hombres y mujeres.	S9602.00.01	f
3087	Actividades de afeitado y recorte de la barba.	Actividades de afeitado y recorte de la barba.	S9602.00.02	f
3088	Actividades de masajes faciales, manicura y pedicura, tatuajes, maquillaje, etcétera.	Actividades de masajes faciales, manicura y pedicura, tatuajes, maquillaje, etcétera.	S9602.00.03	f
3089	Actividades de sepultura e incineración de cadáveres humanos o animales.	Actividades de sepultura e incineración de cadáveres humanos o animales.	S9603.01.01	f
3090	Prestación de servicios de inhumación y cremación, preparación de los despojos para su inhumación o cremación y servicios de embalsamiento y otros servicios de pompas fúnebres.	Prestación de servicios de inhumación y cremación, preparación de los despojos para su inhumación o cremación y servicios de embalsamiento y otros servicios de pompas fúnebres.	S9603.01.02	f
3091	Alquiler de locales especiales en funerarias.	Alquiler de locales especiales en funerarias.	S9603.01.03	f
3092	Actividades de alquiler y venta de tumbas.	Actividades de alquiler y venta de tumbas.	S9603.02.01	f
3093	Actividades de mantenimiento de tumbas y mausoleos.	Actividades de mantenimiento de tumbas y mausoleos.	S9603.02.02	f
3094	Actividades de baños turcos, saunas, baños de vapor y solarios.	Actividades de baños turcos, saunas, baños de vapor y solarios.	S9609.01.01	f
3095	 Actividades de centros de spa, salones de adelgazamiento, salones de masaje.	 Actividades de centros de spa, salones de adelgazamiento, salones de masaje.	S9609.01.02	f
3096	 Actividades de baños públicos.	 Actividades de baños públicos.	S9609.01.03	f
3097	Actividades de solarios  y balnearios.	Actividades de solarios  y balnearios.	S9609.01.04	f
3098	Actividades de astrología y espiritismo.	Actividades de astrología y espiritismo.	S9609.02.01	f
3100	Actividades de relación social, como las agencias que se encargan de la contratación de acompañantes o poner en contacto entre sí a personas que buscan compañía o amistad.	Actividades de relación social, como las agencias que se encargan de la contratación de acompañantes o poner en contacto entre sí a personas que buscan compañía o amistad.	S9609.04.01	f
3101	 Actividades de agencias matrimoniales.	 Actividades de agencias matrimoniales.	S9609.04.02	f
3102	Actividades de servicios para animales domésticos, como las residencias y peluquerías para animales.	Actividades de servicios para animales domésticos, como las residencias y peluquerías para animales.	S9609.05.01	f
3103	Actividades de servicios para animales domésticos, como paseo y adiestramiento de animales.	Actividades de servicios para animales domésticos, como paseo y adiestramiento de animales.	S9609.05.02	f
3104	Actividades de organizaciones genealógicas.	Actividades de organizaciones genealógicas.	S9609.06.01	f
3105	Actividades de limpiabotas (betuneros).	Actividades de limpiabotas (betuneros).	S9609.07.01	f
3106	Actividades de porteadores de maletas.	Actividades de porteadores de maletas.	S9609.07.02	f
3107	Actividades de personas encargadas de estacionar vehículos entre otras.	Actividades de personas encargadas de estacionar vehículos entre otras.	S9609.07.03	f
3108	Actividades de asistentes de compras.	Actividades de asistentes de compras.	S9609.07.04	f
3109	Actividades de servicios diversos.	Actividades de servicios diversos.	S9609.07.05	f
3110	Explotación de máquinas de servicios personales accionadas con monedas (fotomatones, básculas, aparatos para tomar la tensión, taquillas accionadas con monedas, etcétera).	Explotación de máquinas de servicios personales accionadas con monedas (fotomatones, básculas, aparatos para tomar la tensión, taquillas accionadas con monedas, etcétera).	S9609.08.01	f
10	Cultivo de semillas de maní.	Cultivo de semillas de maní.	A0111.32.01	t
17	Cultivo de sandías.	Cultivo de sandías.	A0113.22.01	t
18	Cultivo de melones.	Cultivo de melones.	A0113.22.02	t
24	Cultivo de papa.	Cultivo de papa.	A0113.41.01	t
25	Cultivo de yuca.	Cultivo de yuca.	A0113.42.02	t
27	Cultivo de hongos champiñones	Cultivo de hongos champiñones	A0113.91.01	t
28	Cultivo de trufas.	Cultivo de trufas.	A0113.91.02	t
3111	Actividades de los hogares como empleadores de personal doméstico, como sirvientes, cocineros, camareros, ayudantes de cámara, mayordomos, institutrices, niñeras. El personal doméstico empleado puede así declarar la actividad de su empleador en los censos o estudios, aunque el empleador sea un particular. El producto resultante de esa actividad es consumido por el propio hogar empleador.	Actividades de los hogares como empleadores de personal doméstico, como sirvientes, cocineros, camareros, ayudantes de cámara, mayordomos, institutrices, niñeras. El personal doméstico empleado puede así declarar la actividad de su empleador en los censos o estudios, aunque el empleador sea un particular. El producto resultante de esa actividad es consumido por el propio hogar empleador.	T9700.00.01	f
3112	Actividades de los hogares como empleadores de personal doméstico, como lavanderos, jardineros, porteros, mozos de cuadra, conductores, conserjes,  preceptores, secretarios, etcétera. El personal doméstico empleado puede así declarar la actividad de su empleador en los censos o estudios, aunque el empleador sea un particular. El producto resultante de esa actividad es consumido por el propio hogar empleador.	Actividades de los hogares como empleadores de personal doméstico, como lavanderos, jardineros, porteros, mozos de cuadra, conductores, conserjes,  preceptores, secretarios, etcétera. El personal doméstico empleado puede así declarar la actividad de su empleador en los censos o estudios, aunque el empleador sea un particular. El producto resultante de esa actividad es consumido por el propio hogar empleador.	T9700.00.02	f
3113	Actividades no diferenciadas de hogares como productores de bienes de subsistencia, es decir, las actividades de los hogares que producen diversos bienes para su propia subsistencia. Esas actividades comprenden la caza y la recolección, la agricultura, la construcción de viviendas y la confección de prendas de vestir y otros bienes producidos por los hogares para su propia subsistencia. Si los hogares se dedican a la producción de bienes para el mercado, se clasifican en la rama de producción correspondiente a esos bienes. Si se dedican principalmente a la producción de bienes de subsistencia específicos, se clasifican en la rama de producción correspondiente a esos bienes.	Actividades no diferenciadas de hogares como productores de bienes de subsistencia, es decir, las actividades de los hogares que producen diversos bienes para su propia subsistencia. Esas actividades comprenden la caza y la recolección, la agricultura, la construcción de viviendas y la confección de prendas de vestir y otros bienes producidos por los hogares para su propia subsistencia. Si los hogares se dedican a la producción de bienes para el mercado, se clasifican en la rama de producción correspondiente a esos bienes. Si se dedican principalmente a la producción de bienes de subsistencia específicos, se clasifican en la rama de producción correspondiente a esos bienes.	T9810.00.01	f
3114	Actividades no diferenciadas de hogares como productores de servicios se subsistencia, es decir, actividades de los hogares que producen diversos servicios para su propia subsistencia. Esas actividades comprenden la cocina, la enseñanza, el cuidado de los miembros de la familia y otros servicios producidos por los hogares para su propia subsistencia. Si los hogares también se dedican a la producción de diversos bienes para su propia subsistencia, se clasifican en las actividades no diferenciadas de hogares como productores de bienes para uso propio.	Actividades no diferenciadas de hogares como productores de servicios se subsistencia, es decir, actividades de los hogares que producen diversos servicios para su propia subsistencia. Esas actividades comprenden la cocina, la enseñanza, el cuidado de los miembros de la familia y otros servicios producidos por los hogares para su propia subsistencia. Si los hogares también se dedican a la producción de diversos bienes para su propia subsistencia, se clasifican en las actividades no diferenciadas de hogares como productores de bienes para uso propio.	T9820.00.01	f
3115	Actividades de organizaciones internacionales, como las Naciones Unidas y los organismos especializados del sistema de las Naciones Unidas, órganos regionales, etcétera.	Actividades de organizaciones internacionales, como las Naciones Unidas y los organismos especializados del sistema de las Naciones Unidas, órganos regionales, etcétera.	U9900.01.01	f
3116	Actividades de organizaciones internacionales, como el Fondo Monetario Internacional.	Actividades de organizaciones internacionales, como el Fondo Monetario Internacional.	U9900.01.02	f
3117	Actividades de organizaciones internacionales, como la Organización de Cooperación y Desarrollo Económicos.	Actividades de organizaciones internacionales, como la Organización de Cooperación y Desarrollo Económicos.	U9900.01.03	f
3118	Actividades de organizaciones internacionales, como la Organización de Países Exportadores de Petróleo	Actividades de organizaciones internacionales, como la Organización de Países Exportadores de Petróleo	U9900.01.04	f
3119	Actividades de organizaciones internacionales, como las Comunidades Europeas y Banco Mundial.	Actividades de organizaciones internacionales, como las Comunidades Europeas y Banco Mundial.	U9900.01.05	f
3121	Actividades de organizaciones internacionales, como la Organización de los Estados Americanos.	Actividades de organizaciones internacionales, como la Organización de los Estados Americanos.	U9900.01.07	f
3122	Actividades de misiones diplomáticas y consulares cuando están determinadas por el país en el que se encuentran y no del país que representan.	Actividades de misiones diplomáticas y consulares cuando están determinadas por el país en el que se encuentran y no del país que representan.	U9900.02.01	f
3123	ACTIVIDADES LABORALES REALIZADAS BAJO RELACION DE DEPENDENCIA EN EL SECTOR PRIVADO	ACTIVIDADES LABORALES REALIZADAS BAJO RELACION DE DEPENDENCIA EN EL SECTOR PRIVADO	R2000.00.01	f
3124	ACTIVIDADES LABORALES REALIZADAS BAJO RELACION DE DEPENDENCIA EN EL SECTOR PUBLICO	ACTIVIDADES LABORALES REALIZADAS BAJO RELACION DE DEPENDENCIA EN EL SECTOR PUBLICO	S2500.00.01	f
398	Elaboración de pizza.	Elaboración de pizza.	C1071.09.02	t
1111	Otras fundiciones de hierro.	Otras fundiciones de hierro.	C2431.01.02	t
1807	Fabricación de botones.	Fabricación de botones.	C3290.21.01	t
2474	Edición de partituras.	Edición de partituras.	J5920.05.02	t
2513	Servicios de aplicaciones.	Servicios de aplicaciones.	J6311.03.01	t
2813	Administración de aduanas.	Administración de aduanas.	O8411.03.01	t
46	Cultivo de mangos.	Cultivo de mangos.	A0122.02.01	t
47	Cultivo de maracuyá.	Cultivo de maracuyá.	A0122.03.01	t
48	Cultivo de piñas.	Cultivo de piñas.	A0122.04.01	t
1	Cultivo de trigo.	Cultivo de trigo.	A0111.11.01	t
2	Cultivo de maíz.	Cultivo de maíz.	A0111.12.01	t
3	Cultivo de quinua.	Cultivo de quinua.	A0111.13.01	t
5	Cultivo de fréjol.	Cultivo de fréjol.	A0111.21.01	t
6	Cultivo de arveja.	Cultivo de arveja.	A0111.22.01	t
3126	HEREDEROS	HEREDEROS	V0300.00.02	t
233	Extracción de tierras raras.	Extracción de tierras raras.	B0891.07.01	t
234	Extracción de turba.	Extracción de turba.	B0892.00.01	t
243	Extracción de cuarzo.	Extracción de cuarzo.	B0899.02.03	t
248	Extracción de feldespatos.	Extracción de feldespatos.	B0899.03.03	t
251	Extracción de asbesto.	Extracción de asbesto.	B0899.09.03	t
328	Elaboración de margarinas.	Elaboración de margarinas.	C1040.14.02	t
346	Elaboración de mantequilla.	Elaboración de mantequilla.	C1050.04.01	t
348	Elaboración de suero.	Elaboración de suero.	C1050.04.03	t
381	Elaboración de glucosa.	Elaboración de glucosa.	C1062.03.01	t
402	Producción de panela.	Producción de panela.	C1072.01.02	t
420	Elaboración de chocolate.	Elaboración de chocolate.	C1073.12.01	t
426	Elaboración de turrón, etc.	Elaboración de turrón, etc.	C1073.21.05	t
436	Elaboración de alcuzcuz.	Elaboración de alcuzcuz.	C1074.01.03	t
452	Elaboración de té empacado.	Elaboración de té empacado.	C1079.13.02	t
465	Elaboración de vinagre.	Elaboración de vinagre.	C1079.33.01	t
501	Elaboración de malta.	Elaboración de malta.	C1103.02.01	t
470	Elaboración de levadura.	Elaboración de levadura.	C1079.91.01	t
494	Elaboración de hielo y nieve.	Elaboración de hielo y nieve.	C1101.05.01	t
855	Fabricación de fungicidas.	Fabricación de fungicidas.	C2021.01.03	t
721	Fabricación de papel a mano.	Fabricación de papel a mano.	C1701.09.03	t
856	Fabricación de herbicidas.	Fabricación de herbicidas.	C2021.01.04	t
779	Aglomeración de coque.	Aglomeración de coque.	C1910.02.01	t
853	Fabricación de insecticidas.	Fabricación de insecticidas.	C2021.01.01	t
854	Fabricación de raticidas.	Fabricación de raticidas.	C2021.01.02	t
883	Fabricación de cosméticos.	Fabricación de cosméticos.	C2023.31.02	t
983	Fabricación de vidrio colado.	Fabricación de vidrio colado.	C2310.11.01	t
987	Fabricación de vidrio plano.	Fabricación de vidrio plano.	C2310.11.05	t
1100	Producción de oro amonedado.	Producción de oro amonedado.	C2420.14.01	t
1113	Otras fundiciones de acero.	Otras fundiciones de acero.	C2431.02.02	t
1228	Fabricación de emisores ijos.	Fabricación de emisores ijos.	C2640.07.01	t
1243	Fabricación de sismómetros.	Fabricación de sismómetros.	C2651.13.05	t
1249	Fabricación de hidrómetros.	Fabricación de hidrómetros.	C2651.17.01	t
1250	Fabricación de termómetros.	Fabricación de termómetros.	C2651.17.02	t
1251	Fabricación de barómetros.	Fabricación de barómetros.	C2651.17.03	t
1253	Fabricación de taxímetros.	Fabricación de taxímetros.	C2651.17.05	t
1254	Fabricación de podómetros.	Fabricación de podómetros.	C2651.17.06	t
1255	Fabricación de tacómetros.	Fabricación de tacómetros.	C2651.17.07	t
1393	Fabricación de electroimanes.	Fabricación de electroimanes.	C2790.92.01	t
1438	Fabricación de montacargas.	Fabricación de montacargas.	C2816.01.11	t
1439	Fabricación de ascensores.	Fabricación de ascensores.	C2816.02.01	t
1814	Fabricación de pipas.	Fabricación de pipas.	C3290.24.01	t
1655	Construcción de pesqueros.	Construcción de pesqueros.	C3011.03.01	t
1697	Fabricación de motocicletas.	Fabricación de motocicletas.	C3091.01.01	t
1755	Fabricación de raquetas.	Fabricación de raquetas.	C3230.01.06	t
1816	Fabricación de pelucas.	Fabricación de pelucas.	C3290.24.03	t
2174	Venta al por mayor de abonos.	Venta al por mayor de abonos.	G4669.12.01	t
1932	Construcción de túneles.	Construcción de túneles.	F4210.31.01	t
1936	Perforación de pozos de agua.	Perforación de pozos de agua.	F4220.12.02	t
1966	Instalación de papel tapiz.	Instalación de papel tapiz.	F4330.32.01	t
1997	Subasta de automóviles.	Subasta de automóviles.	G4510.02.01	t
2025	Venta al por mayor de flores.	Venta al por mayor de flores.	G4620.15.01	t
2032	Venta al por mayor de frutas.	Venta al por mayor de frutas.	G4630.12.01	t
2037	Venta al por mayor de café.	Venta al por mayor de café.	G4630.14.01	t
2038	Venta al por mayor de cacao.	Venta al por mayor de cacao.	G4630.14.02	t
2039	Venta al por mayor de té.	Venta al por mayor de té.	G4630.14.03	t
2043	Venta al por mayor de huevos.	Venta al por mayor de huevos.	G4630.22.01	t
2052	Venta al por mayor de arroz.	Venta al por mayor de arroz.	G4630.91.01	t
2053	Venta al por mayor de azúcar.	Venta al por mayor de azúcar.	G4630.92.01	t
2119	Venta al por mayor de juegos.	Venta al por mayor de juegos.	G4649.99.01	t
2100	Venta al por mayor de libros.	Venta al por mayor de libros.	G4649.93.02	t
2116	Venta al por mayor de joyas.	Venta al por mayor de joyas.	G4649.97.02	t
2201	Venta al por menor de pan.	Venta al por menor de pan.	G4721.05.02	t
2330	Servicios de taxis.	Servicios de taxis.	H4922.02.01	t
2436	Publicación de libros.	Publicación de libros.	J5811.01.01	t
2480	Servicio de telefonía fija.	Servicio de telefonía fija.	J6110.01.02	t
2723	Alquiler de joyas.	Alquiler de joyas.	N7729.03.01	t
2663	Decoracion de escaparates.	Decoracion de escaparates.	M7310.02.02	t
2665	Publicidad aerea.	Publicidad aerea.	M7310.02.04	t
2689	Promociones comerciales.	Promociones comerciales.	M7490.16.01	t
2747	Alquiler de contenedores.	Alquiler de contenedores.	N7730.32.01	t
2710	Alquiler de bicicletas.	Alquiler de bicicletas.	N7721.02.01	t
2712	Alquiler de esquís.	Alquiler de esquís.	N7721.04.01	t
2718	Alquiler de muebles.	Alquiler de muebles.	N7729.02.01	t
2748	Alquiler de paletas.	Alquiler de paletas.	N7730.33.01	t
2999	Venta de boletos de lotería.	Venta de boletos de lotería.	R9200.01.01	t
2893	Enseñanza de gimnasia, yoga.	Enseñanza de gimnasia, yoga.	P8541.02.01	t
2895	Enseñanza de natación.	Enseñanza de natación.	P8541.04.01	t
2896	Enseñanza de artes marciales.	Enseñanza de artes marciales.	P8541.05.01	t
3071	Reparación de bicicletas.	Reparación de bicicletas.	S9529.01.01	t
\.


--
-- TOC entry 2490 (class 0 OID 0)
-- Dependencies: 216
-- Name: tipo_empresa_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tipo_empresa_id_seq', 3126, true);


--
-- TOC entry 2203 (class 2606 OID 40894)
-- Name: apartado pk_apartado; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY apartado
    ADD CONSTRAINT pk_apartado PRIMARY KEY (id);


--
-- TOC entry 2206 (class 2606 OID 40903)
-- Name: apartado_pregunta pk_apartado_pregunta; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY apartado_pregunta
    ADD CONSTRAINT pk_apartado_pregunta PRIMARY KEY (id);


--
-- TOC entry 2214 (class 2606 OID 40918)
-- Name: ciudad pk_ciudad; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ciudad
    ADD CONSTRAINT pk_ciudad PRIMARY KEY (id);


--
-- TOC entry 2218 (class 2606 OID 40926)
-- Name: datos_examen pk_datos_examen; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY datos_examen
    ADD CONSTRAINT pk_datos_examen PRIMARY KEY (apartado_pregunta, examen);


--
-- TOC entry 2222 (class 2606 OID 40937)
-- Name: detalle_examen pk_detalle_examen; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY detalle_examen
    ADD CONSTRAINT pk_detalle_examen PRIMARY KEY (id);


--
-- TOC entry 2229 (class 2606 OID 40951)
-- Name: empresa pk_empresa; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY empresa
    ADD CONSTRAINT pk_empresa PRIMARY KEY (id);


--
-- TOC entry 2234 (class 2606 OID 40965)
-- Name: examen pk_examen; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY examen
    ADD CONSTRAINT pk_examen PRIMARY KEY (id);


--
-- TOC entry 2237 (class 2606 OID 40979)
-- Name: formulario pk_formulario; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY formulario
    ADD CONSTRAINT pk_formulario PRIMARY KEY (id);


--
-- TOC entry 2240 (class 2606 OID 40988)
-- Name: formulario_apartado pk_formulario_apartado; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY formulario_apartado
    ADD CONSTRAINT pk_formulario_apartado PRIMARY KEY (id);


--
-- TOC entry 2245 (class 2606 OID 41002)
-- Name: grupo_respuesta pk_grupo_respuesta; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY grupo_respuesta
    ADD CONSTRAINT pk_grupo_respuesta PRIMARY KEY (id);


--
-- TOC entry 2248 (class 2606 OID 41014)
-- Name: pais pk_pais; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pais
    ADD CONSTRAINT pk_pais PRIMARY KEY (id);


--
-- TOC entry 2250 (class 2606 OID 41026)
-- Name: pregunta pk_pregunta; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pregunta
    ADD CONSTRAINT pk_pregunta PRIMARY KEY (id);


--
-- TOC entry 2255 (class 2606 OID 41039)
-- Name: provincia pk_provincia; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY provincia
    ADD CONSTRAINT pk_provincia PRIMARY KEY (id);


--
-- TOC entry 2259 (class 2606 OID 41052)
-- Name: recomendacion pk_recomendacion; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY recomendacion
    ADD CONSTRAINT pk_recomendacion PRIMARY KEY (id);


--
-- TOC entry 2262 (class 2606 OID 41062)
-- Name: recomendacion_examen pk_recomendacion_examen; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY recomendacion_examen
    ADD CONSTRAINT pk_recomendacion_examen PRIMARY KEY (id);


--
-- TOC entry 2267 (class 2606 OID 41076)
-- Name: respuesta pk_respuesta; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY respuesta
    ADD CONSTRAINT pk_respuesta PRIMARY KEY (id);


--
-- TOC entry 2271 (class 2606 OID 41089)
-- Name: tipo_empresa pk_tipo_empresa; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tipo_empresa
    ADD CONSTRAINT pk_tipo_empresa PRIMARY KEY (id);


--
-- TOC entry 2238 (class 1259 OID 40989)
-- Name: apara_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX apara_pk ON formulario_apartado USING btree (id);


--
-- TOC entry 2201 (class 1259 OID 40895)
-- Name: apartado_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX apartado_pk ON apartado USING btree (id);


--
-- TOC entry 2204 (class 1259 OID 40904)
-- Name: apartado_pregunta_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX apartado_pregunta_pk ON apartado_pregunta USING btree (id);


--
-- TOC entry 2210 (class 1259 OID 40919)
-- Name: ciudad_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ciudad_pk ON ciudad USING btree (id);


--
-- TOC entry 2215 (class 1259 OID 40927)
-- Name: datos_examen_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX datos_examen_pk ON datos_examen USING btree (apartado_pregunta, examen);


--
-- TOC entry 2220 (class 1259 OID 40938)
-- Name: detalle_examen_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX detalle_examen_pk ON detalle_examen USING btree (id);


--
-- TOC entry 2225 (class 1259 OID 40952)
-- Name: empresa_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX empresa_pk ON empresa USING btree (id);


--
-- TOC entry 2230 (class 1259 OID 40966)
-- Name: examen_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX examen_pk ON examen USING btree (id);


--
-- TOC entry 2226 (class 1259 OID 40953)
-- Name: fk_ciu_emp_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fk_ciu_emp_fk ON empresa USING btree (ciudad);


--
-- TOC entry 2231 (class 1259 OID 40967)
-- Name: fk_empresa_examen_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fk_empresa_examen_fk ON examen USING btree (empresa);


--
-- TOC entry 2216 (class 1259 OID 40928)
-- Name: fk_exa_datexam_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fk_exa_datexam_fk ON datos_examen USING btree (examen);


--
-- TOC entry 2232 (class 1259 OID 40968)
-- Name: fk_form_examen_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fk_form_examen_fk ON examen USING btree (formulario);


--
-- TOC entry 2257 (class 1259 OID 41054)
-- Name: fk_form_recomendacion_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fk_form_recomendacion_fk ON recomendacion USING btree (formulario);


--
-- TOC entry 2211 (class 1259 OID 40920)
-- Name: fk_pai_ciu_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fk_pai_ciu_fk ON ciudad USING btree (pais);


--
-- TOC entry 2253 (class 1259 OID 41041)
-- Name: fk_pais_prov_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fk_pais_prov_fk ON provincia USING btree (pais);


--
-- TOC entry 2212 (class 1259 OID 40921)
-- Name: fk_pro_ciud_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fk_pro_ciud_fk ON ciudad USING btree (provincia);


--
-- TOC entry 2227 (class 1259 OID 40954)
-- Name: fk_tip_empresa_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fk_tip_empresa_fk ON empresa USING btree (tipo_empresa);


--
-- TOC entry 2235 (class 1259 OID 40980)
-- Name: formulario_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX formulario_pk ON formulario USING btree (id);


--
-- TOC entry 2243 (class 1259 OID 41003)
-- Name: grupo_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX grupo_pk ON grupo_respuesta USING btree (id);


--
-- TOC entry 2246 (class 1259 OID 41015)
-- Name: pais_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX pais_pk ON pais USING btree (id);


--
-- TOC entry 2251 (class 1259 OID 41027)
-- Name: pregunta_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX pregunta_pk ON pregunta USING btree (id);


--
-- TOC entry 2256 (class 1259 OID 41040)
-- Name: provincia_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX provincia_pk ON provincia USING btree (id);


--
-- TOC entry 2263 (class 1259 OID 41063)
-- Name: recomendacion_examen_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX recomendacion_examen_pk ON recomendacion_examen USING btree (id);


--
-- TOC entry 2260 (class 1259 OID 41053)
-- Name: recomendacion_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX recomendacion_pk ON recomendacion USING btree (id);


--
-- TOC entry 2268 (class 1259 OID 41078)
-- Name: relationship_12_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX relationship_12_fk ON respuesta USING btree (grupo);


--
-- TOC entry 2241 (class 1259 OID 40990)
-- Name: relationship_13_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX relationship_13_fk ON formulario_apartado USING btree (formulario);


--
-- TOC entry 2242 (class 1259 OID 40991)
-- Name: relationship_14_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX relationship_14_fk ON formulario_apartado USING btree (apartado);


--
-- TOC entry 2207 (class 1259 OID 40905)
-- Name: relationship_15_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX relationship_15_fk ON apartado_pregunta USING btree (apartado);


--
-- TOC entry 2208 (class 1259 OID 40906)
-- Name: relationship_18_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX relationship_18_fk ON apartado_pregunta USING btree (pregunta);


--
-- TOC entry 2209 (class 1259 OID 40907)
-- Name: relationship_19_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX relationship_19_fk ON apartado_pregunta USING btree (respuesta);


--
-- TOC entry 2264 (class 1259 OID 41064)
-- Name: relationship_21_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX relationship_21_fk ON recomendacion_examen USING btree (recomendacion);


--
-- TOC entry 2265 (class 1259 OID 41065)
-- Name: relationship_22_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX relationship_22_fk ON recomendacion_examen USING btree (examen);


--
-- TOC entry 2219 (class 1259 OID 40929)
-- Name: relationship_24_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX relationship_24_fk ON datos_examen USING btree (apartado_pregunta);


--
-- TOC entry 2223 (class 1259 OID 40939)
-- Name: relationship_26_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX relationship_26_fk ON detalle_examen USING btree (formulario_apartado);


--
-- TOC entry 2224 (class 1259 OID 40940)
-- Name: relationship_27_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX relationship_27_fk ON detalle_examen USING btree (examen);


--
-- TOC entry 2252 (class 1259 OID 41028)
-- Name: relationship_28_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX relationship_28_fk ON pregunta USING btree (grupo_respuesta);


--
-- TOC entry 2269 (class 1259 OID 41077)
-- Name: respuesta_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX respuesta_pk ON respuesta USING btree (id);


--
-- TOC entry 2272 (class 1259 OID 41090)
-- Name: tipo_empresa_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX tipo_empresa_pk ON tipo_empresa USING btree (id);


--
-- TOC entry 2273 (class 2606 OID 41091)
-- Name: apartado_pregunta fk_apartado_relations_formular; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY apartado_pregunta
    ADD CONSTRAINT fk_apartado_relations_formular FOREIGN KEY (apartado) REFERENCES formulario_apartado(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2274 (class 2606 OID 41096)
-- Name: apartado_pregunta fk_apartado_relations_pregunta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY apartado_pregunta
    ADD CONSTRAINT fk_apartado_relations_pregunta FOREIGN KEY (pregunta) REFERENCES pregunta(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2275 (class 2606 OID 41101)
-- Name: apartado_pregunta fk_apartado_relations_respuest; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY apartado_pregunta
    ADD CONSTRAINT fk_apartado_relations_respuest FOREIGN KEY (respuesta) REFERENCES respuesta(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2276 (class 2606 OID 41106)
-- Name: ciudad fk_ciudad_fk_pai_ci_pais; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ciudad
    ADD CONSTRAINT fk_ciudad_fk_pai_ci_pais FOREIGN KEY (pais) REFERENCES pais(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2277 (class 2606 OID 41111)
-- Name: ciudad fk_ciudad_fk_pro_ci_provinci; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ciudad
    ADD CONSTRAINT fk_ciudad_fk_pro_ci_provinci FOREIGN KEY (provincia) REFERENCES provincia(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2279 (class 2606 OID 41121)
-- Name: datos_examen fk_datos_ex_relations_apartado; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY datos_examen
    ADD CONSTRAINT fk_datos_ex_relations_apartado FOREIGN KEY (apartado_pregunta) REFERENCES apartado_pregunta(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2278 (class 2606 OID 41116)
-- Name: datos_examen fk_datos_ex_relations_examen; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY datos_examen
    ADD CONSTRAINT fk_datos_ex_relations_examen FOREIGN KEY (examen) REFERENCES examen(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2280 (class 2606 OID 41126)
-- Name: datos_examen fk_datos_ex_relations_respuest; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY datos_examen
    ADD CONSTRAINT fk_datos_ex_relations_respuest FOREIGN KEY (respuesta) REFERENCES respuesta(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2282 (class 2606 OID 41136)
-- Name: detalle_examen fk_detalle__relations_examen; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY detalle_examen
    ADD CONSTRAINT fk_detalle__relations_examen FOREIGN KEY (examen) REFERENCES examen(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2281 (class 2606 OID 41131)
-- Name: detalle_examen fk_detalle__relations_formular; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY detalle_examen
    ADD CONSTRAINT fk_detalle__relations_formular FOREIGN KEY (formulario_apartado) REFERENCES formulario_apartado(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2283 (class 2606 OID 41141)
-- Name: empresa fk_empresa_fk_ciu_em_ciudad; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY empresa
    ADD CONSTRAINT fk_empresa_fk_ciu_em_ciudad FOREIGN KEY (ciudad) REFERENCES ciudad(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2284 (class 2606 OID 41146)
-- Name: empresa fk_empresa_fk_tip_em_tipo_emp; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY empresa
    ADD CONSTRAINT fk_empresa_fk_tip_em_tipo_emp FOREIGN KEY (tipo_empresa) REFERENCES tipo_empresa(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2285 (class 2606 OID 41151)
-- Name: examen fk_examen_fk_empres_empresa; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY examen
    ADD CONSTRAINT fk_examen_fk_empres_empresa FOREIGN KEY (empresa) REFERENCES empresa(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2286 (class 2606 OID 41156)
-- Name: examen fk_examen_fk_frm_ex_formular; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY examen
    ADD CONSTRAINT fk_examen_fk_frm_ex_formular FOREIGN KEY (formulario) REFERENCES formulario(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2289 (class 2606 OID 41166)
-- Name: formulario_apartado fk_formular_relations_apartado; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY formulario_apartado
    ADD CONSTRAINT fk_formular_relations_apartado FOREIGN KEY (apartado) REFERENCES apartado(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2288 (class 2606 OID 41161)
-- Name: formulario_apartado fk_formular_relations_formular; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY formulario_apartado
    ADD CONSTRAINT fk_formular_relations_formular FOREIGN KEY (formulario) REFERENCES formulario(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2287 (class 2606 OID 41201)
-- Name: formulario fk_frm_frmant; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY formulario
    ADD CONSTRAINT fk_frm_frmant FOREIGN KEY (anterior) REFERENCES formulario(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2290 (class 2606 OID 41171)
-- Name: pregunta fk_pregunta_relations_grupo_re; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pregunta
    ADD CONSTRAINT fk_pregunta_relations_grupo_re FOREIGN KEY (grupo_respuesta) REFERENCES grupo_respuesta(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2291 (class 2606 OID 41176)
-- Name: provincia fk_provinci_fk_pais_p_pais; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY provincia
    ADD CONSTRAINT fk_provinci_fk_pais_p_pais FOREIGN KEY (pais) REFERENCES pais(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2292 (class 2606 OID 41181)
-- Name: recomendacion fk_recomend_fk_frm_re_formular; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY recomendacion
    ADD CONSTRAINT fk_recomend_fk_frm_re_formular FOREIGN KEY (formulario) REFERENCES formulario(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2294 (class 2606 OID 41191)
-- Name: recomendacion_examen fk_recomend_relations_examen; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY recomendacion_examen
    ADD CONSTRAINT fk_recomend_relations_examen FOREIGN KEY (examen) REFERENCES examen(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2293 (class 2606 OID 41186)
-- Name: recomendacion_examen fk_recomend_relations_recomend; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY recomendacion_examen
    ADD CONSTRAINT fk_recomend_relations_recomend FOREIGN KEY (recomendacion) REFERENCES recomendacion(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2295 (class 2606 OID 41196)
-- Name: respuesta fk_respuest_relations_grupo_re; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY respuesta
    ADD CONSTRAINT fk_respuest_relations_grupo_re FOREIGN KEY (grupo) REFERENCES grupo_respuesta(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


-- Completed on 2017-05-29 00:10:23 ECT

--
-- PostgreSQL database dump complete
--


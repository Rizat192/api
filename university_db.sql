--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2
-- Dumped by pg_dump version 17.1

-- Started on 2025-02-09 22:34:29

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
-- TOC entry 218 (class 1259 OID 16691)
-- Name: course; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.course (
    id bigint NOT NULL,
    name character varying(255),
    professor_id bigint
);


ALTER TABLE public.course OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16690)
-- Name: course_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.course_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.course_id_seq OWNER TO postgres;

--
-- TOC entry 4880 (class 0 OID 0)
-- Dependencies: 217
-- Name: course_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.course_id_seq OWNED BY public.course.id;


--
-- TOC entry 220 (class 1259 OID 16698)
-- Name: professor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.professor (
    id bigint NOT NULL,
    department character varying(255),
    name character varying(255)
);


ALTER TABLE public.professor OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16697)
-- Name: professor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.professor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.professor_id_seq OWNER TO postgres;

--
-- TOC entry 4881 (class 0 OID 0)
-- Dependencies: 219
-- Name: professor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.professor_id_seq OWNED BY public.professor.id;


--
-- TOC entry 222 (class 1259 OID 16707)
-- Name: university; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.university (
    id bigint NOT NULL,
    location character varying(255),
    name character varying(255)
);


ALTER TABLE public.university OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16706)
-- Name: university_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.university_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.university_id_seq OWNER TO postgres;

--
-- TOC entry 4882 (class 0 OID 0)
-- Dependencies: 221
-- Name: university_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.university_id_seq OWNED BY public.university.id;


--
-- TOC entry 223 (class 1259 OID 16715)
-- Name: university_professors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.university_professors (
    university_id bigint NOT NULL,
    professors_id bigint NOT NULL
);


ALTER TABLE public.university_professors OWNER TO postgres;

--
-- TOC entry 4709 (class 2604 OID 16694)
-- Name: course id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course ALTER COLUMN id SET DEFAULT nextval('public.course_id_seq'::regclass);


--
-- TOC entry 4710 (class 2604 OID 16701)
-- Name: professor id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.professor ALTER COLUMN id SET DEFAULT nextval('public.professor_id_seq'::regclass);


--
-- TOC entry 4711 (class 2604 OID 16710)
-- Name: university id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.university ALTER COLUMN id SET DEFAULT nextval('public.university_id_seq'::regclass);


--
-- TOC entry 4869 (class 0 OID 16691)
-- Dependencies: 218
-- Data for Name: course; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.course (id, name, professor_id) FROM stdin;
\.


--
-- TOC entry 4871 (class 0 OID 16698)
-- Dependencies: 220
-- Data for Name: professor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.professor (id, department, name) FROM stdin;
\.


--
-- TOC entry 4873 (class 0 OID 16707)
-- Dependencies: 222
-- Data for Name: university; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.university (id, location, name) FROM stdin;
\.


--
-- TOC entry 4874 (class 0 OID 16715)
-- Dependencies: 223
-- Data for Name: university_professors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.university_professors (university_id, professors_id) FROM stdin;
\.


--
-- TOC entry 4883 (class 0 OID 0)
-- Dependencies: 217
-- Name: course_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.course_id_seq', 1, false);


--
-- TOC entry 4884 (class 0 OID 0)
-- Dependencies: 219
-- Name: professor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.professor_id_seq', 1, false);


--
-- TOC entry 4885 (class 0 OID 0)
-- Dependencies: 221
-- Name: university_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.university_id_seq', 1, false);


--
-- TOC entry 4713 (class 2606 OID 16696)
-- Name: course course_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course
    ADD CONSTRAINT course_pkey PRIMARY KEY (id);


--
-- TOC entry 4715 (class 2606 OID 16705)
-- Name: professor professor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.professor
    ADD CONSTRAINT professor_pkey PRIMARY KEY (id);


--
-- TOC entry 4719 (class 2606 OID 16719)
-- Name: university_professors uk_2tuxujb1xvwlweikicxhqvkdh; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.university_professors
    ADD CONSTRAINT uk_2tuxujb1xvwlweikicxhqvkdh UNIQUE (professors_id);


--
-- TOC entry 4717 (class 2606 OID 16714)
-- Name: university university_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.university
    ADD CONSTRAINT university_pkey PRIMARY KEY (id);


--
-- TOC entry 4721 (class 2606 OID 16725)
-- Name: university_professors fk5w1kct1pkvekdv0tfs05ry3r9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.university_professors
    ADD CONSTRAINT fk5w1kct1pkvekdv0tfs05ry3r9 FOREIGN KEY (professors_id) REFERENCES public.professor(id);


--
-- TOC entry 4722 (class 2606 OID 16730)
-- Name: university_professors fk5wyr3k4xnuqwrj8x599ls0wbm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.university_professors
    ADD CONSTRAINT fk5wyr3k4xnuqwrj8x599ls0wbm FOREIGN KEY (university_id) REFERENCES public.university(id);


--
-- TOC entry 4720 (class 2606 OID 16720)
-- Name: course fkqctak3o6xmul2nu2561al3pb5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course
    ADD CONSTRAINT fkqctak3o6xmul2nu2561al3pb5 FOREIGN KEY (professor_id) REFERENCES public.professor(id);


-- Completed on 2025-02-09 22:34:29

--
-- PostgreSQL database dump complete
--


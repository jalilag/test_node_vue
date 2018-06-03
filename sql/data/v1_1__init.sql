--
-- PostgreSQL database dump
--

-- Dumped from database version 10.4
-- Dumped by pg_dump version 10.4

-- Started on 2018-06-03 23:12:00

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE lawapp;
--
-- TOC entry 2884 (class 1262 OID 24619)
-- Name: lawapp; Type: DATABASE; Schema: -; Owner: jalil
--

CREATE DATABASE lawapp WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'French_France.1252' LC_CTYPE = 'French_France.1252';


ALTER DATABASE lawapp OWNER TO jalil;

\connect lawapp

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12924)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2887 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 196 (class 1259 OID 24620)
-- Name: flyway_schema_history; Type: TABLE; Schema: public; Owner: jalil
--

CREATE TABLE public.flyway_schema_history (
    installed_rank integer NOT NULL,
    version character varying(50),
    description character varying(200) NOT NULL,
    type character varying(20) NOT NULL,
    script character varying(1000) NOT NULL,
    checksum integer,
    installed_by character varying(100) NOT NULL,
    installed_on timestamp without time zone DEFAULT now() NOT NULL,
    execution_time integer NOT NULL,
    success boolean NOT NULL
);


ALTER TABLE public.flyway_schema_history OWNER TO jalil;

--
-- TOC entry 200 (class 1259 OID 24643)
-- Name: groups; Type: TABLE; Schema: public; Owner: jalil
--

CREATE TABLE public.groups (
    gid integer NOT NULL,
    name character(255)
);


ALTER TABLE public.groups OWNER TO jalil;

--
-- TOC entry 199 (class 1259 OID 24641)
-- Name: group_gid_seq; Type: SEQUENCE; Schema: public; Owner: jalil
--

CREATE SEQUENCE public.group_gid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.group_gid_seq OWNER TO jalil;

--
-- TOC entry 2888 (class 0 OID 0)
-- Dependencies: 199
-- Name: group_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jalil
--

ALTER SEQUENCE public.group_gid_seq OWNED BY public.groups.gid;


--
-- TOC entry 202 (class 1259 OID 24660)
-- Name: items; Type: TABLE; Schema: public; Owner: jalil
--

CREATE TABLE public.items (
    page_id integer NOT NULL,
    section_id integer NOT NULL,
    itid integer NOT NULL
);


ALTER TABLE public.items OWNER TO jalil;

--
-- TOC entry 204 (class 1259 OID 24679)
-- Name: items_itid_seq; Type: SEQUENCE; Schema: public; Owner: jalil
--

CREATE SEQUENCE public.items_itid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.items_itid_seq OWNER TO jalil;

--
-- TOC entry 2889 (class 0 OID 0)
-- Dependencies: 204
-- Name: items_itid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jalil
--

ALTER SEQUENCE public.items_itid_seq OWNED BY public.items.itid;


--
-- TOC entry 207 (class 1259 OID 24717)
-- Name: pages; Type: TABLE; Schema: public; Owner: jalil
--

CREATE TABLE public.pages (
    page_id integer NOT NULL
);


ALTER TABLE public.pages OWNER TO jalil;

--
-- TOC entry 206 (class 1259 OID 24715)
-- Name: pages_page_id_seq; Type: SEQUENCE; Schema: public; Owner: jalil
--

CREATE SEQUENCE public.pages_page_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pages_page_id_seq OWNER TO jalil;

--
-- TOC entry 2890 (class 0 OID 0)
-- Dependencies: 206
-- Name: pages_page_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jalil
--

ALTER SEQUENCE public.pages_page_id_seq OWNED BY public.pages.page_id;


--
-- TOC entry 205 (class 1259 OID 24710)
-- Name: permissions_groups; Type: TABLE; Schema: public; Owner: jalil
--

CREATE TABLE public.permissions_groups (
    itid integer NOT NULL,
    gid integer NOT NULL,
    "right" integer
);


ALTER TABLE public.permissions_groups OWNER TO jalil;

--
-- TOC entry 203 (class 1259 OID 24667)
-- Name: permissions_users; Type: TABLE; Schema: public; Owner: jalil
--

CREATE TABLE public.permissions_users (
    itid integer NOT NULL,
    uid integer NOT NULL,
    "right" integer
);


ALTER TABLE public.permissions_users OWNER TO jalil;

--
-- TOC entry 201 (class 1259 OID 24649)
-- Name: rights; Type: TABLE; Schema: public; Owner: jalil
--

CREATE TABLE public.rights (
    caption character(255),
    "right" integer NOT NULL
);


ALTER TABLE public.rights OWNER TO jalil;

--
-- TOC entry 209 (class 1259 OID 24730)
-- Name: sections; Type: TABLE; Schema: public; Owner: jalil
--

CREATE TABLE public.sections (
    section_id integer NOT NULL,
    page_id integer
);


ALTER TABLE public.sections OWNER TO jalil;

--
-- TOC entry 208 (class 1259 OID 24728)
-- Name: sections_section_id_seq; Type: SEQUENCE; Schema: public; Owner: jalil
--

CREATE SEQUENCE public.sections_section_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sections_section_id_seq OWNER TO jalil;

--
-- TOC entry 2891 (class 0 OID 0)
-- Dependencies: 208
-- Name: sections_section_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jalil
--

ALTER SEQUENCE public.sections_section_id_seq OWNED BY public.sections.section_id;


--
-- TOC entry 198 (class 1259 OID 24632)
-- Name: users; Type: TABLE; Schema: public; Owner: jalil
--

CREATE TABLE public.users (
    uid integer NOT NULL,
    prenom character(255),
    nom character(255),
    email character(255)
);


ALTER TABLE public.users OWNER TO jalil;

--
-- TOC entry 197 (class 1259 OID 24630)
-- Name: users_uid_seq; Type: SEQUENCE; Schema: public; Owner: jalil
--

CREATE SEQUENCE public.users_uid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_uid_seq OWNER TO jalil;

--
-- TOC entry 2892 (class 0 OID 0)
-- Dependencies: 197
-- Name: users_uid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jalil
--

ALTER SEQUENCE public.users_uid_seq OWNED BY public.users.uid;


--
-- TOC entry 2714 (class 2604 OID 24646)
-- Name: groups gid; Type: DEFAULT; Schema: public; Owner: jalil
--

ALTER TABLE ONLY public.groups ALTER COLUMN gid SET DEFAULT nextval('public.group_gid_seq'::regclass);


--
-- TOC entry 2715 (class 2604 OID 24681)
-- Name: items itid; Type: DEFAULT; Schema: public; Owner: jalil
--

ALTER TABLE ONLY public.items ALTER COLUMN itid SET DEFAULT nextval('public.items_itid_seq'::regclass);


--
-- TOC entry 2716 (class 2604 OID 24720)
-- Name: pages page_id; Type: DEFAULT; Schema: public; Owner: jalil
--

ALTER TABLE ONLY public.pages ALTER COLUMN page_id SET DEFAULT nextval('public.pages_page_id_seq'::regclass);


--
-- TOC entry 2717 (class 2604 OID 24733)
-- Name: sections section_id; Type: DEFAULT; Schema: public; Owner: jalil
--

ALTER TABLE ONLY public.sections ALTER COLUMN section_id SET DEFAULT nextval('public.sections_section_id_seq'::regclass);


--
-- TOC entry 2713 (class 2604 OID 24635)
-- Name: users uid; Type: DEFAULT; Schema: public; Owner: jalil
--

ALTER TABLE ONLY public.users ALTER COLUMN uid SET DEFAULT nextval('public.users_uid_seq'::regclass);


--
-- TOC entry 2865 (class 0 OID 24620)
-- Dependencies: 196
-- Data for Name: flyway_schema_history; Type: TABLE DATA; Schema: public; Owner: jalil
--

INSERT INTO public.flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (1, '1', '<< Flyway Baseline >>', 'BASELINE', '<< Flyway Baseline >>', NULL, 'jalil', '2018-06-02 18:54:04.78988', 0, true);


--
-- TOC entry 2869 (class 0 OID 24643)
-- Dependencies: 200
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: jalil
--



--
-- TOC entry 2871 (class 0 OID 24660)
-- Dependencies: 202
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: jalil
--



--
-- TOC entry 2876 (class 0 OID 24717)
-- Dependencies: 207
-- Data for Name: pages; Type: TABLE DATA; Schema: public; Owner: jalil
--



--
-- TOC entry 2874 (class 0 OID 24710)
-- Dependencies: 205
-- Data for Name: permissions_groups; Type: TABLE DATA; Schema: public; Owner: jalil
--



--
-- TOC entry 2872 (class 0 OID 24667)
-- Dependencies: 203
-- Data for Name: permissions_users; Type: TABLE DATA; Schema: public; Owner: jalil
--



--
-- TOC entry 2870 (class 0 OID 24649)
-- Dependencies: 201
-- Data for Name: rights; Type: TABLE DATA; Schema: public; Owner: jalil
--



--
-- TOC entry 2878 (class 0 OID 24730)
-- Dependencies: 209
-- Data for Name: sections; Type: TABLE DATA; Schema: public; Owner: jalil
--



--
-- TOC entry 2867 (class 0 OID 24632)
-- Dependencies: 198
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: jalil
--



--
-- TOC entry 2893 (class 0 OID 0)
-- Dependencies: 199
-- Name: group_gid_seq; Type: SEQUENCE SET; Schema: public; Owner: jalil
--

SELECT pg_catalog.setval('public.group_gid_seq', 1, false);


--
-- TOC entry 2894 (class 0 OID 0)
-- Dependencies: 204
-- Name: items_itid_seq; Type: SEQUENCE SET; Schema: public; Owner: jalil
--

SELECT pg_catalog.setval('public.items_itid_seq', 1, false);


--
-- TOC entry 2895 (class 0 OID 0)
-- Dependencies: 206
-- Name: pages_page_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jalil
--

SELECT pg_catalog.setval('public.pages_page_id_seq', 1, false);


--
-- TOC entry 2896 (class 0 OID 0)
-- Dependencies: 208
-- Name: sections_section_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jalil
--

SELECT pg_catalog.setval('public.sections_section_id_seq', 1, false);


--
-- TOC entry 2897 (class 0 OID 0)
-- Dependencies: 197
-- Name: users_uid_seq; Type: SEQUENCE SET; Schema: public; Owner: jalil
--

SELECT pg_catalog.setval('public.users_uid_seq', 1, false);


--
-- TOC entry 2719 (class 2606 OID 24628)
-- Name: flyway_schema_history flyway_schema_history_pk; Type: CONSTRAINT; Schema: public; Owner: jalil
--

ALTER TABLE ONLY public.flyway_schema_history
    ADD CONSTRAINT flyway_schema_history_pk PRIMARY KEY (installed_rank);


--
-- TOC entry 2724 (class 2606 OID 24648)
-- Name: groups group_pkey; Type: CONSTRAINT; Schema: public; Owner: jalil
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT group_pkey PRIMARY KEY (gid);


--
-- TOC entry 2728 (class 2606 OID 24687)
-- Name: items items_itid_key; Type: CONSTRAINT; Schema: public; Owner: jalil
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_itid_key UNIQUE (itid);


--
-- TOC entry 2730 (class 2606 OID 24671)
-- Name: items items_pkey; Type: CONSTRAINT; Schema: public; Owner: jalil
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_pkey PRIMARY KEY (page_id, section_id);


--
-- TOC entry 2736 (class 2606 OID 24722)
-- Name: pages pages_pkey; Type: CONSTRAINT; Schema: public; Owner: jalil
--

ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_pkey PRIMARY KEY (page_id);


--
-- TOC entry 2734 (class 2606 OID 24714)
-- Name: permissions_groups permissions_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: jalil
--

ALTER TABLE ONLY public.permissions_groups
    ADD CONSTRAINT permissions_groups_pkey PRIMARY KEY (itid, gid);


--
-- TOC entry 2732 (class 2606 OID 24709)
-- Name: permissions_users permissions_users_pkey; Type: CONSTRAINT; Schema: public; Owner: jalil
--

ALTER TABLE ONLY public.permissions_users
    ADD CONSTRAINT permissions_users_pkey PRIMARY KEY (itid, uid);


--
-- TOC entry 2726 (class 2606 OID 24666)
-- Name: rights rights_pkey; Type: CONSTRAINT; Schema: public; Owner: jalil
--

ALTER TABLE ONLY public.rights
    ADD CONSTRAINT rights_pkey PRIMARY KEY ("right");


--
-- TOC entry 2738 (class 2606 OID 24735)
-- Name: sections sections_pkey; Type: CONSTRAINT; Schema: public; Owner: jalil
--

ALTER TABLE ONLY public.sections
    ADD CONSTRAINT sections_pkey PRIMARY KEY (section_id);


--
-- TOC entry 2722 (class 2606 OID 24640)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: jalil
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (uid);


--
-- TOC entry 2720 (class 1259 OID 24629)
-- Name: flyway_schema_history_s_idx; Type: INDEX; Schema: public; Owner: jalil
--

CREATE INDEX flyway_schema_history_s_idx ON public.flyway_schema_history USING btree (success);


--
-- TOC entry 2739 (class 2606 OID 24723)
-- Name: items items_page_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jalil
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_page_id_fkey FOREIGN KEY (page_id) REFERENCES public.pages(page_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2740 (class 2606 OID 24688)
-- Name: permissions_users permissions_itid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jalil
--

ALTER TABLE ONLY public.permissions_users
    ADD CONSTRAINT permissions_itid_fkey FOREIGN KEY (itid) REFERENCES public.items(itid) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2742 (class 2606 OID 24703)
-- Name: permissions_users permissions_rights_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jalil
--

ALTER TABLE ONLY public.permissions_users
    ADD CONSTRAINT permissions_rights_fkey FOREIGN KEY ("right") REFERENCES public.rights("right") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2741 (class 2606 OID 24698)
-- Name: permissions_users permissions_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jalil
--

ALTER TABLE ONLY public.permissions_users
    ADD CONSTRAINT permissions_uid_fkey FOREIGN KEY (uid) REFERENCES public.users(uid) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2743 (class 2606 OID 24737)
-- Name: sections sections_page_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jalil
--

ALTER TABLE ONLY public.sections
    ADD CONSTRAINT sections_page_id_fkey FOREIGN KEY (page_id) REFERENCES public.pages(page_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2886 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2018-06-03 23:12:00

--
-- PostgreSQL database dump complete
--


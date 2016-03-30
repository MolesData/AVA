--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.1
-- Dumped by pg_dump version 9.5.1

-- Started on 2016-03-30 13:55:34 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 7 (class 2615 OID 110708)
-- Name: AVA; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA "AVA";


ALTER SCHEMA "AVA" OWNER TO postgres;

--
-- TOC entry 1 (class 3079 OID 12623)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2442 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = "AVA", pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 182 (class 1259 OID 110709)
-- Name: AnnoAccademico; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE "AnnoAccademico" (
    "NomeAnnoX" integer,
    "NomeAnnoX-1" integer,
    "NomeAnnoX-1/X" text,
    "KAnnoAccademico" integer NOT NULL
);


ALTER TABLE "AnnoAccademico" OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 110712)
-- Name: Corso; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE "Corso" (
    "KCorso" integer NOT NULL,
    "CfuCorso" integer,
    "CodiceCorso" text,
    "NomeCorso" text,
    "SettoreDisciplinare" text
);


ALTER TABLE "Corso" OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 110718)
-- Name: CorsoDiStudi; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE "CorsoDiStudi" (
    "CodiceCorso" bigint,
    "NomeDipartimento" text,
    "CodiceDipartimento" double precision,
    "DataInizioValidità" bigint,
    "DataFineValidità" bigint,
    "NomeCorso" text,
    "TipoCds" text,
    "KCorsoDiStudi" double precision NOT NULL
);


ALTER TABLE "CorsoDiStudi" OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 110724)
-- Name: Esami; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE "Esami" (
    "CfuCorso" integer,
    "Voto" integer,
    "KStudente" integer NOT NULL,
    "KCorsoDiStudi" integer NOT NULL,
    "KCorso" integer NOT NULL,
    "KTempo" integer NOT NULL,
    "KAnnoAccademico" integer NOT NULL
);


ALTER TABLE "Esami" OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 110727)
-- Name: Ingressi; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE "Ingressi" (
    "KStudente" integer NOT NULL,
    "KTempo" integer NOT NULL,
    "KAnnoAccademico" integer NOT NULL,
    "KCorsoDiStudi" integer NOT NULL,
    "Immatricolato" integer,
    "KTipoImmatricolazione" integer NOT NULL,
    "EsitoIngresso" text
);


ALTER TABLE "Ingressi" OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 110730)
-- Name: Lauree; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE "Lauree" (
    "KStudente" integer NOT NULL,
    "KAnnoAccademico" integer NOT NULL,
    "KTempo" integer NOT NULL,
    "VotazioneFinale" text,
    "KCorsoDiStudi" integer NOT NULL
);


ALTER TABLE "Lauree" OWNER TO postgres;

--
-- TOC entry 192 (class 1259 OID 110861)
-- Name: Studente; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE "Studente" (
    "KStudente" integer NOT NULL,
    "CodiceFiscale" text,
    "Sesso" text,
    "DataNascita" integer,
    "Coorte" integer,
    "Cittadinanza" text,
    "StatoResidenza" text,
    "Comune" text,
    "AnnoDiploma" integer,
    "TitoloDiStudio" text,
    "TipoScuola" text,
    "IstitutoScuola" text,
    "VotoDiploma" text,
    "NazioneDiploma" text,
    "Provincia" text,
    "Regione" text
);


ALTER TABLE "Studente" OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 110739)
-- Name: Tempo; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE "Tempo" (
    "Anno" integer,
    "Mese" integer,
    "Giorno" integer,
    "KTempo" integer NOT NULL
);


ALTER TABLE "Tempo" OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 110742)
-- Name: TipoImmatricolazione; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE "TipoImmatricolazione" (
    "TipoIngresso" text,
    "KTipoImmatricolazione" integer NOT NULL
);


ALTER TABLE "TipoImmatricolazione" OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 110748)
-- Name: TipoIscrizione; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE "TipoIscrizione" (
    "AnniFuoriCorso" integer,
    "AnnoCorso" integer,
    "InCorso" integer,
    "KTipoIscrizione" integer NOT NULL
);


ALTER TABLE "TipoIscrizione" OWNER TO postgres;

--
-- TOC entry 191 (class 1259 OID 110751)
-- Name: TipoUscita; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE "TipoUscita" (
    "Descrizione" text,
    "KTipoUscita" integer NOT NULL
);


ALTER TABLE "TipoUscita" OWNER TO postgres;

SET search_path = public, pg_catalog;

--
-- TOC entry 193 (class 1259 OID 111067)
-- Name: Ingressi; Type: TABLE; Schema: public; Owner: Daniel
--

CREATE TABLE "Ingressi" (
    "KStudente" integer,
    "KTempo" integer,
    "KAnnoAccademico" integer,
    "KCorsoDiStudi" integer,
    "Immatricolato" integer,
    "KTipoImmatricolazione" integer,
    "EsitoIngresso" text
);


ALTER TABLE "Ingressi" OWNER TO "Daniel";

SET search_path = "AVA", pg_catalog;

--
-- TOC entry 2300 (class 2606 OID 111010)
-- Name: AnnoAccademico_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "AnnoAccademico"
    ADD CONSTRAINT "AnnoAccademico_pkey" PRIMARY KEY ("KAnnoAccademico");


--
-- TOC entry 2304 (class 2606 OID 110758)
-- Name: CorsoDiStudi_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "CorsoDiStudi"
    ADD CONSTRAINT "CorsoDiStudi_pkey" PRIMARY KEY ("KCorsoDiStudi");


--
-- TOC entry 2302 (class 2606 OID 110760)
-- Name: Corso_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Corso"
    ADD CONSTRAINT "Corso_pkey" PRIMARY KEY ("KCorso");


--
-- TOC entry 2306 (class 2606 OID 111019)
-- Name: Esami_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Esami"
    ADD CONSTRAINT "Esami_pkey" PRIMARY KEY ("KStudente", "KAnnoAccademico", "KCorsoDiStudi", "KCorso", "KTempo");


--
-- TOC entry 2308 (class 2606 OID 111119)
-- Name: Ingressi_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Ingressi"
    ADD CONSTRAINT "Ingressi_pkey" PRIMARY KEY ("KStudente", "KTempo", "KAnnoAccademico", "KCorsoDiStudi", "KTipoImmatricolazione");


--
-- TOC entry 2310 (class 2606 OID 111121)
-- Name: Lauree_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Lauree"
    ADD CONSTRAINT "Lauree_pkey" PRIMARY KEY ("KStudente", "KAnnoAccademico", "KTempo", "KCorsoDiStudi");


--
-- TOC entry 2320 (class 2606 OID 110868)
-- Name: Studente_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Studente"
    ADD CONSTRAINT "Studente_pkey" PRIMARY KEY ("KStudente");


--
-- TOC entry 2312 (class 2606 OID 110766)
-- Name: Tempo_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Tempo"
    ADD CONSTRAINT "Tempo_pkey" PRIMARY KEY ("KTempo");


--
-- TOC entry 2314 (class 2606 OID 110768)
-- Name: TipoImmatricolazione_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "TipoImmatricolazione"
    ADD CONSTRAINT "TipoImmatricolazione_pkey" PRIMARY KEY ("KTipoImmatricolazione");


--
-- TOC entry 2316 (class 2606 OID 111123)
-- Name: TipoIscrizione_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "TipoIscrizione"
    ADD CONSTRAINT "TipoIscrizione_pkey" PRIMARY KEY ("KTipoIscrizione");


--
-- TOC entry 2318 (class 2606 OID 110770)
-- Name: TipoUscita_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "TipoUscita"
    ADD CONSTRAINT "TipoUscita_pkey" PRIMARY KEY ("KTipoUscita");


--
-- TOC entry 2441 (class 0 OID 0)
-- Dependencies: 8
-- Name: public; Type: ACL; Schema: -; Owner: Daniel
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM "Daniel";
GRANT ALL ON SCHEMA public TO "Daniel";
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2016-03-30 13:55:34 CEST

--
-- PostgreSQL database dump complete
--


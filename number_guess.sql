--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
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
-- Name: game_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.game_info (
    user_id integer,
    game_id integer NOT NULL,
    number_of_guesses integer NOT NULL,
    secret_number integer NOT NULL,
    best_game integer
);


ALTER TABLE public.game_info OWNER TO freecodecamp;

--
-- Name: game_info_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.game_info_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.game_info_game_id_seq OWNER TO freecodecamp;

--
-- Name: game_info_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.game_info_game_id_seq OWNED BY public.game_info.game_id;


--
-- Name: user_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.user_info (
    user_id integer NOT NULL,
    username character varying(50) NOT NULL
);


ALTER TABLE public.user_info OWNER TO freecodecamp;

--
-- Name: user_info_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.user_info_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_info_user_id_seq OWNER TO freecodecamp;

--
-- Name: user_info_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.user_info_user_id_seq OWNED BY public.user_info.user_id;


--
-- Name: game_info game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.game_info ALTER COLUMN game_id SET DEFAULT nextval('public.game_info_game_id_seq'::regclass);


--
-- Name: user_info user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.user_info ALTER COLUMN user_id SET DEFAULT nextval('public.user_info_user_id_seq'::regclass);


--
-- Data for Name: game_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.game_info VALUES (74, 9, 16, 816, NULL);
INSERT INTO public.game_info VALUES (74, 10, 19, 135, NULL);
INSERT INTO public.game_info VALUES (75, 11, 231, 230, NULL);
INSERT INTO public.game_info VALUES (75, 12, 723, 722, NULL);
INSERT INTO public.game_info VALUES (76, 13, 243, 242, NULL);
INSERT INTO public.game_info VALUES (76, 14, 340, 339, NULL);
INSERT INTO public.game_info VALUES (75, 15, 375, 372, NULL);
INSERT INTO public.game_info VALUES (75, 16, 128, 126, NULL);
INSERT INTO public.game_info VALUES (75, 17, 691, 690, NULL);
INSERT INTO public.game_info VALUES (77, 18, 903, 902, NULL);
INSERT INTO public.game_info VALUES (77, 19, 362, 361, NULL);
INSERT INTO public.game_info VALUES (78, 20, 396, 395, NULL);
INSERT INTO public.game_info VALUES (78, 21, 696, 695, NULL);
INSERT INTO public.game_info VALUES (77, 22, 277, 274, NULL);
INSERT INTO public.game_info VALUES (77, 23, 244, 242, NULL);
INSERT INTO public.game_info VALUES (77, 24, 899, 898, NULL);


--
-- Data for Name: user_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.user_info VALUES (74, 'Peter');
INSERT INTO public.user_info VALUES (75, 'user_1708439086273');
INSERT INTO public.user_info VALUES (76, 'user_1708439086272');
INSERT INTO public.user_info VALUES (77, 'user_1708439174641');
INSERT INTO public.user_info VALUES (78, 'user_1708439174640');


--
-- Name: game_info_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.game_info_game_id_seq', 24, true);


--
-- Name: user_info_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.user_info_user_id_seq', 78, true);


--
-- Name: game_info game_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.game_info
    ADD CONSTRAINT game_info_pkey PRIMARY KEY (game_id);


--
-- Name: user_info user_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.user_info
    ADD CONSTRAINT user_info_pkey PRIMARY KEY (user_id);


--
-- Name: game_info game_info_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.game_info
    ADD CONSTRAINT game_info_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.user_info(user_id);


--
-- PostgreSQL database dump complete
--


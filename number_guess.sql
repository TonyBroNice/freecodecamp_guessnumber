--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer,
    result character varying(20) NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(60) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (116, 60, '7');
INSERT INTO public.games VALUES (117, 60, '6');
INSERT INTO public.games VALUES (118, 61, '517');
INSERT INTO public.games VALUES (119, 61, '651');
INSERT INTO public.games VALUES (120, 62, '439');
INSERT INTO public.games VALUES (121, 62, '443');
INSERT INTO public.games VALUES (122, 61, '369');
INSERT INTO public.games VALUES (123, 61, '889');
INSERT INTO public.games VALUES (124, 61, '374');
INSERT INTO public.games VALUES (125, 63, '486');
INSERT INTO public.games VALUES (126, 63, '621');
INSERT INTO public.games VALUES (127, 64, '764');
INSERT INTO public.games VALUES (128, 64, '603');
INSERT INTO public.games VALUES (129, 63, '21');
INSERT INTO public.games VALUES (130, 63, '920');
INSERT INTO public.games VALUES (131, 63, '591');
INSERT INTO public.games VALUES (132, 65, '606');
INSERT INTO public.games VALUES (133, 65, '492');
INSERT INTO public.games VALUES (134, 66, '808');
INSERT INTO public.games VALUES (135, 66, '674');
INSERT INTO public.games VALUES (136, 65, '290');
INSERT INTO public.games VALUES (137, 65, '155');
INSERT INTO public.games VALUES (138, 65, '14');
INSERT INTO public.games VALUES (139, 67, '25');
INSERT INTO public.games VALUES (140, 67, '460');
INSERT INTO public.games VALUES (141, 68, '688');
INSERT INTO public.games VALUES (142, 68, '420');
INSERT INTO public.games VALUES (143, 67, '409');
INSERT INTO public.games VALUES (144, 67, '733');
INSERT INTO public.games VALUES (145, 67, '319');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (60, 'Allan');
INSERT INTO public.users VALUES (61, 'user_1669894955258');
INSERT INTO public.users VALUES (62, 'user_1669894955257');
INSERT INTO public.users VALUES (63, 'user_1669894964420');
INSERT INTO public.users VALUES (64, 'user_1669894964419');
INSERT INTO public.users VALUES (65, 'user_1669895003208');
INSERT INTO public.users VALUES (66, 'user_1669895003207');
INSERT INTO public.users VALUES (67, 'user_1669895014281');
INSERT INTO public.users VALUES (68, 'user_1669895014280');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 145, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 68, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--


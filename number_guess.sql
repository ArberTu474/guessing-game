--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    guesses integer DEFAULT 0,
    user_id integer NOT NULL
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
    username character varying(22) NOT NULL
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

INSERT INTO public.games VALUES (42, 501, 44);
INSERT INTO public.games VALUES (43, 501, 44);
INSERT INTO public.games VALUES (44, 501, 45);
INSERT INTO public.games VALUES (45, 501, 45);
INSERT INTO public.games VALUES (46, 503, 44);
INSERT INTO public.games VALUES (47, 502, 44);
INSERT INTO public.games VALUES (48, 501, 44);
INSERT INTO public.games VALUES (49, 501, 46);
INSERT INTO public.games VALUES (50, 501, 46);
INSERT INTO public.games VALUES (51, 501, 47);
INSERT INTO public.games VALUES (52, 501, 47);
INSERT INTO public.games VALUES (53, 503, 46);
INSERT INTO public.games VALUES (54, 502, 46);
INSERT INTO public.games VALUES (55, 501, 46);
INSERT INTO public.games VALUES (56, 1, 49);
INSERT INTO public.games VALUES (57, 1, 49);
INSERT INTO public.games VALUES (58, 501, 50);
INSERT INTO public.games VALUES (59, 501, 50);
INSERT INTO public.games VALUES (60, 501, 51);
INSERT INTO public.games VALUES (61, 501, 51);
INSERT INTO public.games VALUES (62, 503, 50);
INSERT INTO public.games VALUES (63, 502, 50);
INSERT INTO public.games VALUES (64, 501, 50);
INSERT INTO public.games VALUES (65, 501, 52);
INSERT INTO public.games VALUES (66, 501, 52);
INSERT INTO public.games VALUES (67, 501, 53);
INSERT INTO public.games VALUES (68, 501, 53);
INSERT INTO public.games VALUES (69, 503, 52);
INSERT INTO public.games VALUES (70, 502, 52);
INSERT INTO public.games VALUES (71, 501, 52);
INSERT INTO public.games VALUES (72, 501, 54);
INSERT INTO public.games VALUES (73, 501, 54);
INSERT INTO public.games VALUES (74, 501, 55);
INSERT INTO public.games VALUES (75, 501, 55);
INSERT INTO public.games VALUES (76, 503, 54);
INSERT INTO public.games VALUES (77, 502, 54);
INSERT INTO public.games VALUES (78, 501, 54);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (44, 'user_1754222645926');
INSERT INTO public.users VALUES (45, 'user_1754222645925');
INSERT INTO public.users VALUES (46, 'user_1754222719185');
INSERT INTO public.users VALUES (47, 'user_1754222719184');
INSERT INTO public.users VALUES (48, 'arber');
INSERT INTO public.users VALUES (49, 'arber2');
INSERT INTO public.users VALUES (50, 'user_1754222892979');
INSERT INTO public.users VALUES (51, 'user_1754222892978');
INSERT INTO public.users VALUES (52, 'user_1754222943539');
INSERT INTO public.users VALUES (53, 'user_1754222943538');
INSERT INTO public.users VALUES (54, 'user_1754223001320');
INSERT INTO public.users VALUES (55, 'user_1754223001319');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 78, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 55, true);


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
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--


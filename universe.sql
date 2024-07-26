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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    has_life boolean NOT NULL,
    ly_from_earth_in_thousands numeric(4,3),
    galaxy_type_id integer,
    visible_to_naked_eye boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: galaxy_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_type (
    galaxy_type_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description character varying(80) NOT NULL
);


ALTER TABLE public.galaxy_type OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_type_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_type_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_type_galaxy_type_id_seq OWNED BY public.galaxy_type.galaxy_type_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text NOT NULL,
    has_life boolean,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text NOT NULL,
    has_life boolean,
    star_id integer NOT NULL,
    number_of_moons integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_million_years numeric(5,1),
    number_of_planets integer,
    absolute_magnitude numeric(4,2),
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_type galaxy_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type ALTER COLUMN galaxy_type_id SET DEFAULT nextval('public.galaxy_type_galaxy_type_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', true, NULL, 1, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', false, 2.363, 1, true);
INSERT INTO public.galaxy VALUES (3, 'Barnards', false, 1.760, 1, false);
INSERT INTO public.galaxy VALUES (4, 'M32', true, 2.650, 4, false);
INSERT INTO public.galaxy VALUES (5, 'A Galaxy Far Far Away', true, NULL, 2, false);
INSERT INTO public.galaxy VALUES (6, 'Star Fox', true, NULL, 3, false);


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_type VALUES (1, 'spiral', 'consist of a flat, rotating disk containing stars, gas and dust');
INSERT INTO public.galaxy_type VALUES (2, 'fictional_movies', 'well known in pop-culture with little basis in actual science');
INSERT INTO public.galaxy_type VALUES (3, 'fictional_video_games', 'lesser known in pop-culture, created for the most nerdy of fans');
INSERT INTO public.galaxy_type VALUES (4, 'elliptical', 'ellipsoidal shape, and a smooth, nearly featureless brightness profile');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'The Moon', 'only moon of planet Earth, one quarter the size, affects tides', false, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 'larger of two moons of Mars, orbits three times per day', false, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 'smaller of two moons of Mars, lumpy and cratered', false, 4);
INSERT INTO public.moon VALUES (4, 'Io', 'most volcanically active place in solar system', false, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 'most promising place to find life, possible saltwater oceans', false, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'largest moon in solar system, only one to have its own magnetic field', false, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 'most heavily cratered object in solar system', false, 5);
INSERT INTO public.moon VALUES (8, 'Titan', 'second largest moon in solar system, conatins atmosphere of nitrogen', false, 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', 'icy world with erupting geysers that spew water vapor', false, 6);
INSERT INTO public.moon VALUES (10, 'Hyperion', 'non-spherical, potato-shaped, porous', false, 6);
INSERT INTO public.moon VALUES (11, 'Prometheus', 'sheparding moon, porous, icy body', false, 6);
INSERT INTO public.moon VALUES (12, 'Pandora', 'potato-shaped, coated in fine icy material', false, 6);
INSERT INTO public.moon VALUES (13, 'Janus', 'potato-shaped, extensively cratered', false, 6);
INSERT INTO public.moon VALUES (14, 'Epimetheus', 'potato-shaped', false, 6);
INSERT INTO public.moon VALUES (15, 'Mimas', 'smallest and innermost moon of Saturn', false, 6);
INSERT INTO public.moon VALUES (16, 'Miranda', 'varied landscape, includes three coronae', false, 7);
INSERT INTO public.moon VALUES (17, 'Ariel', 'youngest moon of Uranus, contains equal parts water ice and silicate rock', false, 7);
INSERT INTO public.moon VALUES (18, 'Umbriel', 'darkest moon of Uranus', false, 7);
INSERT INTO public.moon VALUES (19, 'Triton', 'icy world, one of 16 moons of Neptune', false, 8);
INSERT INTO public.moon VALUES (20, 'Endor', 'forest-moon home to the Ewok', true, 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (10, 'Maramere', 'one of three planets in the Karthakk system', true, 5, NULL);
INSERT INTO public.planet VALUES (11, 'Lok', 'one of three planets in the Karthakk system', true, 5, NULL);
INSERT INTO public.planet VALUES (12, 'Nod Kartha', 'one of three planets in the Karthakk system', false, 5, NULL);
INSERT INTO public.planet VALUES (13, 'Venom', 'first and largest planent in the Lylat system', false, 6, NULL);
INSERT INTO public.planet VALUES (14, 'Titania', 'second planet in Lylat system, desert-landscape', true, 6, NULL);
INSERT INTO public.planet VALUES (15, 'Corneria', 'fourth planet in Lylat system, most-similar to Earth', true, 6, NULL);
INSERT INTO public.planet VALUES (1, 'Mercury', 'first planet from the sun, smallest in our solar system', false, 1, 0);
INSERT INTO public.planet VALUES (2, 'Venus', 'second planet from the sun, hottest in the solar system', false, 1, 0);
INSERT INTO public.planet VALUES (3, 'Earth', 'third planet from the sun, contains liquid water, atmosphere necessary to sustain life', true, 1, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'fourth planet form the sun, known aas the red planet', false, 1, 2);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'gas giant, fifth planet from the sun and largest in solar system', false, 1, 95);
INSERT INTO public.planet VALUES (6, 'Saturn', 'gas giant, sixth from sun and second largest in solar system, known for many rings', false, 1, 146);
INSERT INTO public.planet VALUES (7, 'Uranus', 'seventh planet from the sun, ice giant, tilted axis appears to spin on its side', false, 1, 28);
INSERT INTO public.planet VALUES (8, 'Neptune', 'furthest planet from the sun, gas giant, has an elliptical orbit', false, 1, 16);
INSERT INTO public.planet VALUES (9, 'Tana', 'gas giant in the Endor system', false, 4, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 4600.0, 8, 4.83, 1);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 10.0, NULL, 6.00, 1);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 4853.0, 2, 15.50, 1);
INSERT INTO public.star VALUES (5, 'Karthakk', NULL, 3, NULL, 5);
INSERT INTO public.star VALUES (6, 'Lylat system', 3100.0, 8, 5.20, 6);
INSERT INTO public.star VALUES (4, 'Endor system', NULL, 10, NULL, 5);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_type_galaxy_type_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_type galaxy_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_name_key UNIQUE (name);


--
-- Name: galaxy_type galaxy_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_pkey PRIMARY KEY (galaxy_type_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star fk_galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: galaxy galaxy_galaxy_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_type_id_fkey FOREIGN KEY (galaxy_type_id) REFERENCES public.galaxy_type(galaxy_type_id);


--
-- PostgreSQL database dump complete
--


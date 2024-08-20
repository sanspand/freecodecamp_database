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
    name character varying(20) NOT NULL,
    galaxy_types character varying(20) NOT NULL,
    description text,
    distance_from_earth_au integer
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(20) NOT NULL,
    is_spherical boolean,
    description text,
    distance_from_earth_au numeric(10,8),
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
    name character varying(20) NOT NULL,
    has_life boolean,
    description text,
    distance_from_earth_au integer,
    star_id integer
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
    name character varying(20) NOT NULL,
    age_in_millions_of_years numeric(10,2),
    description text,
    distance_from_earth_au integer,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_planet_link; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star_planet_link (
    star_planet_link_id integer NOT NULL,
    star_id integer NOT NULL,
    planet_id integer NOT NULL,
    link_description text,
    name character varying(20)
);


ALTER TABLE public.star_planet_link OWNER TO freecodecamp;

--
-- Name: star_planet_link_star_planet_link_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_planet_link_star_planet_link_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_planet_link_star_planet_link_id_seq OWNER TO freecodecamp;

--
-- Name: star_planet_link_star_planet_link_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_planet_link_star_planet_link_id_seq OWNED BY public.star_planet_link.star_planet_link_id;


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
-- Name: star_planet_link star_planet_link_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_planet_link ALTER COLUMN star_planet_link_id SET DEFAULT nextval('public.star_planet_link_star_planet_link_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 'Our home galaxy', 0);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 'Nearest spiral galaxy', 2530000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 'Smallest of the three', 3000000);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', 'Famous for its beauty', 23000000);
INSERT INTO public.galaxy VALUES (5, 'Messier 87', 'Elliptical', 'Known for its black hole', 53000000);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 'Spiral', 'Looks like a sombrero hat', 28000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (24, 'Moon', true, 'Earth''s natural satellite', 0.00257000, 1);
INSERT INTO public.moon VALUES (25, 'Phobos', true, 'Mars'' largest moon', 0.00006700, 2);
INSERT INTO public.moon VALUES (26, 'Deimos', true, 'Smaller moon of Mars', 0.00009100, 2);
INSERT INTO public.moon VALUES (27, 'Europa', true, 'Moon of Jupiter with ice crust', 0.00420000, 4);
INSERT INTO public.moon VALUES (28, 'Ganymede', true, 'Largest moon in the solar system', 0.00680000, 4);
INSERT INTO public.moon VALUES (29, 'Io', true, 'Volcanically active moon of Jupiter', 0.00450000, 4);
INSERT INTO public.moon VALUES (30, 'Callisto', true, 'Second largest moon of Jupiter', 0.00780000, 4);
INSERT INTO public.moon VALUES (31, 'Titan', true, 'Saturn''s largest moon', 0.00820000, 5);
INSERT INTO public.moon VALUES (32, 'Rhea', true, 'Moon of Saturn', 0.00600000, 5);
INSERT INTO public.moon VALUES (33, 'Tethys', true, 'Moon of Saturn', 0.00420000, 5);
INSERT INTO public.moon VALUES (34, 'Dione', true, 'Moon of Saturn', 0.00410000, 5);
INSERT INTO public.moon VALUES (35, 'Enceladus', true, 'Saturn''s icy moon', 0.00390000, 5);
INSERT INTO public.moon VALUES (36, 'Iapetus', true, 'Saturn''s moon with two-tone coloration', 0.00510000, 5);
INSERT INTO public.moon VALUES (37, 'Miranda', true, 'Moon of Uranus', 0.00320000, 7);
INSERT INTO public.moon VALUES (38, 'Ariel', true, 'Moon of Uranus', 0.00410000, 7);
INSERT INTO public.moon VALUES (39, 'Umbriel', true, 'Moon of Uranus', 0.00440000, 7);
INSERT INTO public.moon VALUES (40, 'Titania', true, 'Largest moon of Uranus', 0.00530000, 7);
INSERT INTO public.moon VALUES (41, 'Oberon', true, 'Moon of Uranus', 0.00510000, 7);
INSERT INTO public.moon VALUES (42, 'Triton', true, 'Largest moon of Neptune', 0.00440000, 8);
INSERT INTO public.moon VALUES (43, 'Nereid', true, 'Moon of Neptune', 0.00610000, 8);
INSERT INTO public.moon VALUES (44, 'Proteus', true, 'Moon of Neptune', 0.00420000, 8);
INSERT INTO public.moon VALUES (45, 'Larissa', true, 'Moon of Neptune', 0.00400000, 8);
INSERT INTO public.moon VALUES (46, 'Despina', true, 'Moon of Neptune', 0.00390000, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', true, 'Our home planet', 0, 1);
INSERT INTO public.planet VALUES (2, 'Mars', false, 'Red planet', 228, 1);
INSERT INTO public.planet VALUES (3, 'Venus', false, 'Earth''s twin', 108, 1);
INSERT INTO public.planet VALUES (4, 'Jupiter', false, 'Largest planet in the solar system', 778, 1);
INSERT INTO public.planet VALUES (5, 'Saturn', false, 'Known for its rings', 1427, 1);
INSERT INTO public.planet VALUES (6, 'Uranus', false, 'Ice giant', 2871, 1);
INSERT INTO public.planet VALUES (7, 'Neptune', false, 'Farthest planet from the Sun', 4497, 1);
INSERT INTO public.planet VALUES (8, 'Mercury', false, 'Closest planet to the Sun', 58, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', false, 'Dwarf planet', 5913, 1);
INSERT INTO public.planet VALUES (10, 'Eris', false, 'Distant dwarf planet', 9600, 1);
INSERT INTO public.planet VALUES (11, 'Haumea', false, 'Dwarf planet', 6312, 1);
INSERT INTO public.planet VALUES (12, 'Ceres', false, 'Largest object in the asteroid belt', 414, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 4600.00, 'Our star', 0, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 120.00, 'Brightest star in the sky', 9, 1);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 10000.00, 'Red supergiant star', 600, 1);
INSERT INTO public.star VALUES (4, 'Rigel', 80000.00, 'Blue supergiant star', 860, 1);
INSERT INTO public.star VALUES (5, 'Aldebaran', 6500.00, 'Red giant star', 65, 1);
INSERT INTO public.star VALUES (6, 'Polaris', 70000.00, 'North Star', 433, 1);


--
-- Data for Name: star_planet_link; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star_planet_link VALUES (1, 1, 1, 'Earth orbits around the Sun', NULL);
INSERT INTO public.star_planet_link VALUES (2, 1, 2, 'Mars orbits around the Sun', NULL);
INSERT INTO public.star_planet_link VALUES (3, 1, 3, 'Venus orbits around the Sun', NULL);
INSERT INTO public.star_planet_link VALUES (4, 1, 4, 'Jupiter orbits around the Sun', NULL);
INSERT INTO public.star_planet_link VALUES (5, 2, 2, 'Mars has been observed from Sirius', NULL);
INSERT INTO public.star_planet_link VALUES (6, 2, 4, 'Jupiter has been observed from Sirius', NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 46, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_planet_link_star_planet_link_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_planet_link_star_planet_link_id_seq', 6, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: star_planet_link star_planet_link_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_planet_link
    ADD CONSTRAINT star_planet_link_pkey PRIMARY KEY (star_planet_link_id);


--
-- Name: star_planet_link star_planet_link_star_planet_link_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_planet_link
    ADD CONSTRAINT star_planet_link_star_planet_link_id_key UNIQUE (star_planet_link_id);


--
-- Name: moon planet_moon_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT planet_moon_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star_planet_link star_planet_link_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_planet_link
    ADD CONSTRAINT star_planet_link_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id) ON DELETE CASCADE;


--
-- Name: star_planet_link star_planet_link_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_planet_link
    ADD CONSTRAINT star_planet_link_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--


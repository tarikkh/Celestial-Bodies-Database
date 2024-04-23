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
    name character varying(50) NOT NULL,
    description text NOT NULL,
    number_of_stars integer NOT NULL,
    number_of_planets integer NOT NULL,
    distance_from_earth numeric(9,2),
    galaxy_designation character varying(20)
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
    name character varying(50) NOT NULL,
    description text NOT NULL,
    is_spherical boolean NOT NULL,
    moon_designation character varying(20),
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
    name character varying(50) NOT NULL,
    description text NOT NULL,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    number_of_moons integer NOT NULL,
    planet_designation character varying(20),
    star_id integer,
    planet_type_id integer NOT NULL
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
-- Name: planet_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_type (
    planet_type_id integer NOT NULL,
    name character varying(60) NOT NULL,
    planet_type_designation character varying(20) NOT NULL
);


ALTER TABLE public.planet_type OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_type_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_type_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_type_planet_type_id_seq OWNED BY public.planet_type.planet_type_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text NOT NULL,
    is_spherical boolean NOT NULL,
    star_designation character varying(20),
    galaxy_id integer
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
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_type planet_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type ALTER COLUMN planet_type_id SET DEFAULT nextval('public.planet_type_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'The galaxy containing our Solar System.', 200, 8, 100000.00, 'MW-001');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'A spiral galaxy located 2.537 million light-years from Earth.', 300, 10, 300000.00, 'AND-002');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'A small galaxy in the Local Group.', 50, 5, 80000.00, 'TRI-003');
INSERT INTO public.galaxy VALUES (4, 'Centaurus A', 'A prominent galaxy in the constellation of Centaurus.', 150, 6, 150000.00, 'CEN-004');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool Galaxy', 'A spiral galaxy also known as M51.', 120, 4, 110000.00, 'M51-005');
INSERT INTO public.galaxy VALUES (6, 'Sombrero Galaxy', 'A spiral galaxy in the constellation of Virgo.', 80, 3, 120000.00, 'SOM-006');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 'The only natural satellite of Earth.', true, 'M-001', 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 'The larger and innermost moon of Mars.', true, 'PHB-002', 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 'The smaller and outermost moon of Mars.', true, 'DM-003', 2);
INSERT INTO public.moon VALUES (4, 'Ganymede', 'The largest moon of Jupiter and in the Solar System.', true, 'GAN-004', 3);
INSERT INTO public.moon VALUES (5, 'Titan', 'The largest moon of Saturn.', true, 'TIT-005', 4);
INSERT INTO public.moon VALUES (6, 'Triton', 'The largest moon of Neptune.', true, 'TRI-006', 5);
INSERT INTO public.moon VALUES (7, 'Charon', 'The largest moon of Pluto.', true, 'CHR-007', 6);
INSERT INTO public.moon VALUES (8, 'Europa', 'One of the Galilean moons of Jupiter.', true, 'EUR-008', 3);
INSERT INTO public.moon VALUES (9, 'Callisto', 'One of the Galilean moons of Jupiter.', true, 'CAL-009', 3);
INSERT INTO public.moon VALUES (10, 'Io', 'One of the Galilean moons of Jupiter.', true, 'IO-010', 3);
INSERT INTO public.moon VALUES (11, 'Enceladus', 'One of the moons of Saturn.', true, 'ENC-011', 5);
INSERT INTO public.moon VALUES (12, 'Mimas', 'One of the moons of Saturn.', true, 'MIM-012', 5);
INSERT INTO public.moon VALUES (13, 'Miranda', 'One of the moons of Uranus.', true, 'MIR-013', 9);
INSERT INTO public.moon VALUES (14, 'Ariel', 'One of the moons of Uranus.', true, 'AR-014', 9);
INSERT INTO public.moon VALUES (15, 'Titania', 'One of the moons of Uranus.', true, 'TI-015', 9);
INSERT INTO public.moon VALUES (16, 'Oberon', 'One of the moons of Uranus.', true, 'OB-016', 9);
INSERT INTO public.moon VALUES (17, 'Larissa', 'One of the moons of Neptune.', true, 'LAR-017', 6);
INSERT INTO public.moon VALUES (18, 'Proteus', 'One of the moons of Neptune.', true, 'PRO-018', 6);
INSERT INTO public.moon VALUES (19, 'Nereid', 'One of the moons of Neptune.', true, 'NER-019', 6);
INSERT INTO public.moon VALUES (20, 'Charon', 'One of the moons of Pluto.', true, 'CHR-020', 7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'The third planet from the Sun and the only known planet to support life.', true, true, 1, 'E-001', 1, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 'The fourth planet from the Sun.', false, true, 2, 'M-002', 1, 1);
INSERT INTO public.planet VALUES (3, 'Jupiter', 'The largest planet in the Solar System.', false, true, 79, 'J-003', 1, 2);
INSERT INTO public.planet VALUES (4, 'Saturn', 'The sixth planet from the Sun and the second-largest in the Solar System.', false, true, 82, 'S-004', 2, 2);
INSERT INTO public.planet VALUES (5, 'Neptune', 'The eighth and farthest known Solar planet from the Sun.', false, true, 14, 'N-005', 2, 3);
INSERT INTO public.planet VALUES (6, 'Pluto', 'A dwarf planet in the Kuiper belt.', false, true, 5, 'P-006', 2, 4);
INSERT INTO public.planet VALUES (7, 'Mercury', 'The smallest and innermost planet in the Solar System.', false, true, 0, 'MER-007', 3, 1);
INSERT INTO public.planet VALUES (8, 'Venus', 'The second planet from the Sun.', false, true, 0, 'VEN-008', 3, 1);
INSERT INTO public.planet VALUES (9, 'Uranus', 'The seventh planet from the Sun.', false, true, 27, 'UR-009', 3, 3);
INSERT INTO public.planet VALUES (10, 'Kepler-452b', 'An exoplanet orbiting the Sun-like star Kepler-452.', false, true, 0, 'K452b-010', 4, 5);
INSERT INTO public.planet VALUES (11, 'HD 189733b', 'An exoplanet in the constellation of Vulpecula.', false, true, 0, 'HD189733b-011', 4, 5);
INSERT INTO public.planet VALUES (12, 'Gliese 581g', 'An unconfirmed exoplanet in the constellation of Libra.', false, true, 0, 'G581g-012', 4, 6);


--
-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_type VALUES (1, 'Terrestrial', 'TER');
INSERT INTO public.planet_type VALUES (2, 'Gas Giant', 'GG');
INSERT INTO public.planet_type VALUES (3, 'Ice Giant', 'IG');
INSERT INTO public.planet_type VALUES (4, 'Dwarf Planet', 'DP');
INSERT INTO public.planet_type VALUES (5, 'Exoplanet', 'EP');
INSERT INTO public.planet_type VALUES (6, 'Unconfirmed Exoplanet', 'UE');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'The star at the center of our Solar System.', true, 'SUN-001', 1);
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 'The primary star of the Alpha Centauri system.', true, 'ALC-A-002', 1);
INSERT INTO public.star VALUES (3, 'Sirius', 'The brightest star in the night sky.', true, 'SIR-003', 1);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 'The closest known star to the Sun.', true, 'PROX-004', 2);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 'A red supergiant in the constellation of Orion.', true, 'BET-005', 2);
INSERT INTO public.star VALUES (6, 'Vega', 'A bright star in the northern constellation of Lyra.', true, 'VEG-006', 2);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_type_planet_type_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: galaxy galaxy_galaxy_designation_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_designation_key UNIQUE (galaxy_designation);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_designation_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_designation_key UNIQUE (moon_designation);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_designation_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_designation_key UNIQUE (planet_designation);


--
-- Name: planet_type planet_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_pkey PRIMARY KEY (planet_type_id);


--
-- Name: planet_type planet_type_planet_type_designation_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_planet_type_designation_key UNIQUE (planet_type_designation);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_designation_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_designation_key UNIQUE (star_designation);


--
-- Name: moon fk_moon_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_moon_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_planet_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: planet fk_planet_type_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_type_planet FOREIGN KEY (planet_type_id) REFERENCES public.planet_type(planet_type_id);


--
-- Name: star fk_star_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_star_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--


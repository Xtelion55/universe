--
-- PostgreSQL database dump
--

-- Dumped from database version 12.16 (Ubuntu 12.16-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.16 (Ubuntu 12.16-0ubuntu0.20.04.1)

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
    name character varying(255) NOT NULL,
    description text NOT NULL,
    distance_for_earth integer,
    estimated_age integer,
    mass_in_billion_solar_masses numeric,
    has_star_clusters boolean,
    has_black_hole boolean
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
    name character varying(255) NOT NULL,
    description text NOT NULL,
    radius_in_earths numeric,
    distance_to_planet numeric,
    planet_id integer,
    has_atmosphere boolean,
    craters integer,
    orbital_period integer,
    has_liquid_water boolean
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
    name character varying(255) NOT NULL,
    mass_in_earths numeric,
    radius_in_earths integer,
    distance_to_star integer,
    star_id integer,
    description text NOT NULL,
    has_life boolean,
    has_water boolean
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
    name character varying(255) NOT NULL,
    description text NOT NULL,
    estimated_age numeric,
    galaxy_id integer,
    luminosity integer,
    temperature integer,
    is_super_giant boolean,
    is_binary_star boolean
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
-- Name: zodiac_sign; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.zodiac_sign (
    zodiac_sign_id integer NOT NULL,
    name character varying(255) NOT NULL,
    element character varying(255),
    ruling_planet character varying(255),
    description text,
    start_date date,
    end_date date,
    is_cardinal boolean,
    lucky_number integer,
    compatibility text
);


ALTER TABLE public.zodiac_sign OWNER TO freecodecamp;

--
-- Name: zodiac_sign_zodiac_sign_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.zodiac_sign_zodiac_sign_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.zodiac_sign_zodiac_sign_id_seq OWNER TO freecodecamp;

--
-- Name: zodiac_sign_zodiac_sign_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.zodiac_sign_zodiac_sign_id_seq OWNED BY public.zodiac_sign.zodiac_sign_id;


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
-- Name: zodiac_sign zodiac_sign_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.zodiac_sign ALTER COLUMN zodiac_sign_id SET DEFAULT nextval('public.zodiac_sign_zodiac_sign_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our galaxy', 0, 13000, 100, true, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'A neighboring galaxy', 2400000, 6000, 150, true, false);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'A small spiral galaxy', 3000000, 12000, 15, false, false);
INSERT INTO public.galaxy VALUES (4, 'Centaurus A', 'An elliptical galaxy', 12000000, 13000, 100, false, true);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'A grand design spiral galaxy', 37000000, 5000, 70, true, false);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 'A lenticular galaxy', 29000000, 11000, 80, false, false);
INSERT INTO public.galaxy VALUES (7, 'Pinwheel', 'A face-on spiral galaxy', 15000000, 9000, 25, true, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 'Satélite natural de la Tierra', 0.273, 238855, 1, false, 1559, 27, false);
INSERT INTO public.moon VALUES (2, 'Moon2', 'Another moon', 0.273, 238855, 1, false, 1559, 27, false);
INSERT INTO public.moon VALUES (3, 'Phobos', 'Mars moon', 0.000106, 9377, 2, false, 1, 0, false);
INSERT INTO public.moon VALUES (4, 'Deimos', 'Mars moon', 0.000049, 23459, 2, false, 2, 1, false);
INSERT INTO public.moon VALUES (5, 'Io', 'Jupiter moon', 0.286, 421800, 3, true, 400, 2, false);
INSERT INTO public.moon VALUES (6, 'Europa', 'Jupiter moon', 0.245, 671034, 3, true, 36, 4, true);
INSERT INTO public.moon VALUES (7, 'Ganymede', 'Jupiter moon', 0.413, 1070412, 3, true, 300, 7, false);
INSERT INTO public.moon VALUES (8, 'Callisto', 'Jupiter moon', 0.378, 1882709, 3, true, 450, 17, false);
INSERT INTO public.moon VALUES (9, 'Titan', 'Saturn moon', 0.404, 1221870, 4, true, 1000, 16, true);
INSERT INTO public.moon VALUES (10, 'Enceladus', 'Saturn moon', 0.002, 238037, 4, true, 100, 1, true);
INSERT INTO public.moon VALUES (11, 'Mimas', 'Saturn moon', 0.001, 185539, 4, false, 20, 1, false);
INSERT INTO public.moon VALUES (12, 'Triton', 'Neptune moon', 0.212, 354759, 5, true, 1000, 6, true);
INSERT INTO public.moon VALUES (13, 'Charon', 'Pluto moon', 0.076, 19591, 6, false, 40, 6, false);
INSERT INTO public.moon VALUES (14, 'Phobos 2', 'Another look at Mars moon', 0.000106, 9377, 2, false, 1, 0, false);
INSERT INTO public.moon VALUES (15, 'Deimos 2', 'Another look at Mars moon', 0.000049, 23459, 2, false, 2, 1, false);
INSERT INTO public.moon VALUES (16, 'Io 2', 'Another look at Jupiter moon', 0.286, 421800, 3, true, 400, 2, false);
INSERT INTO public.moon VALUES (17, 'Europa 2', 'Another look at Jupiter moon', 0.245, 671034, 3, true, 36, 4, true);
INSERT INTO public.moon VALUES (18, 'Ganymede 2', 'Another look at Jupiter moon', 0.413, 1070412, 3, true, 300, 7, false);
INSERT INTO public.moon VALUES (19, 'Callisto 2', 'Another look at Jupiter moon', 0.378, 1882709, 3, true, 450, 17, false);
INSERT INTO public.moon VALUES (20, 'Titan 2', 'Another look at Saturn moon', 0.404, 1221870, 4, true, 1000, 16, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1.0, 1, 93, 1, 'The third planet from the Sun', true, true);
INSERT INTO public.planet VALUES (2, 'Mars', 0.107, 1, 142, 1, 'The fourth planet from the Sun', false, false);
INSERT INTO public.planet VALUES (3, 'Venus', 0.815, 1, 67, 1, 'The second planet from the Sun', false, false);
INSERT INTO public.planet VALUES (4, 'Jupiter', 317.8, 11, 484, 1, 'The largest planet in the Solar System', false, false);
INSERT INTO public.planet VALUES (5, 'Saturn', 95.2, 9, 887, 1, 'The second-largest planet in the Solar System', false, false);
INSERT INTO public.planet VALUES (6, 'Uranus', 14.5, 4, 1784, 1, 'The seventh planet from the Sun', false, false);
INSERT INTO public.planet VALUES (7, 'Neptune', 17.1, 4, 2796, 1, 'The eighth planet from the Sun', false, false);
INSERT INTO public.planet VALUES (8, 'Mercury', 0.055, 0, 36, 1, 'The closest planet to the Sun', false, false);
INSERT INTO public.planet VALUES (9, 'Pluto', 0.0024, 0, 3673, 1, 'Dwarf planet in the Kuiper belt', false, false);
INSERT INTO public.planet VALUES (10, 'Mars 2', 0.107, 1, 142, 1, 'Another look at Mars', false, false);
INSERT INTO public.planet VALUES (11, 'Venus 2', 0.815, 1, 67, 1, 'Another look at Venus', false, false);
INSERT INTO public.planet VALUES (12, 'Jupiter 2', 317.8, 11, 484, 1, 'Another look at Jupiter', false, false);
INSERT INTO public.planet VALUES (13, 'Saturn 2', 95.2, 9, 887, 1, 'Another look at Saturn', false, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'The closest star to Earth', 5000000000, 1, 1, 5778, false, false);
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 'A binary star system', 6000000000, 1, 1, 5790, true, true);
INSERT INTO public.star VALUES (3, 'Sirius', 'The brightest star in the night sky', 12000000000, 1, 25, 9940, false, true);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 'A red supergiant in Orion', 10000000, 1, 13000, 3500, true, false);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 'A red dwarf star', 5000000000, 1, 0, 3040, false, true);
INSERT INTO public.star VALUES (6, 'Vega', 'A bright star in the Lyra constellation', 500000000, 2, 37, 9602, false, false);


--
-- Data for Name: zodiac_sign; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.zodiac_sign VALUES (1, 'Aries', 'Fire', 'Mars', 'Aries is the first sign of the zodiac.', '2023-03-21', '2023-04-19', true, 7, 'Leo, Sagittarius, Aquarius');
INSERT INTO public.zodiac_sign VALUES (2, 'Taurus', 'Earth', 'Venus', 'Taurus is known for its stability and determination.', '2023-04-20', '2023-05-20', false, 6, 'Cancer, Virgo, Pisces');
INSERT INTO public.zodiac_sign VALUES (3, 'Gemini', 'Air', 'Mercury', 'Gemini is associated with adaptability and curiosity.', '2023-05-21', '2023-06-20', false, 5, 'Leo, Libra, Aquarius');
INSERT INTO public.zodiac_sign VALUES (4, 'Cancer', 'Water', 'Moon', 'Cancer is known for its emotional depth and intuition.', '2023-06-21', '2023-07-22', true, 2, 'Taurus, Virgo, Scorpio');
INSERT INTO public.zodiac_sign VALUES (5, 'Leo', 'Fire', 'Sun', 'Leo is associated with creativity and self-expression.', '2023-07-23', '2023-08-22', true, 1, 'Aries, Gemini, Libra');
INSERT INTO public.zodiac_sign VALUES (6, 'Virgo', 'Earth', 'Mercury', 'Virgo is known for attention to detail and practicality.', '2023-08-23', '2023-09-22', true, 3, 'Taurus, Cancer, Capricorn');
INSERT INTO public.zodiac_sign VALUES (7, 'Libra', 'Air', 'Venus', 'Libra is associated with balance and diplomacy.', '2023-09-23', '2023-10-22', true, 4, 'Gemini, Leo, Aquarius');
INSERT INTO public.zodiac_sign VALUES (8, 'Scorpio', 'Water', 'Pluto', 'Scorpio is known for intensity and transformation.', '2023-10-23', '2023-11-21', true, 8, 'Cancer, Virgo, Pisces');
INSERT INTO public.zodiac_sign VALUES (9, 'Sagittarius', 'Fire', 'Jupiter', 'Sagittarius is associated with adventure and optimism.', '2023-11-22', '2023-12-21', true, 9, 'Aries, Leo, Aquarius');
INSERT INTO public.zodiac_sign VALUES (10, 'Capricorn', 'Earth', 'Saturn', 'Capricorn is known for ambition and discipline.', '2023-12-22', '2024-01-19', true, 6, 'Taurus, Virgo, Pisces');
INSERT INTO public.zodiac_sign VALUES (11, 'Aquarius', 'Air', 'Uranus', 'Aquarius is associated with innovation and humanitarianism.', '2024-01-20', '2024-02-18', true, 7, 'Gemini, Libra, Sagittarius');
INSERT INTO public.zodiac_sign VALUES (12, 'Pisces', 'Water', 'Neptune', 'Pisces is known for empathy and imagination.', '2024-02-19', '2024-03-20', true, 2, 'Cancer, Scorpio, Capricorn');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: zodiac_sign_zodiac_sign_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.zodiac_sign_zodiac_sign_id_seq', 12, true);


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
-- Name: zodiac_sign zodiac_sign_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.zodiac_sign
    ADD CONSTRAINT zodiac_sign_name_key UNIQUE (name);


--
-- Name: zodiac_sign zodiac_sign_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.zodiac_sign
    ADD CONSTRAINT zodiac_sign_pkey PRIMARY KEY (zodiac_sign_id);


--
-- Name: star galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--


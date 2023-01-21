--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

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
-- Name: food_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.food_items (
    id integer NOT NULL,
    name text NOT NULL,
    type text,
    price double precision NOT NULL,
    menu_id integer
);


ALTER TABLE public.food_items OWNER TO postgres;

--
-- Name: food_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.food_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.food_items_id_seq OWNER TO postgres;

--
-- Name: food_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.food_items_id_seq OWNED BY public.food_items.id;


--
-- Name: food_items_ingredients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.food_items_ingredients (
    food_item_id integer NOT NULL,
    ingredient_id integer NOT NULL
);


ALTER TABLE public.food_items_ingredients OWNER TO postgres;

--
-- Name: food_items_menus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.food_items_menus (
    food_item_id integer NOT NULL,
    menu_id integer NOT NULL
);


ALTER TABLE public.food_items_menus OWNER TO postgres;

--
-- Name: ingredients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ingredients (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.ingredients OWNER TO postgres;

--
-- Name: ingredients_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ingredients_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ingredients_id_seq OWNER TO postgres;

--
-- Name: ingredients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ingredients_id_seq OWNED BY public.ingredients.id;


--
-- Name: menus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.menus (
    id integer NOT NULL,
    restaurant_id integer NOT NULL,
    name text NOT NULL,
    time_of_day text,
    restaurant_name text
);


ALTER TABLE public.menus OWNER TO postgres;

--
-- Name: menus_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.menus_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.menus_id_seq OWNER TO postgres;

--
-- Name: menus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.menus_id_seq OWNED BY public.menus.id;


--
-- Name: restaurants; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.restaurants (
    id integer NOT NULL,
    name text NOT NULL,
    cuisine_type text,
    owner text
);


ALTER TABLE public.restaurants OWNER TO postgres;

--
-- Name: restaurants_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.restaurants_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.restaurants_id_seq OWNER TO postgres;

--
-- Name: restaurants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.restaurants_id_seq OWNED BY public.restaurants.id;


--
-- Name: food_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.food_items ALTER COLUMN id SET DEFAULT nextval('public.food_items_id_seq'::regclass);


--
-- Name: ingredients id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ingredients ALTER COLUMN id SET DEFAULT nextval('public.ingredients_id_seq'::regclass);


--
-- Name: menus id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menus ALTER COLUMN id SET DEFAULT nextval('public.menus_id_seq'::regclass);


--
-- Name: restaurants id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restaurants ALTER COLUMN id SET DEFAULT nextval('public.restaurants_id_seq'::regclass);


--
-- Data for Name: food_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.food_items (id, name, type, price, menu_id) FROM stdin;
1	Big Mac	burger	4.99	1
2	McDouble	burger	1.99	1
3	McChicken	chicken sandwich	1.49	1
4	Filet O Fish	fish sandwich	4.49	1
5	Small Fry	french fries	1.29	1
6	McGriddle	breakfast sandwich	1.79	2
7	Hash Brown	side	1.19	2
8	Chicken Burrito Bowl	main dish	8.79	5
9	Steak Tacos	main dish	8.69	5
10	Chicken&biscuit sandwich	main dish	6.49	4
\.


--
-- Data for Name: food_items_ingredients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.food_items_ingredients (food_item_id, ingredient_id) FROM stdin;
\.


--
-- Data for Name: food_items_menus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.food_items_menus (food_item_id, menu_id) FROM stdin;
\.


--
-- Data for Name: ingredients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ingredients (id, name) FROM stdin;
1	chicken
2	beef
3	steak
4	potato
5	olive oil
6	canola oil
7	salt
8	pepper
\.


--
-- Data for Name: menus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.menus (id, restaurant_id, name, time_of_day, restaurant_name) FROM stdin;
1	1	General	All-Day	McDonalds
2	1	Breakfast	Morning	McDonalds
4	2	Breakfast	Morning	Chik-Fil-A
5	3	General	All-Day	Chipotle
\.


--
-- Data for Name: restaurants; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.restaurants (id, name, cuisine_type, owner) FROM stdin;
2	Chik-Fil-A	fast-food/casual	S. Truett Cathy
1	McDonalds	fast-food/casual	Kroc
3	Chipotle	Tex-Mex	Steve Ells
\.


--
-- Name: food_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.food_items_id_seq', 10, true);


--
-- Name: ingredients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ingredients_id_seq', 8, true);


--
-- Name: menus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.menus_id_seq', 5, true);


--
-- Name: restaurants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.restaurants_id_seq', 3, true);


--
-- Name: food_items_ingredients food_items_ingredients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.food_items_ingredients
    ADD CONSTRAINT food_items_ingredients_pkey PRIMARY KEY (food_item_id, ingredient_id);


--
-- Name: food_items_menus food_items_menus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.food_items_menus
    ADD CONSTRAINT food_items_menus_pkey PRIMARY KEY (food_item_id, menu_id);


--
-- Name: food_items food_items_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.food_items
    ADD CONSTRAINT food_items_name_key UNIQUE (name);


--
-- Name: food_items food_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.food_items
    ADD CONSTRAINT food_items_pkey PRIMARY KEY (id);


--
-- Name: ingredients ingredients_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ingredients
    ADD CONSTRAINT ingredients_name_key UNIQUE (name);


--
-- Name: ingredients ingredients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ingredients
    ADD CONSTRAINT ingredients_pkey PRIMARY KEY (id);


--
-- Name: menus menus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menus
    ADD CONSTRAINT menus_pkey PRIMARY KEY (id);


--
-- Name: restaurants restaurants_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restaurants
    ADD CONSTRAINT restaurants_name_key UNIQUE (name);


--
-- Name: restaurants restaurants_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restaurants
    ADD CONSTRAINT restaurants_pkey PRIMARY KEY (id);


--
-- Name: food_items_ingredients fk_food_items_ingredients_food_item; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.food_items_ingredients
    ADD CONSTRAINT fk_food_items_ingredients_food_item FOREIGN KEY (food_item_id) REFERENCES public.food_items(id);


--
-- Name: food_items_ingredients fk_food_items_ingredients_ingredients; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.food_items_ingredients
    ADD CONSTRAINT fk_food_items_ingredients_ingredients FOREIGN KEY (ingredient_id) REFERENCES public.ingredients(id);


--
-- Name: food_items_menus fk_food_items_menus_food_items; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.food_items_menus
    ADD CONSTRAINT fk_food_items_menus_food_items FOREIGN KEY (food_item_id) REFERENCES public.food_items(id);


--
-- Name: food_items_menus fk_food_items_menus_menus; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.food_items_menus
    ADD CONSTRAINT fk_food_items_menus_menus FOREIGN KEY (menu_id) REFERENCES public.menus(id);


--
-- Name: menus fk_menus_restaurants; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menus
    ADD CONSTRAINT fk_menus_restaurants FOREIGN KEY (restaurant_id) REFERENCES public.restaurants(id);


--
-- PostgreSQL database dump complete
--


--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4
-- Dumped by pg_dump version 16.4

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
-- Name: cuisine_tag_list; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cuisine_tag_list (
    id integer NOT NULL,
    type_of_cuisine character varying(50)
);


ALTER TABLE public.cuisine_tag_list OWNER TO postgres;

--
-- Name: cuisine_tag_list_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cuisine_tag_list_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cuisine_tag_list_id_seq OWNER TO postgres;

--
-- Name: cuisine_tag_list_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cuisine_tag_list_id_seq OWNED BY public.cuisine_tag_list.id;


--
-- Name: event_tag_list; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.event_tag_list (
    id integer NOT NULL,
    event_tags character varying(50)
);


ALTER TABLE public.event_tag_list OWNER TO postgres;

--
-- Name: event_tag_list_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.event_tag_list_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.event_tag_list_id_seq OWNER TO postgres;

--
-- Name: event_tag_list_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.event_tag_list_id_seq OWNED BY public.event_tag_list.id;


--
-- Name: event_tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.event_tags (
    event_id integer NOT NULL,
    event_tag_id integer NOT NULL
);


ALTER TABLE public.event_tags OWNER TO postgres;

--
-- Name: events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.events (
    id integer NOT NULL,
    host_id integer NOT NULL,
    title character varying(255) NOT NULL,
    description text,
    location character varying(255) NOT NULL,
    start_time timestamp without time zone NOT NULL,
    end_time timestamp without time zone NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.events OWNER TO postgres;

--
-- Name: events_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.events_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.events_id_seq OWNER TO postgres;

--
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.events_id_seq OWNED BY public.events.id;


--
-- Name: hostratings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hostratings (
    host_id integer NOT NULL,
    user_id integer NOT NULL,
    rating integer,
    comment text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT hostratings_rating_check CHECK (((rating >= 1) AND (rating <= 5)))
);


ALTER TABLE public.hostratings OWNER TO postgres;

--
-- Name: hosts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hosts (
    id integer NOT NULL,
    user_id integer,
    kyc_status boolean NOT NULL,
    event_count integer DEFAULT 0,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.hosts OWNER TO postgres;

--
-- Name: hosts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hosts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.hosts_id_seq OWNER TO postgres;

--
-- Name: hosts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hosts_id_seq OWNED BY public.hosts.id;


--
-- Name: restuarantratings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.restuarantratings (
    restuarant_id integer NOT NULL,
    user_id integer NOT NULL,
    rating integer,
    comment text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT restuarantratings_rating_check CHECK (((rating >= 1) AND (rating <= 5)))
);


ALTER TABLE public.restuarantratings OWNER TO postgres;

--
-- Name: restuarants; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.restuarants (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    location character varying(255) NOT NULL,
    number_of_user_selected integer DEFAULT 0
);


ALTER TABLE public.restuarants OWNER TO postgres;

--
-- Name: restuarants_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.restuarants_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.restuarants_id_seq OWNER TO postgres;

--
-- Name: restuarants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.restuarants_id_seq OWNED BY public.restuarants.id;


--
-- Name: user_eaten_restuarant; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_eaten_restuarant (
    user_id integer NOT NULL,
    cuisine_tag_id integer NOT NULL,
    restuarant_id integer NOT NULL
);


ALTER TABLE public.user_eaten_restuarant OWNER TO postgres;

--
-- Name: user_event_preference; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_event_preference (
    user_id integer NOT NULL,
    event_tag_id integer NOT NULL
);


ALTER TABLE public.user_event_preference OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: cuisine_tag_list id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuisine_tag_list ALTER COLUMN id SET DEFAULT nextval('public.cuisine_tag_list_id_seq'::regclass);


--
-- Name: event_tag_list id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_tag_list ALTER COLUMN id SET DEFAULT nextval('public.event_tag_list_id_seq'::regclass);


--
-- Name: events id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events ALTER COLUMN id SET DEFAULT nextval('public.events_id_seq'::regclass);


--
-- Name: hosts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hosts ALTER COLUMN id SET DEFAULT nextval('public.hosts_id_seq'::regclass);


--
-- Name: restuarants id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restuarants ALTER COLUMN id SET DEFAULT nextval('public.restuarants_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: cuisine_tag_list cuisine_tag_list_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuisine_tag_list
    ADD CONSTRAINT cuisine_tag_list_pkey PRIMARY KEY (id);


--
-- Name: event_tag_list event_tag_list_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_tag_list
    ADD CONSTRAINT event_tag_list_pkey PRIMARY KEY (id);


--
-- Name: events events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- Name: hostratings hostratings_user_id_host_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hostratings
    ADD CONSTRAINT hostratings_user_id_host_id_key UNIQUE (user_id, host_id);


--
-- Name: hosts hosts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hosts
    ADD CONSTRAINT hosts_pkey PRIMARY KEY (id);


--
-- Name: restuarantratings restuarantratings_user_id_restuarant_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restuarantratings
    ADD CONSTRAINT restuarantratings_user_id_restuarant_id_key UNIQUE (user_id, restuarant_id);


--
-- Name: restuarants restuarants_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restuarants
    ADD CONSTRAINT restuarants_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: event_tags event_tags_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_tags
    ADD CONSTRAINT event_tags_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.events(id);


--
-- Name: event_tags event_tags_event_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_tags
    ADD CONSTRAINT event_tags_event_tag_id_fkey FOREIGN KEY (event_tag_id) REFERENCES public.event_tag_list(id);


--
-- Name: events events_host_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_host_id_fkey FOREIGN KEY (host_id) REFERENCES public.hosts(id);


--
-- Name: hostratings hostratings_host_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hostratings
    ADD CONSTRAINT hostratings_host_id_fkey FOREIGN KEY (host_id) REFERENCES public.hosts(id);


--
-- Name: hostratings hostratings_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hostratings
    ADD CONSTRAINT hostratings_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: hosts hosts_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hosts
    ADD CONSTRAINT hosts_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: restuarantratings restuarantratings_restuarant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restuarantratings
    ADD CONSTRAINT restuarantratings_restuarant_id_fkey FOREIGN KEY (restuarant_id) REFERENCES public.restuarants(id);


--
-- Name: restuarantratings restuarantratings_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restuarantratings
    ADD CONSTRAINT restuarantratings_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: user_eaten_restuarant user_eaten_restuarant_cuisine_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_eaten_restuarant
    ADD CONSTRAINT user_eaten_restuarant_cuisine_tag_id_fkey FOREIGN KEY (cuisine_tag_id) REFERENCES public.cuisine_tag_list(id);


--
-- Name: user_eaten_restuarant user_eaten_restuarant_restuarant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_eaten_restuarant
    ADD CONSTRAINT user_eaten_restuarant_restuarant_id_fkey FOREIGN KEY (restuarant_id) REFERENCES public.restuarants(id);


--
-- Name: user_eaten_restuarant user_eaten_restuarant_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_eaten_restuarant
    ADD CONSTRAINT user_eaten_restuarant_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: user_event_preference user_event_preference_event_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_event_preference
    ADD CONSTRAINT user_event_preference_event_tag_id_fkey FOREIGN KEY (event_tag_id) REFERENCES public.event_tag_list(id);


--
-- Name: user_event_preference user_event_preference_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_event_preference
    ADD CONSTRAINT user_event_preference_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--


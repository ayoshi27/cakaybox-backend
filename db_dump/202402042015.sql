--
-- PostgreSQL database dump
--

-- Dumped from database version 15.5 (Ubuntu 15.5-1.pgdg22.04+1)
-- Dumped by pg_dump version 15.5 (Homebrew)

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

--
-- Name: Role; Type: TYPE; Schema: public; Owner: expend_manage_admin
--

CREATE TYPE public."Role" AS ENUM (
    'USER',
    'ADMIN'
);


ALTER TYPE public."Role" OWNER TO expend_manage_admin;

--
-- Name: Sign; Type: TYPE; Schema: public; Owner: expend_manage_admin
--

CREATE TYPE public."Sign" AS ENUM (
    'PLUS',
    'MINUS'
);


ALTER TYPE public."Sign" OWNER TO expend_manage_admin;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Budget; Type: TABLE; Schema: public; Owner: expend_manage_admin
--

CREATE TABLE public."Budget" (
    id integer NOT NULL,
    code text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    name text NOT NULL
);


ALTER TABLE public."Budget" OWNER TO expend_manage_admin;

--
-- Name: BudgetOnCountingItem; Type: TABLE; Schema: public; Owner: expend_manage_admin
--

CREATE TABLE public."BudgetOnCountingItem" (
    id integer NOT NULL,
    "budgetId" integer NOT NULL,
    "countingItemId" integer NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."BudgetOnCountingItem" OWNER TO expend_manage_admin;

--
-- Name: BudgetOnCountingItem_id_seq; Type: SEQUENCE; Schema: public; Owner: expend_manage_admin
--

CREATE SEQUENCE public."BudgetOnCountingItem_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."BudgetOnCountingItem_id_seq" OWNER TO expend_manage_admin;

--
-- Name: BudgetOnCountingItem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: expend_manage_admin
--

ALTER SEQUENCE public."BudgetOnCountingItem_id_seq" OWNED BY public."BudgetOnCountingItem".id;


--
-- Name: BudgetOnCustomCountingItemTerm; Type: TABLE; Schema: public; Owner: expend_manage_admin
--

CREATE TABLE public."BudgetOnCustomCountingItemTerm" (
    id integer NOT NULL,
    "budgetId" integer NOT NULL,
    "customCountingItemTermId" integer NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."BudgetOnCustomCountingItemTerm" OWNER TO expend_manage_admin;

--
-- Name: BudgetOnCustomCountingItemTerm_id_seq; Type: SEQUENCE; Schema: public; Owner: expend_manage_admin
--

CREATE SEQUENCE public."BudgetOnCustomCountingItemTerm_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."BudgetOnCustomCountingItemTerm_id_seq" OWNER TO expend_manage_admin;

--
-- Name: BudgetOnCustomCountingItemTerm_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: expend_manage_admin
--

ALTER SEQUENCE public."BudgetOnCustomCountingItemTerm_id_seq" OWNED BY public."BudgetOnCustomCountingItemTerm".id;


--
-- Name: Budget_id_seq; Type: SEQUENCE; Schema: public; Owner: expend_manage_admin
--

CREATE SEQUENCE public."Budget_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Budget_id_seq" OWNER TO expend_manage_admin;

--
-- Name: Budget_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: expend_manage_admin
--

ALTER SEQUENCE public."Budget_id_seq" OWNED BY public."Budget".id;


--
-- Name: Category; Type: TABLE; Schema: public; Owner: expend_manage_admin
--

CREATE TABLE public."Category" (
    id integer NOT NULL,
    code text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    name text NOT NULL,
    "limit" integer DEFAULT 0 NOT NULL
);


ALTER TABLE public."Category" OWNER TO expend_manage_admin;

--
-- Name: CategoryOnCustomCountingItemTerm; Type: TABLE; Schema: public; Owner: expend_manage_admin
--

CREATE TABLE public."CategoryOnCustomCountingItemTerm" (
    id integer NOT NULL,
    "categoryId" integer NOT NULL,
    "customCountingItemTermId" integer NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."CategoryOnCustomCountingItemTerm" OWNER TO expend_manage_admin;

--
-- Name: CategoryOnCustomCountingItemTerm_id_seq; Type: SEQUENCE; Schema: public; Owner: expend_manage_admin
--

CREATE SEQUENCE public."CategoryOnCustomCountingItemTerm_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."CategoryOnCustomCountingItemTerm_id_seq" OWNER TO expend_manage_admin;

--
-- Name: CategoryOnCustomCountingItemTerm_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: expend_manage_admin
--

ALTER SEQUENCE public."CategoryOnCustomCountingItemTerm_id_seq" OWNED BY public."CategoryOnCustomCountingItemTerm".id;


--
-- Name: Category_id_seq; Type: SEQUENCE; Schema: public; Owner: expend_manage_admin
--

CREATE SEQUENCE public."Category_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Category_id_seq" OWNER TO expend_manage_admin;

--
-- Name: Category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: expend_manage_admin
--

ALTER SEQUENCE public."Category_id_seq" OWNED BY public."Category".id;


--
-- Name: CountingItem; Type: TABLE; Schema: public; Owner: expend_manage_admin
--

CREATE TABLE public."CountingItem" (
    id integer NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    name text NOT NULL,
    code text NOT NULL,
    processed boolean[] DEFAULT ARRAY[]::boolean[]
);


ALTER TABLE public."CountingItem" OWNER TO expend_manage_admin;

--
-- Name: CountingItem_id_seq; Type: SEQUENCE; Schema: public; Owner: expend_manage_admin
--

CREATE SEQUENCE public."CountingItem_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."CountingItem_id_seq" OWNER TO expend_manage_admin;

--
-- Name: CountingItem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: expend_manage_admin
--

ALTER SEQUENCE public."CountingItem_id_seq" OWNED BY public."CountingItem".id;


--
-- Name: CustomCountingItem; Type: TABLE; Schema: public; Owner: expend_manage_admin
--

CREATE TABLE public."CustomCountingItem" (
    id integer NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    name text NOT NULL,
    code text NOT NULL
);


ALTER TABLE public."CustomCountingItem" OWNER TO expend_manage_admin;

--
-- Name: CustomCountingItemTerm; Type: TABLE; Schema: public; Owner: expend_manage_admin
--

CREATE TABLE public."CustomCountingItemTerm" (
    id integer NOT NULL,
    sign public."Sign" NOT NULL,
    coefficient double precision NOT NULL,
    "customCountingItemId" integer,
    processed boolean[] DEFAULT ARRAY[]::boolean[]
);


ALTER TABLE public."CustomCountingItemTerm" OWNER TO expend_manage_admin;

--
-- Name: CustomCountingItemTerm_id_seq; Type: SEQUENCE; Schema: public; Owner: expend_manage_admin
--

CREATE SEQUENCE public."CustomCountingItemTerm_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."CustomCountingItemTerm_id_seq" OWNER TO expend_manage_admin;

--
-- Name: CustomCountingItemTerm_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: expend_manage_admin
--

ALTER SEQUENCE public."CustomCountingItemTerm_id_seq" OWNED BY public."CustomCountingItemTerm".id;


--
-- Name: CustomCountingItem_id_seq; Type: SEQUENCE; Schema: public; Owner: expend_manage_admin
--

CREATE SEQUENCE public."CustomCountingItem_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."CustomCountingItem_id_seq" OWNER TO expend_manage_admin;

--
-- Name: CustomCountingItem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: expend_manage_admin
--

ALTER SEQUENCE public."CustomCountingItem_id_seq" OWNED BY public."CustomCountingItem".id;


--
-- Name: Expend; Type: TABLE; Schema: public; Owner: expend_manage_admin
--

CREATE TABLE public."Expend" (
    id integer NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    price integer NOT NULL,
    description text NOT NULL,
    date text NOT NULL,
    "categoryId" integer NOT NULL,
    "payerId" integer NOT NULL,
    "budgetId" integer NOT NULL,
    "paymentMethodId" integer NOT NULL,
    processed boolean DEFAULT false NOT NULL
);


ALTER TABLE public."Expend" OWNER TO expend_manage_admin;

--
-- Name: Expend_id_seq; Type: SEQUENCE; Schema: public; Owner: expend_manage_admin
--

CREATE SEQUENCE public."Expend_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Expend_id_seq" OWNER TO expend_manage_admin;

--
-- Name: Expend_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: expend_manage_admin
--

ALTER SEQUENCE public."Expend_id_seq" OWNED BY public."Expend".id;


--
-- Name: Payer; Type: TABLE; Schema: public; Owner: expend_manage_admin
--

CREATE TABLE public."Payer" (
    id integer NOT NULL,
    code text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    name text NOT NULL
);


ALTER TABLE public."Payer" OWNER TO expend_manage_admin;

--
-- Name: PayerOnCountingItem; Type: TABLE; Schema: public; Owner: expend_manage_admin
--

CREATE TABLE public."PayerOnCountingItem" (
    id integer NOT NULL,
    "payerId" integer NOT NULL,
    "countingItemId" integer NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."PayerOnCountingItem" OWNER TO expend_manage_admin;

--
-- Name: PayerOnCountingItem_id_seq; Type: SEQUENCE; Schema: public; Owner: expend_manage_admin
--

CREATE SEQUENCE public."PayerOnCountingItem_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."PayerOnCountingItem_id_seq" OWNER TO expend_manage_admin;

--
-- Name: PayerOnCountingItem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: expend_manage_admin
--

ALTER SEQUENCE public."PayerOnCountingItem_id_seq" OWNED BY public."PayerOnCountingItem".id;


--
-- Name: PayerOnCustomCountingItemTerm; Type: TABLE; Schema: public; Owner: expend_manage_admin
--

CREATE TABLE public."PayerOnCustomCountingItemTerm" (
    id integer NOT NULL,
    "payerId" integer NOT NULL,
    "customCountingItemTermId" integer NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."PayerOnCustomCountingItemTerm" OWNER TO expend_manage_admin;

--
-- Name: PayerOnCustomCountingItemTerm_id_seq; Type: SEQUENCE; Schema: public; Owner: expend_manage_admin
--

CREATE SEQUENCE public."PayerOnCustomCountingItemTerm_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."PayerOnCustomCountingItemTerm_id_seq" OWNER TO expend_manage_admin;

--
-- Name: PayerOnCustomCountingItemTerm_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: expend_manage_admin
--

ALTER SEQUENCE public."PayerOnCustomCountingItemTerm_id_seq" OWNED BY public."PayerOnCustomCountingItemTerm".id;


--
-- Name: Payer_id_seq; Type: SEQUENCE; Schema: public; Owner: expend_manage_admin
--

CREATE SEQUENCE public."Payer_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Payer_id_seq" OWNER TO expend_manage_admin;

--
-- Name: Payer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: expend_manage_admin
--

ALTER SEQUENCE public."Payer_id_seq" OWNED BY public."Payer".id;


--
-- Name: PaymentMethod; Type: TABLE; Schema: public; Owner: expend_manage_admin
--

CREATE TABLE public."PaymentMethod" (
    id integer NOT NULL,
    code text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    name text NOT NULL,
    "payerId" integer NOT NULL
);


ALTER TABLE public."PaymentMethod" OWNER TO expend_manage_admin;

--
-- Name: PaymentMethodOnCountingItem; Type: TABLE; Schema: public; Owner: expend_manage_admin
--

CREATE TABLE public."PaymentMethodOnCountingItem" (
    id integer NOT NULL,
    "paymentMethodId" integer NOT NULL,
    "countingItemId" integer NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."PaymentMethodOnCountingItem" OWNER TO expend_manage_admin;

--
-- Name: PaymentMethodOnCountingItem_id_seq; Type: SEQUENCE; Schema: public; Owner: expend_manage_admin
--

CREATE SEQUENCE public."PaymentMethodOnCountingItem_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."PaymentMethodOnCountingItem_id_seq" OWNER TO expend_manage_admin;

--
-- Name: PaymentMethodOnCountingItem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: expend_manage_admin
--

ALTER SEQUENCE public."PaymentMethodOnCountingItem_id_seq" OWNED BY public."PaymentMethodOnCountingItem".id;


--
-- Name: PaymentMethodOnCustomCountingItemTerm; Type: TABLE; Schema: public; Owner: expend_manage_admin
--

CREATE TABLE public."PaymentMethodOnCustomCountingItemTerm" (
    id integer NOT NULL,
    "paymentMethodId" integer NOT NULL,
    "customCountingItemTermId" integer NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."PaymentMethodOnCustomCountingItemTerm" OWNER TO expend_manage_admin;

--
-- Name: PaymentMethodOnCustomCountingItemTerm_id_seq; Type: SEQUENCE; Schema: public; Owner: expend_manage_admin
--

CREATE SEQUENCE public."PaymentMethodOnCustomCountingItemTerm_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."PaymentMethodOnCustomCountingItemTerm_id_seq" OWNER TO expend_manage_admin;

--
-- Name: PaymentMethodOnCustomCountingItemTerm_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: expend_manage_admin
--

ALTER SEQUENCE public."PaymentMethodOnCustomCountingItemTerm_id_seq" OWNED BY public."PaymentMethodOnCustomCountingItemTerm".id;


--
-- Name: PaymentMethod_id_seq; Type: SEQUENCE; Schema: public; Owner: expend_manage_admin
--

CREATE SEQUENCE public."PaymentMethod_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."PaymentMethod_id_seq" OWNER TO expend_manage_admin;

--
-- Name: PaymentMethod_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: expend_manage_admin
--

ALTER SEQUENCE public."PaymentMethod_id_seq" OWNED BY public."PaymentMethod".id;


--
-- Name: User; Type: TABLE; Schema: public; Owner: expend_manage_admin
--

CREATE TABLE public."User" (
    id integer NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    email text,
    image text,
    role public."Role" DEFAULT 'USER'::public."Role" NOT NULL
);


ALTER TABLE public."User" OWNER TO expend_manage_admin;

--
-- Name: User_id_seq; Type: SEQUENCE; Schema: public; Owner: expend_manage_admin
--

CREATE SEQUENCE public."User_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."User_id_seq" OWNER TO expend_manage_admin;

--
-- Name: User_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: expend_manage_admin
--

ALTER SEQUENCE public."User_id_seq" OWNED BY public."User".id;


--
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: expend_manage_admin
--

CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE public._prisma_migrations OWNER TO expend_manage_admin;

--
-- Name: Budget id; Type: DEFAULT; Schema: public; Owner: expend_manage_admin
--

ALTER TABLE ONLY public."Budget" ALTER COLUMN id SET DEFAULT nextval('public."Budget_id_seq"'::regclass);


--
-- Name: BudgetOnCountingItem id; Type: DEFAULT; Schema: public; Owner: expend_manage_admin
--

ALTER TABLE ONLY public."BudgetOnCountingItem" ALTER COLUMN id SET DEFAULT nextval('public."BudgetOnCountingItem_id_seq"'::regclass);


--
-- Name: BudgetOnCustomCountingItemTerm id; Type: DEFAULT; Schema: public; Owner: expend_manage_admin
--

ALTER TABLE ONLY public."BudgetOnCustomCountingItemTerm" ALTER COLUMN id SET DEFAULT nextval('public."BudgetOnCustomCountingItemTerm_id_seq"'::regclass);


--
-- Name: Category id; Type: DEFAULT; Schema: public; Owner: expend_manage_admin
--

ALTER TABLE ONLY public."Category" ALTER COLUMN id SET DEFAULT nextval('public."Category_id_seq"'::regclass);


--
-- Name: CategoryOnCustomCountingItemTerm id; Type: DEFAULT; Schema: public; Owner: expend_manage_admin
--

ALTER TABLE ONLY public."CategoryOnCustomCountingItemTerm" ALTER COLUMN id SET DEFAULT nextval('public."CategoryOnCustomCountingItemTerm_id_seq"'::regclass);


--
-- Name: CountingItem id; Type: DEFAULT; Schema: public; Owner: expend_manage_admin
--

ALTER TABLE ONLY public."CountingItem" ALTER COLUMN id SET DEFAULT nextval('public."CountingItem_id_seq"'::regclass);


--
-- Name: CustomCountingItem id; Type: DEFAULT; Schema: public; Owner: expend_manage_admin
--

ALTER TABLE ONLY public."CustomCountingItem" ALTER COLUMN id SET DEFAULT nextval('public."CustomCountingItem_id_seq"'::regclass);


--
-- Name: CustomCountingItemTerm id; Type: DEFAULT; Schema: public; Owner: expend_manage_admin
--

ALTER TABLE ONLY public."CustomCountingItemTerm" ALTER COLUMN id SET DEFAULT nextval('public."CustomCountingItemTerm_id_seq"'::regclass);


--
-- Name: Expend id; Type: DEFAULT; Schema: public; Owner: expend_manage_admin
--

ALTER TABLE ONLY public."Expend" ALTER COLUMN id SET DEFAULT nextval('public."Expend_id_seq"'::regclass);


--
-- Name: Payer id; Type: DEFAULT; Schema: public; Owner: expend_manage_admin
--

ALTER TABLE ONLY public."Payer" ALTER COLUMN id SET DEFAULT nextval('public."Payer_id_seq"'::regclass);


--
-- Name: PayerOnCountingItem id; Type: DEFAULT; Schema: public; Owner: expend_manage_admin
--

ALTER TABLE ONLY public."PayerOnCountingItem" ALTER COLUMN id SET DEFAULT nextval('public."PayerOnCountingItem_id_seq"'::regclass);


--
-- Name: PayerOnCustomCountingItemTerm id; Type: DEFAULT; Schema: public; Owner: expend_manage_admin
--

ALTER TABLE ONLY public."PayerOnCustomCountingItemTerm" ALTER COLUMN id SET DEFAULT nextval('public."PayerOnCustomCountingItemTerm_id_seq"'::regclass);


--
-- Name: PaymentMethod id; Type: DEFAULT; Schema: public; Owner: expend_manage_admin
--

ALTER TABLE ONLY public."PaymentMethod" ALTER COLUMN id SET DEFAULT nextval('public."PaymentMethod_id_seq"'::regclass);


--
-- Name: PaymentMethodOnCountingItem id; Type: DEFAULT; Schema: public; Owner: expend_manage_admin
--

ALTER TABLE ONLY public."PaymentMethodOnCountingItem" ALTER COLUMN id SET DEFAULT nextval('public."PaymentMethodOnCountingItem_id_seq"'::regclass);


--
-- Name: PaymentMethodOnCustomCountingItemTerm id; Type: DEFAULT; Schema: public; Owner: expend_manage_admin
--

ALTER TABLE ONLY public."PaymentMethodOnCustomCountingItemTerm" ALTER COLUMN id SET DEFAULT nextval('public."PaymentMethodOnCustomCountingItemTerm_id_seq"'::regclass);


--
-- Name: User id; Type: DEFAULT; Schema: public; Owner: expend_manage_admin
--

ALTER TABLE ONLY public."User" ALTER COLUMN id SET DEFAULT nextval('public."User_id_seq"'::regclass);


--
-- Data for Name: Budget; Type: TABLE DATA; Schema: public; Owner: expend_manage_admin
--

COPY public."Budget" (id, code, "createdAt", "updatedAt", name) FROM stdin;
1	shared	2023-11-09 05:02:37.813	2023-11-09 05:02:37.813	共同支出
2	akihiro	2023-11-09 05:02:37.813	2023-11-09 05:02:37.813	明弘個人
3	risa	2023-11-09 05:02:37.813	2023-11-09 05:02:37.813	李沙個人
\.


--
-- Data for Name: BudgetOnCountingItem; Type: TABLE DATA; Schema: public; Owner: expend_manage_admin
--

COPY public."BudgetOnCountingItem" (id, "budgetId", "countingItemId", "createdAt", "updatedAt") FROM stdin;
1	1	1	2023-11-09 05:02:54.123	2023-11-09 05:02:54.123
2	1	2	2023-11-09 05:02:56.007	2023-11-09 05:02:56.007
\.


--
-- Data for Name: BudgetOnCustomCountingItemTerm; Type: TABLE DATA; Schema: public; Owner: expend_manage_admin
--

COPY public."BudgetOnCustomCountingItemTerm" (id, "budgetId", "customCountingItemTermId", "createdAt", "updatedAt") FROM stdin;
1	2	1	2023-11-09 05:02:39.1	2023-11-09 05:02:39.1
2	2	2	2023-11-09 05:02:41.781	2023-11-09 05:02:41.781
3	1	3	2023-11-09 05:02:41.781	2023-11-09 05:02:41.781
4	1	4	2023-11-09 05:02:45.273	2023-11-09 05:02:45.273
5	1	5	2023-11-09 05:02:48.167	2023-11-09 05:02:48.167
6	1	6	2023-11-09 05:02:50.449	2023-11-09 05:02:50.449
7	1	7	2023-11-09 05:02:50.449	2023-11-09 05:02:50.449
8	3	8	2023-11-09 05:02:50.449	2023-11-09 05:02:50.449
\.


--
-- Data for Name: Category; Type: TABLE DATA; Schema: public; Owner: expend_manage_admin
--

COPY public."Category" (id, code, "createdAt", "updatedAt", name, "limit") FROM stdin;
1	food	2023-11-09 05:02:37.492	2023-11-09 05:02:37.492	食費	0
2	goods	2023-11-09 05:02:37.492	2023-11-09 05:02:37.492	雑貨	0
3	personal	2023-11-09 05:02:37.492	2023-11-09 05:02:37.492	お小遣い	0
4	others	2023-11-09 05:02:37.492	2023-11-09 05:02:37.492	その他	0
5	savings	2023-11-09 05:02:37.492	2023-11-09 05:02:37.492	貯金	0
6	travel	2023-11-09 05:02:37.492	2023-11-09 05:02:37.492	旅行	0
7	event	2023-11-09 05:02:37.492	2023-11-09 05:02:37.492	イベント	0
8	monthly	2023-11-09 05:02:37.492	2023-11-09 05:02:37.492	毎月	0
9	electric	2023-11-09 05:02:37.492	2023-11-09 05:02:37.492	電気代	0
10	utility	2023-11-09 05:02:37.492	2023-11-09 05:02:37.492	水道ガス	0
11	chibagin	2023-11-09 05:02:37.492	2023-11-09 05:02:37.492	ちばぎん	0
12	car	2023-12-02 12:40:43.465	2023-12-02 12:40:43.465	自動車維持費	0
\.


--
-- Data for Name: CategoryOnCustomCountingItemTerm; Type: TABLE DATA; Schema: public; Owner: expend_manage_admin
--

COPY public."CategoryOnCustomCountingItemTerm" (id, "categoryId", "customCountingItemTermId", "createdAt", "updatedAt") FROM stdin;
1	3	1	2023-11-09 05:02:39.1	2023-11-09 05:02:39.1
2	3	2	2023-11-09 05:02:41.781	2023-11-09 05:02:41.781
3	3	3	2023-11-09 05:02:41.781	2023-11-09 05:02:41.781
4	10	4	2023-11-09 05:02:45.273	2023-11-09 05:02:45.273
5	9	4	2023-11-09 05:02:45.273	2023-11-09 05:02:45.273
6	8	4	2023-11-09 05:02:45.273	2023-11-09 05:02:45.273
7	7	4	2023-11-09 05:02:45.273	2023-11-09 05:02:45.273
8	6	4	2023-11-09 05:02:45.273	2023-11-09 05:02:45.273
9	5	4	2023-11-09 05:02:45.273	2023-11-09 05:02:45.273
10	4	4	2023-11-09 05:02:45.273	2023-11-09 05:02:45.273
11	2	4	2023-11-09 05:02:45.273	2023-11-09 05:02:45.273
12	1	4	2023-11-09 05:02:45.273	2023-11-09 05:02:45.273
13	10	5	2023-11-09 05:02:48.167	2023-11-09 05:02:48.167
14	9	5	2023-11-09 05:02:48.167	2023-11-09 05:02:48.167
15	8	5	2023-11-09 05:02:48.167	2023-11-09 05:02:48.167
16	7	5	2023-11-09 05:02:48.167	2023-11-09 05:02:48.167
17	6	5	2023-11-09 05:02:48.167	2023-11-09 05:02:48.167
18	5	5	2023-11-09 05:02:48.167	2023-11-09 05:02:48.167
19	4	5	2023-11-09 05:02:48.167	2023-11-09 05:02:48.167
20	2	5	2023-11-09 05:02:48.167	2023-11-09 05:02:48.167
21	1	5	2023-11-09 05:02:48.167	2023-11-09 05:02:48.167
22	3	6	2023-11-09 05:02:50.449	2023-11-09 05:02:50.449
23	3	7	2023-11-09 05:02:50.449	2023-11-09 05:02:50.449
24	3	8	2023-11-09 05:02:50.449	2023-11-09 05:02:50.449
25	12	4	2023-12-02 12:57:35.847	2023-12-02 12:57:02.356
\.


--
-- Data for Name: CountingItem; Type: TABLE DATA; Schema: public; Owner: expend_manage_admin
--

COPY public."CountingItem" (id, "createdAt", "updatedAt", name, code, processed) FROM stdin;
1	2023-11-09 05:02:54.123	2023-11-09 05:02:54.123	共同支出（明弘支払）	shared-akihiro	{t,f}
2	2023-11-09 05:02:56.007	2023-11-09 05:02:56.007	共同支出（李沙支払）	shared-risa	{t,f}
\.


--
-- Data for Name: CustomCountingItem; Type: TABLE DATA; Schema: public; Owner: expend_manage_admin
--

COPY public."CustomCountingItem" (id, "createdAt", "updatedAt", name, code) FROM stdin;
1	2023-11-09 05:02:39.1	2023-11-09 05:02:39.1	明弘個人お小遣い	akihiro-personal
2	2023-11-09 05:02:41.781	2023-11-09 05:02:41.781	明弘お小遣い合計	akihiro-total
3	2023-11-09 05:02:45.273	2023-11-09 05:02:45.273	月次精算用（明弘）	monthly-akihiro
4	2023-11-09 05:02:48.167	2023-11-09 05:02:48.167	月次精算用（李沙）	monthly-risa
5	2023-11-09 05:02:50.449	2023-11-09 05:02:50.449	李沙→明弘	risa-to-akihiro
\.


--
-- Data for Name: CustomCountingItemTerm; Type: TABLE DATA; Schema: public; Owner: expend_manage_admin
--

COPY public."CustomCountingItemTerm" (id, sign, coefficient, "customCountingItemId", processed) FROM stdin;
1	PLUS	1	1	{t,f}
2	PLUS	1	2	{t,f}
3	PLUS	0.5	2	{t,f}
4	PLUS	1	3	{t,f}
5	PLUS	1	4	{t,f}
6	PLUS	0.5	5	{t,f}
7	MINUS	0.5	5	{t,f}
8	PLUS	1	5	{f}
\.


--
-- Data for Name: Expend; Type: TABLE DATA; Schema: public; Owner: expend_manage_admin
--

COPY public."Expend" (id, "createdAt", "updatedAt", price, description, date, "categoryId", "payerId", "budgetId", "paymentMethodId", processed) FROM stdin;
1165	2023-11-09 10:43:48.316	2023-11-09 10:43:48.316	555	7	2023-11-09	3	1	2	1	f
1166	2023-11-09 12:53:45.828	2023-11-09 12:53:45.828	384	ローソン	2023-11-09	3	1	1	1	f
2	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	194	イオン：チーズ	2022-12-03	3	1	2	1	f
3	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	3834	イオン：食材	2022-12-03	1	1	1	1	f
4	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	129	７：ドーナツ	2022-12-01	3	1	2	1	f
5	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	129	７：ドーナツ	2022-12-02	3	1	2	1	f
6	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	484	７：よる	2022-12-01	3	1	2	1	f
7	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	876	７：よる二人	2022-12-02	3	1	1	1	f
8	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	300	veloce	2022-12-04	3	1	2	1	f
9	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	600	すぎむらクリニック	2022-12-03	4	2	1	4	f
10	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1090	イオン処方箋：李沙お薬	2022-12-04	4	1	1	1	f
11	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	987	マツキヨ：ウェットシートとか	2022-12-04	2	1	1	1	f
12	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1407	角上：食材	2022-12-03	1	1	1	1	f
13	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	220	【結婚式】seria: イーゼル	2022-12-03	5	1	1	1	f
14	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	456	イオンネット：食材	2022-12-01	1	1	1	1	f
15	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	8620	イオンネット：01	2022-12-01	2	1	1	1	f
16	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	257	イオン：リビングクリーナー	2022-12-04	2	1	1	1	f
17	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	736	イオン：食材調味料	2022-12-04	1	1	1	1	f
18	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	84	イオン：黒糖まんじゅう	2022-12-04	3	1	2	1	f
19	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	321	７：ごま油	2022-12-04	1	1	1	1	f
20	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	470	７：よるおやつ	2022-12-06	3	1	1	1	f
21	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	159	７：エクレア	2022-12-07	3	1	2	1	f
22	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	129	７：ドーナツ	2022-12-07	3	1	2	1	f
23	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	276	ヨーカドー：おやつ	2022-12-08	3	1	1	1	f
24	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	230	ソーロン：よる	2022-12-08	3	1	2	1	f
25	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	198	ヨーカドー：キッチンペーパー	2022-12-10	2	1	1	1	f
26	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	110	daiso: 菜箸	2022-12-10	2	1	1	1	f
27	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	4664	利休：牛タン	2022-12-10	3	1	1	1	f
28	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	276	７：水とどらやき	2022-12-10	3	1	1	1	f
29	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	3881	ニトリ：フライパンとかスリッパとか色々	2022-12-10	4	1	1	1	f
30	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	990	【結婚式】ユニクロ：白ヒートテック	2022-12-10	5	1	1	1	f
31	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	658	ミスド	2022-12-10	3	1	1	1	f
32	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	3671	イオン：食材	2022-12-10	1	1	1	1	f
33	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	2058	角上：食材	2022-12-10	1	1	1	1	f
34	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	555	イオン：夕飯	2022-12-09	3	1	2	1	f
35	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1299	amazon: PCスタンド	2022-12-06	3	1	2	1	f
36	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	500	suica	2022-12-10	3	1	2	1	f
37	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1000	７：v	2022-12-09	3	1	2	1	f
38	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	0	【メモ】「毎月」支払いを登録する	2022-12-31	8	1	1	1	f
39	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	691	カルディ：豆	2022-12-11	1	1	1	1	f
40	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	612	イオン：おやつとか	2022-12-11	3	1	1	1	f
41	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	113	イオン：おやつ	2022-12-11	3	1	2	1	f
42	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	740	【結婚式】ヤマト：ダンボール	2022-12-11	5	1	1	1	f
43	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	530	すぎむらクリニック	2022-12-11	4	2	1	4	f
44	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1430	スタバ：マグ（李沙に現金お渡し済み）	2022-12-11	3	1	2	3	f
45	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	393	イオン：食材	2022-12-08	1	1	1	2	f
46	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	150	【結婚式】無印：封筒	2022-12-11	5	1	1	2	f
47	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	9834	美容室：明弘	2022-12-11	4	1	1	1	f
48	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	280	７：よる	2022-12-11	3	1	2	1	f
49	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	407	７：よる	2022-12-12	3	1	2	1	f
50	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1000	財布のお礼	2022-12-12	3	1	2	3	f
51	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1140	電車切符代（新宿往復）	2022-12-09	3	1	2	3	f
52	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	110	【結婚式】seria: プレゼント袋	2022-12-17	5	1	1	1	f
53	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	4510	クリーニング	2022-12-11	4	1	1	2	f
54	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	2272	イオン：食材	2022-12-17	1	1	1	1	f
55	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	2151	【結婚式】イオン：なのちゃんおやつプレゼント	2022-12-17	5	1	1	1	f
56	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	691	イオン：食材	2022-12-12	1	1	1	2	f
57	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	522	イオン：食材	2022-12-13	1	1	1	2	f
58	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	330	【結婚式】seria: 梱包材	2022-12-17	5	1	1	1	f
59	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	581	７：よる二人	2022-12-16	3	1	1	1	f
60	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	226	７：デザート	2022-12-17	3	1	2	1	f
61	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	150	７：よる	2022-12-15	3	1	2	1	f
62	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	2848	【結婚式】amazon: eneloop	2022-12-11	5	1	1	1	f
63	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	3376	【結婚式】ヤマト運輸（小物集荷）	2022-12-18	5	1	1	1	f
64	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1026	イオン：食材	2022-12-18	1	1	1	2	f
65	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	5500	李沙美容院	2022-12-18	4	1	1	2	f
66	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	237	７：昼	2022-12-22	3	1	2	1	f
67	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	348	７：よる	2022-12-20	3	1	2	1	f
68	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	540	７：昼	2022-12-20	3	1	2	1	f
69	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	537	７：よる	2022-12-19	3	1	2	1	f
1167	2023-11-09 23:46:47.746	2023-11-09 23:46:47.746	500	Suica	2023-11-03	3	1	2	1	f
70	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	302	７：よる	2022-12-18	3	1	2	1	f
71	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	583	イオン：食材	2022-12-20	1	1	1	1	f
72	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	339	イオン：よる	2022-12-21	3	1	2	1	f
73	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	723	イオン：よる	2022-12-22	3	1	2	1	f
74	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	7590	【結婚式】李沙エステ	2022-12-23	5	1	1	2	f
75	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	7150	【結婚式】李沙美容院	2022-12-23	5	1	1	2	f
76	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	3080	化粧品	2022-12-23	2	1	1	2	f
77	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1334	イオン：食材	2022-12-13	1	1	1	1	f
78	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	606	イオン：食材	2022-12-14	1	1	1	1	f
79	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	222	イオン：よる	2022-12-16	3	1	2	1	f
80	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1458	丸仁: おみやげしょうがとか	2022-12-17	4	1	1	3	f
81	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1300	梅園: あんみつとか	2022-12-17	3	1	1	3	f
82	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	250	花月堂: メロンパン	2022-12-17	3	1	1	3	f
83	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	2310	やげん堀: お土産七味	2022-12-17	4	1	1	1	f
84	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	333	【結婚式】seria: 緩衝材	2022-12-17	5	1	1	1	f
85	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	700	銀だこ	2022-12-17	1	1	1	1	f
86	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1415	イオン：食材	2022-12-23	1	1	1	1	f
87	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	227	７: ココア	2022-12-19	3	1	2	1	f
88	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1175	イオン：食材	2022-12-18	1	1	1	1	f
89	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1020	KFC	2022-12-27	3	1	2	1	f
90	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	2310	【結婚式】ラウンジデザート	2022-12-24	5	1	1	1	f
91	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	4760	【結婚式】アウトレットランチ	2022-12-24	5	1	1	1	f
92	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	884	【結婚式】東京駅パン屋コーヒー	2022-12-24	5	1	1	1	f
93	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	3888	【結婚式】軽井沢駅お土産	2022-12-24	5	1	1	1	f
94	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	2740	【結婚式】タクシー	2022-12-24	5	1	1	1	f
95	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	701	【結婚式】sawamura ベーカリー	2022-12-24	5	1	1	1	f
96	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	367	【結婚式】丸山珈琲	2022-12-24	5	1	1	1	f
97	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	944	【結婚式】東京駅パン	2022-12-24	5	1	1	1	f
98	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	393	【結婚式】ハルニレイタリアン（7,000はクーポン）	2022-12-24	5	1	1	1	f
99	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1020	【結婚式】sawamura夜パン（1,000はクーポン）	2022-12-25	5	1	1	1	f
100	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	840	【結婚式】トンボの湯の隣：プリン	2022-12-25	5	1	1	1	f
101	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	8660	【結婚式】hoshinoタンブラー	2022-12-26	5	1	1	1	f
102	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	117	newdays: お水	2022-12-26	5	1	1	1	f
103	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	291	７：お昼	2022-12-27	3	1	2	1	f
104	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	4741	ラスクお土産	2022-12-28	4	1	1	1	f
105	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1322	イオン：01	2022-12-28	2	1	1	1	f
106	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1401	不二家: ケーキ	2022-12-28	3	1	1	1	f
107	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	3759	諏訪湖SA: アップルパイとか	2022-12-31	4	1	1	1	f
108	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1554	misdo	2022-12-29	4	1	1	1	f
109	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	5070	【結婚式】ヤマト着払い	2022-12-28	5	1	1	1	f
110	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	2150	落花生土産	2022-12-28	4	1	1	1	f
111	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	246	7: 昼ごはん	2022-12-27	3	1	2	1	f
112	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	517	【結婚式】女の子グッズとか	2022-12-24	5	1	1	1	f
113	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	5616	【結婚式】職場お土産toka	2022-12-24	5	1	1	1	f
114	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	5616	【結婚式】職場お土産toka	2022-12-24	5	1	1	1	f
115	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1965	7: 甘いものいっぱい	2022-12-26	3	1	1	1	f
116	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	492	ジョイフル：くるりおもちゃ	2022-12-31	4	1	1	1	f
117	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	3250	【結婚式】李沙美容室	2022-12-28	5	1	1	2	f
118	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	602	ヨーカドー：おでん	2022-12-28	1	1	1	2	f
119	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	4682	イオン：00	2022-12-28	1	1	1	2	f
120	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	670	【結婚式】軽井沢駅: おやつ	2022-12-26	5	1	1	2	f
121	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1930	ドトール	2022-12-29	4	1	1	1	f
122	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	8778	ヤマダ電機：ホームベーカリー	2023-01-02	3	1	1	1	f
123	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1779	角上：寿司とか	2023-01-01	1	1	1	1	f
124	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	2376	イオン：食材とか	2023-01-01	1	1	1	1	f
125	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1993	角上：食材	2023-01-02	1	1	1	1	f
126	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	2583	イオン：食材	2023-01-02	1	1	1	1	f
127	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	406	イオン：マヨとか	2023-01-02	1	1	1	1	f
128	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1073	amazon: 花瓶	2023-01-03	4	1	1	1	f
129	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	5491	amazon: amp	2023-01-03	11	1	2	1	f
130	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	678	7: デザート	2023-01-03	3	1	1	1	f
131	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	3300	panasonic: オーブン角皿	2023-01-08	4	1	1	1	f
132	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1500	【結婚式】スタバ：李沙お礼	2023-01-03	5	1	1	2	f
133	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	577	７：食材	2023-01-03	1	1	1	2	f
134	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1600	イオン：食材（パン）	2023-01-07	1	1	1	2	f
135	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	440	キタムラ：結婚式写真	2023-01-02	4	1	1	2	f
136	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	691	カルディ豆	2023-01-08	1	1	1	1	f
137	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	3300	【結婚式】lindt: 李沙お礼	2023-01-03	5	1	1	2	f
138	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1099	島村楽器：弦とピック	2023-01-02	11	1	2	1	f
139	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	2500	GU: デニム	2023-01-02	11	1	2	1	f
140	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	419	ヨーカドー：五線譜ノートとか	2023-01-03	3	1	2	1	f
141	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1342	ヨーカドー：software design	2023-01-03	11	1	2	1	f
142	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	509	イオン：夕飯	2023-01-05	3	1	2	1	f
143	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1586	イオン：食材	2023-01-08	1	1	1	1	f
144	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	661	ミスド	2023-01-08	3	1	2	1	f
145	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	994	イオン：食材	2023-01-08	1	1	1	1	f
146	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	138	７：ガム	2023-01-07	3	1	2	1	f
147	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1203	７：昼	2023-01-07	3	1	2	1	f
148	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	204	ローソン：よる	2023-01-06	3	1	2	1	f
149	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	462	７：昼	2023-01-06	3	1	2	1	f
150	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	577	イオン：夕飯	2023-01-09	3	1	2	1	f
151	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	2300	島村楽器: シールド	2023-01-09	3	1	2	1	f
152	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	14355	GLOBAL WORK: 服	2023-01-09	3	1	1	1	f
153	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	581	７：よる	2023-01-09	3	1	2	1	f
154	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	610	７：昼	2023-01-11	3	1	2	1	f
155	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	548	７：よる	2023-01-11	3	1	2	1	f
156	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	409	７：よる	2023-01-12	3	1	2	1	f
157	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	451	７：デザート	2023-01-14	3	1	1	1	f
158	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	642	７：お昼	2023-01-15	3	1	1	1	f
159	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1100	佐世保バーガー	2023-01-13	3	1	2	1	f
160	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	5331	イオン：食材	2023-01-14	1	1	1	1	f
161	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	319	イオン：よる	2023-01-13	3	1	2	1	f
162	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	7731	電気代	2022-12-31	9	1	1	1	f
163	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	7660	電気代	2023-01-15	9	1	1	1	f
164	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	6829	水道ガス（2月支払い）（口座引落）	2023-01-31	10	1	1	3	f
165	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	10685	水道ガス	2022-12-31	10	1	1	1	f
166	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	127	イオン：おやつ	2023-01-12	3	1	2	1	f
167	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	619	イオン：小褒美	2023-01-15	3	1	1	1	f
168	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1200	 ７：v	2023-01-01	11	1	2	1	f
169	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	7118	【結婚式】かをりおばちゃんにお礼	2023-01-21	5	1	1	1	f
170	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	8042	【結婚式】弘子おばちゃんと礼子おばちゃんにお礼	2023-01-21	5	1	1	1	f
171	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	5388	TOMIZ製菓店	2023-01-21	4	1	1	1	f
172	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1238	スタバ	2023-01-21	3	1	1	1	f
173	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	522	7: よる	2023-01-21	3	1	2	1	f
174	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1009	7: よる	2023-01-17	3	1	2	1	f
175	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	6500	飲み会	2023-01-17	11	1	2	1	f
176	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	3361	角上：食材	2023-01-21	1	1	1	1	f
177	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	265	イオン：よる	2023-01-19	3	1	2	1	f
178	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	509	イオン：昼	2023-01-19	3	1	2	1	f
179	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	162	７：朝	2023-01-13	3	1	2	1	f
180	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1766	イオン：めぐすりスプレーマスク	2023-01-15	2	1	1	1	f
181	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	224	イオン：よる	2023-01-16	3	1	2	1	f
182	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1250	TOMIZ: パン材料	2023-01-13	1	1	1	2	f
183	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	500	イオン：はちみつとソーセージ	2023-01-19	1	1	1	2	f
184	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1666	クリーニング	2023-01-09	4	1	1	2	f
185	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	390	無印: 化粧液	2023-01-09	2	1	1	2	f
186	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	3600	【結婚式】ネイル落とし	2023-01-09	5	1	1	2	f
187	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	4900	amazon prime 年会費	2023-01-27	11	1	2	1	f
188	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	508	イオン：夜	2023-01-20	3	1	2	1	f
189	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	355	イオン：塩とアイス	2023-01-22	1	1	1	1	f
190	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	4641	イオン：食材	2023-01-21	1	1	1	1	f
191	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1760	daiso: ゴミ袋とか	2023-01-22	2	1	1	1	f
192	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	235	7: キャベツカニカマ	2023-01-22	1	1	1	1	f
193	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	233	イオン：夜	2023-01-24	3	1	2	1	f
194	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	980	7: v	2023-01-01	11	1	2	1	f
195	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	132	ローソン：galbo	2023-01-28	3	1	2	1	f
196	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1210	shapo市川 geroge's: 丸太のコースター	2023-01-28	3	1	1	1	f
197	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1350	あるでん亭: ランチ	2023-01-27	3	1	2	1	f
198	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1446	７：よる	2023-01-25	3	1	2	1	f
199	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1032	７：あさ	2023-01-25	3	1	2	1	f
200	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	4532	イオン：食材	2023-01-28	1	1	1	1	f
201	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	159	イオン：よる	2023-01-26	3	1	2	1	f
202	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	2580	モンペリエ：ケーキ	2023-01-28	3	1	1	1	f
203	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	285	浅草あんぱん	2023-01-28	3	1	1	1	f
204	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	3091	浅草モンブラン：ハンバーグ	2023-01-28	3	1	1	1	f
205	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	468	カルディ豆	2023-01-22	1	1	1	1	f
206	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	97	イオン：よる	2023-01-22	3	1	2	1	f
207	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	434	イオン：よる	2023-01-23	3	1	2	1	f
208	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	149	７：あさ	2023-01-27	3	1	2	1	f
209	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	6700	イオンネット：01	2023-01-26	2	1	1	1	f
210	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	2878	ニトリ：スキレット	2023-01-29	4	1	1	1	f
211	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1090	イオン：二人お昼	2023-01-29	1	1	1	1	f
212	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	480	veloce	2023-01-29	3	1	2	1	f
213	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	712	イオン：夜ご飯	2023-02-02	3	1	2	1	f
214	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	20880	楽天payチャージ：クラプトン	2023-02-02	11	1	2	1	f
215	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1084	７：朝	2023-02-01	3	1	2	1	f
216	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	804	７：夜	2023-02-01	3	1	2	1	f
217	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	194	７：朝	2023-01-31	3	1	2	1	f
218	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	656	７：デザート	2023-02-03	3	1	1	1	f
219	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1034	７：よる	2023-02-03	3	1	2	1	f
220	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	800	７：よる	2023-02-03	3	1	2	1	f
221	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	480	veloce	2023-02-03	3	1	2	1	f
222	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	2160	大戸屋	2023-02-11	3	1	1	1	f
223	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	725	famima: 小褒美	2023-02-08	3	1	1	1	f
224	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1025	７: 朝昼	2023-02-08	3	1	2	1	f
225	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	150	７：夜	2023-02-07	3	1	2	1	f
226	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	362	７：夜	2023-02-06	3	1	2	1	f
227	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	582	ローソン：デザート	2023-02-05	3	1	1	1	f
228	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	4732	イオン：食材	2023-02-11	1	1	1	1	f
229	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1228	カルディ	2023-02-11	1	1	1	1	f
230	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1584	イオン：食材	2023-02-04	1	1	1	1	f
231	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1213	イオン：食材	2023-02-04	1	1	1	1	f
232	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	2215	ヴァンローゼ	2023-02-05	4	1	1	1	f
233	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1083	マツキヨ：マスクとメイク落とし	2023-02-04	2	1	1	2	f
234	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	424	イオン：食材	2023-02-04	1	1	1	2	f
235	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1225	角上：食材	2023-02-04	1	1	1	2	f
236	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	203	イオン：01	2023-02-11	2	1	1	1	f
237	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1100	TSUTAYA: nisa	2023-02-11	3	1	1	1	f
238	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1342	TSUTAYA: software design	2023-02-11	3	1	2	1	f
239	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1782	nintendo: ゼルダ追加DLC	2023-02-10	3	1	2	1	f
240	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	480	veloce	2023-02-12	3	1	2	1	f
241	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1729	イオン：調味用とか	2023-02-12	1	1	1	1	f
242	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	550	イオン：お昼（793）	2023-02-12	3	1	2	1	f
243	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	200	イオン：うどんとはんぺん（793）	2023-02-12	1	1	1	1	f
244	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	565	イオン：昼	2023-02-13	3	1	2	1	f
245	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	345	７：朝	2023-02-13	3	1	2	1	f
246	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	999	トイザらス	2023-02-18	4	1	1	1	f
247	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	654	織りなす錦糸町：目薬	2023-02-18	2	1	1	1	f
248	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	133	７：コンタクト	2023-02-18	2	1	1	1	f
249	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	480	ソラマチ：コーヒー	2023-02-18	3	1	1	1	f
250	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	544	famima: アイスおやつ	2023-02-18	3	1	1	1	f
251	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	500	suica	2023-02-18	3	1	2	1	f
252	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	3000	麺魚	2023-02-18	3	2	1	4	f
253	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	547	イオン：弁当の箸	2023-02-14	2	1	1	2	f
254	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1360	すぎむらクリニック：李沙薬	2023-02-19	4	1	1	2	f
255	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	663	イオン：食材	2023-02-19	1	1	1	1	f
256	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	2883	イオン：食材	2023-02-18	1	1	1	1	f
257	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1410	イオン：李沙にぷちバレンタイン	2023-02-14	3	1	2	1	f
258	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	600	すぎむらクリニック：診察台	2023-02-19	4	2	1	4	f
259	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	24040	新幹線：京都→東京	2023-02-19	6	2	1	4	f
260	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	27940	新幹線：東京→京都	2023-02-19	6	2	1	4	f
261	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	498	イオン：おやつ	2023-02-19	3	1	1	1	f
262	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	360	イオン：おやつ	2023-02-16	3	1	2	1	f
263	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	116	イオン：おやつ	2023-02-10	3	1	2	1	f
264	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	235	7: 夜キャベツ	2023-02-20	3	1	2	1	f
265	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	480	veloce	2023-02-19	3	1	2	1	f
266	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1800	udemy: webGL	2023-02-22	3	1	2	1	f
267	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1000	7: mv	2023-02-22	3	1	2	1	f
268	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1061	7: 朝昼	2023-02-22	3	1	2	1	f
269	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	332	7: よる	2023-02-21	3	1	2	1	f
270	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	606	イオン：夜	2023-02-17	1	1	2	1	f
271	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	254	イオン：二人アイス	2023-02-23	3	1	1	1	f
272	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	78	イオン：おやつ	2023-02-20	3	1	2	1	f
273	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	8789	ABC-mart: 誕生日靴	2023-02-25	4	1	1	1	f
274	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	2593	イオン：食材	2023-02-25	1	1	1	1	f
275	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1231	角上	2023-02-25	1	1	1	1	f
276	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1151	イオン：食材（カレー）	2023-02-23	3	1	2	1	f
277	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	2014	スタバ	2023-02-25	3	1	1	1	f
278	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	613	７：朝	2023-02-24	3	1	2	1	f
279	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	706	７：よる	2023-02-23	3	1	2	1	f
280	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	360	７：昼	2023-02-23	3	1	2	1	f
281	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1061	７：朝	2023-02-22	3	1	2	1	f
282	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	2028	イオン：食材	2023-02-25	1	1	1	1	f
283	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	8789	ABC-mart: 誕生日靴李沙	2023-02-26	4	1	1	2	f
284	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	923	krispy kreme	2023-02-26	3	1	1	1	f
285	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	427	イオン：アイス	2023-02-26	3	1	1	1	f
286	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	2020	イオン：李沙の薬	2023-02-28	4	1	1	2	f
287	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1090	さきたに内科	2023-02-28	4	2	1	4	f
288	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	11000	globalwork: スキニー	2023-02-28	11	1	2	1	f
289	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	5980	gu online: スキニー	2023-02-28	11	1	2	1	f
290	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1389	セブン：昼ごはん	2023-02-26	1	1	1	1	f
291	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	360	イオン：夜	2023-03-01	3	1	2	1	f
292	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	13000	賃貸保証契約（千葉銀から立替）	2023-03-01	5	1	1	3	f
293	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	86	イオン：おやつ	2023-03-02	3	1	2	1	f
294	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	200	たいやき	2023-03-02	3	1	2	1	f
295	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	591	イオン：バックハンガー	2023-02-25	3	1	2	1	f
296	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	657	イオン：ブリーズライト	2023-02-25	4	1	1	1	f
297	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	500	suica	2023-02-26	3	1	2	1	f
298	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	550	amazon: 麻袋	2023-03-03	3	1	1	1	f
299	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	600	アウトレット：ネギ塩ダレ（大体600円くらい）	2023-03-04	3	1	1	1	f
300	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	470	夢牧場：ソフト	2023-03-04	3	1	1	1	f
301	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	7786	Urban Research: 服	2023-03-04	3	1	2	1	f
302	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	4501	アウトレット：パンケーキ	2023-03-04	3	1	1	1	f
303	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	13860	BEAMS: 服2（32,615）	2023-03-03	3	1	2	1	f
304	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	425	イオン：夕飯	2023-03-03	3	1	2	1	f
305	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	9580	水道ガス下水	2023-02-28	10	1	1	5	f
306	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	588	famima: アイス	2023-03-05	3	1	1	1	f
307	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	3451	イオン：食材	2023-03-05	1	1	1	1	f
308	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	657	イオン：ブリーズライト	2023-03-08	2	1	1	1	f
309	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	360	イオン：夜	2023-03-08	3	1	2	1	f
310	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	172	イオン：アイス	2023-03-08	3	1	1	1	f
311	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1040	７：朝	2023-03-08	3	1	2	1	f
312	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	360	７：デザート	2023-03-07	3	1	1	1	f
313	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	127	イオン：おやつ	2023-03-10	3	1	2	1	f
314	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	600	７：デザート	2023-03-10	3	1	1	1	f
315	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	552	王将：餃子テイクアウト	2023-03-11	1	1	1	1	f
316	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	8250	明弘美容院	2023-03-11	4	1	1	1	f
317	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1398	イオン：食材	2023-03-11	1	1	1	1	f
318	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	5850	ORiental TRaffic: 式参列パンプス	2023-03-11	4	1	1	1	f
319	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	10157	ららぽ: URセール3点	2023-03-11	3	1	2	1	f
320	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	2760	ららぽ: 四六時中ランチ	2023-03-11	1	1	1	1	f
321	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	305	ヨーカドー：おやつ	2023-03-11	3	1	1	1	f
322	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1600	amazon: 調味料入れ	2023-03-13	4	1	1	1	f
323	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	2328	【結婚式】shapo船橋 harada: お返しグーテ	2023-03-12	5	1	1	2	f
324	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	568	イオン：食材	2023-03-12	1	1	1	1	f
325	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	2182	ふなばし生鮮市場: 食材	2023-03-12	1	1	1	1	f
326	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	3000	7: mv	2023-03-01	3	1	2	1	f
327	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1000	7: mv	2023-03-01	3	1	2	1	f
328	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	666	カルディ：豆と塩	2023-03-12	1	1	1	1	f
329	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	8000	李沙コート代	2023-03-03	4	1	1	1	f
330	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	3125	ヨーカドー: 雑貨	2023-03-05	2	1	1	2	f
331	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	10755	BEAMS: 李沙服3（32,615）NOTE: コート代は貯金から	2023-03-03	3	1	3	1	f
332	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	504	イオン：食材	2023-02-28	1	1	1	2	f
333	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	8408	電気代	2023-02-28	9	1	1	1	f
334	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	7230	アットコンタクト	2023-03-13	4	1	1	1	f
335	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	776	7: 夜おやつ	2023-03-12	3	1	1	1	f
336	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	172	イオン：チョコパイ	2023-03-02	3	1	1	2	f
337	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	343	ローソン：卵	2023-03-05	1	1	1	2	f
338	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	2576	イオン：食材	2023-03-12	1	1	1	2	f
339	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	30690	李沙の参列ドレスとバッグ	2023-03-11	5	1	1	2	f
340	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	750	すぎむらクリニック：李沙薬	2023-03-12	4	1	1	2	f
341	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	900	７：朝昼	2023-03-15	3	1	2	1	f
342	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	501	イオン：食材	2023-03-16	1	1	1	1	f
343	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	237	7: 昼ごはん	2023-03-17	3	1	2	1	f
344	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	354	7 ブラウニー	2023-03-16	3	1	2	1	f
345	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	10213	京都2泊	2023-03-15	6	1	1	1	f
346	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	2530	すぎむらクリニック：李沙薬	2023-03-15	4	1	1	1	f
347	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	570	7: ひる	2023-03-17	3	1	2	1	f
348	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	983	大丸: 穴子寿司	2023-03-17	6	1	1	1	f
349	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	894	大丸　李沙サラダ	2023-03-17	6	1	1	1	f
350	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	2660	小川珈琲モーニング	2023-03-18	6	1	1	1	f
351	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1000	地蔵院2人	2023-03-18	6	1	1	3	f
352	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1000	鈴虫寺	2023-03-18	6	1	1	3	f
353	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	300	南禅寺御朱印	2023-03-19	6	2	1	4	f
354	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	453	大丸お土産	2023-03-19	6	1	1	1	f
355	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	704	7: おやつ	2023-03-20	3	1	1	1	f
356	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	896	大丸　お土産おかき	2023-03-17	6	1	1	1	f
357	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1228	大丸　アスパラサラダ	2023-03-17	6	1	1	1	f
358	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	276	newdaysおやつ	2023-03-17	6	1	1	1	f
359	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	2000	Suica	2023-03-18	6	1	1	1	f
360	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	821	京都夜デザート	2023-03-18	6	1	1	1	f
361	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	500	Suica	2023-03-19	6	1	1	1	f
362	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	170	よもぎ餅	2023-03-19	6	1	1	3	f
363	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	648	錦市場田楽	2023-03-19	6	2	1	4	f
364	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1200	大丸お土産	2023-03-19	6	1	1	1	f
365	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	540	大丸お土産	2023-03-19	6	1	1	1	f
366	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	617	大丸　李沙カルパッチョ	2023-03-17	6	1	1	1	f
367	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	2000	御朱印と手帳	2023-03-18	6	1	1	3	f
368	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1000	鈴虫寺御守	2023-03-18	6	1	1	3	f
369	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1835	進々堂パン	2023-03-19	6	1	1	1	f
370	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	518	7: あさ	2023-03-20	3	1	2	1	f
371	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	255	newdays水	2023-03-17	6	1	1	1	f
372	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	800	ホテルフロント	2023-03-17	6	1	1	1	f
373	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1200	南禅寺方丈	2023-03-19	6	1	1	3	f
374	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	450	八つ橋	2023-03-19	6	1	1	3	f
375	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	126	ポケットティッシュ	2023-03-19	6	1	1	1	f
376	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1662	大丸お土産	2023-03-19	6	1	1	1	f
377	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	13330	楽天Pay穣に支払い（昼夜飯	2023-03-19	6	1	1	1	f
378	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	108	7: パン	2023-03-21	1	1	1	2	f
379	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	500	suica: まちおかおやつ	2023-03-26	3	1	1	1	f
380	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	648	京都駅：抹茶ラテ	2023-03-19	6	2	1	4	f
381	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	468	夜おやつ	2023-03-26	3	1	1	1	f
382	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	626	京都駅：京ばあむ	2023-03-19	6	2	1	4	f
383	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	2695	クリーニング	2023-03-12	4	1	1	2	f
384	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	7500	李沙美容室	2023-03-20	4	1	1	2	f
385	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	13332	電気代	2023-03-21	9	1	1	1	f
386	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	2234	amazon: フライパン	2023-03-02	3	1	1	1	f
387	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	4164	イオン：食材	2023-03-20	1	1	1	1	f
388	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	410	京都どらやきとおふぃなん	2023-03-19	6	1	1	3	f
389	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	459	錦市場: 串揚げとメンチ	2023-03-19	6	1	1	1	f
390	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	2400	スマートコーヒー	2023-03-19	6	1	1	3	f
391	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	9160	ONO（夕飯）	2023-03-19	6	1	1	1	f
392	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1084	7:あさ	2023-03-22	3	1	2	1	f
393	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	427	7:でざーと	2023-03-22	3	1	1	1	f
394	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	632	amazon pcスタンド	2023-03-22	3	1	2	1	f
395	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	522	7: 食材	2023-03-23	1	1	1	1	f
396	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	468	イオン：おやつ	2023-03-21	3	1	1	1	f
397	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1191	イオン：食材	2023-03-22	1	1	1	1	f
398	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	657	イオン：ブリーズライト	2023-03-21	2	1	1	1	f
399	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	548	７：よる	2023-03-24	3	1	2	1	f
400	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	2394	ヨーカドー：雑貨	2023-03-21	2	1	1	2	f
401	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	623	李沙祝儀袋	2023-03-26	4	2	1	4	f
402	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1290	イオン：食材	2023-03-26	1	1	1	1	f
403	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	281	ローソン：昼	2023-03-25	3	1	2	1	f
404	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1775	amazon: Nドット	2023-03-28	2	1	1	1	f
405	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	6175	イオン：食材	2023-03-25	1	1	1	1	f
406	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1000	7:my	2023-03-24	3	1	2	1	f
407	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	844	７：昼ごはん（パンケーキ）	2023-03-26	1	1	1	1	f
408	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	194	7: あさあ	2023-03-28	3	1	2	1	f
409	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	298	イオン:おやつ	2023-03-28	1	1	1	1	f
410	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	561	7:昼	2023-03-30	3	1	2	1	f
411	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	956	7:夜	2023-03-29	3	1	2	1	f
412	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	817	イオン：夜	2023-03-29	3	1	2	1	f
413	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1480	宮尾耳鼻咽喉科: 診察	2023-03-31	4	1	1	3	f
414	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	560	イオン：昼	2023-03-31	3	1	2	1	f
415	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	5000	飲み会	2023-03-31	3	1	2	3	f
416	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	220	7: コーヒー	2023-04-01	3	1	1	1	f
417	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	990	スタバ	2023-04-01	3	1	1	1	f
418	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	759	ヨーカドー：泡立て器小	2023-04-01	2	1	1	1	f
419	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1377	イオン：食材	2023-04-01	1	1	1	1	f
420	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	394	シーモア	2023-03-31	3	1	2	1	f
421	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	168	シーモア	2023-03-31	3	1	2	1	f
422	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	2550	角上：食材	2023-04-01	1	1	1	1	f
423	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	807	イオン：李沙夕飯	2023-04-02	1	1	1	2	f
424	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1705	ニトリ：雑貨	2023-04-02	2	1	1	1	f
425	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	394	シーモア	2023-04-03	3	1	2	1	f
426	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	714	イオン：食材	2023-04-05	1	1	1	1	f
427	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	780	明弘薬	2023-04-01	4	1	1	1	f
428	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	632	ヨーカドー：デザート	2023-03-25	3	1	1	2	f
429	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	695	イオン：食材	2023-03-30	1	1	1	1	f
430	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	500	Suica	2023-04-01	3	1	2	1	f
658	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	691	カルディ	2023-06-17	1	1	1	1	f
431	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	276	イオン：食材	2023-04-04	3	1	2	1	f
432	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	394	シーモア	2023-04-01	3	1	2	1	f
433	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1860	ペニーレイン	2023-04-02	4	1	1	2	f
434	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	290	7：朝	2023-04-04	3	1	2	1	f
435	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	573	イオン：食材	2023-04-02	1	1	1	1	f
436	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	480	ベローチェ	2023-04-02	3	1	2	1	f
437	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1018	スタバドーナツ	2023-03-21	3	1	1	2	f
438	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	427	イオン：デザート	2023-04-02	3	1	1	1	f
439	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	394	シーモア	2023-04-02	3	1	2	1	f
440	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	500	Suica	2023-04-01	3	1	2	1	f
441	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	276	イオン：食材	2023-04-03	3	1	2	1	f
442	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	7874	イオンネット：雑貨	2023-04-03	2	1	1	1	f
443	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	397	7：昼	2023-04-06	3	1	2	1	f
444	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1749	キルフェボン	2023-04-02	4	1	1	2	f
445	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1838	イオン：食材	2023-03-31	1	1	1	2	f
446	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1419	イオン：食材	2023-04-05	3	1	2	1	f
447	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1327	７：デザートとか	2023-04-04	3	1	1	1	f
448	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	632	7:よる	2023-04-05	3	1	2	1	f
449	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	466	7:よる	2023-04-06	3	1	2	1	f
450	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	624	7:あさ	2023-04-07	3	1	2	1	f
451	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	18500	keychron	2023-04-09	11	1	2	1	f
452	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	2805	イオン：食材	2023-04-09	1	1	1	1	f
453	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	918	イオン：食材	2023-04-07	1	1	1	1	f
454	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1568	スタバ	2023-04-09	1	1	1	1	f
455	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	298	famima: テリーヌ	2023-04-09	3	1	1	1	f
456	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	3058	shapo船橋 chawan	2023-04-09	1	1	1	1	f
457	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	590	７：よる	2023-04-08	3	1	2	1	f
458	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	559	７：ひる	2023-04-08	3	1	2	1	f
459	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	6228	ガス水道	2023-03-31	10	1	1	5	f
460	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	807	コーヒー豆	2023-04-09	1	1	1	1	f
461	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	557	7:おやつ	2023-04-09	3	1	1	1	f
462	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	254	ヨーカドー: おやつ	2023-04-09	3	1	1	1	f
463	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1100	7:v	2023-04-11	3	1	2	1	f
464	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1048	7:ひる	2023-04-12	3	1	2	1	f
465	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	748	イオン：食材	2023-04-12	1	1	1	1	f
466	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	2899	Amazon 李沙サブバッグ	2023-04-13	4	2	1	4	f
467	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	149	7：朝	2023-04-14	3	1	2	1	f
468	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	405	7：夜	2023-04-13	3	1	2	1	f
469	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	485	7：朝	2023-04-13	3	1	2	1	f
470	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	505	7：昼	2023-04-13	3	1	2	1	f
471	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	500	Suica	2023-04-15	3	1	2	1	f
472	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	585	イオン：よる	2023-04-14	3	1	2	1	f
473	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	466	イオン：よる	2023-04-10	3	1	2	1	f
474	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	4850	イオン：食材・ケーキ	2023-04-16	1	1	1	1	f
475	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1100	つけそば神田勝本	2023-04-15	3	1	2	3	f
476	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	2500	武道館：パンフレット	2023-04-15	3	1	2	3	f
477	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	500	モスバーガー	2023-04-15	3	1	2	3	f
478	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	3020	楽天キャッシュチャージ	2023-04-15	3	1	2	1	f
479	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	178	famima: 水	2023-04-15	3	1	2	1	f
480	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	540	７：昼	2023-04-14	3	1	2	1	f
481	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	734	7: おやつ	2023-04-16	3	1	1	1	f
482	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1690	amazon: ケーブル	2023-04-16	4	1	1	1	f
483	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1000	ランチ	2023-04-18	3	1	2	1	f
484	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	291	7:あさ	2023-04-18	3	1	2	1	f
485	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	800	７：よる	2023-04-18	3	1	2	1	f
486	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	560	veloce	2023-04-21	3	1	2	1	f
487	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	313	７：朝	2023-04-20	3	1	2	1	f
488	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	864	イオン：食材	2023-04-19	1	1	1	1	f
489	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	10203	電気代	2023-04-21	9	1	1	1	f
490	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	899	イオン: デザートとか	2023-04-21	3	1	1	1	f
491	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	4900	えきねっと	2023-03-31	5	2	1	4	f
492	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	404	イオン	2023-04-21	3	1	2	1	f
493	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	4280	えきねっと	2023-03-31	5	2	1	4	f
494	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	11500	李沙コンタクト	2023-04-23	4	2	1	4	f
495	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	500	suica	2023-04-23	3	1	2	1	f
496	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	425	イオン：よる	2023-04-24	3	1	2	1	f
497	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	4000	李沙結婚式セット	2023-04-15	4	1	1	2	f
498	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	328	カルディ: 豆	2023-04-22	1	1	1	1	f
499	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	781	７：おやつとか	2023-04-20	3	1	1	2	f
500	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	3936	角上：食材	2023-04-22	1	1	1	1	f
501	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1843	不二家：ケーキ	2023-04-16	3	1	1	1	f
502	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1358	ミスド	2023-04-23	4	1	1	1	f
503	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	414	７：デザート	2023-04-22	3	1	1	1	f
504	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	775	７：朝	2023-04-21	3	1	2	1	f
505	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	945	TOBU: アップルパイ	2023-04-22	3	1	1	1	f
506	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	4219	イオン：食材	2023-04-22	1	1	1	1	f
507	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	386	７：おやつ	2023-04-23	3	1	1	1	f
508	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	350	veloce	2023-04-21	3	1	2	1	f
509	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1831	マツキヨ：雑貨	2023-04-22	2	1	1	1	f
510	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	5621	クリーニング	2023-04-22	4	1	1	1	f
511	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	321	７：おやつ	2023-04-23	3	1	1	1	f
512	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	213	7:ひる	2023-04-25	3	1	2	1	f
513	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1047	ヨーカドー：雑貨	2023-04-22	2	1	1	1	f
514	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	3300	lindt: プレゼントチョコ	2023-04-22	4	1	1	1	f
515	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	258	ローソン：一幻	2023-04-23	3	1	1	1	f
516	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	747	7:あさ	2023-04-26	3	1	2	1	f
517	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1013	イオン：米	2023-04-25	1	1	1	1	f
518	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	13650	NHK	2023-04-15	4	1	1	1	f
519	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	552	イオン:夕飯	2023-04-27	3	1	2	1	f
520	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	2000	昼ごはん（岡山さん込み）	2023-04-28	3	1	2	3	f
521	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	3458	イオン:食材	2023-04-29	1	1	1	1	f
522	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	439	イオン:食材	2023-04-28	1	1	1	1	f
523	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	108	7:ぱん	2023-04-30	1	1	1	1	f
524	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	3014	なの誕プレ	2023-04-30	4	1	1	1	f
525	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	83160	suica: 定期	2023-04-27	11	1	2	1	f
526	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1000	7: mv	2023-04-25	3	1	2	1	f
527	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	857	７：昼	2023-05-03	3	1	2	1	f
528	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	270	７：昼	2023-05-01	3	1	2	1	f
529	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	5154	茅の舎：母の日	2023-04-28	4	1	1	1	f
530	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	500	Suica	2023-05-03	3	1	2	1	f
531	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	562	いおんよる	2023-05-02	3	1	2	1	f
532	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	330	ダイソー鮮度袋	2023-05-06	2	1	1	1	f
533	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	13856	ニトリ：夏の家具	2023-05-06	4	1	1	1	f
534	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	582	misdo: ドーナツ	2023-04-30	3	1	1	1	f
535	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	2243	イオン：食材	2023-05-06	1	1	1	1	f
536	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	3760	ユニクロ：下着	2023-05-06	3	1	2	1	f
537	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	30000	李沙ご祝儀	2023-04-30	4	2	1	4	f
538	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	515	イオン: 夜おやつ	2023-05-06	3	1	1	1	f
539	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1304	イオン：食材	2023-05-07	1	1	1	1	f
540	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1295	イオン：化粧品とブリーズライト	2023-05-06	2	1	1	2	f
541	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	114	newdays: 水	2023-05-06	3	1	1	1	f
542	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1186	７：二人よる	2023-05-05	3	1	1	1	f
543	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	4000	Suica	2023-05-05	6	1	1	1	f
544	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1458	松本駅: おやつ	2023-05-05	6	1	1	1	f
545	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	650	あずさご飯（とろたく	2023-05-03	6	1	1	1	f
546	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	151	あずさご飯（みず	2023-05-03	6	1	1	1	f
547	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1728	長野に土産（くっきー	2023-05-03	6	1	1	1	f
548	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	2487	あずさご飯（弁当	2023-05-03	6	1	1	1	f
549	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	2592	お土産ピーナッツ	2023-05-03	6	1	1	1	f
550	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	736	7:あさ	2023-05-10	3	1	2	1	f
551	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	7900	nintendo: ゼルダ	2023-05-12	3	1	2	1	f
552	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	7623	水道ガス	2023-04-30	10	1	1	5	f
553	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	4000	suica	2023-05-03	6	1	1	1	f
554	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	453	7:よる	2023-05-10	3	1	2	1	f
555	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	170	7:くっきー	2023-05-13	3	1	1	1	f
556	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1094	7:朝	2023-05-12	3	1	2	1	f
557	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	500	Suica（デザート）	2023-05-13	3	1	1	1	f
558	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1800	udemy: go	2023-05-13	3	1	2	1	f
559	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	211	イオン：アイス	2023-05-07	3	1	1	1	f
560	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	3590	amazon: タオル	2023-05-09	4	1	1	1	f
561	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	7000	李沙suica	2023-05-03	6	2	1	4	f
562	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	4645	水道ガス（TODO: 6月頭）	2023-05-01	10	1	1	5	f
563	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	2000	amazon: タオル	2023-05-09	4	1	1	1	f
564	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	260	7:おやつ	2023-05-14	3	1	2	1	f
565	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	687	カルディ: 豆	2023-05-14	1	1	1	1	f
566	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	138	ファミマ:コッペパン	2023-05-19	3	1	2	3	f
567	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	300	７：昼	2023-05-19	3	1	2	1	f
568	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	378	７：デザート	2023-05-20	3	1	1	1	f
569	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	959	7:デザート	2023-05-21	3	1	1	1	f
570	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	392	7:よる	2023-05-22	3	1	2	1	f
571	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	276	イオン：よる	2023-05-25	3	1	2	1	f
572	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	679	ニトリ：ガラス器	2023-05-24	4	1	1	1	f
573	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1329	github: copilot	2023-05-08	3	1	2	1	f
574	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	8250	明弘美容室	2023-05-14	4	1	1	1	f
575	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	500	スタバ：お返し	2023-05-14	4	2	1	4	f
576	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1162	イオン：食材	2023-05-15	1	1	1	1	f
577	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	105	イオン：おやつ	2023-05-16	3	1	2	1	f
578	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	5000	飲み会	2023-05-19	3	1	2	3	f
579	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1100	７：mv	2023-05-19	3	1	2	1	f
580	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	3069	イオン：食材	2023-05-21	1	1	1	1	f
581	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1304	イオン：食材	2023-05-20	1	1	1	1	f
582	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	552	イオン：食材	2023-05-24	1	1	1	1	f
583	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	600	７：あさ	2023-05-24	3	1	2	1	f
584	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1100	lindt: お返し	2023-05-14	4	1	1	2	f
585	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	714	イオン：食材	2023-05-14	1	1	1	2	f
586	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	822	イオン：EVE	2023-05-14	2	2	1	4	f
587	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	760	７：朝	2023-05-17	3	1	2	1	f
588	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	384	７：よる	2023-05-14	3	1	2	1	f
589	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	4340	イオン：食材	2023-05-13	1	1	1	1	f
590	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	3	イオン：袋	2023-05-21	1	1	1	1	f
591	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	558	７：食材	2023-05-20	1	1	1	1	f
592	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1448	イオン:食材	2023-05-23	1	1	1	1	f
593	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	132	ファミマ	2023-05-26	3	1	2	3	f
594	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	485	7:あさ	2023-05-23	3	1	2	1	f
595	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	954	イオン：食材	2023-05-18	1	1	1	1	f
596	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	712	イオン：雑貨	2023-05-16	2	1	1	1	f
597	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	291	７：よるアイス	2023-05-15	3	1	1	1	f
598	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	3000	７：mv	2023-05-19	3	1	2	1	f
599	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	3000	paypayチャージ	2023-05-26	3	1	2	1	f
600	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	3058	ヨーカドー：替刃	2023-05-24	2	1	1	1	f
601	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	500	Suica	2023-05-27	3	1	2	1	f
602	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1085	スタバ	2023-05-27	3	1	1	1	f
603	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	3800	映画	2023-05-27	3	1	1	1	f
604	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	384	デザート	2023-05-27	3	1	1	1	f
605	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	3908	イオン：食材	2023-05-27	1	1	1	1	f
606	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	6200	寿司みさき	2023-05-27	1	1	1	1	f
607	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	546	７：昼	2023-05-28	3	1	2	1	f
608	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	446	ファミマデザート	2023-05-28	3	1	1	1	f
609	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	333	7:あさ	2023-05-29	3	1	2	1	f
610	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	5907	イオンネット：雑貨	2023-06-10	2	1	1	1	f
611	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	149	7:シュー	2023-06-01	3	1	2	2	f
612	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1362	イオン:食材	2023-06-01	1	1	1	1	f
613	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	916	7:あさ	2023-05-31	3	1	2	1	f
614	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	427	7:よる	2023-05-31	3	1	2	1	f
615	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	855	イオン：食材	2023-06-02	1	1	1	1	f
616	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	330	イオン：よる	2023-05-29	3	1	2	1	f
617	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	961	イオン：デザート	2023-06-10	1	1	1	1	f
618	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	589	７：デザート	2023-06-02	3	1	2	1	f
619	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	3957	イオン：食材	2023-06-03	1	1	1	1	f
620	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	3586	都路里パフェ	2023-06-04	4	1	1	1	f
621	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1666	日比谷：パン	2023-06-04	4	1	1	1	f
622	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	496	number sugar	2023-06-04	4	1	1	1	f
623	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	776	日比谷：コーヒー	2023-06-04	4	1	1	1	f
624	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	968	ヨーカドー：日焼け止め	2023-06-04	2	1	1	1	f
625	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	330	7:デザート	2023-06-04	3	1	1	1	f
626	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	886	7:デザート	2023-06-07	3	1	1	1	f
627	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	8850	李沙美容室	2023-05-28	4	1	1	2	f
628	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1329	copilot	2023-06-08	3	1	2	1	f
629	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	537	カルディ	2023-06-10	1	1	1	1	f
630	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1973	イオン：食材	2023-06-10	1	1	1	1	f
631	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	327	イオン：食材	2023-06-07	1	1	1	1	f
632	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	327	イオン：食材	2023-06-07	1	1	1	1	f
633	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	308	イオン：よる	2023-06-05	3	1	2	1	f
634	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	885	イオン：よる	2023-06-06	3	1	2	1	f
635	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1395	角上：食材	2023-06-06	1	1	1	1	f
636	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	211	食材	2023-05-30	1	1	1	2	f
637	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	149	7: シュー	2023-06-01	3	1	2	2	f
638	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	382	7: 食材 	2023-06-03	1	1	2	2	f
639	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	594	7:小褒美	2023-06-12	3	1	2	1	f
640	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1000	7: mv	2023-06-12	3	1	2	1	f
641	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	592	イオン：食材	2023-06-09	1	1	1	1	f
642	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	470	イオン：カフェオレ	2023-06-11	3	1	1	1	f
643	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1342	イオン：洗顔	2023-06-11	2	1	1	1	f
644	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	200	イオン：アイス　	2023-06-11	3	1	1	1	f
645	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1024	Amazonいろはす	2023-06-14	4	1	1	1	f
646	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1780	Amazon自転車カバー	2023-06-14	4	1	1	1	f
647	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	744	イオン：食材	2023-06-14	1	1	1	1	f
648	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	333	7:あさ	2023-06-15	3	1	2	1	f
649	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	3200	花山うどん	2023-06-17	3	1	1	1	f
650	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1577	スタバ	2023-06-18	3	1	1	1	f
651	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1261	Yahoo! ドレッシングボトル	2023-06-18	4	1	1	2	f
652	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	496	7：デザート	2023-06-21	3	1	1	1	f
653	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1100	7:mv	2023-06-23	3	1	2	1	f
654	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	267	イオン：よる	2023-06-22	3	1	2	1	f
655	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	333	イオン：豚バラ	2023-06-24	1	2	1	4	f
656	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	2190	Amazonチーズ削り	2023-06-14	3	1	2	1	f
657	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1164	蔦屋：まっぷる	2023-06-10	3	1	1	1	f
659	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	451	7:あさ	2023-06-20	3	1	2	1	f
660	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	842	ミスド	2023-06-24	3	1	1	1	f
661	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	362	イオン：食材	2023-06-18	1	1	1	1	f
662	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	849	Amazon鼻腔拡張テープ	2023-06-14	4	1	1	1	f
663	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	560	vlce	2023-06-12	3	1	2	1	f
664	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1557	角上：食材 	2023-06-17	1	1	1	1	f
665	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1862	イオン：食材	2023-06-17	1	1	1	1	f
666	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	641	イオン: 食材	2023-06-21	1	1	1	1	f
667	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	3314	イオン：食材	2023-06-24	1	1	1	1	f
668	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1260	イオン：食材	2023-06-18	1	1	1	1	f
669	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	10307	津田沼肉寿司	2023-06-10	4	1	1	1	f
670	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	6310	電気代	2023-05-01	9	1	1	1	f
671	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	875	スギヤマ薬局	2023-06-17	2	1	1	1	f
672	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	11490	お母さん誕生日	2023-06-14	4	1	1	2	f
673	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	675	7:あさ	2023-06-21	3	1	2	1	f
674	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	200	イオン：よる	2023-06-15	3	1	2	1	f
675	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	360	イオン：食材	2023-06-23	3	1	2	1	f
676	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	6640	ヨーカドー: 雑貨	2023-07-02	2	1	1	1	f
677	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	313	ミスド	2023-07-02	3	1	1	1	f
678	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	691	カルディ	2023-07-02	1	1	1	1	f
679	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	864	イオン: 食材	2023-07-02	1	1	1	1	f
680	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1000	paypayチャージ（職場ランチ）	2023-06-16	3	1	2	1	f
681	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1503	ビアードパパ	2023-06-17	4	1	1	1	f
682	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	431	スタバ：クッキー	2023-06-25	3	1	1	2	f
683	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	364	東武ストア: 食材 	2023-06-14	1	1	1	2	f
684	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	10000	クリーニング（paypayチャージ）	2023-06-18	4	1	1	1	f
685	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1100	7:v	2023-06-18	3	1	2	1	f
686	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	868	カルディ：チーズ	2023-06-24	1	1	1	1	f
687	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	313	ミスド	2023-07-01	3	2	1	4	f
688	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	319	イオン: 食材	2023-06-27	1	1	1	2	f
689	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	390	イオン: 食材	2023-06-19	1	1	1	2	f
690	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1434	スタバ	2023-06-18	3	1	1	1	f
691	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	4111	電気代	2023-06-24	9	1	1	1	f
692	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1000	amazon: 過去分まとめ	2023-06-25	3	1	2	1	f
693	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1501	スタバ：朝	2023-06-25	3	1	1	1	f
694	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	606	7:デザートと雑巾	2023-06-25	3	1	1	1	f
695	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	2000	7:mv	2023-06-26	1	1	2	1	f
696	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	386	7:デザート	2023-06-28	3	1	1	1	f
697	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	310	7:昼	2023-06-26	3	1	2	1	f
698	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	656	7:よる	2023-06-26	3	1	2	1	f
699	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	485	7:あさ	2023-06-29	3	1	2	1	f
700	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	982	Amazon レシーバー	2023-06-29	3	1	2	1	f
701	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	91	イオン：牛乳	2023-06-24	1	1	1	1	f
702	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1352	イオン：食材	2023-06-25	1	1	1	1	f
703	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	514	イオン：食材・デザート	2023-06-29	1	1	1	1	f
704	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	460	イオン：食材	2023-06-28	1	1	2	1	f
705	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	308	イオン: 食材	2023-06-21	1	1	1	2	f
706	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1100	7:mv	2023-07-02	3	1	2	1	f
707	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	771	7:よる	2023-06-30	3	1	2	1	f
708	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	2305	ケーキ（還暦 ）	2023-07-01	4	1	1	1	f
709	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	13120	牛タン（還暦）	2023-07-01	4	1	1	1	f
710	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	60	google drive	2023-07-01	8	1	1	1	f
711	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	2291	イオン:食材	2023-07-01	1	1	1	1	f
712	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1542	朝スタバ	2023-07-02	3	1	1	1	f
713	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1430	ダイソー:雑貨	2023-07-02	2	1	1	1	f
714	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	419	7:デザート	2023-07-02	3	1	1	1	f
715	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	251	イオン:アイス	2023-07-03	3	1	1	1	f
716	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	251	7:ひる	2023-07-03	3	1	2	1	f
717	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1100	7:mv	2023-07-06	3	1	2	1	f
718	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	203	7: 朝	2023-07-04	3	1	2	1	f
719	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	4050	明弘美容院	2023-06-24	4	1	1	1	f
720	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1799	角上：食材 	2023-06-24	1	1	1	1	f
721	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	2447	角上：食材 	2023-07-01	1	1	1	1	f
722	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	254	イオン：アイス	2023-07-03	3	1	1	1	f
723	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	308	イオン：食材 	2023-07-06	3	1	2	1	f
724	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	657	7:あさ	2023-07-07	3	1	2	1	f
725	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	6407	水道ガス	2023-06-24	10	1	1	1	f
726	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	2200	ランチ（北嶋さん分も含む）	2023-07-07	3	1	2	3	f
727	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	890	amazon: USBケーブル	2023-07-07	4	1	1	1	f
728	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	439	イオン: 食材	2023-07-07	1	1	1	1	f
729	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	801	7:ひる	2023-07-08	1	1	1	1	f
730	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1804	amazon: kindle postgres	2023-07-08	3	1	2	1	f
731	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	802	スタバケーキ	2023-07-08	3	1	1	2	f
732	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	341	7:アイス	2023-07-09	3	1	1	1	f
733	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1460	KFC	2023-07-09	3	1	1	1	f
734	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	500	Suica	2023-07-09	3	1	2	1	f
735	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	299	7:あさ	2023-07-10	3	1	2	1	f
736	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	303	イオン: よる	2023-07-10	3	1	2	1	f
737	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	312	7:あさあ	2023-07-13	3	1	2	1	f
738	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1000	7:mv	2023-07-14	3	1	2	1	f
739	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	613	7：夜	2023-07-14	3	1	2	1	f
740	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	117	マイバス	2023-07-11	3	1	2	1	f
741	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	2028	イオン: 食材	2023-07-08	1	1	1	1	f
742	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1109	イオン: 食材	2023-07-12	1	1	1	1	f
743	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	4378	イオン: キッキンラック	2023-07-08	4	1	1	1	f
744	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1992	イオン: 食材	2023-07-11	1	1	1	2	f
745	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	498	7:コーヒーとおやつ	2023-07-15	3	1	1	1	f
746	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	500	Suica	2023-07-15	3	1	2	1	f
747	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	500	Suica	2023-06-17	3	1	2	1	f
748	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	500	Suica	2023-06-17	3	1	2	1	f
749	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	447	7:おやつ	2023-07-16	3	1	1	1	f
750	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	18305	横浜ホテル	2023-08-03	4	1	1	1	f
751	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	180	7: 昼	2023-07-03	3	1	2	1	f
752	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	3555	還暦ケーキ	2023-07-17	4	1	1	1	f
753	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1166	角上：食材	2023-07-08	1	1	1	1	f
754	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	341	イオン：食材	2023-07-13	1	1	1	2	f
755	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	349	イオン：食材	2023-07-14	1	1	1	2	f
756	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	254	イオン:アイス	2023-07-17	3	1	1	1	f
757	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	3000	赤れんがプラネタリウム	2023-07-17	4	1	1	1	f
758	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	5170	hands	2023-07-18	3	1	2	1	f
759	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	485	7:あさ	2023-07-18	3	1	2	1	f
760	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	160	7：コーヒー	2023-07-17	3	1	1	1	f
761	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	717	イオン：食材	2023-07-19	1	1	1	1	f
762	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	645	イオン：食材	2023-07-14	1	1	1	1	f
763	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	470	イオン：DVD	2023-07-14	4	1	1	1	f
764	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	254	イオン：食材	2023-07-14	3	1	2	1	f
765	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	120	mac	2023-07-14	1	1	2	1	f
766	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	365	まいばす：あさ	2023-07-21	3	1	2	1	f
767	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	4070	すぎむらクリニック：李沙薬	2023-07-22	4	2	1	4	f
768	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	914	7:よる	2023-07-21	3	1	2	1	f
769	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1182	7:よる	2023-07-21	3	1	2	1	f
770	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	319	7:アイス	2023-07-22	3	1	1	1	f
771	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1279	イオン食材	2023-07-23	1	1	1	1	f
772	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	663	イオン：食材	2023-07-18	1	1	1	2	f
773	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	2160	イオン：薬	2023-07-23	4	1	1	2	f
774	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1649	角上：食材	2023-07-22	1	1	1	2	f
775	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1018	イオン：食材	2023-07-22	1	1	1	2	f
776	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	34350	うしごろ	2023-08-05	4	1	1	2	f
777	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	4420	電気代	2023-07-23	9	1	1	1	f
778	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	352	7:よる	2023-07-24	3	1	2	1	f
779	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	344	7:あさ	2023-07-25	3	1	2	1	f
780	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1100	7：mv	2023-07-25	3	1	2	1	f
781	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1335	ねこねこ食パン	2023-07-16	3	1	1	1	f
782	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	180	まいばす	2023-07-27	3	1	2	1	f
783	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	224	まいばす	2023-07-27	3	1	2	1	f
784	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	194	7：アイス	2023-07-27	3	1	2	1	f
785	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	451	7:あさ	2023-07-29	3	1	2	1	f
786	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	325	イオン：食材	2023-07-27	1	1	1	2	f
787	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	274	イオン：食材	2023-07-27	1	1	1	2	f
788	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	2148	角上：食材	2023-07-29	1	1	1	2	f
789	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	6500	李沙美容院	2023-07-29	4	1	1	2	f
790	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	308	イオン：よる	2023-07-28	3	1	2	1	f
791	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	171	まいばす：朝	2023-07-28	3	1	2	1	f
792	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	626	銀だこ	2023-07-29	3	1	1	1	f
793	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	2422	イオン：食材	2023-07-29	1	1	1	1	f
794	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	7100	6th: ランチ	2023-07-23	1	1	1	1	f
795	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	2036	スタバ	2023-07-29	1	1	1	1	f
796	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	490	イオン:食材	2023-07-30	1	1	1	1	f
797	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	60	Google 	2023-08-01	8	1	1	1	f
798	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	5297	Amazon: 雑貨	2023-08-02	2	1	1	1	f
799	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	10000	keychron 30,597 ちばぎん	2023-07-19	11	1	2	2	f
800	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	10597	keychron 30,597 ボーナス	2023-07-19	5	1	1	2	f
801	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	56020	九州飛行機	2023-07-29	6	1	1	1	f
802	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	45650	九州宿	2023-07-29	6	1	1	1	f
803	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	5320	赤レンガランチ	2023-08-05	4	1	1	1	f
804	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	4900	茅野→新宿	2023-07-18	6	2	1	4	f
805	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1320	松本→茅野	2023-08-06	6	2	1	4	f
806	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	10140	新宿→茅野	2023-07-18	6	2	1	4	f
807	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	10840	amazon: 金井お返し	2023-08-06	4	1	1	1	f
808	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	656	イオン：食材	2023-08-02	1	1	1	1	f
809	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	968	イオン：食材	2023-08-06	1	1	1	1	f
810	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1697	横浜朝パン	2023-08-06	4	1	1	1	f
811	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	289	まいばす：昼	2023-08-04	3	1	2	1	f
812	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	385	まいばす：朝	2023-08-04	3	1	2	1	f
813	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	278	まいばす：昼	2023-07-31	3	1	2	1	f
814	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	490	イオン：よる	2023-08-01	3	1	2	1	f
815	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	171	まいばす：朝	2023-08-01	3	1	2	1	f
816	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1135	イオン：食材	2023-08-02	1	1	1	1	f
817	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1000	7:mv	2023-08-06	3	1	2	1	f
818	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	427	7：デザート	2023-08-06	3	1	1	1	f
819	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1000	Suica	2023-08-05	4	1	1	1	f
820	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1000	Suica	2023-08-06	4	1	1	1	f
821	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1429	copilot	2023-08-08	8	1	1	1	f
822	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	3000	paypay	2023-08-03	3	1	2	2	f
823	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	345	帰省飲み物	2023-08-10	6	1	1	1	f
824	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1059	7: よるごはん	2023-08-13	4	1	1	1	f
825	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	3313	イオン：食材	2023-08-14	1	1	1	1	f
826	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	3802	長野仲見世通り：お土産	2023-08-13	6	1	1	1	f
827	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	10000	keychron 30,597 財布	2023-07-19	3	1	2	2	f
828	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	375	イオン：よる	2023-08-07	3	1	2	1	f
829	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	117	まいばす：昼	2023-08-07	3	1	2	1	f
830	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	106	まいばす：朝	2023-08-07	3	1	2	1	f
831	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	547	イオン：味の素ボトル	2023-08-14	2	1	1	1	f
832	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	4748	電気代	2023-08-01	9	1	1	1	f
833	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	9834	美容院+ワックス	2023-08-16	4	1	1	1	f
834	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	447	イオン：食材	2023-08-16	1	1	1	1	f
835	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1095	イオン：雑貨	2023-08-06	2	1	1	1	f
836	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	537	カルディ	2023-08-08	1	1	1	1	f
837	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	213	イオン：よる	2023-08-08	3	1	2	1	f
838	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	289	まいばす：ひる	2023-08-09	3	1	2	1	f
839	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	508	イオン：よる	2023-08-09	3	1	2	1	f
840	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	203	まいばす：ひる	2023-08-10	3	1	2	1	f
841	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	944	シャトレーゼ	2023-08-11	6	1	1	1	f
842	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	2380	南アルプス村: パンや	2023-08-12	6	1	1	1	f
843	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	138	famima: ガム	2023-08-08	3	1	2	1	f
844	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	106	まいばす：朝	2023-08-08	3	1	2	1	f
845	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	923	不二家	2023-08-07	3	1	1	1	f
846	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	726	横浜プロント	2023-08-05	4	1	1	1	f
847	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	500	suica	2023-08-10	6	1	1	1	f
848	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	4000	suica	2023-08-13	6	1	1	1	f
849	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1000	suica	2023-08-05	4	1	1	1	f
850	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	2300	長野帰り弁当	2023-08-10	6	1	1	2	f
851	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	170	7:くっきー	2023-08-16	3	1	2	1	f
852	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	289	まいばす: ひる	2023-08-17	3	1	2	1	f
853	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	117	まいばす: あさ	2023-08-17	3	1	2	1	f
854	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	106	まいばす朝	2023-08-18	3	1	2	1	f
855	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	171	まいばす昼	2023-08-18	3	1	2	1	f
856	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	334	7：昼	2023-08-18	3	1	2	1	f
857	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	3822	amazon: サーバーとコースター	2023-08-19	4	1	1	1	f
858	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1784	amazon: 布巾掛けとか	2023-08-19	4	1	1	1	f
859	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1960	大戸屋: ランチ	2023-08-19	1	1	1	1	f
860	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1706	カルディ：豆とジェノベーゼ	2023-08-19	1	1	1	1	f
861	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	10609	イオンネット	2023-08-16	2	1	1	1	f
862	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	642	イオン：シャンプー	2023-07-31	2	1	1	2	f
863	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	3526	ガス・水道代	2023-07-01	10	1	1	1	f
864	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	676	イオン：食材	2023-08-08	1	1	1	2	f
865	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	599	イオン：食材	2023-08-08	1	1	1	1	f
866	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1481	イオン：食材	2023-08-15	1	1	1	1	f
867	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	276	7: ドーナツ	2023-08-16	3	1	1	1	f
868	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	278	イオン：食材	2023-08-17	1	1	1	1	f
869	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	4000	suica	2023-08-13	6	2	1	4	f
870	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	500	Suica	2023-08-20	3	1	2	1	f
871	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	632	7:小褒美	2023-08-19	3	1	1	1	f
872	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	779	7:朝ごはん	2023-08-19	3	1	1	1	f
873	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	300	まいばす昼	2023-08-21	3	1	2	1	f
874	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1562	software design	2023-08-21	1	1	1	1	f
875	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	593	7:あさ	2023-08-22	3	1	2	1	f
876	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	514	イオン:食材	2023-08-21	1	1	1	2	f
877	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	322	まいばすひる	2023-08-22	3	1	2	1	f
878	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	973	イオン:食材	2023-08-22	1	1	1	2	f
879	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1080	ドットインストール	2023-08-25	3	1	2	1	f
880	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	106	まいばす：朝	2023-08-18	3	1	2	1	f
881	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	97	イオン：よる	2023-08-15	3	1	2	1	f
882	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	609	イオン：食材	2023-08-22	1	1	1	1	f
883	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	588	イオン：食材	2023-08-23	1	1	1	1	f
884	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	96	まいばすひる	2023-08-15	3	1	2	1	f
885	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	159	イオン：よる	2023-08-18	3	1	2	1	f
886	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	7000	4c飲み会	2023-08-26	3	1	2	3	f
887	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1661	7: 朝	2023-08-26	1	1	1	1	f
888	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	2837	イオン：食材	2023-08-26	1	1	1	1	f
889	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	877	のどぬーる	2023-08-28	4	1	1	1	f
890	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1911	イオン：休養食料 	2023-08-28	4	1	1	1	f
891	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1538	コンビニ雑貨食料	2023-08-30	4	1	1	1	f
892	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	2390	モンペリエ	2023-09-09	4	1	1	1	f
893	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	5079	ガス水道代	2023-08-31	10	1	1	1	f
894	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1848	イオン: 薬（るる）	2023-08-29	4	1	1	2	f
895	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1059	7:あさ	2023-08-23	3	1	2	1	f
896	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	859	イオン: 食材	2023-08-29	1	1	1	2	f
897	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	941	イオン：食材	2023-08-31	1	1	1	1	f
898	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1100	マツキヨ薬	2023-08-31	4	1	1	2	f
899	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1468	イオん食材？	2023-08-31	4	1	1	2	f
900	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	2899	検査キット	2023-08-31	4	1	1	2	f
901	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1415	イオン: 食材	2023-09-01	1	1	1	2	f
902	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1058	イオン: 食材	2023-09-02	1	1	1	1	f
903	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1480	KFC	2023-09-02	1	1	1	1	f
904	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1460	マツキヨ薬飴	2023-09-02	4	1	1	1	f
905	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	495	7：昼	2023-09-04	3	1	2	1	f
906	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	289	マイバス昼	2023-09-05	3	1	2	1	f
907	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	700	イオン:食材	2023-09-04	1	1	1	2	f
908	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	192	7:よる	2023-09-05	3	1	2	1	f
909	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	816	7:あさ	2023-09-06	3	1	2	1	f
910	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	520	イオン食材	2023-09-05	1	1	1	2	f
911	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	362	イオン夜	2023-09-07	3	1	2	1	f
912	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1472	copilot	2023-09-08	3	1	2	1	f
913	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	2350	タリーズ	2023-09-09	3	1	1	1	f
914	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	324	7あさ	2023-09-08	3	1	2	1	f
915	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	482	7ひる	2023-09-08	3	1	2	1	f
916	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	386	7ひる	2023-09-07	3	1	2	1	f
917	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	8060	コンタクト	2023-09-09	4	1	1	1	f
918	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	2592	房の駅ピーナッツ	2023-09-09	4	1	1	1	f
919	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1840	イオン食材雑貨	2023-09-09	1	1	1	1	f
920	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	2978	イオン食材	2023-08-19	1	1	1	1	f
921	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	279	ニトリスポンジ	2023-08-21	3	1	2	1	f
922	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	2477	マツキヨのどスプレーのどあめ	2023-08-31	4	1	2	1	f
923	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1194	beard papa	2023-09-02	4	1	1	3	f
924	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	3240	高島屋退職	2023-09-08	4	2	1	4	f
925	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	2754	高島屋退職	2023-09-07	4	2	1	4	f
926	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1380	イオン　李沙剃刀	2023-09-10	4	2	1	4	f
927	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	2325	イオン食材	2023-09-10	1	1	1	2	f
928	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1395	角上食材	2023-09-11	1	1	1	2	f
929	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	939	イオン食材	2023-09-12	1	1	1	2	f
930	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	858	Amazon鼻テープ	2023-09-13	2	1	1	1	f
931	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	312	7あさ	2023-09-14	3	1	2	1	f
932	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	9900	李沙美容院	2023-09-13	4	1	1	2	f
933	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	610	すぎむらクリニック：李沙薬	2023-09-12	4	1	1	2	f
934	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	159	イオン食材	2023-09-13	1	1	1	2	f
935	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	341	イオン食材	2023-09-12	1	1	1	2	f
936	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	842	イオン食材	2023-09-11	1	1	1	2	f
937	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	2376	船橋東武誕プレ	2023-09-13	4	1	1	2	f
938	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1490	李沙お薬代	2023-09-13	4	1	1	2	f
939	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	587	イオン夜	2023-09-14	3	1	2	1	f
940	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	663	イオン夜	2023-09-08	3	1	2	1	f
941	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	323	7あさ	2023-09-15	3	1	2	1	f
942	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	500	Suica	2023-09-17	6	1	1	1	f
943	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	4000	Suica	2023-09-16	6	1	1	1	f
944	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1818	長野スタバ	2023-09-17	6	1	1	1	f
945	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	850	船橋スタバ	2023-09-16	6	1	1	1	f
946	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1018	帰省セブン	2023-09-16	6	1	1	1	f
947	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1860	南アルプス村クロワッサン	2023-09-16	6	1	1	3	f
948	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	400	南アルプス村アイス	2023-09-16	6	1	1	3	f
949	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	3000	Suica李沙	2023-09-17	6	2	1	4	f
950	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	4000	Suica李沙	2023-09-16	6	2	1	4	f
951	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	4000	Suica	2023-09-17	6	1	1	1	f
952	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	905	イオン食材	2023-09-15	1	1	1	2	f
953	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	437	マツキヨ歯ブラシ	2023-09-18	2	1	1	1	f
954	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	171	まいばす昼	2023-09-19	3	1	2	1	f
955	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1778	Amazonスポンジ	2023-09-19	2	2	1	4	f
956	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	550	7デザート	2023-09-19	3	1	1	1	f
957	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	7980	amazon: ルーター	2023-09-20	5	1	1	1	f
958	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	691	カルディ	2023-09-18	1	1	1	1	f
959	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	313	ヨーカドー糸ようじ	2023-09-18	2	1	1	1	f
960	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	246	まいばす昼	2023-09-21	3	1	2	1	f
961	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	323	7朝	2023-09-22	3	1	2	1	f
962	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	972	イオン食材	2023-09-21	1	1	1	2	f
963	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	7505	メガネ	2023-09-23	3	1	2	1	f
964	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	2280	大戸屋	2023-09-23	3	1	1	1	f
965	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	550	７：デザート	2023-09-22	3	1	1	1	f
966	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	745	イオン	2023-09-22	1	1	1	1	f
967	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	877	Gホイホイ	2023-09-22	2	1	1	2	f
968	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1196	イオン	2023-09-22	1	1	1	2	f
969	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	3800	李沙歯医者	2023-09-22	4	2	1	4	f
970	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	4220	いまきん食堂	2023-09-24	6	1	1	3	f
971	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	568	7朝ごはん	2023-09-24	6	1	1	1	f
972	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	600	鍋ヶ滝	2023-09-24	6	1	1	1	f
973	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	800	水前寺	2023-09-25	6	1	1	3	f
974	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	500	Suica	2023-09-25	6	1	1	1	f
975	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	880	黒亭ちびたま	2023-09-26	6	1	1	3	f
976	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1030	黒亭卵入りラーメン	2023-09-26	6	1	1	3	f
977	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	596	イオン食材	2023-09-19	1	1	1	2	f
978	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	13800	disney: チケット	2023-09-02	5	1	1	1	f
979	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	500	Suica	2023-09-26	6	1	1	1	f
980	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	200	水前寺駐車場	2023-09-25	6	1	1	3	f
981	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	2000	黒川paypay	2023-09-24	6	1	1	2	f
982	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1512	熊本駅土産	2023-09-25	6	1	1	1	f
983	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	788	熊本空港土産	2023-09-26	6	1	1	1	f
984	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	170	成田空港朝ごはん	2023-09-24	6	1	1	1	f
985	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1700	熊本城入場	2023-09-26	6	1	1	3	f
986	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	2752	熊本ガソリン	2023-09-26	6	1	1	1	f
987	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	268	ファミマ水	2023-09-25	6	1	1	1	f
988	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	4350	明弘美容院	2023-09-27	4	1	1	1	f
989	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1100	熊本駅くまもん	2023-09-26	6	1	1	1	f
990	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	486	熊本駅醤油	2023-09-26	6	1	1	1	f
991	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	5500	珈琲回廊	2023-09-26	6	1	1	1	f
992	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	2100	カフェスイッチランチ	2023-09-26	6	1	1	3	f
993	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	440	熊本城絵馬	2023-09-26	6	1	1	1	f
994	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	430	熊本駅いきなり団子	2023-09-26	6	1	1	1	f
995	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	440	熊本城陣太鼓ソフト	2023-09-26	6	1	1	3	f
996	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	6820	五郎八夜ご飯	2023-09-25	6	1	1	1	f
997	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	4884	らくだ山昼ごはん	2023-09-25	6	1	1	4	f
998	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	2000	山みず木（宿）チェックアウト時	2023-09-25	6	1	1	3	f
999	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	21510	レンタカー	2023-09-24	6	1	1	1	f
1000	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	2030	角上	2023-09-18	1	1	1	1	f
1001	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	600	南アルプス村りんごバター	2023-09-17	3	1	1	1	f
1002	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1000	熊本空港搭乗前（aso milkとか）	2023-09-26	6	1	1	1	f
1003	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	7572	熊本駅お土産	2023-09-26	6	1	1	1	f
1004	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1110	ASO MILK FACTOTY: ソフト x 2	2023-09-24	6	1	1	1	f
1005	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	199	ニトリジップロック	2023-09-22	2	1	1	2	f
1006	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	660	角上巻き寿司	2023-09-29	1	1	1	1	f
1007	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1420	李沙歯医者	2023-09-29	4	1	1	2	f
1008	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	16471	beamsデニム	2023-09-30	3	1	2	1	f
1009	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	451	7デザート	2023-09-30	3	1	1	1	f
1010	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	3680	ペニーレイン	2023-09-30	1	1	1	1	f
1011	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	468	7おやつ	2023-09-29	3	1	1	1	f
1012	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	4620	OSSDB Silver	2023-09-29	3	1	2	1	f
1013	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1029	イオン	2023-10-01	1	1	1	1	f
1014	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	4263	イオン薬	2023-10-01	4	1	1	1	f
1015	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	200	7：昼	2023-10-02	3	1	2	1	f
1016	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	5241	イオンネット	2023-10-02	2	1	1	1	f
1017	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	451	7ひる	2023-10-03	3	1	2	1	f
1018	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	171	まいばすあさ	2023-10-03	3	1	2	1	f
1019	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1118	7	2023-10-04	3	1	2	1	f
1020	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	549	イオン	2023-10-03	1	1	1	1	f
1021	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	172	7あさ	2023-10-05	3	1	2	1	f
1022	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	475	7昼	2023-10-05	3	1	2	1	f
1023	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	537	7昼	2023-10-06	3	1	2	1	f
1024	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	278	7朝	2023-10-06	3	1	2	1	f
1025	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	574	7夜	2023-10-06	3	1	2	1	f
1026	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	5079	ガス水道	2023-09-30	10	1	1	1	f
1027	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	7715	電気代	2023-09-30	9	1	1	1	f
1028	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	4000	disney: （といまに）	2023-09-28	5	1	1	1	f
1029	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	165	disney: NewDays水	2023-09-28	5	1	1	1	f
1030	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	509	disney: 7水と朝ごはん	2023-09-28	5	1	1	1	f
1031	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	3756	ガス水道	2023-10-07	10	1	1	1	f
1032	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	151	マツキヨティッシュ	2023-10-07	2	1	1	1	f
1033	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	190	黒川温泉ヨーグルト	2023-09-24	6	2	1	4	f
1034	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	907	イオン	2023-09-15	1	1	1	2	f
1035	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	244	イオン	2023-09-15	1	1	1	2	f
1036	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1518	イオンパブロン	2023-09-27	2	1	1	2	f
1037	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	299	イオン	2023-09-27	1	1	1	2	f
1038	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	311	7あさごはん	2023-10-01	1	1	1	2	f
1039	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	110	daiso: コロコロ	2023-09-22	2	2	1	4	f
1040	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1956	王将	2023-10-07	1	1	1	1	f
1041	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1238	イオン	2023-09-29	1	1	1	1	f
1042	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	546	イオン月見団子	2023-09-29	1	1	1	1	f
1043	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1271	角上	2023-09-30	1	1	1	1	f
1044	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1411	イオン	2023-09-30	1	1	1	1	f
1045	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	748	ララポミスド	2023-10-07	3	1	1	1	f
1046	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	3080	上島珈琲	2023-10-07	1	1	1	1	f
1047	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	14850	beams: 服（20,790）	2023-10-07	3	1	2	1	f
1048	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	503	イオン	2023-10-13	1	1	1	2	f
1049	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	5465	beams: 服（24,240）	2023-10-07	3	1	2	1	f
1050	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	18775	beams: 服（20,790）	2023-10-07	3	1	3	1	f
1051	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	262	7食材	2023-10-10	1	1	1	2	f
1052	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	20000	車の頭金	2023-10-14	5	2	1	4	f
1053	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	10000	車の頭金	2023-10-14	5	1	1	3	f
1054	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	5940	beams: 服（24,240）	2023-10-07	3	1	3	1	f
1055	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	480	ベローチェ	2023-10-09	3	1	2	1	f
1056	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	3657	イオン	2023-10-09	1	1	1	1	f
1057	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	224	まいばす朝	2023-10-12	3	1	2	1	f
1058	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	362	7デザート	2023-10-11	3	1	1	1	f
1059	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	798	7昼	2023-10-11	3	1	2	1	f
1060	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	500	Suica	2023-10-08	3	1	2	1	f
1061	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	500	Suica	2023-10-07	3	1	2	1	f
1062	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	138	7朝	2023-10-10	3	1	2	1	f
1063	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	352	7デザート	2023-10-07	3	1	1	1	f
1064	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	514	7デザート	2023-10-06	3	1	1	1	f
1065	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	118	7:キャベツ	2023-10-12	3	1	2	1	f
1066	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	324	7朝	2023-10-13	3	1	2	1	f
1067	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	324	7昼	2023-10-13	3	1	2	1	f
1068	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	172	7あさ	2023-10-16	3	1	2	1	f
1069	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1628	ルル	2023-10-11	4	1	1	2	f
1070	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	838	7デザート	2023-10-15	3	1	1	1	f
1071	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	474	7昼	2023-10-15	3	1	2	1	f
1072	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	494	famima夜	2023-10-14	3	1	2	1	f
1073	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	365	7キャベツ	2023-10-14	1	1	1	1	f
1074	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1201	7昼	2023-10-14	1	1	1	1	f
1075	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	668	イオン昼	2023-10-18	3	1	2	1	f
1076	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	128	まいばすあさ	2023-10-19	3	1	2	1	f
1077	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	533	イオン夜	2023-10-19	3	1	2	1	f
1078	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	128	7朝	2023-10-20	3	1	2	1	f
1079	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	800	disney: クランチチョコ	2023-09-28	5	1	1	1	f
1080	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	2640	イルビゾンテ（イベント）	2023-10-21	7	1	1	1	f
1081	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1586	スタバ（イベント）	2023-10-21	7	1	1	1	f
1082	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	600	disney: チキンレッグ	2023-09-28	5	1	1	1	f
1083	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	4450	disney: バー	2023-09-28	5	1	1	1	f
1084	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1050	disney: チュロスと飲み物	2023-09-28	5	1	1	1	f
1085	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	400	disney: ポップコーン	2023-09-28	5	1	1	1	f
1086	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	500	disney: ティポトルタ	2023-09-28	5	1	1	1	f
1087	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	500	disney: ユカタンドッグ	2023-09-28	5	1	1	1	f
1088	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	400	disney: リトルグリーンマン	2023-09-28	5	1	1	1	f
1089	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1500	disney: うきわまん	2023-09-28	5	1	1	1	f
1090	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1823	角上	2023-10-15	1	1	1	1	f
1091	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	690	ヨーカドー	2023-10-15	1	1	1	1	f
1092	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	3756	水道ガス	2023-10-01	10	1	1	1	f
1093	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	877	ヨーカドー	2023-10-16	1	1	1	2	f
1094	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	4234	キルフェボン（イベント）	2023-10-21	7	1	1	1	f
1095	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	8800	vendomeaohama: ネックレス（イベント）	2023-10-21	7	1	1	1	f
1096	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	400	disney: いろはす	2023-09-28	5	2	1	4	f
1097	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	650	dean deluca: 巨峰ジュース	2023-10-21	3	1	1	1	f
1098	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	2106	イオン	2023-10-15	1	1	1	1	f
1099	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1200	disney: ノーチラスギャレー	2023-09-28	5	1	1	2	f
1100	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	373	イオン	2023-10-20	1	1	1	2	f
1101	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	4271	イオン	2023-10-21	1	1	1	2	f
1102	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	343	7	2023-10-16	1	1	1	2	f
1103	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	8765	電気代	2023-10-01	9	1	1	1	f
1104	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	500	suica	2023-10-21	3	1	2	1	f
1105	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	500	suica	2023-10-14	3	1	2	1	f
1106	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	4500	イオン	2023-10-22	1	1	1	1	f
1107	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	18000	宮崎牛（ふるさと納税）	2023-10-22	5	1	1	1	f
1108	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	21000	牛切り落とし（ふるさと納税）	2023-10-22	5	1	1	1	f
1109	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	5000	雲仙ハム（ふるさと納税）	2023-10-22	5	1	1	1	f
1110	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	24000	近江牛（ふるさと納税）	2023-10-22	5	1	1	1	f
1111	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	2400	ping-t（OSS-DB Silver）	2023-10-22	3	1	2	1	f
1112	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	492	7:よるごはん	2023-10-24	1	1	1	1	f
1113	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	231	7	2023-10-22	1	1	1	1	f
1114	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	280	7	2023-10-24	3	1	2	1	f
1115	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	481	7	2023-10-24	3	1	2	1	f
1116	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	690	ヨーカドー	2023-10-21	1	1	1	1	f
1117	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	8007	母誕生日ギフト	2023-10-24	4	1	1	1	f
1118	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	447	イオン夜	2023-10-26	3	1	2	1	f
1119	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	128	まいばす朝	2023-10-27	3	1	2	1	f
1120	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	844	イオン	2023-10-27	1	1	1	1	f
1121	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	691	カルディ	2023-10-28	1	1	1	1	f
1122	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	3520	イオン	2023-10-28	1	1	1	1	f
1123	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	2000	paypay昼ごはんとんかつ	2023-10-27	3	1	2	2	f
1124	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	594	7デザート	2023-10-29	3	1	1	1	f
1125	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1432	スタバ	2023-10-29	3	1	1	1	f
1126	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	10000	李沙の誕生日バックと傘	2023-10-29	7	2	1	4	f
1127	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	291	コチュジャン	2023-10-28	1	1	1	1	f
1128	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	396	7食材	2023-10-28	1	1	1	1	f
1129	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	416	7朝	2023-10-25	3	1	2	1	f
1130	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	590	李沙お薬	2023-10-28	4	1	1	2	f
1131	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	368	7：夜	2023-10-30	3	1	2	1	f
1132	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	612	7朝	2023-11-01	3	1	2	1	f
1133	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1100	mv	2023-10-31	3	1	2	1	f
1134	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1100	mv	2023-10-31	3	1	2	1	f
1135	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1697	イオン	2023-11-03	1	1	1	1	f
1136	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	890	錦糸町珈琲	2023-11-03	1	1	1	1	f
1137	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	955	蔵前スコーン	2023-11-03	3	1	1	1	f
1138	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	62	蔵前水	2023-11-03	3	1	1	1	f
1139	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	334	まいばす朝	2023-11-02	3	1	2	1	f
1140	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	990	daiso: ゴミ袋とか	2023-11-01	2	1	1	1	f
1141	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1001	イオン	2023-11-01	1	1	1	1	f
1142	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	168	famimaコッペパン	2023-11-02	3	1	2	1	f
1143	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	590	李沙薬	2023-10-28	4	1	2	2	f
1144	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1110	李沙診察	2023-10-28	3	1	1	2	f
1145	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	159	イオン	2023-11-02	3	2	1	4	f
1146	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	343	7: 食材	2023-10-25	1	1	1	2	f
1147	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	5000	飲み会 	2023-11-02	3	1	2	3	f
1148	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	4500	蔵前ハンバーガー	2023-11-03	1	1	1	3	f
1149	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	384	ローソンデザート	2023-11-04	3	1	1	1	f
1150	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	386	ローソンデザート	2023-11-01	3	1	1	1	f
1151	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	27000	劇団四季	2023-11-05	7	1	1	1	f
1152	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	233	イオン	2023-10-23	1	1	1	2	f
1153	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	108	7: パン	2023-10-31	1	1	1	2	f
1154	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	127	イオン	2023-11-01	1	1	1	2	f
1155	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	188	7昼	2023-11-06	3	1	2	1	f
1156	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	510	エクセルシオール	2023-11-05	3	1	2	1	f
1157	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	2485	イオン	2023-11-05	1	1	1	1	f
1158	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	622	ローソンデザート	2023-11-05	3	1	1	1	f
1159	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	1033	7	2023-11-08	3	1	2	1	f
1160	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	192	ローソンデザート	2023-11-07	3	1	2	1	f
1161	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	288	7でざーと	2023-11-06	3	1	1	1	f
1162	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	384	ローソンデザート	2023-11-08	3	1	1	1	f
1163	2023-11-09 06:12:21.172	2023-11-09 06:12:21.172	480	veloce	2023-11-09	3	1	2	1	f
1168	2023-11-10 12:12:39.309	2023-11-10 12:12:39.309	7568	ガス水道代	2023-11-01	10	1	1	5	f
1169	2023-11-11 08:32:00.857	2023-11-11 08:32:00.857	1023	角上	2023-11-11	1	1	1	1	f
1170	2023-11-11 08:32:24.236	2023-11-11 08:32:24.236	1784	角上	2023-11-04	1	1	1	1	f
1171	2023-11-11 08:33:21.837	2023-11-11 08:33:21.837	9550	明弘美容院	2023-10-29	4	1	1	1	f
1172	2023-11-11 08:33:52.42	2023-11-11 08:33:52.42	336	イオン	2023-11-11	1	1	1	1	f
1173	2023-11-11 08:34:10.122	2023-11-11 08:34:10.122	1078	マスク	2023-11-11	2	1	1	1	f
1175	2023-11-11 08:34:49.136	2023-11-11 08:34:49.136	2970	ユニクロ	2023-11-11	3	1	2	1	f
1176	2023-11-11 08:35:24.471	2023-11-11 08:35:24.471	244	イオンよる	2023-11-10	3	1	2	1	f
1177	2023-11-11 09:20:12.147	2023-11-11 09:20:12.147	254	イオンアイス	2023-11-06	3	1	1	1	f
1178	2023-11-11 09:20:28.294	2023-11-11 09:20:28.294	1038	イオン	2023-11-09	1	1	1	1	f
1179	2023-11-11 09:20:43.43	2023-11-11 09:20:43.43	108	イオン	2023-11-11	1	1	1	1	f
1180	2023-11-11 09:21:05.252	2023-11-11 09:21:05.252	340	たいやき	2023-11-11	1	1	1	1	f
1181	2023-11-11 09:21:43.48	2023-11-11 09:21:43.48	8980	李沙美容院	2023-11-11	4	1	1	2	f
1182	2023-11-11 09:27:41.61	2023-11-11 09:27:41.61	7000	【ふるさと納税】コロッケ	2023-10-01	5	2	1	4	f
1183	2023-11-11 09:28:04.025	2023-11-11 09:28:04.025	7000	【ふるさと納税】雲仙ハム	2023-10-01	5	2	1	4	f
1184	2023-11-11 09:28:23.383	2023-11-11 09:28:23.383	9000	【ふるさと納税】ハンバーグ	2023-10-01	5	2	1	4	f
1185	2023-11-11 09:28:45.716	2023-11-11 09:28:45.716	13000	【ふるさと納税】牛タン	2023-10-01	5	2	1	4	f
1186	2023-11-11 10:02:13.847	2023-11-11 10:02:13.847	14850	浄水カートリッジ	2023-11-11	4	1	1	1	f
1187	2023-11-11 23:41:30.489	2023-11-11 23:41:30.489	319	7: おやつ	2023-11-11	3	1	1	1	f
1188	2023-11-11 23:41:46.749	2023-11-11 23:41:46.749	1542	スタバ	2023-11-12	3	1	1	1	f
1189	2023-11-12 06:25:49.243	2023-11-12 06:25:49.243	2651	albus	2023-11-12	4	2	1	4	f
1190	2023-11-12 06:41:45.309	2023-11-12 06:41:45.309	22000	低温調理器（誕生日）	2023-11-12	7	1	1	1	f
1191	2023-11-12 06:42:08.612	2023-11-12 06:42:08.612	7128	ホーロー鍋（誕生日）	2023-11-12	7	1	1	1	f
1192	2023-11-12 06:42:44.301	2023-11-12 06:42:44.301	1904	iwaki 保存容器x2	2023-11-12	4	1	1	1	f
1193	2023-11-12 09:24:26.144	2023-11-12 09:24:26.144	691	カルディ	2023-11-12	1	1	1	1	f
1194	2023-11-12 09:24:54.146	2023-11-12 09:24:54.146	5315	イオン	2023-11-12	1	1	1	1	f
1195	2023-11-12 11:02:36.558	2023-11-12 11:02:36.558	606	イオンデザート	2023-11-12	3	1	1	1	f
1196	2023-11-13 23:51:29.037	2023-11-13 23:51:29.037	235	まいばすあさ	2023-11-14	3	1	2	1	f
1197	2023-11-15 13:01:27.922	2023-11-15 13:01:27.922	717	セブン昼	2023-11-15	3	1	2	1	f
1198	2023-11-15 13:01:47.093	2023-11-15 13:01:47.093	341	7でざーと	2023-11-15	3	1	1	1	f
1199	2023-11-15 13:08:48.802	2023-11-15 13:08:48.802	1546	イオンネット調味料	2023-11-15	1	1	1	1	f
1200	2023-11-15 13:10:19.385	2023-11-15 13:10:19.385	7202	イオンネット雑貨	2023-11-15	2	1	1	1	f
1201	2023-11-15 23:45:46.104	2023-11-15 23:45:46.104	128	まいばす朝	2023-11-16	3	1	2	1	f
1202	2023-11-16 05:39:32.022	2023-11-16 05:39:32.022	159	まいばす昼	2023-11-16	3	1	2	1	f
1225	2023-11-19 11:40:12.246	2023-11-19 11:40:12.246	506	イオン：デザート	2023-11-19	3	1	1	1	f
1226	2023-11-19 11:40:43.742	2023-11-19 11:40:43.742	953	イオン	2023-11-18	3	1	2	1	f
1229	2023-11-19 11:42:06.327	2023-11-19 11:42:06.327	895	イオン	2023-11-14	1	1	1	1	f
1230	2023-11-19 11:42:24.394	2023-11-19 11:42:24.394	407	まいばす	2023-11-14	3	1	2	1	f
1231	2023-11-19 11:43:00.954	2023-11-19 11:43:00.954	222	イオン	2023-11-13	3	1	2	1	f
1232	2023-11-19 11:43:21.213	2023-11-19 11:43:21.213	319	イオン	2023-11-17	3	1	2	1	f
1233	2023-11-19 11:43:43.766	2023-11-19 11:43:43.766	1298	イオン：ニキビクリーム	2023-11-16	2	1	1	1	f
1234	2023-11-19 11:44:08.801	2023-11-19 11:44:08.801	2188	イオン：お好み焼き	2023-11-17	1	1	1	1	f
1235	2023-11-19 11:44:34.673	2023-11-19 11:44:34.673	1552	スタバ	2023-11-19	3	1	1	1	f
1236	2023-11-19 11:44:53.798	2023-11-19 11:44:53.798	648	7デザート	2023-11-17	3	1	1	1	f
1237	2023-11-19 11:45:13.108	2023-11-19 11:45:13.108	480	7	2023-11-16	3	1	2	1	f
1240	2023-11-19 12:05:49.07	2023-11-19 12:05:49.07	528	TSUTAYA：ワンピース	2023-11-19	3	1	2	1	f
1243	2023-11-19 14:21:38.77	2023-11-19 14:21:38.77	1620	大丸: 尾崎さん菓子折り	2023-11-18	4	1	1	2	f
1244	2023-11-19 14:22:05.021	2023-11-19 14:22:05.021	1922	FLO: あやかケーキ	2023-11-18	4	1	1	2	f
1245	2023-11-19 14:22:33.683	2023-11-19 14:22:33.683	362	7: エクレア	2023-11-14	3	1	1	2	f
1246	2023-11-19 14:23:42.29	2023-11-19 14:23:42.29	598	イオン	2023-11-17	3	1	2	1	f
1247	2023-11-19 23:29:22.928	2023-11-19 23:29:22.928	280	マイバス朝	2023-11-20	3	1	2	1	f
1248	2023-11-22 12:18:22.904	2023-11-22 12:18:22.904	170	イオン	2023-11-22	3	1	2	1	f
1249	2023-11-22 12:19:05.059	2023-11-22 12:19:05.059	267	まいばす昼	2023-11-20	3	1	2	1	f
1250	2023-11-22 12:19:19.969	2023-11-22 12:19:19.969	138	イオン	2023-11-20	3	1	2	1	f
1251	2023-11-22 12:20:36.066	2023-11-22 12:20:36.066	373	7デザート	2023-11-21	3	1	1	1	f
1252	2023-11-24 05:14:15.684	2023-11-24 05:14:15.684	3000	免許証更新	2023-11-24	4	1	1	3	f
1253	2023-11-24 05:14:33.081	2023-11-24 05:14:33.081	1000	Suica	2023-11-24	3	1	2	1	f
1254	2023-11-24 12:51:52.04	2023-11-24 12:51:52.04	451	7デザート	2023-11-24	3	1	1	1	f
1255	2023-11-24 23:48:18.085	2023-11-24 23:48:18.085	444	7朝	2023-11-25	1	1	1	1	f
1256	2023-11-25 07:30:07.409	2023-11-25 07:30:07.409	2000	JAF申込	2023-11-25	4	2	1	4	f
1257	2023-11-26 10:44:04.611	2023-11-26 10:44:04.611	254	7おやつ	2023-11-26	3	1	1	1	f
1260	2023-11-26 15:45:28.247	2023-11-26 15:45:28.247	223	7調味料	2023-11-22	1	1	1	1	f
1261	2023-11-26 15:45:55.282	2023-11-26 15:45:55.282	1739	キルフェボン	2023-11-23	3	1	1	1	f
1262	2023-11-26 15:46:16.145	2023-11-26 15:46:16.145	2550	ペニーレイン	2023-11-23	3	1	1	1	f
1263	2023-11-27 05:03:34.67	2023-11-27 05:03:34.67	596	7昼	2023-11-27	3	1	2	1	f
1264	2023-11-28 05:31:19.402	2023-11-28 05:31:19.402	117	まいばす昼	2023-11-28	3	1	2	1	f
1265	2023-11-28 05:32:14.238	2023-11-28 05:32:14.238	1584	イオン	2023-11-23	1	1	1	2	f
1266	2023-11-28 14:58:59.072	2023-11-28 14:58:59.072	1340	イオン	2023-11-28	1	1	1	1	f
1267	2023-11-28 14:59:34.37	2023-11-28 14:59:34.37	609	イオン夜	2023-11-28	3	1	2	1	f
1268	2023-11-28 15:02:04.606	2023-11-28 15:02:04.606	500	Suica	2023-11-25	3	1	2	1	f
1269	2023-11-28 15:05:08.271	2023-11-28 15:05:08.271	8277	電気代	2023-11-29	9	1	1	1	f
1270	2023-11-28 15:06:42.745	2023-11-28 15:06:42.745	1724	ヨーカドー	2023-11-01	2	1	1	1	f
1271	2023-11-28 15:08:43.459	2023-11-28 15:08:43.459	1991	イオン	2023-11-04	1	1	1	1	f
1272	2023-11-28 15:10:05.32	2023-11-28 15:10:05.32	1525	github	2023-11-07	3	1	2	1	f
1273	2023-11-28 15:13:41.942	2023-11-28 15:13:41.942	3818	イオン	2023-11-19	1	1	1	1	f
1274	2023-11-30 04:13:40.39	2023-11-30 04:13:40.39	300	7：昼	2023-11-30	3	1	2	1	f
1275	2023-11-30 13:46:02.949	2023-11-30 13:46:02.949	416	7でざーと	2023-11-30	3	1	1	1	f
1276	2023-12-01 10:43:06.447	2023-12-01 10:43:06.447	497	まいばす昼	2023-12-01	3	1	2	1	f
1277	2023-12-01 14:00:23.029	2023-12-01 14:00:23.029	548	ファミマデザート	2023-12-01	3	1	2	1	f
1278	2023-12-01 21:56:17.78	2023-12-01 21:56:17.78	181	イオン夜	2023-11-30	3	1	2	1	f
1279	2023-12-01 21:56:46.564	2023-12-01 21:56:46.564	259	まいびす朝	2023-11-30	3	1	2	1	f
1280	2023-12-02 12:31:10.849	2023-12-02 12:31:10.849	120	famima: ジュース	2023-11-24	3	1	2	1	f
1281	2023-12-02 12:32:25.911	2023-12-02 12:32:25.911	980	成田昼ごはんラーメン	2023-11-26	3	1	2	1	f
1282	2023-12-02 12:32:45.19	2023-12-02 12:32:45.19	691	成田カルディ	2023-11-26	1	1	1	1	f
1283	2023-12-02 12:33:20.267	2023-12-02 12:33:20.267	3548	成田イオン	2023-11-26	1	1	1	1	f
1284	2023-12-02 12:34:52.39	2023-12-02 12:34:52.39	3035	イオン	2023-12-02	1	1	1	1	f
1285	2023-12-02 12:35:22.298	2023-12-02 12:35:22.298	1507	イオン: 薬綿棒絆創膏	2023-12-02	2	1	1	1	f
1287	2023-12-02 12:36:14.803	2023-12-02 12:36:14.803	1227	ヨーカドー: クイックル	2023-12-02	2	1	1	1	f
1288	2023-12-02 12:36:54.54	2023-12-02 12:36:54.54	897	道の駅常総：野菜	2023-12-02	1	1	1	3	f
1289	2023-12-02 12:59:24.67	2023-12-02 12:59:24.67	5752	ガソリン	2023-11-26	12	1	1	1	f
1290	2023-12-03 02:07:10.729	2023-12-03 02:07:10.729	2000	千葉マツダ: JAF	2023-11-26	12	2	1	4	f
1291	2023-12-03 02:07:56.965	2023-12-03 02:07:56.965	1584	1584	2023-11-23	1	1	1	2	f
1292	2023-12-03 02:09:17.091	2023-12-03 02:09:17.091	438	7: おやつ	2023-12-02	1	1	1	2	f
1293	2023-12-03 02:09:55.935	2023-12-03 02:09:55.935	610	李沙薬	2023-12-02	4	2	1	4	f
1294	2023-12-03 11:28:42.558	2023-12-03 11:28:42.558	159	イオンラップ	2023-12-03	2	1	1	1	f
1295	2023-12-03 11:29:07.295	2023-12-03 11:29:07.295	457	イオンデザート	2023-12-03	3	1	1	1	f
1296	2023-12-03 14:37:03.135	2023-12-03 14:37:03.135	53000	スタッドレスタイヤ	2023-12-03	12	1	1	1	f
1297	2023-12-04 05:51:50.056	2023-12-04 05:51:50.056	2037	イオン	2023-12-04	1	1	1	2	f
1298	2023-12-06 01:05:00.85	2023-12-06 01:05:00.85	171	まいばす朝	2023-12-05	3	1	2	1	f
1299	2023-12-06 01:05:32.467	2023-12-06 01:05:32.467	322	7夜	2023-12-05	3	1	2	1	f
1300	2023-12-06 01:05:55.9	2023-12-06 01:05:55.9	732	7デザート	2023-12-04	3	1	1	1	f
1301	2023-12-06 01:06:34.417	2023-12-06 01:06:34.417	220	ダイソー車掃除用品	2023-12-02	2	1	1	1	f
1302	2023-12-06 01:07:06.841	2023-12-06 01:07:06.841	1390	道の駅メロンパン	2023-12-02	3	1	1	1	f
1303	2023-12-06 01:07:37.067	2023-12-06 01:07:37.067	2960	道の駅ランチ	2023-12-02	3	1	1	1	f
1304	2023-12-06 01:41:22.208	2023-12-06 01:41:22.208	798	7昼	2023-12-06	3	1	2	1	f
1305	2023-12-07 12:07:44.596	2023-12-07 12:07:44.596	397	7夜	2023-12-07	3	1	2	1	f
1307	2023-12-07 12:15:16.552	2023-12-07 12:15:16.552	375	7デザート	2023-12-06	3	1	1	1	f
1308	2023-12-07 12:39:28.552	2023-12-07 12:39:28.552	5551	ガス水道代	2023-12-07	10	1	1	5	f
1309	2023-12-07 13:42:46.672	2023-12-07 13:42:46.672	269	まいばす朝	2023-12-07	3	1	2	1	f
1310	2023-12-08 00:23:00.961	2023-12-08 00:23:00.961	1500	copilot	2023-12-08	3	1	2	1	f
1312	2023-12-09 05:12:07.862	2023-12-09 05:12:07.862	4818	銚子丸	2023-12-09	5	1	1	1	f
1313	2023-12-09 08:01:43.736	2023-12-09 08:01:43.736	618	7夜	2023-12-08	3	1	2	1	f
1314	2023-12-09 08:02:09.663	2023-12-09 08:02:09.663	224	7朝	2023-12-08	3	1	2	1	f
1315	2023-12-12 09:15:52.503	2023-12-12 09:15:52.503	246	ファミマ札崩し	2023-12-12	3	1	2	3	f
1316	2023-12-12 09:32:13.887	2023-12-12 09:32:13.887	1000	Suica	2023-12-12	3	1	2	1	f
1317	2023-12-12 14:04:07.108	2023-12-12 14:04:07.108	6000	飲み会paypay	2023-12-12	3	1	2	1	f
1319	2023-12-14 05:05:09.196	2023-12-14 05:05:09.196	601	7：昼	2023-12-14	3	1	2	1	f
1320	2023-12-14 05:05:30.47	2023-12-14 05:05:30.47	395	7デザート	2023-12-13	3	1	1	1	f
1321	2023-12-14 05:05:49.807	2023-12-14 05:05:49.807	1140	7朝昼	2023-12-13	3	1	2	1	f
1322	2023-12-14 05:06:14.929	2023-12-14 05:06:14.929	419	7:よる	2023-12-12	3	1	2	1	f
1323	2023-12-14 05:07:01.122	2023-12-14 05:07:01.122	825	7朝	2023-12-10	1	1	1	1	f
1324	2023-12-14 12:42:04.263	2023-12-14 12:42:04.263	529	7夜デザート	2023-12-14	3	1	1	1	f
1325	2023-12-14 14:37:28.927	2023-12-14 14:37:28.927	498	キレイキレイ（1276	2023-12-10	2	1	1	1	f
1326	2023-12-14 14:38:04.659	2023-12-14 14:38:04.659	228	ティッシュ（1276	2023-12-10	2	1	1	1	f
1327	2023-12-14 14:38:34.818	2023-12-14 14:38:34.818	466	デザート（1276	2023-12-10	3	1	1	1	f
1328	2023-12-14 14:38:59.73	2023-12-14 14:38:59.73	373	イオンデザート	2023-12-09	3	1	1	1	f
1329	2023-12-14 14:39:23.439	2023-12-14 14:39:23.439	117	まいばす朝	2023-12-14	3	1	2	1	f
1330	2023-12-14 14:39:53.889	2023-12-14 14:39:53.889	1290	カルディ	2023-12-10	1	1	1	1	f
1331	2023-12-14 14:40:20.86	2023-12-14 14:40:20.86	2460	イオン	2023-12-09	1	1	1	1	f
1332	2023-12-14 14:41:01.869	2023-12-14 14:41:01.869	352	イオン夜	2023-12-11	3	1	2	1	f
1333	2023-12-14 14:41:24.645	2023-12-14 14:41:24.645	204	まいばすスープ	2023-12-11	3	1	2	1	f
1334	2023-12-14 14:41:53.869	2023-12-14 14:41:53.869	106	まいばす朝	2023-12-11	3	1	2	1	f
1335	2023-12-14 14:43:55.239	2023-12-14 14:43:55.239	2550	アキヒロ美容院	2023-12-03	4	1	1	1	f
1336	2023-12-14 14:44:24.241	2023-12-14 14:44:24.241	2865	角上	2023-12-09	1	1	1	1	f
1337	2023-12-15 13:11:38.853	2023-12-15 13:11:38.853	204	まいばす昼	2023-12-15	3	1	2	1	f
1338	2023-12-15 13:16:57.49	2023-12-15 13:16:57.49	330	イオン夜	2023-12-15	3	1	2	1	f
1339	2023-12-16 03:04:46.7	2023-12-16 03:04:46.7	13200	1ヶ月点検とタイヤ付替	2023-12-16	12	1	1	1	f
1340	2023-12-16 03:05:22.355	2023-12-16 03:05:22.355	3091	ココスランチ	2023-12-16	1	1	1	1	f
1341	2023-12-17 03:55:25.438	2023-12-17 03:55:25.438	302	ミスド	2023-12-03	3	1	1	2	f
1342	2023-12-17 03:55:46.188	2023-12-17 03:55:46.188	2220	イオン薬	2023-12-07	4	1	1	2	f
1343	2023-12-17 03:56:07.144	2023-12-17 03:56:07.144	1260	銀だこ	2023-12-07	3	1	1	2	f
1344	2023-12-17 03:56:33.806	2023-12-17 03:56:33.806	2037	イオン	2023-12-03	1	1	1	2	f
1345	2023-12-17 04:28:29.935	2023-12-17 04:28:29.935	1360	銀だこ	2023-12-17	3	1	1	1	f
1346	2023-12-17 04:28:43.289	2023-12-17 04:28:43.289	615	ミスド	2023-12-17	3	1	1	1	f
1347	2023-12-17 12:35:28.016	2023-12-17 12:35:28.016	705	イオン	2023-12-17	1	1	1	1	f
1348	2023-12-17 12:37:11.993	2023-12-17 12:37:11.993	1620	イオン	2023-12-16	1	1	1	1	f
1349	2023-12-17 12:38:41.772	2023-12-17 12:38:41.772	9990	ユニクロ（22,900）	2023-12-17	3	1	2	1	f
1350	2023-12-17 12:41:11.132	2023-12-17 12:41:11.132	12900	ユニクロ（22,900）	2023-12-17	3	1	3	1	f
1351	2023-12-18 12:35:02.528	2023-12-18 12:35:02.528	330	ゴミ袋とセスキ	2023-12-18	2	1	1	1	f
1352	2023-12-18 12:35:20.222	2023-12-18 12:35:20.222	368	ファミマデザート	2023-12-18	3	1	1	1	f
1353	2023-12-19 05:08:21.122	2023-12-19 05:08:21.122	100	7昼	2023-12-19	3	1	2	1	f
1354	2023-12-20 13:04:48.137	2023-12-20 13:04:48.137	341	イオンデザート	2023-12-20	3	1	1	1	f
1365	2023-12-24 11:20:08.221	2023-12-24 11:20:08.221	573	イオン	2023-12-19	1	1	1	1	f
1366	2023-12-24 11:20:33.202	2023-12-24 11:20:33.202	321	まいばす昼	2023-12-18	3	1	2	1	f
1367	2023-12-24 11:21:00.357	2023-12-24 11:21:00.357	416	イオン夜	2023-12-18	3	1	2	1	f
1368	2023-12-24 11:21:16.144	2023-12-24 11:21:16.144	637	ミスド	2023-12-24	3	1	1	1	f
1369	2023-12-24 11:21:48.21	2023-12-24 11:21:48.21	591	業務スーパーあさり	2023-12-24	1	1	1	1	f
1370	2023-12-24 11:22:05.537	2023-12-24 11:22:05.537	4558	イオン	2023-12-24	1	1	1	1	f
1371	2023-12-24 11:23:01.096	2023-12-24 11:23:01.096	745	カルディ	2023-12-24	1	1	1	1	f
1357	2023-12-23 06:42:01.697	2023-12-23 06:42:01.697	5280	千疋屋	2023-12-23	7	1	1	1	f
1358	2023-12-23 06:42:29.335	2023-12-23 06:42:29.335	3080	船橋寿司	2023-12-23	7	1	1	1	f
1359	2023-12-23 06:44:57.335	2023-12-23 06:44:57.335	6600	イルビゾンテ: キーリング（9372	2023-12-23	4	1	1	1	f
1361	2023-12-24 11:18:18.965	2023-12-24 11:18:18.965	2640	イルビゾンテ（9372）	2023-12-23	3	1	3	1	f
1362	2023-12-24 11:18:38.359	2023-12-24 11:18:38.359	2549	イオン	2023-12-23	1	1	1	1	f
1363	2023-12-24 11:19:11.089	2023-12-24 11:19:11.089	671	イオンよる	2023-12-22	3	1	2	1	f
1364	2023-12-24 11:19:44.042	2023-12-24 11:19:44.042	1980	ユニクロヒートテック	2023-12-24	3	1	2	1	f
1372	2023-12-24 11:23:26.187	2023-12-24 11:23:26.187	220	TSUTAYAレンタル	2023-12-24	3	1	1	1	f
1373	2023-12-24 13:06:40.016	2023-12-24 13:06:40.016	753	7: デザート	2023-12-24	3	1	1	1	f
1374	2023-12-24 13:08:01.159	2023-12-24 13:08:01.159	535	7: デザート	2023-12-20	3	1	1	1	f
1375	2023-12-24 13:08:17.739	2023-12-24 13:08:17.739	1551	7夜	2023-12-21	3	1	2	1	f
1376	2023-12-25 14:09:46.168	2023-12-25 14:09:46.168	479	イオン夜	2023-12-25	3	1	2	1	f
1377	2023-12-27 03:56:12.912	2023-12-27 03:56:12.912	664	7デザート	2023-12-26	3	1	1	1	f
1378	2023-12-27 03:56:32.608	2023-12-27 03:56:32.608	1365	7朝	2023-12-27	3	1	2	1	f
1379	2023-12-27 13:09:13.701	2023-12-27 13:09:13.701	1479	イオン（デザートと食材）	2023-12-27	1	1	1	1	f
1380	2023-12-28 07:07:55.47	2023-12-28 07:07:55.47	1609	イオン	2023-12-28	1	1	1	1	f
1381	2023-12-29 01:08:04.27	2023-12-29 01:08:04.27	514	7: デザート	2023-12-28	3	1	1	1	f
1318	2023-12-12 14:15:44.683	2023-12-29 13:39:49.49	157150	自動車保険	2023-12-06	12	1	1	1	f
1383	2023-12-30 07:43:42.99	2023-12-30 07:43:42.99	467	角上	2023-12-28	1	1	1	1	f
1384	2023-12-30 07:44:06.649	2023-12-30 07:44:06.649	105	イオン	2023-12-28	1	1	1	1	f
1385	2023-12-30 07:44:42.449	2023-12-30 07:44:42.449	350	スタバ	2023-12-29	3	1	2	1	f
1386	2023-12-30 07:45:12.659	2023-12-30 07:45:12.659	686	イオン	2023-12-29	1	1	1	1	f
1387	2023-12-30 07:45:40.434	2023-12-30 07:45:40.434	3186	房の駅	2023-12-29	4	1	1	1	f
1388	2023-12-30 07:47:38.391	2023-12-30 07:47:38.391	2700	HIBIKA: お土産	2023-12-29	3	1	1	2	f
1389	2023-12-30 07:49:30.464	2023-12-30 07:49:30.464	2743	角上	2023-12-16	1	1	1	1	f
1390	2023-12-30 07:49:45.571	2023-12-30 07:49:45.571	4383	角上	2023-12-30	1	1	1	1	f
1392	2023-12-30 12:14:05.113	2023-12-30 12:14:05.113	1950	amazon ワックス	2023-12-30	2	1	1	1	f
1393	2023-12-30 12:14:36.268	2023-12-30 12:14:36.268	679	amazon ポチ袋	2023-12-30	4	1	1	1	f
1394	2023-12-31 09:36:25.677	2023-12-31 09:36:25.677	1707	スタバ	2023-12-31	3	1	1	1	f
1397	2023-12-31 09:39:22.019	2023-12-31 09:39:22.019	507	7: クッキングシート	2023-12-31	2	1	1	1	f
1398	2023-12-31 09:39:42.611	2023-12-31 09:39:42.611	480	veloce	2023-12-30	3	1	2	1	f
1399	2023-12-31 09:40:08.168	2023-12-31 09:40:08.168	717	7デザート	2023-12-30	3	1	1	1	f
1400	2023-12-31 09:40:31.458	2023-12-31 09:40:31.458	351	7: デザート	2023-12-30	3	1	1	1	f
1438	2024-01-12 09:41:32.705	2024-01-12 09:41:32.705	583	7：昼	2024-01-11	3	1	2	1	f
1396	2023-12-31 09:38:46.759	2023-12-31 15:12:58.801	4350	明弘美容室	2023-12-29	4	1	1	1	f
1395	2023-12-31 09:37:53.854	2023-12-31 15:14:08.379	9350	クリーニング	2023-12-30	4	1	1	1	f
1401	2024-01-01 05:04:17.906	2024-01-01 05:04:17.906	6600	アウトレット：李沙ワンピース（ボーナス）	2024-01-01	5	1	1	1	f
1402	2024-01-01 05:05:29.267	2024-01-01 05:05:29.267	2455	アウトレットリンツ自分用（4,910）	2024-01-01	3	1	1	1	f
1403	2024-01-01 05:06:19.189	2024-01-01 05:06:19.189	2455	アウトレットリンツお土産（4,910）	2024-01-01	4	1	1	1	f
1404	2024-01-01 05:15:16.958	2024-01-01 05:15:16.958	4026	アウトレット銚子丸	2024-01-01	1	1	1	1	f
1406	2024-01-01 05:20:31.646	2024-01-01 05:20:31.646	7581	アウトレットBEAMS（15,163）（ボーナス）	2024-01-01	5	1	1	1	f
1407	2024-01-01 05:21:56.697	2024-01-01 05:21:56.697	7581	アウトレットBEAMS（15,163）	2024-01-01	3	1	2	1	f
1408	2024-01-01 05:22:20.203	2024-01-01 05:22:20.203	386	7: アウトレット飲み物	2024-01-01	3	1	1	1	f
1409	2024-01-01 05:30:21.942	2024-01-01 05:30:21.942	11007	amazon スピーカー（ボーナス）	2023-12-30	5	1	1	1	f
1410	2024-01-02 01:31:45.891	2024-01-02 01:31:45.891	1100	たこ焼き福袋	2024-01-02	3	1	1	3	f
1411	2024-01-02 05:36:18.52	2024-01-02 05:36:18.52	0	なのちゃんお年玉（6000円ゆうちょ行きの封筒から）	2024-01-02	4	1	1	3	f
1412	2024-01-02 11:48:00.06	2024-01-02 11:48:00.06	2161	イオン	2024-01-02	1	1	1	1	f
1413	2024-01-03 03:54:10.973	2024-01-03 03:54:52.581	3553	ガソリン	2024-01-03	12	1	1	1	f
1414	2024-01-03 03:55:18.776	2024-01-03 03:55:18.776	745	カルディ	2024-01-03	1	1	1	1	f
1415	2024-01-03 03:55:46.288	2024-01-03 03:55:46.288	1360	不二家ケーキ	2024-01-03	3	1	1	1	f
1416	2024-01-03 03:55:58.334	2024-01-03 03:55:58.334	1236	イオン	2024-01-03	1	1	1	1	f
1417	2024-01-03 03:56:14.254	2024-01-03 03:56:14.254	604	ミスド	2024-01-03	3	1	1	1	f
1418	2024-01-03 03:56:43.555	2024-01-03 03:56:43.555	1095	イオン：ガラスコップ	2024-01-03	4	1	1	1	f
1419	2024-01-03 03:57:31.476	2024-01-03 03:57:31.476	416	7: デザート	2024-01-03	3	1	1	1	f
1420	2024-01-03 08:21:28.431	2024-01-03 08:21:28.431	320	ファミマ肉まん	2024-01-03	3	1	1	1	f
1422	2024-01-05 04:41:01.045	2024-01-05 04:41:01.045	500	Suica	2024-01-05	3	1	2	1	f
1423	2024-01-08 10:09:05.493	2024-01-08 10:09:05.493	3354	イオン	2024-01-08	1	1	1	1	f
1425	2024-01-08 10:11:14.397	2024-01-08 10:11:14.397	1944	石川ちいずっきい【長野帰省】	2024-01-06	4	1	1	1	f
1424	2024-01-08 10:10:08.072	2024-01-08 10:11:23.577	2480	談合坂SAすた丼【長野帰省】	2024-01-05	4	1	1	1	f
1426	2024-01-08 10:13:07.664	2024-01-08 10:13:07.664	2309	イオン旅行セット系	2023-12-31	2	1	1	2	f
1427	2024-01-08 10:13:41.596	2024-01-08 10:13:41.596	3569	諏訪湖SAお土産【長野帰省】	2024-01-07	4	1	1	1	f
1428	2024-01-08 10:14:22.67	2024-01-08 10:14:22.67	1490	諏訪湖SA夕飯おやき【長野帰省】	2024-01-07	4	1	1	1	f
1429	2024-01-08 10:14:45.594	2024-01-08 10:14:45.594	267	イオン	2023-12-26	1	1	1	2	f
1430	2024-01-08 10:15:41.436	2024-01-08 10:15:41.436	1830	富澤商店パン材料	2023-12-30	1	1	1	2	f
1431	2024-01-08 10:17:12.512	2024-01-08 10:17:12.512	4020	李沙美容院	2023-12-30	4	1	1	2	f
1432	2024-01-08 10:18:25.87	2024-01-08 10:18:25.87	184	談合坂SAお茶【長野帰省】	2024-01-05	4	1	1	1	f
1433	2024-01-08 10:18:59.962	2024-01-08 10:18:59.962	2916	ねんりん家土産【長野帰省】	2024-01-05	4	1	1	1	f
1421	2024-01-05 04:40:47.555	2024-01-08 10:19:17.265	2160	婆ちゃ誕生日キャラメルマンデー【長野帰省】	2024-01-05	4	1	1	1	f
1434	2024-01-08 10:23:09.772	2024-01-08 10:27:35.823	5330	高速道路花輪→伊那【長野帰省】	2024-01-05	4	1	1	1	f
1435	2024-01-08 10:27:56.809	2024-01-08 10:27:56.809	5690	高速道路伊那→千葉北【長野帰省】	2024-01-07	4	1	1	1	f
1436	2024-01-08 11:03:23.825	2024-01-08 11:03:23.825	518	7: デザート	2024-01-08	3	1	1	1	f
1437	2024-01-10 12:25:52.853	2024-01-10 12:25:52.853	8558	ガス水道	2024-01-10	10	1	1	5	f
1439	2024-01-13 07:23:05.547	2024-01-13 07:23:05.547	1814	パン屋さんのパン	2024-01-13	3	1	1	3	f
1440	2024-01-13 07:23:47.49	2024-01-13 07:23:47.49	2587	ヤオコー：食材	2024-01-13	1	1	1	1	f
1441	2024-01-13 07:24:20.583	2024-01-13 07:24:20.583	543	よったいよ八千代：食材	2024-01-13	1	1	1	1	f
1442	2024-01-13 07:24:46.606	2024-01-13 07:24:46.606	537	ヤオコー：食材	2023-12-31	1	1	1	1	f
1443	2024-01-13 07:25:02.209	2024-01-13 07:25:02.209	211	イオン	2024-01-04	1	1	1	1	f
1444	2024-01-13 07:25:26.189	2024-01-13 07:25:26.189	5502	ガソリン	2024-01-13	12	1	1	1	f
1445	2024-01-13 07:30:00.984	2024-01-13 07:30:00.984	1309	ヨーカドー：化粧水	2024-01-03	2	1	1	1	f
1405	2024-01-01 05:18:40.08	2024-01-13 07:31:46.169	2309	イオン：年末食材	2023-12-31	4	1	1	1	f
1391	2023-12-30 07:50:16.475	2024-01-13 07:32:00.299	2677	イオン：年末食材	2023-12-30	4	1	1	1	f
1447	2024-01-13 15:17:51.611	2024-01-13 15:17:51.611	3880	amazon: ケーブル類	2024-01-14	4	1	1	1	f
1448	2024-01-15 09:53:22.033	2024-01-15 09:53:22.033	6769	電気代	2024-01-15	9	1	1	1	f
1450	2024-01-15 09:56:22.02	2024-01-15 09:56:22.02	408	7: デザート	2024-01-14	3	1	1	1	f
1451	2024-01-15 09:56:56.52	2024-01-15 09:56:56.52	1630	マック	2024-01-14	3	1	1	1	f
1452	2024-01-15 09:57:15.306	2024-01-15 09:57:15.306	1461	スタバ	2024-01-14	3	1	1	1	f
1453	2024-01-15 09:58:54.976	2024-01-15 09:58:54.976	3411	amazon:  米唐番とケーブル	2024-01-14	2	1	1	1	f
1454	2024-01-17 06:28:08.659	2024-01-17 06:28:08.659	288	7:よる	2024-01-16	3	1	2	1	f
1455	2024-01-17 06:28:34.616	2024-01-17 06:28:34.616	170	7:昼	2024-01-17	3	1	2	1	f
1456	2024-01-17 07:18:33.863	2024-01-17 07:18:33.863	1100	web	2024-01-12	3	1	2	1	f
1457	2024-01-17 12:48:19.182	2024-01-17 12:48:19.182	3278	丸善：OOUI本	2024-01-17	3	1	2	1	f
1459	2024-01-17 13:06:08.228	2024-01-17 13:06:08.228	1484	copilot	2024-01-07	3	1	2	1	f
1460	2024-01-18 12:18:47.86	2024-01-18 12:18:47.86	486	7：デザート	2024-01-18	3	1	1	1	f
1461	2024-01-19 04:34:49.373	2024-01-19 04:34:49.373	494	7: 朝昼	2024-01-19	3	1	2	1	f
1462	2024-01-19 11:21:17.637	2024-01-19 11:21:17.637	646	7：夜	2024-01-19	3	1	2	1	f
1463	2024-01-19 11:21:50.652	2024-01-19 11:21:50.652	181	イオン夜	2024-01-19	3	1	2	1	f
1464	2024-01-19 11:22:26.086	2024-01-19 11:22:26.086	1119	イオン	2024-01-18	1	1	1	1	f
1465	2024-01-20 14:42:20.841	2024-01-20 14:42:20.841	634	銀だこ	2024-01-20	3	1	2	1	f
1466	2024-01-20 14:42:34.78	2024-01-20 14:42:34.78	2603	イオン	2024-01-20	1	1	1	1	f
1467	2024-01-20 14:44:01.786	2024-01-20 14:44:01.786	951	スタバ	2024-01-20	3	1	1	1	f
1468	2024-01-20 23:59:36.068	2024-01-20 23:59:36.068	1463	スタバ	2024-01-21	3	1	1	1	f
1472	2024-01-21 13:22:17.548	2024-01-21 13:22:17.548	1100	李沙診療代	2024-01-19	3	1	1	2	f
1471	2024-01-21 13:21:41.303	2024-01-21 13:22:23.702	820	イオン：李沙薬	2024-01-19	4	1	1	2	f
1475	2024-01-22 10:54:55.06	2024-01-22 10:54:55.06	719	7：夜	2024-01-22	3	1	2	1	f
1520	2024-02-04 04:55:05.423	2024-02-04 04:55:05.423	1530	ピーターパン	2024-02-04	1	1	1	3	f
1476	2024-01-24 11:59:28.295	2024-01-24 11:59:28.295	650	7：昼	2024-01-24	3	1	2	1	f
1477	2024-01-25 14:42:41.315	2024-01-25 14:42:41.315	222	イオン	2024-01-15	1	1	1	1	f
1478	2024-01-25 14:42:57.584	2024-01-25 14:42:57.584	244	イオン	2024-01-23	1	1	1	1	f
1479	2024-01-25 14:43:46.308	2024-01-25 14:43:46.308	274	イオン夜	2024-01-25	3	1	2	1	f
1480	2024-01-26 04:41:39.516	2024-01-26 04:41:39.516	556	7：昼	2024-01-26	3	1	2	1	f
1481	2024-01-27 00:44:14.512	2024-01-27 00:44:14.512	522	7:あさ	2024-01-27	3	1	2	1	f
1482	2024-01-27 04:26:52.472	2024-01-27 04:26:52.472	660	イオン：よる	2024-01-12	3	1	2	1	f
1483	2024-01-27 04:39:54.216	2024-01-27 04:39:54.216	1100	web	2024-01-26	3	1	2	1	f
1521	2024-02-04 04:55:39.338	2024-02-04 04:55:39.338	1873	角上	2024-02-04	1	1	1	1	f
1485	2024-01-27 12:51:00.05	2024-01-27 12:51:00.05	481	7:豚まん	2024-01-27	3	1	1	1	f
1486	2024-01-27 23:00:10.925	2024-01-27 23:00:10.925	1542	スタバ	2024-01-28	3	1	1	1	f
1490	2024-01-28 11:49:55.027	2024-01-28 11:49:55.027	484	イオン	2024-01-27	1	1	1	1	f
1491	2024-01-28 11:50:11.85	2024-01-28 11:50:11.85	2578	イオン	2024-01-28	1	1	1	1	f
1492	2024-01-28 11:51:03.076	2024-01-28 11:51:03.076	745	カルディ	2024-01-28	1	1	1	1	f
1493	2024-01-28 11:51:19.371	2024-01-28 11:51:19.371	438	イオン：おやつ	2024-01-28	3	1	1	1	f
1494	2024-01-28 12:57:32.496	2024-01-28 12:57:32.496	5900	amazon年会費	2024-01-28	4	1	1	1	f
1513	2024-02-03 11:20:01.229	2024-02-04 06:16:24.012	1000	Suica	2024-02-03	3	1	2	1	f
1495	2024-01-28 12:58:23.939	2024-01-28 13:12:06.026	2550	明弘美容院	2024-01-27	4	1	1	1	f
1496	2024-01-28 13:13:03.195	2024-01-28 13:13:03.195	1416	ピーターパン	2024-01-28	1	1	1	3	f
1497	2024-01-28 23:31:48.156	2024-01-28 23:31:59.794	1470	LINEギフト	2024-01-28	3	1	2	1	f
1498	2024-01-30 03:22:49.711	2024-01-30 03:22:49.711	330	ダイソーコンロクリーナー	2024-01-29	2	1	1	1	f
1499	2024-01-30 03:23:16.686	2024-01-30 03:23:16.686	162	7:あさ	2024-01-30	3	1	2	1	f
1500	2024-01-30 14:13:07.378	2024-01-30 14:13:07.378	576	イオン	2024-01-30	1	1	1	1	f
1501	2024-01-31 03:07:34.656	2024-01-31 03:07:34.656	506	7:あさ	2024-01-31	3	1	2	1	f
1502	2024-01-31 10:18:44.038	2024-01-31 10:18:44.038	1490	イオン	2024-01-31	1	1	1	1	f
1503	2024-02-01 08:30:38.104	2024-02-01 08:30:38.104	418	ファミマ　ちびスプレー	2024-02-01	2	1	1	1	f
1504	2024-02-01 16:20:52.782	2024-02-01 16:20:52.782	737	7：夜	2024-02-02	3	1	2	1	f
1505	2024-02-02 12:45:33.527	2024-02-02 12:45:33.527	4694	イオン	2024-02-02	1	1	1	1	f
1474	2024-01-22 06:10:01.507	2024-02-02 12:47:14.708	4354	イオン	2024-01-21	1	1	1	1	f
1506	2024-02-02 12:49:48.767	2024-02-02 12:49:48.767	576	イオン	2024-01-14	1	1	1	1	f
1507	2024-02-02 12:50:04.203	2024-02-02 12:50:04.203	2093	イオン	2024-01-14	1	1	1	1	f
1508	2024-02-02 13:05:45.505	2024-02-02 13:05:45.505	343	まいばす昼	2024-02-01	3	1	2	1	f
1509	2024-02-03 11:12:53.908	2024-02-03 11:12:53.908	800	【穣京】東京駅お土産	2024-02-03	4	1	1	1	f
1510	2024-02-03 11:13:14.981	2024-02-03 11:13:14.981	16130	【穣京】夜ご飯	2024-02-03	4	1	1	1	f
1511	2024-02-03 11:13:33.217	2024-02-03 11:13:33.217	9130	【穣京】千疋屋	2024-02-03	4	1	1	1	f
1512	2024-02-03 11:14:05.187	2024-02-03 11:14:05.187	8600	【穣京】もんじゃ	2024-02-03	4	1	1	1	f
1446	2024-01-13 15:17:30.638	2024-02-03 11:14:33.953	15200	【穣京】チームラボ（4人分）	2024-01-14	4	1	1	1	f
1514	2024-02-03 11:20:14.977	2024-02-03 11:20:14.977	1000	Suica	2024-02-03	3	1	1	1	f
1515	2024-02-03 11:41:17.111	2024-02-03 11:41:17.111	494	7: デザート	2024-02-03	3	2	1	4	f
1519	2024-02-04 01:07:00.224	2024-02-04 01:07:00.224	1020	コメダ	2024-02-04	3	1	1	1	f
1535	2024-02-04 11:10:03.651	2024-02-04 11:10:03.651	461	イオン	2024-02-04	1	1	1	1	f
1536	2024-02-04 11:10:40.769	2024-02-04 11:10:40.769	1040	不二家：2年半小祝	2024-02-04	4	1	1	1	f
\.


--
-- Data for Name: Payer; Type: TABLE DATA; Schema: public; Owner: expend_manage_admin
--

COPY public."Payer" (id, code, "createdAt", "updatedAt", name) FROM stdin;
1	akihiro	2023-11-09 05:02:38.133	2023-11-09 05:02:38.133	明弘
2	risa	2023-11-09 05:02:38.133	2023-11-09 05:02:38.133	李沙
\.


--
-- Data for Name: PayerOnCountingItem; Type: TABLE DATA; Schema: public; Owner: expend_manage_admin
--

COPY public."PayerOnCountingItem" (id, "payerId", "countingItemId", "createdAt", "updatedAt") FROM stdin;
1	1	1	2023-11-09 05:02:54.123	2023-11-09 05:02:54.123
2	2	2	2023-11-09 05:02:56.007	2023-11-09 05:02:56.007
\.


--
-- Data for Name: PayerOnCustomCountingItemTerm; Type: TABLE DATA; Schema: public; Owner: expend_manage_admin
--

COPY public."PayerOnCustomCountingItemTerm" (id, "payerId", "customCountingItemTermId", "createdAt", "updatedAt") FROM stdin;
1	1	1	2023-11-09 05:02:39.1	2023-11-09 05:02:39.1
2	1	2	2023-11-09 05:02:41.781	2023-11-09 05:02:41.781
3	2	3	2023-11-09 05:02:41.781	2023-11-09 05:02:41.781
4	1	3	2023-11-09 05:02:41.781	2023-11-09 05:02:41.781
5	1	4	2023-11-09 05:02:45.273	2023-11-09 05:02:45.273
6	2	5	2023-11-09 05:02:48.167	2023-11-09 05:02:48.167
7	1	6	2023-11-09 05:02:50.449	2023-11-09 05:02:50.449
8	2	7	2023-11-09 05:02:50.449	2023-11-09 05:02:50.449
9	1	8	2023-11-09 05:02:50.449	2023-11-09 05:02:50.449
\.


--
-- Data for Name: PaymentMethod; Type: TABLE DATA; Schema: public; Owner: expend_manage_admin
--

COPY public."PaymentMethod" (id, code, "createdAt", "updatedAt", name, "payerId") FROM stdin;
1	visa8119	2023-11-09 05:02:38.45	2023-11-09 05:02:38.45	VISA（8119）	1
2	jcb1323	2023-11-09 05:02:38.45	2023-11-09 05:02:38.45	JCB（1323）	1
3	cash-akihiro	2023-11-09 05:02:38.45	2023-11-09 05:02:38.45	明弘現金	1
4	cash-risa	2023-11-09 05:02:38.45	2023-11-09 05:02:38.45	李沙現金	2
5	mizuho	2023-11-09 05:02:38.45	2023-11-09 05:02:38.45	みずほ振替	1
6	chibagin	2023-11-09 05:02:38.45	2023-11-09 05:02:38.45	ちば銀行振替	1
\.


--
-- Data for Name: PaymentMethodOnCountingItem; Type: TABLE DATA; Schema: public; Owner: expend_manage_admin
--

COPY public."PaymentMethodOnCountingItem" (id, "paymentMethodId", "countingItemId", "createdAt", "updatedAt") FROM stdin;
1	6	1	2023-11-09 05:02:54.123	2023-11-09 05:02:54.123
2	5	1	2023-11-09 05:02:54.123	2023-11-09 05:02:54.123
3	3	1	2023-11-09 05:02:54.123	2023-11-09 05:02:54.123
4	2	1	2023-11-09 05:02:54.123	2023-11-09 05:02:54.123
5	1	1	2023-11-09 05:02:54.123	2023-11-09 05:02:54.123
6	4	2	2023-11-09 05:02:56.007	2023-11-09 05:02:56.007
\.


--
-- Data for Name: PaymentMethodOnCustomCountingItemTerm; Type: TABLE DATA; Schema: public; Owner: expend_manage_admin
--

COPY public."PaymentMethodOnCustomCountingItemTerm" (id, "paymentMethodId", "customCountingItemTermId", "createdAt", "updatedAt") FROM stdin;
1	6	1	2023-11-09 05:02:39.1	2023-11-09 05:02:39.1
2	5	1	2023-11-09 05:02:39.1	2023-11-09 05:02:39.1
3	3	1	2023-11-09 05:02:39.1	2023-11-09 05:02:39.1
4	2	1	2023-11-09 05:02:39.1	2023-11-09 05:02:39.1
5	1	1	2023-11-09 05:02:39.1	2023-11-09 05:02:39.1
6	6	2	2023-11-09 05:02:41.781	2023-11-09 05:02:41.781
7	5	2	2023-11-09 05:02:41.781	2023-11-09 05:02:41.781
8	4	2	2023-11-09 05:02:41.781	2023-11-09 05:02:41.781
9	3	2	2023-11-09 05:02:41.781	2023-11-09 05:02:41.781
10	2	2	2023-11-09 05:02:41.781	2023-11-09 05:02:41.781
11	1	2	2023-11-09 05:02:41.781	2023-11-09 05:02:41.781
12	6	3	2023-11-09 05:02:41.781	2023-11-09 05:02:41.781
13	5	3	2023-11-09 05:02:41.781	2023-11-09 05:02:41.781
14	4	3	2023-11-09 05:02:41.781	2023-11-09 05:02:41.781
15	3	3	2023-11-09 05:02:41.781	2023-11-09 05:02:41.781
16	2	3	2023-11-09 05:02:41.781	2023-11-09 05:02:41.781
17	1	3	2023-11-09 05:02:41.781	2023-11-09 05:02:41.781
18	6	4	2023-11-09 05:02:45.273	2023-11-09 05:02:45.273
19	5	4	2023-11-09 05:02:45.273	2023-11-09 05:02:45.273
20	3	4	2023-11-09 05:02:45.273	2023-11-09 05:02:45.273
21	2	4	2023-11-09 05:02:45.273	2023-11-09 05:02:45.273
22	1	4	2023-11-09 05:02:45.273	2023-11-09 05:02:45.273
23	4	5	2023-11-09 05:02:48.167	2023-11-09 05:02:48.167
24	6	6	2023-11-09 05:02:50.449	2023-11-09 05:02:50.449
25	5	6	2023-11-09 05:02:50.449	2023-11-09 05:02:50.449
26	3	6	2023-11-09 05:02:50.449	2023-11-09 05:02:50.449
27	2	6	2023-11-09 05:02:50.449	2023-11-09 05:02:50.449
28	1	6	2023-11-09 05:02:50.449	2023-11-09 05:02:50.449
29	4	7	2023-11-09 05:02:50.449	2023-11-09 05:02:50.449
30	6	8	2023-11-09 05:02:50.449	2023-11-09 05:02:50.449
31	5	8	2023-11-09 05:02:50.449	2023-11-09 05:02:50.449
32	3	8	2023-11-09 05:02:50.449	2023-11-09 05:02:50.449
33	2	8	2023-11-09 05:02:50.449	2023-11-09 05:02:50.449
34	1	8	2023-11-09 05:02:50.449	2023-11-09 05:02:50.449
\.


--
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: expend_manage_admin
--

COPY public."User" (id, "createdAt", "updatedAt", email, image, role) FROM stdin;
1	2023-11-09 05:02:36.845	2023-11-09 05:02:36.845	dayoshii27@gmail.com	\N	ADMIN
2	2023-11-09 05:02:36.845	2023-11-09 05:02:36.845	yayr1015@gmail.com	\N	USER
\.


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: expend_manage_admin
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
576641c7-59c2-4cf5-89d2-5941f68bc6b0	a39bb8094792b834f3cbda34b51b8433000c64e82a260c78549b7d7f61cf1edf	2023-11-09 14:02:18.553512+09	20230829053525_init	\N	\N	2023-11-09 14:02:18.139202+09	1
5e959f72-a689-4153-8759-282bb39e8b79	b1d9fff3331df95ef9c6e70c605d45d44745d13c617bb44bd2e2ec40f1f7cce3	2023-11-09 14:02:19.098576+09	20230829065016_init	\N	\N	2023-11-09 14:02:18.708158+09	1
8f4bf218-e098-484f-b204-1f4a7b65f57d	739d4ca4c351f3fa7cf41038a10faf5d3ba9299f48c8aab5182586f48692e4fb	2023-11-09 14:02:19.672312+09	20230829074831_init	\N	\N	2023-11-09 14:02:19.255962+09	1
625e4dac-8543-40c1-ba83-ccbd7b897e53	580560d8c54011eb52edf626cf6187b616e052dfac41cbd196b7271f5404f968	2023-11-09 14:02:20.211166+09	20230829075110_init	\N	\N	2023-11-09 14:02:19.826293+09	1
447a93d4-3239-4267-a5b5-1004d2c68383	5c0896d66da904da24c085a1ca70dd63415205fb6973b7069d2542b2ac7e66c4	2023-11-09 14:02:20.770179+09	20230829085159_init	\N	\N	2023-11-09 14:02:20.364419+09	1
e01d7ef3-2b53-449e-b67b-15b6145cdcae	deb4fae3e292d1d7d96f69b03c0b2f1fc07ae668be6a2861b2a95535f18187b4	2023-11-09 14:02:21.310311+09	20231105003711_init	\N	\N	2023-11-09 14:02:20.924711+09	1
\.


--
-- Name: BudgetOnCountingItem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: expend_manage_admin
--

SELECT pg_catalog.setval('public."BudgetOnCountingItem_id_seq"', 2, true);


--
-- Name: BudgetOnCustomCountingItemTerm_id_seq; Type: SEQUENCE SET; Schema: public; Owner: expend_manage_admin
--

SELECT pg_catalog.setval('public."BudgetOnCustomCountingItemTerm_id_seq"', 8, true);


--
-- Name: Budget_id_seq; Type: SEQUENCE SET; Schema: public; Owner: expend_manage_admin
--

SELECT pg_catalog.setval('public."Budget_id_seq"', 3, true);


--
-- Name: CategoryOnCustomCountingItemTerm_id_seq; Type: SEQUENCE SET; Schema: public; Owner: expend_manage_admin
--

SELECT pg_catalog.setval('public."CategoryOnCustomCountingItemTerm_id_seq"', 25, true);


--
-- Name: Category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: expend_manage_admin
--

SELECT pg_catalog.setval('public."Category_id_seq"', 12, true);


--
-- Name: CountingItem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: expend_manage_admin
--

SELECT pg_catalog.setval('public."CountingItem_id_seq"', 2, true);


--
-- Name: CustomCountingItemTerm_id_seq; Type: SEQUENCE SET; Schema: public; Owner: expend_manage_admin
--

SELECT pg_catalog.setval('public."CustomCountingItemTerm_id_seq"', 8, true);


--
-- Name: CustomCountingItem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: expend_manage_admin
--

SELECT pg_catalog.setval('public."CustomCountingItem_id_seq"', 1, false);


--
-- Name: Expend_id_seq; Type: SEQUENCE SET; Schema: public; Owner: expend_manage_admin
--

SELECT pg_catalog.setval('public."Expend_id_seq"', 1536, true);


--
-- Name: PayerOnCountingItem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: expend_manage_admin
--

SELECT pg_catalog.setval('public."PayerOnCountingItem_id_seq"', 2, true);


--
-- Name: PayerOnCustomCountingItemTerm_id_seq; Type: SEQUENCE SET; Schema: public; Owner: expend_manage_admin
--

SELECT pg_catalog.setval('public."PayerOnCustomCountingItemTerm_id_seq"', 9, true);


--
-- Name: Payer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: expend_manage_admin
--

SELECT pg_catalog.setval('public."Payer_id_seq"', 2, true);


--
-- Name: PaymentMethodOnCountingItem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: expend_manage_admin
--

SELECT pg_catalog.setval('public."PaymentMethodOnCountingItem_id_seq"', 6, true);


--
-- Name: PaymentMethodOnCustomCountingItemTerm_id_seq; Type: SEQUENCE SET; Schema: public; Owner: expend_manage_admin
--

SELECT pg_catalog.setval('public."PaymentMethodOnCustomCountingItemTerm_id_seq"', 34, true);


--
-- Name: PaymentMethod_id_seq; Type: SEQUENCE SET; Schema: public; Owner: expend_manage_admin
--

SELECT pg_catalog.setval('public."PaymentMethod_id_seq"', 6, true);


--
-- Name: User_id_seq; Type: SEQUENCE SET; Schema: public; Owner: expend_manage_admin
--

SELECT pg_catalog.setval('public."User_id_seq"', 2, true);


--
-- Name: BudgetOnCountingItem BudgetOnCountingItem_pkey; Type: CONSTRAINT; Schema: public; Owner: expend_manage_admin
--

ALTER TABLE ONLY public."BudgetOnCountingItem"
    ADD CONSTRAINT "BudgetOnCountingItem_pkey" PRIMARY KEY (id);


--
-- Name: BudgetOnCustomCountingItemTerm BudgetOnCustomCountingItemTerm_pkey; Type: CONSTRAINT; Schema: public; Owner: expend_manage_admin
--

ALTER TABLE ONLY public."BudgetOnCustomCountingItemTerm"
    ADD CONSTRAINT "BudgetOnCustomCountingItemTerm_pkey" PRIMARY KEY (id);


--
-- Name: Budget Budget_pkey; Type: CONSTRAINT; Schema: public; Owner: expend_manage_admin
--

ALTER TABLE ONLY public."Budget"
    ADD CONSTRAINT "Budget_pkey" PRIMARY KEY (id);


--
-- Name: CategoryOnCustomCountingItemTerm CategoryOnCustomCountingItemTerm_pkey; Type: CONSTRAINT; Schema: public; Owner: expend_manage_admin
--

ALTER TABLE ONLY public."CategoryOnCustomCountingItemTerm"
    ADD CONSTRAINT "CategoryOnCustomCountingItemTerm_pkey" PRIMARY KEY (id);


--
-- Name: Category Category_pkey; Type: CONSTRAINT; Schema: public; Owner: expend_manage_admin
--

ALTER TABLE ONLY public."Category"
    ADD CONSTRAINT "Category_pkey" PRIMARY KEY (id);


--
-- Name: CountingItem CountingItem_pkey; Type: CONSTRAINT; Schema: public; Owner: expend_manage_admin
--

ALTER TABLE ONLY public."CountingItem"
    ADD CONSTRAINT "CountingItem_pkey" PRIMARY KEY (id);


--
-- Name: CustomCountingItemTerm CustomCountingItemTerm_pkey; Type: CONSTRAINT; Schema: public; Owner: expend_manage_admin
--

ALTER TABLE ONLY public."CustomCountingItemTerm"
    ADD CONSTRAINT "CustomCountingItemTerm_pkey" PRIMARY KEY (id);


--
-- Name: CustomCountingItem CustomCountingItem_pkey; Type: CONSTRAINT; Schema: public; Owner: expend_manage_admin
--

ALTER TABLE ONLY public."CustomCountingItem"
    ADD CONSTRAINT "CustomCountingItem_pkey" PRIMARY KEY (id);


--
-- Name: Expend Expend_pkey; Type: CONSTRAINT; Schema: public; Owner: expend_manage_admin
--

ALTER TABLE ONLY public."Expend"
    ADD CONSTRAINT "Expend_pkey" PRIMARY KEY (id);


--
-- Name: PayerOnCountingItem PayerOnCountingItem_pkey; Type: CONSTRAINT; Schema: public; Owner: expend_manage_admin
--

ALTER TABLE ONLY public."PayerOnCountingItem"
    ADD CONSTRAINT "PayerOnCountingItem_pkey" PRIMARY KEY (id);


--
-- Name: PayerOnCustomCountingItemTerm PayerOnCustomCountingItemTerm_pkey; Type: CONSTRAINT; Schema: public; Owner: expend_manage_admin
--

ALTER TABLE ONLY public."PayerOnCustomCountingItemTerm"
    ADD CONSTRAINT "PayerOnCustomCountingItemTerm_pkey" PRIMARY KEY (id);


--
-- Name: Payer Payer_pkey; Type: CONSTRAINT; Schema: public; Owner: expend_manage_admin
--

ALTER TABLE ONLY public."Payer"
    ADD CONSTRAINT "Payer_pkey" PRIMARY KEY (id);


--
-- Name: PaymentMethodOnCountingItem PaymentMethodOnCountingItem_pkey; Type: CONSTRAINT; Schema: public; Owner: expend_manage_admin
--

ALTER TABLE ONLY public."PaymentMethodOnCountingItem"
    ADD CONSTRAINT "PaymentMethodOnCountingItem_pkey" PRIMARY KEY (id);


--
-- Name: PaymentMethodOnCustomCountingItemTerm PaymentMethodOnCustomCountingItemTerm_pkey; Type: CONSTRAINT; Schema: public; Owner: expend_manage_admin
--

ALTER TABLE ONLY public."PaymentMethodOnCustomCountingItemTerm"
    ADD CONSTRAINT "PaymentMethodOnCustomCountingItemTerm_pkey" PRIMARY KEY (id);


--
-- Name: PaymentMethod PaymentMethod_pkey; Type: CONSTRAINT; Schema: public; Owner: expend_manage_admin
--

ALTER TABLE ONLY public."PaymentMethod"
    ADD CONSTRAINT "PaymentMethod_pkey" PRIMARY KEY (id);


--
-- Name: User User_pkey; Type: CONSTRAINT; Schema: public; Owner: expend_manage_admin
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: expend_manage_admin
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- Name: BudgetOnCountingItem_budgetId_countingItemId_key; Type: INDEX; Schema: public; Owner: expend_manage_admin
--

CREATE UNIQUE INDEX "BudgetOnCountingItem_budgetId_countingItemId_key" ON public."BudgetOnCountingItem" USING btree ("budgetId", "countingItemId");


--
-- Name: BudgetOnCustomCountingItemTerm_budgetId_customCountingItemT_key; Type: INDEX; Schema: public; Owner: expend_manage_admin
--

CREATE UNIQUE INDEX "BudgetOnCustomCountingItemTerm_budgetId_customCountingItemT_key" ON public."BudgetOnCustomCountingItemTerm" USING btree ("budgetId", "customCountingItemTermId");


--
-- Name: Budget_code_key; Type: INDEX; Schema: public; Owner: expend_manage_admin
--

CREATE UNIQUE INDEX "Budget_code_key" ON public."Budget" USING btree (code);


--
-- Name: CategoryOnCustomCountingItemTerm_categoryId_customCountingI_key; Type: INDEX; Schema: public; Owner: expend_manage_admin
--

CREATE UNIQUE INDEX "CategoryOnCustomCountingItemTerm_categoryId_customCountingI_key" ON public."CategoryOnCustomCountingItemTerm" USING btree ("categoryId", "customCountingItemTermId");


--
-- Name: Category_code_key; Type: INDEX; Schema: public; Owner: expend_manage_admin
--

CREATE UNIQUE INDEX "Category_code_key" ON public."Category" USING btree (code);


--
-- Name: CountingItem_code_key; Type: INDEX; Schema: public; Owner: expend_manage_admin
--

CREATE UNIQUE INDEX "CountingItem_code_key" ON public."CountingItem" USING btree (code);


--
-- Name: CustomCountingItem_code_key; Type: INDEX; Schema: public; Owner: expend_manage_admin
--

CREATE UNIQUE INDEX "CustomCountingItem_code_key" ON public."CustomCountingItem" USING btree (code);


--
-- Name: PayerOnCountingItem_payerId_countingItemId_key; Type: INDEX; Schema: public; Owner: expend_manage_admin
--

CREATE UNIQUE INDEX "PayerOnCountingItem_payerId_countingItemId_key" ON public."PayerOnCountingItem" USING btree ("payerId", "countingItemId");


--
-- Name: PayerOnCustomCountingItemTerm_payerId_customCountingItemTer_key; Type: INDEX; Schema: public; Owner: expend_manage_admin
--

CREATE UNIQUE INDEX "PayerOnCustomCountingItemTerm_payerId_customCountingItemTer_key" ON public."PayerOnCustomCountingItemTerm" USING btree ("payerId", "customCountingItemTermId");


--
-- Name: Payer_code_key; Type: INDEX; Schema: public; Owner: expend_manage_admin
--

CREATE UNIQUE INDEX "Payer_code_key" ON public."Payer" USING btree (code);


--
-- Name: PaymentMethodOnCountingItem_paymentMethodId_countingItemId_key; Type: INDEX; Schema: public; Owner: expend_manage_admin
--

CREATE UNIQUE INDEX "PaymentMethodOnCountingItem_paymentMethodId_countingItemId_key" ON public."PaymentMethodOnCountingItem" USING btree ("paymentMethodId", "countingItemId");


--
-- Name: PaymentMethodOnCustomCountingItemTerm_paymentMethodId_custo_key; Type: INDEX; Schema: public; Owner: expend_manage_admin
--

CREATE UNIQUE INDEX "PaymentMethodOnCustomCountingItemTerm_paymentMethodId_custo_key" ON public."PaymentMethodOnCustomCountingItemTerm" USING btree ("paymentMethodId", "customCountingItemTermId");


--
-- Name: PaymentMethod_code_key; Type: INDEX; Schema: public; Owner: expend_manage_admin
--

CREATE UNIQUE INDEX "PaymentMethod_code_key" ON public."PaymentMethod" USING btree (code);


--
-- Name: User_email_key; Type: INDEX; Schema: public; Owner: expend_manage_admin
--

CREATE UNIQUE INDEX "User_email_key" ON public."User" USING btree (email);


--
-- Name: BudgetOnCountingItem BudgetOnCountingItem_budgetId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: expend_manage_admin
--

ALTER TABLE ONLY public."BudgetOnCountingItem"
    ADD CONSTRAINT "BudgetOnCountingItem_budgetId_fkey" FOREIGN KEY ("budgetId") REFERENCES public."Budget"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: BudgetOnCountingItem BudgetOnCountingItem_countingItemId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: expend_manage_admin
--

ALTER TABLE ONLY public."BudgetOnCountingItem"
    ADD CONSTRAINT "BudgetOnCountingItem_countingItemId_fkey" FOREIGN KEY ("countingItemId") REFERENCES public."CountingItem"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: BudgetOnCustomCountingItemTerm BudgetOnCustomCountingItemTerm_budgetId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: expend_manage_admin
--

ALTER TABLE ONLY public."BudgetOnCustomCountingItemTerm"
    ADD CONSTRAINT "BudgetOnCustomCountingItemTerm_budgetId_fkey" FOREIGN KEY ("budgetId") REFERENCES public."Budget"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: BudgetOnCustomCountingItemTerm BudgetOnCustomCountingItemTerm_customCountingItemTermId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: expend_manage_admin
--

ALTER TABLE ONLY public."BudgetOnCustomCountingItemTerm"
    ADD CONSTRAINT "BudgetOnCustomCountingItemTerm_customCountingItemTermId_fkey" FOREIGN KEY ("customCountingItemTermId") REFERENCES public."CustomCountingItemTerm"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: CategoryOnCustomCountingItemTerm CategoryOnCustomCountingItemTerm_categoryId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: expend_manage_admin
--

ALTER TABLE ONLY public."CategoryOnCustomCountingItemTerm"
    ADD CONSTRAINT "CategoryOnCustomCountingItemTerm_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES public."Category"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: CategoryOnCustomCountingItemTerm CategoryOnCustomCountingItemTerm_customCountingItemTermId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: expend_manage_admin
--

ALTER TABLE ONLY public."CategoryOnCustomCountingItemTerm"
    ADD CONSTRAINT "CategoryOnCustomCountingItemTerm_customCountingItemTermId_fkey" FOREIGN KEY ("customCountingItemTermId") REFERENCES public."CustomCountingItemTerm"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: CustomCountingItemTerm CustomCountingItemTerm_customCountingItemId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: expend_manage_admin
--

ALTER TABLE ONLY public."CustomCountingItemTerm"
    ADD CONSTRAINT "CustomCountingItemTerm_customCountingItemId_fkey" FOREIGN KEY ("customCountingItemId") REFERENCES public."CustomCountingItem"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Expend Expend_budgetId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: expend_manage_admin
--

ALTER TABLE ONLY public."Expend"
    ADD CONSTRAINT "Expend_budgetId_fkey" FOREIGN KEY ("budgetId") REFERENCES public."Budget"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Expend Expend_categoryId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: expend_manage_admin
--

ALTER TABLE ONLY public."Expend"
    ADD CONSTRAINT "Expend_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES public."Category"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Expend Expend_payerId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: expend_manage_admin
--

ALTER TABLE ONLY public."Expend"
    ADD CONSTRAINT "Expend_payerId_fkey" FOREIGN KEY ("payerId") REFERENCES public."Payer"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Expend Expend_paymentMethodId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: expend_manage_admin
--

ALTER TABLE ONLY public."Expend"
    ADD CONSTRAINT "Expend_paymentMethodId_fkey" FOREIGN KEY ("paymentMethodId") REFERENCES public."PaymentMethod"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: PayerOnCountingItem PayerOnCountingItem_countingItemId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: expend_manage_admin
--

ALTER TABLE ONLY public."PayerOnCountingItem"
    ADD CONSTRAINT "PayerOnCountingItem_countingItemId_fkey" FOREIGN KEY ("countingItemId") REFERENCES public."CountingItem"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: PayerOnCountingItem PayerOnCountingItem_payerId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: expend_manage_admin
--

ALTER TABLE ONLY public."PayerOnCountingItem"
    ADD CONSTRAINT "PayerOnCountingItem_payerId_fkey" FOREIGN KEY ("payerId") REFERENCES public."Payer"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: PayerOnCustomCountingItemTerm PayerOnCustomCountingItemTerm_customCountingItemTermId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: expend_manage_admin
--

ALTER TABLE ONLY public."PayerOnCustomCountingItemTerm"
    ADD CONSTRAINT "PayerOnCustomCountingItemTerm_customCountingItemTermId_fkey" FOREIGN KEY ("customCountingItemTermId") REFERENCES public."CustomCountingItemTerm"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: PayerOnCustomCountingItemTerm PayerOnCustomCountingItemTerm_payerId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: expend_manage_admin
--

ALTER TABLE ONLY public."PayerOnCustomCountingItemTerm"
    ADD CONSTRAINT "PayerOnCustomCountingItemTerm_payerId_fkey" FOREIGN KEY ("payerId") REFERENCES public."Payer"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: PaymentMethodOnCountingItem PaymentMethodOnCountingItem_countingItemId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: expend_manage_admin
--

ALTER TABLE ONLY public."PaymentMethodOnCountingItem"
    ADD CONSTRAINT "PaymentMethodOnCountingItem_countingItemId_fkey" FOREIGN KEY ("countingItemId") REFERENCES public."CountingItem"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: PaymentMethodOnCountingItem PaymentMethodOnCountingItem_paymentMethodId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: expend_manage_admin
--

ALTER TABLE ONLY public."PaymentMethodOnCountingItem"
    ADD CONSTRAINT "PaymentMethodOnCountingItem_paymentMethodId_fkey" FOREIGN KEY ("paymentMethodId") REFERENCES public."PaymentMethod"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: PaymentMethodOnCustomCountingItemTerm PaymentMethodOnCustomCountingItemTerm_customCountingItemTe_fkey; Type: FK CONSTRAINT; Schema: public; Owner: expend_manage_admin
--

ALTER TABLE ONLY public."PaymentMethodOnCustomCountingItemTerm"
    ADD CONSTRAINT "PaymentMethodOnCustomCountingItemTerm_customCountingItemTe_fkey" FOREIGN KEY ("customCountingItemTermId") REFERENCES public."CustomCountingItemTerm"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: PaymentMethodOnCustomCountingItemTerm PaymentMethodOnCustomCountingItemTerm_paymentMethodId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: expend_manage_admin
--

ALTER TABLE ONLY public."PaymentMethodOnCustomCountingItemTerm"
    ADD CONSTRAINT "PaymentMethodOnCustomCountingItemTerm_paymentMethodId_fkey" FOREIGN KEY ("paymentMethodId") REFERENCES public."PaymentMethod"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: PaymentMethod PaymentMethod_payerId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: expend_manage_admin
--

ALTER TABLE ONLY public."PaymentMethod"
    ADD CONSTRAINT "PaymentMethod_payerId_fkey" FOREIGN KEY ("payerId") REFERENCES public."Payer"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--


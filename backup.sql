--
-- PostgreSQL database dump
--

-- Dumped from database version 17.1 (Debian 17.1-1.pgdg120+1)
-- Dumped by pg_dump version 17.1 (Debian 17.1-1.pgdg120+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: active_storage_attachments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.active_storage_attachments (
    id bigint NOT NULL,
    name character varying NOT NULL,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    blob_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.active_storage_attachments OWNER TO postgres;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.active_storage_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.active_storage_attachments_id_seq OWNER TO postgres;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.active_storage_attachments_id_seq OWNED BY public.active_storage_attachments.id;


--
-- Name: active_storage_blobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.active_storage_blobs (
    id bigint NOT NULL,
    key character varying NOT NULL,
    filename character varying NOT NULL,
    content_type character varying,
    metadata text,
    service_name character varying NOT NULL,
    byte_size bigint NOT NULL,
    checksum character varying,
    created_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.active_storage_blobs OWNER TO postgres;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.active_storage_blobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.active_storage_blobs_id_seq OWNER TO postgres;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.active_storage_blobs_id_seq OWNED BY public.active_storage_blobs.id;


--
-- Name: active_storage_variant_records; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.active_storage_variant_records (
    id bigint NOT NULL,
    blob_id bigint NOT NULL,
    variation_digest character varying NOT NULL
);


ALTER TABLE public.active_storage_variant_records OWNER TO postgres;

--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.active_storage_variant_records_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.active_storage_variant_records_id_seq OWNER TO postgres;

--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.active_storage_variant_records_id_seq OWNED BY public.active_storage_variant_records.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO postgres;

--
-- Name: favorites; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.favorites (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    shop_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.favorites OWNER TO postgres;

--
-- Name: favorites_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.favorites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.favorites_id_seq OWNER TO postgres;

--
-- Name: favorites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.favorites_id_seq OWNED BY public.favorites.id;


--
-- Name: reviews; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    shop_id bigint NOT NULL,
    title character varying,
    content text,
    rating integer,
    status integer DEFAULT 0,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.reviews OWNER TO postgres;

--
-- Name: reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.reviews_id_seq OWNER TO postgres;

--
-- Name: reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_id_seq OWNED BY public.reviews.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO postgres;

--
-- Name: shops; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shops (
    id bigint NOT NULL,
    title character varying NOT NULL,
    address character varying,
    description text,
    area character varying,
    budget integer,
    scene character varying,
    opening_hours character varying,
    shop_number character varying,
    shop_url character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    latitude double precision,
    longitude double precision,
    shop_image character varying
);


ALTER TABLE public.shops OWNER TO postgres;

--
-- Name: shops_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shops_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.shops_id_seq OWNER TO postgres;

--
-- Name: shops_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shops_id_seq OWNED BY public.shops.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp(6) without time zone,
    remember_created_at timestamp(6) without time zone,
    confirmation_token character varying,
    confirmed_at timestamp(6) without time zone,
    confirmation_sent_at timestamp(6) without time zone,
    name character varying,
    nickname character varying,
    avatar character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    provider character varying,
    uid character varying,
    image character varying,
    oauth_token character varying,
    oauth_expires_at timestamp(6) without time zone,
    unconfirmed_email character varying,
    role character varying DEFAULT '0'::character varying NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
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
-- Name: active_storage_attachments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_attachments ALTER COLUMN id SET DEFAULT nextval('public.active_storage_attachments_id_seq'::regclass);


--
-- Name: active_storage_blobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_blobs ALTER COLUMN id SET DEFAULT nextval('public.active_storage_blobs_id_seq'::regclass);


--
-- Name: active_storage_variant_records id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_variant_records ALTER COLUMN id SET DEFAULT nextval('public.active_storage_variant_records_id_seq'::regclass);


--
-- Name: favorites id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorites ALTER COLUMN id SET DEFAULT nextval('public.favorites_id_seq'::regclass);


--
-- Name: reviews id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews ALTER COLUMN id SET DEFAULT nextval('public.reviews_id_seq'::regclass);


--
-- Name: shops id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shops ALTER COLUMN id SET DEFAULT nextval('public.shops_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: active_storage_attachments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) FROM stdin;
1	avatar	User	1	1	2024-11-22 21:45:45.69603
2	image	ActiveStorage::VariantRecord	1	2	2024-11-22 21:45:58.518398
6	image	ActiveStorage::VariantRecord	4	6	2024-11-29 20:50:38.411984
7	image	ActiveStorage::VariantRecord	5	7	2024-11-29 20:53:02.251625
10	avatar	User	2	10	2024-11-29 22:37:43.614158
11	image	ActiveStorage::VariantRecord	8	11	2024-11-29 22:39:17.074165
12	image	ActiveStorage::VariantRecord	9	12	2024-11-29 22:39:27.384082
17	image	ActiveStorage::VariantRecord	12	17	2024-11-29 23:37:00.442046
18	shop_image	Shop	1	18	2024-12-01 01:03:49.720222
19	image	ActiveStorage::VariantRecord	13	19	2024-12-01 01:03:50.108005
20	image	ActiveStorage::VariantRecord	14	20	2024-12-01 20:50:07.551575
\.


--
-- Data for Name: active_storage_blobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.active_storage_blobs (id, key, filename, content_type, metadata, service_name, byte_size, checksum, created_at) FROM stdin;
1	xzekrl8t5kavwvx8wteduhzxp1hm	cat.png	image/png	{"identified":true,"width":908,"height":1124,"analyzed":true}	local	1774925	x+YhTTJ1Q1afaOaakvxCMw==	2024-11-22 21:45:45.694134
2	sl5phvu6yy8yrdk7hj5m3rd6a9xo	cat.png	image/png	{"identified":true,"width":40,"height":40,"analyzed":true}	local	7531	xTmVrctRgs5Pp9LGwPf+mQ==	2024-11-22 21:45:58.516897
6	rbbtzwxv1itxpucc5u4hyhk2pnv4	cat.png	image/png	{"identified":true,"width":242,"height":300,"analyzed":true}	local	114066	EV6HgQcz2GUndOf5HbO0Ng==	2024-11-29 20:50:38.404656
7	ls9x12q12xiovoiqompdfsju3aju	cat.png	image/png	{"identified":true,"width":162,"height":200,"analyzed":true}	local	56979	eDyDK9iEZtnE9gogxuju2Q==	2024-11-29 20:53:02.24884
10	xwiao028wayuilt5wlg6ykkatnkp	cat.png	image/png	{"identified":true,"width":908,"height":1124,"analyzed":true}	local	1774925	x+YhTTJ1Q1afaOaakvxCMw==	2024-11-29 22:37:43.611693
11	2yxjxtdy1ie1v46ssaht5c3wy3qz	cat.png	image/png	{"identified":true,"width":81,"height":100,"analyzed":true}	local	19460	PXh32vS5OFpAanZa7nDFKQ==	2024-11-29 22:39:17.071932
12	xvotnnt5bmzkq4gsths5ipxpdxwq	cat.png	image/png	{"identified":true,"width":162,"height":200,"analyzed":true}	local	56979	k1IwkS/ZQl2JORfcyV9mbA==	2024-11-29 22:39:27.381265
17	350iws1l7pn1tadaabtze46o3574	cat.png	image/png	{"identified":true,"width":242,"height":300,"analyzed":true}	local	114066	C2ugv/1tewJQQY1aiqlY4A==	2024-11-29 23:37:00.438601
18	uuap97r6080t9f2uimki6m5bbasz	shisha.jpg	image/jpeg	{"identified":true,"width":1380,"height":920,"analyzed":true}	local	207543	sR2ItTsYOR8AIxK7uNo31g==	2024-12-01 01:03:49.716003
19	hlra3l6ou5dpz9cza1lj9nk6j3he	shisha.jpg	image/jpeg	{"identified":true,"width":300,"height":200,"analyzed":true}	local	22355	Jb9Z6Q/Os8svgd0mSqLrfA==	2024-12-01 01:03:50.104771
20	xj9odma6fogd0821fd4cmw5hztr3	cat.png	image/png	{"identified":true,"width":40,"height":40,"analyzed":true}	local	7531	uwPxtPM78AlrgBEE7iUs7A==	2024-12-01 20:50:07.546969
\.


--
-- Data for Name: active_storage_variant_records; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.active_storage_variant_records (id, blob_id, variation_digest) FROM stdin;
1	1	AbDxa5l0iNC//hFCmWMUh7hMI10=
4	1	nf8EDd9cjqXcpCVa3KWcvs7V2Ys=
5	1	hI+tDtvE0IjoWfC+hG8sAyT2gQ4=
8	10	2Bqx5vdSCVhcpp5LZVhC+s+XC9A=
9	10	hI+tDtvE0IjoWfC+hG8sAyT2gQ4=
12	10	nf8EDd9cjqXcpCVa3KWcvs7V2Ys=
13	18	EnmLd04+ekx9xrh7DDiJZuBlkbQ=
14	10	AbDxa5l0iNC//hFCmWMUh7hMI10=
\.


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2024-11-22 20:43:26.482126	2024-11-22 20:43:26.48213
schema_sha1	6f90bf680d29fcd40f88aa2ccfd6466815216464	2024-11-22 20:43:26.487277	2024-11-22 20:43:26.48728
\.


--
-- Data for Name: favorites; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.favorites (id, user_id, shop_id, created_at, updated_at) FROM stdin;
2	1	723	2024-12-05 18:40:44.435471	2024-12-05 18:40:44.435471
3	1	722	2024-12-05 18:40:45.616887	2024-12-05 18:40:45.616887
\.


--
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews (id, user_id, shop_id, title, content, rating, status, created_at, updated_at) FROM stdin;
1	1	1	テスト	テスト投稿	\N	0	2024-11-22 21:46:16.081214	2024-11-22 21:46:16.081214
2	1	1	テスト投稿	テスト\nテスト\nテスト\nテスト	\N	0	2024-11-22 21:48:32.585335	2024-11-22 21:48:32.585335
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.schema_migrations (version) FROM stdin;
20241117120947
20241109093936
20241019091141
20241012085255
20240908044433
20240907141641
20240907125406
20240907123531
20240905104402
20240903075146
20240827124104
20240825085226
20241127111325
\.


--
-- Data for Name: shops; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shops (id, title, address, description, area, budget, scene, opening_hours, shop_number, shop_url, created_at, updated_at, latitude, longitude, shop_image) FROM stdin;
260	Gagarin	東京都新宿区高田馬場４丁目８	\N	新宿	2	\N	15:00 〜 24:00	03-6279-1186	http://gagarin-hookah.sakura.ne.jp/en	2024-12-01 00:07:30.005998	2024-12-06 23:14:18.639234	35.7135674	139.7035027	\N
1	Shisha Lounge IRIS 目黒店	東京都目黒区上目黒2-1-1 目黒駅前ビル5F	目黒駅直結の洗練されたシーシャラウンジ。大人の隠れ家的空間で極上のシーシャタイムを。	目黒	4200	デート,女子会	17:00-翌3:00	03-5721-8855	https://iris-shisha.com/	2024-11-22 21:28:14.364977	2024-12-01 01:03:50.11023	35.6333	139.6987	https://images.unsplash.com/photo-1542332213-31f87348057f
723	ばんびえん高田馬場	東京都新宿区高田馬場2-14-8 NTビル2階A	\N	新宿	2	\N	16:00 〜 24:00	03-5937-5793	https://vangviengshisha.com/	2024-12-05 18:24:27.353232	2024-12-06 23:14:18.647327	35.7128382	139.706334	\N
274	L4L池袋西口店（4号店）	東京都豊島区池袋2-12-1 大晃第二ビル4階	\N	豊島	2	\N	営業中：12:00 〜 23:00	\N	\N	2024-12-01 00:07:42.070386	2024-12-05 18:24:27.393449	35.732243	139.7074645	\N
264	Tonttu Shisha	東京都 豊島区高田3-11-18TTAビル5階	\N	豊島	2	\N	14:00 〜 24:00	03-4361-4948	https://tonttu-shisha.com/	2024-12-01 00:07:33.571569	2024-12-06 23:14:18.654425	35.7140993	139.7058963	\N
266	シーパラ 渋谷店	東京都渋谷区道玄坂２丁目８−５ 渋谷ＤＭビル 2F	\N	渋谷	2	\N	12:00 〜 23:00	03-6416-4764	https://shisha-shipara.com/shop/shibuya/	2024-12-01 00:07:35.381951	2024-12-06 23:14:18.660708	35.6585559	139.6982232	\N
267	SHISHA CAFE NORTH VILLAGE 渋谷1号店	東京都渋谷区宇田川町４−１０ ゴールデンビル 1階	\N	渋谷	2	\N	13:00 〜 24:00	03-3461-1063	https://shisha.tokyo/	2024-12-01 00:07:36.164805	2024-12-06 23:14:18.663279	35.6625472	139.6976484	\N
268	Holiday	東京都渋谷区神宮前１丁目７−１０ 4F	\N	渋谷	2	\N	15:00 〜 23:00	03-6455-5189	https://twitter.com/shisha_harajuku	2024-12-01 00:07:37.023089	2024-12-06 23:14:18.665518	35.6706334	139.7054225	\N
269	ダビデシーシャ	東京都渋谷区神宮前1-21-15 ナポレ原宿3F	\N	渋谷	3	\N	13:00 〜 22:00	050-1454-2343	http://hookah-reviews.com/david-shisha/	2024-12-01 00:07:37.770646	2024-12-06 23:14:18.667979	35.6723585	139.7035406	\N
270	cafe&shisha bar oranger 表参道	東京都渋谷区神宮前6-6-6 隠田ファーストビル2F	\N	渋谷	3	\N	12:00 〜 24:00	03-5787-5465	https://twitter.com/oranger_omtsnd	2024-12-01 00:07:38.58981	2024-12-06 23:14:18.670289	35.6675642	139.7055359	\N
272	シーシャカフェ ハディーカ	東京都目黒区自由が丘２丁目１４−２０ 第７千陽ビル 3階	\N	目黒	2	\N	13:00 〜 24:00	03-6421-1069	https://shisha-kannok.shop/	2024-12-01 00:07:40.388283	2024-12-06 23:14:18.67454	35.6072139	139.6663947	\N
273	チルイン西武池袋店	東京都豊島区南池袋１丁目２０−１ 横田ビル B1	\N	豊島	2	\N	12:00 〜 24:00	03-6881-9988	https://shisha-chillin.com/	2024-12-01 00:07:41.238872	2024-12-06 23:14:18.677468	35.7280039	139.7128001	\N
724	L4L池袋西口店	東京都豊島区池袋2-12-1 大晃第二ビル4階	\N	豊島	2	\N	15:00 〜 5:00	03-6709-4670	https://www.l4lshisha.com/	2024-12-06 23:14:19.62562	2024-12-06 23:14:19.62562	35.732243	139.7074645	\N
275	Fumée	東京都港区芝5丁目32-9ecs第5ビル 4階	\N	港	3	\N	15:00 〜 24:00	03-6275-1018	https://shisha-suitai.com/shop/fumee.amebaownd.com	2024-12-01 00:07:42.80571	2024-12-06 23:14:19.640316	35.6472045	139.7475599	\N
277	LA NATURE(ラ・ナチュール)	東京都港区赤坂３丁目７−１５ 赤坂パラダイスⅡ 2階	\N	港	4	\N	15:00 〜 23:30	03-6426-5565	https://mobile.twitter.com/lanature_shisha	2024-12-01 00:07:44.527779	2024-12-06 23:14:19.647942	35.6751212	139.7376081	\N
278	シーシャCOCOSMOKE	東京都港区新橋２丁目１１−８ 地下2階 国土施設ビル	\N	港	3	\N	14:00 〜 23:00	03-6811-1194	https://coco-smoke.owst.jp/	2024-12-01 00:07:45.348489	2024-12-06 23:14:19.651515	35.6670998	139.7552168	\N
537	シーシャバーRAKUEN 渋谷店	東京都渋谷区宇田川町33-13 楠原ビル2F	\N	渋谷	\N	\N	営業中：13:00 〜 03:00	\N	\N	2024-12-01 00:11:40.334471	2024-12-05 17:37:58.916427	35.6609895	139.6969213	\N
279	ばんびえん中野店	東京都中野区中野５丁目３６−６	\N	中野	2	\N	14:00 〜 24:00	03-5937-5793	https://vangviengshisha.com/	2024-12-01 00:07:46.134696	2024-12-06 23:14:19.65471	35.7075597	139.6669671	\N
280	AKUBI ROOM	東京都杉並区高円寺南4-27-8 泰友ビル4FA号室	\N	杉並	2	\N	17:00 〜 24:00	no number	https://twitter.com/akubiroom	2024-12-01 00:07:46.884917	2024-12-06 23:14:19.657626	35.70463549999999	139.6498124	\N
281	KOENSHISHA	東京都杉並区高円寺南３丁目３７−２５-１F	\N	杉並	2	\N	14:00 〜 24:00	03-5913-9910	https://koen-shisha.tokyo/	2024-12-01 00:07:47.722798	2024-12-06 23:14:19.660288	35.7024212	139.6478495	\N
282	チルチルミチル	東京都杉並区高円寺北2-1-22 高円寺ビルド2F	\N	杉並	2	\N	13:00 〜 23:00	no number	https://twitter.com/chillmichi0819	2024-12-01 00:07:48.523145	2024-12-06 23:14:19.663029	35.7059559	139.6542266	\N
283	下井草ガネーシャ。	東京都杉並区下井草２丁目３９－７佐々倉ビル2階	\N	杉並	1	\N	14:00 〜 22:00	03-6913-8727	https://www.instagram.com/shimoigusa.ganesha/?hl=ja	2024-12-01 00:07:49.341212	2024-12-06 23:14:19.665354	35.7229494	139.6246189	\N
284	chotto	東京都世田谷区北沢３丁目１９−２０ reload 2-3	\N	世田谷	3	\N	12:00 〜 23:30	03-5761-6006	https://twitter.com/chotto_shisha	2024-12-01 00:07:50.471835	2024-12-06 23:14:19.667629	35.6635297	139.6701538	\N
285	Cradle-クレイドル-	東京都世田谷区経堂１丁目１２−１４ 中谷ビル 2階	\N	世田谷	2	\N	13:00 〜 23:00	03-6323-0683	https://cradle-shisha.studio.site/	2024-12-01 00:07:51.380815	2024-12-06 23:14:19.669924	35.6504672	139.6373488	\N
286	神田シーシャ WARP	東京都中央区日本橋室町４丁目２−１５ 楠和日本橋ビル ３F	\N	中央	3	\N	13:00 〜 24:00	080-7362-1949	https://shishawarp.site/	2024-12-01 00:07:52.186403	2024-12-06 23:14:19.67638	35.6896086	139.7714635	\N
287	shisha lounge Ginza（銀座）	東京都中央区銀座 西2-2 銀座INZ2 2F	\N	中央	4	\N	11:00 〜 23:00	050-1511-5589	https://twitter.com/ShishalngeGinza	2024-12-01 00:07:53.032585	2024-12-06 23:14:19.678716	35.6746552	139.7647909	\N
290	御茶ノ水シーシャ ワープ WARP	東京都千代田区神田淡路町１丁目２１−４ 㐧2西野ビル 201	\N	千代田	2	\N	14:00 〜 23:00	070-2232-6241	https://lit.link/ochawarp	2024-12-01 00:07:55.386006	2024-12-06 23:14:19.685275	35.6955197	139.7655574	\N
291	FORREST MANSION	東京都千代田区神田須田町２丁目２３−23 1 3レジデンス B1	\N	千代田	2	\N	14:00 〜 23:00	080-4467-5505	https://twitter.com/forrestmansion?lang=ja	2024-12-01 00:07:56.208589	2024-12-06 23:14:19.687575	35.6967834	139.7721406	\N
292	チルイン秋葉原1号店	東京都千代田区外神田４－４－７ MTビル7階	\N	千代田	2	\N	12:00 〜 24:00	03-5244-4175	https://shisha-chillin.com/	2024-12-01 00:07:56.943239	2024-12-06 23:14:19.689988	35.7012527	139.772055	\N
293	べー太	東京都千代田区神田小川町３丁目１６−１ 共和神田ビル 5F	\N	千代田	2	\N	13:00 〜 23:30	03-6811-0534	https://shishabeta.com/	2024-12-01 00:07:57.6884	2024-12-06 23:14:19.692395	35.6967456	139.7603862	\N
294	NoA NoP 御茶ノ水店	東京都千代田区小田川町3-10-45駿台中根ビル3F	\N	千代田	2	\N	14:00 〜 23:00	03-6811-0133	http://cafenoanop.com/	2024-12-01 00:07:58.459064	2024-12-06 23:14:19.69461	35.6952553	139.7620134	\N
295	AKIBAスモーカーズ	東京都千代田区外神田３丁目８−１７	\N	千代田	3	\N	12:00 〜 23:00	03-3526-2850	http://akiba-smokers.com/	2024-12-01 00:07:59.414875	2024-12-06 23:14:19.697185	35.7020344	139.7707529	\N
296	AKIBAスモーカーズ 2号店	東京都千代田区外神田３丁目７−８ ｉＮＴＡＳビル 602	\N	千代田	3	\N	12:00 〜 23:00	03-6811-6920	http://akiba-smokers.com/	2024-12-01 00:08:00.097167	2024-12-06 23:14:19.699597	35.7027667	139.7703497	\N
297	あるまじろ	東京都千代田区富士見２丁目３−１ 信幸ビル 101	\N	千代田	3	\N	14:00 〜 23:00	070-8487-2345	https://shisha-cafe-armadillo.com/	2024-12-01 00:08:01.073113	2024-12-06 23:14:19.701772	35.7000666	139.7456238	\N
298	市ヶ谷シーシャ SIXTAシクスタ	東京都千代田区六番町3−１１ 玉柳テシコ六番町ビル B1	\N	千代田	3	\N	12:00 〜 24:00	03-6268-9890	https://www.twitter.com/sixta_ichigaya	2024-12-01 00:08:01.838593	2024-12-06 23:14:19.703997	35.6876244	139.735884	\N
299	And U	東京都台東区上野６丁目９−１１ 三真ビル6階	\N	台東	3	\N	12:00 〜 24:00	03-5846-8466	https://andu.shopinfo.jp/	2024-12-01 00:08:02.658521	2024-12-06 23:14:19.706274	35.710217	139.7751459	\N
300	DUBAI 上野店	東京都台東区上野６丁目９−１ 内山ビル 2F	\N	台東	2	\N	14:00 〜 23:00	03-3834-3382	http://www.sheeshabar.net/index.html	2024-12-01 00:08:03.577427	2024-12-06 23:14:19.708572	35.7090207	139.775372	\N
301	カフェぱるふぁん	東京都台東区上野３丁目２０−８ 小島ビル B1	\N	台東	3	\N	14:00〜23:30	090-2751-8650	https://twitter.com/shishacafe0116	2024-12-01 00:08:05.216478	2024-12-06 23:14:19.710731	35.7058585	139.7741973	\N
302	Baan Shisha Asakusa	東京都台東区浅草１丁目８−４ 金山ビル 2階	\N	台東	3000	\N	14:00 〜 23:00	no number	https://twitter.com/Kimejiro	2024-12-01 00:08:06.240734	2024-12-06 23:14:19.712843	35.7116714	139.7931804	\N
725	SERA〜お酒とシーシャと雑談〜	東京都台東区浅草橋3-3-9	\N	台東	\N	\N	18:00 〜 23:00	03-6876-4504	https://www.instagram.com/seratokyo/?hl=ja	2024-12-06 23:14:20.792312	2024-12-06 23:14:20.792312	35.7002443	139.7867887	\N
307	哲	東京都墨田区向島3-42-6 1階	\N	墨田	2	\N	14:00 〜 23:00	03-6356-1406	https://www.instagram.com/shisha_tetsu/?hl=ja	2024-12-01 00:08:10.646684	2024-12-06 23:14:20.807503	35.7119998	139.8103478	\N
553	シーシャデッサン	東京都新宿区荒木町9-7ナオビル5階	\N	新宿	\N	\N	10:00 〜 00:00	\N	\N	2024-12-01 00:11:54.696775	2024-12-06 23:14:40.110262	35.6903953	139.7222234	\N
308	TASMANIA SHISHA	東京都墨田区東向島２丁目４７−１１ ビッグウエスト向島ビル 6階	\N	墨田	2	\N	16:00 〜 24:00	no number	https://twitter.com/tasmaniashisha	2024-12-01 00:08:11.452213	2024-12-06 23:14:20.811537	35.7192048	139.818883	\N
310	NoANoP東十条店	東京都北区東十条3-16-15 コーポラスカワイ1F	\N	北	2	\N	11:00 〜 24:00	050-1157-1195	http://cafenoanop.com/	2024-12-01 00:08:13.019308	2024-12-06 23:14:20.817754	35.7650946	139.7280115	\N
311	GRACE	東京都北区王子本町1-1-22 権現坂ビル1F-A	\N	北	2	\N	11:00 〜 23:00	03-5948-8868	https://grace-ul.tokyo/	2024-12-01 00:08:13.71025	2024-12-06 23:14:20.820393	35.7538133	139.7351079	\N
312	亀戸 Eighty-80-	東京都江東区亀戸5丁目5-6-202	\N	江東	2	\N	14:00 〜 23:00	03-5875-0860	https://twitter.com/eighty80_shisha	2024-12-01 00:08:14.587117	2024-12-06 23:14:20.82394	35.6986693	139.8271675	\N
313	ALIF	東京都江東区富岡1-4-5第7新堀ビル301	\N	江東	3	\N	13:00 〜 23:00	03-5875-8974	https://twitter.com/alif_cafe	2024-12-01 00:08:15.35569	2024-12-06 23:14:20.826425	35.6705851	139.7976706	\N
314	シーシャ喫茶　ココニバ	東京都板橋区清水町４３−７ シーシャ喫茶ココニバ 島崎ビル 1F	\N	板橋	2	\N	13:00 〜 22:30	03-6820-0479	https://twitter.com/kokoniba_shisha	2024-12-01 00:08:16.071879	2024-12-06 23:14:20.828588	35.7641233	139.7052319	\N
315	ノットイコール	東京都練馬区豊玉北5-18-7 月川ビル５階	\N	練馬	3	\N	14:00 〜 23:00	050-1194-9485	https://twitter.com/nerima_notequal	2024-12-01 00:08:16.750181	2024-12-06 23:14:20.830781	35.7369362	139.6540472	\N
316	chillaxJP	東京都練馬区 練馬1-2-13西武会館3階	\N	練馬	2	\N	14:00 〜 24:00	03-5946-6782	https://x.com/chillaxjp	2024-12-01 00:08:17.539559	2024-12-06 23:14:20.832961	35.7377325	139.6556846	\N
321	ONE’S OWN TIME	東京都武蔵野市吉祥寺南町2-8-1 サンパレス南町 1F	\N	武蔵野	3	\N	14:00 〜 24:00	0422-26-9069	https://twitter.com/ones_own_time	2024-12-01 00:08:22.130294	2024-12-06 23:14:20.844004	35.7023338	139.5822338	\N
322	はちグラム吉祥寺店	東京都武蔵野市吉祥寺本町2丁目10-12グリーンハウス伊勢平301	\N	武蔵野	2	\N	12:00 〜 24:00	0422-27-5893	http://shisha-8g.com/	2024-12-01 00:08:22.859205	2024-12-06 23:14:20.846413	35.7038856	139.5768019	\N
323	国分寺ドロシー	東京都国分寺市南町１丁目１３−５ リバービル B1F	\N	国分寺	1	\N	14:00 〜 23:00	042-316-8957	https://twitter.com/doroshisha?ref_src=twsrc%5Egoogle%7Ctwcamp%5Eserp%7Ctwgr%5Eauthor	2024-12-01 00:08:23.569733	2024-12-06 23:14:20.848427	35.6984753	139.487112	\N
329	シーシャ＆占い処 極楽満月	東京都新宿区西早稲田3-28-2 2階	\N	新宿	2800	\N	13:00 〜 23:30	03-6877-2688	https://www.gokurakumangetsu.com/	2024-12-01 00:08:28.602954	2024-12-06 23:14:20.862047	35.7116154	139.7102902	\N
330	FamilyPod	東京都新宿区四谷1-20-2グリーンランドビル2階	\N	新宿	3000	\N	17:00 〜 23:00	080-2024-3614	https://twitter.com/familypotshisha	2024-12-01 00:08:29.384875	2024-12-06 23:14:20.864236	35.68696389999999	139.7278869	\N
331	David Shisha(ダビデシーシャ)飯田橋店	東京都千代田区飯田橋3-1-6 マリアナ飯田橋east 3F	\N	千代田	3000	\N	14:00 〜 23:00	03-6265-6286	http://hookah-reviews.com/david-shisha-iida/	2024-12-01 00:08:30.273765	2024-12-06 23:14:20.866337	35.7006222	139.7479691	\N
333	Shisha Lounge tolu 渋谷パルコ前店	東京都渋谷区神南１丁目２０−８ パークウェイテラス 5F	\N	渋谷	3400	\N	12:00 〜 23:00	03-6455-3800	http://cafe.rootsmusic2012.com/	2024-12-01 00:08:31.841883	2024-12-06 23:14:20.870943	35.6618378	139.6999769	\N
334	ノンニコ専門・有楽町シーシャ@まんぷく食堂	東京都千代田区有楽町2-4-1	\N	千代田	2500	\N	15:00 〜 22:00	03-3211-6001	https://manpuku-syokudo.com/	2024-12-01 00:08:32.66033	2024-12-06 23:14:20.873369	35.6738741	139.7616132	\N
335	Shisha Cafe & Bar LUZ	東京都新宿区矢来町64-4DEAR神楽坂4階	\N	新宿	3000	\N	14:00 〜 23:00	03-6265-3088	https://twitter.com/Luz_Kagurazaka	2024-12-01 00:08:33.481231	2024-12-06 23:14:20.87568	35.703545	139.7328506	\N
337	spuit	東京都台東区浅草橋1-29-1ソリューション浅草橋3階	\N	台東	3000	\N	12:00 〜 22:00	03-5829-6689	https://twitter.com/spuit_aroma	2024-12-01 00:08:35.118766	2024-12-06 23:14:20.880508	35.6978918	139.785755	\N
338	Axe Shisha Cafe "A×S"	東京都千代田区鍛冶町２丁目１−１３ B1、B2 大業写真ビル	\N	千代田	3000	\N	13:00 〜 23:30	03-3525-8145	https://twitter.com/CafeAxe	2024-12-01 00:08:36.654489	2024-12-06 23:14:20.882747	35.6908605	139.7712555	\N
339	chillax 北千住店	東京都足立区千住２丁目１０ CHILLAX 北千住店	\N	足立	2500	\N	14:00 〜 23:00	03-5284-8403	https://www.instagram.com/chillax_kitasenju/	2024-12-01 00:08:37.410162	2024-12-06 23:14:20.884615	35.7490266	139.8010892	\N
340	Ergoth.	東京都新宿区歌舞伎町2-27-12 Lee2ビル B1-D	\N	新宿	3	\N	18:00 〜 23:30	03-6205-6774	https://twitter.com/shisha_ergoth	2024-12-01 00:08:38.086636	2024-12-06 23:14:20.886508	35.6957862	139.7032234	\N
341	SENSE SHISHABAR	東京都港区六本木3-9-5ゼックスバウム館4F	\N	港	2500	\N	13:00 〜 21:00	03-3479-6789	https://www.instagram.com/shisha.salon_sense/	2024-12-01 00:08:38.908176	2024-12-06 23:14:20.888386	35.6636949	139.734028	\N
344	シーシャメイドバー RIEMER	東京都豊島区池袋2-12-13 2BLD 7F	\N	豊島	4500	\N	18:00 〜 23:00	no number	https://twitter.com/riemer_shisha	2024-12-01 00:08:41.979392	2024-12-06 23:14:20.894379	35.7324813	139.7074573	\N
591	芝裏N（エヌ）	東京都港区芝5-22-10 松田ビル3F	\N	港	\N	\N	\N	\N	\N	2024-12-01 00:12:32.891983	2024-12-06 23:14:40.192678	35.647938	139.7463024	\N
624	Coffee & Shisha Bar UN 戸越銀座店	東京都品川区平塚３丁目４−２エムズ戸越銀座5階	\N	品川	\N	\N	営業中：14:00 〜 02:00	\N	\N	2024-12-01 00:13:01.871365	2024-12-05 17:37:59.108181	35.6160344	139.7123298	\N
265	ShishaSalon厘	東京都豊島区高田1-13-8	\N	豊島	\N	\N	12:00 〜 24:00	no number	https://twitter.com/zinjarpark	2024-12-01 00:07:34.697022	2024-12-06 23:14:18.658632	35.7131043	139.7173597	\N
271	British Restaurant CLASH	東京都目黒区下目黒1-3-28 サンウッド目黒 2F	\N	目黒	\N	\N	17:00 〜 21:00	03-5747-9979	http://www.clash.jp/	2024-12-01 00:07:39.492209	2024-12-06 23:14:18.672302	35.6342647	139.7129932	\N
276	Garage Azabu	東京都港区東麻布３丁目８−９ 東麻布ビル 3F	\N	港	\N	\N	19:00 〜 24:00	03-6441-2014	https://www.instagram.com/garage.azabu/	2024-12-01 00:07:43.686182	2024-12-06 23:14:19.644292	35.6563978	139.7375205	\N
288	PopInn銀座	東京都中央区銀座4-3-5 ハトリビル4F	\N	中央	\N	\N	14:00 〜 24:00	03-6271-0785	https://www.popinn.tokyo/	2024-12-01 00:07:53.748359	2024-12-06 23:14:19.68109	35.6722965	139.7646847	\N
289	日本橋シーシャ	東京都中央区日本橋人形町２丁目２４−５	\N	中央	\N	\N	12:00 〜 24:00	no number	https://twitter.com/nihonbashisha	2024-12-01 00:07:54.598967	2024-12-06 23:14:19.683375	35.6867985	139.7844292	\N
303	CHILL-FREE SHISHA&CAFE BAR	東京都台東区駒形1-2-13 那須駒形ビル1F	\N	台東	\N	\N	10:00 〜 22:30	03-5811-1995	https://theaxethrowingbar.com/	2024-12-01 00:08:07.188271	2024-12-06 23:14:19.715052	35.7062587	139.7935177	\N
304	Shisha bon	東京都台東区雷門２丁目３−７	\N	台東	\N	\N	09:00 〜 23:00	no number	https://twitter.com/asakusa__shisha	2024-12-01 00:08:08.021157	2024-12-06 23:14:19.717217	35.7096484	139.7965689	\N
345	spot	東京都中央区日本橋堀留町１丁目７−９ 橋本ビルB1	\N	中央	2500	\N	14:00 〜 23:00	03-3527-3568	https://twitter.com/spot_ningyocho	2024-12-01 00:08:42.695171	2024-12-06 23:14:20.896557	35.6874699	139.7803999	\N
347	めうめうシーシャ/高円寺シーシャhookah	東京都杉並区高円寺南４丁目４５−７ 壱番館ビル 601	\N	杉並	3800	\N	14:30 〜 23:30	090-3009-2162	https://meumeushisha.jp/	2024-12-01 00:08:44.642392	2024-12-06 23:14:20.900706	35.7051192	139.6505424	\N
349	SWAY | Aoyama Gaien	東京都港区北青山２丁目１３−４青山MYビル 9F	\N	港	3000	\N	17:00 〜 23:00	03-3423-8090	https://twitter.com/sway_shisha	2024-12-01 00:08:46.280673	2024-12-06 23:14:20.905295	35.6700512	139.7163864	\N
352	龍幻酒家	東京都新宿区歌舞伎町1-17-5第二安田ビル3階	\N	新宿	5000	\N	17:00 〜 23:00	03-6380-3536	https://www.pokepara.jp/tokyo/m4/a10000/shop17452/	2024-12-01 00:08:48.536872	2024-12-06 23:14:20.911598	35.6941535	139.7012787	\N
353	香楽 新宿店	東京都新宿区歌舞伎町1丁目11-5扇園ビル3F	\N	新宿	2	\N	13:00 〜 05:00	03-6886-0734	https://shisha-kagura.com/	2024-12-01 00:08:49.353177	2024-12-06 23:14:20.913552	35.6950753	139.7027772	\N
354	NORTH VILLAGE 新宿1号店	東京都新宿区新宿3丁目23-4黒澤ビル4階	\N	新宿	3	\N	14:00 〜 05:00	03-6380-0447	https://shisha.tokyo/	2024-12-01 00:08:50.174808	2024-12-06 23:14:20.915674	35.6930573	139.7005827	\N
355	NORTH VILLAGE 歌舞伎町店	東京都新宿区歌舞伎町1-12-3モンビル６階	\N	新宿	2	\N	14:00 〜 05:00	03-6205-6636	https://shisha.tokyo/	2024-12-01 00:08:50.990706	2024-12-06 23:14:20.917652	35.6948805	139.7023916	\N
356	チルアップ歌舞伎1号店	東京都新宿区歌舞伎町2-9-3 三経59ビル4階	\N	新宿	3	\N	18:00 〜 04:30	03-6885-4100	https://shisha-chillin.com/	2024-12-01 00:08:51.735815	2024-12-06 23:14:20.919632	35.6950943	139.7051356	\N
357	Shisha Tokyo	東京都新宿区百人町１丁目２３−２２	\N	新宿	2	\N	16:00 〜 01:00	03-6886-8707	https://twitter.com/shishatokyo	2024-12-01 00:08:52.537202	2024-12-06 23:14:20.921547	35.699584	139.6975781	\N
358	シーシャラウンジ天の川	東京都新宿区百人町１丁目８−２５ BSビル地下1階	\N	新宿	3500	\N	16:00 〜 07:00	03-6205-5389	https://shisha-amanogawa.com/	2024-12-01 00:08:53.411958	2024-12-06 23:14:20.923704	35.6983743	139.7006106	\N
726	L4L新宿本店	東京都新宿区歌舞伎町２丁目２２−８ 第八金嶋ビル305号室	\N	新宿	2	\N	16:00 〜 13:00	03-6278-9387	https://www.l4lshisha.com/	2024-12-06 23:14:21.713854	2024-12-06 23:14:21.713854	35.6962268	139.7038054	\N
360	チルイン新宿歌舞伎町1号店	東京都新宿区歌舞伎町１丁目１６−６ 第6ポールスタービル5F	\N	新宿	1	\N	15:00 〜 05:00	03-6885-4100	https://shisha-chillin.com/	2024-12-01 00:08:55.087042	2024-12-06 23:14:21.734516	35.6939567	139.7018042	\N
727	チルイン新宿東南口店	東京都新宿区新宿４丁目１−１３ 田園新宿ビル３階	\N	新宿	1	\N	12:00 〜 05:00	03-5315-0193	https://shisha-chillin.com/	2024-12-06 23:14:22.532794	2024-12-06 23:14:22.532794	35.6892043	139.7025226	\N
362	シーシャコピ新宿店	東京都新宿区歌舞伎町２丁目４１−3	\N	新宿	3	\N	15:00 〜 07:00	03-6457-3325	https://shisha-copi.shopinfo.jp/	2024-12-01 00:08:56.519951	2024-12-06 23:14:22.555181	35.6976969	139.7020466	\N
363	VP74	東京都新宿区西新宿7-17-5矢澤ビル2F	\N	新宿	2	\N	17:00 〜 05:00	03-6313-2541	https://twitter.com/vp74_hookah	2024-12-01 00:08:57.339477	2024-12-06 23:14:22.56617	35.6966004	139.6968211	\N
364	LOVELESS	東京都新宿区歌舞伎町1−９ 10k'sビル 5階	\N	新宿	3	\N	19:00 〜 06:00	03-6625-0266	https://twitter.com/shishaloveless?lang=ja	2024-12-01 00:08:58.09835	2024-12-06 23:14:22.572682	35.6947232	139.7033431	\N
366	紅洛煙	東京都新宿区歌舞伎町２丁目８−３ 最上ビル 202	\N	新宿	2	\N	17:00 〜 07:00	03-6228-0247	https://x.com/00korakuen00	2024-12-01 00:09:00.003709	2024-12-06 23:14:22.584069	35.6949741	139.7057965	\N
367	Shisha TK	東京都新宿区歌舞伎町２丁目４６−７ 第3平沢ビル 6階E号室	\N	新宿	3	\N	14:00 〜 05:00	080-9860-0828	https://twitter.com/shisha_tk	2024-12-01 00:09:01.027423	2024-12-06 23:14:22.59348	35.6978624	139.700587	\N
368	chocolatplanet	東京都新宿区歌舞伎町１丁目２−１４ コリンズ15 7F	\N	新宿	2	\N	16:00 〜 05:00	03-6380-2766	https://twitter.com/chocolatplanet_	2024-12-01 00:09:01.877442	2024-12-06 23:14:22.601276	35.6948876	139.7044921	\N
369	Kujira Entertainment	東京都新宿区歌舞伎町2-23-1風林会館B2	\N	新宿	5	\N	21:00〜5:00	03-6205-6675	https://kujiraentertainment.com/	2024-12-01 00:09:02.841659	2024-12-06 23:14:22.608855	35.6952174	139.704175	\N
370	SHISHA BAR MOCO's	東京都新宿区歌舞伎町1-14-5 第3金嶋ビル６F	\N	新宿	3	\N	14:00 〜 05:00	03-3204-4877	https://twitter.com/shisha_mocos	2024-12-01 00:09:03.626453	2024-12-06 23:14:22.617136	35.694709	139.7020367	\N
371	C.STAND 新宿三丁目店	東京都新宿区新宿３丁目１１−１１ ダイアン新宿 3Ｆ	\N	新宿	2	\N	13:00 〜 05:00	050-5385-3307	https://x.com/c_shisha	2024-12-01 00:09:04.837122	2024-12-06 23:14:22.624006	35.6917884	139.7067406	\N
305	SERA	東京都台東区浅草橋3-3-9	\N	台東	\N	\N	営業中：18:00 〜 23:00	\N	\N	2024-12-01 00:08:08.893978	2024-12-05 17:37:58.321125	35.7002443	139.7867887	\N
306	デグー	東京都墨田区江東橋4-20-13 山田ビル3階	\N	墨田	\N	\N	14:00 〜 23:00	03-6869-6974	https://shisha.tokyo.jp/	2024-12-01 00:08:09.571923	2024-12-06 23:14:20.80175	35.6949956	139.8158765	\N
309	Saturday	東京都墨田区錦糸４丁目１２−２	\N	墨田	\N	\N	18:00 〜 24:00	no number	https://tabelog.com/tokyo/A1312/A131201/13270637/	2024-12-01 00:08:12.332307	2024-12-06 23:14:20.814711	35.6979069	139.8164895	\N
317	PILA SUN	東京都狛江市東和泉1-18-5-2F	\N	狛江	\N	\N	15:00 〜 21:00	03-5497-5559	https://twitter.com/sunpila	2024-12-01 00:08:18.529949	2024-12-06 23:14:20.835125	35.6263714	139.5741726	\N
319	sweeke’s 町田店	東京都町田市原町田4-4-2 3F	\N	町田	\N	\N	13:00 〜 24:00	042-785-5811	http://sweekes.com/	2024-12-01 00:08:20.47369	2024-12-06 23:14:20.839591	35.5422808	139.4479211	\N
320	Shi-Shark	東京都八王子市三崎町６−１６キャッスルビル882号館 1階	\N	八王子	\N	\N	14:00 〜 23:00	042-621-0086	https://www.instagram.com/shishark802/	2024-12-01 00:08:21.217027	2024-12-06 23:14:20.841769	35.656708	139.3363318	\N
324	アンタレス	東京都三鷹市上連雀1-2-8	\N	三鷹	\N	\N	13:00 〜 21:00	0422-53-1361	http://antares.ne.jp/	2024-12-01 00:08:24.371843	2024-12-06 23:14:20.851094	35.7029294	139.5585999	\N
325	Aniesha -oak- 品川シーシャ	東京都港区港南２丁目４−１８ ルネッサンス 6階	\N	港	\N	\N	12:00 〜 23:30	03-6433-0730	https://twitter.com/aniesha_oak	2024-12-01 00:08:25.29066	2024-12-06 23:14:20.853438	35.6286203	139.7438704	\N
326	shisha cafe & bar「two」	東京都渋谷区恵比寿西１丁目１２−１２ ルネスE.B.I 2階	\N	渋谷	\N	\N	16:00 〜 23:00	03-6809-0685	https://www.instagram.com/two_ebisu/	2024-12-01 00:08:26.10782	2024-12-06 23:14:20.855673	35.6474196	139.7073455	\N
327	ランデヴー	東京都港区赤坂4-3-27	\N	港	\N	\N	11:00 〜 23:00	03-6230-9433	https://twitter.com/Shishacafebar	2024-12-01 00:08:27.064399	2024-12-06 23:14:20.857758	35.6745463	139.7352853	\N
328	東銀座シーシャ SMOKER CAT	東京都中央区銀座4丁目14-2 XCD銀座ビル7F	\N	中央	\N	\N	13:00 〜 23:00	03-6264-0299	https://twitter.com/cat_smoker	2024-12-01 00:08:27.746484	2024-12-06 23:14:20.859824	35.6694626	139.7693343	\N
332	SOMMARLEK	東京都東村山市本町１丁目20-18パレススズB1	\N	東村山	\N	\N	15:00 〜 22:00	042-306-0648	https://sommarlek.jimdofree.com/	2024-12-01 00:08:31.126157	2024-12-06 23:14:20.868737	35.7580169	139.4679135	\N
342	シーシャバーふくろう	東京都江戸川区西葛西6-9-10ビッグウエスト西葛西ビル2F	\N	江戸川	\N	\N	17:00 〜 23:00	03-6808-6501	https://fklw.jp/	2024-12-01 00:08:39.585481	2024-12-06 23:14:20.890412	35.6640422	139.8577462	\N
343	Da Base Lounge	東京都中野区弥生町１丁目４−６ アビタシオン中野坂上 B1	\N	中野	\N	\N	14:00 〜 23:00	03-6824-0806	https://www.instagram.com/dabaselounge/	2024-12-01 00:08:41.263223	2024-12-06 23:14:20.892274	35.6912318	139.6820845	\N
346	Shisha House rain.	東京都千代田区神田神保町１丁目７−１２ 巌松堂ビル ７F	\N	千代田	\N	\N	14:00 〜 23:30	070-8939-6561	https://shishahouserain.com/	2024-12-01 00:08:43.520288	2024-12-06 23:14:20.898666	35.69576199999999	139.7591184	\N
728	サキュバスシーシャBAR ABYSS 新宿店	東京都新宿区歌舞伎町1-23-15 SUZUYAビル10F	\N	新宿	\N	\N	17:00 〜 05:00	03-6457-6578	https://succubus.tokyo/succubus-abyss/	2024-12-06 23:14:23.352373	2024-12-06 23:14:23.352373	35.6939666	139.7009696	\N
374	SHISHA BAR Flamme	東京都新宿区歌舞伎町27-6　ヒロ歌舞伎町ビル1階	\N	新宿	2	\N	17:00 〜 05:00	03-6233-7858	https://twitter.com/shisha_flamme	2024-12-01 00:09:07.270725	2024-12-06 23:14:23.362703	35.6959051	139.7024125	\N
375	神煙	東京都新宿区歌舞伎町2-13-4第六金嶋ビル4F	\N	新宿	3	\N	16:00 〜 06:00	03-6278-9941	https://twitter.com/shinenshisha?ref_src=twsrc%5Egoogle%7Ctwcamp%5Eserp%7Ctwgr%5Eauthor	2024-12-01 00:09:08.050269	2024-12-06 23:14:23.367051	35.6965535	139.7048619	\N
729	L4L新宿区役所通り店	東京都新宿区歌舞伎町1-3-13 第5金嶋ビル4F	\N	新宿	3	\N	17:00 〜 05:00	03-6265-9082	https://www.l4lshisha.com/	2024-12-06 23:14:24.08242	2024-12-06 23:14:24.08242	35.6947478	139.7040512	\N
380	G's hookah	東京都渋谷区幡ケ谷２丁目９−２ロスアミーゴス201	\N	渋谷	2	\N	18:00 〜 02:00	no number	https://twitter.com/gs_hookah	2024-12-01 00:09:11.985501	2024-12-06 23:14:24.100098	35.6781546	139.6773492	\N
383	Shisha bar Lilac（シーシャバーライラック）	東京都渋谷区円山町５−１４ スタービル 3階	\N	渋谷	3	\N	13:00 〜 05:00	03-6416-1510	https://twitter.com/lilac_shisha	2024-12-01 00:09:14.7493	2024-12-06 23:14:24.111563	35.6569865	139.6948689	\N
384	Cafe Bohemia	東京都渋谷区宇田川町36-22 ノア渋谷PartⅡ 1F	\N	渋谷	3	\N	11:30 〜 04:00	03-6861-9170	https://www.udagawacafe.com/cafe-bohemia/	2024-12-01 00:09:15.581792	2024-12-06 23:14:24.114372	35.6621203	139.6972624	\N
385	CHILLAX shibuya	東京都渋谷区宇田川町１１−２ 宇田川柳光ビル 5F	\N	渋谷	2	\N	13:00 〜 01:00	03-6416-5442	https://twitter.com/chillaxshibuya	2024-12-01 00:09:16.474613	2024-12-06 23:14:24.117095	35.6625731	139.6971993	\N
692	チルスタンド神奈川溝の口店	神奈川県川崎市高津区溝口１丁目１８−１２	\N	川崎	\N	\N	21:00 〜 06:00	\N	\N	2024-12-04 20:24:40.950633	2024-12-06 23:14:44.122207	35.6009329	139.6140311	\N
348	Shisha cafe & bar 赤坂煙研究所	東京都港区赤坂3-19-8 赤坂ウエストビル2階奥	\N	港	\N	\N	14:00 〜 23:30	080-9860-0828	https://www.instagram.com/akasakakemurikenkyujo/	2024-12-01 00:08:45.463244	2024-12-06 23:14:20.903129	35.6756716	139.7361235	\N
351	エンジェルシーシャバー WINGS	東京都豊島区東池袋1-2-4T2ビル地下1階	\N	豊島	\N	\N	17:00 〜 23:30	03-6907-0193	https://twitter.com/WINGS_shisha	2024-12-01 00:08:47.737149	2024-12-06 23:14:20.909353	35.7298628	139.7136816	\N
365	KRISHUNA	東京都新宿区歌舞伎町1-1-5パレスビル202号	\N	新宿	\N	\N	19:00 〜 05:00	03-5287-2561	https://twitter.com/bar_krishuna	2024-12-01 00:08:58.876758	2024-12-06 23:14:22.579255	35.6942036	139.7050385	\N
372	Shisha night cafe CHILL AL	東京都新宿区歌舞伎町 2丁目25番2号	\N	新宿	\N	\N	13:00 〜 04:00	03-3200-9933	https://twitter.com/shisha_chill_al	2024-12-01 00:09:05.633157	2024-12-06 23:14:22.635152	35.6952076	139.7038361	\N
376	KAME HOUSE	東京都新宿区歌舞伎町２丁目２２−１ アイトスビル B1	\N	新宿	\N	\N	0:00〜07:00	03-6709-6959	https://www.instagram.com/kamehouse0602/	2024-12-01 00:09:08.911015	2024-12-06 23:14:23.370996	35.6958417	139.7044173	\N
377	間借りShisha Bar 狼煙	東京都新宿区 新宿歌舞伎町2-19-17石川ビル103	\N	新宿	\N	\N	21:00〜05:00	no number	https://www.instagram.com/noroshi_shisha/	2024-12-01 00:09:09.692459	2024-12-06 23:14:23.375999	35.6977172	139.7047928	\N
381	dada	東京都渋谷区道玄坂１丁目１３−１ Mビル 4F	\N	渋谷	\N	\N	17:00 〜 05:00	03-6416-1717	https://twitter.com/dadashibuya	2024-12-01 00:09:13.113432	2024-12-06 23:14:24.104881	35.6577829	139.6984665	\N
382	SOMA	東京都渋谷区神南１丁目１３−４ フレームインボックス 2階	\N	渋谷	\N	\N	17:00 〜 04:30	03-6427-8577	https://twitter.com/soma_shisha?ref_src=twsrc%5Egoogle%7Ctwcamp%5Eserp%7Ctwgr%5Eauthor	2024-12-01 00:09:13.866926	2024-12-06 23:14:24.108636	35.6631787	139.700451	\N
386	SHISHA CAFE NORTH VILLAGE 渋谷1号店別館 6号室	東京都渋谷区宇田川町4-10ゴールデンビル1F	\N	渋谷	2	\N	13:00 〜 24:00	03-3461-1063	https://shisha.tokyo/	2024-12-01 00:09:17.307834	2024-12-06 23:14:24.119494	35.6625472	139.6976484	\N
387	SHISHA CAFE NORTH VILLAGE 渋谷DROPOUT店	東京都渋谷区道玄坂2-8-9市橋ビルB1F	\N	渋谷	2	\N	19:00 〜 04:00	03-6427-0530	https://shisha.tokyo/	2024-12-01 00:09:18.041191	2024-12-06 23:14:24.121899	35.6584135	139.6984964	\N
388	BUTTER tokyo	東京都渋谷区円山町２８−８ 第１８宮庭マンション 104	\N	渋谷	3	\N	17:00 〜 02:00	03-6416-4018	https://page.line.me/138jrzsh?openQrModal=true	2024-12-01 00:09:19.151474	2024-12-06 23:14:24.123986	35.6553927	139.6941934	\N
389	ZU-HO	東京都渋谷区道玄坂 2-25-7 プラザ道玄坂 3F	\N	渋谷	2	\N	18:00 〜 03:00	03-5459-5548	https://zu-ho-shibuya-diningbar.com/	2024-12-01 00:09:21.453872	2024-12-06 23:14:24.126289	35.6602792	139.6966848	\N
390	NoA NoP Shisha Lounge Shibuya	東京都渋谷区渋谷1-24-7宮下パークビル202	\N	渋谷	3	\N	11:00 〜 23:00	03-5962-6444	https://cafenoanop.com/location/shibuya	2024-12-01 00:09:22.327362	2024-12-06 23:14:24.128681	35.6605247	139.7019669	\N
391	SHISHA CAFE NORTH VILLAGE 渋谷駅前店	東京都渋谷区道玄坂2-8-9市橋ビル3F市橋ビル3F	\N	渋谷	3	\N	16:00 〜 03:00	03-6455-3421	https://shisha.tokyo/	2024-12-01 00:09:23.044737	2024-12-06 23:14:24.131168	35.6584135	139.6984964	\N
393	SHISHA CAFE NORTH VILLAGE 渋谷道玄坂小路店	東京都渋谷区 道玄坂2-29-14 さすがやビル3階	\N	渋谷	2	\N	15:00 〜 02:00	03-6885-8418	https://shisha.tokyo/	2024-12-01 00:09:24.781759	2024-12-06 23:14:24.137224	35.6598981	139.6978183	\N
394	SHISHA CAFE NORTH VILLAGE 渋谷道玄坂店	東京都渋谷区道玄坂2-28-5 SUN・Jビル6F	\N	渋谷	3	\N	14:00 〜 05:00	03-6427-0249	https://shisha.tokyo/	2024-12-01 00:09:25.600451	2024-12-06 23:14:24.139587	35.6589856	139.6973098	\N
395	チルイン渋谷SHISHA LABO	東京都渋谷区宇田川町31-4 シノダビル6F	\N	渋谷	1	\N	15:00 〜 00:00	03-6427-0826	https://shisha-chillin.com/	2024-12-01 00:09:26.423313	2024-12-06 23:14:24.141917	35.6612793	139.6978997	\N
396	チルイン渋谷センター街店	東京都渋谷区宇田川町28-1 高山ランド第15ビル5階	\N	渋谷	1	\N	19:00 〜 05:00	03-6886-4496	https://shisha-chillin.com/	2024-12-01 00:09:27.240565	2024-12-06 23:14:24.144335	35.6603461	139.6983621	\N
397	チルイン渋谷宇田川町店	東京都渋谷区宇田川町33-12 J+RサイドRビル3階	\N	渋谷	1	\N	12:00 〜 05:00	03-6773-9021	https://shisha-chillin.com/	2024-12-01 00:09:28.015416	2024-12-06 23:14:24.146469	35.6610613	139.696831	\N
373	サキュバスシーシャBAR ABYSS 歌舞伎町店	東京都新宿区歌舞伎町1-23-15 SUZUYAビル10F	\N	新宿	\N	\N	営業中：19:00 〜 05:00	\N	\N	2024-12-01 00:09:06.454272	2024-12-05 17:37:58.498518	35.6939666	139.7009696	\N
398	SWAY	東京都渋谷区松濤1-26-2第33イチオクビル2階	\N	渋谷	3	\N	14:00 〜 05:00	03-5790-9870	https://sway.style/	2024-12-01 00:09:28.820997	2024-12-06 23:14:24.148802	35.6592015	139.6936833	\N
399	The Hookah Library	東京都渋谷区道玄坂１丁目５−９ ザ・レンガビル 5階	\N	渋谷	3	\N	12:00 〜 05:00	03-6416-9671	http://the-hookah-library.com/	2024-12-01 00:09:29.698264	2024-12-06 23:14:24.151187	35.6581824	139.6993939	\N
401	Yellow	東京都渋谷区恵比寿南1-8-9 黄色いビル4F	\N	渋谷	3	\N	13:00 〜 02:00	03-5708-5979	https://yellowebisu.com/	2024-12-01 00:09:31.273937	2024-12-06 23:14:24.155875	35.6460585	139.7089532	\N
402	Crimson EBISU	東京都渋谷区恵比寿西１丁目２１−１５ エルスタンザ代官山タワー棟B1	\N	渋谷	3	\N	19:00 〜 05:00	03-6427-0773	https://www.instagram.com/crimson_ebisu/	2024-12-01 00:09:32.125035	2024-12-06 23:14:24.158121	35.6466102	139.7062733	\N
403	PukuPuku 東京・恵比寿店	東京都渋谷区恵比寿西１丁目１０−８ 地下1階 本間ビル	\N	渋谷	4	\N	13:00 〜 28:00	050-1555-4645	https://shisha-pukupuku.com/tokyo/ebisu/	2024-12-01 00:09:33.281883	2024-12-06 23:14:24.160429	35.6465397	139.7076616	\N
404	tea&sheesha moffoom	東京都渋谷区恵比寿南1-11-19中島ビル101号室	\N	渋谷	2	\N	11:00 〜 01:00	03-6451-2408	https://www.moffoom.com/	2024-12-01 00:09:34.10196	2024-12-06 23:14:24.162677	35.6455699	139.7094669	\N
405	A MOMENT恵比寿	東京都渋谷区恵比寿南1-23-1ABC亜米利加橋ビル3F	\N	渋谷	3	\N	13:00 〜 24:00	03-6412-8480	https://twitter.com/ebisumoment	2024-12-01 00:09:34.827821	2024-12-06 23:14:24.164934	35.6432091	139.7117609	\N
400	COZY HOUSE	東京都渋谷区道玄坂2丁目19-11ファブリック渋谷5F	\N	渋谷	\N	\N	15:00 〜 05:00	03-6277-5090	https://cozyhouse-sby.com/	2024-12-01 00:09:30.467368	2024-12-06 23:14:24.153516	35.6594241	139.6961032	\N
406	Ebisu Shisha Club	東京都渋谷区恵比寿南1-8-10 MY恵比寿ビル3F	\N	渋谷	3	\N	13:00 〜 05:00	080-9282-2081	https://www.the-shisha-house.com/	2024-12-01 00:09:35.637585	2024-12-06 23:14:24.167064	35.6460983	139.7091201	\N
407	E-smoke	東京都渋谷区恵比寿西1-7-4 恵比寿ファーストビル4階	\N	渋谷	4	\N	17:00 〜 05:00	070-5022-2616	<html><u>https://esmoke.tokyo/</u>/</html>	2024-12-01 00:09:36.352699	2024-12-06 23:14:24.169364	35.6477646	139.7089482	\N
408	LoungeGenie	東京都渋谷区東3-26-1中村ビル３F	\N	渋谷	3	\N	18:30 〜 05:00	03-6427-1693	https://x.com/shisha_genie	2024-12-01 00:09:37.173044	2024-12-06 23:14:24.171641	35.6486383	139.709427	\N
409	シーシャカフェ&バー musch/ムッシュ 恵比寿東口店	東京都渋谷区恵比寿1-10-7-7F	\N	渋谷	4	\N	12:30 〜 05:00	03-6459-3493	https://www.musch.jp/	2024-12-01 00:09:38.465784	2024-12-06 23:14:24.174277	35.6469394	139.7108233	\N
410	E-smoke＋	東京都渋谷区恵比寿１丁目７−１０ 恵比寿ＦＮビル	\N	渋谷	4	\N	17:00 〜 05:00	080-3599-2616	https://esmoke.tokyo/	2024-12-01 00:09:39.323789	2024-12-06 23:14:24.1762	35.6481471	139.7104144	\N
411	Shisha lounge OPAQUE	東京都渋谷区恵比寿1-7-13-B1	\N	渋谷	4	\N	16:00 〜 05:00	03-3441-7792	https://opaque.thyme-shisha.com/	2024-12-01 00:09:40.368954	2024-12-06 23:14:24.178239	35.6483456	139.7105772	\N
412	Sabbath Cafe Bar & Shisha Garden	東京都渋谷区初台２丁目１−３	\N	渋谷	2	\N	20:00 〜 05:00	03-5860-8335	https://sabbath-shisha.com/	2024-12-01 00:09:41.337496	2024-12-06 23:14:24.180557	35.6739886	139.687192	\N
413	モクモス	東京都渋谷区幡ヶ谷2丁目9-20第二DNビル3-B	\N	渋谷	3	\N	16:00 〜 05:00	03-6276-8017	<html><u>https://mokumosu.com/</u>/</html>	2024-12-01 00:09:42.089205	2024-12-06 23:14:24.182726	35.6782355	139.6774389	\N
730	HOTBOX 中目黒店	東京都目黒区上目黒3-7-5 AOIHOUSE Sビル 201	\N	目黒	3	\N	13:00 〜 03:00	03-6303-1473	https://shishaspot.jp/	2024-12-06 23:14:24.940042	2024-12-06 23:14:24.940042	35.6439089	139.6982069	\N
415	NANCY STILL WAITING	東京都目黒区上目黒２丁目４４−３	\N	目黒	\N	\N	14:00 〜 02:00	03-5724-3141	https://twitter.com/nancystillwait1	2024-12-01 00:09:43.721151	2024-12-06 23:14:24.947061	35.64179010000001	139.6969508	\N
416	チルラグ 中目黒店	東京都目黒区上目黒2ー13ー3　GEMS中目黒 5階	\N	目黒	8	\N	14:00 〜 05:00	03-6451-2427	https://chillrug.com/	2024-12-01 00:09:44.444648	2024-12-06 23:14:24.95202	35.6429887	139.6985064	\N
417	シーシャカフェ　カンノーク	東京都目黒区自由が丘１丁目３−２２ アーバンビルサカス11 1F	\N	目黒	2	\N	17:00 〜 00:00	03-6421-3423	https://shisha-kannok.shop/	2024-12-01 00:09:45.263019	2024-12-06 23:14:24.956616	35.6094542	139.6705411	\N
418	TRIBE	東京都目黒区鷹番３丁目１−９	\N	目黒	\N	\N	18:00 〜 02:00	03-6451-0665	http://shisha-vape-tokyotribe.com/	2024-12-01 00:09:46.269293	2024-12-06 23:14:24.961306	35.6291611	139.6858232	\N
419	smoky	東京都豊島区池袋２丁目１２−１４ 第８前島ビル 501	\N	豊島	2	\N	16:00 〜 05:00	050-1428-2942	https://mobile.twitter.com/smoky_shisha	2024-12-01 00:09:47.802924	2024-12-06 23:14:24.964231	35.7323585	139.7074845	\N
420	ウッドストック	東京都豊島区東池袋１丁目３９−２ アドワンビル 5F	\N	豊島	\N	\N	18:00 〜 02:00	03-5904-8228	https://woodstock.red/	2024-12-01 00:09:48.642304	2024-12-06 23:14:24.967181	35.732396	139.7145067	\N
421	チルイン池袋西口店	東京都豊島区西池袋１丁目２２−４ 信和ビル 4F,5F	\N	豊島	2	\N	12:00 〜 05:00	03-6912-7974	https://shisha-chillin.com/	2024-12-01 00:09:49.882566	2024-12-06 23:14:24.969716	35.7319127	139.709583	\N
731	シーシャ maya cafe&Bar 池袋西口店	東京都豊島区西池袋1-20-6広瀬ビル2F	\N	豊島	2	\N	14:00 〜 05:00	03-5927-1770	https://cafebar-shisha-maya.com/	2024-12-06 23:14:25.676529	2024-12-06 23:14:25.676529	35.7315028	139.7097461	\N
732	Shisha PINK	東京都港区赤坂3-8-8 フローラルプラザ1階	\N	港	3	\N	15:00 〜 05:00	03-6441-2203	https://shishapink.com/	2024-12-06 23:14:26.526518	2024-12-06 23:14:26.526518	35.6756368	139.7373566	\N
424	Succubus&Angel Wings	東京都豊島区東池袋1-22-5サンケエビル2F	\N	豊島	1	\N	17:00 〜 05:00	03-6709-1511	https://succubustokyo.wixsite.com/my-site	2024-12-01 00:09:53.714845	2024-12-06 23:14:26.536212	35.729498	139.7155912	\N
733	SHOT BAR MAO -ikebukuro-	東京都豊島区西池袋1-35-4NTKビルB1F	\N	豊島	2	\N	18:00 〜 05:00	03-3987-2224	https://www.instagram.com/shotbar_mao_ikebukuro/?hl=ja	2024-12-06 23:14:27.344036	2024-12-06 23:14:27.344036	35.73225010000001	139.7100453	\N
426	baum	東京都豊島区北大塚2-6-10 星和ビル2F	\N	豊島	3	\N	14:00 〜 03:00	03-6770-6030	https://x.com/shishabaum2021	2024-12-01 00:09:55.398812	2024-12-06 23:14:27.347294	35.7325335	139.7278424	\N
427	Höhle（ヘーレ）	東京都豊島区巣鴨２丁目９−５ 若杉ビル 3F	\N	豊島	3	\N	14:00 〜 03:00	03-5972-4007	https://x.com/heele2021	2024-12-01 00:09:56.5443	2024-12-06 23:14:27.349839	35.7344037	139.7379368	\N
428	SHISHA CAFE NORTH VILLAGE 六本木1号店	東京都港区六本木4-12-4 アドバンテージ飯田ビル4F	\N	港	2	\N	14:00 〜 03:00	03-6884-2781	https://shisha.tokyo/	2024-12-01 00:09:57.346004	2024-12-06 23:14:27.352308	35.6645654	139.731773	\N
429	ANNA CAFE	東京都港区六本木7-14-1 宝祥ソシアルビル6F	\N	港	3	\N	14:00 〜 04:00	03-6804-1231	http://shishabar.jp/	2024-12-01 00:09:58.167199	2024-12-06 23:14:27.354434	35.6641729	139.7310419	\N
430	No.5	東京都港区六本木３丁目１２−５ STELLA六本木 5F	\N	港	\N	\N	19:00 〜 06:00	03-6804-1484	https://x.com/no5roppongi	2024-12-01 00:09:58.984447	2024-12-06 23:14:27.356666	35.6628525	139.7335059	\N
734	チルアップ新宿歌舞伎町2号店	東京都新宿区歌舞伎町１丁目１４−７ Hayashi Bldg. 5階	\N	新宿	4	\N	14:30 〜 05:00	03-6273-9968	https://shisha-chillin.com/	2024-12-06 23:14:28.623724	2024-12-06 23:14:28.623724	35.6946036	139.7021798	\N
432	SHISHA CAFE NORTH VILLAGE 六本木 ジパング店	東京都港区六本木4丁目11-8 フランセビル6F	\N	港	3	\N	14:00 〜 05:00	03-5843-1840	https://shisha.tokyo/	2024-12-01 00:10:00.725435	2024-12-06 23:14:28.633975	35.6640319	139.7316914	\N
433	Aniesha -cave-	東京都港区六本木4-12-2ファルコンビル地下一階	\N	港	3	\N	14:00 〜 03:00	03-6434-9833	https://aniesha.jp/	2024-12-01 00:10:01.545328	2024-12-06 23:14:28.638811	35.664675	139.7317304	\N
735	シーシャcafe lounge chill sweet 六本木店	東京都港区六本木4-12-15グレイト綱ビル5F	\N	港	3	\N	14:00 〜 05:00	03-6804-3780	https://twitter.com/chillsweet4	2024-12-06 23:14:29.393986	2024-12-06 23:14:29.393986	35.6645151	139.7315136	\N
736	Shisha bar RAKUEN 西麻布店	東京都港区 西麻布 3-24-23 八星ビル（ARUGA8ビル）3F	\N	港	5	\N	20:00 〜 05:00	03-5786-5188	https://rakuen-one.com/	2024-12-06 23:14:30.112109	2024-12-06 23:14:30.112109	35.6596555	139.7241912	\N
435	チルラグ西麻布店	東京都港区西麻布1-10-6 西麻布1106ビル3階	\N	港	\N	\N	20:00 〜 05:00	03-6804-3690	https://chillrug.com/	2024-12-01 00:10:03.182994	2024-12-06 23:14:29.402872	35.6609729	139.7245387	\N
437	SHISHA CAFE NORTH VILLAGE 六本木ヒルズサイド店	東京都港区西麻布３丁目２−９ サンライズ六本木 1階	\N	港	3	\N	12:00 〜 05:00	03-6384-5410	https://shisha.tokyo/	2024-12-01 00:10:04.782957	2024-12-06 23:14:30.122735	35.6601544	139.7277748	\N
438	PukuPuku西麻布店	東京都港区西麻布1-12-4 1124ビル3階	\N	港	\N	\N	21:00〜05:00	03-6722-6595	https://shisha-pukupuku.com/tokyo/nishiazabu/	2024-12-01 00:10:05.639194	2024-12-06 23:14:30.129658	35.6601861	139.7240738	\N
439	チルラグ麻布十番	東京都港区麻布十番1-9-2ユニマット麻布十番ビル7階	\N	港	\N	\N	20:00 〜 05:00	03-6230-8442	https://chillrug.com/	2024-12-01 00:10:06.562048	2024-12-06 23:14:30.134296	35.6564579	139.7354255	\N
443	T2 SHISHA CAFFE TRIBE-GOTANDA	東京都品川区西五反田２丁目５−１０ ワイエムビル 4F	\N	品川	\N	\N	営業中：13:00 〜 05:00	\N	\N	2024-12-01 00:10:10.761901	2024-12-05 17:37:58.692069	35.6269316	139.7223106	\N
440	Zenobia Cafe	東京都港区麻布十番２丁目１−１１ 松尾ビル 2F	\N	港	3	\N	11:30 〜 03:00	03-6453-6677	https://www.instagram.com/zenobiacafe1/	2024-12-01 00:10:07.792273	2024-12-06 23:14:30.137684	35.6552734	139.7361035	\N
441	Cafe&Shisha bar 禅	東京都港区赤坂3-12-5ホテルヒラリーズ赤坂B棟1F	\N	港	3	\N	11:00 〜 02:00	03-6441-2338	https://shisha-zen.owst.jp/	2024-12-01 00:10:08.611242	2024-12-06 23:14:30.140777	35.673718	139.7380195	\N
442	新橋シーシャPonte（ポンテ）	東京都港区新橋2-11-1 メナー新橋7階	\N	港	2	\N	15:00 〜 00:00	080-7301-4696	https://twitter.com/Ponte7Shimbashi?ref_src=twsrc%5Egoogle%7Ctwcamp%5Eserp%7Ctwgr%5Eauthor	2024-12-01 00:10:09.895851	2024-12-06 23:14:30.143513	35.6673886	139.7554542	\N
737	Shisha Cafe&bar Ten	東京都港区新橋４‐21－8レヴェリー新橋 10F	\N	港	\N	\N	12:00〜05:00	03-5422-1920	https://shisha-ten.owst.jp/	2024-12-06 23:14:30.930937	2024-12-06 23:14:30.930937	35.6638556	139.7577573	\N
738	T2 SHISHA CAFFE TRIBE 五反田	東京都品川区西五反田２丁目５−１０ ワイエムビル 4F	\N	品川	\N	\N	15:00 〜 02:00	03-6431-9629	https://x.com/TRIBEgakudai	2024-12-06 23:14:31.749122	2024-12-06 23:14:31.749122	35.6269316	139.7223106	\N
444	VRAIMENT CLUB BAR	東京都品川区東五反田1-11-5　バルミー五反田 B1F	\N	品川	3	\N	20:00〜06:00	03-6456-4459	https://vraiment-tokyo.com/	2024-12-01 00:10:11.580421	2024-12-06 23:14:31.757628	35.62723039999999	139.7256527	\N
445	soi61	東京都中野区中野５丁目59番6 ＫＳビル 4階	\N	中野	2	\N	14:00 〜 03:00	03-5942-4189	https://shishaspot.jp/	2024-12-01 00:10:12.296745	2024-12-06 23:14:31.762792	35.7075735	139.6657668	\N
446	SBBB!!!	東京都中野区中野５丁目６０−２ ライオンズプラザ中野 103号室	\N	中野	\N	\N	13:00〜25:00	03-5942-9775	https://twitter.com/sbbb20210309	2024-12-01 00:10:13.264364	2024-12-06 23:14:31.766663	35.7071705	139.6664346	\N
447	裏中野シーシャBar バカルマ	東京都中野区新井1-14-16 ライオンズマンション B110	\N	中野	\N	\N	18:00 〜 02:00	03-6876-7719	https://twitter.com/bakaruma	2024-12-01 00:10:14.484186	2024-12-06 23:14:31.769791	35.7108228	139.6668447	\N
448	ロコ	東京都中野区沼袋３丁目４−１８ 2F	\N	中野	\N	\N	19:00 〜 05:00	03-5942-7727	https://horisgt.wixsite.com/bar-loco-numabukuro	2024-12-01 00:10:15.674993	2024-12-06 23:14:31.77258	35.7192772	139.6633942	\N
739	BROシーシャスタジオ高円寺店	東京都杉並区高円寺南4-6-7 5F	\N	杉並	2	\N	14:00 〜 04:00	03-5913-8225	https://zebro-shisha.studio.site/	2024-12-06 23:14:32.672202	2024-12-06 23:14:32.672202	35.7030084	139.6490299	\N
450	下北沢シーシャ 1号店	東京都世田谷区北沢３丁目３０−３	\N	世田谷	1	\N	14:00 〜 03:00	03-3468-0601	https://www.instagram.com/shisha_one_shimokitazawa/?hl=ja	2024-12-01 00:10:17.61452	2024-12-06 23:14:32.680987	35.6644411	139.6672157	\N
451	SHISHA CAFE NORTH VILLAGE 下北沢店	東京都世田谷区北沢２丁目１８−５ UPTOWN下北沢 2階	\N	世田谷	2	\N	14:00 〜 24:00	03-3411-3955	https://shisha.tokyo/	2024-12-01 00:10:18.952601	2024-12-06 23:14:32.687206	35.6602104	139.6667535	\N
452	下北沢シーシャ 2号店	東京都世田谷区北沢２丁目３３−１２	\N	世田谷	1	\N	14:00 〜 05:00	03-6804-9687	https://www.instagram.com/shisha2_shimokitazawa/	2024-12-01 00:10:19.909836	2024-12-06 23:14:32.691732	35.6631043	139.6692254	\N
740	NORTH VILLAGE 下北沢2号店	東京都世田谷区北沢2-14-8春日ビル2階	\N	世田谷	2	\N	14:00 〜 05:00	03-5787-5592	https://shisha.tokyo/	2024-12-06 23:14:33.467589	2024-12-06 23:14:33.467589	35.6602614	139.6674563	\N
741	Cafe & SHISHA BAR oranger (オランジュ)	東京都世田谷区三軒茶屋２丁目１５−５ プラスキューブＡ棟1F	\N	世田谷	3	\N	13:00 〜 04:00	03-5787-5465	https://x.com/oranger_shisha?ref_src=twsrc%5Egoogle%7Ctwcamp%5Eserp%7Ctwgr%5Eauthor	2024-12-06 23:14:34.309687	2024-12-06 23:14:34.309687	35.642768	139.6684691	\N
456	GOONies	東京都世田谷区松原１丁目３６−７	\N	世田谷	2	\N	15:00 〜 04:30	050-1123-9381	https://www.goonies-shisha.com/	2024-12-01 00:10:23.356179	2024-12-06 23:14:34.319066	35.6686038	139.65078	\N
457	Liberty	東京都世田谷区用賀４丁目３０−１１ 2F	\N	世田谷	3	\N	15:00 〜 04:00	03-6411-7656	https://shisha-liberty.com/	2024-12-01 00:10:24.512227	2024-12-06 23:14:34.323871	35.6294581	139.6329956	\N
458	銀座シーシャ	東京都中央区銀座７丁目３−１３ シーシャ 銀座第四金井ビル 3階	\N	中央	3	\N	14:00 〜 04:00	03-3289-1255	https://ginza-shisha.com/	2024-12-01 00:10:25.497073	2024-12-06 23:14:34.327117	35.6702813	139.7602664	\N
459	Kings Shisha Lounge Ginza | キングス シーシャ ラウンジ 銀座	東京都中央区銀座７丁目-４-６銀座７ビルディング10階	\N	中央	3	\N	17:00 〜 05:00	03-5962-8056	https://www.kings-shisha.jp/ja	2024-12-01 00:10:26.22246	2024-12-06 23:14:34.330263	35.6699436	139.7609452	\N
257	PUCAPUCA	東京都新宿区西新宿７丁目４−９ 盛和ビル ４階	\N	新宿	2500	\N	13:00 〜 24:00	03-5937-3884	https://www.google.com/url?sa=t&source=web&rct=j&opi=89978449&url=https://shisha-pucapuca.com/&ved=2ahUKEwiJyJyM7ZKKAxXRp1YBHXTSFiAQFnoECDwQAQ&usg=AOvVaw2Cy2sSkYuMgDdRZULIVawy	2024-12-01 00:07:27.627992	2024-12-06 23:14:18.627729	35.6962108	139.6986161	\N
258	DreamyDolls Candleblum	東京都新宿区歌舞伎町１丁目２−１３ 新光ビル4F E号室	\N	新宿	3	\N	19:00 〜 23:00	03-6457-3732	https://www.google.com/url?sa=t&source=web&rct=j&opi=89978449&url=https://twitter.com/__candleblum__&ved=2ahUKEwitvPuz7ZKKAxXO1DQHHdycNuYQFnoECDwQAQ&usg=AOvVaw2PbSmWPJpaGr91U34NFk8l	2024-12-01 00:07:28.379203	2024-12-06 23:14:18.633351	35.694761	139.7044223	\N
259	煙仄〜けむりほのか	東京都渋谷区代々木２丁目３９−１ エクラン YS2 2F	\N	渋谷	2	\N	14:00 〜 23:00	03-6672-3496	https://www.google.com/url?sa=t&source=web&rct=j&opi=89978449&url=https://kemuri-honoka.com/&ved=2ahUKEwj_56TC7ZKKAxUVqVYBHRZhGU0QFnoECDYQAQ&usg=AOvVaw3Yeg87D7wPGHpLB7ypK3AU	2024-12-01 00:07:29.168273	2024-12-06 23:14:18.63641	35.6849102	139.6966516	\N
261	PukuPuku高田馬場店	東京都新宿区高田馬場2-14-8 NTビル2階A	\N	新宿	3	\N	14:00 〜 24:00	03-6205-5152	https://shisha-pukupuku.com/	2024-12-01 00:07:30.80844	2024-12-06 23:14:18.641703	35.7128382	139.706334	\N
262	ばんびえん高田馬場2号店	東京都新宿区高田馬場１丁目３２−１１ オザワビル 2F	\N	新宿	2	\N	16:00 〜 24:00	03-6380-2009	https://vangviengshisha.com/	2024-12-01 00:07:31.725212	2024-12-06 23:14:18.644475	35.7108133	139.7037919	\N
263	ばんびえん高田馬場店	東京都新宿区高田馬場４丁目１８−９ ハイシティ高田馬場 2F	\N	新宿	\N	\N	営業中：16:00 〜 24:00	\N	\N	2024-12-01 00:07:32.854422	2024-12-05 17:37:58.225689	35.7121427	139.6995848	\N
318	sweeke’s 八王子店	東京都八王子市三崎町4-3 2F	\N	八王子	2	\N	13:00 〜 24:00	no number	http://sweekes.com/	2024-12-01 00:08:19.343694	2024-12-06 23:14:20.837462	35.6573987	139.3370127	\N
742	シーシャ専門店 MagMell 神田店	東京都千代田区神田紺屋町４４ イーストビル 301	\N	千代田	3	\N	18:00 〜 05:00	03-6684-9569	https://twitter.com/kanda_roost/status/1328569030223990784	2024-12-06 23:14:35.433838	2024-12-06 23:14:35.433838	35.6931357	139.7736598	\N
461	久遠 -qu'on-	東京都千代田区外神田1-9-8秋葉原ダイヤモンドビル3F	\N	千代田	\N	\N	12:00-23:00	03-5577-5934	https://twitter.com/quon_akb	2024-12-01 00:10:28.010946	2024-12-06 23:14:35.440568	35.6989536	139.7704292	\N
462	BunnyPalace バニーパレス 秋葉原店	東京都千代田区神田佐久間町1-16-1大橋ビル7階	\N	千代田	\N	\N	17:00 〜 05:00	03-6206-8912	https://bunny-palace.com/	2024-12-01 00:10:28.784218	2024-12-06 23:14:35.444009	35.6977422	139.7746131	\N
463	シーパラ上野店	東京都文京区湯島３丁目３９−１ 武南ビル 3F	\N	文京	2	\N	13:00 〜 04:30	050-5447-4097	https://shipara-shisha.com/ueno/	2024-12-01 00:10:29.990443	2024-12-06 23:14:35.44656	35.7073691	139.772057	\N
488	NORTHVILLAGE 吉祥寺南店	東京都武蔵野市吉祥寺南町1-1-2 喜楽ビル4階	\N	武蔵野	\N	\N	営業中：16:00 〜 03:00	\N	\N	2024-12-01 00:10:55.944989	2024-12-05 17:37:58.81137	35.7028404	139.5794204	\N
464	TRIBE Top Terrace -うえの水たばこ-	東京都文京区湯島３丁目３８−１０ ドン・キホーテ上野店 8F	\N	文京	2	\N	13:00 〜 03:00	\N	\N	2024-12-01 00:10:30.831924	2024-12-06 23:14:35.448843	35.7080768	139.7709079	\N
465	TOY’S HOOKAH	東京都足立区竹の塚6-9-2第七丸本ビル3F	\N	足立	2	\N	15:00 〜 05:00	\N	\N	2024-12-01 00:10:31.752015	2024-12-06 23:14:35.451317	35.7944151	139.7936276	\N
466	KEIKIDOUGLAS	東京都足立区竹ノ塚6-7-14 2F	\N	足立	\N	\N	20:00 〜 06:00	\N	\N	2024-12-01 00:10:32.86286	2024-12-06 23:14:35.453924	35.7950617	139.7920443	\N
467	Aladdin	東京都大田区西蒲田7−3−2 3F	\N	大田	2	\N	16:00 〜 02:00	\N	\N	2024-12-01 00:10:34.040884	2024-12-06 23:14:35.456126	35.5634068	139.7158206	\N
468	MARIA	東京都大田区西蒲田7-45-5 沢田ビル B1F	\N	大田	\N	\N	19:00 〜 05:00	\N	\N	2024-12-01 00:10:35.233566	2024-12-06 23:14:35.458378	35.56290389999999	139.7142665	\N
469	NEW ALADDIN 葛西店	東京都江戸川区中葛西3-30-13 2階	\N	江戸川	2	\N	18:00 〜 04:00	\N	\N	2024-12-01 00:10:36.668092	2024-12-06 23:14:35.460738	35.6657754	139.8720664	\N
470	CHILL lu 小岩店	東京都江戸川区南小岩7-26-10第75東京ビル2F	\N	江戸川	\N	\N	20:00 〜 04:00	\N	\N	2024-12-01 00:10:37.487109	2024-12-06 23:14:35.463021	35.7337599	139.883189	\N
471	Shisha Bar Under World（アンダーワールド）	東京都台東区浅草橋１丁目２３−４ サンロードビル 3 階	\N	台東	2	\N	20:00 〜 05:00	\N	\N	2024-12-01 00:10:38.614546	2024-12-06 23:14:35.465143	35.6976982	139.7836103	\N
359	L4L本店	東京都新宿区歌舞伎町２丁目２２−８ 第八金嶋ビル305号室	\N	新宿	2	\N	営業中：16:00 〜 13:00	\N	\N	2024-12-01 00:08:54.267256	2024-12-05 18:24:27.607523	35.6962268	139.7038054	\N
361	チルイン新宿東南口2号店	東京都新宿区新宿４丁目１−１３ 田園新宿ビル３階	\N	新宿	1	\N	営業中：12:00 〜 05:00	\N	\N	2024-12-01 00:08:55.763315	2024-12-05 18:24:27.611712	35.6892043	139.7025226	\N
378	L4L新宿区役所通り店（3号店）	東京都新宿区歌舞伎町1-3-13 第5金嶋ビル4F	\N	新宿	3	\N	営業中：17:00 〜 05:00	\N	\N	2024-12-01 00:09:10.4531	2024-12-05 18:24:27.643401	35.6947478	139.7040512	\N
336	Shisha Cafe&Bar Paint It Black	東京都千代田区西新橋2-9-3ル・グラシエルBLDG18-2F	\N	千代田	3000	\N	13:00 〜 23:00	070-3198-0096	https://twitter.com/PIB_shisha	2024-12-01 00:08:34.299592	2024-12-06 23:14:20.877851	35.6667858	139.7529796	\N
414	HOTBOX	東京都目黒区上目黒3-7-5 AOIHOUSE Sビル 201	\N	目黒	3	\N	営業中：13:00 〜 02:00	\N	\N	2024-12-01 00:09:42.807574	2024-12-05 18:24:27.716444	35.6439089	139.6982069	\N
379	GABASHI	東京都新宿区歌舞伎町2-19-10 ABCビル6階	\N	新宿	3	\N	15:00 〜 06:00	03-6380-2645	https://twitter.com/GABASHI_shisha	2024-12-01 00:09:11.26735	2024-12-06 23:14:24.093475	35.698082	139.7041257	\N
422	maya	東京都豊島区東池袋１丁目１２−１５ 近代グループBLD2号館5階	\N	豊島	2	\N	営業中：14:00 〜 02:00	\N	\N	2024-12-01 00:09:50.690487	2024-12-05 18:24:27.730429	35.7293048	139.7147592	\N
423	ピンク	東京都豊島区東池袋１丁目４０−９ 第８９東京ビル 2F	\N	豊島	3	\N	営業中：13:00 〜 05:00	\N	\N	2024-12-01 00:09:52.944536	2024-12-05 18:24:27.732532	35.7322264	139.7137758	\N
425	SHOT BAR MAO -IKEBUKURO-	東京都豊島区西池袋1-35-4NTKビルB1F	\N	豊島	2	\N	営業中：18:00 〜 05:00	\N	\N	2024-12-01 00:09:54.58107	2024-12-05 18:24:27.736627	35.73225010000001	139.7100453	\N
431	チルアップ六本木店	東京都港区六本木4-12-10 グレイト綱ビル7階	\N	港	4	\N	営業中：14:00 〜 05:00	\N	\N	2024-12-01 00:09:59.854298	2024-12-05 18:24:27.747977	35.6644698	139.7313859	\N
436	Shisha bar 樂煙	東京都港区 西麻布 3-24-23 八星ビル（ARUGA8ビル）3F	\N	港	5	\N	営業中：19:00 〜 05:00	\N	\N	2024-12-01 00:10:04.058897	2024-12-05 18:24:27.757618	35.6596555	139.7241912	\N
449	BROシーシャスタジオ高円寺店（旧ZEBRO）	東京都杉並区高円寺南4-6-7 5F	\N	杉並	2	\N	営業中：14:00 〜 04:00	\N	\N	2024-12-01 00:10:16.576554	2024-12-05 18:24:27.796689	35.7030084	139.6490299	\N
453	NORTH VILLAGE 下北沢2号店（下北2号店）	東京都世田谷区北沢2-14-8春日ビル2階	\N	世田谷	2	\N	営業中：14:00 〜 05:00	\N	\N	2024-12-01 00:10:20.695009	2024-12-05 18:24:27.816376	35.6602614	139.6674563	\N
454	Smoky 下北沢店	東京都世田谷区北沢2−２２ 13XAビル 3階	\N	世田谷	2	\N	営業中：15:00 〜 05:00	\N	\N	2024-12-01 00:10:21.417835	2024-12-05 18:24:27.820891	35.66085	139.6661157	\N
455	Oranger	東京都世田谷区三軒茶屋２丁目１５−５ プラスキューブＡ棟1F	\N	世田谷	3	\N	営業中：13:00 〜 04:00	\N	\N	2024-12-01 00:10:22.230074	2024-12-05 18:24:27.826016	35.642768	139.6684691	\N
460	MagMell	東京都千代田区神田紺屋町４４ イーストビル 301	\N	千代田	3	\N	営業中：18:00 〜 04:30	\N	\N	2024-12-01 00:10:27.207584	2024-12-05 18:24:27.868344	35.6931357	139.7736598	\N
350	Shisha cafe&bar Liga	東京都新宿区歌舞伎町１丁目２３−１２第10NKビル 5F	\N	新宿	4500	\N	12:00 〜 21:00	070-8432-2413	https://www.instagram.com/liga.shisha/	2024-12-01 00:08:46.996946	2024-12-06 23:14:20.907439	35.6944398	139.7010992	\N
482	4T4	東京都立川市柴崎町3-1-9 ラテールビル６F	\N	立川	3	\N	営業時間外	\N	\N	2024-12-01 00:10:50.696629	2024-12-05 18:24:27.911218	35.6973912	139.4121653	\N
527	シーシャ maya cafe&Bar	東京都豊島区東池袋1丁目12−15 近代グル-プBLD2号館 5F	\N	豊島	3600	\N	営業中：14:00 〜 03:00	\N	\N	2024-12-01 00:11:31.555475	2024-12-05 18:24:28.002255	35.7293048	139.7147592	\N
392	SHISHA CAFE NORTH VILLAGE CO-WORKING 渋谷店	東京都渋谷区道玄坂２丁目８−８ 日立建物第一ビル 4階	\N	渋谷	2	\N	12:00 〜 05:00	03-5422-3065	https://shisha.tokyo/	2024-12-01 00:09:23.93508	2024-12-06 23:14:24.13379	35.6585607	139.6984167	\N
477	SHISHAdeTREE	東京都北区赤羽1-22-6	\N	北	2	\N	14:00 〜 02:00	\N	\N	2024-12-01 00:10:45.883762	2024-12-06 23:14:35.478913	35.7800795	139.7207236	\N
434	chill sweet 六本木店	東京都港区六本木4-12-15グレイト綱ビル5F	\N	港	3	\N	営業中：14:00 〜 05:00	\N	\N	2024-12-01 00:10:02.261886	2024-12-05 18:24:27.754192	35.6645151	139.7315136	\N
601	シーシャカフェ&バー musch/ムッシュ 渋谷奥渋店	東京都渋谷区神山町４０−２ DEAR j1 渋谷 3F	\N	渋谷	3000	\N	営業中：13:00 〜 05:00	\N	\N	2024-12-01 00:12:42.927914	2024-12-05 18:24:28.128346	35.66503	139.6927404	\N
544	Infinique(インフィニーク) シーシャ Cafe&Bar 新宿三丁目店	東京都新宿区新宿3-6-10 ニューゴールドビル4F	\N	新宿	2500	\N	16:00 〜 05:00	\N	\N	2024-12-01 00:11:47.630485	2024-12-06 23:14:40.089668	35.6914728	139.7060259	\N
629	チルイン西武新宿店	東京都新宿区歌舞伎町1-17-5 J3ビル4F	\N	新宿	1	\N	営業時間外	\N	\N	2024-12-01 00:13:05.761599	2024-12-05 18:24:28.186879	35.6942114	139.7013009	\N
472	チルイン上野中央口駅前店	東京都台東区上野６丁目１６−７ DB上野 6階	\N	台東	2	\N	12:00 〜 05:00	03-6875-2837	https://shisha-chillin.com/	2024-12-01 00:10:39.57195	2024-12-06 23:14:35.467573	35.7106877	139.7761162	\N
473	シーシャカメレオン上野店	東京都台東区上野２丁目５−３ SNビル 4階	\N	台東	2	\N	14:00 〜 00:00	\N	\N	2024-12-01 00:10:41.582429	2024-12-06 23:14:35.470058	35.7087081	139.7721768	\N
474	湯島ホロホロシーシャ	東京都台東区上野1-5-3 市川ビル 2F	\N	台東	2	\N	13:00 〜 05:00	\N	\N	2024-12-01 00:10:43.017387	2024-12-06 23:14:35.472272	35.7052954	139.7700525	\N
475	4peeps	東京都墨田区江東橋2丁目6-5 まるビル錦糸町4F	\N	墨田	2	\N	14:00 〜 05:00	\N	\N	2024-12-01 00:10:43.836812	2024-12-06 23:14:35.474413	35.6944499	139.8127759	\N
476	チルイン錦糸町1号店	東京都墨田区江東橋3-8-12 KINSIA ANNEX 3階	\N	墨田	2	\N	15:00 〜 05:00	03-6659-6281	https://shisha-chillin.com/	2024-12-01 00:10:44.655853	2024-12-06 23:14:35.476702	35.6951092	139.814671	\N
478	L'ALABAR	東京都北区赤羽2丁目16-10 パームビル5F	\N	北	2	\N	19:00 〜 07:00	\N	\N	2024-12-01 00:10:46.704209	2024-12-06 23:14:35.480999	35.7797678	139.7230056	\N
479	cheers international shot bar 赤羽店	東京都北区赤羽１丁目13-7 はやまビル4F	\N	北	\N	\N	19:00 〜 05:00	\N	\N	2024-12-01 00:10:47.623554	2024-12-06 23:14:35.483148	35.77935739999999	139.7215398	\N
480	Dod Cafe	東京都立川市錦町1丁目5-6 サンパークビル102	\N	立川	\N	\N	17:00 〜 08:00	\N	\N	2024-12-01 00:10:48.444375	2024-12-06 23:14:35.485206	35.6977888	139.4177135	\N
481	ケムリスト	東京都立川市曙町2-20-16	\N	立川	2	\N	15:00 〜 04:00	\N	\N	2024-12-01 00:10:49.879997	2024-12-06 23:14:35.487343	35.6997439	139.4171394	\N
743	Shisha cafe & bar 4T4（シーシャカフェアンドバー　フォーティーフォー）	東京都立川市柴崎町3-1-9 ラテールビル６F	\N	立川	3	\N	14:00～23:00	042-512-7048	https://cafeandshisha4t4.owst.jp/	2024-12-06 23:14:36.255987	2024-12-06 23:14:36.255987	35.6973766	139.4121695	\N
483	digs+	東京都立川市柴崎町2丁目2-21田園キャッスルビル立川1階	\N	立川	\N	\N	16:00 〜 04:00	\N	\N	2024-12-01 00:10:51.516024	2024-12-06 23:14:36.264924	35.6975586	139.4106073	\N
484	THE LOUNGE	東京都八王子市東町6-1 本村ビル 1F	\N	八王子	\N	\N	10:00 〜 05:00	\N	\N	2024-12-01 00:10:52.642515	2024-12-06 23:14:36.271185	35.6577581	139.3400426	\N
485	Dod Cafe 町田店	東京都町田市原町田6-11-13 ホンタマビル3A	\N	町田	\N	\N	17:00 〜 05:00	\N	\N	2024-12-01 00:10:53.462981	2024-12-06 23:14:36.274087	35.5441118	139.4464357	\N
486	ALADDIN	東京都武蔵野市吉祥寺本町1-1-5	\N	武蔵野	2	\N	17:00 〜 03:00	\N	\N	2024-12-01 00:10:54.370322	2024-12-06 23:14:36.277627	35.7035843	139.5788438	\N
487	Layla	東京都武蔵野市吉祥寺南町2-13-4 B102	\N	武蔵野	\N	\N	17:00 〜 02:00	\N	\N	2024-12-01 00:10:55.220858	2024-12-06 23:14:36.28002	35.701131	139.5833703	\N
744	NORTHVILLAGE 吉祥寺南口店	東京都武蔵野市吉祥寺南町1-1-2 喜楽ビル4階	\N	武蔵野	\N	\N	14:00 〜 05:00	0422-26-5432	https://shisha.tokyo/	2024-12-06 23:14:37.176845	2024-12-06 23:14:37.176845	35.7028404	139.5794204	\N
489	Minus Blue 吉祥寺店	東京都武蔵野市吉祥寺南町2-2-4 吉祥寺南ビル2F	\N	武蔵野	3500	\N	15:00 〜 04:00	\N	\N	2024-12-01 00:10:56.7392	2024-12-06 23:14:37.184073	35.7021584	139.5806393	\N
490	The Living Bar Rem Tokyo	東京都武蔵野市吉祥寺南町1-11-2 もみじビル6階	\N	武蔵野	\N	\N	19:00 〜 03:00	\N	\N	2024-12-01 00:10:57.506822	2024-12-06 23:14:37.192516	35.7027027	139.5775802	\N
491	PolarCoast	東京都渋谷区道玄坂２丁目２９−１８ 清水ビル 7F	\N	渋谷	2	\N	14:00 〜 03:00	\N	\N	2024-12-01 00:10:58.68509	2024-12-06 23:14:37.195684	35.6600017	139.6978211	\N
492	シーシャカフェ＆バー musch/ムッシュ 渋谷店	東京都渋谷区道玄坂２丁目１９−１１ ファブリック渋谷 3F	\N	渋谷	3000	\N	13:00 〜 05:00	03-6427-8012	https://www.musch.jp/	2024-12-01 00:10:59.687951	2024-12-06 23:14:37.198575	35.6594241	139.6961032	\N
493	DOUKUTSU	東京都港区赤坂３丁目９−４ サカタニビル B1	\N	港	3	\N	10:00 〜 05:00	\N	\N	2024-12-01 00:11:00.727555	2024-12-06 23:14:37.200925	35.6770498	139.7364029	\N
494	REGULUS(レグルス)	東京都港区新橋4-18-4 十合ビル4階	\N	港	3	\N	15:00 〜 03:00	\N	\N	2024-12-01 00:11:01.45186	2024-12-06 23:14:37.203391	35.6642974	139.7571519	\N
495	LULU	東京都世田谷区太子堂１丁目１５−１３ ソフィアビル 2F	\N	世田谷	3	\N	17:00 〜 05:00	\N	\N	2024-12-01 00:11:02.159046	2024-12-06 23:14:37.206756	35.6415893	139.6734334	\N
496	Shisha Cafe tone. 原宿店	東京都渋谷区神宮前6-15-13 カーサピッコラ神宮前4階	\N	渋谷	3	\N	13:00 〜 00:00	\N	\N	2024-12-01 00:11:02.985389	2024-12-06 23:14:37.209148	35.6659744	139.7046108	\N
497	FUA SHISHA TOKYO	東京都目黒区上目黒1-2-9 ハイネス中目黒103 2F	\N	目黒	2	\N	13:00 〜 04:00	\N	\N	2024-12-01 00:11:03.704702	2024-12-06 23:14:37.211636	35.6454732	139.7011462	\N
498	Shisha Lounge Key	東京都渋谷区恵比寿西１丁目８−１３ エムロード B1F	\N	渋谷	4	\N	13:00 〜 05:00	\N	\N	2024-12-01 00:11:04.827637	2024-12-06 23:14:37.213905	35.6476556	139.7082301	\N
499	À LA MODE	東京都新宿区歌舞伎町1丁目17番5号 和田久ビル地下1階	\N	新宿	\N	\N	19:00 〜 05:00	\N	\N	2024-12-01 00:11:05.645904	2024-12-06 23:14:37.216359	35.6942153	139.7012987	\N
500	ポンテルーチェ(PONTE luce)	東京都港区新橋２丁目１２−８ GEMS新橋 6階	\N	港	\N	\N	12:00 〜 05:00	\N	\N	2024-12-01 00:11:06.661211	2024-12-06 23:14:37.21863	35.6670238	139.7546451	\N
501	神楽坂シーシャカフェ 𝐏𝐄𝐂𝐎-𝐜𝐨𝐟𝐟𝐞𝐞&𝐬𝐡𝐢𝐬𝐡𝐚-	東京都新宿区神楽坂2丁目5−2 クレール神楽坂12 1F	\N	新宿	\N	\N	14:00 〜 04:00	\N	\N	2024-12-01 00:11:07.491351	2024-12-06 23:14:37.220849	35.7012043	139.7409533	\N
502	C.STAND 渋谷センター街店	東京都渋谷区宇田川町13-7 小安ビル4F	\N	渋谷	2	\N	13:00 〜 05:00	\N	\N	2024-12-01 00:11:08.256627	2024-12-06 23:14:37.222999	35.6609637	139.6986618	\N
503	C.STAND 渋谷マークシティ横店	東京都渋谷区道玄坂1-6-1道玄坂天松ビルB1F	\N	渋谷	2	\N	13:00 〜 04:30	\N	\N	2024-12-01 00:11:09.128978	2024-12-06 23:14:37.225293	35.6588656	139.7008878	\N
504	C.STAND秋葉原店	東京都千代田区外神田4-4-2HULIC＆New AKIHABARA 8F	\N	千代田	2	\N	13:00 〜 04:00	\N	\N	2024-12-01 00:11:09.887794	2024-12-06 23:14:37.227899	35.7011306	139.7718373	\N
505	C.STAND 池袋西口店	東京都豊島区西池袋1-38-5セイコービル地下1階	\N	豊島	2	\N	13:00 〜 05:00	\N	\N	2024-12-01 00:11:10.664677	2024-12-06 23:14:37.229955	35.73283500000001	139.7092275	\N
701	灰霞-haika-	神奈川県藤沢市南藤沢２−１０ ワカバビル 5F	\N	藤沢	3	\N	15:00 〜 05:00	\N	\N	2024-12-04 20:24:50.298494	2024-12-06 23:14:44.143864	35.33825970000001	139.4890546	\N
745	Sillage 大井町店	東京都品川区大井1丁目15−5 GSビル 4階	\N	品川	3000	\N	13:00 〜 03:00	03-5728-9789	https://shishaspot.jp/	2024-12-06 23:14:38.522454	2024-12-06 23:14:38.522454	35.6077213	139.7312429	\N
520	Shisha Tella	東京都豊島区南池袋2-48-3VORT池袋Ⅱ-B1	\N	豊島	3000	\N	14:00 〜 05:00	\N	\N	2024-12-01 00:11:24.327892	2024-12-06 23:14:38.561082	35.7271875	139.7126467	\N
521	Barシューリンガン	東京都新宿区歌舞伎町1-3-10 花道会館3F	\N	新宿	4000	\N	20:00 〜 05:00	\N	\N	2024-12-01 00:11:25.512567	2024-12-06 23:14:38.563236	35.6949308	139.7039714	\N
522	Shisha&Bar MATEREAL	東京都千代田区神田三崎町1-4-9 2F	\N	千代田	2500	\N	14:00 〜 00:00	\N	\N	2024-12-01 00:11:26.844558	2024-12-06 23:14:38.565554	35.7013387	139.7556546	\N
523	けむりちゅーどく 秋葉原 シーシャ	東京都千代田区外神田3丁目7−8 DB末広町 2F	\N	千代田	3000	\N	14:00 〜 04:30	\N	\N	2024-12-01 00:11:27.969981	2024-12-06 23:14:38.56791	35.7028086	139.7704096	\N
524	Music Fashion Bar RUN	東京都新宿区歌舞伎町1-10-3 G3ビル 1F	\N	新宿	3000	\N	20:00 〜 04:00	\N	\N	2024-12-01 00:11:28.959286	2024-12-06 23:14:38.571198	35.6947124	139.703004	\N
525	Shisha 17 Juna	東京都渋谷区千駄ｹ谷4丁目26−12 玉造ビル2F	\N	渋谷	3000	\N	16:00 〜 03:00	\N	\N	2024-12-01 00:11:29.766257	2024-12-06 23:14:38.573485	35.681634	139.7036423	\N
526	The Boutique 新橋 シーシャカフェ&ラウンジ	東京都港区新橋3丁目14−5 Ｓ’ＴＥＣ－３ビル 2階	\N	港	3000	\N	14:00 〜 05:00	\N	\N	2024-12-01 00:11:30.779705	2024-12-06 23:14:38.57562	35.6654638	139.7561723	\N
746	シーシャ maya cafe&Bar 池袋東口店	東京都豊島区東池袋1丁目12−15 近代グル-プBLD2号館 5F	\N	豊島	3600	\N	12:00 〜 03:00	03-5927-1525	https://cafebar-shisha-maya.com/	2024-12-06 23:14:39.296383	2024-12-06 23:14:39.296383	35.7293048	139.7147592	\N
528	国分寺シーシャBUNBUKU	東京都国分寺市本町2丁目2−11 仙美堂ビル 5F	\N	国分寺	2500	\N	\N	no number	https://twitter.com/buku_sheesha	2024-12-01 00:11:32.605009	2024-12-06 23:14:39.304806	35.700858	139.4822545	\N
529	Neo EBISU	東京都渋谷区東3丁目26−1 中村ビル 4.5F	\N	渋谷	4000	\N	\N	\N	\N	2024-12-01 00:11:33.704132	2024-12-06 23:14:39.311744	35.6486383	139.709427	\N
530	五反田シーシャ Lyra	東京都品川区東五反田2丁目3−2 ＩＭ五反田ビル 4F	\N	品川	3000	\N	17:00 〜 04:30	\N	\N	2024-12-01 00:11:34.431216	2024-12-06 23:14:39.314887	35.6255209	139.7259546	\N
531	Shisha Bar GENIE	東京都新宿区神楽坂2丁目11 第83東京ビル 4F	\N	新宿	\N	\N	20:00 〜 05:00	\N	\N	2024-12-01 00:11:35.54003	2024-12-06 23:14:39.317388	35.7010901	139.7418611	\N
532	蜷局	東京都新宿区歌舞伎町1-13-4 黎昇ビル2階	\N	新宿	1650	\N	20:00 〜 07:00	\N	\N	2024-12-01 00:11:36.245136	2024-12-06 23:14:39.320043	35.6944938	139.7023509	\N
533	広尾シーシャカフェ&バー『melt』	東京都渋谷区広尾５丁目３−１５ HHB3F	\N	渋谷	3000	\N	13:00 〜 00:00	\N	\N	2024-12-01 00:11:36.982115	2024-12-06 23:14:39.323012	35.6503663	139.7207238	\N
534	Shisha Lounge ARIANA 六本木店	東京都港区六本木6丁目7-2	\N	港	5	\N	20:00 〜 05:00	\N	\N	2024-12-01 00:11:38.008771	2024-12-06 23:14:39.325114	35.6619164	139.7319489	\N
535	shisha&poker bar BROADWAY 六本木店	東京都港区六本木3丁目11−6　ウナカミビル4階	\N	港	\N	\N	13:00 〜 05:00	\N	\N	2024-12-01 00:11:38.722286	2024-12-06 23:14:39.327689	35.663129	139.7330944	\N
536	Poseidon | Shisha Studio & Café	東京都港区赤坂３丁目９−４	\N	港	\N	\N	14:00 〜 01:00	\N	\N	2024-12-01 00:11:39.623751	2024-12-06 23:14:39.330116	35.67705490000001	139.7364428	\N
747	Shisha bar RAKUEN 渋谷店	東京都渋谷区宇田川町33-13 楠原ビル2F	\N	渋谷	\N	\N	15:00 〜 08:00	03-6416-1069	https://rakuen-one.com/	2024-12-06 23:14:40.067703	2024-12-06 23:14:40.067703	35.6609895	139.6969213	\N
538	Bar & Shisha Vedge	東京都渋谷区神南1-20-8パークウェイテラス4F	\N	渋谷	3000	\N	13:00 〜 05:00	\N	\N	2024-12-01 00:11:41.17924	2024-12-06 23:14:40.073979	35.6618378	139.6999769	\N
539	fuuuu	東京都渋谷区道玄坂2-20-6 ２０１号室	\N	渋谷	3000	\N	12:00 〜 05:00	\N	\N	2024-12-01 00:11:42.262018	2024-12-06 23:14:40.076898	35.6594337	139.6963724	\N
540	A.Y.L.I	東京都渋谷区松濤1-4-8 EASTビル 1F	\N	渋谷	3500	\N	17:00 〜 04:00	\N	\N	2024-12-01 00:11:43.639735	2024-12-06 23:14:40.079367	35.662215	139.6952082	\N
541	シーシャカフェ　ＲＩＭＥ	東京都渋谷区恵比寿西１丁目４−４ 恵比寿S2ビル 3F	\N	渋谷	\N	\N	\N	\N	\N	2024-12-01 00:11:44.867087	2024-12-06 23:14:40.081674	35.6485163	139.7082301	\N
542	ONE COIN BAR DBC	東京都大田区大森北1-30-4小池ビルB1F	\N	大田	3000	\N	20:00 〜 06:00	\N	\N	2024-12-01 00:11:45.687469	2024-12-06 23:14:40.085035	35.5859706	139.7278208	\N
543	L4L 中目黒	東京都目黒区上目黒2-12-3 PEARS中目黒 3階	\N	目黒	\N	\N	16:00 〜 05:00	03-6412-8580	https://www.l4lshisha.com/	2024-12-01 00:11:46.813199	2024-12-06 23:14:40.08744	35.6426319	139.6988236	\N
545	THE SHISHA GARDEN 代官山・恵比寿店	東京都渋谷区恵比寿西１丁目 25番1号 1階 代官山KUMIKOビル	\N	渋谷	3000	\N	13:00 〜 00:00	\N	\N	2024-12-01 00:11:48.387694	2024-12-06 23:14:40.092323	35.6477565	139.7054334	\N
546	NORTH VILLAGE U.D.A RIVER CITY	東京都渋谷区宇田川町32-7 HULIC UDAGWA 3F	\N	渋谷	\N	\N	10:00 〜 05:00	03-5422-3557	https://shisha.tokyo/	2024-12-01 00:11:49.103704	2024-12-06 23:14:40.094384	35.6611898	139.6970662	\N
547	BY THE WAY SHISHA CAFE	東京都杉並区上荻１丁目６−１１	\N	杉並	2500	\N	13:00 〜 00:00	\N	\N	2024-12-01 00:11:50.02831	2024-12-06 23:14:40.096718	35.7049289	139.6214767	\N
548	Elama Roppongi	東京都港区六本木５丁目１６−５２ インペリアル六本木2 号館S 202号室	\N	港	\N	\N	20:00 〜 05:00	\N	\N	2024-12-01 00:11:50.807378	2024-12-06 23:14:40.09901	35.6616997	139.735385	\N
549	シーシャラウンジ 吸ートピア 歌舞伎町店	東京都新宿区歌舞伎町１丁目３−１０	\N	新宿	3500	\N	15:00 〜 06:00	\N	\N	2024-12-01 00:11:51.800217	2024-12-06 23:14:40.101337	35.6949308	139.7039714	\N
550	LESTE	東京都千代田区神田紺屋町44 イーストビル3F	\N	千代田	3400	\N	15:00 〜 02:00	\N	\N	2024-12-01 00:11:52.546225	2024-12-06 23:14:40.103509	35.6931357	139.7736598	\N
551	御徒町シーシャWARP	東京都台東区上野5丁目25-8 御徒町グランディアビル5F	\N	台東	2500	\N	14:00 〜 04:00	\N	\N	2024-12-01 00:11:53.262127	2024-12-06 23:14:40.105684	35.7073832	139.7754918	\N
552	蒲田シーシャ風香	東京都大田区西蒲田7丁目46-12 ビル4階	\N	大田	3000	\N	17:00 〜 05:00	\N	\N	2024-12-01 00:11:53.979917	2024-12-06 23:14:40.108226	35.5630247	139.7144926	\N
554	シーシャ×バーC.STAND上野店	東京都台東区上野2-14-31 レイクサイドビル4階	\N	台東	\N	\N	13:00 〜 05:00	\N	\N	2024-12-01 00:11:55.420494	2024-12-06 23:14:40.11238	35.7105457	139.7731787	\N
555	AI♡けむろいど	東京都港区新橋3-2-3 ル・グラシエルBLDG. 17　5F	\N	港	4000	\N	18:00 〜 05:00	\N	\N	2024-12-01 00:11:56.148707	2024-12-06 23:14:40.114664	35.6665539	139.7547136	\N
556	花冷え　Hanabie	東京都世田谷区北沢2-19-10 3F	\N	世田谷	2500	\N	14:00 〜 05:00	\N	\N	2024-12-01 00:11:57.441588	2024-12-06 23:14:40.117014	35.661157	139.6674351	\N
557	Yellow Nakameguro	東京都目黒区上目黒2-44-24 COMS中目黒Ⅰ 1F	\N	目黒	3000	\N	11:00 〜 04:00	\N	\N	2024-12-01 00:11:58.588895	2024-12-06 23:14:40.119172	35.6419153	139.6968759	\N
558	煙間 -ENMA- 歌舞伎町店	東京都新宿区歌舞伎町1-14-3 川新ビル3F	\N	新宿	3000	\N	14:00 〜 07:00	\N	\N	2024-12-01 00:11:59.408761	2024-12-06 23:14:40.121421	35.694514	139.7019868	\N
559	ALMASTI(アルマスティ) 大塚店	東京都豊島区南大塚3-47-7 ETOビルB1F	\N	豊島	3	\N	14:00 〜 02:00	\N	\N	2024-12-01 00:12:00.226742	2024-12-06 23:14:40.123708	35.7299915	139.7280165	\N
560	爆美女shishabar「D.D」	東京都新宿区歌舞伎町2-11-7 メトロビル4F	\N	新宿	4000	\N	\N	\N	\N	2024-12-01 00:12:00.945184	2024-12-06 23:14:40.125885	35.6963656	139.7047992	\N
561	新橋の秘密基地	東京都港区新宿3-22-7 新橋NビルB1	\N	港	5000	\N	20:00 〜 04:00	\N	\N	2024-12-01 00:12:01.65876	2024-12-06 23:14:40.127942	35.6932377	139.7014645	\N
574	煙火-HANABI-	東京都新宿区歌舞伎町1-12-6	\N	新宿	\N	\N	\N	\N	\N	2024-12-01 00:12:13.646355	2024-12-06 23:14:40.156144	35.6951399	139.7025557	\N
562	no.17 -Shisha lounge 六本木-	東京都港区六本木7丁目10-1 M's BUILD 3F	\N	港	4000	\N	10:00 〜 05:00	\N	\N	2024-12-01 00:12:02.685802	2024-12-06 23:14:40.130199	35.6639756	139.7285602	\N
563	ケムニマク	東京都港区六本木4-5-2 UビルB1	\N	港	\N	\N	20:00 〜 05:00	\N	\N	2024-12-01 00:12:03.503642	2024-12-06 23:14:40.132483	35.665076	139.7326313	\N
564	C.STAND 西新宿1丁目店	東京都新宿区西新宿1-19-2 シルバービル 3F	\N	新宿	\N	\N	13:00 〜 05:00	\N	\N	2024-12-01 00:12:04.690725	2024-12-06 23:14:40.134575	35.6884387	139.6976933	\N
565	Quantum(クオンタム)	東京都渋谷区恵比寿南１丁目８−８ リアルミホビル ３F	\N	渋谷	\N	\N	18:00 〜 05:00	\N	\N	2024-12-01 00:12:05.550998	2024-12-06 23:14:40.136639	35.6460099	139.7087986	\N
566	Be Still	東京都渋谷区道玄坂2-6-12トロワービル6F	\N	渋谷	\N	\N	19:00 〜 05:00	\N	\N	2024-12-01 00:12:06.26994	2024-12-06 23:14:40.138777	35.658885	139.6984477	\N
567	Garden-by-holoholo	東京都文京区湯島3-38-15シャローム湯島B1	\N	文京	\N	\N	18:00 〜 00:00	\N	\N	2024-12-01 00:12:07.029872	2024-12-06 23:14:40.140948	35.707877	139.7714679	\N
568	KUYURI Cafe & Bar	東京都中央区日本橋馬喰町１ 6-15 1F	\N	中央	3000	\N	18:00 〜 00:00	\N	\N	2024-12-01 00:12:08.111265	2024-12-06 23:14:40.143004	35.6931441	139.7828862	\N
569	shisha hælo	東京都杉並区西荻北３丁目３２−１１ ベルエアー西荻 4F	\N	杉並	\N	\N	15:00 〜 00:00	\N	\N	2024-12-01 00:12:09.125816	2024-12-06 23:14:40.145432	35.7063169	139.601039	\N
570	Hookah Rabbit	東京都港区赤坂２丁目１３−１３ オレンジビル ４F	\N	港	4000	\N	16:00 〜 03:00	\N	\N	2024-12-01 00:12:10.336608	2024-12-06 23:14:40.147939	35.6720107	139.7386177	\N
571	Amaretto shisha and bar	東京都千代田区内神田3-7-3 三貢ビルB1	\N	千代田	\N	\N	20:00 〜 05:00	\N	\N	2024-12-01 00:12:11.048226	2024-12-06 23:14:40.149888	35.69088929999999	139.7701788	\N
572	シーシャ バー テラコヤ ( TERAKOYA )	東京都港区六本木４丁目１０−７ 六本木エルビル 地下1階	\N	港	4000	\N	16:00 〜 05:00	\N	\N	2024-12-01 00:12:12.003378	2024-12-06 23:14:40.151978	35.6638056	139.7319274	\N
573	shisha&sweets MOSH 東村山店	東京都東村山市本町１丁目20−１８ ＰａＬａＣｅスズ 地下1階	\N	東村山	3000	\N	14:00 〜 00:00	\N	\N	2024-12-01 00:12:12.720428	2024-12-06 23:14:40.154018	35.7580169	139.4679135	\N
575	バー&シーシャ Laugh Chill	東京都葛飾区新小岩1-26-18	\N	葛飾	\N	\N	10:00 〜 00:00	\N	\N	2024-12-01 00:12:14.868898	2024-12-06 23:14:40.158317	35.7153175	139.8571061	\N
576	シーシャラウンジ musch 麻布十番店	東京都港区麻布十番２丁目３−２	\N	港	4000	\N	17:00 〜 05:00	03-6809-3779	https://www.musch.jp/	2024-12-01 00:12:15.86621	2024-12-06 23:14:40.160503	35.655764	139.7352525	\N
577	Shisha&Bar Mo（モ）	東京都豊島区雑司ヶ谷2-2-4 田中ビル1F	\N	豊島	3500	\N	15:00 〜 00:00	\N	\N	2024-12-01 00:12:17.841178	2024-12-06 23:14:40.16252	35.7178395	139.7164092	\N
578	狼煙〜SHISHA&BAR〜	東京都立川市錦町2-1-10 イワサワビル2階	\N	立川	2500	\N	15:00 〜 03:00	\N	\N	2024-12-01 00:12:18.549509	2024-12-06 23:14:40.164648	35.6956296	139.4155452	\N
579	Chill First	東京都新宿区歌舞伎町２丁目２１−１７	\N	新宿	\N	\N	17:00 〜 07:00	\N	\N	2024-12-01 00:12:19.420224	2024-12-06 23:14:40.166794	35.6963499	139.7044847	\N
580	神保町シーシャハウス レイン	東京都千代田区神田神保町1-7巌松堂ビル7階	\N	千代田	\N	\N	14:00 〜 00:00	\N	\N	2024-12-01 00:12:20.299941	2024-12-06 23:14:40.169215	35.69576199999999	139.7591184	\N
581	麻布シーシャ	東京都港区麻布十番3-5-4 JLB 1F	\N	港	\N	\N	12:00 〜 00:00	\N	\N	2024-12-01 00:12:21.52891	2024-12-06 23:14:40.171169	35.6532203	139.7356574	\N
582	SMOKY LOUNGE Corvo コルヴォ	東京都港区新橋2-15-3	\N	港	\N	\N	17:00 〜 03:00	\N	\N	2024-12-01 00:12:22.706907	2024-12-06 23:14:40.173136	35.6666498	139.7563534	\N
583	Shisha Lounge 1986	東京都世田谷区経堂1-24-16	\N	世田谷	\N	\N	20:00 〜 05:00	\N	\N	2024-12-01 00:12:24.700175	2024-12-06 23:14:40.175193	35.6493277	139.6364323	\N
584	SHISHA shiro	東京都台東区上野7-2-1昭栄ビル2C	\N	台東	\N	\N	17:00 〜 05:00	\N	\N	2024-12-01 00:12:25.488156	2024-12-06 23:14:40.177277	35.7124673	139.7775288	\N
585	Music&Shisha L.I.B	東京都立川市錦町1-6-16 2F	\N	立川	\N	\N	19:00 〜 04:00	\N	\N	2024-12-01 00:12:26.749466	2024-12-06 23:14:40.179302	35.6965686	139.4181539	\N
586	シーシャカフェバーrayレイ	東京都調布市布田１丁目49−１７	\N	調布	3000	\N	13:00 〜 05:00	\N	\N	2024-12-01 00:12:27.756891	2024-12-06 23:14:40.181635	35.6517326	139.5462833	\N
587	新宿シーシャ倶楽部	東京都新宿区歌舞伎町1-16-5 ドンキホーテ新宿歌舞伎町店 6F	\N	新宿	3000	\N	16:00 〜 05:00	\N	\N	2024-12-01 00:12:29.001007	2024-12-06 23:14:40.184066	35.69380719999999	139.7017645	\N
588	Shisha/Hookah Bar Chouette	東京都世田谷区三軒茶屋２丁目１４−１２ 三元ビル 702	\N	世田谷	3000	\N	\N	\N	\N	2024-12-01 00:12:30.024231	2024-12-06 23:14:40.186195	35.6431974	139.6698234	\N
589	喫茶酒場 水煙	東京都大田区西蒲田7-1-8 伊藤ビル1F	\N	大田	\N	\N	15:00 〜 00:00	\N	\N	2024-12-01 00:12:31.048472	2024-12-06 23:14:40.188511	35.5635093	139.7160294	\N
590	Shisha Queen	東京都中野区弥生町２丁目２２−１ 武田ビル2F B室	\N	中野	3000	\N	18:00 〜 05:00	\N	\N	2024-12-01 00:12:32.183657	2024-12-06 23:14:40.190636	35.692645	139.6749117	\N
592	VISAVIS(ビザビ)西麻布 シーシャBAR	東京都港区西麻布３丁目２４−１６	\N	港	\N	\N	\N	\N	\N	2024-12-01 00:12:34.839216	2024-12-06 23:14:40.194625	35.659062	139.7238013	\N
593	シーシャカフェ＆バーmusch（ムッシュ）渋谷宮下パーク前店	東京都渋谷区神宮前６丁目１９−１７ GEMS神宮前 9F	\N	渋谷	3000	\N	13:00 〜 05:00	03-6846-6967	https://www.musch.jp/	2024-12-01 00:12:35.964473	2024-12-06 23:14:40.196794	35.6637445	139.7023766	\N
594	シーシャカフェ charcoal	東京都港区新橋３丁目３−３	\N	港	\N	\N	13:00 〜 05:00	\N	\N	2024-12-01 00:12:36.987578	2024-12-06 23:14:40.199047	35.6659811	139.7544169	\N
595	shall we シーシャ cafe&bar 小岩店	​東京都江戸川区南小岩8-7-9 大平ビル2F	\N	江戸川	3000	\N	17:00 〜 05:00	\N	\N	2024-12-01 00:12:37.704957	2024-12-06 23:14:40.201151	35.7308825	139.8848213	\N
596	平井 Shisha ARNAB	東京都江戸川区平井４丁目６−３ 太田ビル2階	\N	江戸川	3000	\N	13:00 〜 00:00	\N	\N	2024-12-01 00:12:38.467925	2024-12-06 23:14:40.203409	35.7046456	139.8456288	\N
597	FABULOUS	東京都渋谷区恵比寿西1-8-10 木村ビル2F	\N	渋谷	6000	\N	19:00 〜 05:00	\N	\N	2024-12-01 00:12:39.343411	2024-12-06 23:14:40.205651	35.64735720000001	139.7084695	\N
598	1496 shisha cafe&bar	東京都渋谷区道玄坂1-5-9 レンガビル 4F-D	\N	渋谷	\N	\N	12:00 〜 04:00	\N	\N	2024-12-01 00:12:40.163163	2024-12-06 23:14:40.207731	35.6581824	139.6993939	\N
599	Ginza Shisha 888	東京都中央区銀座３丁目２－１３ 江戸常ビル4階	\N	中央	\N	\N	13:00 〜 02:00	\N	\N	2024-12-01 00:12:40.879153	2024-12-06 23:14:40.210191	35.6730465	139.7646589	\N
600	FullMoon	東京都武蔵野市吉祥寺本町 1-1-6	\N	武蔵野	\N	\N	19:00 〜 04:00	\N	\N	2024-12-01 00:12:41.693458	2024-12-06 23:14:40.212214	35.70371859999999	139.5788996	\N
748	シーシャカフェ&バー musch/ムッシュ 渋谷道玄坂上店	東京都渋谷区道玄坂１丁目２０−３ COERU SHIBUYA1F	\N	渋谷	3000	\N	13:00 〜 05:00	03-6416-9292	https://www.musch.jp/	2024-12-06 23:14:40.919148	2024-12-06 23:14:40.919148	35.6567574	139.6967652	\N
602	シーシャカフェ＆バー 暖欒	東京都江東区門前仲町1-7-11 名取ビル4F	\N	江東	3100	\N	12:00 〜 05:00	\N	\N	2024-12-01 00:12:43.643229	2024-12-06 23:14:40.926469	35.6728047	139.7945928	\N
603	渋谷Shiaha lounge GOONies In TK NIGHTCLUB	東京都渋谷区宇田川町１３−８ちとせ会館 B1	\N	渋谷	3500	\N	\N	\N	\N	2024-12-01 00:12:44.463163	2024-12-06 23:14:40.930609	35.6611121	139.6985442	\N
604	FOUR+	東京都港区麻布十番２丁目９−７DIONE 8 7F	\N	港	\N	\N	19:00 〜 05:00	\N	\N	2024-12-01 00:12:45.282826	2024-12-06 23:14:40.934715	35.6550115	139.734467	\N
509	Coffee&Shisha Bar Sillage	東京都品川区大井1丁目15−5 GSビル 4階	\N	品川	3000	\N	営業中：12:00 〜 02:00	\N	\N	2024-12-01 00:11:14.136397	2024-12-05 18:24:27.962863	35.6077213	139.7312429	\N
506	C.STAND+ 新宿歌舞伎町店	東京都新宿区歌舞伎町1-18-8第一モナミビル 3F	\N	新宿	2	\N	14:00 〜 07:00	\N	\N	2024-12-01 00:11:11.483878	2024-12-06 23:14:37.231951	35.694747	139.7017076	\N
507	CHILL COLLECTION	東京都渋谷区宇田川町13-11 KN渋谷1ビルB1F	\N	渋谷	3000	\N	12:00 〜 06:00	\N	\N	2024-12-01 00:11:12.255551	2024-12-06 23:14:37.234509	35.6612476	139.6982771	\N
508	シーシャ羽	東京都葛飾区新小岩1-39-10​山崎ビル2階	\N	葛飾	2500	\N	14:00 〜 05:00	\N	\N	2024-12-01 00:11:13.122291	2024-12-06 23:14:37.236694	35.7149546	139.8601016	\N
510	ice shisha lounge	東京都中野区東中野1-45-9 宮原ビル4階	\N	中野	2700	\N	17:00 〜 04:00	\N	\N	2024-12-01 00:11:14.967906	2024-12-06 23:14:38.532539	35.705241	139.6862662	\N
511	shisha cafe&bar 鹿華	東京都渋谷区神宮前4丁目28−7 B1-A ＲＤＭビル	\N	渋谷	3000	\N	11:30 〜 00:00	\N	\N	2024-12-01 00:11:15.786938	2024-12-06 23:14:38.537296	35.6691728	139.7073624	\N
512	Shisha Orca	東京都新宿区歌舞伎町２丁目19−10 ABCビル 7F	\N	新宿	3500	\N	12:00 〜 06:00	\N	\N	2024-12-01 00:11:17.015599	2024-12-06 23:14:38.54076	35.698082	139.7041257	\N
513	B-Side Shisha Bar	東京都港区六本木3丁目8−7 サクセスビル 201	\N	港	6	\N	19:00 〜 05:00	\N	\N	2024-12-01 00:11:17.983018	2024-12-06 23:14:38.543767	35.6631657	139.7345428	\N
514	ホロホロシーシャ 神保町店	東京都千代田区神田神保町1丁目19−6 KTビル 5階	\N	千代田	2000	\N	13:00 〜 05:00	\N	\N	2024-12-01 00:11:19.024805	2024-12-06 23:14:38.546607	35.6953042	139.7606565	\N
515	五反田シーシャ 茉莉	東京都品川区東五反田1丁目20−9	\N	品川	3300	\N	17:00 〜 00:00	\N	\N	2024-12-01 00:11:19.952024	2024-12-06 23:14:38.549467	35.62608609999999	139.7265211	\N
516	茶煙 四十九手	東京都世田谷区太子堂4丁目14−1	\N	世田谷	4000	\N	18:00 〜 02:00	\N	\N	2024-12-01 00:11:20.903336	2024-12-06 23:14:38.551859	35.6443793	139.6678094	\N
517	shallwe 新小岩シーシャcafe&bar	​東京都葛飾区新小岩1-22-10トーアファンシービル501	\N	葛飾	2300	\N	17:00 〜 06:00	\N	\N	2024-12-01 00:11:21.723538	2024-12-06 23:14:38.554241	35.7149134	139.8583862	\N
518	恵比寿 489 〜yohaku〜	東京都渋谷区恵比寿南2丁目1−6 鳥居ビル 5F	\N	渋谷	3000	\N	18:00 〜 02:00	\N	\N	2024-12-01 00:11:22.850661	2024-12-06 23:14:38.556501	35.6458343	139.7070985	\N
519	SOUND BAR MOD'Z	東京都渋谷区恵比寿西1丁目3−2 恵比寿テラスビル 6F	\N	渋谷	15000	\N	20:00 〜 05:00	\N	\N	2024-12-01 00:11:23.575571	2024-12-06 23:14:38.558778	35.6489902	139.708519	\N
605	torch [三宿 水タバコ シーシャ カフェ バー]	東京都世田谷区池尻１丁目７−１９ 三宿タイニーテラス 4階	\N	世田谷	3000	\N	19:00 〜 02:00	\N	\N	2024-12-01 00:12:46.10446	2024-12-06 23:14:40.945545	35.6425655	139.6807791	\N
606	FREAKY MONKEY	東京都世田谷区松原１丁目３６−７TRN明大前 3F	\N	世田谷	3500	\N	\N	\N	\N	2024-12-01 00:12:46.819547	2024-12-06 23:14:40.947933	35.6686858	139.6511376	\N
607	muse六本木店	東京都港区六本木４丁目１０−３第V大栄ビル ７階	\N	港	3000	\N	15:00 〜 05:00	\N	\N	2024-12-01 00:12:47.638996	2024-12-06 23:14:40.950538	35.664029	139.7324416	\N
608	Shisha Cafe&Bar NEXUS	東京都新宿区歌舞伎町1-12-1KTビル4F	\N	新宿	3300	\N	\N	\N	\N	2024-12-01 00:12:48.457901	2024-12-06 23:14:40.95308	35.6951195	139.7025453	\N
609	musch池袋東口店	東京都豊島区東池袋１丁目２３−９スタック池袋 ２Ｆ	\N	豊島	\N	\N	13:00 〜 05:00	03-5843-3842	https://www.musch.jp/	2024-12-01 00:12:49.186895	2024-12-06 23:14:40.955458	35.729246	139.715844	\N
610	Shisha Lounge Key 新宿歌舞伎町店	東京都新宿区歌舞伎町1-5-6新宿ゴールド第1ビル B1F	\N	新宿	4100	\N	15:00 〜 07:00	\N	\N	2024-12-01 00:12:50.13955	2024-12-06 23:14:40.957599	35.6937326	139.7025951	\N
611	ENZAN AOYAMA -煙山青山店-	東京都港区南青山5丁目13-2菊家ビル4F	\N	港	4000	\N	11:00 〜 05:00	\N	\N	2024-12-01 00:12:50.912889	2024-12-06 23:14:40.961027	35.6613086	139.7139213	\N
612	Bar deuce	東京都大田区大森北1-11-5共和七番館ビル地下1階	\N	大田	4000	\N	\N	\N	\N	2024-12-01 00:12:51.836764	2024-12-06 23:14:40.963484	35.5871342	139.7289994	\N
613	musch恵比寿西口店	東京都渋谷区恵比寿西１丁目２１−５SreedEBISU+t 1F	\N	渋谷	3500	\N	12:30 〜 05:00	03-6459-3493	https://www.musch.jp/	2024-12-01 00:12:52.580724	2024-12-06 23:14:40.96576	35.6464136	139.7058963	\N
614	シーシャカフェema.	東京都新宿区西新宿１丁目１５−９VINTAGE西新宿 ７Ｆ	\N	新宿	\N	\N	13:00 〜 05:00	\N	\N	2024-12-01 00:12:53.475476	2024-12-06 23:14:40.968131	35.6889495	139.6973596	\N
615	錦糸町シーシャ Bar Dope	東京都墨田区江東橋3-5-1ザ・バレル立田ビル 3F	\N	墨田	2500	\N	\N	\N	\N	2024-12-01 00:12:54.422236	2024-12-06 23:14:40.970248	35.6938613	139.8133662	\N
616	シーシャカフェ＆バーmuse渋谷松濤店	東京都渋谷区松濤1-28-7シャトレー松濤1F	\N	渋谷	3000	\N	12:00 〜 05:00	\N	\N	2024-12-01 00:12:55.215622	2024-12-06 23:14:40.972588	35.6595878	139.694237	\N
617	五反田シーシャLyra	東京都品川区東五反田2丁目3−2ＩＭ五反田ビル 4F	\N	品川	2500	\N	15:30 〜 04:30	\N	\N	2024-12-01 00:12:56.032666	2024-12-06 23:14:40.974987	35.6255223	139.7261059	\N
618	Shisha Bar ARTIS	東京都港区西麻布2-13-1メイプル西麻布4F	\N	港	5520	\N	\N	\N	\N	2024-12-01 00:12:56.808178	2024-12-06 23:14:40.977562	35.6611053	139.7227937	\N
619	シーシャラウンジはなれ	東京都千代田区飯田橋３丁目１−６マリアナ飯田橋East 3F	\N	千代田	3000	\N	12:00 〜 00:00	\N	\N	2024-12-01 00:12:57.630792	2024-12-06 23:14:40.979538	35.7005403	139.748041	\N
620	ShishaTella〜絆〜	東京都豊島区西池袋１丁目３５−４ネスパビル 3f	\N	豊島	4500	\N	19:00 〜 05:00	\N	\N	2024-12-01 00:12:58.492107	2024-12-06 23:14:40.981902	35.7325197	139.709931	\N
621	T.O.P上野	東京都台東区上野4-4-6上野B＆Vビル9F	\N	台東	2000	\N	\N	\N	\N	2024-12-01 00:12:59.312048	2024-12-06 23:14:40.984337	35.7085767	139.7735748	\N
622	muse 新宿西口店	東京都新宿区西新宿1-15-9VINTAGE1 5階	\N	新宿	3000	\N	13:00 〜 05:00	\N	\N	2024-12-01 00:13:00.245379	2024-12-06 23:14:40.986665	35.6889495	139.6973596	\N
623	SHISHA TRIANGLE	東京都杉並区高円寺南３丁目５７−１０第一高円寺KSビル 5階	\N	杉並	2000	\N	20:00 〜 02:00	\N	\N	2024-12-01 00:13:00.959714	2024-12-06 23:14:40.989139	35.7037418	139.6486715	\N
749	UN 戸越銀座店	東京都品川区平塚３丁目４−２エムズ戸越銀座5階	\N	品川	\N	\N	14:00 〜 03:00	03-6421-6954	https://shishaspot.jp/	2024-12-06 23:14:41.687957	2024-12-06 23:14:41.687957	35.6160344	139.7123298	\N
625	C.STAND 池袋東口店	東京都豊島区南池袋１丁目２０−２翠ビル 3階	\N	豊島	2500	\N	12:00 〜 05:00	\N	\N	2024-12-01 00:13:02.623537	2024-12-06 23:14:41.696917	35.7280669	139.7126985	\N
626	melt stone	東京都港区芝5丁目27-13第2小川ビル3階	\N	港	\N	\N	14:00 〜 05:00	\N	\N	2024-12-01 00:13:03.410551	2024-12-06 23:14:41.701856	35.6469427	139.7463728	\N
627	THREE	東京都世田谷区三軒茶屋２丁目１０−１４ GREST三軒茶屋 2F	\N	世田谷	3	\N	11:00 〜 05:00	\N	\N	2024-12-01 00:13:04.130457	2024-12-06 23:14:41.705192	35.6423058	139.6688765	\N
628	Magnetic	東京都港区新橋2丁目11-8国土施設ビル地下2階	\N	港	3500	\N	18:00 〜 05:00	03-3581-0130	https://x.com/Magnetic_shisha	2024-12-01 00:13:04.919746	2024-12-06 23:14:41.708286	35.6670998	139.7552168	\N
750	チルイン新宿歌舞伎町/ゴジラロード店	東京都新宿区歌舞伎町1-16-6 第6ポールスタービル5F	\N	新宿	1	\N	12:00〜5:00	03-6205-9403	https://shisha-chillin.com/	2024-12-06 23:14:42.516057	2024-12-06 23:14:42.516057	35.6939567	139.7018042	\N
630	Hoopa	東京都新宿区歌舞伎町１丁目１５−９ 岡村ビル ３Ｆ	\N	新宿	3	\N	\N	\N	\N	2024-12-01 00:13:06.888369	2024-12-06 23:14:42.526006	35.69426	139.7022567	\N
631	アラビアン	東京都新宿区歌舞伎町1丁目12番14号	\N	新宿	2	\N	\N	\N	\N	2024-12-01 00:13:07.708166	2024-12-06 23:14:42.530255	35.6949962	139.7025347	\N
632	Sweet Trip	東京都新宿区歌舞伎町１丁目１８−１藤田ビル4F	\N	新宿	3	\N	\N	\N	\N	2024-12-01 00:13:08.527457	2024-12-06 23:14:42.533374	35.6944968	139.7015979	\N
633	PARADoX	東京都新宿区歌舞伎町2−28−15サチビル3階	\N	新宿	\N	\N	\N	\N	\N	2024-12-01 00:13:09.345781	2024-12-06 23:14:42.536399	35.6963223	139.7035248	\N
634	mahimahi	東京都新宿区歌舞伎町2-38-8 八汐会館4F-C室	\N	新宿	2	\N	\N	\N	\N	2024-12-01 00:13:10.575063	2024-12-06 23:14:42.539174	35.6965998	139.7021252	\N
635	S.S.B	東京都新宿区歌舞伎町2-10-2ジェストビル5F	\N	新宿	\N	\N	\N	\N	\N	2024-12-01 00:13:11.394068	2024-12-06 23:14:42.541905	35.6950805	139.7045	\N
636	J shisha lounge	東京都新宿区若葉３丁目2−２４ B1F	\N	新宿	2	\N	\N	\N	\N	2024-12-01 00:13:12.491476	2024-12-06 23:14:42.544052	35.6831242	139.7244497	\N
637	BAR DARAQ	東京都新宿区歌舞伎町1-12-6歌舞伎町ビル２F	\N	新宿	\N	\N	\N	\N	\N	2024-12-01 00:13:13.238443	2024-12-06 23:14:42.547452	35.6951895	139.7028209	\N
642	SHOUROUK	東京都渋谷区渋谷2-3-3八幡通り仙海ビル1F	\N	渋谷	\N	\N	\N	\N	\N	2024-12-01 00:13:18.156569	2024-12-06 23:14:42.559583	35.6596504	139.7087766	\N
638	Wood Bar Cabana	東京都新宿区歌舞伎町１丁目１２−１４ 1階	\N	新宿	\N	\N	\N	\N	\N	2024-12-01 00:13:14.466195	2024-12-06 23:14:42.549807	35.6949962	139.7025347	\N
639	NEW LAND InternationalBar	東京都新宿区高田馬場1-25-29 高田馬場サンコールビル　4F	\N	新宿	2	\N	\N	\N	\N	2024-12-01 00:13:15.286116	2024-12-06 23:14:42.552445	35.8049204	139.7284878	\N
640	SHISHA CAFE NORTH VILLAGE 渋谷VIP店	東京都渋谷区宇田川町３４−６ M&Iビル 1階	\N	渋谷	3	\N	14:00〜5:00	03-6809-0949	https://shisha.tokyo/	2024-12-01 00:13:16.520737	2024-12-06 23:14:42.554855	35.6612574	139.6963824	\N
641	チルイン渋谷道玄坂小路店	東京都渋谷区道玄坂 2-29-13 若槻ビル301	\N	渋谷	1	\N	\N	\N	https://shisha-chillin.com/	2024-12-01 00:13:17.299581	2024-12-06 23:14:42.557054	35.6596763	139.6978848	\N
643	はちグラム 祐天寺店	東京都目黒区祐天寺２丁目３−１６ 黒川ビル ２F	\N	目黒	2	\N	\N	\N	\N	2024-12-01 00:13:19.177282	2024-12-06 23:14:42.561823	35.6376145	139.692137	\N
644	QUEEN LOUNGE SHISHA＆CHILLIN’ ROPPONGI	東京都港区六本木６丁目７−１７ Azabu Nest Bldg. QUEEN &	\N	港	\N	\N	\N	\N	\N	2024-12-01 00:13:20.118042	2024-12-06 23:14:42.564099	35.6616414	139.7326224	\N
645	Sheyda Bar	東京都港区六本木３丁目１１−６ Taimeビル 3F	\N	港	2	\N	\N	\N	\N	2024-12-01 00:13:20.918265	2024-12-06 23:14:42.566214	35.663129	139.7330944	\N
646	Bar SHOT+	東京都港区六本木5丁目2-11-パティオ六本木ビル4𝘍	\N	港	\N	\N	\N	\N	\N	2024-12-01 00:13:21.635933	2024-12-06 23:14:42.568493	35.6632245	139.7330798	\N
647	ALMA Hookah Lounge	東京都港区西麻布１丁目５−１６ Life Rox Cube 3F	\N	港	\N	\N	\N	\N	\N	2024-12-01 00:13:22.799657	2024-12-06 23:14:42.570581	35.66150330000001	139.7245894	\N
648	KOLBE International Restaurant&Bar	東京都港区西麻布４-2-2 2F	\N	港	\N	\N	\N	\N	\N	2024-12-01 00:13:24.092253	2024-12-06 23:14:42.572812	35.658505	139.723538	\N
649	Bar Mr.Shisha 赤坂	東京都港区赤坂３丁目１３−１ ベルズ赤坂 3F	\N	港	4	\N	\N	\N	\N	2024-12-01 00:13:24.85102	2024-12-06 23:14:42.575157	35.67361100000001	139.7375086	\N
650	Mazaj Shisha Lounge	東京都港区南青山3丁目８－２OGビル３F	\N	港	3	\N	\N	\N	\N	2024-12-01 00:13:25.674042	2024-12-06 23:14:42.577248	35.6675483	139.715282	\N
651	Shisha Labo シーシャラボ 新橋	東京都港区新橋3-14-4 ルグラシエルビル49 6F	\N	港	3	\N	\N	\N	\N	2024-12-01 00:13:26.4932	2024-12-06 23:14:42.579461	35.6655044	139.7562519	\N
652	×α〜アルフ〜	東京都中野区弥生町２丁目３２−１５ 三恵ＳＴビル 2B	\N	中野	\N	\N	\N	\N	\N	2024-12-01 00:13:27.368433	2024-12-06 23:14:42.58189	35.6908665	139.6741136	\N
653	はちグラム高円寺店	東京都杉並区高円寺南3-58-18 山本ビル3F	\N	杉並	2	\N	\N	\N	\N	2024-12-01 00:13:28.086762	2024-12-06 23:14:42.583983	35.7050744	139.6488347	\N
654	東京水煙倶楽部	東京都杉並区上荻1-18-3 亀屋酒販第2ビル2階 210号室	\N	杉並	2	\N	\N	\N	\N	2024-12-01 00:13:28.858417	2024-12-06 23:14:42.585968	35.7057366	139.6179164	\N
655	阿佐ヶ谷シーシャ	東京都杉並区阿佐谷北２丁目１−１ 石井ビル 3階	\N	杉並	2	\N	\N	\N	\N	2024-12-01 00:13:30.135903	2024-12-06 23:14:42.58815	35.7051196	139.6359146	\N
656	Minus Blue 下北沢店	東京都世田谷区北沢2-19-12 白川ビル2F	\N	世田谷	3	\N	\N	\N	\N	2024-12-01 00:13:30.95245	2024-12-06 23:14:42.590358	35.6609546	139.6674457	\N
657	イレブン	東京都足立区千住4-19-11 4F	\N	足立	\N	\N	\N	\N	\N	2024-12-01 00:13:32.18395	2024-12-06 23:14:42.592525	35.7525927	139.8035467	\N
658	NEO	東京都足立区千住3-68-1　鹿明ビル2階	\N	足立	\N	\N	\N	\N	\N	2024-12-01 00:13:33.00034	2024-12-06 23:14:42.59455	35.7513932	139.8033269	\N
659	Hide And Shisha	東京都足立区千住2-38 2F	\N	足立	\N	\N	\N	\N	\N	2024-12-01 00:13:34.237719	2024-12-06 23:14:42.596758	35.7489089	139.8020482	\N
660	Totoris	東京都大田区蒲田5-16-8鵠沼ビル2F	\N	大田	2	\N	\N	\N	\N	2024-12-01 00:13:34.972887	2024-12-06 23:14:42.598882	35.5621892	139.7173068	\N
661	ブッダブレイク	東京都台東区浅草３丁目３６−４	\N	台東	2	\N	\N	\N	\N	2024-12-01 00:13:35.983508	2024-12-06 23:14:42.601099	35.7177333	139.7954354	\N
662	KIMET	東京都台東区浅草１丁目４１−９	\N	台東	\N	\N	\N	\N	\N	2024-12-01 00:13:36.725778	2024-12-06 23:14:42.603394	35.7130367	139.794097	\N
663	Bar Romeo	東京都台東区上野2-12-16小島ビル5階	\N	台東	\N	\N	\N	\N	\N	2024-12-01 00:13:37.507067	2024-12-06 23:14:42.60542	35.7094247	139.7718174	\N
664	Aladdin Lamp	東京都北区上十条2丁目22-10 2F	\N	北	2	\N	\N	\N	\N	2024-12-01 00:13:38.531732	2024-12-06 23:14:42.607359	35.7615298	139.7202099	\N
665	MADAR AKABANE	東京都北区赤羽3丁目3-3 1F	\N	北	2	\N	\N	\N	\N	2024-12-01 00:13:39.656572	2024-12-06 23:14:42.609309	35.7828173	139.7191091	\N
666	Chill Station	東京都板橋区板橋１丁目５１−４ ドルフ前島 2F	\N	板橋	\N	\N	\N	\N	\N	2024-12-01 00:13:40.707622	2024-12-06 23:14:42.611509	35.7478825	139.7196776	\N
667	エジプシャンレストラン＆カフェ スフィンクス	東京都清瀬市野塩5-291	\N	清瀬	1	\N	\N	\N	\N	2024-12-01 00:13:41.808082	2024-12-06 23:14:42.613694	35.7777543	139.4984552	\N
668	VIBES	東京都八王子市中町３−９ クレインコート 5F	\N	八王子	\N	\N	\N	\N	\N	2024-12-01 00:13:42.625	2024-12-06 23:14:42.615836	35.6588441	139.3365469	\N
669	MOKUMOKU（黙黙）	東京都国分寺市南町3丁目18-11 三樹国分寺ビル2F	\N	国分寺	\N	\N	\N	\N	\N	2024-12-01 00:13:43.389285	2024-12-06 23:14:42.617859	35.6991535	139.4795459	\N
670	ガネーシャ 【 亀戸シーシャ 】	東京都江東区亀戸2-26-5亀戸第二ミハマビル1階	\N	江東	\N	\N	\N	\N	\N	2024-12-01 00:13:44.266344	2024-12-06 23:14:42.620032	35.6988654	139.8249548	\N
671	pukupuku NEON	東京都新宿区歌舞伎町1-2-1ナインティビル7.8階	\N	新宿	\N	\N	\N	\N	\N	2024-12-01 00:13:44.981726	2024-12-06 23:14:42.622208	35.6933102	139.7037096	\N
672	STONE	東京都台東区上野2-2-3 コロンビアビル3F	\N	台東	\N	\N	\N	\N	\N	2024-12-01 00:13:45.698249	2024-12-06 23:14:42.624553	35.7084781	139.7722068	\N
673	shisha Cafe&Bar Parasite	東京都港区麻布十番1-6-1THE V-CITY麻布十番 PLACE 5階	\N	港	\N	\N	\N	\N	\N	2024-12-01 00:13:46.562325	2024-12-06 23:14:42.626606	35.6567086	139.7343653	\N
674	TENET	東京都目黒区東山３丁目６−１５エビヤビル ４０２	\N	目黒	\N	\N	\N	\N	\N	2024-12-01 00:13:47.338192	2024-12-06 23:14:42.628736	35.6501159	139.68688	\N
675	LOCO六本木	東京都港区六本木5-16-4ZONE麻布六本木6階	\N	港	\N	\N	\N	\N	\N	2024-12-01 00:13:48.054036	2024-12-06 23:14:42.63095	35.6608082	139.7355048	\N
676	SHISHA Exhale	東京都新宿区歌舞伎町1-28-2 J・レックス新宿3F	\N	新宿	\N	\N	\N	\N	\N	2024-12-01 00:13:48.927683	2024-12-06 23:14:42.634227	35.6953619	139.7003613	\N
677	𝐒𝐡𝐢𝐧𝐚𝐠𝐚𝐰𝐚 𝐒𝐡𝐢𝐬𝐡𝐚 𝐃𝐞𝐯𝐢 𝐅𝐮𝐬𝐢𝐨𝐧	東京都港区高輪3-25-23 京急第2ビル品川横2F	\N	港	\N	\N	\N	\N	\N	2024-12-01 00:13:49.74217	2024-12-06 23:14:42.636477	35.630784	139.7378705	\N
678	ami shisha lounge	東京都渋谷区円山町20-5 ビル4階	\N	渋谷	\N	\N	\N	\N	\N	2024-12-01 00:13:50.61746	2024-12-06 23:14:42.638633	35.6562795	139.694568	\N
679	喫茶ベルキッシュ	東京都港区西麻布2丁目24番17号	\N	港	\N	\N	\N	\N	\N	2024-12-01 00:13:51.435057	2024-12-06 23:14:42.640687	35.6601226	139.7223614	\N
751	チルラグ六本木店	東京都港区六本木６丁目２−６ GEMS六本木 6階	\N	港	\N	\N	20:00〜05:00	03-6447-1511	https://chillrug.com/	2024-12-06 23:14:43.343734	2024-12-06 23:14:43.343734	35.6620118	139.7307167	\N
752	シーシャ maya cafe&Bar 新宿三丁目店	東京都新宿区新宿3-3-3恩田セントラルビル4階	\N	新宿	\N	\N	14:00〜05:00	03-5315-4777	https://cafebar-shisha-maya.com/	2024-12-06 23:14:44.06374	2024-12-06 23:14:44.06374	35.6906517	139.7057666	\N
680	Royal smoke	神奈川県横浜市中区長者町8-133	\N	横浜	4	\N	19:00 〜 06:00	\N	\N	2024-12-04 20:24:29.409806	2024-12-06 23:14:44.073086	35.4440235	139.6297284	\N
681	Apache Yokohama best Shishabar	神奈川県横浜市中区長者町8-133-8 谷知ビル1階	\N	横浜	\N	\N	18:00 〜 09:00	\N	\N	2024-12-04 20:24:30.230175	2024-12-06 23:14:44.079058	35.4441099	139.629759	\N
682	CHILL TIGER	神奈川県横浜市中区不老町1-6-8 ポートサイドビル６F	\N	横浜	\N	\N	14:00 〜 05:00	\N	\N	2024-12-04 20:24:31.047958	2024-12-06 23:14:44.084139	35.4417559	139.6368507	\N
683	PRESTIGE LOUNGE(プレスティージュ・ラウンジ)	神奈川県横浜市中区長者町９丁目１７２	\N	横浜	6	\N	19:00 〜 06:00	\N	\N	2024-12-04 20:24:31.969486	2024-12-06 23:14:44.087919	35.44499200000001	139.6293001	\N
684	バンカラゾーン横浜- BAN×KARA ZONE YK	神奈川県横浜市中区住吉町1-10 ラビオス関内 7F	\N	横浜	\N	\N	21:00 〜 04:00	\N	\N	2024-12-04 20:24:32.737226	2024-12-06 23:14:44.091024	35.4457602	139.6389726	\N
685	横浜野毛シーシャ Cim(シム)	神奈川県横浜市中区花咲町1-47皖江ビル2階	\N	横浜	\N	\N	18:00 〜 04:00	\N	\N	2024-12-04 20:24:33.504432	2024-12-06 23:14:44.093733	35.4495324	139.6303806	\N
686	PARIS HOOKAH パリフーカー バー International Restaurant & Shisha Bar	神奈川県横浜市中区福富町西通５１−２ ＴＳビル １F	\N	横浜	\N	\N	19:00 〜 05:00	\N	\N	2024-12-04 20:24:34.428559	2024-12-06 23:14:44.096346	35.4452334	139.6303261	\N
687	シーシャバー iBAR Yokohama	神奈川県横浜市中区福富町仲通３４−７ 1F ibar ラ・フェスタビル	\N	横浜	\N	\N	17:00 〜 07:00	\N	\N	2024-12-04 20:24:35.154128	2024-12-06 23:14:44.098663	35.4449282	139.6303578	\N
688	STAND BY SIDE ＜Shisha＆Bar＞	神奈川県横浜市港北区篠原北1-1-12	\N	北	\N	\N	19:00 〜 04:00	\N	\N	2024-12-04 20:24:37.192184	2024-12-06 23:14:44.100721	35.50951939999999	139.6297284	\N
689	shisha (ｼｰｼｬ) cafe & bar CHILLMI	神奈川県横浜市鶴見区鶴見中央５丁目６−１３ ライオンズマンション鶴見第２	\N	横浜	\N	\N	20:00 〜 03:00	\N	\N	2024-12-04 20:24:38.190036	2024-12-06 23:14:44.103007	35.5043648	139.6760465	\N
690	SAVU	神奈川県川崎市川崎区東田町4-3 SSB川崎ビル402	\N	川崎	3	\N	17:00 〜 02:00	\N	\N	2024-12-04 20:24:39.010593	2024-12-06 23:14:44.117863	35.5291758	139.7017774	\N
691	C.STANDシースタンド 川崎GEMS店	神奈川県川崎市川崎区砂子２丁目４−１４ GEMS5階	\N	川崎	2	\N	13:00 〜 04:00	\N	\N	2024-12-04 20:24:39.854076	2024-12-06 23:14:44.120078	35.5302589	139.700852	\N
722	大船オトナノパブリック	神奈川県鎌倉市大船2-6-42	\N	鎌倉	\N	\N	\N	\N	\N	2024-12-04 20:25:11.394171	2024-12-06 23:14:44.197678	35.3524968	139.5340046	\N
693	stay loose 武蔵小杉	神奈川県川崎市中原区新丸子東2-924-47シャンティ加藤3F	\N	川崎	\N	\N	13:00 〜 04:00	\N	\N	2024-12-04 20:24:41.799605	2024-12-06 23:14:44.12444	35.5767616	139.6604449	\N
694	湘南シーシャ Knot(ノット)	神奈川県藤沢市鵠沼花沢町2丁目1 第一興産25号館5FA	\N	藤沢	3	\N	13:00 〜 05:00	\N	\N	2024-12-04 20:24:42.624704	2024-12-06 23:14:44.128759	35.3377308	139.4849495	\N
695	Shisha cafe&bar mr.chill	神奈川県藤沢市片瀬海岸１丁目１２−１７ 江の島ビュータワー 5F	\N	藤沢	4	\N	\N	\N	\N	2024-12-04 20:24:43.951026	2024-12-06 23:14:44.130811	35.307639	139.4848626	\N
696	ChelseA1oo8/Machida Shisha Shop	神奈川県相模原市南区上鶴間本町3-10-8 サンレイ産業ビル 3-A	\N	相模原	2	\N	16:00 〜 03:00	\N	\N	2024-12-04 20:24:45.339779	2024-12-06 23:14:44.132765	35.5411197	139.4440968	\N
697	HOOKAH‐SUKHA ふーかすっか	神奈川県小田原市栄町1丁目2−25 茂原ビル ２Ｆ	\N	小田原	\N	\N	14:00 〜 00:00	\N	\N	2024-12-04 20:24:46.583655	2024-12-06 23:14:44.13504	35.2547727	139.1573228	\N
698	BAR Bull−ma	神奈川県川崎市高津区溝口2丁目13−8 マルテイビル 3階	\N	川崎	\N	\N	20:00 〜 05:00	\N	\N	2024-12-04 20:24:47.32936	2024-12-06 23:14:44.137223	35.60125980000001	139.6121487	\N
699	みなとみらいシーシャ Anchor Knot	神奈川県横浜市中区太田町2丁目30 みどりビル 2Ｆ	\N	横浜	2500	\N	13:00 〜 00:00	\N	\N	2024-12-04 20:24:48.14877	2024-12-06 23:14:44.139421	35.44678469999999	139.638823	\N
700	シーシャバーStart	神奈川県秦野市南矢名1-14-31 武井荘 B棟1F	\N	秦野	3000	\N	20:00 〜 05:00	\N	\N	2024-12-04 20:24:49.48004	2024-12-06 23:14:44.141524	35.3668863	139.265189	\N
702	シーシャバーAPPLECHILL平塚	神奈川県平塚市明石町27-2相湘明石町ビル2階	\N	平塚	2000	\N	18:00 〜 06:00	\N	\N	2024-12-04 20:24:51.1217	2024-12-06 23:14:44.146275	35.3312352	139.345827	\N
703	モクモス関内店	神奈川県横浜市中区末広町3丁目75	\N	横浜	2900	\N	16:00 〜 00:00	\N	\N	2024-12-04 20:24:52.03922	2024-12-06 23:14:44.148517	35.443756	139.6323546	\N
704	Shisha Bar Fill	神奈川県大和市南林間1-9-1サンフォレスタ105	\N	大和	\N	\N	17:00 〜 05:00	\N	\N	2024-12-04 20:24:52.834913	2024-12-06 23:14:44.150605	35.4948974	139.4465289	\N
705	SLOWN. シーシャバー 本厚木店	神奈川県厚木市中町3-1-24吉村ビル3Ｆ	\N	厚木	\N	\N	17:00 〜 00:00	\N	\N	2024-12-04 20:24:53.679253	2024-12-06 23:14:44.152753	35.4393637	139.362972	\N
706	【CHILL TIME】-藤沢シーシャラウンジ-	神奈川県藤沢市鵠沼石上１丁目４−３ 藤沢23ビル2階Ｆ号室	\N	藤沢	\N	\N	\N	\N	\N	2024-12-04 20:24:54.49585	2024-12-06 23:14:44.155098	35.3365774	139.4884995	\N
707	Chill Poker　川崎 シーシャ×ポーカーバー	神奈川県川崎市川崎区東田町4−１９ Ｗｉｌｌ東田 2F	\N	川崎	\N	\N	18:00 〜 01:00	\N	\N	2024-12-04 20:24:55.626543	2024-12-06 23:14:44.161562	35.5289042	139.70255	\N
708	Shisha & Bar OCEAN 本厚木	神奈川県厚木市中町２丁目１２−１ 厚木一番街ビル 3階	\N	厚木	\N	\N	17:00 〜 05:00	\N	\N	2024-12-04 20:24:56.840243	2024-12-06 23:14:44.164281	35.4423574	139.3650174	\N
709	シーシャCafe&BAR Khaja	神奈川県横浜市中区宮川町3丁目81 第一石川ビル １F	\N	横浜	\N	\N	12:00 〜 02:00	\N	\N	2024-12-04 20:24:57.625928	2024-12-06 23:14:44.166746	35.446451	139.627567	\N
710	SLASH shonan	神奈川県茅ヶ崎市幸町 24-19　2階	\N	茅ヶ崎	\N	\N	19:00 〜 03:00	\N	\N	2024-12-04 20:24:59.051296	2024-12-06 23:14:44.169126	35.3283016	139.4064396	\N
711	ひふみ	神奈川県藤沢市南藤沢２３−１０ 六光会館 3F 右奥	\N	藤沢	\N	\N	14:00 〜 00:00	\N	\N	2024-12-04 20:25:00.214338	2024-12-06 23:14:44.171239	35.3377988	139.4862625	\N
712	P2	神奈川県横浜市中区花咲町1−２２ロダンビル B1	\N	横浜	\N	\N	19:00 〜 05:00	\N	\N	2024-12-04 20:25:01.012742	2024-12-06 23:14:44.173678	35.4489304	139.630916	\N
713	Shisha BAR EN	神奈川県横浜市中区相生町2-32-3 フジビル4F	\N	横浜	\N	\N	20:00 〜 05:00	\N	\N	2024-12-04 20:25:01.76807	2024-12-06 23:14:44.176075	35.446719	139.638353	\N
714	SHISHA&ASOBI BAR BULL-MA 登戸	神奈川県川崎市多摩区登戸２５６８登戸ゴールデン街ビル9F⁡	\N	川崎	\N	\N	20:00 〜 05:00	\N	\N	2024-12-04 20:25:02.57371	2024-12-06 23:14:44.178426	35.620346	139.5683135	\N
715	muse横浜西口店	神奈川県横浜市西区南幸2-4-1石阪ビル　1F	\N	横浜	\N	\N	13:00 〜 05:00	\N	\N	2024-12-04 20:25:03.817537	2024-12-06 23:14:44.180793	35.4628137	139.6177655	\N
716	アルアイン	神奈川県横浜市中区弥生町2-17　地下1B	\N	横浜	\N	\N	\N	\N	\N	2024-12-04 20:25:04.562536	2024-12-06 23:14:44.183095	35.4404217	139.630107	\N
717	Club Milano Yokohama Nightclub(シーシャ カフェ& バー横浜)	神奈川県横浜市中区福富町３６	\N	横浜	\N	\N	\N	\N	\N	2024-12-04 20:25:05.48076	2024-12-06 23:14:44.185393	35.4453597	139.630864	\N
718	関内 Girl's Bar FlashBack （ガールズバー フラッシュバック）	神奈川県横浜市中区吉田町３−１１ 吉田町ビル 102 サウンド	\N	横浜	\N	\N	\N	\N	\N	2024-12-04 20:25:06.925601	2024-12-06 23:14:44.187857	35.445934	139.6325175	\N
719	BAR HELL	神奈川県横浜市中区伊勢佐木町2−１０−４ 第三泰信ビル 507	\N	横浜	\N	\N	\N	\N	\N	2024-12-04 20:25:08.220177	2024-12-06 23:14:44.190339	35.4437539	139.6312342	\N
720	T-more	神奈川県横浜市鶴見区生麦３丁目２−２６ いい友ビル 2F	\N	横浜	\N	\N	\N	\N	\N	2024-12-04 20:25:09.245505	2024-12-06 23:14:44.192663	35.4948739	139.6671223	\N
721	ヴァルハラ バーアンドフーカ ラウンジ	神奈川県横須賀市本町1-5 コスモスビル	\N	横須賀	\N	\N	\N	\N	\N	2024-12-04 20:25:10.127084	2024-12-06 23:14:44.195273	35.2817244	139.6668464	\N
753	チルイン横浜みなみ西口駅前店	横浜市西区南幸1-13-15 第1ニューヨコハマビル2階	\N	横浜	\N	\N	12:00〜5:00	045-577-0438	https://shisha-chillin.com/	2024-12-06 23:14:44.897404	2024-12-06 23:14:44.897404	35.4651864	139.6191503	\N
754	チルイン横浜みなみ西口/相鉄ムービル前店	神奈川県横浜市西区南幸2-7-3 小安ビル5階	\N	横浜	\N	\N	12:00〜5:00	045-620-5695	https://shisha-chillin.com/	2024-12-06 23:14:45.643257	2024-12-06 23:14:45.643257	35.4639801	139.6186135	\N
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, confirmation_token, confirmed_at, confirmation_sent_at, name, nickname, avatar, created_at, updated_at, provider, uid, image, oauth_token, oauth_expires_at, unconfirmed_email, role) FROM stdin;
1	test@test.com	$2a$12$/qw3NBQ.3X6iGmuWdZxGcewPtHl3qEAKh1aKFc3CuCA8csjnLHCk.	\N	\N	\N	\N	\N	\N	テスト管理者	テスト管理者	\N	2024-11-22 21:45:45.685469	2024-11-27 20:48:26.35249	\N	\N	\N	\N	\N	\N	1
2	testtest@testtest.com	$2a$12$Jcz7R010.0fhMtrar94vIe8qRqEYrjfQuUD6tukBzHbqlHmMwE4XO	\N	\N	\N	\N	\N	\N	テスト管理者サブ	\N	\N	2024-11-29 22:37:43.601473	2024-11-29 22:37:44.049988	\N	\N	\N	\N	\N	\N	1
\.


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.active_storage_attachments_id_seq', 20, true);


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.active_storage_blobs_id_seq', 20, true);


--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.active_storage_variant_records_id_seq', 14, true);


--
-- Name: favorites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.favorites_id_seq', 3, true);


--
-- Name: reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_id_seq', 2, true);


--
-- Name: shops_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shops_id_seq', 754, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 2, true);


--
-- Name: active_storage_attachments active_storage_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_blobs active_storage_blobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);


--
-- Name: active_storage_variant_records active_storage_variant_records_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT active_storage_variant_records_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: favorites favorites_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT favorites_pkey PRIMARY KEY (id);


--
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: shops shops_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shops
    ADD CONSTRAINT shops_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_active_storage_attachments_on_blob_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_active_storage_attachments_on_blob_id ON public.active_storage_attachments USING btree (blob_id);


--
-- Name: index_active_storage_attachments_uniqueness; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON public.active_storage_attachments USING btree (record_type, record_id, name, blob_id);


--
-- Name: index_active_storage_blobs_on_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON public.active_storage_blobs USING btree (key);


--
-- Name: index_active_storage_variant_records_uniqueness; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_active_storage_variant_records_uniqueness ON public.active_storage_variant_records USING btree (blob_id, variation_digest);


--
-- Name: index_favorites_on_shop_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_favorites_on_shop_id ON public.favorites USING btree (shop_id);


--
-- Name: index_favorites_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_favorites_on_user_id ON public.favorites USING btree (user_id);


--
-- Name: index_favorites_on_user_id_and_shop_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_favorites_on_user_id_and_shop_id ON public.favorites USING btree (user_id, shop_id);


--
-- Name: index_reviews_on_shop_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_reviews_on_shop_id ON public.reviews USING btree (shop_id);


--
-- Name: index_reviews_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_reviews_on_user_id ON public.reviews USING btree (user_id);


--
-- Name: index_shops_on_title; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_shops_on_title ON public.shops USING btree (title);


--
-- Name: index_users_on_confirmation_token; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_users_on_confirmation_token ON public.users USING btree (confirmation_token);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_provider_and_uid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_users_on_provider_and_uid ON public.users USING btree (provider, uid);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: favorites fk_rails_62766c3ef1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT fk_rails_62766c3ef1 FOREIGN KEY (shop_id) REFERENCES public.shops(id);


--
-- Name: reviews fk_rails_74a66bd6c5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT fk_rails_74a66bd6c5 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: active_storage_variant_records fk_rails_993965df05; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT fk_rails_993965df05 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: active_storage_attachments fk_rails_c3b3935057; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT fk_rails_c3b3935057 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: favorites fk_rails_d15744e438; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT fk_rails_d15744e438 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: reviews fk_rails_f7fb031385; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT fk_rails_f7fb031385 FOREIGN KEY (shop_id) REFERENCES public.shops(id);


--
-- PostgreSQL database dump complete
--


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
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: commits; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.commits (
    id bigint NOT NULL,
    sha character varying NOT NULL,
    user_id integer NOT NULL,
    repository_id integer NOT NULL,
    ref_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL
);


--
-- Name: commits_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.commits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: commits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.commits_id_seq OWNED BY public.commits.id;


--
-- Name: oauth_access_tokens; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.oauth_access_tokens (
    id bigint NOT NULL,
    resource_owner_id integer NOT NULL,
    application_id integer NOT NULL,
    token character varying,
    refresh_token character varying,
    expires_in integer,
    created_at timestamp without time zone,
    revoked_at timestamp without time zone
);


--
-- Name: oauth_access_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.oauth_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: oauth_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.oauth_access_tokens_id_seq OWNED BY public.oauth_access_tokens.id;


--
-- Name: oauth_applications; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.oauth_applications (
    id bigint NOT NULL,
    name character varying NOT NULL,
    uuid character varying NOT NULL,
    secret character varying NOT NULL,
    redirect_uri character varying NOT NULL,
    owner_id integer
);


--
-- Name: oauth_applications_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.oauth_applications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: oauth_applications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.oauth_applications_id_seq OWNED BY public.oauth_applications.id;


--
-- Name: pull_requests; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pull_requests (
    id bigint NOT NULL,
    base_id integer NOT NULL,
    head_id integer NOT NULL,
    repository_id integer NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp without time zone,
    number integer
);


--
-- Name: pull_requests_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.pull_requests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pull_requests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.pull_requests_id_seq OWNED BY public.pull_requests.id;


--
-- Name: refs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.refs (
    id bigint NOT NULL,
    name character varying NOT NULL,
    type integer NOT NULL,
    repository_id integer NOT NULL
);


--
-- Name: refs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.refs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: refs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.refs_id_seq OWNED BY public.refs.id;


--
-- Name: repositories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.repositories (
    id bigint NOT NULL,
    name character varying NOT NULL,
    url character varying NOT NULL,
    server_provider_id integer NOT NULL
);


--
-- Name: repositories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.repositories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: repositories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.repositories_id_seq OWNED BY public.repositories.id;


--
-- Name: repository_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.repository_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    repository_id integer NOT NULL,
    permission integer NOT NULL
);


--
-- Name: repository_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.repository_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: repository_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.repository_permissions_id_seq OWNED BY public.repository_permissions.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: server_provider_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.server_provider_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    server_provider_id integer NOT NULL,
    permission integer NOT NULL
);


--
-- Name: server_provider_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.server_provider_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: server_provider_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.server_provider_permissions_id_seq OWNED BY public.server_provider_permissions.id;


--
-- Name: server_provider_user_settings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.server_provider_user_settings (
    id bigint NOT NULL,
    username character varying NOT NULL,
    value character varying NOT NULL,
    server_provider_user_id integer NOT NULL,
    is_syncing boolean
);


--
-- Name: server_provider_user_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.server_provider_user_settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: server_provider_user_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.server_provider_user_settings_id_seq OWNED BY public.server_provider_user_settings.id;


--
-- Name: server_providers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.server_providers (
    id bigint NOT NULL,
    name character varying NOT NULL,
    url character varying NOT NULL,
    type character varying NOT NULL,
    listener_token character varying
);


--
-- Name: server_providers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.server_providers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: server_providers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.server_providers_id_seq OWNED BY public.server_providers.id;


--
-- Name: settings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.settings (
    id bigint NOT NULL,
    var character varying NOT NULL,
    value text,
    target_type character varying NOT NULL,
    target_id bigint NOT NULL,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone
);


--
-- Name: settings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.settings_id_seq OWNED BY public.settings.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying,
    email character varying NOT NULL,
    encrypted_password character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    encrypted_otp_secret character varying,
    encrypted_otp_secret_iv character varying,
    encrypted_otp_secret_salt character varying,
    consumed_timestep integer,
    otp_required_for_login boolean,
    otp_backup_codes character varying[],
    jti character varying,
    confirmation_token character varying,
    confirmation_sent_at timestamp without time zone,
    confirmed_at timestamp without time zone,
    unconfirmed_email character varying,
    type character varying DEFAULT ''::character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    active boolean DEFAULT true
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: commits id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.commits ALTER COLUMN id SET DEFAULT nextval('public.commits_id_seq'::regclass);


--
-- Name: oauth_access_tokens id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oauth_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.oauth_access_tokens_id_seq'::regclass);


--
-- Name: oauth_applications id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oauth_applications ALTER COLUMN id SET DEFAULT nextval('public.oauth_applications_id_seq'::regclass);


--
-- Name: pull_requests id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pull_requests ALTER COLUMN id SET DEFAULT nextval('public.pull_requests_id_seq'::regclass);


--
-- Name: refs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.refs ALTER COLUMN id SET DEFAULT nextval('public.refs_id_seq'::regclass);


--
-- Name: repositories id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.repositories ALTER COLUMN id SET DEFAULT nextval('public.repositories_id_seq'::regclass);


--
-- Name: repository_permissions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.repository_permissions ALTER COLUMN id SET DEFAULT nextval('public.repository_permissions_id_seq'::regclass);


--
-- Name: server_provider_permissions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_provider_permissions ALTER COLUMN id SET DEFAULT nextval('public.server_provider_permissions_id_seq'::regclass);


--
-- Name: server_provider_user_settings id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_provider_user_settings ALTER COLUMN id SET DEFAULT nextval('public.server_provider_user_settings_id_seq'::regclass);


--
-- Name: server_providers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_providers ALTER COLUMN id SET DEFAULT nextval('public.server_providers_id_seq'::regclass);


--
-- Name: settings id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.settings ALTER COLUMN id SET DEFAULT nextval('public.settings_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: commits commits_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.commits
    ADD CONSTRAINT commits_pkey PRIMARY KEY (id);


--
-- Name: oauth_access_tokens oauth_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oauth_access_tokens
    ADD CONSTRAINT oauth_access_tokens_pkey PRIMARY KEY (id);


--
-- Name: oauth_applications oauth_applications_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oauth_applications
    ADD CONSTRAINT oauth_applications_pkey PRIMARY KEY (id);


--
-- Name: pull_requests pull_requests_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pull_requests
    ADD CONSTRAINT pull_requests_pkey PRIMARY KEY (id);


--
-- Name: refs refs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.refs
    ADD CONSTRAINT refs_pkey PRIMARY KEY (id);


--
-- Name: repositories repositories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.repositories
    ADD CONSTRAINT repositories_pkey PRIMARY KEY (id);


--
-- Name: repository_permissions repository_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.repository_permissions
    ADD CONSTRAINT repository_permissions_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: server_provider_permissions server_provider_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_provider_permissions
    ADD CONSTRAINT server_provider_permissions_pkey PRIMARY KEY (id);


--
-- Name: server_provider_user_settings server_provider_user_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_provider_user_settings
    ADD CONSTRAINT server_provider_user_settings_pkey PRIMARY KEY (id);


--
-- Name: server_providers server_providers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_providers
    ADD CONSTRAINT server_providers_pkey PRIMARY KEY (id);


--
-- Name: settings settings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.settings
    ADD CONSTRAINT settings_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_commits_on_ref_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_commits_on_ref_id ON public.commits USING btree (ref_id);


--
-- Name: index_commits_on_repository_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_commits_on_repository_id ON public.commits USING btree (repository_id);


--
-- Name: index_commits_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_commits_on_user_id ON public.commits USING btree (user_id);


--
-- Name: index_pull_requests_on_repository_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_pull_requests_on_repository_id ON public.pull_requests USING btree (repository_id);


--
-- Name: index_pull_requests_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_pull_requests_on_user_id ON public.pull_requests USING btree (user_id);


--
-- Name: index_refs_on_repository_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_refs_on_repository_id ON public.refs USING btree (repository_id);


--
-- Name: index_repositories_on_server_provider_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_repositories_on_server_provider_id ON public.repositories USING btree (server_provider_id);


--
-- Name: index_repository_permissions_on_repository_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_repository_permissions_on_repository_id ON public.repository_permissions USING btree (repository_id);


--
-- Name: index_repository_permissions_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_repository_permissions_on_user_id ON public.repository_permissions USING btree (user_id);


--
-- Name: index_server_provider_permissions_on_server_provider_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_server_provider_permissions_on_server_provider_id ON public.server_provider_permissions USING btree (server_provider_id);


--
-- Name: index_server_provider_permissions_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_server_provider_permissions_on_user_id ON public.server_provider_permissions USING btree (user_id);


--
-- Name: index_server_provider_user_settings_on_server_provider_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_server_provider_user_settings_on_server_provider_user_id ON public.server_provider_user_settings USING btree (server_provider_user_id);


--
-- Name: index_settings_on_target; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_settings_on_target ON public.settings USING btree (target_type, target_id);


--
-- Name: index_settings_on_target_type_and_target_id_and_var; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_settings_on_target_type_and_target_id_and_var ON public.settings USING btree (target_type, target_id, var);


--
-- Name: index_users_on_confirmation_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_confirmation_token ON public.users USING btree (confirmation_token);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_jti; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_jti ON public.users USING btree (jti);


--
-- Name: pull_requests fk_rails_01ee288f83; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pull_requests
    ADD CONSTRAINT fk_rails_01ee288f83 FOREIGN KEY (base_id) REFERENCES public.commits(id);


--
-- Name: repository_permissions fk_rails_08873ba26b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.repository_permissions
    ADD CONSTRAINT fk_rails_08873ba26b FOREIGN KEY (repository_id) REFERENCES public.repositories(id);


--
-- Name: pull_requests fk_rails_0a83f07e14; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pull_requests
    ADD CONSTRAINT fk_rails_0a83f07e14 FOREIGN KEY (head_id) REFERENCES public.commits(id);


--
-- Name: commits fk_rails_409a66d7e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.commits
    ADD CONSTRAINT fk_rails_409a66d7e3 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: server_provider_user_settings fk_rails_5217d62666; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_provider_user_settings
    ADD CONSTRAINT fk_rails_5217d62666 FOREIGN KEY (server_provider_user_id) REFERENCES public.server_provider_permissions(id);


--
-- Name: server_provider_permissions fk_rails_68ed2dab2a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_provider_permissions
    ADD CONSTRAINT fk_rails_68ed2dab2a FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: oauth_access_tokens fk_rails_732cb83ab7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oauth_access_tokens
    ADD CONSTRAINT fk_rails_732cb83ab7 FOREIGN KEY (application_id) REFERENCES public.oauth_applications(id);


--
-- Name: server_provider_permissions fk_rails_8c5308714c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_provider_permissions
    ADD CONSTRAINT fk_rails_8c5308714c FOREIGN KEY (server_provider_id) REFERENCES public.server_providers(id);


--
-- Name: pull_requests fk_rails_8fa503b550; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pull_requests
    ADD CONSTRAINT fk_rails_8fa503b550 FOREIGN KEY (repository_id) REFERENCES public.repositories(id);


--
-- Name: repositories fk_rails_96f1d80c03; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.repositories
    ADD CONSTRAINT fk_rails_96f1d80c03 FOREIGN KEY (server_provider_id) REFERENCES public.server_providers(id);


--
-- Name: refs fk_rails_a49ead610f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.refs
    ADD CONSTRAINT fk_rails_a49ead610f FOREIGN KEY (repository_id) REFERENCES public.repositories(id);


--
-- Name: commits fk_rails_a8299bc69b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.commits
    ADD CONSTRAINT fk_rails_a8299bc69b FOREIGN KEY (repository_id) REFERENCES public.repositories(id);


--
-- Name: commits fk_rails_c8b4639bab; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.commits
    ADD CONSTRAINT fk_rails_c8b4639bab FOREIGN KEY (ref_id) REFERENCES public.refs(id);


--
-- Name: oauth_applications fk_rails_cc886e315a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oauth_applications
    ADD CONSTRAINT fk_rails_cc886e315a FOREIGN KEY (owner_id) REFERENCES public.users(id);


--
-- Name: pull_requests fk_rails_ec4b5086e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pull_requests
    ADD CONSTRAINT fk_rails_ec4b5086e1 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: oauth_access_tokens fk_rails_ee63f25419; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oauth_access_tokens
    ADD CONSTRAINT fk_rails_ee63f25419 FOREIGN KEY (resource_owner_id) REFERENCES public.users(id);


--
-- Name: repository_permissions fk_rails_eea1a8b014; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.repository_permissions
    ADD CONSTRAINT fk_rails_eea1a8b014 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20210615080949'),
('20210615082040'),
('20210615082128'),
('20210615082136'),
('20210615082153'),
('20210615082201'),
('20210615082204'),
('20210615082222'),
('20210615082227'),
('20210615082244'),
('20210615082254'),
('20210615082353');



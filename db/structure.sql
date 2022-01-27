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
-- Name: audits; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.audits (
    id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    owner_id integer NOT NULL,
    owner_type character varying NOT NULL,
    updates character varying NOT NULL
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
    message character varying,
    committed_at timestamp without time zone NOT NULL,
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
-- Name: oauth_access_grants; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.oauth_access_grants (
    id bigint NOT NULL,
    resource_owner_id bigint NOT NULL,
    application_id bigint NOT NULL,
    token character varying NOT NULL,
    expires_in integer NOT NULL,
    redirect_uri text NOT NULL,
    created_at timestamp without time zone NOT NULL,
    revoked_at timestamp without time zone,
    scopes character varying DEFAULT ''::character varying NOT NULL
);


--
-- Name: oauth_access_grants_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.oauth_access_grants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: oauth_access_grants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.oauth_access_grants_id_seq OWNED BY public.oauth_access_grants.id;


--
-- Name: oauth_access_tokens; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.oauth_access_tokens (
    id bigint NOT NULL,
    resource_owner_id bigint,
    application_id bigint NOT NULL,
    token character varying NOT NULL,
    refresh_token character varying,
    expires_in integer,
    revoked_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    scopes character varying,
    previous_refresh_token character varying DEFAULT ''::character varying NOT NULL
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
    uid character varying NOT NULL,
    secret character varying NOT NULL,
    redirect_uri text NOT NULL,
    scopes character varying DEFAULT ''::character varying NOT NULL,
    confidential boolean DEFAULT true NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: audits_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.audits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: audits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.audits_id_seq OWNED BY public.audits.id;


--
-- Name: audits id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.audits ALTER COLUMN id SET DEFAULT nextval('public.audits_id_seq'::regclass);

--
-- Name: audits audits_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.audits
    ADD CONSTRAINT audits_pkey PRIMARY KEY (id);



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
-- Name: organization_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.organization_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    organization_id integer NOT NULL,
    permission integer NOT NULL
);


--
-- Name: organization_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.organization_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: organization_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.organization_permissions_id_seq OWNED BY public.organization_permissions.id;


CREATE TABLE public.organization_invitations (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    organization_id integer NOT NULL,
    permission integer NOT NULL,
    token character varying NOT NULL,
    created_at timestamp without time zone,
);


--
-- Name: organization_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.organization_invitations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: organization_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.organization_invitations_id_seq OWNED BY public.organization_invitations.id;


--
-- Name: organizations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.organizations (
    id bigint NOT NULL,
    name character varying NOT NULL,
    description character varying,
    listener_token character varying NOT NULL
);


--
-- Name: organizations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.organizations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: organizations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.organizations_id_seq OWNED BY public.organizations.id;


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
    display_name character varying NOT NULL,
    created_by integer NOT NULL,
    url character varying NOT NULL,
    owner_id integer NOT NULL,
    owner_type character varying NOT NULL,
    server_type character varying NOT NULL,
    last_synced_at timestamp without time zone
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
-- Name: repository_user_settings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.repository_user_settings (
    id bigint NOT NULL,
    username character varying NOT NULL,
    value character varying NOT NULL,
    repository_permission_id integer NOT NULL,
    is_syncing boolean
);


--
-- Name: repository_user_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.repository_user_settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: repository_user_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.repository_user_settings_id_seq OWNED BY public.repository_user_settings.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


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
-- Name: webhooks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.webhooks (
    id bigint NOT NULL,
    repository_id bigint,
    name character varying,
    url character varying,
    active boolean,
    insecure_ssl boolean,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: webhooks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.webhooks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: webhooks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.webhooks_id_seq OWNED BY public.webhooks.id;


--
-- Name: commits id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.commits ALTER COLUMN id SET DEFAULT nextval('public.commits_id_seq'::regclass);


--
-- Name: oauth_access_grants id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oauth_access_grants ALTER COLUMN id SET DEFAULT nextval('public.oauth_access_grants_id_seq'::regclass);


--
-- Name: oauth_access_tokens id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oauth_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.oauth_access_tokens_id_seq'::regclass);


--
-- Name: oauth_applications id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oauth_applications ALTER COLUMN id SET DEFAULT nextval('public.oauth_applications_id_seq'::regclass);


--
-- Name: organization_permissions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization_permissions ALTER COLUMN id SET DEFAULT nextval('public.organization_permissions_id_seq'::regclass);


ALTER TABLE ONLY public.organization_invitations ALTER COLUMN id SET DEFAULT nextval('public.organization_invitations_id_seq'::regclass);

--
-- Name: organizations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organizations ALTER COLUMN id SET DEFAULT nextval('public.organizations_id_seq'::regclass);


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
-- Name: repository_user_settings id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.repository_user_settings ALTER COLUMN id SET DEFAULT nextval('public.repository_user_settings_id_seq'::regclass);


--
-- Name: settings id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.settings ALTER COLUMN id SET DEFAULT nextval('public.settings_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: webhooks id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.webhooks ALTER COLUMN id SET DEFAULT nextval('public.webhooks_id_seq'::regclass);


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
-- Name: oauth_access_grants oauth_access_grants_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oauth_access_grants
    ADD CONSTRAINT oauth_access_grants_pkey PRIMARY KEY (id);


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
-- Name: organization_permissions organization_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization_permissions
    ADD CONSTRAINT organization_permissions_pkey PRIMARY KEY (id);


-- Name: organization_invitations organization_invitations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization_invitations
    ADD CONSTRAINT organization_invitations_pkey PRIMARY KEY (id);


--
-- Name: organizations organizations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organizations
    ADD CONSTRAINT organizations_pkey PRIMARY KEY (id);


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
-- Name: repository_user_settings repository_user_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.repository_user_settings
    ADD CONSTRAINT repository_user_settings_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


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
-- Name: webhooks webhooks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.webhooks
    ADD CONSTRAINT webhooks_pkey PRIMARY KEY (id);


--
-- Name: index_commits_on_ref_id_and_sha; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_commits_on_ref_id_and_sha ON public.commits USING btree (ref_id, sha);


--
-- Name: index_commits_on_repository_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_commits_on_repository_id ON public.commits USING btree (repository_id);


--
-- Name: index_commits_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_commits_on_user_id ON public.commits USING btree (user_id);


--
-- Name: index_oauth_access_grants_on_application_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_oauth_access_grants_on_application_id ON public.oauth_access_grants USING btree (application_id);


--
-- Name: index_oauth_access_grants_on_resource_owner_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_oauth_access_grants_on_resource_owner_id ON public.oauth_access_grants USING btree (resource_owner_id);


--
-- Name: index_oauth_access_grants_on_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_oauth_access_grants_on_token ON public.oauth_access_grants USING btree (token);


--
-- Name: index_oauth_access_tokens_on_application_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_oauth_access_tokens_on_application_id ON public.oauth_access_tokens USING btree (application_id);


--
-- Name: index_oauth_access_tokens_on_refresh_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_oauth_access_tokens_on_refresh_token ON public.oauth_access_tokens USING btree (refresh_token);


--
-- Name: index_oauth_access_tokens_on_resource_owner_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_oauth_access_tokens_on_resource_owner_id ON public.oauth_access_tokens USING btree (resource_owner_id);


--
-- Name: index_oauth_access_tokens_on_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_oauth_access_tokens_on_token ON public.oauth_access_tokens USING btree (token);


--
-- Name: index_oauth_applications_on_uid; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_oauth_applications_on_uid ON public.oauth_applications USING btree (uid);


--
-- Name: index_organization_permissions_on_organization_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_organization_permissions_on_organization_id ON public.organization_permissions USING btree (organization_id);


--
-- Name: index_organization_permissions_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_organization_permissions_on_user_id ON public.organization_permissions USING btree (user_id);



--
-- Name: index_organization_invitations_on_token; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_organization_invitations_on_token_id ON public.organization_invitations USING btree (token);

--
-- Name: index_organizations_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_organizations_on_name ON public.organizations USING btree (name);


--
-- Name: index_pull_requests_on_repository_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_pull_requests_on_repository_id ON public.pull_requests USING btree (repository_id);


--
-- Name: index_pull_requests_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_pull_requests_on_user_id ON public.pull_requests USING btree (user_id);


--
-- Name: index_refs_on_repository_id_and_type_and_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_refs_on_repository_id_and_type_and_name ON public.refs USING btree (repository_id, type, name);


--
-- Name: index_repositories_on_owner_id_and_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_repositories_on_owner_id_and_name ON public.repositories USING btree (owner_id, name);


--
-- Name: index_repository_permissions_on_repository_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_repository_permissions_on_repository_id ON public.repository_permissions USING btree (repository_id);


--
-- Name: index_repository_permissions_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_repository_permissions_on_user_id ON public.repository_permissions USING btree (user_id);


--
-- Name: index_repository_user_settings_on_repository_permission_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_repository_user_settings_on_repository_permission_id ON public.repository_user_settings USING btree (repository_permission_id);


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
-- Name: index_webhooks_on_repository_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_webhooks_on_repository_id ON public.webhooks USING btree (repository_id);


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
-- Name: organization_permissions fk_rails_0d3a3da658; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization_permissions
    ADD CONSTRAINT fk_rails_0d3a3da658 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: oauth_access_grants fk_rails_330c32d8d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oauth_access_grants
    ADD CONSTRAINT fk_rails_330c32d8d9 FOREIGN KEY (resource_owner_id) REFERENCES public.users(id);


--
-- Name: commits fk_rails_409a66d7e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.commits
    ADD CONSTRAINT fk_rails_409a66d7e3 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: oauth_access_tokens fk_rails_732cb83ab7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oauth_access_tokens
    ADD CONSTRAINT fk_rails_732cb83ab7 FOREIGN KEY (application_id) REFERENCES public.oauth_applications(id);


--
-- Name: pull_requests fk_rails_8fa503b550; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pull_requests
    ADD CONSTRAINT fk_rails_8fa503b550 FOREIGN KEY (repository_id) REFERENCES public.repositories(id);


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
-- Name: repository_user_settings fk_rails_aa9d93173c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.repository_user_settings
    ADD CONSTRAINT fk_rails_aa9d93173c FOREIGN KEY (repository_permission_id) REFERENCES public.repository_permissions(id);


--
-- Name: oauth_access_grants fk_rails_b4b53e07b8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oauth_access_grants
    ADD CONSTRAINT fk_rails_b4b53e07b8 FOREIGN KEY (application_id) REFERENCES public.oauth_applications(id);


--
-- Name: organization_permissions fk_rails_b5b0abe7a7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization_permissions
    ADD CONSTRAINT fk_rails_b5b0abe7a7 FOREIGN KEY (organization_id) REFERENCES public.organizations(id);


--
-- Name: commits fk_rails_c8b4639bab; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.commits
    ADD CONSTRAINT fk_rails_c8b4639bab FOREIGN KEY (ref_id) REFERENCES public.refs(id);


--
-- Name: webhooks fk_rails_d5fe0af453; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.webhooks
    ADD CONSTRAINT fk_rails_d5fe0af453 FOREIGN KEY (repository_id) REFERENCES public.repositories(id);


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
('20210615082244'),
('20210615082254'),
('20210615082353'),
('20210816151517'),
('20210818115729');



PGDMP     ;                    w            defesa_civil #   10.8 (Ubuntu 10.8-0ubuntu0.18.04.1) #   10.8 (Ubuntu 10.8-0ubuntu0.18.04.1) c    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            �           1262    16724    defesa_civil    DATABASE     ~   CREATE DATABASE defesa_civil WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';
    DROP DATABASE defesa_civil;
             df_user    false                        2615    17722    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false                        3079    13041    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            �           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    17726    chamado    TABLE     �  CREATE TABLE public.chamado (
    id_chamado integer NOT NULL,
    data_hora timestamp without time zone NOT NULL,
    origem character varying(255) NOT NULL,
    descricao character varying(100) NOT NULL,
    endereco_principal character(10) NOT NULL,
    chamado_logradouro_id integer,
    latitude real,
    longitude real,
    pessoa_id integer NOT NULL,
    usado boolean DEFAULT false NOT NULL
);
    DROP TABLE public.chamado;
       public         postgres    false    6            �            1259    17724    chamado_id_chamado_seq    SEQUENCE     �   CREATE SEQUENCE public.chamado_id_chamado_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.chamado_id_chamado_seq;
       public       postgres    false    197    6            �           0    0    chamado_id_chamado_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.chamado_id_chamado_seq OWNED BY public.chamado.id_chamado;
            public       postgres    false    196            �            1259    17732    cobrade    TABLE     A  CREATE TABLE public.cobrade (
    codigo character(5) NOT NULL,
    categoria character varying(255) NOT NULL,
    grupo character varying(255) NOT NULL,
    subgrupo character varying(255) NOT NULL,
    tipo character varying(255) NOT NULL,
    subtipo character varying(255),
    ativo boolean DEFAULT true NOT NULL
);
    DROP TABLE public.cobrade;
       public         postgres    false    6            �            1259    17743    dados_login    TABLE     �   CREATE TABLE public.dados_login (
    id_usuario integer NOT NULL,
    email character varying(255) NOT NULL,
    senha character(60) NOT NULL,
    ativo boolean DEFAULT true NOT NULL
);
    DROP TABLE public.dados_login;
       public         postgres    false    6            �            1259    17741    dados_login_id_usuario_seq    SEQUENCE     �   CREATE SEQUENCE public.dados_login_id_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.dados_login_id_usuario_seq;
       public       postgres    false    200    6            �           0    0    dados_login_id_usuario_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.dados_login_id_usuario_seq OWNED BY public.dados_login.id_usuario;
            public       postgres    false    199            �            1259    17751    endereco_logradouro    TABLE     /  CREATE TABLE public.endereco_logradouro (
    id_logradouro integer NOT NULL,
    cep character(8),
    cidade character varying(255),
    bairro character varying(255),
    logradouro character varying(255) NOT NULL,
    numero character varying(255) NOT NULL,
    referencia character varying(255)
);
 '   DROP TABLE public.endereco_logradouro;
       public         postgres    false    6            �            1259    17749 %   endereco_logradouro_id_logradouro_seq    SEQUENCE     �   CREATE SEQUENCE public.endereco_logradouro_id_logradouro_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.endereco_logradouro_id_logradouro_seq;
       public       postgres    false    202    6            �           0    0 %   endereco_logradouro_id_logradouro_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.endereco_logradouro_id_logradouro_seq OWNED BY public.endereco_logradouro.id_logradouro;
            public       postgres    false    201            �            1259    17760    log_alteracao_usuario    TABLE       CREATE TABLE public.log_alteracao_usuario (
    id_usuario_modificador integer NOT NULL,
    id_usuario_alterado integer NOT NULL,
    data_hora timestamp without time zone NOT NULL,
    acao character varying(9) NOT NULL,
    id_alteracao integer NOT NULL
);
 )   DROP TABLE public.log_alteracao_usuario;
       public         postgres    false    6            �            1259    18030 &   log_alteracao_usuario_id_alteracao_seq    SEQUENCE     �   CREATE SEQUENCE public.log_alteracao_usuario_id_alteracao_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE public.log_alteracao_usuario_id_alteracao_seq;
       public       postgres    false    6    203            �           0    0 &   log_alteracao_usuario_id_alteracao_seq    SEQUENCE OWNED BY     q   ALTER SEQUENCE public.log_alteracao_usuario_id_alteracao_seq OWNED BY public.log_alteracao_usuario.id_alteracao;
            public       postgres    false    211            �            1259    18041    log_chamado    TABLE     �   CREATE TABLE public.log_chamado (
    id_log_cadastro integer NOT NULL,
    id_usuario integer NOT NULL,
    id_chamado integer NOT NULL,
    data_hora timestamp without time zone NOT NULL,
    acao character(9) NOT NULL
);
    DROP TABLE public.log_chamado;
       public         df_user    false    6            �            1259    18039    log_chamado_id_log_cadastro_seq    SEQUENCE     �   CREATE SEQUENCE public.log_chamado_id_log_cadastro_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.log_chamado_id_log_cadastro_seq;
       public       df_user    false    213    6            �           0    0    log_chamado_id_log_cadastro_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.log_chamado_id_log_cadastro_seq OWNED BY public.log_chamado.id_log_cadastro;
            public       df_user    false    212            �            1259    17765 	   log_login    TABLE     �   CREATE TABLE public.log_login (
    id_usuario integer NOT NULL,
    data_hora timestamp without time zone NOT NULL,
    id_login integer NOT NULL
);
    DROP TABLE public.log_login;
       public         postgres    false    6            �            1259    18011    log_login_id_login_seq    SEQUENCE     �   CREATE SEQUENCE public.log_login_id_login_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.log_login_id_login_seq;
       public       postgres    false    204    6            �           0    0    log_login_id_login_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.log_login_id_login_seq OWNED BY public.log_login.id_login;
            public       postgres    false    210            �            1259    18078 
   log_pessoa    TABLE     �   CREATE TABLE public.log_pessoa (
    id_log integer NOT NULL,
    id_pessoa_cadastrada integer NOT NULL,
    id_usuario_criador integer NOT NULL,
    data_hora timestamp without time zone NOT NULL
);
    DROP TABLE public.log_pessoa;
       public         df_user    false    6            �            1259    18076    log_pessoa_id_log_seq    SEQUENCE     �   CREATE SEQUENCE public.log_pessoa_id_log_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.log_pessoa_id_log_seq;
       public       df_user    false    215    6            �           0    0    log_pessoa_id_log_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.log_pessoa_id_log_seq OWNED BY public.log_pessoa.id_log;
            public       df_user    false    214            �            1259    17772 
   ocorrencia    TABLE       CREATE TABLE public.ocorrencia (
    id_ocorrencia integer NOT NULL,
    chamado_id integer,
    ocorr_endereco_principal character(10) NOT NULL,
    ocorr_coordenada_latitude numeric,
    ocorr_coordenada_longitude numeric,
    ocorr_logradouro_id integer,
    agente_principal integer NOT NULL,
    agente_apoio_1 integer,
    agente_apoio_2 integer,
    data_lancamento date NOT NULL,
    data_ocorrencia date NOT NULL,
    ocorr_descricao character varying(100),
    ocorr_origem character varying(255),
    atendido_1 integer,
    atendido_2 integer,
    ocorr_cobrade character varying(5) NOT NULL,
    cobrade_descricao character varying(255),
    ocorr_fotos boolean NOT NULL,
    fotos bytea,
    ocorr_prioridade character varying(10) NOT NULL,
    ocorr_analisado boolean NOT NULL,
    ocorr_congelado boolean NOT NULL,
    ocorr_encerrado boolean NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    usuario_criador integer NOT NULL,
    data_alteracao timestamp without time zone NOT NULL,
    ocorr_referencia integer
);
    DROP TABLE public.ocorrencia;
       public         postgres    false    6            �            1259    17770    ocorrencia_id_ocorrencia_seq    SEQUENCE     �   CREATE SEQUENCE public.ocorrencia_id_ocorrencia_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.ocorrencia_id_ocorrencia_seq;
       public       postgres    false    206    6            �           0    0    ocorrencia_id_ocorrencia_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.ocorrencia_id_ocorrencia_seq OWNED BY public.ocorrencia.id_ocorrencia;
            public       postgres    false    205            �            1259    17784    pessoa    TABLE     �   CREATE TABLE public.pessoa (
    id_pessoa integer NOT NULL,
    nome character varying(255),
    cpf character(11),
    outros_documentos character varying(20),
    telefone character(11),
    email character varying(255)
);
    DROP TABLE public.pessoa;
       public         postgres    false    6            �            1259    17782    pessoa_id_pessoa_seq    SEQUENCE     �   CREATE SEQUENCE public.pessoa_id_pessoa_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.pessoa_id_pessoa_seq;
       public       postgres    false    208    6            �           0    0    pessoa_id_pessoa_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.pessoa_id_pessoa_seq OWNED BY public.pessoa.id_pessoa;
            public       postgres    false    207            �            1259    17793    usuario    TABLE     �   CREATE TABLE public.usuario (
    id_usuario integer NOT NULL,
    nome character varying(255) NOT NULL,
    cpf character(11) NOT NULL,
    telefone character(11),
    nivel_acesso character(1) NOT NULL,
    foto bytea
);
    DROP TABLE public.usuario;
       public         postgres    false    6                       2604    17729    chamado id_chamado    DEFAULT     x   ALTER TABLE ONLY public.chamado ALTER COLUMN id_chamado SET DEFAULT nextval('public.chamado_id_chamado_seq'::regclass);
 A   ALTER TABLE public.chamado ALTER COLUMN id_chamado DROP DEFAULT;
       public       postgres    false    197    196    197            "           2604    17746    dados_login id_usuario    DEFAULT     �   ALTER TABLE ONLY public.dados_login ALTER COLUMN id_usuario SET DEFAULT nextval('public.dados_login_id_usuario_seq'::regclass);
 E   ALTER TABLE public.dados_login ALTER COLUMN id_usuario DROP DEFAULT;
       public       postgres    false    199    200    200            $           2604    17754 !   endereco_logradouro id_logradouro    DEFAULT     �   ALTER TABLE ONLY public.endereco_logradouro ALTER COLUMN id_logradouro SET DEFAULT nextval('public.endereco_logradouro_id_logradouro_seq'::regclass);
 P   ALTER TABLE public.endereco_logradouro ALTER COLUMN id_logradouro DROP DEFAULT;
       public       postgres    false    202    201    202            %           2604    18032 "   log_alteracao_usuario id_alteracao    DEFAULT     �   ALTER TABLE ONLY public.log_alteracao_usuario ALTER COLUMN id_alteracao SET DEFAULT nextval('public.log_alteracao_usuario_id_alteracao_seq'::regclass);
 Q   ALTER TABLE public.log_alteracao_usuario ALTER COLUMN id_alteracao DROP DEFAULT;
       public       postgres    false    211    203            *           2604    18044    log_chamado id_log_cadastro    DEFAULT     �   ALTER TABLE ONLY public.log_chamado ALTER COLUMN id_log_cadastro SET DEFAULT nextval('public.log_chamado_id_log_cadastro_seq'::regclass);
 J   ALTER TABLE public.log_chamado ALTER COLUMN id_log_cadastro DROP DEFAULT;
       public       df_user    false    212    213    213            &           2604    18013    log_login id_login    DEFAULT     x   ALTER TABLE ONLY public.log_login ALTER COLUMN id_login SET DEFAULT nextval('public.log_login_id_login_seq'::regclass);
 A   ALTER TABLE public.log_login ALTER COLUMN id_login DROP DEFAULT;
       public       postgres    false    210    204            +           2604    18081    log_pessoa id_log    DEFAULT     v   ALTER TABLE ONLY public.log_pessoa ALTER COLUMN id_log SET DEFAULT nextval('public.log_pessoa_id_log_seq'::regclass);
 @   ALTER TABLE public.log_pessoa ALTER COLUMN id_log DROP DEFAULT;
       public       df_user    false    215    214    215            '           2604    17775    ocorrencia id_ocorrencia    DEFAULT     �   ALTER TABLE ONLY public.ocorrencia ALTER COLUMN id_ocorrencia SET DEFAULT nextval('public.ocorrencia_id_ocorrencia_seq'::regclass);
 G   ALTER TABLE public.ocorrencia ALTER COLUMN id_ocorrencia DROP DEFAULT;
       public       postgres    false    205    206    206            )           2604    17787    pessoa id_pessoa    DEFAULT     t   ALTER TABLE ONLY public.pessoa ALTER COLUMN id_pessoa SET DEFAULT nextval('public.pessoa_id_pessoa_seq'::regclass);
 ?   ALTER TABLE public.pessoa ALTER COLUMN id_pessoa DROP DEFAULT;
       public       postgres    false    208    207    208            �           2613    18096    18096    BLOB     &   SELECT pg_catalog.lo_create('18096');
 &   SELECT pg_catalog.lo_unlink('18096');
             postgres    false            �           2613    18097    18097    BLOB     &   SELECT pg_catalog.lo_create('18097');
 &   SELECT pg_catalog.lo_unlink('18097');
             df_user    false            �          0    17726    chamado 
   TABLE DATA               �   COPY public.chamado (id_chamado, data_hora, origem, descricao, endereco_principal, chamado_logradouro_id, latitude, longitude, pessoa_id, usado) FROM stdin;
    public       postgres    false    197   ��       �          0    17732    cobrade 
   TABLE DATA               [   COPY public.cobrade (codigo, categoria, grupo, subgrupo, tipo, subtipo, ativo) FROM stdin;
    public       postgres    false    198   �       �          0    17743    dados_login 
   TABLE DATA               F   COPY public.dados_login (id_usuario, email, senha, ativo) FROM stdin;
    public       postgres    false    200   t�       �          0    17751    endereco_logradouro 
   TABLE DATA               q   COPY public.endereco_logradouro (id_logradouro, cep, cidade, bairro, logradouro, numero, referencia) FROM stdin;
    public       postgres    false    202   �       �          0    17760    log_alteracao_usuario 
   TABLE DATA               {   COPY public.log_alteracao_usuario (id_usuario_modificador, id_usuario_alterado, data_hora, acao, id_alteracao) FROM stdin;
    public       postgres    false    203   ��       �          0    18041    log_chamado 
   TABLE DATA               _   COPY public.log_chamado (id_log_cadastro, id_usuario, id_chamado, data_hora, acao) FROM stdin;
    public       df_user    false    213   ��       �          0    17765 	   log_login 
   TABLE DATA               D   COPY public.log_login (id_usuario, data_hora, id_login) FROM stdin;
    public       postgres    false    204   ݂       �          0    18078 
   log_pessoa 
   TABLE DATA               a   COPY public.log_pessoa (id_log, id_pessoa_cadastrada, id_usuario_criador, data_hora) FROM stdin;
    public       df_user    false    215   [�       �          0    17772 
   ocorrencia 
   TABLE DATA               �  COPY public.ocorrencia (id_ocorrencia, chamado_id, ocorr_endereco_principal, ocorr_coordenada_latitude, ocorr_coordenada_longitude, ocorr_logradouro_id, agente_principal, agente_apoio_1, agente_apoio_2, data_lancamento, data_ocorrencia, ocorr_descricao, ocorr_origem, atendido_1, atendido_2, ocorr_cobrade, cobrade_descricao, ocorr_fotos, fotos, ocorr_prioridade, ocorr_analisado, ocorr_congelado, ocorr_encerrado, ativo, usuario_criador, data_alteracao, ocorr_referencia) FROM stdin;
    public       postgres    false    206   x�       �          0    17784    pessoa 
   TABLE DATA               Z   COPY public.pessoa (id_pessoa, nome, cpf, outros_documentos, telefone, email) FROM stdin;
    public       postgres    false    208   ��       �          0    17793    usuario 
   TABLE DATA               V   COPY public.usuario (id_usuario, nome, cpf, telefone, nivel_acesso, foto) FROM stdin;
    public       postgres    false    209   V�       �           0    0    chamado_id_chamado_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.chamado_id_chamado_seq', 13, true);
            public       postgres    false    196            �           0    0    dados_login_id_usuario_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.dados_login_id_usuario_seq', 18, true);
            public       postgres    false    199            �           0    0 %   endereco_logradouro_id_logradouro_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.endereco_logradouro_id_logradouro_seq', 4, true);
            public       postgres    false    201            �           0    0 &   log_alteracao_usuario_id_alteracao_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.log_alteracao_usuario_id_alteracao_seq', 10, true);
            public       postgres    false    211            �           0    0    log_chamado_id_log_cadastro_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.log_chamado_id_log_cadastro_seq', 1, true);
            public       df_user    false    212            �           0    0    log_login_id_login_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.log_login_id_login_seq', 45, true);
            public       postgres    false    210            �           0    0    log_pessoa_id_log_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.log_pessoa_id_log_seq', 3, true);
            public       df_user    false    214            �           0    0    ocorrencia_id_ocorrencia_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.ocorrencia_id_ocorrencia_seq', 10, true);
            public       postgres    false    205            �           0    0    pessoa_id_pessoa_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.pessoa_id_pessoa_seq', 10, true);
            public       postgres    false    207            �          0    0    BLOBS    BLOBS                                false   ��       -           2606    17731    chamado chamado_pk 
   CONSTRAINT     X   ALTER TABLE ONLY public.chamado
    ADD CONSTRAINT chamado_pk PRIMARY KEY (id_chamado);
 <   ALTER TABLE ONLY public.chamado DROP CONSTRAINT chamado_pk;
       public         postgres    false    197            /           2606    17740    cobrade cobrade_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.cobrade
    ADD CONSTRAINT cobrade_pkey PRIMARY KEY (codigo);
 >   ALTER TABLE ONLY public.cobrade DROP CONSTRAINT cobrade_pkey;
       public         postgres    false    198            3           2606    17759 !   endereco_logradouro endereco_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.endereco_logradouro
    ADD CONSTRAINT endereco_pkey PRIMARY KEY (id_logradouro);
 K   ALTER TABLE ONLY public.endereco_logradouro DROP CONSTRAINT endereco_pkey;
       public         postgres    false    202            5           2606    18038 0   log_alteracao_usuario log_alteracao_usuario_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.log_alteracao_usuario
    ADD CONSTRAINT log_alteracao_usuario_pkey PRIMARY KEY (id_alteracao);
 Z   ALTER TABLE ONLY public.log_alteracao_usuario DROP CONSTRAINT log_alteracao_usuario_pkey;
       public         postgres    false    203            ?           2606    18046    log_chamado log_chamado_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.log_chamado
    ADD CONSTRAINT log_chamado_pkey PRIMARY KEY (id_log_cadastro);
 F   ALTER TABLE ONLY public.log_chamado DROP CONSTRAINT log_chamado_pkey;
       public         df_user    false    213            1           2606    17748    dados_login log_in_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.dados_login
    ADD CONSTRAINT log_in_pkey PRIMARY KEY (id_usuario);
 A   ALTER TABLE ONLY public.dados_login DROP CONSTRAINT log_in_pkey;
       public         postgres    false    200            7           2606    18019    log_login log_login_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.log_login
    ADD CONSTRAINT log_login_pkey PRIMARY KEY (id_login);
 B   ALTER TABLE ONLY public.log_login DROP CONSTRAINT log_login_pkey;
       public         postgres    false    204            A           2606    18083    log_pessoa log_pessoa_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.log_pessoa
    ADD CONSTRAINT log_pessoa_pkey PRIMARY KEY (id_log);
 D   ALTER TABLE ONLY public.log_pessoa DROP CONSTRAINT log_pessoa_pkey;
       public         df_user    false    215            9           2606    17781    ocorrencia ocorrencia_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.ocorrencia
    ADD CONSTRAINT ocorrencia_pkey PRIMARY KEY (id_ocorrencia);
 D   ALTER TABLE ONLY public.ocorrencia DROP CONSTRAINT ocorrencia_pkey;
       public         postgres    false    206            ;           2606    17792    pessoa pessoa_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.pessoa
    ADD CONSTRAINT pessoa_pkey PRIMARY KEY (id_pessoa);
 <   ALTER TABLE ONLY public.pessoa DROP CONSTRAINT pessoa_pkey;
       public         postgres    false    208            =           2606    17800    usuario usuario_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id_usuario);
 >   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_pkey;
       public         postgres    false    209            B           2606    17801 #   chamado chamado_endereco_logradouro    FK CONSTRAINT     �   ALTER TABLE ONLY public.chamado
    ADD CONSTRAINT chamado_endereco_logradouro FOREIGN KEY (chamado_logradouro_id) REFERENCES public.endereco_logradouro(id_logradouro);
 M   ALTER TABLE ONLY public.chamado DROP CONSTRAINT chamado_endereco_logradouro;
       public       postgres    false    2867    197    202            C           2606    17806    chamado chamado_pessoa    FK CONSTRAINT        ALTER TABLE ONLY public.chamado
    ADD CONSTRAINT chamado_pessoa FOREIGN KEY (pessoa_id) REFERENCES public.pessoa(id_pessoa);
 @   ALTER TABLE ONLY public.chamado DROP CONSTRAINT chamado_pessoa;
       public       postgres    false    2875    197    208            D           2606    17811 =   log_alteracao_usuario log_cadastro_usuario_usuario_cadastrado    FK CONSTRAINT     �   ALTER TABLE ONLY public.log_alteracao_usuario
    ADD CONSTRAINT log_cadastro_usuario_usuario_cadastrado FOREIGN KEY (id_usuario_alterado) REFERENCES public.usuario(id_usuario);
 g   ALTER TABLE ONLY public.log_alteracao_usuario DROP CONSTRAINT log_cadastro_usuario_usuario_cadastrado;
       public       postgres    false    2877    209    203            E           2606    17816 :   log_alteracao_usuario log_cadastro_usuario_usuario_criador    FK CONSTRAINT     �   ALTER TABLE ONLY public.log_alteracao_usuario
    ADD CONSTRAINT log_cadastro_usuario_usuario_criador FOREIGN KEY (id_usuario_modificador) REFERENCES public.usuario(id_usuario);
 d   ALTER TABLE ONLY public.log_alteracao_usuario DROP CONSTRAINT log_cadastro_usuario_usuario_criador;
       public       postgres    false    203    2877    209            S           2606    18052 '   log_chamado log_chamado_id_chamado_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.log_chamado
    ADD CONSTRAINT log_chamado_id_chamado_fkey FOREIGN KEY (id_chamado) REFERENCES public.chamado(id_chamado);
 Q   ALTER TABLE ONLY public.log_chamado DROP CONSTRAINT log_chamado_id_chamado_fkey;
       public       df_user    false    197    213    2861            R           2606    18047 '   log_chamado log_chamado_id_usuario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.log_chamado
    ADD CONSTRAINT log_chamado_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario);
 Q   ALTER TABLE ONLY public.log_chamado DROP CONSTRAINT log_chamado_id_usuario_fkey;
       public       df_user    false    2877    213    209            F           2606    17821    log_login log_login_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.log_login
    ADD CONSTRAINT log_login_id_fkey FOREIGN KEY (id_usuario) REFERENCES public.dados_login(id_usuario);
 E   ALTER TABLE ONLY public.log_login DROP CONSTRAINT log_login_id_fkey;
       public       postgres    false    2865    200    204            T           2606    18084 /   log_pessoa log_pessoa_id_pessoa_cadastrada_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.log_pessoa
    ADD CONSTRAINT log_pessoa_id_pessoa_cadastrada_fkey FOREIGN KEY (id_pessoa_cadastrada) REFERENCES public.pessoa(id_pessoa);
 Y   ALTER TABLE ONLY public.log_pessoa DROP CONSTRAINT log_pessoa_id_pessoa_cadastrada_fkey;
       public       df_user    false    2875    215    208            U           2606    18089 -   log_pessoa log_pessoa_id_usuario_criador_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.log_pessoa
    ADD CONSTRAINT log_pessoa_id_usuario_criador_fkey FOREIGN KEY (id_usuario_criador) REFERENCES public.usuario(id_usuario);
 W   ALTER TABLE ONLY public.log_pessoa DROP CONSTRAINT log_pessoa_id_usuario_criador_fkey;
       public       df_user    false    215    209    2877            G           2606    17826 %   ocorrencia ocorrencia_atendido_1_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ocorrencia
    ADD CONSTRAINT ocorrencia_atendido_1_fkey FOREIGN KEY (atendido_1) REFERENCES public.pessoa(id_pessoa);
 O   ALTER TABLE ONLY public.ocorrencia DROP CONSTRAINT ocorrencia_atendido_1_fkey;
       public       postgres    false    208    2875    206            H           2606    17831 %   ocorrencia ocorrencia_atendido_2_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ocorrencia
    ADD CONSTRAINT ocorrencia_atendido_2_fkey FOREIGN KEY (atendido_2) REFERENCES public.pessoa(id_pessoa);
 O   ALTER TABLE ONLY public.ocorrencia DROP CONSTRAINT ocorrencia_atendido_2_fkey;
       public       postgres    false    206    2875    208            I           2606    17836    ocorrencia ocorrencia_chamado    FK CONSTRAINT     �   ALTER TABLE ONLY public.ocorrencia
    ADD CONSTRAINT ocorrencia_chamado FOREIGN KEY (chamado_id) REFERENCES public.chamado(id_chamado);
 G   ALTER TABLE ONLY public.ocorrencia DROP CONSTRAINT ocorrencia_chamado;
       public       postgres    false    197    2861    206            J           2606    17841    ocorrencia ocorrencia_endereco    FK CONSTRAINT     �   ALTER TABLE ONLY public.ocorrencia
    ADD CONSTRAINT ocorrencia_endereco FOREIGN KEY (ocorr_logradouro_id) REFERENCES public.endereco_logradouro(id_logradouro);
 H   ALTER TABLE ONLY public.ocorrencia DROP CONSTRAINT ocorrencia_endereco;
       public       postgres    false    202    206    2867            K           2606    17846 (   ocorrencia ocorrencia_ocorr_cobrade_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ocorrencia
    ADD CONSTRAINT ocorrencia_ocorr_cobrade_fkey FOREIGN KEY (ocorr_cobrade) REFERENCES public.cobrade(codigo);
 R   ALTER TABLE ONLY public.ocorrencia DROP CONSTRAINT ocorrencia_ocorr_cobrade_fkey;
       public       postgres    false    206    198    2863            L           2606    17851 +   ocorrencia ocorrencia_ocorr_referencia_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ocorrencia
    ADD CONSTRAINT ocorrencia_ocorr_referencia_fkey FOREIGN KEY (ocorr_referencia) REFERENCES public.ocorrencia(id_ocorrencia);
 U   ALTER TABLE ONLY public.ocorrencia DROP CONSTRAINT ocorrencia_ocorr_referencia_fkey;
       public       postgres    false    206    206    2873            M           2606    17856    ocorrencia ocorrencia_usuario    FK CONSTRAINT     �   ALTER TABLE ONLY public.ocorrencia
    ADD CONSTRAINT ocorrencia_usuario FOREIGN KEY (usuario_criador) REFERENCES public.usuario(id_usuario);
 G   ALTER TABLE ONLY public.ocorrencia DROP CONSTRAINT ocorrencia_usuario;
       public       postgres    false    206    209    2877            N           2606    17861 %   ocorrencia ocorrencia_usuario_apoio_1    FK CONSTRAINT     �   ALTER TABLE ONLY public.ocorrencia
    ADD CONSTRAINT ocorrencia_usuario_apoio_1 FOREIGN KEY (agente_apoio_1) REFERENCES public.usuario(id_usuario);
 O   ALTER TABLE ONLY public.ocorrencia DROP CONSTRAINT ocorrencia_usuario_apoio_1;
       public       postgres    false    2877    206    209            O           2606    17866 %   ocorrencia ocorrencia_usuario_apoio_2    FK CONSTRAINT     �   ALTER TABLE ONLY public.ocorrencia
    ADD CONSTRAINT ocorrencia_usuario_apoio_2 FOREIGN KEY (agente_apoio_2) REFERENCES public.usuario(id_usuario);
 O   ALTER TABLE ONLY public.ocorrencia DROP CONSTRAINT ocorrencia_usuario_apoio_2;
       public       postgres    false    2877    206    209            P           2606    17871 '   ocorrencia ocorrencia_usuario_principal    FK CONSTRAINT     �   ALTER TABLE ONLY public.ocorrencia
    ADD CONSTRAINT ocorrencia_usuario_principal FOREIGN KEY (agente_principal) REFERENCES public.usuario(id_usuario);
 Q   ALTER TABLE ONLY public.ocorrencia DROP CONSTRAINT ocorrencia_usuario_principal;
       public       postgres    false    2877    206    209            Q           2606    17876    usuario usuario_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_id_fkey FOREIGN KEY (id_usuario) REFERENCES public.dados_login(id_usuario);
 A   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_id_fkey;
       public       postgres    false    2865    200    209            �   n   x�m�1� Eg�� �6`�Y�V=A$H6,z���*=�?�/ �G�XN+�F=G��[1x��s�O7��/�_Kq���i�Km��;SUY��D?7�4?w�<"~%�#l      �   U   x�34444��K,)-J�,�tO��9�9=39�3$��(57���E
)�
%@�D�?�.��;�8_!'��$1%�XX{� ��+\      �   i   x�3�LL���sH�M���K���T1�T1�PI�,�7uI/�J�6)s7L)7�0K��L�,��)���ʫL�*/�
sq��)�(K�,�2�,-.M,�̧��1z\\\ J06�      �   �   x��ϱ�0���<�M@|viID��i.���F�a�Y�֋�H�#��{���Zk)+��{t[�]~Ak}��7�al"_� JkB��5��M1�Fƅ*� ��#���MC~��z�*���)�	8�س	�\<I�ְO|���ǉq7E�<�����8��o�RV      �      x������ � �      �      x������ � �      �   n  x�]��q%ADϴ��W�ւ-�ߎb4b��S�j Y�~p}�_RWt�@��;u\�������
����f�C_�^���%�ek�Q�u=��nY'"�^g�.w�_.�� � �U� �� P���;�s�!H��n��%r���v��rt�l�#ll�=�erp:X"9��g�S�`g�SZ�4@�:5�_����U�u`@��Gh:@������'{ū���WU��P�i|8���A�T��P�r.� ��?b����,2��n  ����;��K��썞�h�� �s,�y_��c$�Ι+T�A�s���8nP@rQA��A� K��y�.����iw�+JQR������<��<��      �      x������ � �      �      x���MN1���)�3���L��-p�n"%E]Д0E\�sp1���ag�HNޗ�h���M��1�c-m�9U+�D�K�Q}���y_���Ra�OS�� �ض�*�^"�K��m�6 q� V� Ћ��@�a�dܧ�=7��d)v)w�>���(�2�Qt�:h�4���/̸}{M�a:E����&�����<\��-����K�)�c��+�rI���9�"�<�tFz���������A�,q��� ǀF1��P�42�ނ:��N4��fB�3%�`      �   �   x�M�;�0E�z�
� ��펆��6�K�2�l(K��b�2��=	�_�#�.MO�����A* �B�ޕ�	��Ϙ����)hqI�#����F�E�8�*	�Q�Y�>%�-�F�L2�<��O+U�GV����:�d$��Z	t �����yr8�      �   N   x��;� ���aL���%<	��h��0�0Z��5O�,J�a�U��'	�7�;������M��[=���i_      �   �F      x��y�W���.�	���:�� ��!`��00	���'X48$�����}�]w�����z���<�U���KG�j���ࡠ���*�?�v�_+����M�q�F(�"�_"|l<�(
v�P����=Tjc��1�FAA8�"L�4%!�|6a���0��DZ	��8C [�����p����h�k����~�P?mC��3D�('�FJ>:p�"l HW7�$R�/�����  �_����A�j��=� >~^�(?@T�O@HXLL� �/��	�
�I
	J���#���<�^J�+=��Z�����I�@>>>|>B|�� 		��|
�>"x�n$���oJP8���ptw���غ{!d���Sp��׭�?ez,i	���/����uu�/�Ї����pC_���{yB7�%�_d���'���i����wu��pw@�@`��f���ZKKR���q�@Քd��>GG;I�� XQ�$!(�( ��,(&,!,����/�(!,�7W���
uC�͵�?\�����fC=��v�<�]�JX��c�s,����s,���=���o�c��5�o�>*�m{��c�{>6�9إ���j*?�����LMMV������م��XXXJ1?���Wmm���kkk/�����}}ձƴ$���LO�d������l��y��Ⲽ��!<�[������&/UGGG�>�'���MNNNk�>�_IYYCC#ɔ�7�"��xx����U���ɕ�J"ɨ,4����A<cK6���Xit���ikk{�����off�:����P'�4��krr����R�ktt��G}}�l��?5�Ĥ��8�DKKk(HӐl&((������k�'-%����#���a%F/�@ܙe����\�����5�"���R2??��ӧccc��" 5n�Ǜ�^�����g#���z*����a������9���|�	q04�Ņ�h��,��Z�57�IxxxR��[`N����HUv�T���ka���0�}w��`���^��3�d��e�=d��e��+!L��_��W[��
��c�7��s�!�6?M�s��O�NrL2���� m,�d+}�g\��@��*�;��Z��F��������N����������������	F�T�1Ɛ���!ʀ���>�L ф�T�6�4_���3]�h"L�f��v2�sQ`��`���488HCIjjj��ʊ�  ���,+-]Z��`���"++�j��,�477gbbb,/���c���{)�h'��xGfA��������:�##V�|�F|DO�by��,�

���PY���,�@\Bb���C��~��h����XN=QQ�cPBB�c"*gJ((�(}m������76+

E����!r�1�����bS�.O(e�WP�C�L�4��ș�>��_�j��{�A�[���,EYt~��K�<���lWJG/�Ţw����m�(��K,�B~���}.?�;��ܽh�g>�
:�}��~H�����1�*ךm�({�5!G&����'Tl���:��_%`	X�E�Ɖ��?��X�#�?R�W�%��u�`�
L'抠8~&٨�4��$ݛH�o��mPmѡHm)vZ�*[�0�;�o���C=�&��T�{��kI*{��|{�0��h�Q~���M��Y:*��)��TB�)��H�B<W:��o�k~��/6"�S�kssn���M��O���:'
v��o=�F�*�mܲ�N<�m�4w鎏��ה$���k����v!�ɏ���F�,�����	n�*�@\{��ǅh�(Fz<��\�]�gZ<+��h�<<�����n�M�ί�}���ɩ/D壹\�d���w�o�ˈʓ���g���a�f�Qh��Ap������ڬ �-"+bd���O��\D���)mhZ�5Δ��F!ȣ@�ɀ/��މ�/�M�y�:���R~2%|��Dΰ��]��->�d���I���U�L�}�7�p}G\9"6���Κ���Mv_�X�{�W}���[��>R,��!�KFW�I|._I̱�
��kwwQ��1&��9:3�"��z~L�L=y�P�Ҿ����Ͻ���o��^\�Hvό9����i���}�b��a����8S~�Rr�qk�&��"<�!U��1�֊�s���e��"tHɌ�6��[��{��(�r�����㖎�f�#��N�{m��Rjc��tZ�HG�W���������qH��������E��K������攘p�n-���iF��C隠�5�M������znZ���On�c���u�l�$��e���������m
�B5���=_0�l�ə�����$ع��E�(m3�6z���%�;�q�<%?��i�U�B�S��`�H3���ܕZz]~>��3�̴���F�PVY�Fl?���C�$�S�ʁ�� ��<�a� K>E	 l�Lv-b�����������K��N 
�U��ǇQ�����3�M�`�4!�~QMW�$�}s���� �mV�7/qx� �b%��j��i�]h�2u��8�>v���nХ�|u�uU��S�ӳ	�����a��{��&�p�f���3��FU���κA×�u�G�����J ��k��ٔ؋M�P���g��|ʜ*�:ɕ�	fK��{���~�٠'�GU�"V��՛�h��,�F�'�aJ|ơ;��[�iY�}Cf}�E\�!t-�ʦ~������`�� Cs���W�]����j��/�� dD2y�
��@�k��؎uY-�� �bl1� v�G������`�-���c9�$|�e��^��E#���P���J���ͧ���<�L�-ZS'�UhT��3�؈Jy���݅��1%1���b�	��B��vC��9Q
�5~ȧ�Ӣ�[��L�t�/��y-.��#ook��@ޱ0��r���-X�{��lq��"�U�]j���/O��R~��t�ʿ��ʥ��J6W�%�]�G���A�$�l�ɸB�YJd��pٌU�1��g�N��r	�6{b�*��H�ޝ�U�9��쨀q��Z��я��"�qpf�1�g���sHe���/����j���5I��\H�۸�\�����0������1���#������jn�%�[�j��A*M�e҄��c��0�m-d�*�;�$�_��C)_� ._=M�lg�d��f`EL���;MA�6��z����G�i�PX�|�+7����S[a�@Kd[�{���	�O�>�d-�'����u���?�L�����p��ϙ�t&�Y7�8����Y��D��FF􋕆˂3؇W�{��qƓK�肤��ʗ !���ï3���_gh[^ٍ��VL�}��v������Zt
����P5/��m�	�,�fe�"�.�b�~u&�R2�s����"����������r	ӷ���3Y	�G|$��իU�Ɲ��d��?�s_���Q/��W8bF��U(C,�����v,�I/�O�W�)�?��V�94�<���|�KN��W��kt�9�Iϸ�v�Bn��9�$X��,�A�:�'����o='T����%0�C���þ��k�2����M��0\���98&|�s��rp{�;�E'=�Qp m���#�e
�='�����n��w�h�"E$��?��I��	C}��av���A��G`�q�����Kx'n$�g��+���B/Ǵ�\F4��/D�h�����y?9�6�^ȑ��j��SVFj@ �I���KFs�)J^^�����My.�Y�.�5[�}�y���g�p�]�ΘH��v��o��/����l��Dȇ�Qo�zЦ��v�b�ZoR�A-J9���
��+�K��La�|�j���4	L��o�W���v�{`��z�Y@�|9*T�p_)B����:.�d����o,	=Q�&R9�$���*�wkhH������"��	lLg���(�>��
i��Gm"ؽ_`Q��Ϸ{}^���z�߲�ML@e��61���+���ν� t  c̷/sf�O�`��đ����G嵀�U6zN����:��z[s�u��eX���M?4h��9m]n�H�;��C }-�b���"S�
`V�e|���Ѽ7�����Y�f� ur=OP���]�K��f�跈̈�!�i��yVv�']
,Q�Οd���D�ERi���DϨ�;.��J��J��B�v�7��1�1߿�n�NX)M*<s��Ҹ��p"�������
�Խ-8���$||�$��^h��z��τ�'n�J^�{���
�3飞�s=_���.a-��b����a:N$�_N��3�1�x�8���:�Y@$�=��G���>��_=�B���v~��Y�T�ڟ���m�Q��nAzs;͊�OL�B{*0Z�aDg�:
t��*��f�^U�7v��� +Fе';x%T�[&��2���̭]�E���N��]JÞb����s:!fD���=���c��<͌�v�p�^�w��~���Ҭ�&���'�q�P3�~�[�p�t���r��ﮄ��[�x�m�W��7�gLW,ݾ�_|����x}�ڌ�$1Č�����G����~0���\s
<.t�^w�>Oޓ��,ʳm��a��W��/��=}?dJ�զ��x͖9��j�a������-���[���=�{q�l3&/fr����b�<dh��??ܑ������m�x�mK\?.��J��S�q�wP�tl�do��X� �u�q�%�s�?c{(���o���B�0 3�U�a�Yb�cV��=����(߲�	����_�6G�\�_��o[�X�Un�Kb.���켵K�`�rNڄ�CPغR��_-�����]N�&)���Xb��h�j6�W�[7t��-H1�����g�Ch�E�c�~L鬗�=Q���Q���<��Q!>ejf�`�Mcgt`���b���ީ#�4�n4�� d.�+�RD�����-{f��BL�F�9�U��穀qhI|z��dAC��3隿��.RGV�DS2�d����0�S����¸	0�i�s�
�ie_H%@d��h�#�"um_���ģ��jvY}�[0p|��u�y����gqg�<�S�:��-�N0z�;ER�"N�9�[C���	+>��ou&mI�?7��}T}�Ϋ�U�6��T�f���
kA�J���ݢ�R�zK$��gTT&7x��"�^M#������@�.<q��Jm����m
��FuN��8�����N�R2��f�:=>�ؾ�+/�ݔ�9�8,��񂬽37��p�ܲ����o��zL��Ff�<���rD<t�ѼΨB�7�Do{��Sxy�*-+ۑ^���O���ϟoz�qb��w
hOAk�Tb����hZ�yl~j{eU�V�(ewZ��L>�t>�Uvés��Q��c�h]a��ѳ�<�8B|,��@:����zՙ<~���	WV�U�T��U���s^�"Uz=�<ׄ&��������Oe[�������Ԉ�)��I>+�Ϻ¹�OMdYN����L�����g�!!S�2w��6���6�l��dT|e8Y&G�Q�m�/�
�3n�YM`��ؼ�[��M������APQ����cj*�}.#'<�m�aA���^�A�6�'Us��N���5�w� 6���`O���/+O�Y��Z��,��_`���hjUcl�0F�(���n+���IJ�ҕ�B���+��1���$U���OT�5�[]�s�M�%fwq���ؐ���.+J=Ŏ
��,�3�H��g�	����!o��N�d�F<��:_j:�국���n��z���X	{�<�bt�jL����ٖ:F�M=����F!���b��	��$�;g}+�H�,*���!��öj�:o�s8:5�(>t��ٞ�c:#��S.�I�K/����>��Ym� 9�j�aLj>�����ƍe9'2���2�\��<��v<�eu,ޑ���y���~��@�+��$�����:��0¨(ܽrN5�H>7���7"wXՖao�p��DҎ}�����][T���x�	�KxO=�pȡ&GvL�'K��e+<��|p��և�"ptb�YX<#BX:q�;x�M����i���]��� �d���dj{�B�"�H�`��D�L��V�I.��%�P@0���E���o7�_�)|�2��
־��zIj�x�Y�>O�G2b�����٢qôc�+�R�)��s��Z��@9�?r'k��R8�D�(��rv8W��Ak�a�,`��r�	��lbl3Oj�bԯ?��IW�v�����o)1(�ie.���w�Uu,h���)��KB�C�I�S�%߬���K�*�-)���Jz ���g.'��Z2��l�mr��5/�ᯎZ�2]���8����O�c�@=�χi~��O�$p\��D�m|p��s��UFk�%.�Z!z[I�D>Ho���a�
Q&��|EܘT�:��N�!�`XAyNZ��A����d�9�T�_�%v9e�4���$�0�W�i{���˫�P��R�r2��ʠ�����q�WInd��%SP:(��p��puz��S�x|�Υ��ˌ�~����o�ͱ#�}G�����-�)E�h�uUw���om_37ȳ>�o*�'�ٜT�D�(�ih���<��ʠ�2�l���r��0!�
�y�YF+���gۙ����;3��(9�7�䢯�YL��g�vF���[A��F�1.�i�*��rm1.dZ��4�j:z����-��qիl.�:/^���  �S� a>̻��)dFm���J!,�X7̲Մ����8�i&4� aq�Pۚ�Y��O���������N���`�x�����擅��k��=s	���/�CԿa�K�o5q2�5�r��f��h��/�x�i��� ��a�ϛ��g���U�k�^�u������f��#7��%O�=_�&Ǐ�h���A�{2��a��;�Ya��n�b��6� Z̞'�+�B��<(h?��ޕ7H� O�"u^~}��S�q�j�Gs�&�-�iY�3S�)�:歊6���'�7����r�-��ہnh�B��Oc��n�1�d�x�R]�B��zee��IӜ�����#���g�'9G+z����Y��#0�/-�����6un�%���ɾvm�<X�>�OK���T��~k��̊9U{Z��h�5ݻB#@9gy�O�}����WMY[�l�?����      �F      x��y�W���.�	���:�� ��!`��00	���'X48$�����}�]w�����z���<�U���KG�j���ࡠ���*�?�v�_+����M�q�F(�"�_"|l<�(
v�P����=Tjc��1�FAA8�"L�4%!�|6a���0��DZ	��8C [�����p����h�k����~�P?mC��3D�('�FJ>:p�"l HW7�$R�/�����  �_����A�j��=� >~^�(?@T�O@HXLL� �/��	�
�I
	J���#���<�^J�+=��Z�����I�@>>>|>B|�� 		��|
�>"x�n$���oJP8���ptw���غ{!d���Sp��׭�?ez,i	���/����uu�/�Ї����pC_���{yB7�%�_d���'���i����wu��pw@�@`��f���ZKKR���q�@Քd��>GG;I�� XQ�$!(�( ��,(&,!,����/�(!,�7W���
uC�͵�?\�����fC=��v�<�]�JX��c�s,����s,���=���o�c��5�o�>*�m{��c�{>6�9إ���j*?�����LMMV������م��XXXJ1?���Wmm���kkk/�����}}ձƴ$���LO�d������l��y��Ⲽ��!<�[������&/UGGG�>�'���MNNNk�>�_IYYCC#ɔ�7�"��xx����U���ɕ�J"ɨ,4����A<cK6���Xit���ikk{�����off�:����P'�4��krr����R�ktt��G}}�l��?5�Ĥ��8�DKKk(HӐl&((������k�'-%����#���a%F/�@ܙe����\�����5�"���R2??��ӧccc��" 5n�Ǜ�^�����g#���z*����a������9���|�	q04�Ņ�h��,��Z�57�IxxxR��[`N����HUv�T���ka���0�}w��`���^��3�d��e�=d��e��+!L��_��W[��
��c�7��s�!�6?M�s��O�NrL2���� m,�d+}�g\��@��*�;��Z��F��������N����������������	F�T�1Ɛ���!ʀ���>�L ф�T�6�4_���3]�h"L�f��v2�sQ`��`���488HCIjjj��ʊ�  ���,+-]Z��`���"++�j��,�477gbbb,/���c���{)�h'��xGfA��������:�##V�|�F|DO�by��,�

���PY���,�@\Bb���C��~��h����XN=QQ�cPBB�c"*gJ((�(}m������76+

E����!r�1�����bS�.O(e�WP�C�L�4��ș�>��_�j��{�A�[���,EYt~��K�<���lWJG/�Ţw����m�(��K,�B~���}.?�;��ܽh�g>�
:�}��~H�����1�*ךm�({�5!G&����'Tl���:��_%`	X�E�Ɖ��?��X�#�?R�W�%��u�`�
L'抠8~&٨�4��$ݛH�o��mPmѡHm)vZ�*[�0�;�o���C=�&��T�{��kI*{��|{�0��h�Q~���M��Y:*��)��TB�)��H�B<W:��o�k~��/6"�S�kssn���M��O���:'
v��o=�F�*�mܲ�N<�m�4w鎏��ה$���k����v!�ɏ���F�,�����	n�*�@\{��ǅh�(Fz<��\�]�gZ<+��h�<<�����n�M�ί�}���ɩ/D壹\�d���w�o�ˈʓ���g���a�f�Qh��Ap������ڬ �-"+bd���O��\D���)mhZ�5Δ��F!ȣ@�ɀ/��މ�/�M�y�:���R~2%|��Dΰ��]��->�d���I���U�L�}�7�p}G\9"6���Κ���Mv_�X�{�W}���[��>R,��!�KFW�I|._I̱�
��kwwQ��1&��9:3�"��z~L�L=y�P�Ҿ����Ͻ���o��^\�Hvό9����i���}�b��a����8S~�Rr�qk�&��"<�!U��1�֊�s���e��"tHɌ�6��[��{��(�r�����㖎�f�#��N�{m��Rjc��tZ�HG�W���������qH��������E��K������攘p�n-���iF��C隠�5�M������znZ���On�c���u�l�$��e���������m
�B5���=_0�l�ə�����$ع��E�(m3�6z���%�;�q�<%?��i�U�B�S��`�H3���ܕZz]~>��3�̴���F�PVY�Fl?���C�$�S�ʁ�� ��<�a� K>E	 l�Lv-b�����������K��N 
�U��ǇQ�����3�M�`�4!�~QMW�$�}s���� �mV�7/qx� �b%��j��i�]h�2u��8�>v���nХ�|u�uU��S�ӳ	�����a��{��&�p�f���3��FU���κA×�u�G�����J ��k��ٔ؋M�P���g��|ʜ*�:ɕ�	fK��{���~�٠'�GU�"V��՛�h��,�F�'�aJ|ơ;��[�iY�}Cf}�E\�!t-�ʦ~������`�� Cs���W�]����j��/�� dD2y�
��@�k��؎uY-�� �bl1� v�G������`�-���c9�$|�e��^��E#���P���J���ͧ���<�L�-ZS'�UhT��3�؈Jy���݅��1%1���b�	��B��vC��9Q
�5~ȧ�Ӣ�[��L�t�/��y-.��#ook��@ޱ0��r���-X�{��lq��"�U�]j���/O��R~��t�ʿ��ʥ��J6W�%�]�G���A�$�l�ɸB�YJd��pٌU�1��g�N��r	�6{b�*��H�ޝ�U�9��쨀q��Z��я��"�qpf�1�g���sHe���/����j���5I��\H�۸�\�����0������1���#������jn�%�[�j��A*M�e҄��c��0�m-d�*�;�$�_��C)_� ._=M�lg�d��f`EL���;MA�6��z����G�i�PX�|�+7����S[a�@Kd[�{���	�O�>�d-�'����u���?�L�����p��ϙ�t&�Y7�8����Y��D��FF􋕆˂3؇W�{��qƓK�肤��ʗ !���ï3���_gh[^ٍ��VL�}��v������Zt
����P5/��m�	�,�fe�"�.�b�~u&�R2�s����"����������r	ӷ���3Y	�G|$��իU�Ɲ��d��?�s_���Q/��W8bF��U(C,�����v,�I/�O�W�)�?��V�94�<���|�KN��W��kt�9�Iϸ�v�Bn��9�$X��,�A�:�'����o='T����%0�C���þ��k�2����M��0\���98&|�s��rp{�;�E'=�Qp m���#�e
�='�����n��w�h�"E$��?��I��	C}��av���A��G`�q�����Kx'n$�g��+���B/Ǵ�\F4��/D�h�����y?9�6�^ȑ��j��SVFj@ �I���KFs�)J^^�����My.�Y�.�5[�}�y���g�p�]�ΘH��v��o��/����l��Dȇ�Qo�zЦ��v�b�ZoR�A-J9���
��+�K��La�|�j���4	L��o�W���v�{`��z�Y@�|9*T�p_)B����:.�d����o,	=Q�&R9�$���*�wkhH������"��	lLg���(�>��
i��Gm"ؽ_`Q��Ϸ{}^���z�߲�ML@e��61���+���ν� t  c̷/sf�O�`��đ����G嵀�U6zN����:��z[s�u��eX���M?4h��9m]n�H�;��C }-�b���"S�
`V�e|���Ѽ7�����Y�f� ur=OP���]�K��f�跈̈�!�i��yVv�']
,Q�Οd���D�ERi���DϨ�;.��J��J��B�v�7��1�1߿�n�NX)M*<s��Ҹ��p"�������
�Խ-8���$||�$��^h��z��τ�'n�J^�{���
�3飞�s=_���.a-��b����a:N$�_N��3�1�x�8���:�Y@$�=��G���>��_=�B���v~��Y�T�ڟ���m�Q��nAzs;͊�OL�B{*0Z�aDg�:
t��*��f�^U�7v��� +Fе';x%T�[&��2���̭]�E���N��]JÞb����s:!fD���=���c��<͌�v�p�^�w��~���Ҭ�&���'�q�P3�~�[�p�t���r��ﮄ��[�x�m�W��7�gLW,ݾ�_|����x}�ڌ�$1Č�����G����~0���\s
<.t�^w�>Oޓ��,ʳm��a��W��/��=}?dJ�զ��x͖9��j�a������-���[���=�{q�l3&/fr����b�<dh��??ܑ������m�x�mK\?.��J��S�q�wP�tl�do��X� �u�q�%�s�?c{(���o���B�0 3�U�a�Yb�cV��=����(߲�	����_�6G�\�_��o[�X�Un�Kb.���켵K�`�rNڄ�CPغR��_-�����]N�&)���Xb��h�j6�W�[7t��-H1�����g�Ch�E�c�~L鬗�=Q���Q���<��Q!>ejf�`�Mcgt`���b���ީ#�4�n4�� d.�+�RD�����-{f��BL�F�9�U��穀qhI|z��dAC��3隿��.RGV�DS2�d����0�S����¸	0�i�s�
�ie_H%@d��h�#�"um_���ģ��jvY}�[0p|��u�y����gqg�<�S�:��-�N0z�;ER�"N�9�[C���	+>��ou&mI�?7��}T}�Ϋ�U�6��T�f���
kA�J���ݢ�R�zK$��gTT&7x��"�^M#������@�.<q��Jm����m
��FuN��8�����N�R2��f�:=>�ؾ�+/�ݔ�9�8,��񂬽37��p�ܲ����o��zL��Ff�<���rD<t�ѼΨB�7�Do{��Sxy�*-+ۑ^���O���ϟoz�qb��w
hOAk�Tb����hZ�yl~j{eU�V�(ewZ��L>�t>�Uvés��Q��c�h]a��ѳ�<�8B|,��@:����zՙ<~���	WV�U�T��U���s^�"Uz=�<ׄ&��������Oe[�������Ԉ�)��I>+�Ϻ¹�OMdYN����L�����g�!!S�2w��6���6�l��dT|e8Y&G�Q�m�/�
�3n�YM`��ؼ�[��M������APQ����cj*�}.#'<�m�aA���^�A�6�'Us��N���5�w� 6���`O���/+O�Y��Z��,��_`���hjUcl�0F�(���n+���IJ�ҕ�B���+��1���$U���OT�5�[]�s�M�%fwq���ؐ���.+J=Ŏ
��,�3�H��g�	����!o��N�d�F<��:_j:�국���n��z���X	{�<�bt�jL����ٖ:F�M=����F!���b��	��$�;g}+�H�,*���!��öj�:o�s8:5�(>t��ٞ�c:#��S.�I�K/����>��Ym� 9�j�aLj>�����ƍe9'2���2�\��<��v<�eu,ޑ���y���~��@�+��$�����:��0¨(ܽrN5�H>7���7"wXՖao�p��DҎ}�����][T���x�	�KxO=�pȡ&GvL�'K��e+<��|p��և�"ptb�YX<#BX:q�;x�M����i���]��� �d���dj{�B�"�H�`��D�L��V�I.��%�P@0���E���o7�_�)|�2��
־��zIj�x�Y�>O�G2b�����٢qôc�+�R�)��s��Z��@9�?r'k��R8�D�(��rv8W��Ak�a�,`��r�	��lbl3Oj�bԯ?��IW�v�����o)1(�ie.���w�Uu,h���)��KB�C�I�S�%߬���K�*�-)���Jz ���g.'��Z2��l�mr��5/�ᯎZ�2]���8����O�c�@=�χi~��O�$p\��D�m|p��s��UFk�%.�Z!z[I�D>Ho���a�
Q&��|EܘT�:��N�!�`XAyNZ��A����d�9�T�_�%v9e�4���$�0�W�i{���˫�P��R�r2��ʠ�����q�WInd��%SP:(��p��puz��S�x|�Υ��ˌ�~����o�ͱ#�}G�����-�)E�h�uUw���om_37ȳ>�o*�'�ٜT�D�(�ih���<��ʠ�2�l���r��0!�
�y�YF+���gۙ����;3��(9�7�䢯�YL��g�vF���[A��F�1.�i�*��rm1.dZ��4�j:z����-��qիl.�:/^���  �S� a>̻��)dFm���J!,�X7̲Մ����8�i&4� aq�Pۚ�Y��O���������N���`�x�����擅��k��=s	���/�CԿa�K�o5q2�5�r��f��h��/�x�i��� ��a�ϛ��g���U�k�^�u������f��#7��%O�=_�&Ǐ�h���A�{2��a��;�Ya��n�b��6� Z̞'�+�B��<(h?��ޕ7H� O�"u^~}��S�q�j�Gs�&�-�iY�3S�)�:歊6���'�7����r�-��ہnh�B��Oc��n�1�d�x�R]�B��zee��IӜ�����#���g�'9G+z����Y��#0�/-�����6un�%���ɾvm�<X�>�OK���T��~k��̊9U{Z��h�5ݻB#@9gy�O�}����WMY[�l�?����          
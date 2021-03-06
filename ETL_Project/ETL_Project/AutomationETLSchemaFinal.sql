PGDMP                         x           AutomationETL    12.3    12.3     [           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            \           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ]           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ^           1262    17509    AutomationETL    DATABASE     m   CREATE DATABASE "AutomationETL" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C' LC_CTYPE = 'C';
    DROP DATABASE "AutomationETL";
                postgres    false            _           0    0    DATABASE "AutomationETL"    COMMENT     6   COMMENT ON DATABASE "AutomationETL" IS 'Our project';
                   postgres    false    3166            �            1259    17534 
   automation    TABLE     L	  CREATE TABLE public.automation (
    detail_id integer NOT NULL,
    occupation character varying NOT NULL,
    probability double precision NOT NULL,
    "Alabama" character varying NOT NULL,
    "Alaska" character varying NOT NULL,
    "Arizona" character varying NOT NULL,
    "Arkansas" character varying NOT NULL,
    "California" character varying NOT NULL,
    "Colorado" character varying NOT NULL,
    "Connecticut" character varying NOT NULL,
    "Delaware" character varying NOT NULL,
    "District_of_Columbia" character varying NOT NULL,
    "Florida" character varying NOT NULL,
    "Georgia" character varying NOT NULL,
    "Hawaii" character varying NOT NULL,
    "Idaho" character varying NOT NULL,
    "Illinois" character varying NOT NULL,
    "Indiana" character varying NOT NULL,
    "Iowa" character varying NOT NULL,
    "Kansas" character varying NOT NULL,
    "Kentucky" character varying NOT NULL,
    "Louisiana" character varying NOT NULL,
    "Maine" character varying NOT NULL,
    "Maryland" character varying NOT NULL,
    "Massachusetts" character varying NOT NULL,
    "Michigan" character varying NOT NULL,
    "Minnesota" character varying NOT NULL,
    "Mississippi" character varying NOT NULL,
    "Missouri" character varying NOT NULL,
    "Montana" character varying NOT NULL,
    "Nebraska" character varying NOT NULL,
    "Nevada" character varying NOT NULL,
    "New_Hampshire" character varying NOT NULL,
    "New_Jersey" character varying NOT NULL,
    "New_Mexico" character varying NOT NULL,
    "New_York" character varying NOT NULL,
    "North_Carolina" character varying NOT NULL,
    "North_Dakota" character varying NOT NULL,
    "Ohio" character varying NOT NULL,
    "Oklahoma" character varying NOT NULL,
    "Oregon" character varying NOT NULL,
    "Pennsylvania" character varying NOT NULL,
    "Rhode_Island" character varying NOT NULL,
    "South_Carolina" character varying NOT NULL,
    "South_Dakota" character varying NOT NULL,
    "Tennessee" character varying NOT NULL,
    "Texas" character varying NOT NULL,
    "Utah" character varying NOT NULL,
    "Vermont" character varying NOT NULL,
    "Virginia" character varying NOT NULL,
    "Washington" character varying NOT NULL,
    "West_Virginia" character varying NOT NULL,
    "Wisconsin" character varying NOT NULL,
    "Wyoming" character varying NOT NULL
);
    DROP TABLE public.automation;
       public         heap    postgres    false            �            1259    17542    occupation_broad    TABLE     �   CREATE TABLE public.occupation_broad (
    broad_id integer NOT NULL,
    "OCC_TITLE" character varying NOT NULL,
    minor_id integer NOT NULL
);
 $   DROP TABLE public.occupation_broad;
       public         heap    postgres    false            �            1259    17510    occupation_detail    TABLE     U  CREATE TABLE public.occupation_detail (
    detail_id integer NOT NULL,
    "OCC_TITLE" character varying NOT NULL,
    broad_id integer NOT NULL,
    total_emp integer NOT NULL,
    a_mean character varying NOT NULL,
    a_median character varying NOT NULL,
    h_mean character varying NOT NULL,
    h_median character varying NOT NULL
);
 %   DROP TABLE public.occupation_detail;
       public         heap    postgres    false            �            1259    17526    occupation_major    TABLE     t   CREATE TABLE public.occupation_major (
    major_id integer NOT NULL,
    "OCC_TITLE" character varying NOT NULL
);
 $   DROP TABLE public.occupation_major;
       public         heap    postgres    false            �            1259    17518    occupation_minor    TABLE     �   CREATE TABLE public.occupation_minor (
    minor_id integer NOT NULL,
    "OCC_TITLE" character varying NOT NULL,
    major_id integer NOT NULL
);
 $   DROP TABLE public.occupation_minor;
       public         heap    postgres    false            �           2606    17541    automation pk_automation 
   CONSTRAINT     ]   ALTER TABLE ONLY public.automation
    ADD CONSTRAINT pk_automation PRIMARY KEY (detail_id);
 B   ALTER TABLE ONLY public.automation DROP CONSTRAINT pk_automation;
       public            postgres    false    205            �           2606    17549 $   occupation_broad pk_occupation_broad 
   CONSTRAINT     h   ALTER TABLE ONLY public.occupation_broad
    ADD CONSTRAINT pk_occupation_broad PRIMARY KEY (broad_id);
 N   ALTER TABLE ONLY public.occupation_broad DROP CONSTRAINT pk_occupation_broad;
       public            postgres    false    206            �           2606    17517 &   occupation_detail pk_occupation_detail 
   CONSTRAINT     k   ALTER TABLE ONLY public.occupation_detail
    ADD CONSTRAINT pk_occupation_detail PRIMARY KEY (detail_id);
 P   ALTER TABLE ONLY public.occupation_detail DROP CONSTRAINT pk_occupation_detail;
       public            postgres    false    202            �           2606    17533 $   occupation_major pk_occupation_major 
   CONSTRAINT     h   ALTER TABLE ONLY public.occupation_major
    ADD CONSTRAINT pk_occupation_major PRIMARY KEY (major_id);
 N   ALTER TABLE ONLY public.occupation_major DROP CONSTRAINT pk_occupation_major;
       public            postgres    false    204            �           2606    17525 $   occupation_minor pk_occupation_minor 
   CONSTRAINT     h   ALTER TABLE ONLY public.occupation_minor
    ADD CONSTRAINT pk_occupation_minor PRIMARY KEY (minor_id);
 N   ALTER TABLE ONLY public.occupation_minor DROP CONSTRAINT pk_occupation_minor;
       public            postgres    false    203           
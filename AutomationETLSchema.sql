PGDMP     !    /                x           AutomationETL    12.3    12.3                 0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            !           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            "           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            #           1262    25102    AutomationETL    DATABASE     �   CREATE DATABASE "AutomationETL" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
    DROP DATABASE "AutomationETL";
                postgres    false            $           0    0    DATABASE "AutomationETL"    COMMENT     M   COMMENT ON DATABASE "AutomationETL" IS 'Job automation and occupation data';
                   postgres    false    2851            �            1259    25195 
   automation    TABLE     	  CREATE TABLE public.automation (
    "SOC" integer NOT NULL,
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
       public         heap    postgres    false            �            1259    25171    occupation_broad    TABLE     �   CREATE TABLE public.occupation_broad (
    broad_id integer NOT NULL,
    "OCC_TITLE" character varying NOT NULL,
    minor_id integer NOT NULL
);
 $   DROP TABLE public.occupation_broad;
       public         heap    postgres    false            �            1259    25163    occupation_detail    TABLE     U  CREATE TABLE public.occupation_detail (
    occupation_id integer NOT NULL,
    "OCC_TITLE" character varying NOT NULL,
    broad_id integer NOT NULL,
    total_emp integer NOT NULL,
    a_mean double precision NOT NULL,
    a_median double precision NOT NULL,
    h_mean double precision NOT NULL,
    h_mediam double precision NOT NULL
);
 %   DROP TABLE public.occupation_detail;
       public         heap    postgres    false            �            1259    25187    occupation_major    TABLE     t   CREATE TABLE public.occupation_major (
    major_id integer NOT NULL,
    "OCC_TITLE" character varying NOT NULL
);
 $   DROP TABLE public.occupation_major;
       public         heap    postgres    false            �            1259    25179    occupation_minor    TABLE     �   CREATE TABLE public.occupation_minor (
    minor_id integer NOT NULL,
    "OCC_TITLE" character varying NOT NULL,
    major_id integer NOT NULL
);
 $   DROP TABLE public.occupation_minor;
       public         heap    postgres    false            �
           2606    25202    automation pk_automation 
   CONSTRAINT     Y   ALTER TABLE ONLY public.automation
    ADD CONSTRAINT pk_automation PRIMARY KEY ("SOC");
 B   ALTER TABLE ONLY public.automation DROP CONSTRAINT pk_automation;
       public            postgres    false    206            �
           2606    25178 $   occupation_broad pk_occupation_broad 
   CONSTRAINT     h   ALTER TABLE ONLY public.occupation_broad
    ADD CONSTRAINT pk_occupation_broad PRIMARY KEY (broad_id);
 N   ALTER TABLE ONLY public.occupation_broad DROP CONSTRAINT pk_occupation_broad;
       public            postgres    false    203            �
           2606    25170 &   occupation_detail pk_occupation_detail 
   CONSTRAINT     o   ALTER TABLE ONLY public.occupation_detail
    ADD CONSTRAINT pk_occupation_detail PRIMARY KEY (occupation_id);
 P   ALTER TABLE ONLY public.occupation_detail DROP CONSTRAINT pk_occupation_detail;
       public            postgres    false    202            �
           2606    25194 $   occupation_major pk_occupation_major 
   CONSTRAINT     h   ALTER TABLE ONLY public.occupation_major
    ADD CONSTRAINT pk_occupation_major PRIMARY KEY (major_id);
 N   ALTER TABLE ONLY public.occupation_major DROP CONSTRAINT pk_occupation_major;
       public            postgres    false    205            �
           2606    25186 $   occupation_minor pk_occupation_minor 
   CONSTRAINT     h   ALTER TABLE ONLY public.occupation_minor
    ADD CONSTRAINT pk_occupation_minor PRIMARY KEY (minor_id);
 N   ALTER TABLE ONLY public.occupation_minor DROP CONSTRAINT pk_occupation_minor;
       public            postgres    false    204            �
           2606    25213 -   occupation_broad fk_occupation_broad_minor_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.occupation_broad
    ADD CONSTRAINT fk_occupation_broad_minor_id FOREIGN KEY (minor_id) REFERENCES public.occupation_minor(minor_id);
 W   ALTER TABLE ONLY public.occupation_broad DROP CONSTRAINT fk_occupation_broad_minor_id;
       public          postgres    false    2711    204    203            �
           2606    25208 /   occupation_detail fk_occupation_detail_broad_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.occupation_detail
    ADD CONSTRAINT fk_occupation_detail_broad_id FOREIGN KEY (broad_id) REFERENCES public.occupation_broad(broad_id);
 Y   ALTER TABLE ONLY public.occupation_detail DROP CONSTRAINT fk_occupation_detail_broad_id;
       public          postgres    false    202    2709    203            �
           2606    25203 4   occupation_detail fk_occupation_detail_occupation_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.occupation_detail
    ADD CONSTRAINT fk_occupation_detail_occupation_id FOREIGN KEY (occupation_id) REFERENCES public.automation("SOC");
 ^   ALTER TABLE ONLY public.occupation_detail DROP CONSTRAINT fk_occupation_detail_occupation_id;
       public          postgres    false    2715    206    202            �
           2606    25218 -   occupation_minor fk_occupation_minor_major_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.occupation_minor
    ADD CONSTRAINT fk_occupation_minor_major_id FOREIGN KEY (major_id) REFERENCES public.occupation_major(major_id);
 W   ALTER TABLE ONLY public.occupation_minor DROP CONSTRAINT fk_occupation_minor_major_id;
       public          postgres    false    204    205    2713           
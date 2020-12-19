PGDMP     .                    x            cafe    13.0    13.0 '    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    24586    cafe    DATABASE     a   CREATE DATABASE cafe WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Turkish_Turkey.1254';
    DROP DATABASE cafe;
                postgres    false            �            1259    24624    Cafe    TABLE     g   CREATE TABLE public."Cafe" (
    cafe_id integer NOT NULL,
    cafe_name character varying NOT NULL
);
    DROP TABLE public."Cafe";
       public         heap    postgres    false            �            1259    24706    City    TABLE     g   CREATE TABLE public."City" (
    city_id integer NOT NULL,
    city_name character varying NOT NULL
);
    DROP TABLE public."City";
       public         heap    postgres    false            �            1259    24714 	   City_cafe    TABLE     `   CREATE TABLE public."City_cafe" (
    city_id integer NOT NULL,
    cafe_id integer NOT NULL
);
    DROP TABLE public."City_cafe";
       public         heap    postgres    false            �            1259    24618    Comments    TABLE     �   CREATE TABLE public."Comments" (
    comment_id integer NOT NULL,
    comment character varying NOT NULL,
    user_id integer NOT NULL,
    cafe_id integer NOT NULL,
    score_id integer
);
    DROP TABLE public."Comments";
       public         heap    postgres    false            �            1259    24629    Reservation    TABLE     }   CREATE TABLE public."Reservation" (
    hour double precision NOT NULL,
    cafe_id integer NOT NULL,
    user_id integer
);
 !   DROP TABLE public."Reservation";
       public         heap    postgres    false            �            1259    24686    Scoring    TABLE     f   CREATE TABLE public."Scoring" (
    score_id integer NOT NULL,
    mean character varying NOT NULL
);
    DROP TABLE public."Scoring";
       public         heap    postgres    false            �            1259    24613 	   User_type    TABLE     p   CREATE TABLE public."User_type" (
    type_id integer NOT NULL,
    type_name character varying(15) NOT NULL
);
    DROP TABLE public."User_type";
       public         heap    postgres    false            �            1259    24608    Users    TABLE     �   CREATE TABLE public."Users" (
    user_id integer NOT NULL,
    "e-mail" character varying NOT NULL,
    password character varying NOT NULL,
    user_type integer NOT NULL
);
    DROP TABLE public."Users";
       public         heap    postgres    false            �          0    24624    Cafe 
   TABLE DATA           4   COPY public."Cafe" (cafe_id, cafe_name) FROM stdin;
    public          postgres    false    203   y-       �          0    24706    City 
   TABLE DATA           4   COPY public."City" (city_id, city_name) FROM stdin;
    public          postgres    false    206   .       �          0    24714 	   City_cafe 
   TABLE DATA           7   COPY public."City_cafe" (city_id, cafe_id) FROM stdin;
    public          postgres    false    207   i.       �          0    24618    Comments 
   TABLE DATA           U   COPY public."Comments" (comment_id, comment, user_id, cafe_id, score_id) FROM stdin;
    public          postgres    false    202   �.       �          0    24629    Reservation 
   TABLE DATA           ?   COPY public."Reservation" (hour, cafe_id, user_id) FROM stdin;
    public          postgres    false    204   �/       �          0    24686    Scoring 
   TABLE DATA           3   COPY public."Scoring" (score_id, mean) FROM stdin;
    public          postgres    false    205   �/       �          0    24613 	   User_type 
   TABLE DATA           9   COPY public."User_type" (type_id, type_name) FROM stdin;
    public          postgres    false    201   *0       �          0    24608    Users 
   TABLE DATA           I   COPY public."Users" (user_id, "e-mail", password, user_type) FROM stdin;
    public          postgres    false    200   g0       X           2606    24718    City_cafe City_cafe_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public."City_cafe"
    ADD CONSTRAINT "City_cafe_pkey" PRIMARY KEY (city_id, cafe_id);
 F   ALTER TABLE ONLY public."City_cafe" DROP CONSTRAINT "City_cafe_pkey";
       public            postgres    false    207    207            T           2606    24721    City City_city_id_city_id1_key 
   CONSTRAINT     r   ALTER TABLE ONLY public."City"
    ADD CONSTRAINT "City_city_id_city_id1_key" UNIQUE (city_id) INCLUDE (city_id);
 L   ALTER TABLE ONLY public."City" DROP CONSTRAINT "City_city_id_city_id1_key";
       public            postgres    false    206    206            V           2606    24713    City City_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public."City"
    ADD CONSTRAINT "City_pkey" PRIMARY KEY (city_id);
 <   ALTER TABLE ONLY public."City" DROP CONSTRAINT "City_pkey";
       public            postgres    false    206            H           2606    24661    Comments Comments_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."Comments"
    ADD CONSTRAINT "Comments_pkey" PRIMARY KEY (comment_id);
 D   ALTER TABLE ONLY public."Comments" DROP CONSTRAINT "Comments_pkey";
       public            postgres    false    202            P           2606    24693    Scoring Scoring_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."Scoring"
    ADD CONSTRAINT "Scoring_pkey" PRIMARY KEY (score_id);
 B   ALTER TABLE ONLY public."Scoring" DROP CONSTRAINT "Scoring_pkey";
       public            postgres    false    205            R           2606    24700 &   Scoring Scoring_score_id_score_id1_key 
   CONSTRAINT     |   ALTER TABLE ONLY public."Scoring"
    ADD CONSTRAINT "Scoring_score_id_score_id1_key" UNIQUE (score_id) INCLUDE (score_id);
 T   ALTER TABLE ONLY public."Scoring" DROP CONSTRAINT "Scoring_score_id_score_id1_key";
       public            postgres    false    205    205            F           2606    24617    User_type User_type_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public."User_type"
    ADD CONSTRAINT "User_type_pkey" PRIMARY KEY (type_id);
 F   ALTER TABLE ONLY public."User_type" DROP CONSTRAINT "User_type_pkey";
       public            postgres    false    201            B           2606    24645    Users Users_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (user_id, "e-mail");
 >   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_pkey";
       public            postgres    false    200    200            D           2606    24647     Users Users_user_id_user_id1_key 
   CONSTRAINT     t   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_user_id_user_id1_key" UNIQUE (user_id) INCLUDE (user_id);
 N   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_user_id_user_id1_key";
       public            postgres    false    200    200            J           2606    24663 #   Cafe city_cafe_cafe_id_cafe_id1_key 
   CONSTRAINT     u   ALTER TABLE ONLY public."Cafe"
    ADD CONSTRAINT city_cafe_cafe_id_cafe_id1_key UNIQUE (cafe_id) INCLUDE (cafe_id);
 O   ALTER TABLE ONLY public."Cafe" DROP CONSTRAINT city_cafe_cafe_id_cafe_id1_key;
       public            postgres    false    203    203            L           2606    24628    Cafe city_cafe_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Cafe"
    ADD CONSTRAINT city_cafe_pkey PRIMARY KEY (cafe_id);
 ?   ALTER TABLE ONLY public."Cafe" DROP CONSTRAINT city_cafe_pkey;
       public            postgres    false    203            N           2606    24654    Reservation reservation_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY public."Reservation"
    ADD CONSTRAINT reservation_pkey PRIMARY KEY (cafe_id) INCLUDE (cafe_id);
 H   ALTER TABLE ONLY public."Reservation" DROP CONSTRAINT reservation_pkey;
       public            postgres    false    204    204            _           2606    24727     City_cafe City_cafe_cafe_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."City_cafe"
    ADD CONSTRAINT "City_cafe_cafe_id_fkey" FOREIGN KEY (cafe_id) REFERENCES public."Cafe"(cafe_id) NOT VALID;
 N   ALTER TABLE ONLY public."City_cafe" DROP CONSTRAINT "City_cafe_cafe_id_fkey";
       public          postgres    false    207    2892    203            ^           2606    24722     City_cafe City_cafe_city_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."City_cafe"
    ADD CONSTRAINT "City_cafe_city_id_fkey" FOREIGN KEY (city_id) REFERENCES public."City"(city_id) NOT VALID;
 N   ALTER TABLE ONLY public."City_cafe" DROP CONSTRAINT "City_cafe_city_id_fkey";
       public          postgres    false    207    2902    206            [           2606    24681    Comments Comments_cafe_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Comments"
    ADD CONSTRAINT "Comments_cafe_id_fkey" FOREIGN KEY (cafe_id) REFERENCES public."Cafe"(cafe_id) NOT VALID;
 L   ALTER TABLE ONLY public."Comments" DROP CONSTRAINT "Comments_cafe_id_fkey";
       public          postgres    false    202    203    2892            \           2606    24701    Comments Comments_score_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Comments"
    ADD CONSTRAINT "Comments_score_id_fkey" FOREIGN KEY (score_id) REFERENCES public."Scoring"(score_id) NOT VALID;
 M   ALTER TABLE ONLY public."Comments" DROP CONSTRAINT "Comments_score_id_fkey";
       public          postgres    false    205    2896    202            Z           2606    24648    Comments Comments_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Comments"
    ADD CONSTRAINT "Comments_user_id_fkey" FOREIGN KEY (user_id) REFERENCES public."Users"(user_id) NOT VALID;
 L   ALTER TABLE ONLY public."Comments" DROP CONSTRAINT "Comments_user_id_fkey";
       public          postgres    false    202    2884    200            Y           2606    24634    Users Users_User_type_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_User_type_fkey" FOREIGN KEY (user_type) REFERENCES public."User_type"(type_id) NOT VALID;
 H   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_User_type_fkey";
       public          postgres    false    201    200    2886            ]           2606    24655 $   Reservation reservation_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Reservation"
    ADD CONSTRAINT reservation_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."Users"(user_id) NOT VALID;
 P   ALTER TABLE ONLY public."Reservation" DROP CONSTRAINT reservation_user_id_fkey;
       public          postgres    false    2884    204    200            �   �   x�]λ
�@��z�)����F,D���G]V#�n��ӛz�o`�-����6ih5e^jre�@Z`��>�%/q�Y��K�[<�I����h�E>Y���#\�72;�9t�0[\�8|9����4&
{�rJ���Wh����uf��؂r�      �   =   x�3��,.I�K*͉��2�t��N,J�2�����,�2�t*-*N�2�)JL�������� �>I      �   6   x�Ĺ�0���ꉝ]���
@��d���eb۱�=��`C9����;k�      �   �   x�M��n�0�g�)�Hǁ����7t����p
�$xFfv���j�1t��/_���%�(�+ƥ�X�m2r(�P9�{�M���%�:nC�<v��W��i$͎CϞ�o�j��0��	q1v0+s���%�;��
�Dj����w0��<�!���(��C	��ф���L\�WU�}�P�>K�-�TZqdȢ�&���Ӡ��=5����X�3�o�u��`�A�J��Jl\e�şjgB���L��ʔRp0��      �      x�32�3�4�4�24�4�4����� !��      �   4   x�3�<ܞ���~xOUj�	'�a��_T��e��}x[��=\�eP^� ���      �   -   x�3�LL����2��--.I-��2��NLK�/N��L������ �>
�      �   p   x�m�1�0@��>�	d� ,Vd�J\KI*��owؿ�'����h�|k��P�˚�0������<?&#�i��U��7k�?v޻��f=7a{�E\ax/|�I��Ь\�X�}B��8=     
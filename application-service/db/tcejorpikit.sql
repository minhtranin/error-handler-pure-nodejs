
-- author MinhTran
SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
create table public.warehouses (
	id uuid DEFAULT uuid_generate_v4 () primary key,
	name varchar,
	address varchar,
	province varchar,
	quantity integer,
	created_at timestamp,
	updated_at timestamp
);
create table public.products(
	id uuid DEFAULT uuid_generate_v4 () primary key,
	name varchar,
	code varchar,
	quantity integer,
	price integer,
	created_at timestamp,
	updated_at timestamp
)

create table public.orders(
	id uuid DEFAULT uuid_generate_v4 () primary key,
	address varchar,
	details varchar,
	payment varchar,
	delivery date,
	created_at timestamp,
	updated_at timestamp
)

create table public.warehouse_products(
	id uuid DEFAULT uuid_generate_v4 () primary key,
	warehouse_id uuid,
	product_id uuid,
	created_at timestamp,
	updated_at timestamp
)

create table public.orderlines(
	id uuid DEFAULT uuid_generate_v4 () primary key,
	product_id uuid,
	order_id uuid,
	price integer,
	quantity integer,
	created_at timestamp,
	updated_at timestamp
)
--

ALTER TABLE ONLY public."warehouse_products"
    ADD CONSTRAINT "warehouse_products_warehouse_id_fkey" 
   FOREIGN KEY ("warehouse_id") REFERENCES public.warehouses(id) ON UPDATE CASCADE ON DELETE CASCADE;
  
ALTER TABLE ONLY public."warehouse_products"
    ADD CONSTRAINT "warehouse_products_product_id_fkey"
   FOREIGN KEY ("product_id") REFERENCES public.products(id) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE ONLY public."orderlines"
    ADD CONSTRAINT "orderlines_product_id_fkey" 
   FOREIGN KEY ("product_id") REFERENCES public.products(id) ON UPDATE CASCADE ON DELETE cascade;

ALTER TABLE ONLY public."orderlines"
  ADD CONSTRAINT "orderlines_order_id_fkey" 
   FOREIGN KEY ("order_id") REFERENCES public.orders(id) ON UPDATE CASCADE ON DELETE CASCADE;


CREATE UNIQUE INDEX product_code ON public.products USING btree (code);
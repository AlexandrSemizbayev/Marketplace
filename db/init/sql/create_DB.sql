CREATE DATABASE ${PG_DB};
\c ${PG_DB}

CREATE SCHEMA IF NOT EXISTS ${PG_SCHEMA};

CREATE TABLE IF NOT EXISTS ${PG_SCHEMA}.items (
  pk uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  title VARCHAR(30),
  description VARCHAR(600),
  price integer,
  discount integer,
  category_id uuid NOT NULL,
  sizes INTEGER[] DEFAULT ARRAY[]::INTEGER[]
);

CREATE TABLE IF NOT EXISTS ${PG_SCHEMA}.images (
  pk SERIAL PRIMARY KEY,
  parent_id uuid NOT NULL,
  is_main_image BOOLEAN DEFAULT FALSE,
  src VARCHAR(400)

  -- upload_date DATE
);

CREATE TABLE IF NOT EXISTS ${PG_SCHEMA}.users (
  user_id SERIAL,
  username VARCHAR(40) PRIMARY KEY,
  hash VARCHAR(100),
  is_admin BOOLEAN DEFAULT FALSE
);

CREATE TABLE IF NOT EXISTS ${PG_SCHEMA}.categories (
  pk uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  title VARCHAR(40),
  image VARCHAR(300)
);

ALTER TABLE ${PG_SCHEMA}.images
ADD CONSTRAINT fk_item
FOREIGN KEY (parent_id)
REFERENCES ${PG_SCHEMA}.items(pk)
ON UPDATE CASCADE
ON DELETE NO ACTION;


ALTER TABLE ${PG_SCHEMA}.items
  ADD CONSTRAINT fk_category
  FOREIGN KEY (category_id)
  REFERENCES ${PG_SCHEMA}.categories(pk) MATCH SIMPLE
  ON UPDATE CASCADE
  ON DELETE NO ACTION;
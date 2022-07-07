DROP TABLE IF EXISTS "public"."recipes";

CREATE SEQUENCE IF NOT EXISTS recipes_id_seq;

CREATE TABLE recipes (
  id SERIAL PRIMARY KEY,
  name text,
  cooking_time text,
  rating text
);

TRUNCATE TABLE recipes RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO recipes (name, cooking_time, rating) VALUES ('Pizza', '85 mins', '4');
INSERT INTO recipes (name, cooking_time, rating) VALUES ('Pasta', '15 mins', '5');
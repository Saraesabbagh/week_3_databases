DROP TABLE IF EXISTS posts CASCADE;

CREATE SEQUENCE IF NOT EXISTS posts_id_seq;

CREATE TABLE posts (
  "id" SERIAL PRIMARY KEY,
  "title" text,
  "content" text,
  "views" int,
  "user_id" int,
  constraint "fk_user" foreign key("user_id") references "users"("id")
);

INSERT INTO posts ("id", "title", "content", "views", "user_id") VALUES
(1, 'title1', 'content1', 3, 1),
(2, 'title2', 'content2', 7, 1),
(3, 'title3', 'content3', 8, 1);
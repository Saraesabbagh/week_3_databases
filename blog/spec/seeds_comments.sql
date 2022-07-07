CREATE TABLE comments (
  id SERIAL PRIMARY KEY,
  author_name text,
  comment_content text,
  blog_id int,
  constraint fk_blog foreign key(blog_id) references blogs(id)
);
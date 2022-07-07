# Two Tables Design Recipe Template

_Copy this recipe template to design and create two related database tables from a specification._

## 1. Extract nouns from the user stories or specification

```
# EXAMPLE USER STORY:
# (analyse only the relevant part - here the final line).

As a blogger
So I can write interesting stuff
I want to write posts having a title.

As a blogger
So I can write interesting stuff
I want to write posts having a content.

As a blogger
So I can let people comment on interesting stuff
I want to allow comments on my posts.

As a blogger
So I can let people comment on interesting stuff
I want the comments to have a content.

As a blogger
So I can let people comment on interesting stuff
I want the author to include their name in comments.
```

```
Nouns:

blog_posts, title, content, author_name, commenet_cotent,blog_id
```

## 2. Infer the Table Name and Columns

Put the different nouns in this table. Replace the example with your own nouns.

| Record                | Properties          |
| --------------------- | ------------------  |
|blogs                 | title, content, comments
|comments                | author_name, comment_content, blog_id

1. Name of the first table (always plural): `blogs` 

    Column names: `id`, `title`, `content`, `comments`

2. Name of the second table (always plural): `comments` 

    Column names: `id`,`author_name`, `comment_content`, `blog_id(fk)`

## 3. Decide the column types.

[Here's a full documentation of PostgreSQL data types](https://www.postgresql.org/docs/current/datatype.html).

Most of the time, you'll need either `text`, `int`, `bigint`, `numeric`, or `boolean`. If you're in doubt, do some research or ask your peers.

Remember to **always** have the primary key `id` as a first column. Its type will always be `SERIAL`.

```
# EXAMPLE:

Table: blogs
id: SERIAL
title: text
content: text
comments: text

Table: comments
id: SERIAL
author_name: text
comment_content: text
blog_id: int
```

## 4. Decide on The Tables Relationship

Most of the time, you'll be using a **one-to-many** relationship, and will need a **foreign key** on one of the two tables.

To decide on which one, answer these two questions:

1. Can one blog have many comments? (Yes)
2. Can one comments have many blogs? (No)

You'll then be able to say that:

1. **[A] has many [B]** blogs has many comments
2. And on the other side, **[B] belongs to [A]** comments belongs to blogs
3. In that case, the foreign key is in the table [B]comments

Replace the relevant bits in this example with your own:

```


## 4. Write the SQL.

```sql
-- EXAMPLE
-- file: seeds_blogs.sql

-- Replace the table name, columm names and types.

-- Create the table without the foreign key first.
CREATE TABLE blogs (
  id SERIAL PRIMARY KEY,
  title: text
  content: text
  comments: text
);

-- Then the table with the foreign key first.
CREATE TABLE comments (
  id SERIAL PRIMARY KEY,
  author_name: text
  comment_content: text
-- The foreign key name is always blog_id
  blog_id int,
  constraint fk_blog foreign key(blog_id) references blogs(id)
);



```

## 5. Create the tables.

```bash
psql -h 127.0.0.1 database_name < albums_table.sql
```

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---


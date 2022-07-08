## 1. Extract nouns from the user stories or specification

```
As a social network user,
So I can have my information registered,
I'd like to have a user account with my email address.

As a social network user,
So I can have my information registered,
I'd like to have a user account with my username.

As a social network user,
So I can write on my timeline,
I'd like to create posts associated with my user account.

As a social network user,
So I can write on my timeline,
I'd like each of my posts to have a title and a content.

As a social network user,
So I can know who reads my posts,
I'd like each of my posts to have a number of views.
```

```
Nouns:

id, email, username, posts, title, content, views
```

## 2. Infer the Table Name and Columns

Put the different nouns in this table. Replace the example with your own nouns.

| Record                | Properties          |
| --------------------- | ------------------  |
| user                  | id, email, username, posts
| post                  | id, title, content, views, user_id

1. Name of the first table (always plural): `users` 

    Column names: `id`, `email`, `username`, `posts`

2. Name of the second table (always plural): `posts` 

    Column names: `id`, `title`, `content`, `views`, `user_id`

## 3. Decide the column types.

[Here's a full documentation of PostgreSQL data types](https://www.postgresql.org/docs/current/datatype.html).

Most of the time, you'll need either `text`, `int`, `bigint`, `numeric`, or `boolean`. If you're in doubt, do some research or ask your peers.

Remember to **always** have the primary key `id` as a first column. Its type will always be `SERIAL`.

```
# EXAMPLE:

Table: users
id: SERIAL
email: text
username: text
posts: text

Table: posts
id: SERIAL
title: text
content: text
views: int
```

## 4. Decide on The Tables Relationship

Most of the time, you'll be using a **one-to-many** relationship, and will need a **foreign key** on one of the two tables.

To decide on which one, answer these two questions:

1. Can one [USER] have many [POSTS]? (Yes)
2. Can one [POST] have many [USERS]? (No)


-> Therefore,
-> An USER HAS MANY POSTS
-> A POST BELONGS TO an USER

-> Therefore, the foreign key is on the POST table.
```

*If you can answer YES to the two questions, you'll probably have to implement a Many-to-Many relationship, which is more complex and needs a third table (called a join table).*

## 4. Write the SQL.

```sql
-- EXAMPLE
-- file: seeds_users.sql

INSERT INTO users (email, username, posts) VALUES (
    'hello@whatever.com','Hello','This is my first post');
INSERT INTO (email, username, posts) VALUES ('hi@world.co.uk', 'Rihanna', 'I am a singer');
INSERT INTO (email, username, posts) VALUES ('bye@world.co.uk', 'John', 'I am not a singer')

-- file: seeds_posts.sql

INSERT INTO (title, content, views, user_id) VALUES ('Singer', 'I am a singer', 34, 1)
INSERT INTO (title, content, views, user_id) VALUES ('Not Singer', 'I am not a singer', 20, 2)
INSERT INTO (title, content, views, user_id) VALUES ('Sun', 'Sunshine is coming', 34100, 1)



-- Replace the table name, columm names and types.
file: social_network.sql
-- Create the table without the foreign key first.
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  email text,
  username text,
  posts text
);

-- Then the table with the foreign key first.
CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  title text,
  content text,
  view int,
-- The foreign key name is always user_id
  user_id int,
  constraint fk_user foreign key(user_id) references userxs(id)
);

INSERT INTO users (email, username, posts) VALUES (
    'byebye@whatever.com','Bye','This is my last post');
INSERT INTO (email, username, posts) VALUES ('hi@you.co.uk', 'Katy Perry', 'I am a singer');
INSERT INTO (email, username, posts) VALUES ('bye@gmail.co.uk', 'Steve', 'I am not a singer')

-- file: seeds_posts.sql

INSERT INTO (title, content, views, user_id) VALUES ('Unemployed', 'I am not a singer', 100, 1)
INSERT INTO (title, content, views, user_id) VALUES ('Not anymore', 'Nevermind', 20, 2)
INSERT INTO (title, content, views, user_id) VALUES ('Night', 'Rain is coming', 3100, 1)


```

## 5. Create the tables.

```bash
psql -h 127.0.0.1 social_network < seed_users.sql
psql -h 127.0.0.1 social_network < seed_posts.sql
psql -h 127.0.0.1 social_network < social_network.sql
```

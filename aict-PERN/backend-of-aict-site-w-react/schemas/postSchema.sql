CREATE TABLE users (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    email VARCHAR(100) NOT NULL,
    password VARCHAR(100) NOT NULL,
    name VARCHAR(100) NOT NULL
);
CREATE TABLE post (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    users_id INTEGER REFERENCES users(id) ON DELETE CASCADE NOT NULL,
    author VARCHAR(50) NOT NULL,
    post TEXT NOT NULL,
    date TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0)
);
CREATE TABLE comment (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    users_id INTEGER REFERENCES users(id) ON DELETE CASCADE NOT NULL,
    author VARCHAR(50) NOT NULL,
    date TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    comment TEXT NOT NULL,
    post_id INTEGER REFERENCES post(id) ON DELETE CASCADE NOT NULL,
    comment_parent_id INTEGER REFERENCES comment(id) ON DELETE CASCADE
);


PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL
);

INSERT INTO
    users(fname,lname)
VALUES
    ("Rosemary", "Gonzaga"), ("Nara", "Lee"), ("Millie", "He");


DROP TABLE IF EXISTS questions;

CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    user_id INTEGER NOT NULL,

    FOREIGN KEY(user_id) REFERENCES users(id)
);

INSERT INTO
    questions(title, body, user_id)
VALUES
    ("App Academy", "Review", 1);

DROP TABLE IF EXISTS question_follows;

CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id)
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

DROP TABLE IF EXISTS replies;

INSERT INTO 
    question_follows (user_id, question_id)
VALUES
    (1, 1);

CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    parent_id INTEGER,
    user_id INTEGER NOT NULL,
    content TEXT NOT NULL,

    FOREIGN KEY (question_id) REFERENCES questions(id)
    FOREIGN KEY (user_id) REFERENCES users(id)
    FOREIGN KEY (parent_id) REFERENCES replies(id)
);

INSERT INTO 
    replies (question_id, parent_id, user_id, content)
VALUES
    (1, NULL, 1, "parent some replies for testing"), (1, 1, 2, "child1"), (1, 1, 3, "child2"), (1, 1, 1, "child3"),(1, 1, 1, "child4");




DROP TABLE IF EXISTS quesition_likes;

CREATE TABLE question_likes (
    id INTEGER PRIMARY KEY,
    likes INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,

    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO 
    question_likes (likes, user_id, question_id)
VALUES
    (100, 1, 1);


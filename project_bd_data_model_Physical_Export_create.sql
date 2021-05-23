-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2021-05-23 10:56:57.544

-- tables
-- Table: commented_song
CREATE TABLE commented_song (
    user_id int  NOT NULL,
    song_id int  NOT NULL,
    comment varchar(1024)  NOT NULL,
    CONSTRAINT commented_song_pk PRIMARY KEY (user_id,song_id)
);

-- Table: song
CREATE TABLE song (
    id int  NOT NULL,
    name varchar(30)  NOT NULL,
    singer varchar(30)  NOT NULL,
    text varchar(2048)  NOT NULL,
    CONSTRAINT song_pk PRIMARY KEY (id)
);

-- Table: text_comment
CREATE TABLE text_comment (
    user_id int  NOT NULL,
    song_id int  NOT NULL,
    text varchar(1024)  NOT NULL,
    comment varchar(1024)  NOT NULL,
    CONSTRAINT text_comment_pk PRIMARY KEY (user_id,song_id)
);

-- Table: user
CREATE TABLE "user" (
    id int  NOT NULL,
    name varchar(10)  NOT NULL,
    password varchar(24)  NOT NULL,
    CONSTRAINT user_pk PRIMARY KEY (id)
);

-- foreign keys
-- Reference: commented_song_song (table: commented_song)
ALTER TABLE commented_song ADD CONSTRAINT commented_song_song
    FOREIGN KEY (song_id)
    REFERENCES song (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: commented_song_user (table: commented_song)
ALTER TABLE commented_song ADD CONSTRAINT commented_song_user
    FOREIGN KEY (user_id)
    REFERENCES "user" (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: text_comment_song (table: text_comment)
ALTER TABLE text_comment ADD CONSTRAINT text_comment_song
    FOREIGN KEY (song_id)
    REFERENCES song (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: text_comment_user (table: text_comment)
ALTER TABLE text_comment ADD CONSTRAINT text_comment_user
    FOREIGN KEY (user_id)
    REFERENCES "user" (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- sequences
-- Sequence: song_seq
CREATE SEQUENCE song_seq
      INCREMENT BY 1
      NO MINVALUE
      NO MAXVALUE
      START WITH 1
      NO CYCLE
;

-- Sequence: user_seq
CREATE SEQUENCE user_seq
      INCREMENT BY 1
      NO MINVALUE
      NO MAXVALUE
      START WITH 1
      NO CYCLE
;

-- End of file.


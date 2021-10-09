-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2021-05-23 14:56:54.794

-- tables
-- Table: add_explan_text
CREATE TABLE add_explan_text (
    text text  NOT NULL,
    explanation text  NOT NULL,
    id int  NOT NULL,
    song_id int  NOT NULL,
    web_user_id int  NOT NULL,
    CONSTRAINT add_explan_text_pk PRIMARY KEY (id)
);

-- Table: add_song
CREATE TABLE add_song (
    id int  NOT NULL,
    name varchar(25)  NOT NULL,
    singer varchar(25)  NOT NULL,
    text text  NOT NULL,
    web_user_id int  NOT NULL,
    CONSTRAINT add_song_pk PRIMARY KEY (id)
);

-- Table: commented_song
CREATE TABLE commented_song (
    comment varchar(1024)  NOT NULL,
    web_user_id int  NOT NULL,
    song_id int  NOT NULL
);

-- Table: confirm_add
CREATE TABLE confirm_add (
    moderator_id int  NOT NULL,
    add_song_id int  NOT NULL
);

-- Table: confirm_explan
CREATE TABLE confirm_explan (
    id int  NOT NULL,
    moderator_id int  NOT NULL,
    add_explan_text_id int  NOT NULL,
    CONSTRAINT confirm_explan_pk PRIMARY KEY (id)
);

-- Table: explan_text
CREATE TABLE explan_text (
    text text  NOT NULL,
    explanation text  NOT NULL,
    id int  NOT NULL,
    confirm_explan_id int  NOT NULL,
    add_explan_text_id int  NOT NULL,
    CONSTRAINT explan_text_pk PRIMARY KEY (id)
);

-- Table: moderator
CREATE TABLE moderator (
    id int  NOT NULL,
    name varchar(25)  NOT NULL,
    CONSTRAINT moderator_pk PRIMARY KEY (id)
);

-- Table: song
CREATE TABLE song (
    id int  NOT NULL,
    name varchar(30)  NOT NULL,
    singer varchar(30)  NOT NULL,
    text varchar(2048)  NOT NULL,
    add_song_id int  NOT NULL,
    CONSTRAINT song_pk PRIMARY KEY (id)
);

-- Table: text_comment
CREATE TABLE text_comment (
    text varchar(1024)  NOT NULL,
    comment varchar(1024)  NOT NULL,
    web_user_id int  NOT NULL,
    song_id int  NOT NULL
);

-- Table: web_user
CREATE TABLE web_user (
    id int  NOT NULL,
    name varchar(25)  NOT NULL,
    password varchar(24)  NOT NULL,
    CONSTRAINT web_user_pk PRIMARY KEY (id)
);

-- foreign keys
-- Reference: add_explan_text_song (table: add_explan_text)
ALTER TABLE add_explan_text ADD CONSTRAINT add_explan_text_song
    FOREIGN KEY (song_id)
    REFERENCES song (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: add_explan_text_web_user (table: add_explan_text)
ALTER TABLE add_explan_text ADD CONSTRAINT add_explan_text_web_user
    FOREIGN KEY (web_user_id)
    REFERENCES web_user (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: add_song_web_user (table: add_song)
ALTER TABLE add_song ADD CONSTRAINT add_song_web_user
    FOREIGN KEY (web_user_id)
    REFERENCES web_user (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: commented_song_song (table: commented_song)
ALTER TABLE commented_song ADD CONSTRAINT commented_song_song
    FOREIGN KEY (song_id)
    REFERENCES song (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: commented_song_web_user (table: commented_song)
ALTER TABLE commented_song ADD CONSTRAINT commented_song_web_user
    FOREIGN KEY (web_user_id)
    REFERENCES web_user (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: confirm_add_add_song (table: confirm_add)
ALTER TABLE confirm_add ADD CONSTRAINT confirm_add_add_song
    FOREIGN KEY (add_song_id)
    REFERENCES add_song (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: confirm_add_moderator (table: confirm_add)
ALTER TABLE confirm_add ADD CONSTRAINT confirm_add_moderator
    FOREIGN KEY (moderator_id)
    REFERENCES moderator (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: confirm_explan_add_explan_text (table: confirm_explan)
ALTER TABLE confirm_explan ADD CONSTRAINT confirm_explan_add_explan_text
    FOREIGN KEY (add_explan_text_id)
    REFERENCES add_explan_text (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: confirm_explan_moderator (table: confirm_explan)
ALTER TABLE confirm_explan ADD CONSTRAINT confirm_explan_moderator
    FOREIGN KEY (moderator_id)
    REFERENCES moderator (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: explan_text_add_explan_text (table: explan_text)
ALTER TABLE explan_text ADD CONSTRAINT explan_text_add_explan_text
    FOREIGN KEY (add_explan_text_id)
    REFERENCES add_explan_text (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: explan_text_confirm_explan (table: explan_text)
ALTER TABLE explan_text ADD CONSTRAINT explan_text_confirm_explan
    FOREIGN KEY (confirm_explan_id)
    REFERENCES confirm_explan (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: song_add_song (table: song)
ALTER TABLE song ADD CONSTRAINT song_add_song
    FOREIGN KEY (add_song_id)
    REFERENCES add_song (id)  
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

-- Reference: text_comment_web_user (table: text_comment)
ALTER TABLE text_comment ADD CONSTRAINT text_comment_web_user
    FOREIGN KEY (web_user_id)
    REFERENCES web_user (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- sequences
-- Sequence: add_explan_text_seq
CREATE SEQUENCE add_explan_text_seq
      INCREMENT BY 1
      NO MINVALUE
      NO MAXVALUE
      START WITH 1
      NO CYCLE
;

-- Sequence: add_song_seq
CREATE SEQUENCE add_song_seq
      INCREMENT BY 1
      NO MINVALUE
      NO MAXVALUE
      START WITH 1
      NO CYCLE
;

-- Sequence: confirm_explan_seq
CREATE SEQUENCE confirm_explan_seq
      INCREMENT BY 1
      NO MINVALUE
      NO MAXVALUE
      START WITH 1
      NO CYCLE
;

-- Sequence: explan_text_seq
CREATE SEQUENCE explan_text_seq
      INCREMENT BY 1
      NO MINVALUE
      NO MAXVALUE
      START WITH 1
      NO CYCLE
;

-- Sequence: moderator_seq
CREATE SEQUENCE moderator_seq
      INCREMENT BY 1
      NO MINVALUE
      NO MAXVALUE
      START WITH 1
      NO CYCLE
;

-- Sequence: song_seq
CREATE SEQUENCE song_seq
      INCREMENT BY 1
      NO MINVALUE
      NO MAXVALUE
      START WITH 1
      NO CYCLE
;

-- Sequence: web_user_seq
CREATE SEQUENCE web_user_seq
      INCREMENT BY 1
      NO MINVALUE
      NO MAXVALUE
      START WITH 1
      NO CYCLE
;

-- End of file.


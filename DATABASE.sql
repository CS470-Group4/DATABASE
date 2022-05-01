CREATE TABLE ANIME_CHARACTER (
NAME VARCHAR(20) NOT NULL PRIMARY KEY,
BIO VARCHAR(200),
PIC VARCHAR(100),
V_ACTOR VARCHAR(20),
A_SHOW VARCHAR(20),
A_MOVIE VARCHAR(20),
MANGA_ID VARCHAR(20),
CHARACTER_TYPE VARCHAR(5) NOT NULL,
CHECK (CHARACTER_TYPE IN ('Main', 'Side'))
);

CREATE TABLE MANGA (
NAME VARCHAR(20) NOT NULL PRIMARY KEY,
DESCRIPTION VARCHAR(3000),
PIC VARCHAR(100),
AUTHOR VARCHAR(20) NOT NULL
);

CREATE TABLE ANIME_SHOW (
NAME VARCHAR(150) NOT NULL PRIMARY KEY,
DESCRIPTION VARCHAR(3000) NOT NULL,
PIC VARCHAR(200),
STUDIO VARCHAR(30) NOT NULL,
MANGA_ID VARCHAR(20)
);

CREATE TABLE ANIME_MOVIE (
NAME VARCHAR(150) NOT NULL PRIMARY KEY,
DESCRIPTION VARCHAR(3000) NOT NULL,
PIC VARCHAR(200),
STUDIO VARCHAR(30) NOT NULL,
MANGA VARCHAR(20)
);

CREATE TABLE VOICE_ACTOR (
NAME VARCHAR(100) NOT NULL PRIMARY KEY,
BIO VARCHAR(3000),
PIC VARCHAR(200),
A_SHOW VARCHAR(20),
A_MOVIE VARCHAR(20),
CHARACTER_PLAYED VARCHAR(20)
);

CREATE TABLE MANGA_AUTHOR (
NAME VARCHAR (100) NOT NULL PRIMARY KEY,
PIC VARCHAR(200),
MANGA_ID VARCHAR(20)
);

CREATE TABLE STAFF_MEMBERS (
NAME VARCHAR(100) NOT NULL PRIMARY KEY,
ROLE VARCHAR(100),
PIC VARCHAR(200),
STUDIO VARCHAR(30),
A_SHOW VARCHAR(20),
A_MOVIE VARCHAR(20)
);

ALTER TABLE ANIME_CHARACTER
ADD FOREIGN KEY (V_ACTOR) REFERENCES VOICE_ACTOR(NAME);
ALTER TABLE ANIME_CHARACTER
ADD FOREIGN KEY (A_SHOW) REFERENCES ANIME_SHOW(NAME);
ALTER TABLE ANIME_CHARACTER
ADD FOREIGN KEY (A_MOVIE) REFERENCES ANIME_MOVIE(NAME);
ALTER TABLE ANIME_CHARACTER
ADD FOREIGN KEY (MANGA_ID) REFERENCES MANGA(NAME);

ALTER TABLE MANGA
ADD FOREIGN KEY (AUTHOR) REFERENCES MANGA_AUTHOR(NAME);

ALTER TABLE ANIME_SHOW
ADD FOREIGN KEY (MANGA_ID) REFERENCES MANGA(NAME);

ALTER TABLE ANIME_MOVIE
ADD FOREIGN KEY (MANGA) REFERENCES MANGA(NAME);

ALTER TABLE VOICE_ACTOR
ADD FOREIGN KEY (CHARACTER_PLAYED) REFERENCES ANIME_CHARACTER(NAME);
ALTER TABLE VOICE_ACTOR
ADD FOREIGN KEY (A_SHOW) REFERENCES ANIME_SHOW(NAME);
ALTER TABLE VOICE_ACTOR
ADD FOREIGN KEY (A_MOVIE) REFERENCES ANIME_MOVIE(NAME);

ALTER TABLE MANGA_AUTHOR
ADD FOREIGN KEY (MANGA_ID) REFERENCES MANGA(NAME);

ALTER TABLE STAFF_MEMBERS
ADD FOREIGN KEY (A_SHOW) REFERENCES ANIME_SHOW(NAME);
ALTER TABLE STAFF_MEMBERS
ADD FOREIGN KEY (A_MOVIE) REFERENCES ANIME_MOVIE(NAME);

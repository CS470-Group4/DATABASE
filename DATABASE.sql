CREATE TABLE CHARACTER (
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
GO

CREATE TABLE MANGA (
NAME VARCHAR(20) NOT NULL PRIMARY KEY,
DESCRIPTION VARCHAR(100),
PIC VARCHAR(100),
AUTHOR VARCHAR(20) NOT NULL
);
GO

CREATE TABLE ANIME_SHOW (
NAME VARCHAR(20) NOT NULL PRIMARY KEY,
DESCRIPTION VARCHAR(100) NOT NULL,
PIC VARCHAR(100),
STUDIO VARCHAR(10) NOT NULL,
MANGA_ID VARCHAR(20)
);
GO

CREATE TABLE ANIME_MOVIE (
NAME VARCHAR(20) NOT NULL PRIMARY KEY,
DESCRIPTION VARCHAR(100) NOT NULL,
PIC VARCHAR(100),
STUDIO VARCHAR(10) NOT NULL,
MANGA VARCHAR(20)
);
GO

CREATE TABLE VOICE_ACTOR (
NAME VARCHAR(20) NOT NULL PRIMARY KEY,
BIO VARCHAR(100),
PIC VARCHAR(100),
A_SHOW VARCHAR(20),
A_MOVIE VARCHAR(20)
);
GO

CREATE TABLE MANGA_AUTHOR (
NAME VARCHAR (20) NOT NULL PRIMARY KEY,
PIC VARCHAR(100),
MANGA_ID VARCHAR(20)
);
GO

CREATE TABLE STAFF_MEMBERS (
NAME VARCHAR(100) NOT NULL PRIMARY KEY,
ROLE VARCHAR(100),
PIC VARCHAR(100),
STUDIO VARCHAR(20),
A_SHOW VARCHAR(20),
A_MOVIE VARCHAR(20)
);
GO

ALTER TABLE CHARACTER
ADD FOREIGN KEY (V_ACTOR) REFERENCES VOICE_ACTOR(NAME),
ADD FOREIGN KEY (A_SHOW) REFERENCES ANIME_SHOW(NAME),
ADD FOREIGN KEY (A_MOVIE) REFERENCES ANIME_MOVIE(NAME),
ADD FOREIGN KEY (MANGA_ID) REFERENCES MANGA(NAME);

ALTER TABLE MANGA
ADD FOREIGN KEY (AUTHOR) REFERENCES MANGA_AUTHOR(NAME);

ALTER TABLE ANIME_SHOW
ADD FOREIGN KEY (MANGA_ID) REFERENCES MANGA(NAME);

ALTER TABLE ANIME_MOVIE
ADD FOREIGN KEY (MANGA) REFERENCES MANGA(NAME);

ALTER TABLE VOICE_ACTOR
ADD FOREIGN KEY (CHARACTER_PLAYED) REFERENCES CHARACTER(NAME),
ADD FOREIGN KEY (A_SHOW) REFERENCES ANIME_SHOW(NAME),
ADD FOREIGN KEY (A_MOVIE) REFERENCES ANIME_MOVIE(NAME);

ALTER TABLE MANGA_AUTHOR
ADD FOREIGN KEY (MANGA_ID) REFERENCES MANGA(NAME);

ALTER TABLE STAFF_MEMBERS
ADD FOREIGN KEY (A_SHOW) REFERENCES ANIME_SHOW(NAME),
ADD FOREIGN KEY (A_MOVIE) REFERENCES ANIME_MOVIE(NAME);
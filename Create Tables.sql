DROP TABLE GENRE; 

DROP TABLE PERSON; 

DROP TABLE JOB; 

DROP TABLE MOVIE; 

  

  

CREATE TABLE MOVIE ( 

    MovieID varchar2(5) not null, 

    MovieName VARCHAR2(150) not null, 

    YearOfRelease number(4) not null, 

    RunTimeInMinutes number(5) not null, 

    MovieRating number(4, 2) not null, 

    Votes number(20) not null, 

    MetaScore number(20), 

    GrossIncome number(12, 2), 

    Certification VARCHAR2(150),  

    constraint movie_pk primary key (MovieID) 

) 

; 

  

CREATE TABLE GENRE ( 

    MovieID varchar2(5) not null, 

    Genre VARCHAR2(150) not null,  

    constraint movie2_pk primary key (MovieID, Genre),  

    constraint movie_fk foreign key (MovieID)  

    references MOVIE (MovieID) 

) 

; 

  

CREATE TABLE PERSON ( 

    PersonID varchar2(5) not null, 

    FirstName VARCHAR2(150) not null, 

    MiddleName VARCHAR2(150), 

    LastName VARCHAR2(150), 

    Suffix VARCHAR2(150),  

    constraint person_pk primary key (PersonID) 

) 

; 

  

CREATE TABLE JOB ( 

    PersonID varchar2(5) not null, 

    MovieID varchar2(5) not null, 

    Job VARCHAR2(150) check (job in ('Actor', 'Director')) not null, 

    constraint job_pk primary key (PersonID, MovieID, Job), 

    constraint person_fk foreign key (PersonID) references Person (PersonID), 

    constraint job_fk foreign key (MovieID) references Movie (MovieID) 

) 

; 

 

--- Queries ---


-- Q1 -- 

select genre, round(avg(movierating), 3) as averageRating from genre join movie
on genre.movieid = movie.movieid
group by genre
order by averagerating desc fetch first 10 rows only 
;


-- Q2 --

select person.personid, person.firstname || ' ' || person.middlename || ' ' || person.lastname || ' ' || person.suffix as FULLNAME , count(movie.movieid) as totalMovies
from movie join genre
on movie.movieid = genre.movieid
join job on movie.movieid = job.movieid join person
on person.personid = job.personid
where genre = 'Action' and job.job = 'Actor'
group by person.personid, person.firstname, person.middlename, person.lastname, person.suffix

union

select person.personid, person.firstname || ' ' || person.middlename || ' ' || person.lastname || ' ' || person.suffix as FULLNAME, count(movie.movieid) as totalMovies
from movie join genre
on movie.movieid = genre.movieid
join job on movie.movieid = job.movieid join person
on person.personid = job.personid
where genre = 'Drama' and job.job = 'Actor'
group by person.personid, person.firstname, person.middlename, person.lastname, person.suffix order by totalMovies desc
fetch first 25 rows only 
;


-- Q3 -- 

select movie.moviename, movierating, to_char(grossincome, '$999,999,999,999') as grossincome from movie
where grossincome is not null
order by grossincome desc 
;


-- Q4 -- 

select person.personid, person.firstname || ' ' || person.middlename || ' ' || person.lastname || ' ' || person.suffix as FULLNAME, count(movie.movieid) as totalMovies
from movie join job
on movie.movieid = job.movieid join person on person.personid = job.personid
where job.job = 'Actor'
group by person.personid, person.firstname, person.middlename, person.lastname, person.suffix order by totalMovies desc
fetch first 10 rows only 
;


-- Q5 -- 

select person.personid, person.firstname || ' ' || person.middlename || ' ' || person.lastname || ' ' || person.suffix as FULLNAME, round(avg(movierating),2) as averageMovieRating
from movie join job
on movie.movieid = job.movieid join person
on person.personid = job.personid
where job = 'Director'
having count(job.movieid) > 1
group by person.personid, person.firstname, person.middlename, person.lastname, person.suffix order by averageMovieRating desc
fetch first 10 rows only
;
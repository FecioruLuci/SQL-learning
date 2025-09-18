SELECT * FROM moviesdb.movies;
SELECT distinct industry FROM moviesdb.movies;
SELECT * FROM moviesdb.movies WHERE industry="Hollywood";
SELECT * FROM moviesdb.movies WHERE title LIKE "%THOR%";
SELECT * FROM moviesdb.movies WHERE studio="";
SELECT * FROM moviesdb.movies WHERE imdb_rating>=9;
SELECT * FROM moviesdb.movies WHERE imdb_rating>=6 AND imdb_rating<=9;
SELECT * FROM moviesdb.movies 
WHERE release_year = 2022 
	or release_year = 2019 
	or release_year = 2018;
    
SELECT * FROM moviesdb.movies
WHERE studio = "Marvel Studios"
	or studio = "Zee Studios";
    
SELECT * FROM moviesdb.movies
WHERE imdb_rating is NULL;

SELECT * FROM moviesdb.movies
WHERE industry="Bollywood"
ORDER BY imdb_rating DESC LIMIT 5;

SELECT * FROM moviesdb.movies
WHERE industry="Hollywood"
ORDER BY imdb_rating DESC LIMIT 5 OFFSET 1
use ${DB};

SELECT count(*) FROM movies;

SELECT COUNT(*) FROM movies WHERE year=2013;

SELECT DISTINCT genre FROM genres;

SELECT count(*) AS number, g.genre FROM genres g JOIN movies m ON( m.title=g.title) 
GROUP BY g.genre;

SELECT title FROM plots WHERE plot LIKE '%Rosebud%';
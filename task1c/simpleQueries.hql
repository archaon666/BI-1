use ${DB};

SELECT count(*) FROM movies;

SELECT COUNT(*) FROM movies WHERE year=2013;

SELECT DISTINCT genre FROM genres;

SELECT count(*) FROM genres g, movies m WHERE m.title=g.title 
GROUP BY g.genres;

SELECT titles FROM plots WHERE plot LIKE '%Rosebud%';
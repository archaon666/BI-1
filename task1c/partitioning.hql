use ${DB};


CREATE TABLE IF NOT EXISTS movies_byYear(
title STRING, 
full_name STRING,
type STRING,
ep_name STRING,
ep_num STRING,
suspended BOOLEAN
)
PARTITIONED BY(
year INT
);




LOAD DATA INPATH '/user/hive/warehouse/movies'
OVERWRITE INTO TABLE movies_byYear PARTITION(year=2013);



INSERT OVERWRITE TABLE movies_byYear PARTITION(year) SELECT title, full_name, type, ep_name, ep_num, suspended, year FROM movies;


SELECT COUNT(*) FROM movies_byYear WHERE year=2013;


show partitions movies_byYear;

DROP TABLE movies_byYear;

SELECT title FROM movies_byYear;



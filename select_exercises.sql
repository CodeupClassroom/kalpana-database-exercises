use albums_db;
--  Explore the structure of the albums table.

-- a. How many rows are in the albums table?
select count(*) from albums;

-- b. How many unique artist names are in the albums table?
select count(distinct(artist)) from albums;


-- c. What is the primary key for the albums table?
describe albums;

-- d. What is the oldest release date for any album in the albums table? What is the most recent release date?
select min(release_date) from albums;
select max(release_date) from albums;


-- a. The name of all albums by Pink Floyd
select name from albums
where artist = 'Pink Floyd';

-- b. The year Sgt. Pepper's Lonely Hearts Club Band was released
select release_date as year from albums
where name = "Sgt. Pepper's Lonely Hearts Club Band";

-- c. The genre for the album Nevermind
select genre from albums
where name = 'Nevermind';

-- d. Which albums were released in the 1990s

select name from albums
where release_date between 1990 and 1999;

select name from albums
where release_date >= 1990 and release_date <= 1999;

select name from albums
where release_date like '199%';

-- e. Which albums had less than 20 million certified sales

select * from albums
where sales < 20;


-- f. All the albums with a genre of "Rock".
-- Why do these query results not include albums with a genre of "Hard rock" or "Progressive rock"?

select * from albums
where genre = 'Rock';

select * from albums
where genre like '%Rock%';


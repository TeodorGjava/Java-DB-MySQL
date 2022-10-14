use softuni_imdb;
create table `genres`(
`id` int primary key auto_increment,
`name` varchar(50) not null unique);

create table countries(
id int primary key auto_increment,
name varchar(30) not null unique,
continent varchar(30) not null,
currency varchar(5) not null);

create table movies_additional_info(
id int primary key auto_increment,
rating decimal(10,2) not null,
runtime int not null,
picture_url varchar(80) not null,
budget decimal(10,2),
release_date date not null,
has_subtitles boolean,
description text
);

create table movies(
`id` int primary key auto_increment,
`title` varchar(70) not null unique,
country_id int not null,
movie_info_id int not null unique,
constraint fk_movies_countries
foreign key (country_id)
references countries(id),
constraint fk_movies_movies_additional_info
foreign key (movie_info_id)
references movies_additional_info(id));

create table actors(
id int primary key auto_increment,
first_name varchar(50),
last_name varchar(50),
birthdate date not null,
height int,
awards int,
country_id int not null,
constraint fk_actors_countries
foreign key (country_id)
references countries(id)
);
create table movies_actors(
movie_id int,
actor_id int,
constraint fk_movies_actors_to_movies
foreign key (movie_id)
references movies(id),
constraint fk_movies_actors_to_actors
foreign key (actor_id)
references actors(id)
);

create table genres_movies(
genre_id int,
movie_id int,
constraint fk_genres_movies_to_genres
foreign key (genre_id)
references genres(id),
constraint fk_genres_movies_to_movies
foreign key (movie_id)
references movies(id)
);
#insert
insert into actors(first_name,last_name,birthdate ,height ,awards, country_id) 
select reverse(first_name) , reverse(last_name), birthdate - 2, height +10, country_id, 3
from actors where id <=10;

#update

 update movies_additional_info mi set mi.runtime= mi.runtime-10 
 where id between 15 and 25;

# delete 
delete from countries where id not in(select
m.country_id from movies m);

#countries

select * from countries
order by currency desc,
id;

# old movies 
select m.id, m.title, mi.runtime, mi.budget, mi.release_date from movies_additional_info mi join movies m
on mi.id = m.id
where YEAR(release_date) between 1996 and 1999
order by runtime, id
limit 20;

#movie casting 

select concat(first_name," ", last_name) as full_name,
concat(reverse(last_name),length(last_name),"@cast.com") as email,
 (2022 - year(birthdate)) as age,  height 
 from actors 
 where id not in (select
ma.actor_id from movies_actors ma)
 order by height;

# international festival 

select c.name ,count(m.country_id) as movies_count from countries c join
movies m on c.id = m.country_id
group by m.country_id
having movies_count >=7
order by c.name desc;

# rating system 

select m.title,case when rating <=4 then "poor" when rating <=7 then "good"
else ("excellent") end as rating ,  case when has_subtitles =1 then "english"
else "-"end as subtitles, budget from movies m join movies_additional_info mi
on m.movie_info_id=mi.id
order by mi.budget desc;

#10
DELIMITER $$
create function  udf_actor_history_movies_count(full_name VARCHAR(50)) 
returns int
deterministic
begin
declare result int;
set result := (select count(g.name) as 'history_movies'
from actors a 
join movies_actors ma on a.id = ma.actor_id
join genres_movies gm on ma.movie_id=gm.movie_id
join genres g on g.id=gm.genre_id
where g.name = "History" and full_name = concat(a.first_name, " ", a.last_name)
group by g.name);
return result;
end$$
select udf_actor_history_movies_count('Stephan Lundberg') as 'history_movies'$$
#12
 create procedure udp_award_movie(movie_title varchar(50))
 begin
	update actors a
    join movies_actors ma on a.id = ma.actor_id
    join movies m on ma.movie_id = m.id
    set a.awards = a.awards+1
    where m.title = movie_title;
 end
 
 
 
 
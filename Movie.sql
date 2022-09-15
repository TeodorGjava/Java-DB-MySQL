/*id, director_name, notes*/
CREATE DATABASE Movies;
CREATE TABLE directors(
`id`INT PRIMARY KEY AUTO_INCREMENT,
`director_name` VARCHAR(255) NOT NULL,
`notes`TEXT
);
CREATE TABLE genres(
`id`INT PRIMARY KEY AUTO_INCREMENT,
`genre_name` VARCHAR(255) NOT NULL,
`notes`TEXT
);
CREATE TABLE categories(
`id`INT PRIMARY KEY AUTO_INCREMENT,
`category_name` VARCHAR(255) NOT NULL,
`notes`TEXT
)
CREATE TABLE movies(
`id`,
`title`,
`director_id`,
`copyright_year`,
`length`,
`genre_id`,
`category_id`,
`rating`,
`notes`
)
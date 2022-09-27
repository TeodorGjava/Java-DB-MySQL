use relations;
create table mountains(
`id` int primary key auto_increment,
`name` varchar(50) not null);

create table peaks(
`id` int primary key auto_increment,
`name` varchar(50) not null,
`mountain_id` int not null,
constraint fk_peaks_mountains
foreign key(`mountain_id`)
references mountains(`id`));
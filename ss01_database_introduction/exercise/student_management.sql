create database student_management;

use student_management;

create table student(
id int primary key not null,
`name` varchar(45) null,
age int null,
country varchar(45) null
);

create table class(
id int primary key not null,
`name` varchar(45) null
);

create table teacher(
id int primary key not null,
`name` varchar(45) null,
age int null,
country varchar(45) null
);
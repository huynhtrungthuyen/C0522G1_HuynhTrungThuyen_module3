drop database if exists user_management;
create database if not exists user_management;
use user_management;

create table users (
id int(3) primary key auto_increment,
`name` varchar(120) not null,
email varchar(220) not null,
country varchar(120)
);

insert into users (`name`, email, country)
values
('Le Dai Loi', 'thui.vy@codegym.vn', 'Viet Nam'),
('Tran Dang Quang Anh', 'null@gmail.com', 'Cambodia'),
('Dang Thi Thuy Tien', 'thuytien@gmail.com', 'China'),
('Vo Van Ty', 'ty2001@gmail.com', 'Thailand'),
('Ho Hai Hoc', 'simp.chua@gmail.com', 'Viet Nam');
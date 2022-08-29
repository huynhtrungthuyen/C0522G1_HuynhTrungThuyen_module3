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

DELIMITER $$
CREATE PROCEDURE find_all()
BEGIN
SELECT *
FROM users;
END$$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE update_user(user_name varchar(120), user_email varchar(120), user_country varchar(120), IN user_id INT)
BEGIN
update users 
set name = user_name, email = user_email, country = user_country
 where id = user_id;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE remove_user(IN user_id INT)
BEGIN
delete from users
where id = user_id;
END$$
DELIMITER ;
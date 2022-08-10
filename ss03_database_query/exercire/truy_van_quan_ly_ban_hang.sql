drop database if exists quan_ly_ban_hang;
create database quan_ly_ban_hang;

use quan_ly_ban_hang ;

create table customer(
id_customer int primary key auto_increment,
`name` varchar(50) not null,
age int not null
);

create table `order`(
id_order int primary key auto_increment,
`date` date not null,
total_price double,
id_customer int,
foreign key (id_customer) references customer(id_customer)
);

create table product(
id_product int primary key auto_increment,
`name` varchar(50) not null,
price double not null
);

create table order_detail(
quantity int,
id_order int,
id_product int,
primary key(id_order, id_product),
foreign key(id_order) references `order`(id_order),
foreign key(id_product) references product(id_product)
);

insert into customer(`name`, age)
values
('Minh Quan', 10),
('Ngoc Oanh', 20),
('Hong Ha', 50);

insert into `order`(id_customer, `date`, total_price)
values
(1, '2006-03-21', null),
(2, '2006-03-23', null),
(1, '2006-03-16', null);

insert into product(`name`, price)
values
('May Giat', 3),
('Tu Lanh', 5),
('Dieu Hoa', 7),
('Quat', 1),
('Bep Dien', 2);

insert into order_detail(id_order, id_product, quantity)
values
(1,1,3),
(1,3,7),
(1,4,2),
(2,1,1),
(3,1,8),
(2,5,4),
(2,3,3);

-- Hiển thị các thông tin gồm id_order, `date`, total_price của tất cả các hóa đơn trong bảng order.
select id_order, `date`, total_price
from `order`;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách.
select c.id_customer, c.`name`, c.age, p.`name`
from customer c
join `order` o on c.id_customer = o.id_customer
join order_detail od on o.id_order = od.id_order
join product p on od.id_product = p.id_product;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào.
select c.`name`
from customer c
where c.id_customer not in(
select c.id_customer
from customer c
join `order` o on c.id_customer = o.id_customer
join order_detail od on o.id_order = od.id_order
join product p on od.id_product = p.id_product);

select o.id_order, o.`date`, sum(od.quantity * p.price) as total_price
from `order` o
join order_detail od on o.id_order = od.id_order
join product p on od.id_product = p.id_product
group by o.id_order;
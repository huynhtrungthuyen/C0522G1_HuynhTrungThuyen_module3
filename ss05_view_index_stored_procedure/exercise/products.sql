drop database if exists demo;
create database demo;

use demo;

create table products (
    id                  int primary key auto_increment,
    product_code        int,
    product_name        varchar(45),
    product_price       double,
    product_amount      int,
    product_description text,
    product_status      bit default 1
);

insert into products (product_code, product_name, product_price, product_amount, product_description)
value 
(1, 'Nam Thận Bảo', 500000, 50, '1 người khỏe, 2 người vui.'),
(2, 'Cà phê lon', 20000, 100, 'Ngon hơn người yêu cũ.'),
(3, 'Durex vị Bánh trung thu', 69000, 69, 'Vì một Rằm tháng 8 ngập tràn yêu thương.'),
(4, 'Vàng mã', 50000, 30, 'Tháng cô hồn, sale 10% cho người có vong theo.'),
(5, 'Dầu ăn Toàn Phát', 15000, 10, 'Dầu ăn Toàn Phát, tan nát đời trai.');

explain select * from products where product_code = 3;

explain select * from products where product_name = 'Vàng mã' and product_price = 50000;

-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục).
alter table products add unique index i_product_code (product_code);

explain select * from products where product_code = 3;

--  Tạo Composite Index trên bảng products (sử dụng 2 cột product_name và product_price).
alter table products add index i_produce_name_price (product_name, product_price);

explain select * from products where product_name = 'Vàng mã' and product_price = 50000;

-- Tạo view lấy về các thông tin: product_code, product_name, product_price, product_status từ bảng products.
create view w_products as
select product_code, product_name, product_price, product_status
from products;

-- Tiến hành sửa đổi view.
update w_products set product_price = 40000 where product_name = 'Vàng mã';

select * from w_products;

-- tiến hành xoá view
drop view w_products;

-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product.
delimiter //
create procedure sp_get_info_products()
begin
    select * from products;
end // 
delimiter ;

call sp_get_info_products();

-- Tạo store procedure thêm một sản phẩm mới.
delimiter //
create procedure sp_add_product (in p_id int, in p_code int, in p_name varchar(45), in p_price int, in p_amount int, in p_desciption text, in p_status bit)
begin
    insert into products values (p_id, p_code, p_name, p_price, p_amount, p_desciption, p_status);
end //
delimiter ;

call sp_add_product(6, 6, 'Thanh long không hạt', 10000, 60, 'Đố bạn tìm ra hột.', 1);

call sp_get_info_products();

-- Tạo store procedure sửa thông tin sản phẩm theo id.
delimiter //
create procedure sp_set_produc_by_id (in id_set int, in product_name_update varchar(45))
begin
    update products set product_name = product_name_update where id = id_set;
end //
delimiter ;

call sp_set_produc_by_id(6, 'Thanh long không hột');

call sp_get_info_products();

-- Tạo store procedure xoá sản phẩm theo id.
delimiter //
create procedure sp_remove_produc_by_id (in id_delete int)
begin
    delete from products where id = id_delete;
end //
delimiter ;

call sp_remove_produc_by_id(6);

call sp_get_info_products();
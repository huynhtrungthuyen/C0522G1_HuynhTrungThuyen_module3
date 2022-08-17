use case_study_database;

-- 26. Tạo Trigger có tên tr_cap_nhat_hop_dong khi cập nhật ngày kết thúc hợp đồng, cần kiểm tra xem thời gian cập nhật có phù hợp hay không, 
-- với quy tắc sau: Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày. Nếu dữ liệu hợp lệ thì cho phép cập nhật, 
-- nếu dữ liệu không hợp lệ thì in ra thông báo “Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày” trên console của database.
-- Lưu ý: Đối với MySQL thì sử dụng SIGNAL hoặc ghi log thay cho việc ghi ở console.
drop table if exists lich_su_cap_nhat_hop_dong;
create table lich_su_cap_nhat_hop_dong(
ma_hop_dong int,
ngay_lam_hop_dong datetime,
ngay_ket_thuc_hop_dong_cu datetime,
ngay_ket_thuc_hop_dong_moi datetime,
ngay_cap_nhat datetime);

drop trigger if exists tr_cap_nhat_hop_dong;
delimiter //
create trigger tr_cap_nhat_hop_dong
before update on hop_dong for each row
begin
	if (timestampdiff(day, old.ngay_lam_hop_dong, new.ngay_ket_thuc) < 2) then
		signal sqlstate '45000'
		set message_text = 'Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày.';
        else
			insert into lich_su_cap_nhat_hop_dong
			values (old.ma_hop_dong, old.ngay_lam_hop_dong, old.ngay_ket_thuc, new.ngay_ket_thuc, now());
	end if;
end //
delimiter ;

update hop_dong set ngay_ket_thuc = '2022-08-18' where ma_hop_dong = 7;
select * from lich_su_cap_nhat_hop_dong;

select * from hop_dong;

-- 27a. Tạo Function func_dem_dich_vu: Đếm các dịch vụ đã được sử dụng với tổng tiền là > 2.000.000 VNĐ.
delimiter //
create function func_dem_dich_vu()
returns int
deterministic
begin
	return (select count(*)
		from (select sum(dv.chi_phi_thue) as tong_tien
		from hop_dong hd
		join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
		group by dv.ma_dich_vu
		having tong_tien > 2000000) as temp);
end //
delimiter ;

select func_dem_dich_vu() as so_luong;

-- 27b. Tạo Function func_tinh_thoi_gian_hop_dong: Tính khoảng thời gian dài nhất tính từ lúc bắt đầu làm hợp đồng đến lúc kết thúc hợp đồng 
-- mà khách hàng đã thực hiện thuê dịch vụ (lưu ý chỉ xét các khoảng thời gian dựa vào từng lần làm hợp đồng thuê dịch vụ, 
-- không xét trên toàn bộ các lần làm hợp đồng). Mã của khách hàng được truyền vào như là 1 tham số của function này.
delimiter //
create function func_tinh_thoi_gian_hop_dong(ma_kh int)
returns int
deterministic
begin
	return ifnull((select temp.so_ngay
		from (select max(timestampdiff(day, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc) + 1) as so_ngay, kh.ma_khach_hang
		from khach_hang kh
		join hop_dong hd on hd.ma_khach_hang = kh.ma_khach_hang
		group by kh.ma_khach_hang) as temp
		where temp.ma_khach_hang = ma_kh), 0);	
end //
delimiter ;

select func_tinh_thoi_gian_hop_dong(10) as so_ngay_lam_hop_dong_dai_nhat;

-- 28. Tạo Stored Procedure sp_xoa_dich_vu_va_hd_room để tìm các dịch vụ được thuê bởi khách hàng với loại dịch vụ là “Room” 
-- từ đầu năm 2015 đến hết năm 2019 để xóa thông tin của các dịch vụ đó (tức là xóa các bảng ghi trong bảng dich_vu) 
-- và xóa những hop_dong sử dụng dịch vụ liên quan (tức là phải xóa những bản ghi trong bảng hop_dong) và những bản liên quan khác.
delimiter //
create procedure sp_xoa_dich_vu_va_hd_room()
begin
	update dich_vu set is_delete = 1 where ma_dich_vu in (
		select temp.ma_dich_vu
		from (select dv.ma_dich_vu, hd.ma_hop_dong
		from dich_vu dv
		join hop_dong hd on hd.ma_dich_vu = dv.ma_dich_vu
		join loai_dich_vu ldv on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
		where ldv.ten_loai_dich_vu = 'Room' and (year(hd.ngay_lam_hop_dong) between 2015 and 2020)) as temp);
	update hop_dong set is_delete = 1 where ma_hop_dong in (
		select temp.ma_hop_dong
		from (select dv.ma_dich_vu, hd.ma_hop_dong
		from dich_vu dv
		join hop_dong hd on hd.ma_dich_vu = dv.ma_dich_vu
		join loai_dich_vu ldv on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
		where ldv.ten_loai_dich_vu = 'Room' and (year(hd.ngay_lam_hop_dong) between 2015 and 2020)) as temp);
end //
delimiter ;

call sp_xoa_dich_vu_va_hd_room();

select * from dich_vu;
select * from hop_dong;
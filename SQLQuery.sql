alter proc rl_sinhvien
@masv varchar(12)
as
begin
	select MA_SINH_VIEN, HO_LOT+' '+TEN as hoten, NGAY_SINH, LOP, NOI_SINH 
	from D_HO_SO_SINH_VIEN where MA_SINH_VIEN=@masv and ThoiHoc=0 and TamNgung=0
end

ALTER proc [dbo].[getKy]
as
begin
	select * from S_KY_HOC where Ky_RenLuyen=1 order by MA_KY_HOC desc
end

create proc rl_insert_RL_PhieuDiem
 @Ma_SInh_Vien varchar(12),
 @Ky_Hoc varchar(3),
 @T1 varchar(5),
 @T11 varchar(5),
 @T2 varchar(5),
 @T21 varchar(5),
 @T22 varchar(5),
 @T23 varchar(5),
 @T24 varchar(5),
 @T25 varchar(5),
 @T3 varchar(5),
 @T31 varchar(5),
 @T32 varchar(5),
 @T33 varchar(5),
 @T34 varchar(5),
 @T35 varchar(5),
 @T4 varchar(5),
 @T41 varchar(5),
 @T42 varchar(5),
 @T43 varchar(5),
 @T44 varchar(5),
 @T5TTKy varchar(5)
as
begin
	declare @dem int
	set @dem = (select count(Ma_SInh_Vien) from RL_PhieuDiem where Ma_SInh_Vien=@Ma_SInh_Vien and Ky_Hoc=@Ky_Hoc)
	if(@dem=0)
	begin
		INSERT INTO RL_PhieuDiem(Ma_SInh_Vien, Ky_Hoc, T1, T11, T2, T21, T22, T23, T24, T25, T3, T31, T32, T33
		, T34, T35, T4, T41, T42, T43, T44, T5TTKy)
		VALUES(@Ma_SInh_Vien, @Ky_Hoc, @T1, @T11, @T2, @T21, @T22, @T23, @T24, @T25, @T3, @T31, @T32, @T33, @T34, @T35 
		, @T4, @T41, @T42, @T43, @T44, @T5TTKy)
	end
	if(@dem>0)
	begin
		update RL_PhieuDiem set T1=@T1, T11=@T11, T2=@T2, T21=@T21, T22=@T22, 
		T23=@T23, T24=@T24, T25=@T25, T3=@T3, T31=@T31, T32=@T32, T33=@T33, T34=@T34, T35=@T35, 
		T4=@T4, T41=@T41, T42=@T42, T43=@T43, T44=@T44, T5TTKy=@T5TTKy
		where Ma_SInh_Vien=@Ma_SInh_Vien and Ky_Hoc = @Ky_Hoc
	end
end

create proc rl_get_PhieuRenLuyen
@masv varchar(12),
@Ky_Hoc varchar(3)
as
begin
	select * from RL_PhieuDiem 
	where Ma_SInh_Vien=@masv and Ky_Hoc=@Ky_Hoc
end

create proc rl_checkVang
@masv varchar(12),
@kyhoc varchar(3)
as
begin
	select Ma_Sinh_Vien, COUNT(Ma_Sinh_Vien) as solan  from D_DIEM_DANH_SINH_VIEN 
	where Ma_Sinh_Vien = @masv and MA_KY_HOC = @kyhoc
	group by Ma_Sinh_Vien, NgayDiemdanh
end
--exec rl_checkVang '221183404104','232'
alter proc rl_get_DIEM_TH_RENLUYEN
@masv varchar(12)
as
begin
	select * from RL_DIEM_TH_RENLUYEN where MA_SINH_VIEN = @masv
end

create proc rl_insert_DIEM_TH_RENLUYEN
@MA_SINH_VIEN varchar(12),
@HOTEN nvarchar(100),
@NGAY_SINH nvarchar(10),
@LOP nvarchar(20),
@KY_HOC varchar(3),
@NOIDUNGDG nvarchar(150),
@DIEMTC nvarchar(4)
as
begin
	declare @dem int
	set @dem = (select count(MA_SINH_VIEN) from RL_DIEM_TH_RENLUYEN where MA_SINH_VIEN=@MA_SINH_VIEN and KY_HOC=@KY_HOC)
	if(@dem=0)
	begin
		INSERT INTO RL_DIEM_TH_RENLUYEN(MA_SINH_VIEN, HOTEN, NGAY_SINH, LOP, KY_HOC, NOIDUNGDG, DIEMTC, NGAYTAO)
		VALUES(@MA_SINH_VIEN, @HOTEN, @NGAY_SINH, @LOP, @KY_HOC, @NOIDUNGDG, @DIEMTC, GETDATE())
	end
	if(@dem>0)
	begin
		update RL_DIEM_TH_RENLUYEN set DIEMTC = @DIEMTC where MA_SINH_VIEN=@MA_SINH_VIEN and KY_HOC=@KY_HOC
	end
end
----
alter proc rl_getCanBoLopCham
@masv varchar(12)
as
begin
	SELECT id, Lop, Ky_Hoc, NamHoc, DotDanhGia, NgayBatDau, NgayKhoa,TrangThai,
	(case TrangThai when 0 then N'Chưa duyệt' when 1 then N'Đã duyệt' else N'Đã khóa' end) as TrangThais , NguoiDuyet
	FROM   RL_DSLopCham
	WHERE NguoiDuyet = @masv
end
---
alter proc rl_KhoiTaoCham
@KY_HOC varchar(3),
@NOIDUNGDG nvarchar(150),
@Khoa varchar(5)
as
begin
	INSERT INTO RL_DIEM_TH_RENLUYEN(MA_SINH_VIEN,HO_LOT, TEN,NGAY_SINH,LOP,KY_HOC,NOIDUNGDG,NGAYTAO)
	select MA_SINH_VIEN, HO_LOT, TEN, NGAY_SINH, LOP, @KY_HOC, @NOIDUNGDG,GETDATE() from D_HO_SO_SINH_VIEN 
	where RIGHT(lop,2)=@Khoa and ThoiHoc=0 and TamNgung=0 and 
	MA_SINH_VIEN not in (select MA_SINH_VIEN from RL_DIEM_TH_RENLUYEN where KY_HOC=@KY_HOC)
end

--exec rl_KhoiTaoCham '241',N'Chấm điểm rèn luyện kỳ 1 năm học 2024-2025','22'
alter proc rl_GetLopCham
@id int
as
begin
	declare @lop varchar(20), @kyhoc varchar(3)
	set @lop = (select Lop from RL_DSLopCham where id=@id)
	set @kyhoc = (select Ky_hoc from RL_DSLopCham where id=@id)
	select HO_LOT+' '+TEN as HOTEN, * from RL_DIEM_TH_RENLUYEN where LOP = @lop and KY_HOC= @kyhoc order by TEN, HO_LOT
end

--exec rl_GetLopCham 54
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
--Insert bang phiếu chấm điểm sv
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
		INSERT INTO RL_PhieuDiem(Ma_SInh_Vien, Ky_Hoc, T1, T11, T2, T21, T22, T23, T24, T25, T3, T31, T32, T33,
		T34, T35, T4, T41, T42, T43, T44, T5TTKy)
		VALUES(@Ma_SInh_Vien, @Ky_Hoc, @T1, @T11, @T2, @T21, @T22, @T23, @T24, @T25, @T3, @T31, @T32, @T33, @T34, @T35,
		@T4, @T41, @T42, @T43, @T44, @T5TTKy)
	end
	if(@dem>0)
	begin
		update RL_PhieuDiem set T1=@T1, T11=@T11, T2=@T2, T21=@T21, T22=@T22, 
		T23=@T23, T24=@T24, T25=@T25, T3=@T3, T31=@T31, T32=@T32, T33=@T33, T34=@T34, T35=@T35, 
		T4=@T4, T41=@T41, T42=@T42, T43=@T43, T44=@T44, T5TTKy=@T5TTKy
		where Ma_SInh_Vien=@Ma_SInh_Vien and Ky_Hoc = @Ky_Hoc
	end
end
---update vào bảng RL_PhieuDiem
create proc rl_UpdateLT_RL_PhieuDiem
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
	begin
		update RL_PhieuDiem set LTT1=@T1, LTT11=@T11, LTT2=@T2, LTT21=@T21, LTT22=@T22, 
		LTT23=@T23, LTT24=@T24, LTT25=@T25, LTT3=@T3, LTT31=@T31, LTT32=@T32, LTT33=@T33, LTT34=@T34, LTT35=@T35, 
		LTT4=@T4, LTT41=@T41, LTT42=@T42, LTT43=@T43, LTT44=@T44, LTT5TTKy=@T5TTKy
		where Ma_SInh_Vien=@Ma_SInh_Vien and Ky_Hoc = @Ky_Hoc
	end
end
---Lấy phiếu rèn luyện của sinh viên
alter proc rl_get_PhieuRenLuyen
@masv varchar(12),
@Ky_Hoc varchar(3)
as
begin
	declare @tthai int
	set @tthai = (select TrangThai from RL_DIEM_TH_RENLUYEN where Ma_SInh_Vien=@masv and Ky_Hoc=@Ky_Hoc)
	select *, @tthai as TrangThai from RL_PhieuDiem 
	where Ma_SInh_Vien=@masv and Ky_Hoc=@Ky_Hoc
end
--exec rl_get_PhieuRenLuyen '221183404104','241'
--Kiểm tra vắng học
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
--Lấy danh sách bảng RL_DIEM_TH_RENLUYEN
alter proc rl_get_DIEM_TH_RENLUYEN
@masv varchar(12)
as
begin
	select * from RL_DIEM_TH_RENLUYEN where MA_SINH_VIEN = @masv
end

ALTER proc rl_insert_DIEM_TH_RENLUYEN
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
		INSERT INTO RL_DIEM_TH_RENLUYEN(MA_SINH_VIEN, HO_LOT, NGAY_SINH, LOP, KY_HOC, NOIDUNGDG, DIEMTC, NGAYTAO)
		VALUES(@MA_SINH_VIEN, @HOTEN, @NGAY_SINH, @LOP, @KY_HOC, @NOIDUNGDG, @DIEMTC, GETDATE())
	end
	if(@dem>0)
	begin
		update RL_DIEM_TH_RENLUYEN set DIEMTC = @DIEMTC, TrangThai=1 where MA_SINH_VIEN=@MA_SINH_VIEN and KY_HOC=@KY_HOC
	end
end
----
alter proc rl_UpdateLT_DIEM_TH_RENLUYEN
@MA_SINH_VIEN varchar(12),
@KY_HOC varchar(3),
@DIEMLOP nvarchar(4)
as
begin
	begin
		update RL_DIEM_TH_RENLUYEN set DIEMLOP = @DIEMLOP, TrangThai=2 where MA_SINH_VIEN=@MA_SINH_VIEN and KY_HOC=@KY_HOC
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

---Khởi tạo danh sách sinh viên tổng hợp vào bảng RL_DIEM_TH_RENLUYEN
alter proc rl_KhoiTaoCham
@KY_HOC varchar(3),
@NOIDUNGDG nvarchar(max),
@Khoa varchar(5),
@NgayBatDau varchar(10),
@NgayKhoa varchar(10)
as
begin
	declare @tennamhoc nvarchar(200)
	set @tennamhoc = (select TEN_KY_HOC from S_KY_HOC where MA_KY_HOC=@KY_HOC)
	--khơi tạo bảng RL_DIEM_TH_RENLUYEN
	INSERT INTO RL_DIEM_TH_RENLUYEN(MA_SINH_VIEN,HO_LOT, TEN,NGAY_SINH,LOP,KY_HOC,NOIDUNGDG,NGAYTAO)
	select MA_SINH_VIEN, HO_LOT, TEN, NGAY_SINH, LOP, @KY_HOC, @NOIDUNGDG,GETDATE() from D_HO_SO_SINH_VIEN 
	where RIGHT(lop,2)=@Khoa and ThoiHoc=0 and TamNgung=0 and 
	MA_SINH_VIEN not in (select MA_SINH_VIEN from RL_DIEM_TH_RENLUYEN where KY_HOC=@KY_HOC)
	--Khởi tạo bảng RL_DSLopCham
	Insert into RL_DSLopCham(Lop, DotDanhGia, Ky_Hoc, NamHoc, NgayBatDau, NgayKhoa, TrangThai, magvcn, NguoiDuyet)
	select LOP, @NOIDUNGDG, @KY_HOC, @tennamhoc, @NgayBatDau, @NgayKhoa, 0, Ma_giao_vien, Ma_giao_vien
	from S_DANH_MUC_LOP where KHOA_HOC=@Khoa and Lop not in (select Lop from RL_DSLopCham where KY_HOC=@KY_HOC)
	--Khởi tạo bảng RL_PhieuDiem
	INSERT INTO RL_PhieuDiem(Ma_SInh_Vien, Ky_Hoc)
	select MA_SINH_VIEN, @KY_HOC from D_HO_SO_SINH_VIEN 
	where RIGHT(lop,2)=@Khoa and ThoiHoc=0 and TamNgung=0 and MA_SINH_VIEN not in (select Ma_SInh_Vien from RL_PhieuDiem where KY_HOC=@KY_HOC)
end
--exec rl_KhoiTaoCham '241',N'Chấm điểm rèn luyện kỳ 1 năm học 2024-2025','22'

ALTER proc [dbo].[rl_GetLopCham]
@id int
as
begin
	declare @lop varchar(20), @kyhoc varchar(3)
	set @lop = (select Lop from RL_DSLopCham where id=@id)
	set @kyhoc = (select Ky_hoc from RL_DSLopCham where id=@id)
	select HO_LOT+' '+TEN as HOTEN, MA_SINH_VIEN, HO_LOT, TEN, NGAY_SINH, rl.LOP,KY_HOC, (case RIGHT(KY_HOC,1) when 1 then 'I' else 'II' end) as HK, 
	NOIDUNGDG, TEN_KY_HOC, TenKhoa,
	DIEMTC, DIEMLOP, 	DIEMKHOA,	DIEMCTCT, NGAYTAO, XEP_LOAI, TrangThai
	from RL_DIEM_TH_RENLUYEN RL inner join S_KY_HOC k on RL.KY_HOC=k.MA_KY_HOC
	inner join S_DANH_MUC_LOP l on RL.LOP=l.Lop
	inner join S_DANH_MUC_KHOA khoa on l.Khoa=khoa.MaKhoa
	where rl.LOP = @lop and KY_HOC= @kyhoc order by TEN, HO_LOT
end

--exec rl_GetLopCham 54

---Khoa chấm
alter proc check_DiemHT
@masv varchar(12),
@ky varchar(12)
as
begin
	declare @duoi7 int, @diemF int
	-- đểm dưới 7
	set @duoi7 = (select COUNT(DIEMTB) from CQ_INLOPHOCPHAN d inner join D_HO_SO_SINH_VIEN h on d.MA_SINH_VIEN = h.MA_SINH_VIEN
	where MA_KY_HOC = @ky and (CONVERT(float, DIEMTB, 2) between 4 and 6.9)
	and TamNgung = 0 and ThoiHoc = 0 and h.MA_SINH_VIEN=@masv)
	-- số điểm F
	set @diemF = (select COUNT(DIEMTB) from CQ_INLOPHOCPHAN d inner join D_HO_SO_SINH_VIEN h on d.MA_SINH_VIEN = h.MA_SINH_VIEN
	where MA_KY_HOC = @ky and CONVERT(float, DIEMTB, 2)< 4 
	and TamNgung = 0 and ThoiHoc = 0 and h.MA_SINH_VIEN=@masv)
	---trung bình điểm 4 
	declare @diemtb varchar(5), @t12 varchar(5), @t121 varchar(5), @t122 varchar(5), @t123 varchar(5), @t124 varchar(5), @t125 varchar(5), @t13 varchar(5), 
	@t131 varchar(5), @t132 varchar(5)
	set @diemtb = (SELECT [dbo].[DTB4](@ky,MA_SINH_VIEN) FROM   D_HO_SO_SINH_VIEN
	WHERE  (ThoiHoc = 0) AND (TamNgung = 0) and MA_SINH_VIEN=@masv)
	--- lấy điểm cá nhân
	declare @diemlop varchar(5)
	set @diemlop = (select LTT5TTKy from RL_PhieuDiem where Ma_SInh_Vien=@masv and Ky_Hoc=@ky)
	----
	if(CONVERT(float, @diemtb)>=3.6)
	begin
		set @t121 = 15
		set @t12 = 15
	end
	else if(CONVERT(float, @diemtb)>=3.2)
	begin
		set @t122 = 13
		set @t12 = 13
	end
	else if(CONVERT(float, @diemtb)>=2.5)
	begin
		set @t123 = 11
		set @t12 = 11
	end
	else if(CONVERT(float, @diemtb)>=2.0)
	begin
		set @t124 = 9
		set @t12 = 9
	end
	else if(CONVERT(float, @diemtb)<=2)
	begin
		set @t124 = 7
		set @t12 = 7
	end
	if(@duoi7=0)
	begin
		set @t13 = 5
		set @t131 = 5
	end
	else if(@duoi7>0)
	begin
		set @t13 = 0
		set @t131 = 0
	end
	if(@diemF=0)
	begin
		set @t13 = 3
		set @t132 = 3
	end
	else if(@diemF>0)
	begin
		set @t13 = 0
		set @t132 = 0
	end
	declare @tong varchar(5)
	set @tong = CONVERT(float, @t12)+CONVERT(float,@t13)+ CONVERT(float,@diemlop)
	update RL_PhieuDiem set T12=@t12, T121=@t121, T122=@t122, T123=@t123, T124=@t124, T125=@t125, 
	T13=@t13, T131=@t131, T132=@t132, TongKhoa=@tong, TBD4=@diemtb, DIEMD7=@duoi7, DIEMF=@diemF
	where Ma_SInh_Vien=@masv and Ky_Hoc=@ky
	update RL_DIEM_TH_RENLUYEN set DIEMKHOA = @tong where MA_SINH_VIEN=@masv and Ky_Hoc=@ky
	print @tong
	print @t12
	print @t13
end
--exec check_DiemHT '221183404104','241'
---Khoa chấm điểm theo lớp
alter proc rl_KhoaCham
@khoa varchar(4),
@Ky varchar(3)
as
begin
	DECLARE @MA_SINH_VIEN nvarchar(12)
	DECLARE MSV_Cursorr CURSOR FOR select rl.Ma_Sinh_Vien From RL_PhieuDiem rl
	inner join D_HO_SO_SINH_VIEN hs on rl.Ma_SInh_Vien = hs.MA_SINH_VIEN
	where Ky_Hoc=@ky and RIGHT(hs.LOP,2)=@khoa
	----
	OPEN MSV_Cursorr 
	FETCH NEXT FROM MSV_Cursorr INTO @MA_SINH_VIEN
	WHILE @@FETCH_STATUS=0
	BEGIN
	execute [dbo].[check_DiemHT]@MA_SINH_VIEN, @Ky
	FETCH NEXT FROM MSV_Cursorr INTO @MA_SINH_VIEN
	END
	CLOSE MSV_Cursorr
	DEALLOCATE MSV_Cursorr
end
--exec rl_KhoaCham '22', '241'
-- lấy khóa học
alter proc rl_getKhoa
as
begin
	select top(5) * from S_KHOA_HOC order by KHOA_HOC desc
end
----Lấy danh sách lớp sau khi chấm
create proc rl_getDSKhoaCham
@ky varchar(3),
@khoa varchar(2)
as
begin
	select pd.MA_SINH_VIEN, HO_LOT+' '+TEN as HOTEN, LOP, NGAY_SINH, T5TTKy, LTT5TTKy, 
	TongKhoa, T12, T13, TBD4, DIEMD7, DIEMF
	from RL_PhieuDiem pd inner join D_HO_SO_SINH_VIEN hs on pd.Ma_SInh_Vien=hs.MA_SINH_VIEN
	where Ky_Hoc=@ky and RIGHT(lop,2)= @khoa
	order by lop, ten, HO_LOT
end
--exec rl_getDSKhoaCham '241','22'
----
CREATE TABLE [dbo].[RL_DIEM_TH_KY_RENLUYEN](
	[MA_SINH_VIEN] [nvarchar](12) NOT NULL,
	[KY1] [nvarchar](4) NULL,
	[KY2] [nvarchar](4) NULL,
	[KY3] [nvarchar](4) NULL,
	[KY4] [nvarchar](4) NULL,
	[KY5] [nvarchar](4) NULL,
	[KY6] [nvarchar](4) NULL,
	[XEP_LOAI] [int] NULL,
	[TrangThai] [int] NULL
)
--- Lấy danh sách lớp
create proc rl_getLop
@ky varchar(3),
@khoa varchar(2)
as
begin
	select * from RL_DSLopCham where Ky_Hoc=@ky and right(lop, 2)=@khoa
end
--- lấy danh sách lớp kế hoạch
alter proc rl_getLopKH
@ky varchar(3),
@khoa varchar(2)
as
begin
	if(@khoa='1')
	begin
		select id, Lop, Ky_Hoc, NamHoc, DotDanhGia, NgayBatDau, NgayKhoa, TrangThai, NguoiDuyet, SoSV, magvcn, HO_LOT, TEN, TRIM(HO_LOT)+' '+TRIM(TEN) as HOTEN 
		from RL_DSLopCham l inner join S_GIAO_VIEN gv on l.magvcn=gv.MA_GIAO_VIEN
		where Ky_Hoc=@ky-- and (right(lop, 2)=@khoa OR right(lop, 2)='1')
		order by Lop
	end
	else
	begin
		select id, Lop, Ky_Hoc, NamHoc, DotDanhGia, NgayBatDau, NgayKhoa, TrangThai, NguoiDuyet, SoSV, magvcn, HO_LOT, TEN, TRIM(HO_LOT)+' '+TRIM(TEN) as HOTEN 
		from RL_DSLopCham l inner join S_GIAO_VIEN gv on l.magvcn=gv.MA_GIAO_VIEN
		where Ky_Hoc=@ky and right(lop, 2)=@khoa order by RIGHT(lop, 2), Lop
	end
end
--exec rl_getLopKH '241','1'
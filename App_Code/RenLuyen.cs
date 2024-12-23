﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for RenLuyen
/// </summary>
public class RenLuyen
{
    public static string CS = ConfigurationManager.ConnectionStrings["cdktkh_ConnStr"].ConnectionString;
    public SqlConnection conn = new SqlConnection(CS);
    public SqlDataAdapter da = new SqlDataAdapter();
    public SqlCommand cmd = new SqlCommand();
    //Lấy danh sách kỳ
    public DataTable getKy()
    {
        cmd = new SqlCommand("getKy", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        conn.Open();
        cmd.ExecuteNonQuery();
        da = new SqlDataAdapter();
        da.SelectCommand = cmd;
        DataTable dtb = new DataTable();
        da.Fill(dtb);
        conn.Close();
        return dtb;
    }
    //Lấy danh sách khoa chuyên môn
    public DataTable getKhoaChuyenMon()
    {
        cmd = new SqlCommand("rl_getKhoaChuyenMon", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        conn.Open();
        cmd.ExecuteNonQuery();
        da = new SqlDataAdapter();
        da.SelectCommand = cmd;
        DataTable dtb = new DataTable();
        da.Fill(dtb);
        conn.Close();
        return dtb;
    }
    //Lấy danh sách khóa nhập học
    public DataTable rl_getKhoa()
    {
        cmd = new SqlCommand("rl_getKhoa", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        conn.Open();
        cmd.ExecuteNonQuery();
        da = new SqlDataAdapter();
        da.SelectCommand = cmd;
        DataTable dtb = new DataTable();
        da.Fill(dtb);
        conn.Close();
        return dtb;
    }
    //Lấy thông tin sinh viên
    public DataTable rl_sinhvien(string user)
    {
        cmd = new SqlCommand("rl_sinhvien", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@masv", SqlDbType.NVarChar, 12);
        cmd.Parameters["@masv"].Value = user;
        conn.Open();
        da = new SqlDataAdapter();
        da.SelectCommand = cmd;
        DataTable dtb = new DataTable();
        da.Fill(dtb);
        conn.Close();
        return dtb;
    }
    //Lấy lớp
    public DataTable rl_getLop(string ky, int khoa, string makhoa)
    {
        cmd = new SqlCommand("rl_getLop", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@ky", SqlDbType.NVarChar, 3);
        cmd.Parameters.Add("@khoa", SqlDbType.Int);
        cmd.Parameters.Add("@makhoa", SqlDbType.VarChar, 3);
        cmd.Parameters["@ky"].Value = ky;
        cmd.Parameters["@khoa"].Value = khoa;
        cmd.Parameters["@makhoa"].Value = makhoa;
        conn.Open();
        da = new SqlDataAdapter();
        da.SelectCommand = cmd;
        DataTable dtb = new DataTable();
        da.Fill(dtb);
        conn.Close();
        return dtb;
    }
    //Lấy ds lớp kế hoacgh
    public DataTable rl_getLopKH(string ky, string khoa)
    {
        cmd = new SqlCommand("rl_getLopKH", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@ky", SqlDbType.NVarChar, 3);
        cmd.Parameters.Add("@khoa", SqlDbType.VarChar, 2);
        cmd.Parameters["@ky"].Value = ky;
        cmd.Parameters["@khoa"].Value = khoa;
        conn.Open();
        da = new SqlDataAdapter();
        da.SelectCommand = cmd;
        DataTable dtb = new DataTable();
        da.Fill(dtb);
        conn.Close();
        return dtb;
    }
    //Lấy thông tin lớp duyệt
    public DataTable rl_dsLopDuyet(string user)
    {
        cmd = new SqlCommand("rl_getCanBoLopCham", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@masv", SqlDbType.NVarChar, 12);
        cmd.Parameters["@masv"].Value = user;
        conn.Open();
        da = new SqlDataAdapter();
        da.SelectCommand = cmd;
        DataTable dtb = new DataTable();
        da.Fill(dtb);
        conn.Close();
        return dtb;
    }
    //Lấy danh sách lớp duyệt
    public DataTable rl_GetLopCham(int id)
    {
        cmd = new SqlCommand("rl_GetLopCham", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@id", SqlDbType.Int);
        cmd.Parameters["@id"].Value = id;
        conn.Open();
        da = new SqlDataAdapter();
        da.SelectCommand = cmd;
        DataTable dtb = new DataTable();
        da.Fill(dtb);
        conn.Close();
        return dtb;
    }
    //Lấy phiếu chậm điểm rèn luyện
    public DataTable rl_get_PhieuRenLuyen(string user, string ky)
    {
        cmd = new SqlCommand("rl_get_PhieuRenLuyen", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@masv", SqlDbType.VarChar, 12);
        cmd.Parameters.Add("@Ky_Hoc", SqlDbType.VarChar, 3);
        cmd.Parameters["@masv"].Value = user;
        cmd.Parameters["@Ky_Hoc"].Value = ky;
        conn.Open();
        da = new SqlDataAdapter();
        da.SelectCommand = cmd;
        DataTable dtb = new DataTable();
        da.Fill(dtb);
        conn.Close();
        return dtb;
    }
    //Lấy tổng hợp điểm rèn luyện
    public DataTable rl_get_DIEM_TH_RENLUYEN(string user)
    {
        cmd = new SqlCommand("rl_get_DIEM_TH_RENLUYEN", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@masv", SqlDbType.VarChar, 12);
        cmd.Parameters["@masv"].Value = user;
        conn.Open();
        da = new SqlDataAdapter();
        da.SelectCommand = cmd;
        DataTable dtb = new DataTable();
        da.Fill(dtb);
        conn.Close();
        return dtb;
    }
    //
    //Lấy kế hoạch chấm điểm
    public DataTable rl_get_kh_cham_sv(string masv, string ky)
    {
        cmd = new SqlCommand("rl_get_kh_cham_sv", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@masv", SqlDbType.VarChar, 12);
        cmd.Parameters.Add("@ky", SqlDbType.VarChar, 3);
        cmd.Parameters["@masv"].Value = masv;
        cmd.Parameters["@ky"].Value = ky;
        conn.Open();
        da = new SqlDataAdapter();
        da.SelectCommand = cmd;
        DataTable dtb = new DataTable();
        da.Fill(dtb);
        conn.Close();
        return dtb;
    }
    //Kiểm tra số lần vắng
    public DataTable rl_checkVang(string user, string ky)
    {
        cmd = new SqlCommand("rl_checkVang", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@masv", SqlDbType.VarChar, 12);
        cmd.Parameters.Add("@kyhoc", SqlDbType.VarChar, 3);
        cmd.Parameters["@masv"].Value = user;
        cmd.Parameters["@kyhoc"].Value = ky;
        conn.Open();
        da = new SqlDataAdapter();
        da.SelectCommand = cmd;
        DataTable dtb = new DataTable();
        da.Fill(dtb);
        conn.Close();
        return dtb;
    }
    //Hàm insert nhật ký lên lớp
    public int rl_insert_RL_PhieuDiem(string Ma_SInh_Vien, string Ky_Hoc, string T1, string T11, string T2,
 string T21, string T22, string T23, string T24, string T25, string T3, string T31, string T32, string T33,
 string T34, string T35, string T4, string T41, string T42, string T43, string T44, string T5TTKy)
    {
        int kq = 0;
        cmd = new SqlCommand("rl_insert_RL_PhieuDiem", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@Ma_SInh_Vien", SqlDbType.NVarChar, 12);
        cmd.Parameters.Add("@Ky_Hoc", SqlDbType.NVarChar, 3);
        cmd.Parameters.Add("@T1", SqlDbType.VarChar, 5);
        cmd.Parameters.Add("@T11", SqlDbType.VarChar, 5);
        cmd.Parameters.Add("@T2", SqlDbType.VarChar,5);
        cmd.Parameters.Add("@T21", SqlDbType.VarChar, 5);
        cmd.Parameters.Add("@T22", SqlDbType.VarChar,5);
        cmd.Parameters.Add("@T23", SqlDbType.VarChar,5);
        cmd.Parameters.Add("@T24", SqlDbType.VarChar, 5);
        cmd.Parameters.Add("@T25", SqlDbType.VarChar,5);
        cmd.Parameters.Add("@T3", SqlDbType.VarChar, 5);
        cmd.Parameters.Add("@T31", SqlDbType.VarChar,5);
        cmd.Parameters.Add("@T32", SqlDbType.VarChar,5);
        cmd.Parameters.Add("@T33", SqlDbType.VarChar,5);
        cmd.Parameters.Add("@T34", SqlDbType.VarChar,5);
        cmd.Parameters.Add("@T35", SqlDbType.VarChar, 5);
        cmd.Parameters.Add("@T4", SqlDbType.VarChar,5);
        cmd.Parameters.Add("@T41", SqlDbType.VarChar, 5);
        cmd.Parameters.Add("@T42", SqlDbType.VarChar,5);
        cmd.Parameters.Add("@T43", SqlDbType.VarChar,5);
        cmd.Parameters.Add("@T44", SqlDbType.VarChar,5);
        cmd.Parameters.Add("@T5TTKy", SqlDbType.VarChar,5);
        cmd.Parameters["@Ma_SInh_Vien"].Value = Ma_SInh_Vien;
        cmd.Parameters["@Ky_Hoc"].Value = Ky_Hoc;
        cmd.Parameters["@T1"].Value = T1;
        cmd.Parameters["@T11"].Value = T11;
        cmd.Parameters["@T2"].Value = T2;
        cmd.Parameters["@T21"].Value = T21;
        cmd.Parameters["@T22"].Value = T22;
        cmd.Parameters["@T23"].Value = T23;
        cmd.Parameters["@T24"].Value = T24;
        cmd.Parameters["@T25"].Value = T25;
        cmd.Parameters["@T3"].Value = T3;
        cmd.Parameters["@T31"].Value = T31;
        cmd.Parameters["@T32"].Value = T32;
        cmd.Parameters["@T33"].Value = T33;
        cmd.Parameters["@T34"].Value = T34;
        cmd.Parameters["@T35"].Value = T35;
        cmd.Parameters["@T4"].Value = T4;
        cmd.Parameters["@T41"].Value = T41;
        cmd.Parameters["@T42"].Value = T42;
        cmd.Parameters["@T43"].Value = T43;
        cmd.Parameters["@T44"].Value = T44;
        cmd.Parameters["@T5TTKy"].Value = T5TTKy;
        conn.Open();
        kq = cmd.ExecuteNonQuery();
        conn.Close();
        return kq;
    }
    //Hàm update phiếu chấm điểm Lớp trưởng
    public int rl_UpdateLT_RL_PhieuDiem(string Ma_SInh_Vien, string Ky_Hoc, string T1, string T11, string T2,
 string T21, string T22, string T23, string T24, string T25, string T3, string T31, string T32, string T33,
 string T34, string T35, string T4, string T41, string T42, string T43, string T44, string T5TTKy)
    {
        int kq = 0;
        cmd = new SqlCommand("rl_UpdateLT_RL_PhieuDiem", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@Ma_SInh_Vien", SqlDbType.NVarChar, 12);
        cmd.Parameters.Add("@Ky_Hoc", SqlDbType.NVarChar, 3);
        cmd.Parameters.Add("@T1", SqlDbType.VarChar, 5);
        cmd.Parameters.Add("@T11", SqlDbType.VarChar, 5);
        cmd.Parameters.Add("@T2", SqlDbType.VarChar, 5);
        cmd.Parameters.Add("@T21", SqlDbType.VarChar, 5);
        cmd.Parameters.Add("@T22", SqlDbType.VarChar, 5);
        cmd.Parameters.Add("@T23", SqlDbType.VarChar, 5);
        cmd.Parameters.Add("@T24", SqlDbType.VarChar, 5);
        cmd.Parameters.Add("@T25", SqlDbType.VarChar, 5);
        cmd.Parameters.Add("@T3", SqlDbType.VarChar, 5);
        cmd.Parameters.Add("@T31", SqlDbType.VarChar, 5);
        cmd.Parameters.Add("@T32", SqlDbType.VarChar, 5);
        cmd.Parameters.Add("@T33", SqlDbType.VarChar, 5);
        cmd.Parameters.Add("@T34", SqlDbType.VarChar, 5);
        cmd.Parameters.Add("@T35", SqlDbType.VarChar, 5);
        cmd.Parameters.Add("@T4", SqlDbType.VarChar, 5);
        cmd.Parameters.Add("@T41", SqlDbType.VarChar, 5);
        cmd.Parameters.Add("@T42", SqlDbType.VarChar, 5);
        cmd.Parameters.Add("@T43", SqlDbType.VarChar, 5);
        cmd.Parameters.Add("@T44", SqlDbType.VarChar, 5);
        cmd.Parameters.Add("@T5TTKy", SqlDbType.VarChar, 5);
        cmd.Parameters["@Ma_SInh_Vien"].Value = Ma_SInh_Vien;
        cmd.Parameters["@Ky_Hoc"].Value = Ky_Hoc;
        cmd.Parameters["@T1"].Value = T1;
        cmd.Parameters["@T11"].Value = T11;
        cmd.Parameters["@T2"].Value = T2;
        cmd.Parameters["@T21"].Value = T21;
        cmd.Parameters["@T22"].Value = T22;
        cmd.Parameters["@T23"].Value = T23;
        cmd.Parameters["@T24"].Value = T24;
        cmd.Parameters["@T25"].Value = T25;
        cmd.Parameters["@T3"].Value = T3;
        cmd.Parameters["@T31"].Value = T31;
        cmd.Parameters["@T32"].Value = T32;
        cmd.Parameters["@T33"].Value = T33;
        cmd.Parameters["@T34"].Value = T34;
        cmd.Parameters["@T35"].Value = T35;
        cmd.Parameters["@T4"].Value = T4;
        cmd.Parameters["@T41"].Value = T41;
        cmd.Parameters["@T42"].Value = T42;
        cmd.Parameters["@T43"].Value = T43;
        cmd.Parameters["@T44"].Value = T44;
        cmd.Parameters["@T5TTKy"].Value = T5TTKy;
        conn.Open();
        kq = cmd.ExecuteNonQuery();
        conn.Close();
        return kq;
    }
    //Hàm insert bảng rl tổng hợp
    public int rl_insert_DIEM_TH_RENLUYEN(string Ma_SInh_Vien, string hoten, string ngaysinh, string lop, string ky,
 string noidung, string diemtc)
    {
        int kq = 0;
        cmd = new SqlCommand("rl_insert_DIEM_TH_RENLUYEN", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@MA_SINH_VIEN", SqlDbType.NVarChar, 12);
        cmd.Parameters.Add("@HOTEN", SqlDbType.NVarChar, 100);
        cmd.Parameters.Add("@NGAY_SINH", SqlDbType.VarChar, 10);
        cmd.Parameters.Add("@LOP", SqlDbType.VarChar, 20);
        cmd.Parameters.Add("@KY_HOC", SqlDbType.VarChar, 3);
        cmd.Parameters.Add("@NOIDUNGDG", SqlDbType.NVarChar, 150);
        cmd.Parameters.Add("@DIEMTC", SqlDbType.VarChar, 5);        
        cmd.Parameters["@MA_SINH_VIEN"].Value = Ma_SInh_Vien;
        cmd.Parameters["@HOTEN"].Value = hoten;
        cmd.Parameters["@NGAY_SINH"].Value = ngaysinh;
        cmd.Parameters["@LOP"].Value = lop;
        cmd.Parameters["@KY_HOC"].Value = ky;
        cmd.Parameters["@NOIDUNGDG"].Value = noidung;
        cmd.Parameters["@DIEMTC"].Value = diemtc;        
        conn.Open();
        kq = cmd.ExecuteNonQuery();
        conn.Close();
        return kq;
    }
    //Hàm insert bảng rl tổng hợp lớp trưởng
    public int rl_UpdateLT_DIEM_TH_RENLUYEN(string Ma_SInh_Vien, string ky, string diemlop)
    {
        int kq = 0;
        cmd = new SqlCommand("rl_UpdateLT_DIEM_TH_RENLUYEN", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@MA_SINH_VIEN", SqlDbType.NVarChar, 12);
        cmd.Parameters.Add("@KY_HOC", SqlDbType.VarChar, 3);
        cmd.Parameters.Add("@DIEMLOP", SqlDbType.VarChar, 5);
        cmd.Parameters["@MA_SINH_VIEN"].Value = Ma_SInh_Vien;
        cmd.Parameters["@KY_HOC"].Value = ky;
        cmd.Parameters["@DIEMLOP"].Value = diemlop;
        conn.Open();
        kq = cmd.ExecuteNonQuery();
        conn.Close();
        return kq;
    }
    //Hàm khoa thưc hiện chấm điểm mục 1.2 và 1.3
    public int rl_KhoaCham(string khoa, string ky, string makhoa)
    {
        int kq = 0;
        cmd = new SqlCommand("rl_KhoaCham", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@khoa", SqlDbType.VarChar, 4);
        cmd.Parameters.Add("@Ky", SqlDbType.VarChar, 3);
        cmd.Parameters.Add("@makhoa", SqlDbType.VarChar, 5);
        cmd.Parameters["@khoa"].Value = khoa;
        cmd.Parameters["@Ky"].Value = ky;
        cmd.Parameters["@makhoa"].Value = makhoa;
        conn.Open();
        kq = cmd.ExecuteNonQuery();
        conn.Close();
        return kq;
    }
    //Hàm phòng công tác chính trị tổng hợp
    public int rl_ctct_tonghop_theo_khoa(string khoa, string ky)
    {
        int kq = 0;
        cmd = new SqlCommand("rl_ctct_tonghop_theo_khoa", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@khoa", SqlDbType.VarChar, 4);
        cmd.Parameters.Add("@Ky", SqlDbType.VarChar, 3);
        cmd.Parameters["@khoa"].Value = khoa;
        cmd.Parameters["@Ky"].Value = ky;
        conn.Open();
        kq = cmd.ExecuteNonQuery();
        conn.Close();
        return kq;
    }
    //Lấy danh sách ctct chấm
    public DataTable rl_getDSCTCT_Cham(string ky, string khoa)
    {
        cmd = new SqlCommand("rl_getDsctctTongHop", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@ky", SqlDbType.VarChar, 3);
        cmd.Parameters.Add("@khoa", SqlDbType.VarChar, 2);
        cmd.Parameters["@ky"].Value = ky;
        cmd.Parameters["@khoa"].Value = khoa;
        conn.Open();
        da = new SqlDataAdapter();
        da.SelectCommand = cmd;
        DataTable dtb = new DataTable();
        da.Fill(dtb);
        conn.Close();
        return dtb;
    }
    //Lấy danh sách ctct chấm
    public DataTable rl_getDSCTCT_TongHop_TheoKhoa(string ky, string khoa, string makhoa)
    {
        cmd = new SqlCommand("rl_getDsctctTongHop_theokhao", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@ky", SqlDbType.VarChar, 3);
        cmd.Parameters.Add("@khoa", SqlDbType.VarChar, 2);
        cmd.Parameters.Add("@makhoa", SqlDbType.VarChar, 3);
        cmd.Parameters["@ky"].Value = ky;
        cmd.Parameters["@khoa"].Value = khoa;
        cmd.Parameters["@makhoa"].Value = makhoa;
        conn.Open();
        da = new SqlDataAdapter();
        da.SelectCommand = cmd;
        DataTable dtb = new DataTable();
        da.Fill(dtb);
        conn.Close();
        return dtb;
    }
    //Lấy danh sách khoa chấm
    public DataTable rl_getDSKhoaCham(string ky, string khoa, string makhoa)
    {
        cmd = new SqlCommand("rl_getDSKhoaCham", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@ky", SqlDbType.VarChar, 3);
        cmd.Parameters.Add("@khoa", SqlDbType.VarChar, 2);
        cmd.Parameters.Add("@makhoa", SqlDbType.VarChar, 5);
        cmd.Parameters["@ky"].Value = ky;
        cmd.Parameters["@khoa"].Value = khoa;
        cmd.Parameters["@makhoa"].Value = makhoa;
        conn.Open();
        da = new SqlDataAdapter();
        da.SelectCommand = cmd;
        DataTable dtb = new DataTable();
        da.Fill(dtb);
        conn.Close();
        return dtb;
    }
    //Hàm khởi tạo chấm điểm rèn luyện
    public int rl_KhoiTaoCham(string kyhoc, string noidung, string khoa, string ngaybd, string ngaykt, string ngaybdcvht, string ngayktcvht, string ngaybdkhoa, string ngayktkhoa)
    {
        int kq = 0;
        cmd = new SqlCommand("rl_KhoiTaoCham", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@KY_HOC", SqlDbType.VarChar, 3);
        cmd.Parameters.Add("@NOIDUNGDG", SqlDbType.NVarChar, int.MaxValue);
        cmd.Parameters.Add("@Khoa", SqlDbType.VarChar, 2);
        cmd.Parameters.Add("@NgayBatDau", SqlDbType.VarChar, 10);
        cmd.Parameters.Add("@NgayKhoa", SqlDbType.VarChar, 10);
        cmd.Parameters.Add("@NgayBDCVHT", SqlDbType.VarChar, 10);
        cmd.Parameters.Add("@NgayKTCVHT", SqlDbType.VarChar, 10);
        cmd.Parameters.Add("@NgayBDKhoa", SqlDbType.VarChar, 10);
        cmd.Parameters.Add("@NgayKTKhoa", SqlDbType.VarChar, 10);
        cmd.Parameters["@KY_HOC"].Value = kyhoc;
        cmd.Parameters["@NOIDUNGDG"].Value = noidung;
        cmd.Parameters["@Khoa"].Value = khoa;
        cmd.Parameters["@NgayBatDau"].Value = ngaybd;
        cmd.Parameters["@NgayKhoa"].Value = ngaykt;
        cmd.Parameters["@NgayBDCVHT"].Value = ngaybdcvht;
        cmd.Parameters["@NgayKTCVHT"].Value = ngayktcvht;
        cmd.Parameters["@NgayBDKhoa"].Value = ngaybdkhoa;
        cmd.Parameters["@NgayKTKhoa"].Value = ngayktkhoa;
        conn.Open();
        kq = cmd.ExecuteNonQuery();
        conn.Close();
        return kq;
    }
    //Lấy danh sách lớp theo khóa học
    public DataTable rl_getLop_KhoaHoc(string khoa)
    {
        cmd = new SqlCommand("rl_getLop_KhoaHoc", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@khoahoc", SqlDbType.VarChar, 2);
        cmd.Parameters["@khoahoc"].Value = khoa;
        conn.Open();
        da = new SqlDataAdapter();
        da.SelectCommand = cmd;
        DataTable dtb = new DataTable();
        da.Fill(dtb);
        conn.Close();
        return dtb;
    }
    //Lấy danh sách điểm tổng hợp theo lớp và theo khóa học
    public DataTable rl_getTonghop_ToanKhoa(string khoa, string lop)
    {
        cmd = new SqlCommand("rl_getTonghop_ToanKhoa", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@khoa", SqlDbType.VarChar, 2);
        cmd.Parameters.Add("@lop", SqlDbType.VarChar, 30);
        cmd.Parameters["@khoa"].Value = khoa;
        cmd.Parameters["@lop"].Value = lop;
        conn.Open();
        da = new SqlDataAdapter();
        da.SelectCommand = cmd;
        DataTable dtb = new DataTable();
        da.Fill(dtb);
        conn.Close();
        return dtb;
    }
}
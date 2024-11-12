using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RLCTCT_frm_DSLopDuyet : System.Web.UI.Page
{
    RenLuyen rl = new RenLuyen();
    string username = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        username = "221183404140";
        getky();
        get_dsDuyetLop();
    }
    //Hàm lấy lớp duyệt
    public void get_dsDuyetLop()
    {
        DataTable dtb = new DataTable();
        dtb = rl.rl_dsLopDuyet(username);
        grv_dsLopDuyet.DataSource = dtb;
        grv_dsLopDuyet.DataBind();        
    }
    //lấy kỳ chấm điểm
    public void getky()
    {
        DataTable dtb = new DataTable();
        dtb = rl.getKy();
        drl_Ky.DataSource = dtb;
        drl_Ky.DataTextField = "MA_KY_HOC";
        drl_Ky.DataTextField = "TEN_KY_HOC";
        drl_Ky.DataValueField = "MA_KY_HOC";
        drl_Ky.DataBind();
    }
    //Lấy thông tin phiếu chấm điểm
    public int get_Phieu(string masv, string ky)
    {
        int kq = 0;
        DataTable dtb = new DataTable();
        dtb = rl.rl_get_PhieuRenLuyen(masv, ky);
        if (dtb.Rows.Count > 0)
        {
            int tthai = int.Parse(dtb.Rows[0]["TrangThai"].ToString());
            if (tthai == 1 || tthai == 2)
            {
                t1.Text = dtb.Rows[0]["T1"].ToString();
                t11.Text = dtb.Rows[0]["T11"].ToString();
                t12.Text = dtb.Rows[0]["T12"].ToString();
                t121.Text = dtb.Rows[0]["T121"].ToString();
                t122.Text = dtb.Rows[0]["T122"].ToString();
                t123.Text = dtb.Rows[0]["T123"].ToString();
                t124.Text = dtb.Rows[0]["T124"].ToString();
                t125.Text = dtb.Rows[0]["T125"].ToString();
                t13.Text = dtb.Rows[0]["T13"].ToString();
                t131.Text = dtb.Rows[0]["T131"].ToString();
                t132.Text = dtb.Rows[0]["T132"].ToString();
                t2.Text = dtb.Rows[0]["T2"].ToString();
                t21.Text = dtb.Rows[0]["T21"].ToString();
                t22.Text = dtb.Rows[0]["T22"].ToString();
                t23.Text = dtb.Rows[0]["T23"].ToString();
                t24.Text = dtb.Rows[0]["T24"].ToString();
                t25.Text = dtb.Rows[0]["T25"].ToString();
                t3.Text = dtb.Rows[0]["T3"].ToString();
                t31.Text = dtb.Rows[0]["T31"].ToString();
                t32.Text = dtb.Rows[0]["T32"].ToString();
                t33.Text = dtb.Rows[0]["T33"].ToString();
                t34.Text = dtb.Rows[0]["T34"].ToString();
                t35.Text = dtb.Rows[0]["T35"].ToString();
                t4.Text = dtb.Rows[0]["T4"].ToString();
                t41.Text = dtb.Rows[0]["T41"].ToString();
                t42.Text = dtb.Rows[0]["T42"].ToString();
                t43.Text = dtb.Rows[0]["T43"].ToString();
                t44.Text = dtb.Rows[0]["T44"].ToString();
                txt_tong.Text = dtb.Rows[0]["T5TTKy"].ToString();
                ////
                t1lt.Text = dtb.Rows[0]["T1"].ToString();
                t11lt.Text = dtb.Rows[0]["T11"].ToString();
                t2lt.Text = dtb.Rows[0]["T2"].ToString();
                t21lt.Text = dtb.Rows[0]["T21"].ToString();
                t22lt.Text = dtb.Rows[0]["T22"].ToString();
                t23lt.Text = dtb.Rows[0]["T23"].ToString();
                t24lt.Text = dtb.Rows[0]["T24"].ToString();
                t25lt.Text = dtb.Rows[0]["T25"].ToString();
                t3lt.Text = dtb.Rows[0]["T3"].ToString();
                t31lt.Text = dtb.Rows[0]["T31"].ToString();
                t32lt.Text = dtb.Rows[0]["T32"].ToString();
                t33lt.Text = dtb.Rows[0]["T33"].ToString();
                t34lt.Text = dtb.Rows[0]["T34"].ToString();
                t35lt.Text = dtb.Rows[0]["T35"].ToString();
                t4lt.Text = dtb.Rows[0]["T4"].ToString();
                t41lt.Text = dtb.Rows[0]["T41"].ToString();
                t42lt.Text = dtb.Rows[0]["T42"].ToString();
                t43lt.Text = dtb.Rows[0]["T43"].ToString();
                t44lt.Text = dtb.Rows[0]["T44"].ToString();
                txt_tonglt.Text = dtb.Rows[0]["T5TTKy"].ToString();
                kq = 1;
            }
            else if (tthai == 2)
            {
                kq = 2;
            }
            else if (tthai == 3)
            {
                kq = 3;
            }
            else
            {
                kq = 0;
            }
        }
        else
        {
            kq = 0;
        }
        return kq;
    }
    protected void btn_cham_Click(object sender, EventArgs e)
    {

    }

    protected void btnNopKL_Click(object sender, EventArgs e)
    {
        //username = "221183404104";
        FieldTools.Visible = true;
        fldset_cham_rl.Visible = false;
        string noidung_x = drl_Ky.SelectedItem.Text.ToString().Trim();
        string ky = drl_Ky.SelectedValue.ToString().Trim();
        string masv = lblmasv.Text.ToString().Trim();
        //DataTable dt = new DataTable();
        //dt = rl.rl_sinhvien(username);
        //string masv = dt.Rows[0]["MA_SINH_VIEN"].ToString();
        //string hoten = dt.Rows[0]["hoten"].ToString();
        //string lop = dt.Rows[0]["LOP"].ToString();
        //string ngaysinh = dt.Rows[0]["NGAY_SINH"].ToString();
        //DataTable dt1 = rl.rl_checkVang(username, ky);
        //int sobvang = dt1.Rows.Count;
        int t_1_1 = 0, t_2_2 = 0, t_3_3 = 0, t_4_4 = 0, tong = 0;
        string t_1 = t1lt.Text.ToString().Trim();
        string t_2 = t2lt.Text.ToString().Trim();
        string t_21 = t21lt.Text.ToString().Trim();
        string t_22 = t22lt.Text.ToString().Trim();
        string t_23 = t23lt.Text.ToString().Trim();
        string t_24 = t24lt.Text.ToString().Trim();
        string t_25 = t25lt.Text.ToString().Trim();
        string t_3 = t3lt.Text.ToString().Trim();
        string t_31 = t31lt.Text.ToString().Trim();
        string t_32 = t32lt.Text.ToString().Trim();
        string t_33 = t33lt.Text.ToString().Trim();
        string t_34 = t34lt.Text.ToString().Trim();
        string t_35 = t35lt.Text.ToString().Trim();
        string t_4 = t4lt.Text.ToString().Trim();
        string t_41 = t41lt.Text.ToString().Trim();
        string t_42 = t42lt.Text.ToString().Trim();
        string t_43 = t43lt.Text.ToString().Trim();
        string t_44 = t44lt.Text.ToString().Trim();
        if (t_1 == "")
        {
            t_1_1 = 0;
        }
        else
        {
            t_1_1 = int.Parse(t_1.ToString());
        }     
        t11lt.Text = t_1_1.ToString();
        t_2_2 = int.Parse(t_21) + int.Parse(t_22) + int.Parse(t_23) + int.Parse(t_24) + int.Parse(t_25);
        if (t_2_2 > 25)
        {
            t_2_2 = 25;
        }
        t_3_3 = int.Parse(t_31) + int.Parse(t_32) + int.Parse(t_33) + int.Parse(t_34) + int.Parse(t_35);
        if (t_3_3 > 25)
        {
            t_3_3 = 25;
        }
        t_4_4 = int.Parse(t_41) + int.Parse(t_42) + int.Parse(t_43) + int.Parse(t_44);
        if (t_4_4 > 20)
        {
            t_4_4 = 20;
        }
        tong = t_1_1 + t_2_2 + t_3_3 + t_4_4;
        if (tong > 80)
        {
            tong = 80;
        }
        int kqtc = rl.rl_UpdateLT_RL_PhieuDiem(masv, ky, t_1_1.ToString(), t_1, t_2_2.ToString(), t_21, t_22, t_23, t_24, t_25, t_3_3.ToString(), t_31, t_32, t_33, t_34, t_35, t_4_4.ToString(), t_41, t_42, t_43, t_44, tong.ToString());
        if (kqtc > 0)
        {
            int kqth = rl.rl_UpdateLT_DIEM_TH_RENLUYEN(masv, ky, tong.ToString());
            if (kqth > 0)
            {
                lbl_mess.Text = "Bạn đã nộp phiếu điêm thành công!";
                fld_dslop.Visible = true;
                int id = int.Parse(lbl_id.Text.ToString().Trim());
                laydslopTongHop(id);
            }
        }
    }
    public void laydslopTongHop(int id)
    {
        DataTable dt = new DataTable();
        fld_dslop.Visible = true;
        FieldTools.Visible = false;
        dt = rl.rl_GetLopCham(id);
        if (dt.Rows.Count > 0)
        {
            lbl_lop.Text = dt.Rows[0]["LOP"].ToString().Trim();
            grv_dsLop.DataSource = dt;
            grv_dsLop.DataBind();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                int diem = Convert.ToInt32(dt.Rows[i]["TrangThai"].ToString().Trim());
                if (diem == 0)
                {
                    (grv_dsLop.Rows[i].FindControl("lbl_trangthai") as Label).Text = "Chưa chấm";
                }
                else if (diem == 1)
                {
                    (grv_dsLop.Rows[i].FindControl("lbl_trangthai") as Label).Text = "Chờ duyệt";
                }
                else if (diem == 2)
                {
                    (grv_dsLop.Rows[i].FindControl("lbl_trangthai") as Label).Text = "Đã duyệt";
                }
                else if (diem == 3)
                {
                    (grv_dsLop.Rows[i].FindControl("lbl_trangthai") as Label).Text = "Đã khóa";
                }
            }
        }
    }
    protected void grv_dsLopDuyet_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Duyet")
        {
            int dong = Convert.ToInt32(e.CommandArgument.ToString());
            int id = int.Parse(grv_dsLopDuyet.Rows[dong].Cells[1].Text.ToString());
            lbl_id.Text = id.ToString();
            laydslopTongHop(id);
            //lbl_cham.Text = "Bạn vừa click duyệt " + id;
            //DataTable dt = new DataTable();
            //fld_dslop.Visible = true;
            //FieldTools.Visible = false;
            //dt = rl.rl_GetLopCham(id);
            //if (dt.Rows.Count > 0)
            //{
            //    lbl_lop.Text = dt.Rows[0]["LOP"].ToString().Trim();                
            //    grv_dsLop.DataSource = dt;
            //    grv_dsLop.DataBind();
            //    for (int i = 0; i < dt.Rows.Count; i++)
            //    {
            //        int diem = Convert.ToInt32(dt.Rows[i]["TrangThai"].ToString().Trim());
            //        if (diem == 0)
            //        {
            //            (grv_dsLop.Rows[i].FindControl("lbl_trangthai") as Label).Text = "Chưa chấm";
            //        }
            //        else if (diem == 1)
            //        {
            //            (grv_dsLop.Rows[i].FindControl("lbl_trangthai") as Label).Text = "Chờ duyệt";
            //        }
            //        else if (diem == 2)
            //        {
            //            (grv_dsLop.Rows[i].FindControl("lbl_trangthai") as Label).Text = "Đã duyệt";
            //        }
            //        else if (diem == 3)
            //        {
            //            (grv_dsLop.Rows[i].FindControl("lbl_trangthai") as Label).Text = "Đã khóa";
            //        }
            //    }                
            //}            
        }
    }

    protected void grv_dsLop_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "btn_duyet")
        {
            int dong = int.Parse(e.CommandArgument.ToString());
            string masv = grv_dsLop.Rows[dong].Cells[1].Text.ToString();
            string ky = drl_Ky.SelectedValue.ToString().Trim();            
            int kt = get_Phieu(masv, ky);
            if (kt == 1 || kt == 2)
            {
                fldset_cham_rl.Visible = true;
                fld_dslop.Visible = false;
                DataTable dt = new DataTable();
                dt = rl.rl_sinhvien(masv);
                lblmasv.Text = masv;
                hoten.Text = "Họ và Tên : " + dt.Rows[0]["hoten"].ToString();
                Lop.Text = "Lớp : " + dt.Rows[0]["LOP"].ToString();
                ngaysinh.Text = "Ngày sinh : " + dt.Rows[0]["NGAY_SINH"].ToString();
                Noisinh.Text = "Nơi sinh : " + dt.Rows[0]["NOI_SINH"].ToString();
            }
            else
            {
                return;
            }                
        }
    }
}
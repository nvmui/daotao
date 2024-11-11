using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RLCTCT_frm_ChamDiemRL : System.Web.UI.Page
{
    RenLuyen rl = new RenLuyen();
    string username = "221183404104";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            getky();
            rl_getDiemTH();
        }
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
    //Lấy điểm tổng hợp
    public void rl_getDiemTH()
    {
        username = "221183404104";
        DataTable dtb = new DataTable();
        dtb = rl.rl_get_DIEM_TH_RENLUYEN(username);
        if (dtb.Rows.Count > 0)
        {
            grv_diemth.DataSource = dtb;
            grv_diemth.DataBind();
            fld_diem_dg.Visible = true;
        }
        else
        {
            fld_diem_dg.Visible = false;
        }
    }
    protected void btnNopKL_Click(object sender, EventArgs e)
    {
        username = "221183404104";
        FieldTools.Visible = true;
        fldset_cham_rl.Visible = false;        
        string noidung_x = drl_Ky.SelectedItem.Text.ToString().Trim();
        string ky = drl_Ky.SelectedValue.ToString().Trim();
        DataTable dt = new DataTable();
        dt = rl.rl_sinhvien(username);
        string masv = dt.Rows[0]["MA_SINH_VIEN"].ToString();
        string hoten = dt.Rows[0]["hoten"].ToString();
        string lop = dt.Rows[0]["LOP"].ToString();
        string ngaysinh = dt.Rows[0]["NGAY_SINH"].ToString();
        DataTable dt1 = rl.rl_checkVang(username, ky);
        int sobvang = dt1.Rows.Count;
        //lbl_cham.Text = sobvang.ToString();
        int t_1_1 = 0, t_2_2 = 0, t_3_3 = 0, t_4_4 = 0, tong = 0;
        string t_1 = t1.Text.ToString().Trim();
        //string t_11 = t11.Text.ToString().Trim();
        //string t_12 = t12.Text.ToString().Trim();
        //string t_121 = t121.Text.ToString().Trim();
        //string t_122 = t122.Text.ToString().Trim();
        //string t_123 = t123.Text.ToString().Trim();
        //string t_124 = t124.Text.ToString().Trim();
        //string t_125 = t125.Text.ToString().Trim();
        //string t_13 = t13.Text.ToString().Trim();
        //string t_131 = t131.Text.ToString().Trim();
        //string t_132 = t132.Text.ToString().Trim();
        string t_2 = t2.Text.ToString().Trim();
        string t_21 = t21.Text.ToString().Trim();
        string t_22 = t22.Text.ToString().Trim();
        string t_23 = t23.Text.ToString().Trim();
        string t_24 = t24.Text.ToString().Trim();
        string t_25 = t25.Text.ToString().Trim();
        string t_3 = t3.Text.ToString().Trim();
        string t_31 = t31.Text.ToString().Trim();
        string t_32 = t32.Text.ToString().Trim();
        string t_33 = t33.Text.ToString().Trim();
        string t_34 = t34.Text.ToString().Trim();
        string t_35 = t35.Text.ToString().Trim();
        string t_4 = t4.Text.ToString().Trim();
        string t_41 = t41.Text.ToString().Trim();
        string t_42 = t42.Text.ToString().Trim();
        string t_43 = t43.Text.ToString().Trim();
        string t_44 = t44.Text.ToString().Trim();
        if (t_1 == "")
        {
            t_1_1 = 0;
        }
        else
        {
            t_1_1 = 10 - sobvang;// int.Parse(t_1);
        }
        if (t_1_1 < 0)
        {
            t_1_1 = 0;
        }
        t11.Text = t_1_1.ToString();
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
        int kqtc = rl.rl_insert_RL_PhieuDiem(masv, ky, t_1_1.ToString(), t_1, t_2_2.ToString(), t_21, t_22, t_23, t_24, t_25, t_3_3.ToString(), t_31, t_32, t_33, t_34, t_35, t_4_4.ToString(), t_41, t_42, t_43, t_44, tong.ToString());
        if (kqtc > 0)
        {
            int kqth = rl.rl_insert_DIEM_TH_RENLUYEN(username, hoten, ngaysinh, lop, ky, noidung_x, tong.ToString());
            if (kqth > 0)
            {
                lbl_mess.Text = "Bạn đã nộp phiếu điêm thành công!";
                rl_getDiemTH();
            }
        }
    }
    protected void btn_cham_Click(object sender, EventArgs e)
    {
        username = "221183404104";
        string ky = drl_Ky.SelectedValue.ToString().Trim();
        FieldTools.Visible = false;
        fldset_cham_rl.Visible = true;
        DataTable dt = new DataTable();
        dt = rl.rl_sinhvien(username);
        hoten.Text = "Họ và Tên : " + dt.Rows[0]["hoten"].ToString();
        Lop.Text = "Lớp : " + dt.Rows[0]["LOP"].ToString();
        ngaysinh.Text = "Ngày sinh : " + dt.Rows[0]["NGAY_SINH"].ToString();
        Noisinh.Text = "Nơi sinh : " + dt.Rows[0]["NOI_SINH"].ToString();
        get_Phieu();
        int t_1_1 = 0;
        DataTable dt1 = rl.rl_checkVang(username, ky);
        int sobvang = dt1.Rows.Count;
        t_1_1 = 10 - sobvang;// int.Parse(t_1);
        if (t_1_1 < 0)
        {
            t_1_1 = 0;
        }
        t11.Text = t_1_1.ToString();
    }
    //Lấy thông tin phiếu chấm điểm
    public void get_Phieu()
    {
        string ky = drl_Ky.SelectedValue.ToString().Trim();
        username = "221183404104";
        DataTable dtb = new DataTable();
        dtb = rl.rl_get_PhieuRenLuyen(username, ky);
        if (dtb.Rows.Count > 0)
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
        }
        else
        {

        }
    }
}
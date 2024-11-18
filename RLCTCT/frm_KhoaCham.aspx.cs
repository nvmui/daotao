using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RLCTCT_frm_KhoaCham : System.Web.UI.Page
{
    RenLuyen rl = new RenLuyen();
    string username = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Session["USERNAME"] != null)
        //{
        //    username = Session["USERNAME"].ToString().Trim();
            if (!IsPostBack)
            {
                getky();
                getKhoaChuyenMon();
                getKhoaHoc();
            }
        //}
        //else
        //{
        //    Response.Redirect("~/logout.aspx");
        //}
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
    //lấy kỳ chấm điểm
    public void getKhoaChuyenMon()
    {
        DataTable dtb = new DataTable();
        dtb = rl.getKhoaChuyenMon();
        drl_khoa.DataSource = dtb;
        drl_khoa.DataTextField = "MaKhoa";
        drl_khoa.DataTextField = "TenKhoa";
        drl_khoa.DataValueField = "MaKhoa";
        drl_khoa.DataBind();
    }
    //lấy kỳ chấm điểm
    public void getKhoaHoc()
    {
        DataTable dtb = new DataTable();
        dtb = rl.rl_getKhoa();
        drl_khoaHoc.DataSource = dtb;
        drl_khoaHoc.DataTextField = "KHOA_HOC";
        drl_khoaHoc.DataTextField = "TEN_KHOA_HOC";
        drl_khoaHoc.DataValueField = "KHOA_HOC";
        drl_khoaHoc.DataBind();
    }
    //Hàm thực hiện lấy khoa danh sách khoa chấm
    public void get_khoaCham(string ky, string khoa, string makhoa)
    {
        DataTable dt = new DataTable();
        dt = rl.rl_getDSKhoaCham(ky, khoa, makhoa);
        if (dt.Rows.Count > 0)
        {
            fld_dskhoacham.Visible = true;
            grv_dsSVKhoaCham.DataSource = dt;
            grv_dsSVKhoaCham.DataBind();
        }
        else
        {
            fld_dskhoacham.Visible = false;
        }
    }
    protected void btn_thucHien_Click(object sender, EventArgs e)
    {
        string ky = drl_Ky.SelectedValue.ToString().Trim();
        string khoa = drl_khoaHoc.SelectedValue.ToString().Trim();
        string makhoa = drl_khoa.SelectedValue.ToString().Trim();
        lbl_mess.Visible = true;
        lbl_mess.Text = "Kỳ chọn là " + ky + " Khóa chọn là " + khoa;
        int kq = rl.rl_KhoaCham(khoa, ky, makhoa);
        if (kq > 0)
        {
            lbl_mess.Visible = true;
            lbl_mess.Text = "Kỳ chọn là " + ky + " Khóa chọn là " + khoa + " Thực hiện chấm điểm thành công!";
            get_khoaCham(ky, khoa, makhoa);
        }
        else
        {
            lbl_mess.Visible = true;
            fld_dskhoacham.Visible = false;
            lbl_mess.Text = "Kỳ chọn là " + ky + " Khóa chọn là " + khoa + " Thực hiện chấm điểm thất bại! Hoặc khóa này chưa thực hiện chấm điểm";
        }
    }

    protected void btn_xemDS_Click(object sender, EventArgs e)
    {
        string ky = drl_Ky.SelectedValue.ToString().Trim();
        string khoa = drl_khoaHoc.SelectedValue.ToString().Trim();
        string makhoa = drl_khoa.SelectedValue.ToString().Trim();
        get_khoaCham(ky, khoa, makhoa);
    }
}
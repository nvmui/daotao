using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RLCTCT_frm_ctctTongHop : System.Web.UI.Page
{
    RenLuyen rl = new RenLuyen();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            getky();
            getKhoaHoc();
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
    protected void btn_thucHien_Click(object sender, EventArgs e)
    {
        string ky = drl_Ky.SelectedValue.ToString().Trim();
        string khoa = drl_khoaHoc.SelectedValue.ToString().Trim();
        lbl_mess.Visible = true;
        lbl_mess.Text = "Kỳ chọn là " + ky + " Khóa chọn là " + khoa;
        int kq = rl.rl_ctct_tonghop_theo_khoa(khoa, ky);
        if (kq > 0)
        {
            lbl_mess.Visible = true;
            lbl_mess.Text = "Kỳ chọn là " + ky + " Khóa chọn là " + khoa + " Thực hiện chấm điểm thành công!";
            //get_khoaCham(ky, khoa);
        }
        else
        {
            lbl_mess.Visible = true;
            fld_dskhoacham.Visible = false;
            lbl_mess.Text = "Kỳ chọn là " + ky + " Khóa chọn là " + khoa + " Thực hiện chấm điểm thất bại! Hoặc khóa này chưa thực hiện chấm điểm";
        }
    }
}
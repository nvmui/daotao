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
string username = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Session["USERNAME"] != null)
        //{
        //    username = Session["USERNAME"].ToString().Trim();
            if (!IsPostBack)
            {
                getky();
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
        fldset_cham_rl.Visible = false;
        string ky = drl_Ky.SelectedValue.ToString().Trim();
        string khoa = drl_khoaHoc.SelectedValue.ToString().Trim();
        lbl_mess.Visible = true;
        lbl_mess.Text = "Kỳ chọn là " + ky + " Khóa chọn là " + khoa;
        int kq = rl.rl_ctct_tonghop_theo_khoa(khoa, ky);
        if (kq > 0)
        {
            lbl_mess.Visible = true;
            lbl_mess.Text = "Kỳ chọn là " + ky + " Khóa chọn là " + khoa + " Thực hiện chấm điểm thành công!";
            get_ctctChan(ky, khoa);
        }
        else
        {
            lbl_mess.Visible = true;
            fld_dskhoacham.Visible = false;
            lbl_mess.Text = "Kỳ chọn là " + ky + " Khóa chọn là " + khoa + " Thực hiện chấm điểm thất bại! Hoặc khóa này chưa thực hiện chấm điểm";
        }
    }
    //Hàm thực hiện lấy khoa danh sách khoa chấm
    public void get_ctctChan(string ky, string khoa)
    {
        fldset_cham_rl.Visible = false;
        DataTable dt = new DataTable();
        dt = rl.rl_getDSCTCT_Cham(ky, khoa);
        if (dt.Rows.Count > 0)
        {
            fld_dskhoacham.Visible = true;
            grv_dsCTCT_Cham.DataSource = dt;
            grv_dsCTCT_Cham.DataBind();
        }
        else
        {
            fld_dskhoacham.Visible = false;
        }
    }

    protected void btn_xemds_Click(object sender, EventArgs e)
    {
        string ky = drl_Ky.SelectedValue.ToString().Trim();
        string khoa = drl_khoaHoc.SelectedValue.ToString().Trim();
        get_ctctChan(ky, khoa);
        fldset_cham_rl.Visible = false;
    }
    protected void grv_dsCTCT_Cham_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "btn_xemPhieu")
        {
            int dong = int.Parse(e.CommandArgument.ToString());
            string masv = grv_dsCTCT_Cham.Rows[dong].Cells[1].Text.ToString();
            string ky = drl_Ky.SelectedValue.ToString().Trim();
            int kt = get_Phieu(masv, ky);
            if (kt == 1 || kt == 2)
            {
                fldset_cham_rl.Visible = true;
                fld_dskhoacham.Visible = false;
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
                btnNopKL.Enabled = false;
                return;
            }
        }
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
            if (tthai == 2 || tthai == 3)
            {
                t1.Text = dtb.Rows[0]["T1"].ToString();
                t11.Text = dtb.Rows[0]["T11"].ToString();
                //t12.Text = dtb.Rows[0]["T12"].ToString();
                //t121.Text = dtb.Rows[0]["T121"].ToString();
                //t122.Text = dtb.Rows[0]["T122"].ToString();
                //t123.Text = dtb.Rows[0]["T123"].ToString();
                //t124.Text = dtb.Rows[0]["T124"].ToString();
                //t125.Text = dtb.Rows[0]["T125"].ToString();
                //t13.Text = dtb.Rows[0]["T13"].ToString();
                //t131.Text = dtb.Rows[0]["T131"].ToString();
                //t132.Text = dtb.Rows[0]["T132"].ToString();
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
                ////áp ban cán sự lớp chầm
                t1lt.Text = dtb.Rows[0]["LTT1"].ToString();
                t11lt.Text = dtb.Rows[0]["LTT11"].ToString();
                t2lt.Text = dtb.Rows[0]["LTT2"].ToString();
                t21lt.Text = dtb.Rows[0]["LTT21"].ToString();
                t22lt.Text = dtb.Rows[0]["LTT22"].ToString();
                t23lt.Text = dtb.Rows[0]["LTT23"].ToString();
                t24lt.Text = dtb.Rows[0]["LTT24"].ToString();
                t25lt.Text = dtb.Rows[0]["LTT25"].ToString();
                t3lt.Text = dtb.Rows[0]["LTT3"].ToString();
                t31lt.Text = dtb.Rows[0]["LTT31"].ToString();
                t32lt.Text = dtb.Rows[0]["LTT32"].ToString();
                t33lt.Text = dtb.Rows[0]["LTT33"].ToString();
                t34lt.Text = dtb.Rows[0]["LTT34"].ToString();
                t35lt.Text = dtb.Rows[0]["LTT35"].ToString();
                t4lt.Text = dtb.Rows[0]["LTT4"].ToString();
                t41lt.Text = dtb.Rows[0]["LTT41"].ToString();
                t42lt.Text = dtb.Rows[0]["LTT42"].ToString();
                t43lt.Text = dtb.Rows[0]["LTT43"].ToString();
                t44lt.Text = dtb.Rows[0]["LTT44"].ToString();
                txt_tonglt.Text = dtb.Rows[0]["LTT5TTKy"].ToString();
                ///Áp ctct chấm
                t1ct.Text = dtb.Rows[0]["CTCTT1"].ToString();
                t11ct.Text = dtb.Rows[0]["CTCTT11"].ToString();
                t12ct.Text = dtb.Rows[0]["T12"].ToString();
                t121ct.Text = dtb.Rows[0]["T121"].ToString();
                t122ct.Text = dtb.Rows[0]["T122"].ToString();
                t123ct.Text = dtb.Rows[0]["T123"].ToString();
                t124ct.Text = dtb.Rows[0]["T124"].ToString();
                t125ct.Text = dtb.Rows[0]["T125"].ToString();
                t13ct.Text = dtb.Rows[0]["T13"].ToString();
                t131ct.Text = dtb.Rows[0]["T131"].ToString();
                t132ct.Text = dtb.Rows[0]["T132"].ToString();
                t2ct.Text = dtb.Rows[0]["CTCTT2"].ToString();
                t21ct.Text = dtb.Rows[0]["CTCTT21"].ToString();
                t22ct.Text = dtb.Rows[0]["CTCTT22"].ToString();
                t23ct.Text = dtb.Rows[0]["CTCTT23"].ToString();
                t24ct.Text = dtb.Rows[0]["CTCTT24"].ToString();
                t25ct.Text = dtb.Rows[0]["CTCTT25"].ToString();
                t3ct.Text = dtb.Rows[0]["CTCTT3"].ToString();
                t31ct.Text = dtb.Rows[0]["CTCTT31"].ToString();
                t32ct.Text = dtb.Rows[0]["CTCTT32"].ToString();
                t33ct.Text = dtb.Rows[0]["CTCTT33"].ToString();
                t34ct.Text = dtb.Rows[0]["CTCTT34"].ToString();
                t35ct.Text = dtb.Rows[0]["CTCTT35"].ToString();
                t4ct.Text = dtb.Rows[0]["CTCTT4"].ToString();
                t41ct.Text = dtb.Rows[0]["CTCTT41"].ToString();
                t42ct.Text = dtb.Rows[0]["CTCTT42"].ToString();
                t43ct.Text = dtb.Rows[0]["CTCTT43"].ToString();
                t44ct.Text = dtb.Rows[0]["CTCTT44"].ToString();
                txt_tongct.Text = dtb.Rows[0]["CTCTT5TTKy"].ToString();
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

    protected void btnNopKL_Click(object sender, EventArgs e)
    {
        fld_dskhoacham.Visible = true;
        fldset_cham_rl.Visible = false;
    }

    protected void btnThoat_Click(object sender, EventArgs e)
    {
        fld_dskhoacham.Visible = true;
        fldset_cham_rl.Visible = false;
    }
}
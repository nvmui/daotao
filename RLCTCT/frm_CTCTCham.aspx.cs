using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RLCTCT_frm_CTCTCham : System.Web.UI.Page
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
                lbl_thongbao.Visible = false;
                xoatext();
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
    protected void btn_xuatbaocao_Click(object sender, EventArgs e)
    {
        fld_XemBaoCao.Visible = true;
        fld_taokh.Visible = false;
    }

    protected void btn_khoitaocham_Click(object sender, EventArgs e)
    {
        fld_XemBaoCao.Visible = false;
        fld_taokh.Visible = true;
        xoatext();
    }
    public void xoatext()
    {
        txt_noidung.Text = "";
        txt_ngaybd.Text = "";
        txt_ngaykt.Text = "";
    }

    protected void btn_luuKehoach_Click(object sender, EventArgs e)
    {
        string ngay_bd, ngay_kt, ngay_bdcvht, ngay_ktcvht, ngay_bdkhoa, ngay_ktkhoa;
        
        if (txt_ngaybd.Text.ToString().Trim() == ""|| txt_ngaykt.Text.ToString().Trim() == ""|| txt_ngaybd_cvht.Text.ToString().Trim() == "" || txt_ngaykt_cvht.Text.ToString().Trim() == "" || txt_ngaybd_khoa.Text.ToString().Trim() == "" || txt_ngaykt_khoa.Text.ToString().Trim() == "" || txt_noidung.Text.ToString().Trim()=="")
        {
            lbl_thongbao.Visible = true;
            lbl_thongbao.Text = "Bạn phải nhập đầy đủ nội dung";
        }
        else
        {
            string ky = drl_Ky.SelectedValue.ToString();
            string khoa = drl_khoaHoc.SelectedValue.ToString();
            string noidung = txt_noidung.Text.ToString().Trim();
            DateTime ngaybd = DateTime.Parse(txt_ngaybd.Text.ToString().Trim());
            ngay_bd = ngaybd.ToString("dd/MM/yyyy");
            DateTime ngaykt = DateTime.Parse(txt_ngaykt.Text.ToString().Trim());
            ngay_kt = ngaykt.ToString("dd/MM/yyyy");
            DateTime ngaybdcvht = DateTime.Parse(txt_ngaybd_cvht.Text.ToString().Trim());
            ngay_bdcvht = ngaybdcvht.ToString("dd/MM/yyyy");
            DateTime ngayktcvht = DateTime.Parse(txt_ngaykt_cvht.Text.ToString().Trim());
            ngay_ktcvht = ngayktcvht.ToString("dd/MM/yyyy");
            //
            DateTime ngaybdkhoa = DateTime.Parse(txt_ngaybd_khoa.Text.ToString().Trim());
            ngay_bdkhoa = ngaybdkhoa.ToString("dd/MM/yyyy");
            DateTime ngayktkhoa = DateTime.Parse(txt_ngaykt_khoa.Text.ToString().Trim());
            ngay_ktkhoa = ngayktkhoa.ToString("dd/MM/yyyy");
            //
            int kq = rl.rl_KhoiTaoCham(ky, noidung, khoa, ngay_bd, ngay_kt, ngay_bdcvht, ngay_ktcvht, ngay_bdkhoa, ngay_ktkhoa);
            if (kq > 0)
            {
                lbl_thongbao.Visible = true;
                lbl_thongbao.Text = "Tạo kế hoạch chấm điểm rèn luyện thành công!";
            }
            else
            {
                lbl_thongbao.Visible = true;
                lbl_thongbao.Text = "Tạo kế hoạch chấm điểm rèn luyện không thành công hoặc bạn đã tạo kế hoạch trước rồi!";
            }
        }
    }
}
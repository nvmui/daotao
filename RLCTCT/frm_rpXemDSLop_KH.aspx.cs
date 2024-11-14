using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RLCTCT_frm_rpXemDSLop_KH : System.Web.UI.Page
{
    RenLuyen rl = new RenLuyen();
    string username = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            getky();
            getKhoaHoc();
            string ky = drl_Ky.SelectedValue.ToString().Trim();
            int khoa = int.Parse(drl_khoaHoc.SelectedValue.ToString().Trim());
            getLop(ky, khoa);
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
        DataRow row = dtb.NewRow();
        row["KHOA_HOC"] = 1;
        row["TEN_KHOA_HOC"] = "==Chọn tất cả==";
        dtb.Rows.InsertAt(row, 0);
        drl_khoaHoc.DataSource = dtb;
        drl_khoaHoc.DataTextField = "KHOA_HOC";
        drl_khoaHoc.DataTextField = "TEN_KHOA_HOC";
        drl_khoaHoc.DataValueField = "KHOA_HOC";
        drl_khoaHoc.DataBind();
    }
    //lấy lớp
    public void getLop(string ky, int khoa)
    {
        DataTable dtb = new DataTable();
        dtb = rl.rl_getLop(ky, khoa);
        drl_lop.DataSource = dtb;
        drl_lop.DataTextField = "id";
        drl_lop.DataTextField = "Lop";
        drl_lop.DataValueField = "id";
        drl_lop.DataBind();
    }
    protected void btn_thuchien_Click(object sender, EventArgs e)
    {
        if (rd_theo_lop.Checked)
        {            
            string lop = drl_lop.SelectedValue.ToString().Trim();
            if (lop == "")
            {
                lbl_mess.Visible = true;
                lbl_mess.Text = "Lớp này chưa được khởi tạo";
                return;
            }
            else
            {
                int id = int.Parse(drl_lop.SelectedValue.ToString().Trim());
                DataTable dtb = new DataTable("dsTongHopLop");
                dtb = rl.rl_GetLopCham(id);
                if (dtb.Rows.Count > 0)
                {
                    lbl_mess.Visible = false;
                    rv_dsLop.Visible = true;
                    rv_dsLop.ProcessingMode = ProcessingMode.Local;
                    rv_dsLop.LocalReport.ReportPath = Server.MapPath("rp_dsLop.rdlc");
                    rv_dsLop.LocalReport.DataSources.Clear();
                    rv_dsLop.LocalReport.DataSources.Add(new ReportDataSource("DSLopTH", dtb));
                    //ReportParameter[] rpPara = new ReportParameter[] {
                    //    new ReportParameter("Thang",thang.ToString()),
                    //    new ReportParameter("Nam",nam.ToString())
                    //};
                    //rv_dsLop.LocalReport.SetParameters(rpPara);
                    rv_dsLop.LocalReport.Refresh();
                }
                else
                {
                    lbl_mess.Visible = true;
                    lbl_mess.Text = "Lớp này chưa được khởi tạo";
                    rv_dsLop.Visible = false;
                }
            }
        }else if (rd_theo_khoa.Checked)
        {
            lbl_mess.Visible = true;
            rv_dsLop.Visible = false;
            lbl_mess.Text = "Kế hoạch chưa được lên!";
            string ky = drl_Ky.SelectedValue.ToString().Trim();
            string khoa = drl_khoaHoc.SelectedValue.ToString().Trim();
            DataTable dtb = new DataTable("dsTongHopLop");
            dtb = rl.rl_getLopKH(ky, khoa);
            if (dtb.Rows.Count > 0)
            {
                lbl_mess.Visible = false;
                rv_dsLop.Visible = true;
                rv_dsLop.ProcessingMode = ProcessingMode.Local;
                rv_dsLop.LocalReport.ReportPath = Server.MapPath("rp_dsLopKH.rdlc");
                rv_dsLop.LocalReport.DataSources.Clear();
                rv_dsLop.LocalReport.DataSources.Add(new ReportDataSource("DS_LopKH", dtb));
                //ReportParameter[] rpPara = new ReportParameter[] {
                //    new ReportParameter("Thang",thang.ToString()),
                //    new ReportParameter("Nam",nam.ToString())
                //};
                //rv_dsLop.LocalReport.SetParameters(rpPara);
                rv_dsLop.LocalReport.Refresh();
            }
            else
            {
                lbl_mess.Visible = true;
                lbl_mess.Text = "Lớp này chưa được khởi tạo!"+khoa;
                rv_dsLop.Visible = false;
            }
        }
    }

    protected void rd_theo_lop_CheckedChanged(object sender, EventArgs e)
    {
        if (rd_theo_lop.Checked)
        {
            drl_lop.Visible = true;
            dr_khoa.Visible = false;
            rv_dsLop.Visible = false;
        }
        else
        {
            drl_lop.Visible = false;
            dr_khoa.Visible = false;
            rv_dsLop.Visible = false;
        }
    }

    protected void drl_khoaHoc_TextChanged(object sender, EventArgs e)
    {
        string ky = drl_Ky.SelectedValue.ToString().Trim();
        int khoa = int.Parse(drl_khoaHoc.SelectedValue.ToString().Trim());
        getLop(ky, khoa);
    }

    protected void rd_theo_khoa_CheckedChanged(object sender, EventArgs e)
    {
        if (rd_theo_khoa.Checked)
        {
            dr_khoa.Visible = false;
            drl_lop.Visible = false;
            rv_dsLop.Visible = false;
        }
        else
        {
            drl_lop.Visible = true;
            dr_khoa.Visible = false;
            rv_dsLop.Visible = false;
        }
    }
}
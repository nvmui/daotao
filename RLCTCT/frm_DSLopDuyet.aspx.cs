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
    string username = "221183404140";
    protected void Page_Load(object sender, EventArgs e)
    {
        get_dsDuyetLop();
        lbl_cham.Text = "HAHAHAHA";
    }
    //Hàm lấy lớp duyệt
    public void get_dsDuyetLop()
    {
        DataTable dtb = new DataTable();
        dtb = rl.rl_dsLopDuyet(username);
        grv_dsLopDuyet.DataSource = dtb;
        grv_dsLopDuyet.DataBind();        
    }
    protected void btn_cham_Click(object sender, EventArgs e)
    {

    }

    protected void btnNopKL_Click(object sender, EventArgs e)
    {

    }

    protected void grv_dsLopDuyet_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Duyet")
        {
            int dong = Convert.ToInt32(e.CommandArgument.ToString());
            int id = int.Parse(grv_dsLopDuyet.Rows[dong].Cells[1].Text.ToString());
            //lbl_cham.Text = "Bạn vừa click duyệt " + id;
            DataTable dt = new DataTable();
            fld_dslop.Visible = true;
            FieldTools.Visible = false;
            dt = rl.rl_GetLopCham(id);
            grv_dsLop.DataSource = dt;
            grv_dsLop.DataBind();
        }
    }

    protected void grv_dsLop_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "btn_duyet")
        {
            int dong = int.Parse(e.CommandArgument.ToString());
            string masv = grv_dsLop.Rows[dong].Cells[1].Text.ToString();
            lbl_cham.Text = "Mã sinh viên là: " + masv;
        }
    }
}
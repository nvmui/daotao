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
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            getky();
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
    protected void imgCmdBack_Click(object sender, ImageClickEventArgs e)
    {

    }

    protected void btnInKL_Click(object sender, EventArgs e)
    {

    }

    protected void btnNopKL_Click(object sender, EventArgs e)
    {

    }

    protected void drl_Ky_TextChanged(object sender, EventArgs e)
    {

    }

    protected void txt11_TextChanged(object sender, EventArgs e)
    {
        tinhTextBox();
    }
    //Hàm sự kiện text change
    public void tinhTextBox()
    {
        int t1 = 0, t2 = 0, t3 = 0, t4 = 0, t5 = 0, t6 = 0, t7 = 0;
        int t11 = int.Parse(txt11.Text.ToString().Trim());
        int t12 = int.Parse(txt12.Text.ToString().Trim());
        int t21 = int.Parse(txt121.Text.ToString().Trim());//Điểm trung bình từ 3.6 trở lên
        int t22 = int.Parse(txt122.Text.ToString().Trim());//Điểm trung bình từ 3.2 đến 3.59
        int t23 = int.Parse(txt123.Text.ToString().Trim());//Điểm trung bình từ 2.5 đến 3.19
        int t24 = int.Parse(txt124.Text.ToString().Trim());//Điểm trung bình từ 2.0 đến 2.49
        int t25 = int.Parse(txt125.Text.ToString().Trim());//Điểm trung bình dưới 2.0
        int t13 = int.Parse(txt13.Text.ToString().Trim());
        if (t11 > 10)
        {
            t11 = 10;
            txt11.Text = "10";
        }
        if (t12 > 20)
        {
            t12 = 20;
            txt12.Text = "20";
        }
        t1 = t11 + t12 + t13;
        if (t1 > 30)
        {
            t1 = 30;
        }
        txt1.Text = t1.ToString();
    }
}
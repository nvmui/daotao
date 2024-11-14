using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RLCTCT_renluyen : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Session["USERNAME"] != null)
            {
                lblFullName.Text = Session["FullName"].ToString().Trim();
                hypExit.Visible = true;
            }
            else
            {
                Response.Redirect("~/logout.aspx");
            }
        }
    }
}

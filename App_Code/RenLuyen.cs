using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for RenLuyen
/// </summary>
public class RenLuyen
{
    public static string CS = ConfigurationManager.ConnectionStrings["cdktkh_ConnStr"].ConnectionString;
    public SqlConnection conn = new SqlConnection(CS);
    public SqlDataAdapter da = new SqlDataAdapter();
    public SqlCommand cmd = new SqlCommand();
    //Lấy danh sách kỳ
    public DataTable getKy()
    {
        cmd = new SqlCommand("getKy", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        conn.Open();
        cmd.ExecuteNonQuery();
        da = new SqlDataAdapter();
        da.SelectCommand = cmd;
        DataTable dtb = new DataTable();
        da.Fill(dtb);
        conn.Close();
        return dtb;
    }

}
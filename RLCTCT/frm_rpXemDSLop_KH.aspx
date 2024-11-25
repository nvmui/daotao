<%@ Page Title="" Language="C#" MasterPageFile="~/RLCTCT/ctct.master" AutoEventWireup="true" CodeFile="frm_rpXemDSLop_KH.aspx.cs" Inherits="RLCTCT_frm_rpXemDSLop_KH" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div class="container">
        <div class="row">
            <div class="col-12 col-md-12 col-sm-12">
                <h4>BÁO CÁO TỔNG HỢP</h4>
                <div>
                    <asp:Label ID="Label3" Text="Chọn kỳ chấm" runat="server"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:DropDownList ID="drl_Ky" runat="server" Width="250px" AutoPostBack="True"></asp:DropDownList>
                </div>                  
                <div>
                    <asp:Label ID="Label4" Text="Chọn khóa vào trường" runat="server"></asp:Label>
                    &nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;
                        <asp:DropDownList ID="drl_khoaHoc" runat="server" Width="250px" AutoPostBack="True" OnTextChanged="drl_khoaHoc_TextChanged"></asp:DropDownList>
                </div>
                <div>
                    <asp:Label ID="Label1" Text="Chọn khoa chuyên môn" runat="server"></asp:Label>
                    &nbsp;&nbsp; &nbsp;
                        <asp:DropDownList ID="drl_khoacm" runat="server" Width="250px" AutoPostBack="True" OnTextChanged="drl_khoacm_TextChanged"></asp:DropDownList>
                </div> 
                <div>
                    <br />
                    <table align="center">
                        <tr class="text-left">
                            <td>
                                <asp:RadioButton ID="rd_theoKhoacm" runat="server" Text="Danh sách theo khoa" GroupName="khoa" Font-Bold="True" Checked="True" AutoPostBack="True" OnCheckedChanged="rd_theoKhoacm_CheckedChanged" />
                            </td>
                            <td>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </td>
                        </tr>
                        
                        <tr class="text-left">
                            <td>
                                <asp:RadioButton ID="rd_theo_lop" runat="server" Text="Danh sách lớp" GroupName="khoa" Font-Bold="True" OnCheckedChanged="rd_theo_lop_CheckedChanged" AutoPostBack="True" />
                            </td>
                            <td>
                                <asp:DropDownList ID="drl_lop" runat="server" Width="250px" AutoPostBack="True" Visible="False"></asp:DropDownList>
                            </td>
                        </tr>
                        <tr class="text-left">
                            <td class="auto-style1">
                                <asp:RadioButton ID="rd_theo_khoa" runat="server" Text="Xem kế hoạch" GroupName="khoa" Font-Bold="True" AutoPostBack="True" OnCheckedChanged="rd_theo_khoa_CheckedChanged" />
                            </td>
                            <td>
                                <asp:DropDownList ID="dr_khoa" runat="server" Width="250px" AutoPostBack="True" Visible="False"></asp:DropDownList>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </td>
                        </tr>
                        <tr class="text-left">
                            <td>
                                <asp:RadioButton ID="rd_ToanKhoa" runat="server" Text="Danh sách toàn khóa học" GroupName="khoa" Font-Bold="True" AutoPostBack="True" />
                            </td>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Label ID="lbl_mess" runat="server" Visible="false"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Button ID="btn_thuchien" runat="server" Text="Thực hiện" CssClass="btn btn-danger" OnClick="btn_thuchien_Click" />
                            </td>
                        </tr>
                    </table>
                    <br />
                </div>
                <div>
                    <rsweb:ReportViewer ID="rv_dsLop" runat="server" Visible="False" Width="100%">
                    </rsweb:ReportViewer>
                    <br />
                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
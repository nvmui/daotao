<%@ Page Title="" Language="C#" MasterPageFile="~/RLCTCT/ctct.master" AutoEventWireup="true" CodeFile="frm_CTCTCham.aspx.cs" Inherits="RLCTCT_frm_CTCTCham" %>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            height: 26px;
        }
    </style>
</asp:Content>--%>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div class="container text-center">
        <div class="row">
            <div class="col-12 col-md-12 col-sm-12">
                <fieldset id="fld_taokh" runat="server" visible="true">
                    <h4>KHỞI TẠO KẾ HOẠCH CHẤM ĐIỂM RÈN LUYỆN</h4>
                    <div>
                        <asp:Label ID="Label3" Text="Chọn kỳ chấm" runat="server"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:DropDownList ID="drl_Ky" runat="server" Width="250px" AutoPostBack="True"></asp:DropDownList>
                    </div>                  
                    <div>
                        <asp:Label ID="Label4" Text="Chọn khóa vào trường" runat="server"></asp:Label>
                        &nbsp;&nbsp;
                        <asp:DropDownList ID="drl_khoaHoc" runat="server" Width="250px" AutoPostBack="True"></asp:DropDownList>
                    </div>  
                    <div class="form-group text-left">
                        <asp:Label ID="lbl" Text="Nội dung kế hoạch chấm điểm rèn luyện" runat="server"></asp:Label>
                        <asp:TextBox ID="txt_noidung" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4"></asp:TextBox>
                    </div>          
                    <div class="form-group text-left">
                        <asp:Label ID="Label1" Text="Ngày bắt đầu chấm" runat="server"></asp:Label>
                        <asp:TextBox ID="txt_ngaybd" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                    </div>   
                    <div class="form-group text-left">
                        <asp:Label ID="Label2" Text="Ngày kết thúc" runat="server"></asp:Label>
                        <asp:TextBox ID="txt_ngaykt" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                    </div>   
                    <div class="form-group text-center">
                        <asp:Label ID="lbl_thongbao" Text="" runat="server" Visible="false"></asp:Label><br />
                        <asp:Button ID="btn_luuKehoach" runat="server" Text="Lưu kế hoạch" CssClass="btn btn-secondary" OnClick="btn_luuKehoach_Click" />                        
                    </div>     
                </fieldset>
            </div>
        </div>
        <div class="row">
            <div class="col-12 col-md-12 col-sm-12">
                <fieldset id="fld_taolop_sv"></fieldset>
            </div>
        </div>
        <div class="row">
            <div class="col-12 col-md-12 col-sm-12">
                <fieldset id="fld_tonghop_diem"></fieldset>
            </div>
        </div>
        <div class="row">
            <div class="col-12 col-md-12 col-sm-12">
                <fieldset id="fld_XemBaoCao" runat="server" visible="false">
                    <table align="center">
                        <tr>
                            <td>
                                <asp:RadioButton ID="rd_theo_lop" runat="server" Text="Theo lớp" GroupName="khoa" Font-Bold="True" />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style1">
                                <asp:RadioButton ID="rd_theo_khoa" runat="server" Text="Theo khoa" GroupName="khoa" Font-Bold="True"/>
                            </td>
                        </tr>
                        <tr>
                            <td>

                                &nbsp; &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="btn_thuchien" runat="server" Text="Thực hiện" CssClass="btn btn-danger" />
                            </td>
                        </tr>
                    </table>               
                </fieldset>
                <br />
            </div>
        </div>
    </div>
</asp:Content>


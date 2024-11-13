<%@ Page Title="" Language="C#" MasterPageFile="~/RLCTCT/renluyen.master" AutoEventWireup="true" CodeFile="frm_CTCTCham.aspx.cs" Inherits="RLCTCT_frm_CTCTCham" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            height: 26px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container text-center">
        <div class="row">
            <div class="col-12 col-md-12 col-sm-12">
                <br />
                <h4><strong>THỰC HIỆN CHẤM ĐIỂM RÈN LUYỆN</strong></h4>
                <div class="text-right">
                    <asp:Button ID="btn_khoitaocham" runat="server" Text="Tạo kế hoạch" CssClass="btn btn-primary" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btn_khoitao_svcham" runat="server" Text="Tạo lơp sinh viên" CssClass="btn btn-primary" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btn_tonghop" runat="server" Text="Tổng hợp điểm" CssClass="btn btn-primary" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btn_xuatbaocao" runat="server" Text="Xem và xuất báo cáo" CssClass="btn btn-primary" OnClick="btn_xuatbaocao_Click" />
                </div>
                <br />
            </div>
        </div>
        <div class="row">
            <div class="col-12 col-md-12 col-sm-12">
                <fieldset id="fld_taokh">
                    <h4>KHỞI TẠO KẾ HOẠCH CHẤM ĐIỂM RÈN LUYỆN</h4>
                    <div class="form-group">
                        <asp:Label ID="lbl" Text="Nội dung kế hoạch chấm" runat="server"></asp:Label>
                        <asp:TextBox ID="txt_noidung" runat="server" CssClass="form-control"></asp:TextBox>
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


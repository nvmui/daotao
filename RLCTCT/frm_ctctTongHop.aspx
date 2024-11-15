<%@ Page Title="" Language="C#" MasterPageFile="~/RLCTCT/ctct.master" AutoEventWireup="true" CodeFile="frm_ctctTongHop.aspx.cs" Inherits="RLCTCT_frm_ctctTongHop" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div class="container">
        <div class="row ">
            <div class="col-12 col-md-12 col-sm-12 text-center">
                <br />
                <div class="text-right">
                </div>
                <table align="center">
                    <tr>
                        <td colspan="2">
                            <h4 class="text-center">TỔNG HỢP ĐIỂM RÈN LUYỆN CÁC LỚP THEO KHÓA VÀO TRƯỜNG</h4>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-right">
                            <asp:Label ID="lbl_ky" Text="Chọn kỳ đánh giá" runat="server" Font-Bold="True"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="drl_Ky" runat="server" Width="250px" AutoPostBack="True"></asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-right">
                            <asp:Label ID="Label2" Text="Chọn khóa đánh giá" runat="server" Font-Bold="True"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="drl_khoaHoc" runat="server" Width="250px" AutoPostBack="True"></asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="text-center">
                            <asp:Label ID="lbl_mess" runat="server" Visible="false"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">&nbsp;&nbsp; &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2" class="text-center">
                            <asp:Button ID="btn_thucHien" runat="server" Text="Thực hiện" OnClick="btn_thucHien_Click"></asp:Button>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">&nbsp;&nbsp; &nbsp;</td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="row text-center">
            <fieldset id="fld_dskhoacham" runat="server" visible="false">
                <table align="center">
                    <tr>
                        <td>
                            <h4 class="text-center">DANH SÁCH SINH SAU KHI THỰC HIỆN CHẤM</h4>
                        </td>
                    </tr>
                    <tr>
                        <tb>
                        <asp:GridView ID="grv_dsSVKhoaCham" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4">
                            <Columns>
                                <asp:TemplateField HeaderText="STT">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1 %>
                                    </ItemTemplate>                                  
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="text-center" Width="5%" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="MA_SINH_VIEN" HeaderText="Mã sinh viên" >
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="10%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="HOTEN" HeaderText="Họ và Tên" >
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="15%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="NGAY_SINH" HeaderText="Ngày Sinh" >
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="10%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="T5TTKy" HeaderText="Điểm SV Chấm" >
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:BoundField>
                                <asp:BoundField DataField="LTT5TTKy" HeaderText="Điểm Lớp chấm">
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:BoundField>
                                <asp:BoundField DataField="TongKhoa" HeaderText="Điểm Khoa chấm">
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="PHÒNG CTCT KIỂN TRA (Tổng hợp, xếp loại)">
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="10%" />
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Xếp loại" >
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:BoundField>
                                <asp:ButtonField ButtonType="Button" CommandName="btn_xemPhieu" Text="Xem phiếu">
                                <HeaderStyle Width="10%" />
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="10%" />
                                </asp:ButtonField>
                            </Columns>
                            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                            <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" CssClass="text-center" />
                            <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                            <RowStyle BackColor="White" ForeColor="#003399" />
                            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                            <SortedAscendingCellStyle BackColor="#EDF6F6" />
                            <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                            <SortedDescendingCellStyle BackColor="#D6DFDF" />
                            <SortedDescendingHeaderStyle BackColor="#002876" />
                        </asp:GridView>
                    </tb>
                    </tr>
                </table>
            </fieldset>
            <br />
        </div>
    </div>
</asp:Content>


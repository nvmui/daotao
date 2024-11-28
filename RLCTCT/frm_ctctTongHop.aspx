<%@ Page Title="" Language="C#" MasterPageFile="~/RLCTCT/ctct.master" AutoEventWireup="true" CodeFile="frm_ctctTongHop.aspx.cs" Inherits="RLCTCT_frm_ctctTongHop" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div class="container justify-content-center" style="margin: auto; font-family: 'Times New Roman', Times, serif">
        <div class="row ">
            <div class="col-12 col-md-12 col-sm-12 text-center">
                <br />
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
                            <asp:Button ID="btn_thucHien" runat="server" Text="Thực hiện duyệt" OnClick="btn_thucHien_Click"></asp:Button>
                            &nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btn_xemds" runat="server" Text="Xem danh sách" OnClick="btn_xemds_Click"></asp:Button>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">&nbsp;&nbsp; &nbsp;</td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="row">
            <div class="col-12 col-md-12 col-sm-12 text-center">
                <fieldset id="fld_dskhoacham" runat="server" visible="false">
                    <table align="center" width="100%">
                        <tr>
                            <td>
                                <h4 class="text-center">DANH SÁCH SINH SAU KHI THỰC HIỆN CHẤM</h4>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:GridView ID="grv_dsCTCT_Cham" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" OnRowCommand="grv_dsCTCT_Cham_RowCommand" HorizontalAlign="Center" Width="100%">
                                    <Columns>
                                        <asp:TemplateField HeaderText="STT">
                                            <ItemTemplate>
                                                <%# Container.DataItemIndex + 1 %>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="text-center" Width="5%" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="MA_SINH_VIEN" HeaderText="Mã sinh viên">
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="10%" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="HOTEN" HeaderText="Họ và Tên">
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="20%" />
                                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="NGAY_SINH" HeaderText="Ngày Sinh">
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="10%" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="LOP" HeaderText="Lớp">
                                            <HeaderStyle Width="5%" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="DIEMTC" HeaderText="Điểm SV Chấm">
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="DIEMLOP" HeaderText="Điểm Lớp chấm">
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="DIEMKHOA" HeaderText="Điểm Khoa chấm">
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        </asp:BoundField>
                                        <asp:BoundField HeaderText="CTCT (Tổng hợp, xếp loại)" DataField="DIEMCTCT">
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        </asp:BoundField>
                                        <asp:BoundField HeaderText="Xếp loại" DataField="tenPhanloaiRL">
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="15%" />
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="15%" />
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        </asp:BoundField>
                                        <asp:ButtonField ButtonType="Button" CommandName="btn_xemPhieu" Text="Xem phiếu" HeaderText="Action">
                                            <HeaderStyle Width="10%" />
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="15%" />
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
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </div>
        </div>
        <br />
        <div class="row text-center">
            <fieldset id="fldset_cham_rl" runat="server" visible="false">
                <div class="row d-flex align-items-center justify-content-center" style="background-color: #b1c7c5;">
                    <div class="col-12">
                        <h2 class="pdgia"><strong>PHIẾU ĐÁNH GIÁ KẾT QUẢ RÈN LUYỆN</strong></h2>
                        <h4><i>(Sinh viên chỉ đánh giá kết quả rèn luyện một lần vào cuối ký theo kế hoạch của phòng CTCT)</i></h4>
                        <div class="form-horizontal ">
                            <table class="col-md-12 form-group" align="center" style="width: 100%; margin: 0 auto">
                                <tr>
                                    <td colspan="2" style="text-align: center; color: red; font-weight: bold">
                                        <asp:Label ID="lbl_thongbao" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" class="text-right">
                                        <asp:Button ID="btnNopKL" runat="server" Width="150px" Text="Lưu và Nộp phiếu" CssClass="btn btn-primary" OnClick="btnNopKL_Click" ToolTip="Bấm vào để nộp phiếu đánh giá, khi đã nộp sẽ không được sửa." OnClientClick="javascript: return edit_confirm();" />
                                        &nbsp;&nbsp;
                                        <asp:Button ID="btnThoat" runat="server" Width="150px" Text="Thoát" CssClass="btn btn-primary" OnClick="btnThoat_Click" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" class="text-center">
                                        <asp:Label ID="Label3" runat="server" Text="" Visible="true" CssClass="text-danger"></asp:Label>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="hoten" runat="server" Text=""></asp:Label></td>
                                    <td>
                                        <asp:Label ID="ngaysinh" runat="server" Text=""></asp:Label></td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Lop" runat="server" Text=""></asp:Label></td>
                                    <td>
                                        <asp:Label ID="Noisinh" runat="server" Text=""></asp:Label></td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblmasv" Visible="false" runat="server" Text=""></asp:Label></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <fieldset id="fieldset_diem" runat="server" visible="true">
                                            <table border="1">
                                                <tr>
                                                    <td width="3%"><strong>TT</strong></td>
                                                    <td width="60%">
                                                        <h5 class="text-center"><strong>Căn cứ đánh giá</strong></h5>
                                                    </td>
                                                    <td width="7%" class="text-center">
                                                        <h6><strong>Điểm quy định</strong></h6>
                                                    </td>
                                                    <td width="10%" class="text-center">
                                                        <h6><strong>SV Tự chấm</strong></h6>
                                                    </td>
                                                    <td width="10%" class="text-center">
                                                        <h6><strong>BCS và CVHT</strong></h6>
                                                    </td>
                                                    <td width="10%" class="text-center">
                                                        <h6><strong>CTCT Kiểm tra</strong></h6>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="3%">1.</td>
                                                    <td width="60%">
                                                        <h5>Đánh giá ý thức, thái độ và kết quả học tập <em>(tính theo tháng điểm 4)</em></h5>
                                                    </td>
                                                    <td width="7%" class="text-center">
                                                        <h5>30</h5>
                                                    </td>
                                                    <td width="10%" class="text-center">
                                                        <asp:TextBox ID="t1" runat="server" Text="0" Width="50px" CssClass="text-center" Enabled="false" AutoPostBack="True"></asp:TextBox>
                                                    </td>
                                                    <td width="10%" class="text-center">
                                                        <asp:TextBox ID="t1lt" runat="server" Text="0" Width="50px" CssClass="text-center" Enabled="false" AutoPostBack="True"></asp:TextBox>
                                                    </td>
                                                    <td width="10%" class="text-center">
                                                        <asp:TextBox ID="t1ct" runat="server" Text="0" Width="50px" CssClass="text-center" Enabled="false" AutoPostBack="True"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr style="text-align: left">
                                                    <td>1.1.</td>
                                                    <td>
                                                        <h5>Đi học đúng giờ, đầy đủ <strong>(Vắng 1 buổi trừ 1 điểm, trừ trường hợp có phép đúng quy định)</strong></h5>
                                                    </td>
                                                    <td class="text-center">
                                                        <h5>10</h5>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:TextBox ID="t11" runat="server" Text="0" Width="50px" CssClass="text-center" Enabled="False"></asp:TextBox>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:TextBox ID="t11lt" runat="server" Text="0" Width="50px" CssClass="text-center" Enabled="False"></asp:TextBox>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:TextBox ID="t11ct" runat="server" Text="0" Width="50px" CssClass="text-center" Enabled="False"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr style="text-align: left">
                                                    <td>1.2.</td>
                                                    <td>
                                                        <h5 class="justify-content-center">Điểm về kết quả học tập <em>(Tính điểm lần 1)</em> <strong>(Khoa chấm)</strong></h5>
                                                    </td>
                                                    <td class="text-center">
                                                        <h5>15</h5>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:TextBox ID="t12" runat="server" Text="0" Width="50px" CssClass="text-center" Enabled="false"></asp:TextBox>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:TextBox ID="t12lt" runat="server" Text="0" Width="50px" CssClass="text-center" Enabled="False"></asp:TextBox>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:TextBox ID="t12ct" runat="server" Text="0" Width="50px" CssClass="text-center" Enabled="false"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr style="text-align: left">
                                                    <td></td>
                                                    <td>
                                                        <h5 class="justify-content-center">Điểm TBCHT từ 3.6 đến 4.0</h5>
                                                    </td>
                                                    <td class="text-center">
                                                        <h5>15</h5>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:TextBox ID="t121" runat="server" Text="0" Width="50px" CssClass="text-center" Enabled="False"></asp:TextBox>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:TextBox ID="t121lt" runat="server" Text="0" Width="50px" CssClass="text-center" Enabled="False"></asp:TextBox>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:TextBox ID="t121ct" runat="server" Text="0" Width="50px" CssClass="text-center" Enabled="False"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr style="text-align: left">
                                                    <td></td>
                                                    <td>
                                                        <h5 class="justify-content-center">Điểm TBCHT từ 3.2 đến 3.59</h5>
                                                    </td>
                                                    <td class="text-center">
                                                        <h5>13</h5>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:TextBox ID="t122" runat="server" Text="0" Width="50px" CssClass="text-center" Enabled="False"></asp:TextBox>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:TextBox ID="t122lt" runat="server" Text="0" Width="50px" CssClass="text-center" Enabled="False"></asp:TextBox>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:TextBox ID="t122ct" runat="server" Text="0" Width="50px" CssClass="text-center" Enabled="False"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr style="text-align: left">
                                                    <td></td>
                                                    <td>
                                                        <h5 class="justify-content-center">Điểm TBCHT từ 2.5 đến 3.19</h5>
                                                    </td>
                                                    <td class="text-center">
                                                        <h5>11</h5>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:TextBox ID="t123" runat="server" Text="0" Width="50px" CssClass="text-center" Enabled="False"></asp:TextBox>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:TextBox ID="t123lt" runat="server" Text="0" Width="50px" CssClass="text-center" Enabled="False"></asp:TextBox>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:TextBox ID="t123ct" runat="server" Text="0" Width="50px" CssClass="text-center" Enabled="False"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr style="text-align: left">
                                                    <td></td>
                                                    <td>
                                                        <h5 class="justify-content-center">Điểm TBCHT từ 2.0 đến 2.49</h5>
                                                    </td>
                                                    <td class="text-center">
                                                        <h5>9</h5>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:TextBox ID="t124" runat="server" Text="0" Width="50px" CssClass="text-center" Enabled="False"></asp:TextBox>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:TextBox ID="t124lt" runat="server" Text="0" Width="50px" CssClass="text-center" Enabled="False"></asp:TextBox>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:TextBox ID="t124ct" runat="server" Text="0" Width="50px" CssClass="text-center" Enabled="False"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr style="text-align: left">
                                                    <td></td>
                                                    <td>
                                                        <h5 class="justify-content-center">Điểm TBCHT từ 2.0</h5>
                                                    </td>
                                                    <td class="text-center">
                                                        <h5>7</h5>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:TextBox ID="t125" runat="server" Text="0" Width="50px" CssClass="text-center" Enabled="False"></asp:TextBox>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:TextBox ID="t125lt" runat="server" Text="0" Width="50px" CssClass="text-center" Enabled="False"></asp:TextBox>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:TextBox ID="t125ct" runat="server" Text="0" Width="50px" CssClass="text-center" Enabled="False"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>1.3</td>
                                                    <td class="text-justify">
                                                        <h5>Điểm thưởng về học tập <strong>(Khoa chấm)</strong></h5>
                                                    </td>
                                                    <td class="text-center">
                                                        <h5>5</h5>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:TextBox ID="t13" runat="server" Text="0" Width="50px" CssClass="text-center" Enabled="false"></asp:TextBox>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:TextBox ID="t13lt" runat="server" Text="0" Width="50px" CssClass="text-center" Enabled="false"></asp:TextBox>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:TextBox ID="t13ct" runat="server" Text="0" Width="50px" CssClass="text-center" Enabled="false"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                    <td class="text-justify">
                                                        <h5>Không có học phần nào bị điểm C trở xuống</h5>
                                                    </td>
                                                    <td class="text-center">
                                                        <h5>5</h5>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:TextBox ID="t131" runat="server" Text="0" Width="50px" CssClass="text-center" AutoPostBack="True" Enabled="False"></asp:TextBox>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:TextBox ID="t131lt" runat="server" Text="0" Width="50px" CssClass="text-center" AutoPostBack="True" Enabled="False"></asp:TextBox>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:TextBox ID="t131ct" runat="server" Text="0" Width="50px" CssClass="text-center" AutoPostBack="True" Enabled="False"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                    <td class="text-justify">
                                                        <h5>Không có học phần nào bị điểm F</h5>
                                                    </td>
                                                    <td class="text-center">
                                                        <h5>3</h5>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:TextBox ID="t132" runat="server" Text="0" Width="50px" CssClass="text-center" AutoPostBack="True" Enabled="False"></asp:TextBox>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:TextBox ID="t132lt" runat="server" Text="0" Width="50px" CssClass="text-center" AutoPostBack="True" Enabled="False"></asp:TextBox>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:TextBox ID="t132ct" runat="server" Text="0" Width="50px" CssClass="text-center" AutoPostBack="True" Enabled="False"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>2.</td>
                                                    <td class="text-justify">
                                                        <h5>Đánh giá về ý thức chấp hành pháp luật và nội quy, quy chế của nhà trường</h5>
                                                    </td>
                                                    <td class="text-center">
                                                        <h5>25</h5>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:TextBox ID="t2" runat="server" Text="0" Width="50px" CssClass="text-center" Enabled="false"></asp:TextBox>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:TextBox ID="t2lt" runat="server" Text="0" Width="50px" CssClass="text-center" Enabled="false"></asp:TextBox>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:TextBox ID="t2ct" runat="server" Text="0" Width="50px" CssClass="text-center" Enabled="false"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>2.1</td>
                                                    <td class="text-justify">
                                                        <h5>Không vi phạm quy chế thi <strong><em>(Vi phạm không có điểm)</em></strong></h5>
                                                    </td>
                                                    <td class="text-center">
                                                        <h5>5</h5>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:TextBox ID="t21" runat="server" Text="0" Width="50px" Enabled="false" CssClass="text-center"></asp:TextBox>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:TextBox ID="t21lt" runat="server" Enabled="false" Text="0" Width="50px" CssClass="text-center"></asp:TextBox>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:TextBox ID="t21ct" runat="server" Text="0" Width="50px" CssClass="text-center"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>2.2</td>
                                                    <td class="text-justify">
                                                        <h5>Thực hiện nếp sống văn hóa do nhà trường quy định (Không dùng những lời lẽ thiếu văn hóa, không hút thuốc lá trong trường, giữ gìn vệ sinh tốt, để xe đúng nơi quy định...)</h5>
                                                    </td>
                                                    <td class="text-center">
                                                        <h5>5</h5>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:TextBox ID="t22" runat="server" Enabled="false" Text="0" Width="50px" CssClass="text-center"></asp:TextBox>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:TextBox ID="t22lt" runat="server" Enabled="false" Text="0" Width="50px" CssClass="text-center"></asp:TextBox>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:TextBox ID="t22ct" runat="server" Text="0" Width="50px" CssClass="text-center"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>2.3</td>
                                                    <td class="text-justify">
                                                        <h5>Thực hiện đúng quy chế khác của nhà trường</h5>
                                                    </td>
                                                    <td class="text-center">
                                                        <h5>5</h5>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:TextBox ID="t23" runat="server" Text="0" Enabled="false" Width="50px" CssClass="text-center"></asp:TextBox>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:TextBox ID="t23lt" runat="server" Enabled="false" Text="0" Width="50px" CssClass="text-center"></asp:TextBox>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:TextBox ID="t23ct" runat="server" Text="0" Width="50px" CssClass="text-center"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>2.4</td>
                                                    <td class="text-justify">
                                                        <h5>Chấp hành đúng chủ trương pháp luật của nhà nước</h5>
                                                    </td>
                                                    <td class="text-center">
                                                        <h5>5</h5>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:TextBox ID="t24" runat="server" Enabled="false" Text="0" Width="50px" CssClass="text-center"></asp:TextBox>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:TextBox ID="t24lt" runat="server" Enabled="false" Text="0" Width="50px" CssClass="text-center"></asp:TextBox>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:TextBox ID="t24ct" runat="server" Text="0" Width="50px" CssClass="text-center"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>2.5</td>
                                                    <td class="text-justify">
                                                        <h5>Đóng học phí, BHYT và đoàn phí đầy đủ, đúng thời gian quy định <strong><em>(Vi phạm 1 trong 3 nội dung này trừ 5 điểm)</em></strong></h5>
                                                    </td>
                                                    <td class="text-center">
                                                        <h5>5</h5>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:TextBox ID="t25" runat="server" Enabled="false" Text="0" Width="50px" CssClass="text-center"></asp:TextBox>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:TextBox ID="t25lt" runat="server" Text="0" Width="50px" CssClass="text-center" Enabled="False"></asp:TextBox>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:TextBox ID="t25ct" runat="server" Enabled="false" Text="0" Width="50px" CssClass="text-center"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>3.</td>
                                                    <td class="text-justify">
                                                        <h5><strong>Đánh giá về ý thức tham gia các hoạt động chính trị - xã hội, văn hóa, văn nghệ, thể thao, phòng chống tội phạm và các tệ nạn xã hội, bạo lực học đường</strong></h5>
                                                    </td>
                                                    <td class="text-center">
                                                        <h5>25</h5>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:TextBox ID="t3" runat="server" Text="0" Width="50px" CssClass="text-center" Enabled="false"></asp:TextBox>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:TextBox ID="t3lt" runat="server" Text="0" Width="50px" CssClass="text-center" Enabled="false"></asp:TextBox>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:TextBox ID="t3ct" runat="server" Text="0" Width="50px" CssClass="text-center" Enabled="false"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>3.1</td>
                                                    <td class="text-justify">
                                                        <h5>Tham gia đầy đủ và đạt kết quả cao tuần lễ "Sinh hoạt công dân", các buổi sinh hoạt chính trị, thời sự<strong><em> (Vắng 1 buổi không lý do trừ 1 điểm)</em></strong></h5>
                                                    </td>
                                                    <td class="text-center">
                                                        <h5>5</h5>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:TextBox ID="t31" runat="server" Enabled="false" Text="0" Width="50px" CssClass="text-center"></asp:TextBox>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:TextBox ID="t31lt" runat="server" Enabled="false" Text="0" Width="50px" CssClass="text-center"></asp:TextBox>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:TextBox ID="t31ct" runat="server" Text="0" Width="50px" CssClass="text-center"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>3.2</td>
                                                    <td class="text-justify">
                                                        <h5>Tham gia đầy đủ các buổi sinh hoạt lớp<strong><em> (Vắng 1 buổi không lý do trừ 1 điểm)</em></strong></h5>
                                                    </td>
                                                    <td class="text-center">
                                                        <h5>5</h5>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:TextBox ID="t32" runat="server" Text="0" Enabled="false" Width="50px" CssClass="text-center"></asp:TextBox>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:TextBox ID="t32lt" runat="server" Enabled="false" Text="0" Width="50px" CssClass="text-center"></asp:TextBox>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:TextBox ID="t32ct" runat="server" Text="0" Width="50px" CssClass="text-center"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>3.3</td>
                                                    <td class="text-justify">
                                                        <h5>Tham gia các hoạt động phong trào do trường, khoa, lớp tổ chức<strong><em> (Vắng 1 buổi không lý do trừ 1 điểm)</em></strong></h5>
                                                    </td>
                                                    <td class="text-center">
                                                        <h5>5</h5>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:TextBox ID="t33" runat="server" Enabled="false" Text="0" Width="50px" CssClass="text-center"></asp:TextBox>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:TextBox ID="t33lt" runat="server" Enabled="false" Text="0" Width="50px" CssClass="text-center"></asp:TextBox>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:TextBox ID="t33ct" runat="server" Text="0" Width="50px" CssClass="text-center"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>3.4</td>
                                                    <td class="text-justify">
                                                        <h5>Tham gia đấu tranh phòng chống tệ nạn xã hội như: Mại dâm, ma túy, gây mất an ninh trật tự…</h5>
                                                    </td>
                                                    <td class="text-center">
                                                        <h5>5</h5>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:TextBox ID="t34" runat="server" Enabled="false" Text="0" Width="50px" CssClass="text-center"></asp:TextBox>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:TextBox ID="t34lt" runat="server" Enabled="false" Text="0" Width="50px" CssClass="text-center"></asp:TextBox>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:TextBox ID="t34ct" runat="server" Text="0" Width="50px" CssClass="text-center"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>3.5</td>
                                                    <td class="text-justify">
                                                        <h5>Tham gia đóng góp cho phong trào HSSV tình nguyện.</h5>
                                                    </td>
                                                    <td class="text-center">
                                                        <h5>5</h5>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:TextBox ID="t35" runat="server" Enabled="false" Text="0" Width="50px" CssClass="text-center"></asp:TextBox>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:TextBox ID="t35lt" runat="server" Enabled="false" Text="0" Width="50px" CssClass="text-center"></asp:TextBox>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:TextBox ID="t35ct" runat="server" Text="0" Width="50px" CssClass="text-center"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>4.</td>
                                                    <td class="text-justify">
                                                        <h5><strong>Đánh giá về ý thức và kết quả khi tham gia công tác cán bộ lớp, các đoàn thể, tổ chức trong nhà trường hoặc có thành tích xuất sắc trong học tập, rèn luyện được cơ quan có thẩm quyền khen thưởng</strong> </h5>
                                                    </td>
                                                    <td class="text-center">
                                                        <h5>20</h5>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:TextBox ID="t4" runat="server" Text="0" Width="50px" CssClass="text-center" Enabled="False"></asp:TextBox>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:TextBox ID="t4lt" runat="server" Text="0" Width="50px" CssClass="text-center" Enabled="False"></asp:TextBox>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:TextBox ID="t4ct" runat="server" Text="0" Width="50px" CssClass="text-center" Enabled="False"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>4.1</td>
                                                    <td class="text-justify">
                                                        <h5>BCS Lớp, BCH chi đoàn điều hành tham gia đủ các hoạt động của nhà trường, Đoàn, Hội, ...</h5>
                                                    </td>
                                                    <td class="text-center">
                                                        <h5>5</h5>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:TextBox ID="t41" runat="server" Enabled="false" Text="0" Width="50px" CssClass="text-center"></asp:TextBox>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:TextBox ID="t41lt" runat="server" Enabled="false" Text="0" Width="50px" CssClass="text-center"></asp:TextBox>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:TextBox ID="t41ct" runat="server" Text="0" Width="50px" CssClass="text-center"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>4.2</td>
                                                    <td class="text-justify">
                                                        <h5>Có hành động tuyên truyền, vận động, lôi cuốn người khác tham gia công việc chung của trường, khoa, lớp, công tác Đoàn, Hội, ...</h5>
                                                    </td>
                                                    <td class="text-center">
                                                        <h5>5</h5>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:TextBox ID="t42" runat="server" Enabled="false" Text="0" Width="50px" CssClass="text-center"></asp:TextBox>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:TextBox ID="t42lt" runat="server" Enabled="false" Text="0" Width="50px" CssClass="text-center"></asp:TextBox>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:TextBox ID="t42ct" runat="server" Text="0" Width="50px" CssClass="text-center"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>4.3</td>
                                                    <td class="text-justify">
                                                        <h5>Có thành tích trong nghiên cứu khoa học, tham gia các cuộc thi, sáng kiến cải tiến kỹ thuật được Nhà trường hoặc các cơ quan có thẩm quyền công nhận.</h5>
                                                    </td>
                                                    <td class="text-center">
                                                        <h5>5</h5>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:TextBox ID="t43" runat="server" Enabled="false" Text="0" Width="50px" CssClass="text-center"></asp:TextBox>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:TextBox ID="t43lt" runat="server" Enabled="false" Text="0" Width="50px" CssClass="text-center"></asp:TextBox>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:TextBox ID="t43ct" runat="server" Text="0" Width="50px" CssClass="text-center"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>4.4</td>
                                                    <td class="text-justify">
                                                        <h5>Tham gia các hoạt động nhân đạo, từ thiện; Có tinh thần cưu mang giúp đỡ người gặp khó khăn; Có hành vi giúp đỡ bạn bè trong học tập, trong cuộc sống được tập thể công nhận.</h5>
                                                    </td>
                                                    <td class="text-center">
                                                        <h5>5</h5>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:TextBox ID="t44" runat="server" Enabled="false" Text="0" Width="50px" CssClass="text-center" MaxLength="5"></asp:TextBox>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:TextBox ID="t44lt" runat="server" Enabled="false" Text="0" Width="50px" CssClass="text-center" MaxLength="5"></asp:TextBox>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:TextBox ID="t44ct" runat="server" Text="0" Width="50px" CssClass="text-center" MaxLength="5"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                    <td>
                                                        <h5 class="text-center"><strong>Tổng Cộng</strong></h5>
                                                    </td>
                                                    <td class="text-center">
                                                        <h5>100</h5>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:TextBox ID="txt_tong" runat="server" Text="0" Width="50px" CssClass="text-center" Enabled="false"></asp:TextBox>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:TextBox ID="txt_tonglt" runat="server" Text="0" Width="50px" CssClass="text-center" Enabled="false"></asp:TextBox>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:TextBox ID="txt_tongct" runat="server" Text="0" Width="50px" CssClass="text-center" Enabled="false"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="6">
                                                        <h5 style="text-align: justify">* Lưu ý:<br />
                                                            1. Tuyệt đối không được tẩy xóa kết quả đã ghi trong phiếu (Nếu tẩy xóa không chấp nhận);<br />
                                                            2. Tập thể lớp, BCS, BCH, GVCN phải đánh giá theo từng tiêu chí cụ thể;<br />
                                                            <strong>3. Ngoài số điểm theo quy định, những HSSV không tham gia BCS, BCH nhưng có thành tích đóng góp cho các hoạt động của khoa, của Trường thì được xét cộng tối đa 5 điểm nhưng tổng số cộng lại không quá 100 điểm. (Phần điểm này do Phòng CTCT & QL HSSV phối hợp với BCH Đoàn Ttường và các khoa thực hiện).</strong>
                                                        </h5>
                                                    </td>
                                                </tr>
                                            </table>
                                        </fieldset>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" class="text-center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                            
                                <script lang="javascript">
                                    function edit_confirm() {
                                        var result = confirm("Nộp phiếu chấm điểm rèn luyện thành công!");
                                        if (result) {
                                            return true;
                                        }
                                        return false;
                                    }
                                </script>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" class="text-center">&nbsp;</td>
                                </tr>
                            </table>
                        </div>
                        <br />
                    </div>
                </div>
            </fieldset>
        </div>
    </div>
</asp:Content>


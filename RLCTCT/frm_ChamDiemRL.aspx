<%@ Page Title="" Language="C#" MasterPageFile="~/RLCTCT/renluyen.Master" AutoEventWireup="true" CodeFile="frm_ChamDiemRL.aspx.cs" Inherits="RLCTCT_frm_ChamDiemRL" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .pdgia {
            color: #FF0000;
            text-align: center;
        }
        .auto-style1 {
            height: 51px;
        }
        .auto-style2 {
            text-align: center;
            height: 51px;
        }
        .auto-style3 {
            -ms-flex-pack: center!important;
            justify-content: center!important;
            text-align: justify;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container  justify-content-center" style="margin: auto; font-family: 'Times New Roman', Times, serif">
        <div class="row text-center">
            <br />
            <div class="col-12">
                <div class="text-right">
                    <asp:ImageButton ID="imgCmdBack" runat="server"
                        ImageUrl="~/RLCTCT/img/cmdBack.gif" OnClick="imgCmdBack_Click" />
                </div>
                <fieldset id="FieldTools" runat="server" visible="true">
                    <h4 class="text-left">Thực hiện kế hoạch chấm điểm rèn luyện</h4>                    
                    <asp:Label ID="lbl_thongbaocham" runat="server"></asp:Label><br />
                    <asp:Label ID="lbl_cham" runat="server"></asp:Label>
                    <fieldset id="fld_diem_dg" runat="server" visible="true" class="text-center">
                        <table border="1px" align="center" style="width: 100%">
                            <tr>
                                <th rowspan="2" style="width: 5%; text-align: center">STT</th>
                                <th rowspan="2" style="width: 20%; text-align: center">Họ và Tên</th>
                                <th rowspan="2" style="width: 5%; text-align: center">Mã kỳ</th>
                                <th rowspan="2" style="width: 20%; text-align: center">Năm học</th>
                                <th colspan="4" style="width: 20%; text-align: center">Điểm</th>
                                <th rowspan="2" style="width: 10%; text-align: center">Xếp loại</th>
                                <th rowspan="2" style="width: 20%; text-align: center">Tình trạng</th>
                            </tr>
                            <tr>
                                <th style="width: 5%; text-align: center">SV chấm</th>
                                <th style="width: 5%; text-align: center">Thông qua lớp</th>
                                <th style="width: 5%; text-align: center">Thông qua khoa</th>
                                <th style="width: 5%; text-align: center">Thông qua PCTCT</th>
                            </tr>
                            <tr>
                                <td colspan="11">
                                    <asp:GridView ID="grv_diemth" runat="server" DataKeyNames="MA_SINH_VIEN" AutoGenerateColumns="False" ShowHeader="False" Width="100%" OnRowCommand="grv_diemth_RowCommand">
                                        <Columns>
                                            <asp:TemplateField HeaderText="STT" HeaderStyle-CssClass="danger" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <%# Container.DataItemIndex + 1 %>
                                                </ItemTemplate>
                                                <ControlStyle BorderStyle="Solid" />
                                                <HeaderStyle HorizontalAlign="Center" CssClass="danger"></HeaderStyle>
                                                <ItemStyle Width="5%" CssClass="text-center" BorderStyle="Solid" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Họ và tên" HeaderStyle-HorizontalAlign="Center" ControlStyle-Font-Size="Medium">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" Text='<%# Eval("Hoten") %>' />
                                                </ItemTemplate>
                                                <ControlStyle Font-Size="Medium"></ControlStyle>
                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Width="20%" HorizontalAlign="Left" VerticalAlign="Middle" />
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="Ky_Hoc" HeaderText="Mã ky">
                                            <ItemStyle Width="5%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="NOIDUNGDG" HeaderText="Nam học">
                                            <ItemStyle Width="20%" HorizontalAlign="Left" VerticalAlign="Middle" />
                                            </asp:BoundField>
                                            <asp:TemplateField HeaderText="DiemTC" HeaderStyle-HorizontalAlign="Center" ControlStyle-Font-Size="Medium">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" Text='<%# Eval("DIEMTC") %>' />
                                                </ItemTemplate>
                                                <ControlStyle Font-Size="Medium"></ControlStyle>
                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Width="5%" CssClass="text-center" HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </asp:TemplateField>                                            
                                            <asp:BoundField DataField="DIEMLOP" HeaderText="KiemLOP">
                                            <ItemStyle CssClass="text-center" Width="5%" />
                                            </asp:BoundField>
                                            <asp:TemplateField HeaderText="DiemKhoa" HeaderStyle-HorizontalAlign="Center" ControlStyle-Font-Size="Medium">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" Text='<%# Eval("DIEMKHOA") %>' />
                                                </ItemTemplate>
                                                <ControlStyle Font-Size="Medium"></ControlStyle>
                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Width="5%" CssClass="text-center" />
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="DIEMCTCT" HeaderText="DiemCTCT">
                                            <ItemStyle CssClass="text-center" Width="5%" />
                                            </asp:BoundField>
                                            <asp:TemplateField HeaderText="Xếp Loại" HeaderStyle-HorizontalAlign="Center" ControlStyle-Font-Size="Medium">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" Text='<%# Eval("tenPhanloaiRL") %>' Width="10%" CssClass="text-right" />
                                                </ItemTemplate>
                                                <ControlStyle Font-Size="Medium"></ControlStyle>
                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Width="10%" CssClass="text-center" />
                                            </asp:TemplateField>
                                            <asp:ButtonField ButtonType="Button" CommandName="btn_Cham" Text="Chấm điểm" >
                                            <ItemStyle Width="10%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </asp:ButtonField>
                                            <asp:ButtonField ButtonType="Button" CommandName="btn_phiem" Text="In phiếu" >
                                            <ItemStyle Width="10%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </asp:ButtonField>
                                        </Columns>
                                    </asp:GridView>
                                </td>
                            </tr>
                        </table>
                        <br />
                    </fieldset>
                </fieldset>          
            </div>
        </div>
        <div class="row text-center">
            <fieldset id="fld_inphieu" runat="server" visible="false">
                <div class="col-12 col-md-12 col-sm-12">
                    <div class="text-right">
                        <asp:Button ID="btn_dong" runat="server" Text="Thoát" CssClass="btn btn-info" OnClick="btn_dong_Click" />
                    </div>                    
                    <br />
                    <rsweb:ReportViewer ID="rv_inphieu" runat="server" Width="100%">
                    </rsweb:ReportViewer>
                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
                </div>
            </fieldset>
        </div>
        <div class="row text-center">
        <fieldset id="fldset_cham_rl" runat="server" visible="false">
            <div class="row d-flex align-items-center justify-content-center" style="background-color: #b1c7c5;">
                <div class="col-12 col-md-12 col-sm-12">
                    <h2 class="pdgia"><strong>PHIẾU ĐÁNH GIÁ KẾT QUẢ RÈN LUYỆN</strong></h2>
                    <h4 class="text-center"><i>(Mỗi kỳ sinh viên chỉ đánh giá kết quả rèn luyện một lần vào cuối ký theo kế hoạch của phòng CTCT)</i></h4>
                    <div class="form-horizontal ">
                        <table class="col-md-12 form-group" align="center" style="width: auto">
                            <tr>
                                <td colspan="4" style="text-align: center; color: red; font-weight: bold">
                                    <asp:Label ID="lbl_thongbao" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4" class="text-right">                                    
                                    <asp:Button ID="btnNopKL" runat="server" Width="150px" Text="Lưu và Nộp phiếu" CssClass="btn btn-primary" OnClick="btnNopKL_Click" ToolTip="Bấm vào để nộp phiếu đánh giá, khi đã nộp sẽ không được sửa." OnClientClick="javascript: return edit_confirm();" />
                                    <asp:Button ID="btn_thoat" runat="server" Width="150px" Text="Thoát" CssClass="btn btn-primary" OnClick="btn_thoat_Click" />
                                </td>
                            </tr>                            
                            <tr>                                
                                <td class="text-right">
                                    <asp:Label ID="lbl_ky" Visible="false" Text="Chọn kỳ đánh giá" runat="server" Font-Bold="True"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="drl_Ky" Visible="false" runat="server" Width="200px" AutoPostBack="True"></asp:DropDownList>
                                </td>
                                <td><asp:Label ID="lbl_diemctct" runat="server" Visible="true"></asp:Label></td>
                                <td>&nbsp;&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="text-right">
                                    <asp:Label ID="lbl_ky_dg" Text="" runat="server" Font-Bold="True"></asp:Label>
                                </td>
                                <td class="text-left">
                                    <asp:Label ID="lbl_ma_ky" Text="" runat="server"></asp:Label>
                                </td>
                                <td>&nbsp;&nbsp;</td>
                                <td>&nbsp;&nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="4" class="text-center">
                                    <asp:Label ID="lbl_mess" runat="server" Text="" Visible="true" CssClass="text-danger"></asp:Label>
                                    &nbsp;</td>
                            </tr>
                            <tr class="text-left">
                                <td><asp:Label ID="hoten" runat="server" Text=""></asp:Label></td>
                                <td><asp:Label ID="ngaysinh" runat="server" Text=""></asp:Label></td>
                                <td>&nbsp;&nbsp;</td>
                                <td>&nbsp;&nbsp;</td>
                            </tr>
                            <tr class="text-left">
                                <td><asp:Label ID="Lop" runat="server" Text=""></asp:Label></td>
                                <td><asp:Label ID="Noisinh" runat="server" Text=""></asp:Label></td>
                                <td>&nbsp; &nbsp;</td>
                                <td>&nbsp;&nbsp;</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td>&nbsp;&nbsp;</td>
                                <td>&nbsp;&nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <fieldset id="fieldset_diem" runat="server" visible="true">
                                        <table border="1">
                                            <tr>
                                                <td width="3%"><strong>TT</strong></td>
                                                <td width="80%">
                                                    <h5 class="text-center"><strong>Căn cứ đánh giá</strong></h5>
                                                </td>
                                                <td width="7%" class="text-center">
                                                    <h6><strong>Điểm quy định</strong></h6>
                                                </td>
                                                <td width="10%" class="text-center">
                                                    <h6><strong>Cá nhân tự chấm</strong></h6>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="3%">1.</td>
                                                <td width="80%">
                                                    <h5 class="text-justify">Đánh giá ý thức, thái độ và kết quả học tập <em>(tính theo tháng điểm 4)</em></h5>
                                                </td>
                                                <td width="10%" class="text-center">
                                                    <h5>30</h5>
                                                </td>
                                                <td width="7%" class="text-center">
                                                    <asp:TextBox ID="t1" runat="server" Text="0" Width="50px" CssClass="text-center" Enabled="false" AutoPostBack="True"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr style="text-align: left">
                                                <td>1.1.</td>
                                                <td>
                                                    <h5 class="text-justify">Đi học đúng giờ, đầy đủ <strong>(Vắng 1 buổi trừ 1 điểm, trừ trường hợp có phép đúng quy định)</strong></h5>
                                                </td>
                                                <td class="text-center">
                                                    <h5>10</h5>
                                                </td>
                                                <td class="text-center">
                                                    <asp:TextBox ID="t11" runat="server" Text="0" Width="50px" CssClass="text-center" Enabled="False"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr style="text-align: left">
                                                <td>1.2.</td>
                                                <td>
                                                    <h5 class="auto-style3">Điểm về kết quả học tập <em>(Tính điểm lần 1)</em> <strong>(Khoa chấm)</strong></h5>
                                                </td>
                                                <td class="text-center">
                                                    <h5>15</h5>
                                                </td>
                                                <td class="text-center">
                                                    <asp:TextBox ID="t12" runat="server" Text="0" Width="50px" CssClass="text-center" Enabled="false"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr style="text-align: left">
                                                <td></td>
                                                <td>
                                                    <h5 class="auto-style3">Điểm TBCHT từ 3.6 đến 4.0</h5>
                                                </td>
                                                <td class="text-center">
                                                    <h5>15</h5>
                                                </td>
                                                <td class="text-center">
                                                    <asp:TextBox ID="t121" runat="server" Text="0" Width="50px" CssClass="text-center" Enabled="False"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr style="text-align: left">
                                                <td></td>
                                                <td>
                                                    <h5 class="auto-style3">Điểm TBCHT từ 3.2 đến 3.59</h5>
                                                </td>
                                                <td class="text-center">
                                                    <h5>13</h5>
                                                </td>
                                                <td class="text-center">
                                                    <asp:TextBox ID="t122" runat="server" Text="0" Width="50px" CssClass="text-center" Enabled="False"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr style="text-align: left">
                                                <td></td>
                                                <td>
                                                    <h5 class="auto-style3">Điểm TBCHT từ 2.5 đến 3.19</h5>
                                                </td>
                                                <td class="text-center">
                                                    <h5>11</h5>
                                                </td>
                                                <td class="text-center">
                                                    <asp:TextBox ID="t123" runat="server" Text="0" Width="50px" CssClass="text-center" Enabled="False"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr style="text-align: left">
                                                <td></td>
                                                <td>
                                                    <h5 class="auto-style3">Điểm TBCHT từ 2.0 đến 2.49</h5>
                                                </td>
                                                <td class="text-center">
                                                    <h5>9</h5>
                                                </td>
                                                <td class="text-center">
                                                    <asp:TextBox ID="t124" runat="server" Text="0" Width="50px" CssClass="text-center" Enabled="False"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr style="text-align: left">
                                                <td></td>
                                                <td>
                                                    <h5 class="auto-style3">Điểm TBCHT từ 2.0</h5>
                                                </td>
                                                <td class="text-center">
                                                    <h5>7</h5>
                                                </td>
                                                <td class="text-center">
                                                    <asp:TextBox ID="t125" runat="server" Text="0" Width="50px" CssClass="text-center" Enabled="False"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style1">1.3</td>
                                                <td class="auto-style1">
                                                    <h5 class="text-justify">Điểm thưởng về học tập <strong>(Khoa chấm)</strong></h5>
                                                </td>
                                                <td class="auto-style2">
                                                    <h5>5</h5>
                                                </td>
                                                <td class="auto-style2">
                                                    <asp:TextBox ID="t13" runat="server" Text="0" Width="50px" CssClass="text-center" Enabled="false"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td>
                                                    <h5 class="text-justify">Không có học phần nào bị điểm C trở xuống</h5>
                                                </td>
                                                <td class="text-center">
                                                    <h5>5</h5>
                                                </td>
                                                <td class="text-center">
                                                    <asp:TextBox ID="t131" runat="server" Text="0" Width="50px" CssClass="text-center" AutoPostBack="True" Enabled="False"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td>
                                                    <h5 class="text-justify">Không có học phần nào bị điểm F</h5>
                                                </td>
                                                <td class="text-center">
                                                    <h5>3</h5>
                                                </td>
                                                <td class="text-center">
                                                    <asp:TextBox ID="t132" runat="server" Text="0" Width="50px" CssClass="text-center" AutoPostBack="True" Enabled="False"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>2.</td>
                                                <td>
                                                    <h5 class="text-justify">Đánh giá về ý thức chấp hành pháp luật và nội quy, quy chế của nhà trường</h5>
                                                </td>
                                                <td class="text-center">
                                                    <h5>25</h5>
                                                </td>
                                                <td class="text-center">
                                                    <asp:TextBox ID="t2" runat="server" Text="0" Width="50px" CssClass="text-center" Enabled="false"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>2.1</td>
                                                <td>
                                                    <h5 class="text-justify">Không vi phạm quy chế thi <strong><em>(Vi phạm không có điểm)</em></strong></h5>
                                                </td>
                                                <td class="text-center">
                                                    <h5>5</h5>
                                                </td>
                                                <td class="text-center">
                                                    <asp:TextBox ID="t21" runat="server" Text="0" Width="50px" CssClass="text-center"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>2.2</td>
                                                <td>
                                                    <h5 class="text-justify">Thực hiện nếp sống văn hóa do nhà trường quy định (Không dùng những lời lẽ thiếu văn hóa, không hút thuốc lá trong trường, giữ gìn vệ sinh tốt, để xe đúng nơi quy định...)</h5>
                                                </td>
                                                <td class="text-center">
                                                    <h5>5</h5>
                                                </td>
                                                <td class="text-center">
                                                    <asp:TextBox ID="t22" runat="server" Text="0" Width="50px" CssClass="text-center"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>2.3</td>
                                                <td>
                                                    <h5 class="text-justify">Thực hiện đúng quy chế khác của nhà trường</h5>
                                                </td>
                                                <td class="text-center">
                                                    <h5>5</h5>
                                                </td>
                                                <td class="text-center">
                                                    <asp:TextBox ID="t23" runat="server" Text="0" Width="50px" CssClass="text-center"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="text-justify">2.4</td>
                                                <td class="text-justify">
                                                    <h5>Chấp hành đúng chủ trương pháp luật của nhà nước</h5>
                                                </td>
                                                <td class="text-center">
                                                    <h5>5</h5>
                                                </td>
                                                <td class="text-center">
                                                    <asp:TextBox ID="t24" runat="server" Text="0" Width="50px" CssClass="text-center"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>2.5</td>
                                                <td>
                                                    <h5 class="text-justify">Đóng học phí, BHYT và đoàn phí đầy đủ, đúng thời gian quy định <strong><em>(Vi phạm 1 trong 3 nội dung này trừ 5 điểm)</em></strong></h5>
                                                </td>
                                                <td class="text-center">
                                                    <h5>5</h5>
                                                </td>
                                                <td class="text-center">
                                                    <asp:TextBox ID="t25" runat="server" Text="0" Width="50px" CssClass="text-center"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>3.</td>
                                                <td>
                                                    <h5 class="text-justify"><strong>Đánh giá về ý thức tham gia các hoạt động chính trị - xã hội, văn hóa, văn nghệ, thể thao, phòng chống tội phạm và các tệ nạn xã hội, bạo lực học đường</strong></h5>
                                                </td>
                                                <td class="text-center">
                                                    <h5>25</h5>
                                                </td>
                                                <td class="text-center">
                                                    <asp:TextBox ID="t3" runat="server" Text="0" Width="50px" CssClass="text-center" Enabled="false"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>3.1</td>
                                                <td>
                                                    <h5 class="text-justify">Tham gia đầy đủ và đạt kết quả cao tuần lễ "Sinh hoạt công dân", các buổi sinh hoạt chính trị, thời sự<strong><em> (Vắng 1 buổi không lý do trừ 1 điểm)</em></strong></h5>
                                                </td>
                                                <td class="text-center">
                                                    <h5>5</h5>
                                                </td>
                                                <td class="text-center">
                                                    <asp:TextBox ID="t31" runat="server" Text="0" Width="50px" CssClass="text-center"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>3.2</td>
                                                <td>
                                                    <h5 class="text-justify">Tham gia đầy đủ các buổi sinh hoạt lớp<strong><em> (Vắng 1 buổi không lý do trừ 1 điểm)</em></strong></h5>
                                                </td>
                                                <td class="text-center">
                                                    <h5>5</h5>
                                                </td>
                                                <td class="text-center">
                                                    <asp:TextBox ID="t32" runat="server" Text="0" Width="50px" CssClass="text-center"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>3.3</td>
                                                <td>
                                                    <h5 class="text-justify">Tham gia các hoạt động phong trào do trường, khoa, lớp tổ chức<strong><em> (Vắng 1 buổi không lý do trừ 1 điểm)</em></strong></h5>
                                                </td>
                                                <td class="text-center">
                                                    <h5>5</h5>
                                                </td>
                                                <td class="text-center">
                                                    <asp:TextBox ID="t33" runat="server" Text="0" Width="50px" CssClass="text-center"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>3.4</td>
                                                <td>
                                                    <h5 class="text-justify">Tham gia đấu tranh phòng chống tệ nạn xã hội như: Mại dâm, ma túy, gây mất an ninh trật tự…</h5>
                                                </td>
                                                <td class="text-center">
                                                    <h5>5</h5>
                                                </td>
                                                <td class="text-center">
                                                    <asp:TextBox ID="t34" runat="server" Text="0" Width="50px" CssClass="text-center"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>3.5</td>
                                                <td>
                                                    <h5 class="text-justify">Tham gia đóng góp cho phong trào HSSV tình nguyện.</h5>
                                                </td>
                                                <td class="text-center">
                                                    <h5>5</h5>
                                                </td>
                                                <td class="text-center">
                                                    <asp:TextBox ID="t35" runat="server" Text="0" Width="50px" CssClass="text-center"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>4.</td>
                                                <td>
                                                    <h5 class="text-justify"><strong>Đánh giá về ý thức và kết quả khi tham gia công tác cán bộ lớp, các đoàn thể, tổ chức trong nhà trường hoặc có thành tích xuất sắc trong học tập, rèn luyện được cơ quan có thẩm quyền khen thưởng</strong> </h5>
                                                </td>
                                                <td class="text-center">
                                                    <h5>20</h5>
                                                </td>
                                                <td class="text-center">
                                                    <asp:TextBox ID="t4" runat="server" Text="0" Width="50px" CssClass="text-center" Enabled="False"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>4.1</td>
                                                <td>
                                                    <h5 class="text-justify">BCS Lớp, BCH chi đoàn điều hành tham gia đủ các hoạt động của nhà trường, Đoàn, Hội, ...</h5>
                                                </td>
                                                <td class="text-center">
                                                    <h5>5</h5>
                                                </td>
                                                <td class="text-center">
                                                    <asp:TextBox ID="t41" runat="server" Text="0" Width="50px" CssClass="text-center"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>4.2</td>
                                                <td>
                                                    <h5 class="text-justify">Có hành động tuyên truyền, vận động, lôi cuốn người khác tham gia công việc chung của trường, khoa, lớp, công tác Đoàn, Hội, ...</h5>
                                                </td>
                                                <td class="text-center">
                                                    <h5>5</h5>
                                                </td>
                                                <td class="text-center">
                                                    <asp:TextBox ID="t42" runat="server" Text="0" Width="50px" CssClass="text-center"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>4.3</td>
                                                <td>
                                                    <h5 class="text-justify">Có thành tích trong nghiên cứu khoa học, tham gia các cuộc thi, sáng kiến cải tiến kỹ thuật được Nhà trường hoặc các cơ quan có thẩm quyền công nhận.</h5>
                                                </td>
                                                <td class="text-center">
                                                    <h5>5</h5>
                                                </td>
                                                <td class="text-center">
                                                    <asp:TextBox ID="t43" runat="server" Text="0" Width="50px" CssClass="text-center"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>4.4</td>
                                                <td>
                                                    <h5 class="text-justify">Tham gia các hoạt động nhân đạo, từ thiện; Có tinh thần cưu mang giúp đỡ người gặp khó khăn; Có hành vi giúp đỡ bạn bè trong học tập, trong cuộc sống được tập thể công nhận.</h5>
                                                </td>
                                                <td class="text-center">
                                                    <h5>5</h5>
                                                </td>
                                                <td class="text-center">
                                                    <asp:TextBox ID="t44" runat="server" Text="0" Width="50px" CssClass="text-center" MaxLength="5"></asp:TextBox>
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
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <h5 class="text-justify">* Lưu ý:<br />
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
                    <br />
                </div>
            </div>
        </fieldset>
        </div>
    </div>
</asp:Content>


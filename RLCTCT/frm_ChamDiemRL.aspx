﻿<%@ Page Title="" Language="C#" MasterPageFile="~/RLCTCT/renluyen.Master" AutoEventWireup="true" CodeFile="frm_ChamDiemRL.aspx.cs" Inherits="RLCTCT_frm_ChamDiemRL" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .pdgia {
            color: #FF0000;
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container  justify-content-center" style="margin: auto; font-family: 'Times New Roman', Times, serif">
        <div class="row d-flex align-items-center justify-content-center" style="background-color: #b1c7c5;">
            <div class="col-12">
                <div class="text-right">
                    <asp:ImageButton ID="imgCmdBack" runat="server"
                        ImageUrl="~/RLCTCT/img/cmdBack.gif" OnClick="imgCmdBack_Click" />
                </div>
                <br />
                <h2 class="pdgia"><strong>PHIẾU ĐÁNH GIÁ KẾT QUẢ RÈN LUYỆN</strong></h2>
                <h4 class="text-center"><i>(Mỗi kỳ sinh viên chỉ đánh giá kết quả rèn luyện một lần vào cuối ký theo kế hoạch của phòng CTCT)</i></h4>
                <div class="form-horizontal ">
                    <table class="col-md-12 form-group" align="center" style="width: auto">
                        <tr>
                            <td colspan="2" style="text-align: center; color: red; font-weight: bold">
                                <asp:Label ID="lbl_thongbao" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="text-right">
                                <asp:Button ID="btnInKL" runat="server" Width="200px" Text="Xem phiếu đánh giá" CssClass="btn btn-danger" OnClick="btnInKL_Click" Visible="true" />
                                <asp:Button ID="btnNopKL" runat="server" Width="150px" Text="Lưu và Nộp phiếu" CssClass="btn btn-primary" OnClick="btnNopKL_Click" ToolTip="Bấm vào để nộp phiếu đánh giá, khi đã nộp sẽ không được sửa." OnClientClick="javascript: return edit_confirm();" />
                            </td>
                        </tr>
                        <tr >
                            <td class="text-right">
                                <asp:Label ID="lbl_ky" Text="Chọn kỳ đánh giá" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="drl_Ky" runat="server" Width="200px" AutoPostBack="True" OnTextChanged="drl_Ky_TextChanged"></asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="text-center">
                                <asp:Label ID="lbl_mess" runat="server" Text="" Visible="true" CssClass="text-danger"></asp:Label>
                            &nbsp;</td>
                        <tr>
                            <td colspan="2">
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
                                            <td Width="3%">1.</td>
                                            <td Width="80%">
                                                <h5>Đánh giá ý thức, thái độ và kết quả học tập <em>(tính theo tháng điểm 4)</em></h5>
                                            </td>
                                            <td Width="10%" class="text-center">
                                                <h5>30</h5>
                                            </td>
                                            <td Width="7%" class="text-center">
                                                <asp:TextBox ID="txt1" runat="server" Text="0" Width="50px" CssClass="text-center" Enabled="false" AutoPostBack="True"></asp:TextBox>
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
                                                <asp:TextBox ID="txt11" runat="server" Text="0" Width="50px" CssClass="text-center" AutoPostBack="True" OnTextChanged="txt11_TextChanged"></asp:TextBox>
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
                                                <asp:TextBox ID="txt12" runat="server" Text="0" Width="50px" CssClass="text-center" Enabled="false"></asp:TextBox>
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
                                                <asp:TextBox ID="txt121" runat="server" Text="0" Width="50px" CssClass="text-center" Enabled="False"></asp:TextBox>
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
                                                <asp:TextBox ID="txt122" runat="server" Text="0" Width="50px" CssClass="text-center" Enabled="False"></asp:TextBox>
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
                                                <asp:TextBox ID="txt123" runat="server" Text="0" Width="50px" CssClass="text-center" Enabled="False"></asp:TextBox>
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
                                                <asp:TextBox ID="txt124" runat="server" Text="0" Width="50px" CssClass="text-center" Enabled="False"></asp:TextBox>
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
                                                <asp:TextBox ID="txt125" runat="server" Text="0" Width="50px" CssClass="text-center" Enabled="False"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>1.3</td>
                                            <td>
                                                <h5>Điểm thưởng về học tập <strong>(Khoa chấm)</strong></h5>
                                            </td>
                                            <td class="text-center">
                                                <h5>5</h5>
                                            </td>
                                            <td class="text-center">
                                                <asp:TextBox ID="txt13" runat="server" Text="0" Width="50px" CssClass="text-center" Enabled="false"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td>
                                                <h5>Không có học phần nào bị điểm C trở xuống</h5>
                                            </td>
                                            <td class="text-center">
                                                <h5>5</h5>
                                            </td>
                                            <td class="text-center">
                                                <asp:TextBox ID="txt131" runat="server" Text="0" Width="50px" CssClass="text-center" AutoPostBack="True" Enabled="False"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td>
                                                <h5>Không có học phần nào bị điểm F</h5>
                                            </td>
                                            <td class="text-center">
                                                <h5>3</h5>
                                            </td>
                                            <td class="text-center">
                                                <asp:TextBox ID="txt132" runat="server" Text="0" Width="50px" CssClass="text-center" AutoPostBack="True" Enabled="False"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>2.</td>
                                            <td>
                                                <h5>Đánh giá về ý thức chấp hành pháp luật và nội quy, quy chế của nhà trường</h5>
                                            </td>
                                            <td class="text-center">
                                                <h5>25</h5>
                                            </td>
                                            <td class="text-center">
                                                <asp:TextBox ID="txt2" runat="server" Text="25" Width="50px" CssClass="text-center" Enabled="false"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>2.1</td>
                                            <td>
                                                <h5>Không vi phạm quy chế thi <strong><em>(Vi phạm không có điểm)</em></strong></h5>
                                            </td>
                                            <td class="text-center">
                                                <h5>5</h5>
                                            </td>
                                            <td class="text-center">
                                                <asp:TextBox ID="txt21" runat="server" Text="5" Width="50px" CssClass="text-center" AutoPostBack="True"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>2.2</td>
                                            <td>
                                                <h5>Thực hiện nếp sống văn hóa do nhà trường quy định (Không dùng những lời lẽ thiếu văn hóa, không hút thuốc lá trong trường, giữ gìn vệ sinh tốt, để xe đúng nơi quy định...)</h5>
                                            </td>
                                            <td class="text-center">
                                                <h5>5</h5>
                                            </td>
                                            <td class="text-center">
                                                <asp:TextBox ID="txt22" runat="server" Text="5" Width="50px" CssClass="text-center" AutoPostBack="True"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>2.3</td>
                                            <td>
                                                <h5>Thực hiện đúng quy chế khác của nhà trường</h5>
                                            </td>
                                            <td class="text-center">
                                                <h5>5</h5>
                                            </td>
                                            <td class="text-center">
                                                <asp:TextBox ID="txt23" runat="server" Text="5" Width="50px" CssClass="text-center" AutoPostBack="True"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>2.4</td>
                                            <td>
                                                <h5>Chấp hành đúng chủ trương pháp luật của nhà nước</h5>
                                            </td>
                                            <td class="text-center">
                                                <h5>5</h5>
                                            </td>
                                            <td class="text-center">
                                                <asp:TextBox ID="txt24" runat="server" Text="5" Width="50px" CssClass="text-center" AutoPostBack="True"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>2.4</td>
                                            <td>
                                                <h5>Đóng học phí, BHYT và đoàn phí đầy đủ, đúng thời gian quy định <strong><em>(Vi phạm 1 trong 3 nội dung này trừ 5 điểm)</em></strong></h5>
                                            </td>
                                            <td class="text-center">
                                                <h5>5</h5>
                                            </td>
                                            <td class="text-center">
                                                <asp:TextBox ID="txt25" runat="server" Text="5" Width="50px" CssClass="text-center" AutoPostBack="True"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>3.</td>
                                            <td>
                                                <h5><strong>Đánh giá về ý thức tham gia các hoạt động chính trị - xã hội, văn hóa, văn nghệ, thể thao, phòng chống tội phạm và các tệ nạn xã hội, bạo lực học đường</strong></h5>
                                            </td>
                                            <td class="text-center">
                                                <h5>25</h5>
                                            </td>
                                            <td class="text-center">
                                                <asp:TextBox ID="txt3" runat="server" Text="25" Width="50px" CssClass="text-center" Enabled="false"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>3.1</td>
                                            <td>
                                                <h5>Tham gia đầy đủ và đạt kết quả cao tuần lễ "Sinh hoạt công dân", các buổi sinh hoạt chính trị, thời sự<strong><em> (Vắng 1 buổi không lý do trừ 1 điểm)</em></strong></h5>
                                            </td>
                                            <td class="text-center">
                                                <h5>5</h5>
                                            </td>
                                            <td class="text-center">
                                                <asp:TextBox ID="txt31" runat="server" Text="5" Width="50px" CssClass="text-center"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>3.2</td>
                                            <td>
                                                <h5>Tham gia đầy đủ các buổi sinh hoạt lớp<strong><em> (Vắng 1 buổi không lý do trừ 1 điểm)</em></strong></h5>
                                            </td>
                                            <td class="text-center">
                                                <h5>5</h5>
                                            </td>
                                            <td class="text-center">
                                                <asp:TextBox ID="txt32" runat="server" Text="5" Width="50px" CssClass="text-center"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>3.3</td>
                                            <td>
                                                <h5>Tham gia các hoạt động phong trào do trường, khoa, lớp tổ chức<strong><em> (Vắng 1 buổi không lý do trừ 1 điểm)</em></strong></h5>
                                            </td>
                                            <td class="text-center">
                                                <h5>5</h5>
                                            </td>
                                            <td class="text-center">
                                                <asp:TextBox ID="txt33" runat="server" Text="5" Width="50px" CssClass="text-center" AutoPostBack="True"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>3.4</td>
                                            <td>
                                                <h5>Tham gia đấu tranh phòng chống tệ nạn xã hội như: Mại dâm, ma túy, gây mất an ninh trật tự…</h5>
                                            </td>
                                            <td class="text-center">
                                                <h5>5</h5>
                                            </td>
                                            <td class="text-center">
                                                <asp:TextBox ID="txt34" runat="server" Text="5" Width="50px" CssClass="text-center" AutoPostBack="True"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>3.5</td>
                                            <td>
                                                <h5>Tham gia đóng góp cho phong trào HSSV tình nguyện.</h5>
                                            </td>
                                            <td class="text-center">
                                                <h5>5</h5>
                                            </td>
                                            <td class="text-center">
                                                <asp:TextBox ID="txt35" runat="server" Text="5" Width="50px" CssClass="text-center" AutoPostBack="True"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>4.</td>
                                            <td>
                                                <h5><strong>Đánh giá về ý thức và kết quả khi tham gia công tác cán bộ lớp, các đoàn thể, tổ chức trong nhà trường hoặc có thành tích xuất sắc trong học tập, rèn luyện được cơ quan có thẩm quyền khen thưởng</strong> </h5>
                                            </td>
                                            <td class="text-center">
                                                <h5>20</h5>
                                            </td>
                                            <td class="text-center">
                                                <asp:TextBox ID="txt4" runat="server" Text="20" Width="50px" CssClass="text-center" Enabled="false"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>4.1</td>
                                            <td>
                                                <h5>BCS Lớp, BCH chi đoàn điều hành tham gia đủ các hoạt động của nhà trường, Đoàn, Hội, ...</h5>
                                            </td>
                                            <td class="text-center">
                                                <h5>5</h5>
                                            </td>
                                            <td class="text-center">
                                                <asp:TextBox ID="txt41" runat="server" Text="5" Width="50px" CssClass="text-center" AutoPostBack="True"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>4.2</td>
                                            <td>
                                                <h5>Có hành động tuyên truyền, vận động, lôi cuốn người khác tham gia công việc chung của trường, khoa, lớp, công tác Đoàn, Hội, ...</h5>
                                            </td>
                                            <td class="text-center">
                                                <h5>5</h5>
                                            </td>
                                            <td class="text-center">
                                                <asp:TextBox ID="txt42" runat="server" Text="5" Width="50px" CssClass="text-center" AutoPostBack="True"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>4.3</td>
                                            <td>
                                                <h5>Có thành tích trong nghiên cứu khoa học, tham gia các cuộc thi, sáng kiến cải tiến kỹ thuật được Nhà trường hoặc các cơ quan có thẩm quyền công nhận.</h5>
                                            </td>
                                            <td class="text-center">
                                                <h5>5</h5>
                                            </td>
                                            <td class="text-center">
                                                <asp:TextBox ID="txt43" runat="server" Text="5" Width="50px" CssClass="text-center" AutoPostBack="True"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>4.4</td>
                                            <td>
                                                <h5>Tham gia các hoạt động nhân đạo, từ thiện; Có tinh thần cưu mang giúp đỡ người gặp khó khăn; Có hành vi giúp đỡ bạn bè trong học tập, trong cuộc sống được tập thể công nhận.</h5>
                                            </td>
                                            <td class="text-center">
                                                <h5>5</h5>
                                            </td>
                                            <td class="text-center">
                                                <asp:TextBox ID="txt44" runat="server" Text="5" Width="50px" CssClass="text-center" AutoPostBack="True"></asp:TextBox>
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
                                                <asp:TextBox ID="txt_tong" runat="server" Text="100" Width="50px" CssClass="text-center" Enabled="false"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="4">
                                                <h5 style="text-align:justify">* Lưu ý:<br />
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
                            <td colspan="2" class="text-center">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                            
                                <script language="javascript">
                                    function edit_confirm() {
                                        var result = confirm("Khị bạn bấm vào nút này thì có nghĩa đã chỉnh sửa hết khối lượng.\nBạn có chắc chắn muốn nộp khối lượng này không? Nếu Bấm OK sẽ Nộp khối lượng lên tổ bộ môn.\nKhi đã nộp sẽ không thể sửa được nữa khối lượng được nữa.\n Bấm Cancel để quay lại chỉnh sửa khối lượng.");
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
            </div>
        </div>
        
    </div>
</asp:Content>


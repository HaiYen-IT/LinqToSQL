<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Test.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 150px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table style="width:100%;">
                <tr>
                    <td colspan="2">TÌM KIẾM - SỬA - XÓA SINH VIÊN</td>
                </tr>
                <tr>
                    <td class="auto-style1">Khoa đào tạo:</td>
                    <td>
                        <asp:DropDownList ID="ddlKhoa" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlKhoa_SelectedIndexChanged" Width="260px">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">Lớp BC:</td>
                    <td>
                        <asp:TextBox ID="txtLopBC" runat="server" Width="254px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">Mã sinh viên:</td>
                    <td>
                        <asp:TextBox ID="txtMaSV" runat="server" Width="254px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">Họ và tên:</td>
                    <td>
                        <asp:TextBox ID="txtHoTen" runat="server" Width="254px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">Ngày sinh:</td>
                    <td>
                        <asp:TextBox ID="txtNgaySinh" runat="server" Width="254px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">Địa chỉ:</td>
                    <td>
                        <asp:TextBox ID="txtDiaChi" runat="server" Width="254px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">&nbsp;</td>
                    <td>
                        <asp:Button ID="btnThem" runat="server" Text="Thêm" Width="79px" OnClick="btnThem_Click" />
                        <asp:Button ID="btnGhi" runat="server" Text="Ghi lại" Width="79px" OnClick="btnGhi_Click" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowCommand="GridView1_RowCommand">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="MaSV" HeaderText="Mã SV" />
                                <asp:BoundField DataField="HoTen" HeaderText="Họ và tên" />
                                <asp:BoundField DataField="NgaySinh" HeaderText="Ngày sinh" />
                                <asp:BoundField DataField="DiaChi" HeaderText="Địa chỉ" />
                                <asp:BoundField DataField="LopBC" HeaderText="Lớp BC" />
                                <asp:ButtonField ButtonType="Button" CommandName="btnSua" HeaderText="Sửa" Text="Sửa" />
                                <asp:ButtonField ButtonType="Button" CommandName="btnXoa" HeaderText="Xóa" Text="Xóa" />
                            </Columns>
                            <EditRowStyle BackColor="#7C6F57" />
                            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#E3EAEB" />
                            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F8FAFA" />
                            <SortedAscendingHeaderStyle BackColor="#246B61" />
                            <SortedDescendingCellStyle BackColor="#D4DFE1" />
                            <SortedDescendingHeaderStyle BackColor="#15524A" />
                        </asp:GridView>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>

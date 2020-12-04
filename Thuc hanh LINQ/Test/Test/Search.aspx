<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="Test.Search" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

        .auto-style1 {
            width: 126px;
        }
        .auto-style2 {
            width: 128px;
        }
        .auto-style3 {
            width: 122px;
        }
        .auto-style4 {
            width: 157px;
        }
        .auto-style6 {
        height: 201px;
    }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table style="width:100%;">
            <tr>
                <td colspan="5">TÌM KIẾM THEO MÃ SINH VIÊN HOẶC TÊN</td>
            </tr>
            <tr>
                <td class="auto-style1">Tìm theo:</td>
                <td class="auto-style2">
                    <asp:DropDownList ID="ddlMaSV" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlMaSV_SelectedIndexChanged">
                        <asp:ListItem>Mã sinh viên</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style3">Nội dung tìm:</td>
                <td class="auto-style4">
                    <asp:TextBox ID="txtTen" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:Button ID="btnTim" runat="server" OnClick="btnTim_Click" Text="Tìm" Width="77px" />
                </td>
            </tr>
            <tr>
                <td class="auto-style6" colspan="5">
                    <asp:GridView ID="GrvData" runat="server" AutoGenerateColumns="False" CellPadding="4" CssClass="auto-style5" ForeColor="#333333" GridLines="None" OnRowCommand="GridViewData_RowCommand" Width="557px">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="MaSV" HeaderText="Mã SV" />
                            <asp:BoundField DataField="HoTen" HeaderText="Họ và tên" />
                            <asp:BoundField DataField="TenKhoa" HeaderText="Tên khoa" />
                            <asp:ButtonField ButtonType="Button" CommandName="btnChiTiet" HeaderText="Chi tiết" Text="Chi tiết" />
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
            <tr>
                <td class="auto-style6" colspan="5">
                    <asp:GridView ID="GridViewDangKy" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="241px">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="TenMon" HeaderText="Tên môn" >
                            <ItemStyle Width="200px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="NamHK" HeaderText="Năm đăng ký" >
                            <ItemStyle Width="150px" />
                            </asp:BoundField>
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
    </form>
</body>
</html>

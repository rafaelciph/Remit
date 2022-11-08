<%@ Page Title="Uploading Records" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Uploading.aspx.vb" Inherits="Boss_Uploading" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style10
        {
            height: 22px;
        }
        .style12
        {
        }
        .style13
        {
            width: 48px;
            height: 48px;
        }
        .style14
        {
            width: 70px;
        }
        .style15
        {
            width: 43px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <table class="style5">
        <tr>
            <td class="style14">
                <table class="style5" style="width: 431%">
                    <tr>
                        <td class="style15">
                            <img class="style13" src="../Images/Folder-Upload-icon.png" /></td>
                        <td>
                            <strong>&nbsp;Uploading Record.</strong></td>
                    </tr>
                </table>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="Button2" runat="server" Text="Upload Excel Spreadsheet" 
                    Width="176px" />
                <asp:Button ID="Button1" runat="server" Text="View Excel Data" Width="152px" />
                <asp:Button ID="Button4" runat="server" Text="Import Excel Data" 
                    Width="144px" />
            </td>
        </tr>
        <tr>
            <td class="style10" colspan="2">
            </td>
        </tr>
        <tr>
            <td class="style12" colspan="2">
                <asp:MultiView ID="MultiView1" runat="server">
                    <asp:View ID="View1" runat="server">
                        <asp:GridView ID="GridViewExcel" runat="server" CellPadding="4" 
                            ForeColor="#333333" GridLines="None">
                            <RowStyle BackColor="#EFF3FB" />
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <EditRowStyle BackColor="#2461BF" />
                            <AlternatingRowStyle BackColor="White" />
                        </asp:GridView>
                        <asp:Label ID="Label1" runat="server" Text="There are no Excel file to Preview" 
                            Visible="False"></asp:Label>
                        <br />
                        <asp:Label ID="Label2" runat="server" Text="Please Upload the Excel file first" 
                            Visible="False"></asp:Label>
                    </asp:View>
                    <asp:View ID="View2" runat="server">
                        &nbsp;<asp:FileUpload ID="FileUploadExcel" runat="server" Width="304px" />
                        <asp:Label ID="Label5" runat="server"></asp:Label>
                        <br />
                        &nbsp;Please select an Excel file to import:<br />
            <br />
                        &nbsp;<asp:Button ID="Button3" runat="server" Text="Upload File" Width="120px" />
                        <br />
                        <asp:Label ID="LabelUpload" runat="server" BackColor="White" 
                            ForeColor="#C00000"></asp:Label>
                        <br />
                    </asp:View>
                    <asp:View ID="View3" runat="server">
                        <asp:Label ID="Label3" runat="server"></asp:Label>
                        <br />
            <br />
                        <asp:Label ID="Label4" runat="server"></asp:Label>
                        <br />
                    </asp:View>
                </asp:MultiView>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>


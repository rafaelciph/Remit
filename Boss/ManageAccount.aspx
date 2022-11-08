<%@ Page Title="Account Settings" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="ManageAccount.aspx.vb" Inherits="Boss_ManageAccount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style9
        {
            width: 45px;
        }
        .style10
        {
            width: 48px;
            height: 48px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <p>
        <table class="style5">
            <tr>
                <td class="style9">
                    <img class="style10" src="../Images/App-password-icon.png" /></td>
                <td>
                    <strong>&nbsp;User Account / Change Password</strong></td>
            </tr>
        </table>
        <table __designer:mapid="241" style="width:100%;">
            <tr __designer:mapid="242">
                <td __designer:mapid="243" style="width: 171px">
                    <asp:Label ID="Label6" runat="server" Text="Username"></asp:Label>
                </td>
                <td __designer:mapid="245">
                    <asp:TextBox ID="txtchuser" runat="server" Width="131px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="txtchuser" ErrorMessage="*" style="color: #CC0000"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr __designer:mapid="247">
                <td __designer:mapid="248" style="width: 171px">
                    <asp:Label ID="Label7" runat="server" Text="Password"></asp:Label>
                </td>
                <td __designer:mapid="24a">
                    <asp:TextBox ID="txtchpass" runat="server" Width="131px">welcome_1234</asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="txtchpass" ErrorMessage="*" style="color: #CC0000"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr __designer:mapid="24c">
                <td __designer:mapid="24d" style="width: 171px">
                    <asp:Label ID="Label9" runat="server" Text="Security Answer"></asp:Label>
                </td>
                <td __designer:mapid="24f">
                    <asp:TextBox ID="txtchasw" runat="server" Height="22px" Width="50px">b</asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txtchasw" ErrorMessage="*" style="color: #CC0000"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr __designer:mapid="251">
                <td __designer:mapid="252" style="width: 171px">
                    <asp:Label ID="Label8" runat="server" Text="..."></asp:Label>
                </td>
                <td __designer:mapid="254">
                    <asp:Button ID="btnchpass" runat="server" Text="Reset Password" Width="131px" />
                </td>
            </tr>
            <tr __designer:mapid="251">
                <td __designer:mapid="252" style="width: 171px">
                    &nbsp;</td>
                <td __designer:mapid="254">
                    &nbsp;</td>
            </tr>
            <tr __designer:mapid="251">
                <td __designer:mapid="252" style="width: 171px">
                    &nbsp;</td>
                <td __designer:mapid="254">
                    <asp:TextBox ID="txtusers" runat="server"></asp:TextBox>
                    <asp:Label ID="lblResult" runat="server" ForeColor="Maroon" 
                        style="font-size: x-small">Enter user name you want to remove</asp:Label>
                </td>
            </tr>
            <tr __designer:mapid="251">
                <td __designer:mapid="252" style="width: 171px">
                    &nbsp;</td>
                <td __designer:mapid="254">
                    <asp:Button ID="Button2" runat="server" Text="Remove User" Width="113px" />
                </td>
            </tr>
        </table>
    </p>
</asp:Content>


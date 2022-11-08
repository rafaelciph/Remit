<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Profile.aspx.vb" Inherits="Profile_Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <table border="0" cellspacing="1" width="100%">
        <tr>
            <td colspan="2">
                Employee Profile | <font color="#FF0000">
                <asp:Label ID="lblinfo" runat="server"></asp:Label>
                </font>
            </td>
        </tr>
        <tr>
            <td colspan="2" width="1">
            </td>
        </tr>
        <tr>
            <td width="5%">
                IDNO:</td>
            <td width="94%">
                &nbsp;<asp:TextBox ID="txtidno" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtidno" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td width="5%">
                NAME:</td>
            <td width="94%">
                &nbsp;<asp:TextBox ID="txtname" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtname" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td width="5">
                &nbsp;</td>
            <td width="49%">
                &nbsp;<asp:Button ID="cmdSave" runat="server" Text="Save" Width="53px" />
                <asp:Button ID="cmdcancel" runat="server" CausesValidation="False" 
                    PostBackUrl="~/Default.aspx" Text="Cancel" Width="53px" />
            </td>
        </tr>
        <tr>
            <td style="height: 210px" width="5">
                &nbsp;</td>
            <td style="height: 210px" width="49%">
                <p align="left">
                    <asp:ChangePassword ID="ChangePassword1" runat="server" BackColor="#E3EAEB" 
                        BorderColor="#E6E2D8" BorderPadding="4" BorderStyle="Solid" BorderWidth="1px" 
                        Font-Names="Verdana" Font-Size="0.8em" Height="136px" Width="384px">
                        <CancelButtonStyle BackColor="White" BorderColor="#C5BBAF" BorderStyle="Solid" 
                            BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#1C5E55" />
                        <PasswordHintStyle Font-Italic="True" ForeColor="#1C5E55" />
                        <ContinueButtonStyle BackColor="White" BorderColor="#C5BBAF" 
                            BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" 
                            ForeColor="#1C5E55" />
                        <ChangePasswordButtonStyle BackColor="White" BorderColor="#C5BBAF" 
                            BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" 
                            ForeColor="#1C5E55" />
                        <TitleTextStyle BackColor="#1C5E55" Font-Bold="True" Font-Size="0.9em" 
                            ForeColor="White" />
                        <ChangePasswordTemplate>
                            <table border="0" cellpadding="1" cellspacing="0" 
                                style="border-collapse: collapse">
                                <tr>
                                    <td>
                                        <table border="0" cellpadding="0" style="width: 384px; height: 136px">
                                            <tr>
                                                <td align="center" colspan="2" style="text-align: left">
                                                    Change Your Password</td>
                                            </tr>
                                            <tr>
                                                <td align="right" style="text-align: left">
                                                    <asp:Label ID="CurrentPasswordLabel" runat="server" 
                                                        AssociatedControlID="CurrentPassword">Old Password:</asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="CurrentPassword" runat="server" TextMode="Password"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="CurrentPasswordRequired" runat="server" 
                                                        ControlToValidate="CurrentPassword" ErrorMessage="Password is required." 
                                                        ToolTip="Password is required." ValidationGroup="ChangePassword1">*</asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" style="text-align: left">
                                                    <asp:Label ID="NewPasswordLabel" runat="server" 
                                                        AssociatedControlID="NewPassword">New Password:</asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="NewPassword" runat="server" TextMode="Password"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="NewPasswordRequired" runat="server" 
                                                        ControlToValidate="NewPassword" ErrorMessage="New Password is required." 
                                                        ToolTip="New Password is required." ValidationGroup="ChangePassword1">*</asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" style="text-align: left">
                                                    <asp:Label ID="ConfirmNewPasswordLabel" runat="server" 
                                                        AssociatedControlID="ConfirmNewPassword">Confirm New Password:</asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="ConfirmNewPassword" runat="server" TextMode="Password"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="ConfirmNewPasswordRequired" runat="server" 
                                                        ControlToValidate="ConfirmNewPassword" 
                                                        ErrorMessage="Confirm New Password is required." 
                                                        ToolTip="Confirm New Password is required." ValidationGroup="ChangePassword1">*</asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center" colspan="2">
                                                    <asp:CompareValidator ID="NewPasswordCompare" runat="server" 
                                                        ControlToCompare="NewPassword" ControlToValidate="ConfirmNewPassword" 
                                                        Display="Dynamic" 
                                                        ErrorMessage="The Confirm New Password must match the New Password entry." 
                                                        ValidationGroup="ChangePassword1"></asp:CompareValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center" colspan="2" style="color: red">
                                                    <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" style="text-align: left">
                                                    <asp:Button ID="ChangePasswordPushButton" runat="server" 
                                                        CommandName="ChangePassword" Text="Change Password" 
                                                        ValidationGroup="ChangePassword1" />
                                                </td>
                                                <td>
                                                    <asp:Button ID="CancelPushButton" runat="server" CausesValidation="False" 
                                                        CommandName="Cancel" Text="Cancel" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </ChangePasswordTemplate>
                        <SuccessTemplate>
                            <table border="0" cellpadding="4" cellspacing="0" 
                                style="border-collapse: collapse">
                                <tr>
                                    <td>
                                        <table border="0" cellpadding="0" style="width: 384px; height: 136px">
                                            <tr>
                                                <td align="center" colspan="2" style="font-weight: bold; font-size: 0.9em; color: white;
                                            background-color: #1c5e55">
                                                    Change Password Complete</td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Your password has been changed!</td>
                                            </tr>
                                            <tr>
                                                <td align="right" colspan="2">
                                                    <asp:Button ID="ContinuePushButton" runat="server" BackColor="White" 
                                                        BorderColor="#C5BBAF" BorderStyle="Solid" BorderWidth="1px" 
                                                        CausesValidation="False" CommandName="Continue" Font-Names="Verdana" 
                                                        Font-Size="0.8em" ForeColor="#1C5E55" PostBackUrl="~/Default.aspx" 
                                                        Text="Continue" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </SuccessTemplate>
                        <TextBoxStyle Font-Size="0.8em" />
                        <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
                    </asp:ChangePassword>
                </p>
            </td>
        </tr>
    </table>
</asp:Content>


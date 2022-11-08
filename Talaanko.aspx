<%@ Page Title="Talaan ko ito." Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Talaanko.aspx.vb" Inherits="Talaanko" %>
<script runat="server">
    
    Public Sub ActivateStep(ByVal sender As Object, ByVal e As System.EventArgs)
        'ListBox1.DataSource = Roles.GetAllRoles()
        'ListBox1.DataBind()
        ListBox1.Items.Add("staff")
        ListBox1.Items.Add("nimda")
    End Sub

    Public Sub DeactivateStep(ByVal sender As Object, ByVal e As System.EventArgs)
        Roles.AddUserToRole(User.Identity.Name, ListBox1.SelectedValue)
    End Sub
    
</script>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style9
        {
        }
        .style12
        {
            width: 226px;
        }
        .style13
        {
            width: 48px;
            height: 48px;
        }
        .style14
        {
            width: 128px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <table class="style5">
        <tr>
            <td class="style12">
                <table class="style5" style="width: 110%">
                    <tr>
                        <td>
                            <img class="style13" src="Images/App-password-icon.png" /></td>
                        <td>
                            <strong>Register new account</strong></td>
                    </tr>
                </table>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style12">
                <table class="style5">
                    <tr>
                        <td class="style14">
                            <asp:TextBox ID="TextBox1" runat="server" style="text-align: left" 
                                Width="112px" Height="24px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Button ID="Button1" runat="server" Text="Enter" />
                        </td>
                    </tr>
                </table>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style9" colspan="2">
                <asp:Panel ID="Panel2" runat="server" Enabled="False">
                    <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" align="Center" 
                    ContinueDestinationPageUrl="~/Default.aspx">
                        <WizardSteps>
                            <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server">
                            </asp:CreateUserWizardStep>
                            <asp:WizardStep ID="WizardStep1" runat="server" OnActivate="ActivateStep" 
                            OnDeactivate="DeActivateStep" Title="Select Role">
                                <br />
                                Select Role<br />
                                <br />
                                <asp:ListBox ID="ListBox1" runat="server"></asp:ListBox>
                            </asp:WizardStep>
                            <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
                            </asp:CompleteWizardStep>
                        </WizardSteps>
                    </asp:CreateUserWizard>
                </asp:Panel>
            </td>
        </tr>
    </table>
</asp:Content>


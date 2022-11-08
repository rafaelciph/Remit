<%@ Page Title="Home Page" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="false"
    CodeFile="Default.aspx.vb" Inherits="_Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <style type="text/css">

        .style9
        {
            width: 100%;
        }
        .style11
        {
            width: 55px;
        }
        .style10
        {
            width: 48px;
            height: 48px;
        }
        .style12
        {
            width: 45px;
        }
        .style13
        {
            height: 32px;
            width: 33px;
        }
    </style>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        <table class="style9">
            <tr>
                <td class="style11">
                    <img class="style10" src="Images/home-icon.png" /></td>
                <td>
                    History of Remittance Online</td>
            </tr>
        </table>
    </h2>
    <br />
    <div>
        <asp:Panel ID="Panel1" runat="server" BorderColor="#999999" 
            style="text-align: center" Width="247px">
            </span>
        </asp:Panel>
    </div>
    <div>
        <asp:Panel ID="Panel2" runat="server" style="text-align: left" Width="825px">
            <span class="style2"><strong>
              <br />
              <table class="style9">
                  <tr>
                      <td class="style12">
                          <span class="style2"><strong>
                          <img class="style13" 
                              src="Images/Places-folder-important-icon.png" />
                          </strong></span>
                      </td>
                      <td>
                          <span class="style2"><strong>Important Reminders:</strong></span>&nbsp;</td>
                  </tr>
            </table>
            </strong></span>
            <ul>
                <li style="color: #000000"><span class="style1">Please protect your given Username 
                    AND PASSWORD. </span></li>
                </span></span>
            </ul>
        </asp:Panel>
        </div>
    </asp:Content>
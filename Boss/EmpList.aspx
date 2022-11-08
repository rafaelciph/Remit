<%@ Page Title="Employee Master List" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="EmpList.aspx.vb" Inherits="Boss_EmpList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style9
        {
            width: 49px;
        }
        .style10
        {
            width: 48px;
            height: 48px;
            margin-bottom: 0px;
        }
        .style11
        {
            width: 49px;
            height: 20px;
        }
        .style12
        {
            height: 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <table class="style5">
        <tr>
            <td class="style9">
                <img alt="" class="style10" src="../Images/Search-icon.png" /></td>
            <td>
                    <strong>Employee Master List</strong></td>
        </tr>
        <tr>
            <td class="style11">
                LName</td>
            <td class="style12">
                <asp:TextBox ID="txtidno" runat="server" Width="113px"></asp:TextBox>
                <asp:Button ID="Button2" runat="server" Text="Search" Width="59px" />
&nbsp;<asp:Button ID="Button1" runat="server" Text="Insert New Employee " Width="152px" />
            </td>
        </tr>
        <tr>
            <td class="style9" rowspan="2">
                &nbsp;</td>
            <td>
                <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" 
                    AutoGenerateRows="False" DataKeyNames="IDNo" DataSourceID="SqlDataSource1" 
                    Height="50px" Width="125px" EmptyDataText="No record fund">
                    <Fields>
                        <asp:TemplateField HeaderText="IDNo" SortExpression="IDNo">
                            <EditItemTemplate>
                                &nbsp;&nbsp;
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("IDNo") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("IDNo") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("IDNo") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="LastName" SortExpression="LastName">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("LastName") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("LastName") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("LastName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="FirstName" HeaderText="FirstName" 
                            SortExpression="FirstName" />
                        <asp:BoundField DataField="MiddleName" HeaderText="MiddleName" 
                            SortExpression="MiddleName" />
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" 
                                    CommandName="Update" Text="Update"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                    CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" 
                                    CommandName="Insert" Text="Insert"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                    CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton4" runat="server" CausesValidation="False" 
                                    CommandName="Edit" Text="Edit"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                    CommandName="New" Text="New"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" 
                                    CommandName="Delete" Text="Delete"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Fields>
                </asp:DetailsView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:RemitConnectionString %>" 
                    DeleteCommand="DELETE FROM [Employee_Mast] WHERE [IDNo] = @IDNo" 
                    InsertCommand="INSERT INTO [Employee_Mast] ([IDNo], [LastName], [FirstName], [MiddleName]) VALUES (@IDNo, @LastName, @FirstName, @MiddleName)" 
                    SelectCommand="SELECT IDNo, LastName, FirstName, MiddleName FROM Employee_Mast WHERE (LastName = @LastName)" 
                    
                    UpdateCommand="UPDATE Employee_Mast SET IDNo = @IDNo, LastName = @LastName, FirstName = @FirstName, MiddleName = @MiddleName WHERE (IDNo = @IDNo)">
                    <DeleteParameters>
                        <asp:Parameter Name="IDNo" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="IDNo" Type="String" />
                        <asp:Parameter Name="LastName" Type="String" />
                        <asp:Parameter Name="FirstName" Type="String" />
                        <asp:Parameter Name="MiddleName" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtidno" Name="LastName" PropertyName="Text" />
                    </SelectParameters>
                    <UpdateParameters>
                    <asp:Parameter Name="IDNo" Type="String" />
                        <asp:Parameter Name="LastName" Type="String" />
                        <asp:Parameter Name="FirstName" Type="String" />
                        <asp:Parameter Name="MiddleName" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <br />
                Employee Master List</td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" 
                    DataSourceID="SqlDataSourceMasterList">
                    <Columns>
                        <asp:BoundField DataField="IDNo" HeaderText="IDNo" SortExpression="IDNo" />
                        <asp:BoundField DataField="LastName" HeaderText="Last Name" 
                            SortExpression="LastName" />
                        <asp:BoundField DataField="FirstName" HeaderText="First Name" 
                            SortExpression="FirstName" />
                        <asp:BoundField DataField="MiddleName" HeaderText="Middle Name" 
                            SortExpression="MiddleName" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSourceMasterList" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:RemitConnectionString %>" 
                    SelectCommand="SELECT [IDNo], [LastName], [FirstName], [MiddleName] FROM [Employee_Mast]">
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>


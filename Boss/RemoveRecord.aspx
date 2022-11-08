<%@ Page Title="Managing Records" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="RemoveRecord.aspx.vb" Inherits="Boss_RemoveRecord" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">

        .style9
        {
            width: 49px;
        }
        .style11
        {
            width: 49px;
            height: 20px;
        }
        .style13
        {
            width: 48px;
            height: 48px;
        }
        .style14
        {
            height: 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <table class="style5">
        <tr>
            <td class="style9">
                <img alt="" class="style13" src="../Images/Settings-icon-.png" /></td>
            <td>
                <strong>Delete Record</strong></td>
        </tr>
        <tr>
            <td class="style11">
            </td>
            <td class="style14">
                Date Uploaded:
                <asp:TextBox ID="TextBox1" runat="server" Width="74px"></asp:TextBox>
                <asp:Button ID="Button1" runat="server" style="margin-left: 0px" 
                    Text="Search" />
            </td>
        </tr>
        <tr>
            <td class="style11">
            </td>
            <td class="style14">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label1" runat="server" ForeColor="#CC0000" Visible="False"></asp:Label>
&nbsp;</td>
        </tr>
        <tr>
            <td class="style11">
                &nbsp;</td>
            <td class="style14">
                <asp:Panel ID="Panel2" runat="server" ScrollBars="Horizontal" 
                    Width="850px" Height = "400px">
                    <asp:GridView ID="GridView1" runat="server" 
    AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1" PageIndex="50" 
                        PageSize="50">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" />
                            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
            ReadOnly="True" SortExpression="ID" Visible="False" />
                            <asp:TemplateField HeaderText="Document_Date" SortExpression="Document_Date">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Document_Date") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" 
                                        Text='<%# Bind("Document_Date", "{0:d}") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="PH_IDNO" HeaderText="PH_IDNO" 
            SortExpression="PH_IDNO" />
                            <asp:BoundField DataField="Employee_Name" HeaderText="Employee_Name" 
            SortExpression="Employee_Name" />
                            <asp:TemplateField HeaderText="Amount" SortExpression="Amount">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Amount") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Amount", "{0:N}") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Voucher_Number" HeaderText="Voucher_Number" 
            SortExpression="Voucher_Number" />
                            <asp:BoundField DataField="Description" HeaderText="Description" 
            SortExpression="Description" />
                            <asp:BoundField DataField="Remit_Thru" HeaderText="Remit_Thru" 
            SortExpression="Remit_Thru" />
                            <asp:BoundField DataField="Particulars" HeaderText="Particulars" 
            SortExpression="Particulars" />
                            <asp:BoundField DataField="Remarks" HeaderText="Remarks" 
            SortExpression="Remarks" />
                            <asp:BoundField DataField="Trans" HeaderText="Trans" SortExpression="Trans" />
                            <asp:BoundField DataField="Code" HeaderText="Code" SortExpression="Code" />
                            <asp:TemplateField HeaderText="Due_Date" SortExpression="Due_Date">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Due_Date") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Due_Date", "{0:d}") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Status" HeaderText="Status" 
            SortExpression="Status" />
                            <asp:TemplateField HeaderText="Date_Exported" SortExpression="Date_Exported">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Date_Exported") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" 
                                        Text='<%# Bind("Date_Exported", "{0:d}") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Date_Liq" SortExpression="Date_Liq">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Date_Liq") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("Date_Liq", "{0:d}") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Due_year" HeaderText="Due_year" 
            SortExpression="Due_year" Visible="False" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:RemitConnectionString %>" 
    DeleteCommand="DELETE FROM [Remit_Staff] WHERE [ID] = @ID" 
    InsertCommand="INSERT INTO [Remit_Staff] ([Document_Date], [PH_IDNO], [Employee_Name], [Amount], [Voucher_Number], [Description], [Remit_Thru], [Particulars], [Remarks], [Trans], [Code], [Due_Date], [Status], [Date_Exported], [Date_Liq], [Due_year]) VALUES (@Document_Date, @PH_IDNO, @Employee_Name, @Amount, @Voucher_Number, @Description, @Remit_Thru, @Particulars, @Remarks, @Trans, @Code, @Due_Date, @Status, @Date_Exported, @Date_Liq, @Due_year)" 
    SelectCommand="SELECT [ID], [Document_Date], [PH_IDNO], [Employee_Name], [Amount], [Voucher_Number], [Description], [Remit_Thru], [Particulars], [Remarks], [Trans], [Code], [Due_Date], [Status], [Date_Exported], [Date_Liq], [Due_year] FROM [Remit_Staff] WHERE ([Date_Exported] = @Date_Exported)" 
    
                        UpdateCommand="UPDATE [Remit_Staff] SET [Document_Date] = @Document_Date, [PH_IDNO] = @PH_IDNO, [Employee_Name] = @Employee_Name, [Amount] = @Amount, [Voucher_Number] = @Voucher_Number, [Description] = @Description, [Remit_Thru] = @Remit_Thru, [Particulars] = @Particulars, [Remarks] = @Remarks, [Trans] = @Trans, [Code] = @Code, [Due_Date] = @Due_Date, [Status] = @Status, [Date_Exported] = @Date_Exported, [Date_Liq] = @Date_Liq, [Due_year] = @Due_year WHERE [ID] = @ID">
                        <DeleteParameters>
                            <asp:Parameter Name="ID" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Document_Date" Type="DateTime" />
                            <asp:Parameter Name="PH_IDNO" Type="String" />
                            <asp:Parameter Name="Employee_Name" Type="String" />
                            <asp:Parameter Name="Amount" Type="Double" />
                            <asp:Parameter Name="Voucher_Number" Type="String" />
                            <asp:Parameter Name="Description" Type="String" />
                            <asp:Parameter Name="Remit_Thru" Type="String" />
                            <asp:Parameter Name="Particulars" Type="String" />
                            <asp:Parameter Name="Remarks" Type="String" />
                            <asp:Parameter Name="Trans" Type="String" />
                            <asp:Parameter Name="Code" Type="String" />
                            <asp:Parameter Name="Due_Date" Type="String" />
                            <asp:Parameter Name="Status" Type="String" />
                            <asp:Parameter Name="Date_Exported" Type="DateTime" />
                            <asp:Parameter Name="Date_Liq" Type="String" />
                            <asp:Parameter Name="Due_year" Type="String" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="TextBox1" Name="Date_Exported" 
            PropertyName="Text" Type="DateTime" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Document_Date" Type="DateTime" />
                            <asp:Parameter Name="PH_IDNO" Type="String" />
                            <asp:Parameter Name="Employee_Name" Type="String" />
                            <asp:Parameter Name="Amount" Type="Double" />
                            <asp:Parameter Name="Voucher_Number" Type="String" />
                            <asp:Parameter Name="Description" Type="String" />
                            <asp:Parameter Name="Remit_Thru" Type="String" />
                            <asp:Parameter Name="Particulars" Type="String" />
                            <asp:Parameter Name="Remarks" Type="String" />
                            <asp:Parameter Name="Trans" Type="String" />
                            <asp:Parameter Name="Code" Type="String" />
                            <asp:Parameter Name="Due_Date" Type="String" />
                            <asp:Parameter Name="Status" Type="String" />
                            <asp:Parameter Name="Date_Exported" Type="DateTime" />
                            <asp:Parameter Name="Date_Liq" Type="String" />
                            <asp:Parameter Name="Due_year" Type="String" />
                            <asp:Parameter Name="ID" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td class="style11">
                &nbsp;</td>
            <td class="style14">
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>


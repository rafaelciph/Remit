<%@ Page Title="Monitoring Page" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Monitoring.aspx.vb" Inherits="Boss_Monitoring" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style9
        {
        }
        .style10
        {
        }
        .style11
        {
            width: 49px;
        }
        .style12
        {
            width: 48px;
            height: 48px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <table class="style5">
        <tr>
            <td class="style10">
                <table class="style5">
                    <tr>
                        <td class="style11">
                            <img class="style12" src="../Images/folder-search-icon.png" /></td>
                        <td>
                            &nbsp;<strong>Monitoring&nbsp;</strong></td>
                    </tr>
                </table>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style9" colspan="2">
                <asp:Panel ID="Panel1" runat="server" Height="50px" Width="581px">
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
                        <asp:ListItem Value="0">Date Uploaded</asp:ListItem>
                        <asp:ListItem Value="1">Vouche Number</asp:ListItem>
                        <asp:ListItem Value="2">PH IDNO</asp:ListItem>
                        <asp:ListItem Value="3">Remittance</asp:ListItem>
                    </asp:DropDownList>
                    <asp:TextBox ID="TextBox3" runat="server" Width="147px"></asp:TextBox>
                    <asp:Button ID="Button1" runat="server" Text="Search" />
                    <br />
                    <asp:Label ID="Label7" runat="server"></asp:Label>
        <br />
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td class="style10">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style10" colspan="2">
                <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                    <asp:View ID="View1" runat="server">
                        <asp:Label ID="Label6" runat="server" Text="Search with Date Uploaded"></asp:Label>
                        <br />
                        <br />
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:RemitConnectionString %>" 
                            
                            SelectCommand="SELECT * FROM [Remit_Staff] WHERE ([Date_Exported] = @Date_Exported) ORDER BY [Document_Date] DESC" 
                            DeleteCommand="DELETE FROM [Remit_Staff] WHERE [ID] = @original_ID" 
                            InsertCommand="INSERT INTO [Remit_Staff] ([Document_Date], [PH_IDNO], [Employee_Name], [Amount], [Voucher_Number], [Description], [Remit_Thru], [Particulars], [Remarks], [Trans], [Code], [Due_Date], [Status], [Date_Exported], [Date_Liq], [Due_year]) VALUES (@Document_Date, @PH_IDNO, @Employee_Name, @Amount, @Voucher_Number, @Description, @Remit_Thru, @Particulars, @Remarks, @Trans, @Code, @Due_Date, @Status, @Date_Exported, @Date_Liq, @Due_year)" 
                            OldValuesParameterFormatString="original_{0}" 
                            UpdateCommand="UPDATE [Remit_Staff] SET [Document_Date] = @Document_Date, [PH_IDNO] = @PH_IDNO, [Employee_Name] = @Employee_Name, [Amount] = @Amount, [Voucher_Number] = @Voucher_Number, [Description] = @Description, [Remit_Thru] = @Remit_Thru, [Particulars] = @Particulars, [Remarks] = @Remarks, [Trans] = @Trans, [Code] = @Code, [Due_Date] = @Due_Date, [Status] = @Status, [Date_Exported] = @Date_Exported, [Date_Liq] = @Date_Liq, [Due_year] = @Due_year WHERE [ID] = @original_ID">
                            <DeleteParameters>
                                <asp:Parameter Name="original_ID" Type="Int32" />
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
                                <asp:ControlParameter ControlID="TextBox3" Name="Date_Exported" 
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
                                <asp:Parameter Name="original_ID" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                        <asp:Panel ID="Panel4" runat="server" HorizontalAlign="Left" 
                            ScrollBars="Horizontal" Width="910px">
                            <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
                                AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID" 
                                DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" 
                                HorizontalAlign="Left" SkinID="KylieSkin" AllowPaging="True" 
                                EnableTheming="False">
                                <AlternatingRowStyle BackColor="White" HorizontalAlign="Left" />
                                <Columns>
                                    <asp:TemplateField HeaderText="Command" ShowHeader="False">
                                        <EditItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" 
                                                CommandName="Update" ForeColor="Black" Text="Update"></asp:LinkButton>
                                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                                CommandName="Cancel" ForeColor="Black" Text="Cancel"></asp:LinkButton>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                                CommandName="Edit" Text="Edit"></asp:LinkButton>
                                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                                CommandName="Delete" Text="Delete"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                                        ReadOnly="True" SortExpression="ID" Visible="False" />
                                    <asp:TemplateField HeaderText="Document_Date" SortExpression="Document_Date">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" 
                                                Text='<%# Bind("Document_Date", "{0:d}") %>'></asp:TextBox>
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
                                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Amount", "{0:N}") %>'></asp:TextBox>
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
                                            <asp:TextBox ID="TextBox3" runat="server" 
                                                Text='<%# Bind("Due_Date", "{0:d}") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("Due_Date", "{0:d}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Status" SortExpression="Status">
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="DropDownList2" runat="server" 
                                                DataSourceID="SqlDataSourceStatus" DataTextField="Status" 
                                                DataValueField="Status" SelectedValue='<%# Bind("Status") %>'>
                                            </asp:DropDownList>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Date_Exported" SortExpression="Date_Exported">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox4" runat="server" 
                                                Text='<%# Bind("Date_Exported", "{0:d}") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" 
                                                Text='<%# Bind("Date_Exported", "{0:d}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Date_Liq" SortExpression="Date_Liq">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox5" runat="server" 
                                                Text='<%# Bind("Date_Liq", "{0:d}") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("Date_Liq", "{0:d}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Due_year" SortExpression="Due_year" 
                                        Visible="False">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Due_year") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("Due_year") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <EditRowStyle BackColor="#2461BF" />
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" 
                                    HorizontalAlign="Left" VerticalAlign="Top" Wrap="False" />
                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#EFF3FB" HorizontalAlign="Left" Wrap="False" />
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                <SortedDescendingHeaderStyle BackColor="#4870BE" />
                            </asp:GridView>
                        </asp:Panel>
            <br />
                        <asp:SqlDataSource ID="SqlDataSourceStatus" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:RemitConnectionString %>" 
                            SelectCommand="SELECT * FROM [Status]"></asp:SqlDataSource>
            <br />
                        &nbsp; &nbsp;&nbsp;
                    </asp:View>
                    <asp:View ID="View2" runat="server">
                        <asp:Label ID="Label11" runat="server" Text="Search with Voucher Number"></asp:Label>
                        <br />
                        &nbsp; &nbsp;<asp:Panel ID="Panel3" runat="server" HorizontalAlign="Left" 
                            ScrollBars="Horizontal" Width="910px">
                            <asp:GridView ID="GridView2" runat="server" AllowSorting="True" 
                                AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID" 
                                DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" 
                                SkinID="KylieSkin" Width="100%" AllowPaging="True">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                                    <asp:TemplateField HeaderText="ID" InsertVisible="False" SortExpression="ID" 
                                        Visible="False">
                                        <EditItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("ID") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("ID") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Document Date" SortExpression="Document_Date">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" 
                                                Text='<%# Bind("Document_Date", "{0:d}") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" 
                                                Text='<%# Bind("Document_Date", "{0:d}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="IDNO" SortExpression="PH_IDNO">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("PH_IDNO") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("PH_IDNO") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Name" SortExpression="Employee_Name">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Employee_Name") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("Employee_Name") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Amount" SortExpression="Amount">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Amount", "{0:N}") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("Amount", "{0:N}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Voucher No" SortExpression="Voucher_Number">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Voucher_Number") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("Voucher_Number") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Description" SortExpression="Description">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Description") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Remit Thru" SortExpression="Remit_Thru">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Remit_Thru") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("Remit_Thru") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Particulars" SortExpression="Particulars">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("Particulars") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label9" runat="server" Text='<%# Bind("Particulars") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Remarks" SortExpression="Remarks">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("Remarks") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label10" runat="server" Text='<%# Bind("Remarks") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Transaction" SortExpression="Trans">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("Trans") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label11" runat="server" Text='<%# Bind("Trans") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Code" SortExpression="Code">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("Code") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label12" runat="server" Text='<%# Bind("Code") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Due Date" SortExpression="Due_Date">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox12" runat="server" 
                                                Text='<%# Bind("Due_Date", "{0:d}") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label13" runat="server" Text='<%# Bind("Due_Date", "{0:d}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Status" SortExpression="Status">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox13" runat="server" Text='<%# Bind("Status") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label14" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Date Imported" SortExpression="Date_Exported">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox14" runat="server" Enabled="False" ReadOnly="True" 
                                                Text='<%# Bind("Date_Exported", "{0:d}") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label15" runat="server" 
                                                Text='<%# Bind("Date_Exported", "{0:d}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Liquidation Date" SortExpression="Date_Liq">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox15" runat="server" 
                                                Text='<%# Bind("Date_Liq", "{0:d}") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label16" runat="server" Text='<%# Bind("Date_Liq", "{0:d}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Due_year" SortExpression="Due_year" 
                                        Visible="False">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox16" runat="server" Text='<%# Bind("Due_year") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label17" runat="server" Text='<%# Bind("Due_year") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <EditRowStyle BackColor="#2461BF" />
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" 
                                    HorizontalAlign="Left" Wrap="False" />
                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#EFF3FB" HorizontalAlign="Left" Wrap="False" />
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                <SortedDescendingHeaderStyle BackColor="#4870BE" />
                            </asp:GridView>
                        </asp:Panel>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:RemitConnectionString %>" 
                            
                            SelectCommand="SELECT [ID], [Document_Date], [PH_IDNO], [Employee_Name], [Amount], [Voucher_Number], [Description], [Remit_Thru], [Particulars], [Remarks], [Trans], [Code], [Due_Date], [Status], [Date_Exported], [Date_Liq], [Due_year] FROM [Remit_Staff] WHERE ([Voucher_Number] = @Voucher_Number)" 
                            DeleteCommand="DELETE FROM [Remit_Staff] WHERE [ID] = @original_ID" 
                            InsertCommand="INSERT INTO [Remit_Staff] ([Document_Date], [PH_IDNO], [Employee_Name], [Amount], [Voucher_Number], [Description], [Remit_Thru], [Particulars], [Remarks], [Trans], [Code], [Due_Date], [Status], [Date_Exported], [Date_Liq], [Due_year]) VALUES (@Document_Date, @PH_IDNO, @Employee_Name, @Amount, @Voucher_Number, @Description, @Remit_Thru, @Particulars, @Remarks, @Trans, @Code, @Due_Date, @Status, @Date_Exported, @Date_Liq, @Due_year)" 
                            OldValuesParameterFormatString="original_{0}" 
                            UpdateCommand="UPDATE [Remit_Staff] SET [Document_Date] = @Document_Date, [PH_IDNO] = @PH_IDNO, [Employee_Name] = @Employee_Name, [Amount] = @Amount, [Voucher_Number] = @Voucher_Number, [Description] = @Description, [Remit_Thru] = @Remit_Thru, [Particulars] = @Particulars, [Remarks] = @Remarks, [Trans] = @Trans, [Code] = @Code, [Due_Date] = @Due_Date, [Status] = @Status, [Date_Exported] = @Date_Exported, [Date_Liq] = @Date_Liq, [Due_year] = @Due_year WHERE [ID] = @original_ID">
                            <DeleteParameters>
                                <asp:Parameter Name="original_ID" Type="Int32" />
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
                                <asp:ControlParameter ControlID="TextBox3" Name="Voucher_Number" 
                                    PropertyName="Text" Type="String" />
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
                                <asp:Parameter Name="original_ID" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
            <br />
                    </asp:View>
                    <asp:View ID="View3" runat="server">
                        <asp:Label ID="Label16" runat="server" Text="Search with Employee IDNO."></asp:Label>
                        <br />
   
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:RemitConnectionString %>" 
                            
                            SelectCommand="SELECT [ID], [Document_Date], [PH_IDNO], [Employee_Name], [Amount], [Voucher_Number], [Description], [Remit_Thru], [Particulars], [Remarks], [Trans], [Code], [Due_Date], [Status], [Date_Exported], [Date_Liq] FROM [Remit_Staff] WHERE ([PH_IDNO] = @PH_IDNO) ORDER BY [Document_Date] DESC" 
                            DeleteCommand="DELETE FROM [Remit_Staff] WHERE [ID] = @ID" 
                            InsertCommand="INSERT INTO [Remit_Staff] ([Document_Date], [PH_IDNO], [Employee_Name], [Amount], [Voucher_Number], [Description], [Remit_Thru], [Particulars], [Remarks], [Trans], [Code], [Due_Date], [Status], [Date_Exported], [Date_Liq]) VALUES (@Document_Date, @PH_IDNO, @Employee_Name, @Amount, @Voucher_Number, @Description, @Remit_Thru, @Particulars, @Remarks, @Trans, @Code, @Due_Date, @Status, @Date_Exported, @Date_Liq)" 
                            UpdateCommand="UPDATE [Remit_Staff] SET [Document_Date] = @Document_Date, [PH_IDNO] = @PH_IDNO, [Employee_Name] = @Employee_Name, [Amount] = @Amount, [Voucher_Number] = @Voucher_Number, [Description] = @Description, [Remit_Thru] = @Remit_Thru, [Particulars] = @Particulars, [Remarks] = @Remarks, [Trans] = @Trans, [Code] = @Code, [Due_Date] = @Due_Date, [Status] = @Status, [Date_Exported] = @Date_Exported, [Date_Liq] = @Date_Liq WHERE [ID] = @ID">
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
                            </InsertParameters>
                            <SelectParameters>
                                <asp:ControlParameter ControlID="TextBox3" Name="PH_IDNO" PropertyName="Text" 
                                    Type="String" />
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
                                <asp:Parameter Name="ID" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                        <asp:Panel ID="Panel2" runat="server" ScrollBars="Horizontal" Width="910px">
                            <asp:GridView ID="GridView3" runat="server" AllowSorting="True" 
                                AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID" 
                                DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="None" 
                                SkinID="KylieSkin" AllowPaging="True">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                                    <asp:TemplateField HeaderText="ID" InsertVisible="False" SortExpression="ID">
                                        <EditItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("ID") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("ID") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Document_Date" SortExpression="Document_Date">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" 
                                                Text='<%# Bind("Document_Date", "{0:d}") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" 
                                                Text='<%# Bind("Document_Date", "{0:d}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="PH_IDNO" SortExpression="PH_IDNO">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("PH_IDNO") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("PH_IDNO") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Employee_Name" SortExpression="Employee_Name">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Employee_Name") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("Employee_Name") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Amount" SortExpression="Amount">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Amount", "{0:N}") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("Amount", "{0:N}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Voucher_Number" SortExpression="Voucher_Number">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Voucher_Number") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("Voucher_Number") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Description" SortExpression="Description">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Description") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Remit_Thru" SortExpression="Remit_Thru">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Remit_Thru") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("Remit_Thru") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Particulars" SortExpression="Particulars">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("Particulars") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label9" runat="server" Text='<%# Bind("Particulars") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Remarks" SortExpression="Remarks">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("Remarks") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label10" runat="server" Text='<%# Bind("Remarks") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Trans" SortExpression="Trans">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("Trans") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label11" runat="server" Text='<%# Bind("Trans") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Code" SortExpression="Code">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("Code") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label12" runat="server" Text='<%# Bind("Code") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Due_Date" SortExpression="Due_Date">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox12" runat="server" 
                                                Text='<%# Bind("Due_Date", "{0:d}") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label13" runat="server" Text='<%# Bind("Due_Date", "{0:d}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Status" SortExpression="Status">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox13" runat="server" Text='<%# Bind("Status") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label14" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Date_Exported" SortExpression="Date_Exported">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox14" runat="server" 
                                                Text='<%# Bind("Date_Exported", "{0:d}") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label15" runat="server" 
                                                Text='<%# Bind("Date_Exported", "{0:d}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Date_Liq" SortExpression="Date_Liq">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox15" runat="server" 
                                                Text='<%# Bind("Date_Liq", "{0:d}") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label16" runat="server" Text='<%# Bind("Date_Liq", "{0:d}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <EditRowStyle BackColor="#2461BF" />
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" 
                                    HorizontalAlign="Left" Wrap="False" />
                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#EFF3FB" Width="100%" Wrap="False" />
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                <SortedDescendingHeaderStyle BackColor="#4870BE" />
                            </asp:GridView>
                        </asp:Panel>
            <br />
            <br />
                    </asp:View>
                    <asp:View ID="View4" runat="server">
                        <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" 
                            DataSourceID="Sqlemployee" DataTextField="Name" DataValueField="IDNo">
                        </asp:DropDownList>
                        &nbsp;<asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True">
                            <asp:ListItem Value="0">Reimbursement</asp:ListItem>
                            <asp:ListItem Value="1">Cash Advance</asp:ListItem>
                            <asp:ListItem Value="2">Other&#39;s</asp:ListItem>
                        </asp:DropDownList>
                        &nbsp;<asp:Label ID="lbldd" runat="server" Visible="False"></asp:Label>
                        <asp:Label ID="lblcode" runat="server" Visible="False">Reimb</asp:Label>
                <br />
                        <asp:SqlDataSource ID="Sqlemployee" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:RemitConnectionString %>" 
                            SelectCommand="SELECT IDNo, LastName + '  ' + FirstName AS Name FROM Employee_Mast ORDER BY Name">
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:RemitConnectionString %>" 
                            SelectCommand="SELECT [Document_Date], [PH_IDNO], [Employee_Name], [Amount], [Voucher_Number], [Description], [Remit_Thru], [Particulars], [Remarks], [Trans], [Code], [Due_Date], [Status], [Date_Liq] FROM [Remit_Staff] WHERE ([PH_IDNO] = @PH_IDNO) and Code = @Code">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="lbldd" Name="PH_IDNO" PropertyName="Text" 
                                    Type="String" />
                                <asp:ControlParameter ControlID="lblcode" Name="Code" PropertyName="Text" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                <br />
                        <asp:MultiView ID="MultiView2" runat="server" ActiveViewIndex="0" 
                            EnableTheming="False">
                            <asp:View ID="View5" runat="server" EnableTheming="False">
                                <asp:GridView ID="GridView4" runat="server" AllowPaging="True" 
                                    AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                                    DataSourceID="SqlDataSource4" EmptyDataText="You have no Record/Transaction" 
                                    EnableModelValidation="True" ForeColor="#333333" GridLines="None">
                                    <RowStyle BackColor="#EFF3FB" />
                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="Document Date" SortExpression="Document_Date">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox19" runat="server" Text='<%# Bind("Document_Date") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label22" runat="server" 
                                                    Text='<%# Bind("Document_Date", "{0:d}") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="PH_IDNO" HeaderText="IDNO" 
                                            SortExpression="PH_IDNO" />
                                        <asp:TemplateField HeaderText="Amount" SortExpression="Amount">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox20" runat="server" Text='<%# Bind("Amount") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label23" runat="server" Text='<%# Bind("Amount", "{0:N}") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="Voucher_Number" HeaderText="Voucher Number" 
                                            SortExpression="Voucher_Number" />
                                        <asp:BoundField DataField="Description" HeaderText="Description" 
                                            SortExpression="Description" />
                                        <asp:BoundField DataField="Remit_Thru" HeaderText="Remit Thru" 
                                            SortExpression="Remit_Thru" />
                                        <asp:BoundField DataField="Particulars" HeaderText="Particulars" 
                                            SortExpression="Particulars" />
                                        <asp:BoundField DataField="Remarks" HeaderText="Remarks" 
                                            SortExpression="Remarks" />
                                        <asp:BoundField DataField="Trans" HeaderText="Trans" SortExpression="Trans" />
                                        <asp:BoundField DataField="Code" HeaderText="Code" SortExpression="Code" />
                                    </Columns>
                                    <EditRowStyle BackColor="#2461BF" />
                                    <AlternatingRowStyle BackColor="White" />
                                    <PagerSettings FirstPageText="First Page" LastPageText="Last Page" 
                                        Mode="NextPreviousFirstLast" NextPageText="Next" PageButtonCount="100" 
                                        Position="TopAndBottom" PreviousPageText="Previous" />
                                </asp:GridView>
                            </asp:View>
                    <br />
                            <asp:View ID="View6" runat="server" EnableTheming="False">

                                <asp:Panel ID="Panel5" runat="server" ScrollBars=Horizontal Width="910px">
<asp:GridView ID="GridView5" runat="server" AllowPaging="True" Width = "100%"
                                    AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                                    DataSourceID="SqlDataSource4" EmptyDataText="You have no Record/Transaction" 
                                    EnableModelValidation="True" ForeColor="#333333" GridLines="None">
                                    <RowStyle BackColor="#EFF3FB" />
                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="Document Date" SortExpression="Document_Date">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox21" runat="server" Text='<%# Bind("Document_Date") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label24" runat="server" 
                                                    Text='<%# Bind("Document_Date", "{0:d}") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="PH_IDNO" HeaderText="IDNO" 
                                            SortExpression="PH_IDNO" />
                                        <asp:TemplateField HeaderText="Amount" SortExpression="Amount">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox22" runat="server" Text='<%# Bind("Amount") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label25" runat="server" Text='<%# Bind("Amount", "{0:N}") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="Voucher_Number" HeaderText="Voucher Number" 
                                            SortExpression="Voucher_Number" />
                                        <asp:BoundField DataField="Description" HeaderText="Description" 
                                            SortExpression="Description" />
                                        <asp:BoundField DataField="Remit_Thru" HeaderText="Remit Thru" 
                                            SortExpression="Remit_Thru" />
                                        <asp:BoundField DataField="Particulars" HeaderText="Particulars" 
                                            SortExpression="Particulars" />
                                        <asp:BoundField DataField="Remarks" HeaderText="Remarks" 
                                            SortExpression="Remarks" />
                                        <asp:BoundField DataField="Trans" HeaderText="Trans" SortExpression="Trans" />
                                        <asp:BoundField DataField="Code" HeaderText="Code" SortExpression="Code" />
                                        <asp:BoundField DataField="Due_Date" HeaderText="Duedate" 
                                            SortExpression="Due_Date" />
                                        <asp:BoundField DataField="Status" HeaderText="Status" 
                                            SortExpression="Status" />
                                        <asp:TemplateField HeaderText="Date Liquidated" SortExpression="Date_Liq">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox23" runat="server" Text='<%# Bind("Date_Liq") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label26" runat="server" Text='<%# Bind("Date_Liq", "{0}") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <EditRowStyle BackColor="#2461BF" />
                                    <AlternatingRowStyle BackColor="White" />
                                    <PagerSettings FirstPageText="First Page" LastPageText="Last Page" 
                                        Mode="NextPreviousFirstLast" NextPageText="Next" PageButtonCount="100" 
                                        Position="TopAndBottom" PreviousPageText="Previous" />
                                </asp:GridView>
                                </asp:Panel>

                            </asp:View>
                            <asp:View ID="View7" runat="server">
                                <asp:SqlDataSource ID="SqlDataSource_others" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:RemitConnectionString %>" 
                                    SelectCommand="SELECT Document_Date, PH_IDNO, Employee_Name, Amount, Voucher_Number, Description, Remit_Thru, Particulars, Remarks, Trans, Code, Due_Date, Status, Date_Exported, Date_Liq FROM Remit_Staff WHERE (PH_IDNO = @PH_IDNO) AND (Code &lt;&gt; 'CA') AND (Code &lt;&gt; 'Reimb')">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="lbldd" Name="PH_IDNO" PropertyName="Text" 
                                            Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:GridView ID="GridView6" runat="server" AllowSorting="True" 
                                    AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource_others" 
                                    EnableModelValidation="True" ForeColor="#333333" GridLines="None">
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="Document Date" SortExpression="Document_Date">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Document_Date") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label8" runat="server" 
                                                    Text='<%# Bind("Document_Date", "{0:d}") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="PH_IDNO" HeaderText="IDNO" 
                                            SortExpression="PH_IDNO" />
                                        <asp:TemplateField HeaderText="Amount" SortExpression="Amount">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Amount") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label9" runat="server" Text='<%# Bind("Amount", "{0:N}") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="Voucher_Number" HeaderText="Voucher Number" 
                                            SortExpression="Voucher_Number" />
                                        <asp:BoundField DataField="Description" HeaderText="Description" 
                                            SortExpression="Description" />
                                        <asp:BoundField DataField="Remit_Thru" HeaderText="Remit Thru" 
                                            SortExpression="Remit_Thru" />
                                        <asp:BoundField DataField="Particulars" HeaderText="Particulars" 
                                            SortExpression="Particulars" />
                                        <asp:BoundField DataField="Remarks" HeaderText="Remarks" 
                                            SortExpression="Remarks" />
                                        <asp:BoundField DataField="Trans" HeaderText="Trans" SortExpression="Trans" />
                                        <asp:BoundField DataField="Code" HeaderText="Code" SortExpression="Code" />
                                        <asp:TemplateField HeaderText="Date_Exported" SortExpression="Date_Exported">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("Date_Exported") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label10" runat="server" 
                                                    Text='<%# Bind("Date_Exported", "{0:d}") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <EditRowStyle BackColor="#2461BF" />
                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#EFF3FB" />
                                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                </asp:GridView>
                            </asp:View>
                        </asp:MultiView>
                <br />
                    </asp:View>
                </asp:MultiView>
            </td>
        </tr>
        <tr>
            <td class="style10">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>


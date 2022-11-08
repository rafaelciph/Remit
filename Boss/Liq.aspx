<%@ Page Title="Liquidation" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Liq.aspx.vb" Inherits="Boss_Liq" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style9
        {
            width: 53px;
        }
        .style10
        {
            width: 48px;
            height: 48px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <table class="style5">
        <tr>
            <td class="style9">
&nbsp;<img class="style10" src="../Images/folder-contacts-icon.png" /></td>
            <td>
                <strong>Liquidation&nbsp;</strong></td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style9">
                <asp:Label ID="Label1" runat="server" Text="Employee"></asp:Label>
                &nbsp;&nbsp;&nbsp;
            </td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="True" 
                    AutoPostBack="True" DataSourceID="SqlDataSourceEmployee" DataTextField="Name" 
                    DataValueField="IDNo">
                </asp:DropDownList>
&nbsp;<asp:Label ID="Label2" runat="server" Text="IDNo :"></asp:Label>
                <asp:Label ID="lblid" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style9">
                &nbsp;</td>
            <td>
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID" 
                    DataSourceID="SqlDataSource" ForeColor="#333333" GridLines="None" 
                    SkinID="KylieSkin">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:CommandField HeaderText="Select" ShowSelectButton="True" />
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                            ReadOnly="True" SortExpression="ID" Visible="False" />
                        <asp:TemplateField HeaderText="Document Date" SortExpression="Document_Date">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Document_Date") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" 
                                    Text='<%# Bind("Document_Date", "{0:d}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="PH_IDNO" HeaderText="IDNO" 
                            SortExpression="PH_IDNO" />
                        <asp:BoundField DataField="Employee_Name" HeaderText="Employee_Name" 
                            SortExpression="Employee_Name" Visible="False" />
                        <asp:TemplateField HeaderText="Amount" SortExpression="Amount">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Amount") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("Amount", "{0:N}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Voucher_Number" HeaderText="Voucher No." 
                            SortExpression="Voucher_Number" />
                        <asp:BoundField DataField="Description" HeaderText="Description" 
                            SortExpression="Description" Visible="False" />
                        <asp:BoundField DataField="Remit_Thru" HeaderText="Remit_Thru" 
                            SortExpression="Remit_Thru" Visible="False" />
                        <asp:BoundField DataField="Particulars" HeaderText="Particulars" 
                            SortExpression="Particulars" Visible="False" />
                        <asp:BoundField DataField="Remarks" HeaderText="Remarks" 
                            SortExpression="Remarks" Visible="False" />
                        <asp:BoundField DataField="Trans" HeaderText="Trans" SortExpression="Trans" 
                            Visible="False" />
                        <asp:BoundField DataField="Code" HeaderText="Code" SortExpression="Code" 
                            Visible="False" />
                        <asp:BoundField DataField="Due_Date" HeaderText="Due_Date" 
                            SortExpression="Due_Date" Visible="False" />
                        <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" 
                            Visible="False" />
                        <asp:BoundField DataField="Date_Exported" HeaderText="Date_Exported" 
                            SortExpression="Date_Exported" Visible="False" />
                        <asp:BoundField DataField="Date_Liq" HeaderText="Date_Liq" 
                            SortExpression="Date_Liq" Visible="False" />
                        <asp:BoundField DataField="Due_year" HeaderText="Due_year" 
                            SortExpression="Due_year" Visible="False" />
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td class="style9">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style9">
                &nbsp;</td>
            <td>
                <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
                    BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" 
                    CellPadding="3" CellSpacing="2" DataKeyNames="ID" DataSourceID="SqlDataSource" 
                    EnableModelValidation="True" Height="50px" Width="277px">
                    <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" 
                        HorizontalAlign="Left" Wrap="False" />
                    <EmptyDataRowStyle BackColor="White" />
                    <Fields>
                        <asp:BoundField DataField="ID" HeaderText="Transaction ID" 
                            InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                        <asp:TemplateField HeaderText="Document Date" SortExpression="Document Date">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" ReadOnly="True" 
                                    Text='<%# Bind("Document_Date", "{0:d}") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox16" runat="server" Text='<%# Bind("Document_Date") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label16" runat="server" 
                                    Text='<%# Bind("Document_Date", "{0:d}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="IDNO" SortExpression="PH_IDNO">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" ReadOnly="True" 
                                    Text='<%# Bind("PH_IDNO") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox17" runat="server" Text='<%# Bind("PH_IDNO") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label17" runat="server" Text='<%# Bind("PH_IDNO") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Name" SortExpression="Employee_Name">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox5" runat="server" ReadOnly="True" 
                                    Text='<%# Bind("Employee_Name") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox18" runat="server" Text='<%# Bind("Employee_Name") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("Employee_Name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Amount" SortExpression="Amount">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox6" runat="server" ReadOnly="True" 
                                    Text='<%# Bind("Amount", "{0:N}") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox19" runat="server" Text='<%# Bind("Amount") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("Amount", "{0:N}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Voucher No." SortExpression="Voucher_Number">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox7" runat="server" ReadOnly="True" 
                                    Text='<%# Bind("Voucher_Number") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox20" runat="server" Text='<%# Bind("Voucher_Number") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("Voucher_Number") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Description" SortExpression="Description">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox8" runat="server" ReadOnly="True" 
                                    Text='<%# Bind("Description") %>' Width="275px"></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox21" runat="server" Text='<%# Bind("Description") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label8" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Remit Thru" SortExpression="Remit_Thru">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox9" runat="server" ReadOnly="True" 
                                    Text='<%# Bind("Remit_Thru") %>' Width="275px"></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox22" runat="server" Text='<%# Bind("Remit_Thru") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label9" runat="server" Text='<%# Bind("Remit_Thru") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Particulars" SortExpression="Particulars">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox13" runat="server" Height="21px" ReadOnly="True" 
                                    Text='<%# Bind("Particulars") %>' Width="275px"></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox23" runat="server" Text='<%# Bind("Particulars") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label13" runat="server" Text='<%# Bind("Particulars") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Remarks" SortExpression="Remarks">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("Remarks") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox24" runat="server" Text='<%# Bind("Remarks") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label12" runat="server" Text='<%# Bind("Remarks") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Transaction Code" SortExpression="Trans">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox11" runat="server" ReadOnly="True" 
                                    Text='<%# Bind("Trans") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox25" runat="server" Text='<%# Bind("Trans") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label11" runat="server" Text='<%# Bind("Trans") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Code" SortExpression="Code">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox10" runat="server" ReadOnly="True" 
                                    Text='<%# Bind("Code") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox26" runat="server" Text='<%# Bind("Code") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label10" runat="server" Text='<%# Bind("Code") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Duedate" SortExpression="Due_Date">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox14" runat="server" ReadOnly="True" 
                                    Text='<%# Bind("Due_Date") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox27" runat="server" Text='<%# Bind("Due_Date") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label14" runat="server" Text='<%# Bind("Due_Date", "{0}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Status" SortExpression="Status">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList2" runat="server" 
                                    DataSourceID="SqlDataSourceStatus" DataTextField="Status" 
                                    DataValueField="Status" SelectedValue='<%# Bind("Status") %>'>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox28" runat="server" Text='<%# Bind("Status") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label18" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Date Imported" SortExpression="Date_Exported">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox15" runat="server" Enabled="False" 
                                    Text='<%# Bind("Date_Exported", "{0:d}") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox29" runat="server" Text='<%# Bind("Date_Exported") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label15" runat="server" 
                                    Text='<%# Bind("Date_Exported", "{0:d}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Date Liquidated" SortExpression="Date_Liq">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox30" runat="server" Height="17px" 
                                    Text='<%# Bind("Date_Liq", "{0:d}") %>' Width="103px"></asp:TextBox>
                                &nbsp;<asp:ImageButton ID="ImageButton1" runat="server" 
                                    ImageUrl="~/ico/untitled.JPG" onclick="ImageButton1_Click1" 
                                    style="height: 15px" ToolTip="Date Picker" />
                    <br />
                                <asp:Calendar ID="Calendar1" runat="server" 
                                    onselectionchanged="Calendar1_SelectionChanged1" Visible="False">
                                </asp:Calendar>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox31" runat="server" Text='<%# Bind("Date_Liq") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label19" runat="server" Text='<%# Bind("Date_Liq", "{0:d}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowEditButton="True" />
                    </Fields>
                    <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                    <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" 
                        HorizontalAlign="Left" Wrap="False" />
                    <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" HorizontalAlign="Left" 
                        Wrap="False" />
                </asp:DetailsView>
                <br />
                <asp:TextBox ID="TextBox32" runat="server" ReadOnly="True" Visible="False" 
                    Width="62px">0</asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style9">
                &nbsp;</td>
            <td>
                <asp:SqlDataSource ID="SqlDataSourceEmployee" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:RemitConnectionString %>" 
                    SelectCommand="SELECT IDNo, LastName + ' ' + FirstName AS Name, NickName FROM Employee_Mast ORDER BY name">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:RemitConnectionString %>" 
                    DeleteCommand="DELETE FROM [Remit_Staff] WHERE [ID] = @original_ID" 
                    InsertCommand="INSERT INTO [Remit_Staff] ([Document_Date], [PH_IDNO], [Employee_Name], [Amount], [Voucher_Number], [Description], [Remit_Thru], [Particulars], [Remarks], [Trans], [Code], [Due_Date], [Status], [Date_Exported], [Date_Liq], [Due_year]) VALUES (@Document_Date, @PH_IDNO, @Employee_Name, @Amount, @Voucher_Number, @Description, @Remit_Thru, @Particulars, @Remarks, @Trans, @Code, @Due_Date, @Status, @Date_Exported, @Date_Liq, @Due_year)" 
                    OldValuesParameterFormatString="original_{0}" 
                    SelectCommand="SELECT * FROM [Remit_Staff] WHERE (([Code] = @Code) AND ([PH_IDNO] = @PH_IDNO) AND ([Date_Liq] = @Date_Liq))" 
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
                        <asp:Parameter DefaultValue="CA" Name="Code" Type="String" />
                        <asp:ControlParameter ControlID="lblid" Name="PH_IDNO" PropertyName="Text" 
                            Type="String" />
                        <asp:Parameter DefaultValue=" " Name="Date_Liq" Type="String" />
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
                <asp:SqlDataSource ID="SqlDataSourceStatus" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:RemitConnectionString %>" 
                    SelectCommand="SELECT * FROM [Status]"></asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>


<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Remit.aspx.vb" Inherits="Profile_Remit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style9
        {
            width: 48px;
            height: 48px;
        }
        .style10
        {
            width: 50px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <table border="0" cellspacing="1" width="100%">
    <tr>
        <td style="height: 29px; width: 200%;" colspan="2">
            <table class="style5">
                <tr>
                    <td class="style10">
                        <img class="style9" src="../Images/Money-icon.png" /></td>
                    <td>
&nbsp;<strong>Remittance</strong>&nbsp;</td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td style="height: 29px; width: 0%;" width="100%">
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
                <asp:ListItem Selected="True" Value="0">Reimbursement</asp:ListItem>
                <asp:ListItem Value="1">Cash Advance</asp:ListItem>
                <asp:ListItem Value="2">Other&#39;s</asp:ListItem>
            </asp:DropDownList>
        </td>
        <td style="height: 29px; width: 50%;" width="100%">
            <asp:Label ID="lblidno" runat="server" Visible="False"></asp:Label>
            <asp:Label ID="lblcode" runat="server" Visible="False"></asp:Label>
        </td>
    </tr>
    <tr>
        <td width="100%" colspan="2">
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:RemitConnectionString %>" 
                SelectCommand="SELECT [Document_Date], [PH_IDNO], [Employee_Name], [Amount], [Voucher_Number], [Description], [Remit_Thru], [Particulars], [Remarks], [Trans], [Code], [Due_Date], [Status], [Date_Liq] FROM [Remit_Staff] WHERE ([PH_IDNO] = @PH_IDNO) and Code = @Code">
                <SelectParameters>
                    <asp:ControlParameter ControlID="lblidno" Name="PH_IDNO" PropertyName="Text" 
                        Type="String" />
                    <asp:ControlParameter ControlID="lblcode" Name="Code" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0" 
                EnableTheming="False">
                <asp:View ID="View1" runat="server" EnableTheming="False">
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                        AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                        DataSourceID="SqlDataSource1" EmptyDataText="You have no Record/Transaction" 
                        EnableModelValidation="True" ForeColor="#333333" GridLines="None" PageSize="50">
                        <RowStyle BackColor="#EFF3FB" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <Columns>
                            <asp:TemplateField HeaderText="Document_Date" SortExpression="Document_Date">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Document_Date") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" 
                                        Text='<%# Bind("Document_Date", "{0:d}") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="PH_IDNO" SortExpression="PH_IDNO">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("PH_IDNO") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("PH_IDNO") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Amount" SortExpression="Amount">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Amount") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Amount", "{0:N}") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Voucher_Number" SortExpression="Voucher_Number">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Voucher_Number") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Voucher_Number") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Description" SortExpression="Description">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Description") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Remit_Thru" SortExpression="Remit_Thru">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Remit_Thru") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("Remit_Thru") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Particulars" SortExpression="Particulars">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Particulars") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("Particulars") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Remarks" SortExpression="Remarks">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("Remarks") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("Remarks") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Trans" SortExpression="Trans">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("Trans") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label9" runat="server" Text='<%# Bind("Trans") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Code" SortExpression="Code">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("Code") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label10" runat="server" Text='<%# Bind("Code") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <AlternatingRowStyle BackColor="White" />
                        <PagerSettings FirstPageText="First Page" LastPageText="Last Page" 
                            Mode="NextPreviousFirstLast" NextPageText="Next" PageButtonCount="100" 
                            Position="TopAndBottom" PreviousPageText="Previous" />
                    </asp:GridView>
                </asp:View>
                <br />
                <asp:View ID="View2" runat="server" EnableTheming="False">
                    <asp:GridView ID="GridView2" runat="server" AllowPaging="True" 
                        AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                        DataSourceID="SqlDataSource1" EmptyDataText="You have no Record/Transaction" 
                        EnableModelValidation="True" ForeColor="#333333" GridLines="None" PageSize="50">
                        <RowStyle BackColor="#EFF3FB" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <Columns>
                            <asp:TemplateField HeaderText="Document_Date" SortExpression="Document_Date">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox14" runat="server" Text='<%# Bind("Document_Date") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label14" runat="server" 
                                        Text='<%# Bind("Document_Date", "{0:d}") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="PH_IDNO" SortExpression="PH_IDNO">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox15" runat="server" Text='<%# Bind("PH_IDNO") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label15" runat="server" Text='<%# Bind("PH_IDNO") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Amount" SortExpression="Amount">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox16" runat="server" Text='<%# Bind("Amount") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label16" runat="server" Text='<%# Bind("Amount", "{0:N}") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Voucher_Number" SortExpression="Voucher_Number">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox17" runat="server" Text='<%# Bind("Voucher_Number") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label17" runat="server" Text='<%# Bind("Voucher_Number") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Description" SortExpression="Description">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox18" runat="server" Text='<%# Bind("Description") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label18" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Remit_Thru" SortExpression="Remit_Thru">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox19" runat="server" Text='<%# Bind("Remit_Thru") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label19" runat="server" Text='<%# Bind("Remit_Thru") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Particulars" SortExpression="Particulars">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox20" runat="server" Text='<%# Bind("Particulars") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label20" runat="server" Text='<%# Bind("Particulars") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Remarks" SortExpression="Remarks">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox21" runat="server" Text='<%# Bind("Remarks") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label21" runat="server" Text='<%# Bind("Remarks") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Trans" SortExpression="Trans">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox22" runat="server" Text='<%# Bind("Trans") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label22" runat="server" Text='<%# Bind("Trans") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Code" SortExpression="Code">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox23" runat="server" Text='<%# Bind("Code") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label23" runat="server" Text='<%# Bind("Code") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Due_Date" SortExpression="Due_Date">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox24" runat="server" Text='<%# Bind("Due_Date") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label24" runat="server" Text='<%# Bind("Due_Date", "{0:d}") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Status" SortExpression="Status">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox25" runat="server" Text='<%# Bind("Status") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label25" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Date_Liquidated" SortExpression="Date_Liq">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox26" runat="server" Text='<%# Bind("Date_Liq") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label26" runat="server" Text='<%# Bind("Date_Liq", "{0:d}") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <AlternatingRowStyle BackColor="White" />
                        <PagerSettings FirstPageText="First Page" LastPageText="Last Page" 
                            Mode="NextPreviousFirstLast" NextPageText="Next" PageButtonCount="100" 
                            Position="TopAndBottom" PreviousPageText="Previous" />
                    </asp:GridView>
                </asp:View>
                <asp:View ID="View3" runat="server">
                    <asp:SqlDataSource ID="SqlDataSource_others" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:RemitConnectionString %>" 
                        SelectCommand="SELECT [Document_Date], [PH_IDNO], [Employee_Name], [Amount], [Voucher_Number], [Description], [Remit_Thru], [Particulars], [Remarks], [Trans], [Code], [Due_Date], [Status], [Date_Exported], [Date_Liq] FROM [Remit_Staff] WHERE (([PH_IDNO] = @PH_IDNO) AND ([Code] &lt;&gt; @Code) AND ([Code] &lt;&gt; @Code2))">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="lblidno" Name="PH_IDNO" PropertyName="Text" 
                                Type="String" />
                            <asp:Parameter DefaultValue="CA" Name="Code" Type="String" />
                            <asp:Parameter DefaultValue="Reimb" Name="Code2" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:GridView ID="GridView3" runat="server" AllowSorting="True" 
                        AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource_others" 
                        EnableModelValidation="True" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField HeaderText="Document Date" SortExpression="Document_Date">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox27" runat="server" Text='<%# Bind("Document_Date") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label27" runat="server" 
                                        Text='<%# Bind("Document_Date", "{0:d}") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="PH_IDNO" HeaderText="IDNO" 
                                SortExpression="PH_IDNO" />
                            <asp:TemplateField HeaderText="Amount" SortExpression="Amount">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox28" runat="server" Text='<%# Bind("Amount") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label28" runat="server" Text='<%# Bind("Amount", "{0:N}") %>'></asp:Label>
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
                                    <asp:TextBox ID="TextBox29" runat="server" Text='<%# Bind("Date_Exported") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label29" runat="server" 
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
        </td>
    </tr>
</table>
</asp:Content>


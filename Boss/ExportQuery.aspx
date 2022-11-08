<%@ Page Title="Export to Query" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false"  EnableEventValidation="false" CodeFile="ExportQuery.aspx.vb" Inherits="Boss_ExportQuery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">

        .style10
        {
            width: 50px;
        }
        .style9
        {
            width: 48px;
            height: 48px;
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
                    <asp:ListItem Selected="True" Value="0">IDNo</asp:ListItem>
                    <asp:ListItem Value="1">Employee Name</asp:ListItem>
                    <asp:ListItem Value="2">Code</asp:ListItem>
                    <asp:ListItem Value="3">Trans</asp:ListItem>
                    <asp:ListItem Value="4">Status</asp:ListItem>
                    <asp:ListItem Value="5">Document Date</asp:ListItem>
                    <asp:ListItem Value="6">Voucher Number</asp:ListItem>
                    <asp:ListItem Value="7">Dae Liquidated</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td style="height: 29px; width: 50%; text-align: left;" width="100%">
                &nbsp;</td>
        </tr>
        <tr>
            <td width="100%" colspan="2">
                <asp:TextBox ID="txtfind" runat="server" Width="177px"></asp:TextBox>
                <asp:DropDownList ID="DDCode" runat="server" AutoPostBack="True" Visible="False">
                    <asp:ListItem>CA</asp:ListItem>
                    <asp:ListItem>Reimb</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="DDTrans" runat="server" AutoPostBack="True" Visible="False">
                    <asp:ListItem>CASH ADVANCE</asp:ListItem>
                    <asp:ListItem>REIMBURSEMENT</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="DDStatus" runat="server" AutoPostBack="True" Visible="False">
                    <asp:ListItem>Unliquidated</asp:ListItem>
                    <asp:ListItem>Liquidated Ontime</asp:ListItem>
                </asp:DropDownList>
                <asp:Button ID="Button1" runat="server" Text="Search..." />
                            <br />
                            <asp:Panel ID="Panel6" runat="server" Visible="False">
                                From&nbsp;<asp:TextBox ID="txtfrom" runat="server" Width="65px"></asp:TextBox>
                                &nbsp; To
                                <asp:TextBox ID="txtto" runat="server" Width="65px"></asp:TextBox>
                                &nbsp;<asp:Button ID="Button2" runat="server" Text="Search..." />
                                <br />
                                &nbsp;</asp:Panel>
                            <br />
                <asp:Button ID="Button3" runat="server" Text="Export To Excel" />
                            <br />
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:RemitConnectionString %>" 

                                SelectCommand="SELECT Document_Date, PH_IDNO, Employee_Name, Amount, Voucher_Number, Description, Remit_Thru, Particulars, Remarks, Trans, Code, Due_Date, Status, Date_Liq FROM Remit_Staff WHERE (PH_IDNO = @PH_IDNO) ORDER BY Document_Date DESC">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="txtfind" Name="PH_IDNO" 
                                        PropertyName="Text" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0" 
                EnableTheming="False">
                    <asp:View ID="View1" runat="server" EnableTheming="False">
                        <asp:Panel ID="Panel2" runat="server" ScrollBars="Horizontal" Width="920px">
                            <asp:GridView ID="GridView5" runat="server" AllowPaging="True" 
                                AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                                DataSourceID="SqlDataSource1" EmptyDataText="You have no Record/Transaction" 
                                ForeColor="#333333" GridLines="None" HorizontalAlign="Left" Width="100%" 
                                PageSize="50">
                                <RowStyle BackColor="#EFF3FB" />
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" 
                                    HorizontalAlign="Left" />
                                <Columns>
                                    <asp:TemplateField HeaderText="Document_Date" SortExpression="Document_Date">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox40" runat="server" Text='<%# Bind("Document_Date") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label42" runat="server" 
                                                Text='<%# Bind("Document_Date", "{0:d}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="PH_IDNO" SortExpression="PH_IDNO">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox41" runat="server" Text='<%# Bind("PH_IDNO") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label43" runat="server" Text='<%# Bind("PH_IDNO") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Name" SortExpression="Employee_Name">
                                        <EditItemTemplate>
                                            <asp:Label ID="Label44" runat="server" Text='<%# Eval("Employee_Name") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label45" runat="server" Text='<%# Bind("Employee_Name") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Amount" SortExpression="Amount">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox42" runat="server" Text='<%# Bind("Amount") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label46" runat="server" Text='<%# Bind("Amount", "{0:N}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Voucher_Number" SortExpression="Voucher_Number">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox43" runat="server" Text='<%# Bind("Voucher_Number") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label47" runat="server" Text='<%# Bind("Voucher_Number") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Description" SortExpression="Description">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox44" runat="server" Text='<%# Bind("Description") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label48" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Remit_Thru" SortExpression="Remit_Thru">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox45" runat="server" Text='<%# Bind("Remit_Thru") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label49" runat="server" Text='<%# Bind("Remit_Thru") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Particulars" SortExpression="Particulars">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox46" runat="server" Text='<%# Bind("Particulars") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label50" runat="server" Text='<%# Bind("Particulars") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Remarks" SortExpression="Remarks">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox47" runat="server" Text='<%# Bind("Remarks") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label51" runat="server" Text='<%# Bind("Remarks") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Trans" SortExpression="Trans">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox48" runat="server" Text='<%# Bind("Trans") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label52" runat="server" Text='<%# Bind("Trans") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Code" SortExpression="Code">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox49" runat="server" Text='<%# Bind("Code") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label53" runat="server" Text='<%# Bind("Code") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Due_Date" SortExpression="Due_Date">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox50" runat="server" Text='<%# Bind("Due_Date") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label54" runat="server" Text='<%# Bind("Due_Date", "{0:d}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Status" SortExpression="Status">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox51" runat="server" Text='<%# Bind("Status") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label55" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Date_Liquidated" SortExpression="Date_Liq">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox52" runat="server" Text='<%# Bind("Date_Liq") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label56" runat="server" Text='<%# Bind("Date_Liq", "{0:d}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <EditRowStyle BackColor="#2461BF" />
                                <AlternatingRowStyle BackColor="White" />
                                <PagerSettings FirstPageText="First Page" LastPageText="Last Page" 
                                    Mode="NextPreviousFirstLast" NextPageText="Next" PageButtonCount="100" 
                                    Position="TopAndBottom" PreviousPageText="Previous" />
                            </asp:GridView>
                            <br />
                        </asp:Panel>
                    </asp:View>
                    <br />
                    <asp:View ID="View2" runat="server" EnableTheming="False">
                        <asp:Panel ID="Panel3" runat="server" ScrollBars="Horizontal"  Width="920px">
                            <asp:GridView ID="GridView2" runat="server" AllowPaging="True" 
                            AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                            DataSourceID="SqlDataSource2" EmptyDataText="You have no Record/Transaction" 
                                ForeColor="#333333" GridLines="None" HorizontalAlign="Left" Width="100%" 
                                PageSize="50">
                                <RowStyle BackColor="#EFF3FB" />
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" 
                                    HorizontalAlign="Left" />
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
                                    <asp:TemplateField HeaderText="Name" SortExpression="Employee_Name">
                                        <EditItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Employee_Name") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("Employee_Name") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" />
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
                            <br />
                           
                            <br />
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:RemitConnectionString %>" 
                                SelectCommand="SELECT Document_Date, PH_IDNO, Employee_Name, Amount, Voucher_Number, Description, Remit_Thru, Particulars, Remarks, Trans, Code, Due_Date, Status, Date_Liq FROM Remit_Staff WHERE (Employee_Name = @Employee_Name) ORDER BY Document_Date DESC">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="txtfind" Name="Employee_Name" 
                                        PropertyName="Text" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </asp:Panel>
                    </asp:View>
                    <asp:View ID="View3" runat="server">
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:RemitConnectionString %>" 

                            SelectCommand="SELECT Document_Date, PH_IDNO, Employee_Name, Amount, Voucher_Number, Description, Remit_Thru, Particulars, Remarks, Trans, Code, Due_Date, Status, Date_Liq FROM Remit_Staff WHERE (Code = @Code) ORDER BY Document_Date DESC">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DDCode" Name="Code" PropertyName="SelectedValue" 
                                Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:Panel ID="Panel4" runat="server" ScrollBars="Horizontal" Width="920px">
                            <asp:GridView ID="GridView6" runat="server" AllowPaging="True" 
                                AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                                DataSourceID="SqlDataSource3" EmptyDataText="You have no Record/Transaction" 
                                ForeColor="#333333" GridLines="None" HorizontalAlign="Left" Width="100%" 
                                PageSize="50">
                                <RowStyle BackColor="#EFF3FB" />
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" 
                                    HorizontalAlign="Left" />
                                <Columns>
                                    <asp:TemplateField HeaderText="Document_Date" SortExpression="Document_Date">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox53" runat="server" Text='<%# Bind("Document_Date") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label57" runat="server" 
                                                Text='<%# Bind("Document_Date", "{0:d}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="PH_IDNO" SortExpression="PH_IDNO">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox54" runat="server" Text='<%# Bind("PH_IDNO") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label58" runat="server" Text='<%# Bind("PH_IDNO") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Name" SortExpression="Employee_Name">
                                        <EditItemTemplate>
                                            <asp:Label ID="Label59" runat="server" Text='<%# Eval("Employee_Name") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label60" runat="server" Text='<%# Bind("Employee_Name") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Amount" SortExpression="Amount">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox55" runat="server" Text='<%# Bind("Amount") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label61" runat="server" Text='<%# Bind("Amount", "{0:N}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Voucher_Number" SortExpression="Voucher_Number">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox56" runat="server" Text='<%# Bind("Voucher_Number") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label62" runat="server" Text='<%# Bind("Voucher_Number") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Description" SortExpression="Description">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox57" runat="server" Text='<%# Bind("Description") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label63" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Remit_Thru" SortExpression="Remit_Thru">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox58" runat="server" Text='<%# Bind("Remit_Thru") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label64" runat="server" Text='<%# Bind("Remit_Thru") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Particulars" SortExpression="Particulars">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox59" runat="server" Text='<%# Bind("Particulars") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label65" runat="server" Text='<%# Bind("Particulars") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Remarks" SortExpression="Remarks">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox60" runat="server" Text='<%# Bind("Remarks") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label66" runat="server" Text='<%# Bind("Remarks") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Trans" SortExpression="Trans">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox61" runat="server" Text='<%# Bind("Trans") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label67" runat="server" Text='<%# Bind("Trans") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Code" SortExpression="Code">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox62" runat="server" Text='<%# Bind("Code") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label68" runat="server" Text='<%# Bind("Code") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Due_Date" SortExpression="Due_Date">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox63" runat="server" Text='<%# Bind("Due_Date") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label69" runat="server" Text='<%# Bind("Due_Date", "{0:d}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Status" SortExpression="Status">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox64" runat="server" Text='<%# Bind("Status") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label70" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Date_Liquidated" SortExpression="Date_Liq">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox65" runat="server" Text='<%# Bind("Date_Liq") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label71" runat="server" Text='<%# Bind("Date_Liq", "{0:d}") %>'></asp:Label>
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

                        <asp:View ID="View4" runat="server">
                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:RemitConnectionString %>" 
   
                            
                                SelectCommand="SELECT Document_Date, PH_IDNO, Employee_Name, Amount, Voucher_Number, Description, Remit_Thru, Particulars, Remarks, Trans, Code, Due_Date, Status, Date_Liq FROM Remit_Staff WHERE (Trans = @Trans) ORDER BY Document_Date DESC">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DDTrans" Name="Trans" PropertyName="SelectedValue" 
                                Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:Panel ID="Panel1" runat="server" ScrollBars="Horizontal" Width="920px">
                            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                                AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                                DataSourceID="SqlDataSource4" EmptyDataText="You have no Record/Transaction" 
                                ForeColor="#333333" GridLines="None" HorizontalAlign="Left" Width="100%" 
                                PageSize="50">
                                <RowStyle BackColor="#EFF3FB" />
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" 
                                    HorizontalAlign="Left" />
                                <Columns>
                                    <asp:TemplateField HeaderText="Document_Date" SortExpression="Document_Date">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox53" runat="server" Text='<%# Bind("Document_Date") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label57" runat="server" 
                                                Text='<%# Bind("Document_Date", "{0:d}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="PH_IDNO" SortExpression="PH_IDNO">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox54" runat="server" Text='<%# Bind("PH_IDNO") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label58" runat="server" Text='<%# Bind("PH_IDNO") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Name" SortExpression="Employee_Name">
                                        <EditItemTemplate>
                                            <asp:Label ID="Label59" runat="server" Text='<%# Eval("Employee_Name") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label60" runat="server" Text='<%# Bind("Employee_Name") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Amount" SortExpression="Amount">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox55" runat="server" Text='<%# Bind("Amount") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label61" runat="server" Text='<%# Bind("Amount", "{0:N}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Voucher_Number" SortExpression="Voucher_Number">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox56" runat="server" Text='<%# Bind("Voucher_Number") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label62" runat="server" Text='<%# Bind("Voucher_Number") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Description" SortExpression="Description">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox57" runat="server" Text='<%# Bind("Description") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label63" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Remit_Thru" SortExpression="Remit_Thru">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox58" runat="server" Text='<%# Bind("Remit_Thru") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label64" runat="server" Text='<%# Bind("Remit_Thru") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Particulars" SortExpression="Particulars">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox59" runat="server" Text='<%# Bind("Particulars") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label65" runat="server" Text='<%# Bind("Particulars") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Remarks" SortExpression="Remarks">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox60" runat="server" Text='<%# Bind("Remarks") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label66" runat="server" Text='<%# Bind("Remarks") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Trans" SortExpression="Trans">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox61" runat="server" Text='<%# Bind("Trans") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label67" runat="server" Text='<%# Bind("Trans") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Code" SortExpression="Code">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox62" runat="server" Text='<%# Bind("Code") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label68" runat="server" Text='<%# Bind("Code") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Due_Date" SortExpression="Due_Date">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox63" runat="server" Text='<%# Bind("Due_Date") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label69" runat="server" Text='<%# Bind("Due_Date", "{0:d}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Status" SortExpression="Status">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox64" runat="server" Text='<%# Bind("Status") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label70" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Date_Liquidated" SortExpression="Date_Liq">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox65" runat="server" Text='<%# Bind("Date_Liq") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label71" runat="server" Text='<%# Bind("Date_Liq", "{0:d}") %>'></asp:Label>
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

               <asp:View ID="View5" runat="server">
                        <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:RemitConnectionString %>" 
   
                            
                                
                            SelectCommand="SELECT Document_Date, PH_IDNO, Employee_Name, Amount, Voucher_Number, Description, Remit_Thru, Particulars, Remarks, Trans, Code, Due_Date, Status, Date_Liq FROM Remit_Staff WHERE (Status = @Status) ORDER BY Document_Date DESC">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DDStatus" Name="Status" PropertyName="SelectedValue" 
                                Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:Panel ID="Panel5" runat="server" ScrollBars="Horizontal" Width="920px">
                            <asp:GridView ID="GridView3" runat="server" AllowPaging="True" 
                                AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                                DataSourceID="SqlDataSource5" EmptyDataText="You have no Record/Transaction" 
                                ForeColor="#333333" GridLines="None" HorizontalAlign="Left" Width="100%" 
                                PageSize="50">
                                <RowStyle BackColor="#EFF3FB" />
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" 
                                    HorizontalAlign="Left" />
                                <Columns>
                                    <asp:TemplateField HeaderText="Document_Date" SortExpression="Document_Date">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox53" runat="server" Text='<%# Bind("Document_Date") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label57" runat="server" 
                                                Text='<%# Bind("Document_Date", "{0:d}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="PH_IDNO" SortExpression="PH_IDNO">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox54" runat="server" Text='<%# Bind("PH_IDNO") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label58" runat="server" Text='<%# Bind("PH_IDNO") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Name" SortExpression="Employee_Name">
                                        <EditItemTemplate>
                                            <asp:Label ID="Label59" runat="server" Text='<%# Eval("Employee_Name") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label60" runat="server" Text='<%# Bind("Employee_Name") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Amount" SortExpression="Amount">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox55" runat="server" Text='<%# Bind("Amount") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label61" runat="server" Text='<%# Bind("Amount", "{0:N}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Voucher_Number" SortExpression="Voucher_Number">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox56" runat="server" Text='<%# Bind("Voucher_Number") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label62" runat="server" Text='<%# Bind("Voucher_Number") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Description" SortExpression="Description">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox57" runat="server" Text='<%# Bind("Description") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label63" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Remit_Thru" SortExpression="Remit_Thru">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox58" runat="server" Text='<%# Bind("Remit_Thru") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label64" runat="server" Text='<%# Bind("Remit_Thru") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Particulars" SortExpression="Particulars">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox59" runat="server" Text='<%# Bind("Particulars") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label65" runat="server" Text='<%# Bind("Particulars") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Remarks" SortExpression="Remarks">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox60" runat="server" Text='<%# Bind("Remarks") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label66" runat="server" Text='<%# Bind("Remarks") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Trans" SortExpression="Trans">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox61" runat="server" Text='<%# Bind("Trans") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label67" runat="server" Text='<%# Bind("Trans") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Code" SortExpression="Code">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox62" runat="server" Text='<%# Bind("Code") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label68" runat="server" Text='<%# Bind("Code") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Due_Date" SortExpression="Due_Date">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox63" runat="server" Text='<%# Bind("Due_Date") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label69" runat="server" Text='<%# Bind("Due_Date", "{0:d}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Status" SortExpression="Status">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox64" runat="server" Text='<%# Bind("Status") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label70" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Date_Liquidated" SortExpression="Date_Liq">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox65" runat="server" Text='<%# Bind("Date_Liq") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label71" runat="server" Text='<%# Bind("Date_Liq", "{0:d}") %>'></asp:Label>
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

                      <asp:View ID="View6" runat="server">
                        <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:RemitConnectionString %>" 

                                                    
                              SelectCommand="SELECT * FROM [Remit_Staff] WHERE (([Document_Date] &gt;= @Document_Date) AND ([Document_Date] &lt;= @Document_Date2))">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="txtfrom" Name="Document_Date" PropertyName="Text" 
                                Type="DateTime" />
                                <asp:ControlParameter ControlID="txtto" Name="Document_Date2" 
                                    PropertyName="Text" Type="DateTime" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:Panel ID="Panel7" runat="server" ScrollBars="Horizontal" Width="920px">
                            <asp:GridView ID="GridView4" runat="server" AllowPaging="True" 
                                AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                                DataSourceID="SqlDataSource6" EmptyDataText="You have no Record/Transaction" 
                                ForeColor="#333333" GridLines="None" HorizontalAlign="Left" Width="100%" 
                                DataKeyNames="ID" PageSize="50">
                                <RowStyle BackColor="#EFF3FB" />
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" 
                                    HorizontalAlign="Left" />
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
                                    <asp:BoundField DataField="Due_Date" HeaderText="Due_Date" 
                                        SortExpression="Due_Date" />
                                    <asp:BoundField DataField="Status" HeaderText="Status" 
                                        SortExpression="Status" />
                                    <asp:TemplateField HeaderText="Date_Liq" SortExpression="Date_Liq">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Date_Liq") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("Date_Liq", "{0:d}") %>'></asp:Label>
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
                        <asp:SqlDataSource ID="SqlDataSource7" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:RemitConnectionString %>" 

                             SelectCommand="SELECT * FROM [Remit_Staff] WHERE Voucher_Number = @Voucher_Number">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="txtfind" Name="Voucher_Number " 
                                    PropertyName="Text" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:Panel ID="Panel8" runat="server" ScrollBars="Horizontal" Width="920px">
                            <asp:GridView ID="GridView7" runat="server" AllowPaging="True" 
                                AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                                DataSourceID="SqlDataSource7" EmptyDataText="You have no Record/Transaction" 
                                ForeColor="#333333" GridLines="None" HorizontalAlign="Left" Width="100%" 
                                DataKeyNames="ID" PageSize="5">
                                <RowStyle BackColor="#EFF3FB" />
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" 
                                    HorizontalAlign="Left" />
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
                                    <asp:BoundField DataField="Due_Date" HeaderText="Due_Date" 
                                        SortExpression="Due_Date" />
                                    <asp:BoundField DataField="Status" HeaderText="Status" 
                                        SortExpression="Status" />
                                    <asp:TemplateField HeaderText="Date_Liq" SortExpression="Date_Liq">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Date_Liq") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("Date_Liq", "{0:d}") %>'></asp:Label>
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

                        <asp:View ID="View8" runat="server">
                        <asp:SqlDataSource ID="SqlDataSource8" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:RemitConnectionString %>" 

                             
                                SelectCommand="SELECT ID, Document_Date, PH_IDNO, Employee_Name, Amount, Voucher_Number, Description, Remit_Thru, Particulars, Remarks, Trans, Code, Due_Date, Status, Date_Exported, Date_Liq, Due_year FROM Remit_Staff WHERE (Date_Liq &gt;= @Date_Liq) AND (Date_Liq &lt;= @Date_Liq2)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="txtfrom" Name="Date_Liq" 
                                    PropertyName="Text" />
                                <asp:ControlParameter ControlID="txtto" Name="Date_Liq2" PropertyName="Text" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:Panel ID="Panel9" runat="server" ScrollBars="Horizontal" Width="920px">
                            <asp:GridView ID="GridView8" runat="server" AllowPaging="True" 
                                AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                                DataSourceID="SqlDataSource8" EmptyDataText="You have no Record/Transaction" 
                                ForeColor="#333333" GridLines="None" HorizontalAlign="Left" Width="100%" 
                                DataKeyNames="ID" PageSize="50">
                                <RowStyle BackColor="#EFF3FB" />
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" 
                                    HorizontalAlign="Left" />
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
                                    <asp:BoundField DataField="Due_Date" HeaderText="Due_Date" 
                                        SortExpression="Due_Date" />
                                    <asp:BoundField DataField="Status" HeaderText="Status" 
                                        SortExpression="Status" />
                                    <asp:TemplateField HeaderText="Date_Liq" SortExpression="Date_Liq">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Date_Liq") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("Date_Liq", "{0:d}") %>'></asp:Label>
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

                </asp:MultiView>

            </td>
        </tr>
        <tr>
            <td width="100%" colspan="2">
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>


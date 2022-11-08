Imports System.Data
Imports System.Data.SqlClient
Imports System.IO
Partial Class Profile_Remit
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Response.Cache.SetCacheability(HttpCacheability.NoCache)
        If Not Roles.IsUserInRole("staff") Or Not Roles.IsUserInRole("nimda") Then
            Response.Redirect("~/Error/Err.aspx")
        End If
        If Not Page.IsPostBack Then
            lblidno.Text = Server.HtmlDecode(Profile.Idno)
            Me.lblcode.Text = "Reimb"
        End If
    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList1.SelectedIndexChanged
        If Me.DropDownList1.SelectedValue = 0 Then
            Me.lblcode.Text = "Reimb"
            MultiView1.ActiveViewIndex = DropDownList1.SelectedValue
        ElseIf Me.DropDownList1.SelectedValue = 1 Then
            Me.lblcode.Text = "CA"
            MultiView1.ActiveViewIndex = DropDownList1.SelectedValue
        Else
            Me.lblcode.Text = ""
            MultiView1.ActiveViewIndex = DropDownList1.SelectedValue
        End If

    End Sub

    Public Overloads Overrides Sub VerifyRenderingInServerForm(ByVal control As Control)
        'Verifies that the control is rendered 
    End Sub

    Protected Sub OnPaging(ByVal sender As Object, ByVal e As GridViewPageEventArgs)
        GridView1.PageIndex = e.NewPageIndex
        GridView1.DataBind()
    End Sub

    Protected Sub btnprintcurrentpage_Click(sender As Object, e As System.EventArgs) Handles btnprintcurrentpage.Click

        If Me.DropDownList1.SelectedValue = 0 Then
            GridView1.PagerSettings.Visible = False
        ElseIf Me.DropDownList1.SelectedValue = 1 Then
            GridView2.PagerSettings.Visible = False
        Else
            GridView2.PagerSettings.Visible = False
        End If

        Dim sw As New StringWriter()
        Dim hw As New HtmlTextWriter(sw)

        If Me.DropDownList1.SelectedValue = 0 Then
            GridView1.RenderControl(hw)
        ElseIf Me.DropDownList1.SelectedValue = 1 Then
            GridView2.RenderControl(hw)
        Else
            GridView3.RenderControl(hw)
        End If

        Dim gridHTML As String = sw.ToString().Replace("""", "'") _
           .Replace(System.Environment.NewLine, "")
        Dim sb As New StringBuilder()
        sb.Append("<script type = 'text/javascript'>")
        sb.Append("window.onload = new function(){")
        sb.Append("var printWin = window.open('', '', 'left=0")
        sb.Append(",top=0,width=1000,height=600,status=0');")
        sb.Append("printWin.document.write(""")
        sb.Append(gridHTML)
        sb.Append(""");")
        sb.Append("printWin.document.close();")
        sb.Append("printWin.focus();")
        sb.Append("printWin.print();")
        sb.Append("printWin.close();};")
        sb.Append("</script>")
        ClientScript.RegisterStartupScript(Me.GetType(), "GridPrint", sb.ToString())

        If Me.DropDownList1.SelectedValue = 0 Then
            GridView1.PagerSettings.Visible = True
        ElseIf Me.DropDownList1.SelectedValue = 1 Then
            GridView2.PagerSettings.Visible = True
        Else
            GridView3.PagerSettings.Visible = True
        End If
    End Sub

    Protected Sub btnprinterallpages_Click(sender As Object, e As System.EventArgs) Handles btnprinterallpages.Click
        GridView1.AllowPaging = False
        Dim sw As New StringWriter()
        Dim hw As New HtmlTextWriter(sw)
        If Me.DropDownList1.SelectedValue = 0 Then
            GridView1.RenderControl(hw)
        ElseIf Me.DropDownList1.SelectedValue = 1 Then
            GridView2.RenderControl(hw)
        Else
            GridView3.RenderControl(hw)
        End If
        Dim gridHTML As String = sw.ToString().Replace("""", "'") _
           .Replace(System.Environment.NewLine, "")
        Dim sb As New StringBuilder()
        sb.Append("<script type = 'text/javascript'>")
        sb.Append("window.onload = new function(){")
        sb.Append("var printWin = window.open('', '', 'left=0")
        sb.Append(",top=0,width=1000,height=1000,status=0');")
        sb.Append("printWin.document.write(""")
        sb.Append(gridHTML)
        sb.Append(""");")
        sb.Append("printWin.document.close();")
        sb.Append("printWin.focus();")
        sb.Append("printWin.print();")
        sb.Append("printWin.close();};")
        sb.Append("</script>")
        ClientScript.RegisterStartupScript(Me.[GetType](), "GridPrint", sb.ToString())

        If Me.DropDownList1.SelectedValue = 0 Then
            GridView1.AllowPaging = True
        ElseIf Me.DropDownList1.SelectedValue = 1 Then
            GridView2.AllowPaging = True
        Else
            GridView3.AllowPaging = True
        End If
    End Sub
    Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles Button1.Click
        Response.ClearContent()
        Response.AddHeader("content-disposition", "attachment; filename=remittoexcel.xls")
        Response.ContentType = "application/excel"
        Dim sw As New System.IO.StringWriter()
        Dim htw As New HtmlTextWriter(sw)
        
		 If Me.DropDownList1.SelectedValue = 0 Then
            GridView1.RenderControl(htw)
        ElseIf Me.DropDownList1.SelectedValue = 1 Then
            GridView2.RenderControl(htw)
        Else
            GridView3.RenderControl(htw)
        End If
		
        Response.Write(sw.ToString())
        Response.[End]()
    End Sub

 
End Class

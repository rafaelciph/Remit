Imports System.IO
Imports System.Data
Imports System.Drawing
Imports System.Data.SqlClient
Imports System.Configuration
Partial Class Boss_ExportQuery
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
     If Not Roles.IsUserInRole("nimda") Then
            Response.Redirect("~/Error/Err.aspx")
        End If
    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles DropDownList1.SelectedIndexChanged
        Call Pilian()
        If Me.DropDownList1.SelectedValue = 0 Then ' IDNO
            MultiView1.ActiveViewIndex = DropDownList1.SelectedValue
        ElseIf Me.DropDownList1.SelectedValue = 1 Then ' Name
            MultiView1.ActiveViewIndex = DropDownList1.SelectedValue
        ElseIf Me.DropDownList1.SelectedValue = 2 Then
            MultiView1.ActiveViewIndex = DropDownList1.SelectedValue
        ElseIf Me.DropDownList1.SelectedValue = 3 Then
            MultiView1.ActiveViewIndex = DropDownList1.SelectedValue
        ElseIf Me.DropDownList1.SelectedValue = 4 Then
            MultiView1.ActiveViewIndex = DropDownList1.SelectedValue
        ElseIf Me.DropDownList1.SelectedValue = 5 Then
            MultiView1.ActiveViewIndex = DropDownList1.SelectedValue
        ElseIf Me.DropDownList1.SelectedValue = 6 Then
            MultiView1.ActiveViewIndex = DropDownList1.SelectedValue
        ElseIf Me.DropDownList1.SelectedValue = 7 Then
            MultiView1.ActiveViewIndex = DropDownList1.SelectedValue
        End If
    End Sub

    Sub Pilian()
        txtfind.Text = ""
        If Me.DropDownList1.SelectedValue = 0 Or Me.DropDownList1.SelectedValue = 1 Then ' IDNO and Name
            txtfind.Visible = True
            DDCode.Visible = False
            DDTrans.Visible = False
            DDStatus.Visible = False
            Panel6.Visible = False
            Button1.Visible = True
        ElseIf Me.DropDownList1.SelectedValue = 2 Then 'Code
            txtfind.Visible = False
            DDCode.Visible = True
            DDTrans.Visible = False
            DDStatus.Visible = False
            Panel6.Visible = False
            Button1.Visible = True
        ElseIf Me.DropDownList1.SelectedValue = 3 Then ' Trans
            txtfind.Visible = False
            DDCode.Visible = False
            DDTrans.Visible = True
            DDStatus.Visible = False
            Panel6.Visible = False
            Button1.Visible = True
        ElseIf Me.DropDownList1.SelectedValue = 4 Then ' Trans
            txtfind.Visible = False
            DDCode.Visible = False
            DDTrans.Visible = False
            DDStatus.Visible = True
            Panel6.Visible = False
            Button1.Visible = True
        ElseIf Me.DropDownList1.SelectedValue = 5 Or Me.DropDownList1.SelectedValue = 7 Then ' Trans
            txtfind.Visible = False
            DDCode.Visible = False
            DDTrans.Visible = False
            DDStatus.Visible = False
            Panel6.Visible = True
            Button1.Visible = False
        ElseIf Me.DropDownList1.SelectedValue = 6 Then ' Trans
            txtfind.Visible = True
            DDCode.Visible = False
            DDTrans.Visible = False
            DDStatus.Visible = False
            Panel6.Visible = False
            Button1.Visible = True
        End If
    End Sub

    Protected Sub Button3_Click(sender As Object, e As System.EventArgs) Handles Button3.Click
         Response.ClearContent()
        Response.AddHeader("content-disposition", "attachment; filename=" & DropDownList1.SelectedItem.Text & " - Export To Excel.xls")
        Response.ContentType = "application/excel"
        Dim sw As New System.IO.StringWriter()
        Dim htw As New HtmlTextWriter(sw)

        If Me.DropDownList1.SelectedValue = 0 Then ' IDNO
            GridView5.RenderControl(htw)
        ElseIf Me.DropDownList1.SelectedValue = 1 Then ' Name
            GridView2.RenderControl(htw)
        ElseIf Me.DropDownList1.SelectedValue = 2 Then
            GridView6.RenderControl(htw)
        ElseIf Me.DropDownList1.SelectedValue = 3 Then
            GridView1.RenderControl(htw)
        ElseIf Me.DropDownList1.SelectedValue = 4 Then
            GridView3.RenderControl(htw)
        ElseIf Me.DropDownList1.SelectedValue = 5 Then
            GridView4.RenderControl(htw)
        ElseIf Me.DropDownList1.SelectedValue = 6 Then
            GridView7.RenderControl(htw)
        ElseIf Me.DropDownList1.SelectedValue = 7 Then
            GridView8.RenderControl(htw)
        End If

        Response.Write(sw.ToString())
        Response.[End]()
    End Sub

    Public Overrides Sub VerifyRenderingInServerForm(control As Control)
        ' Verifies that the control is rendered
    End Sub


End Class


Partial Class Profile_Remit
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Roles.IsUserInRole("staff") Then
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
End Class

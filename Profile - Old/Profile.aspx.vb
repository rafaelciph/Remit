
Partial Class Profile_Profile
    Inherits System.Web.UI.Page

    Protected Sub cmdSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmdSave.Click
        lblinfo.Text = ""
        txtidno.ReadOnly = False
        txtname.ReadOnly = False
        Profile.Idno = Server.HtmlEncode(txtidno.Text)
        Profile.Name = Server.HtmlEncode(txtname.Text)
        lblinfo.Text = "Profile is updated..."
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Roles.IsUserInRole("staff") Then
            Response.Redirect("~/Error/Err.aspx")
        End If
        If Not Page.IsPostBack Then
            txtidno.Text = Server.HtmlDecode(Profile.Idno)
            txtname.Text = Server.HtmlDecode(Profile.Name)
        End If

        If txtidno.Text = "" Then
            txtidno.ReadOnly = False
            txtname.ReadOnly = False
        ElseIf txtidno.Text <> "" Then
            txtidno.ReadOnly = True
            txtname.ReadOnly = True
        End If
    End Sub
End Class

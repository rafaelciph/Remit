
Partial Class Boss_EmpList
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If Not Roles.IsUserInRole("nimda") Then
            Response.Redirect("~/Error/Err.aspx")
        End If
    End Sub


    Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles Button1.Click
        DetailsView1.ChangeMode(DetailsViewMode.Insert)
    End Sub
End Class

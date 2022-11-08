
Partial Class Boss_RemoveRecord
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If Not Roles.IsUserInRole("nimda") Then
            Response.Redirect("~/Error/Err.aspx")
        End If
    End Sub

    Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles Button1.Click
        If Not IsDate(TextBox1.Text) Then
            Label1.Visible = True
            Label1.Text = "Invalid Date Format"
        Else
            Label1.Text = ""
            Label1.Visible = False
            Label1.Visible = True

        End If
    End Sub
End Class

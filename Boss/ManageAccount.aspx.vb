Imports System.IO

Partial Class Boss_ManageAccount
    Inherits System.Web.UI.Page

    Protected Sub btnchpass_Click(sender As Object, e As System.EventArgs) Handles btnchpass.Click
        'If txtchpass.Text <> "" Then
        '    Try
        '        Dim user As MembershipUser = Membership.GetUser(txtchuser.Text.ToString)

        '        user.UnlockUser()
        '        Dim oldpswd As String = user.ResetPassword(txtchasw.Text.ToString)
        '        Dim newpass As String = txtchpass.Text

        '        user.ChangePassword(oldpswd, newpass)
        '        Label8.Text = "Password has been reset"
        '    Catch ex As Exception
        '        Label8.Text = = "User cannot fund or " & ex.Message.ToString()
        '    End Try
        'Else
        '    Label8.Text = "Retype your Password"
        'End If


    End Sub

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If Not Roles.IsUserInRole("nimda") Then
            Response.Redirect("~/Error/Err.aspx")
        End If
    End Sub

    Protected Sub Button2_Click(sender As Object, e As System.EventArgs) Handles Button2.Click
        If (Membership.DeleteUser(txtusers.Text)) Then
            'FormsAuthentication.SignOut()
            Roles.DeleteCookie()
            'Response.Redirect("~/CreatingUsers.aspx")
            lblResult.Visible = True
            lblResult.Text = "User Account Was Deleted."
            'Call Me.usercnt()
        Else
            lblResult.Visible = True
            lblResult.Text = "Registered user was not deleted."
        End If
    End Sub
End Class


Partial Class Talaanko
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles Button1.Click
        If Me.TextBox1.Text = "c0mp@s$ion" Then
            Me.Panel2.Visible = True
            Me.Panel2.Enabled = True
        Else
            Me.Panel2.Visible = False
            Me.Panel2.Enabled = False
        End If

    End Sub

End Class

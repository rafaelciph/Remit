
Partial Class Site
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        lblname.Text = Server.HtmlDecode(Profile.Name)
        If lblname.Text <> "" Then
            lblidno.Text = Server.HtmlDecode(Profile.Idno)
        End If
        Call SubrootMenu()
    End Sub

    Sub SubrootMenu()
        If Not Roles.IsUserInRole("nimda") Then
            Dim menuItems As MenuItemCollection = NavigationMenu.Items
            Dim adminItem As New MenuItem()
            For Each menuItem As MenuItem In menuItems
                If menuItem.Text = "Administrator" Then
                    adminItem = menuItem
                End If
            Next
            menuItems.Remove(adminItem)
        End If
    End Sub
End Class


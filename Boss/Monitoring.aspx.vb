
Partial Class Boss_Monitoring
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Roles.IsUserInRole("nimda") Then
            Response.Redirect("~/error/err.aspx")
        ElseIf Roles.IsUserInRole("nimda") Then
            'Do Nothing
        End If
    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList1.SelectedIndexChanged
        TextBox3.Text = ""
        MultiView1.ActiveViewIndex = DropDownList1.SelectedValue
        If Me.DropDownList1.SelectedValue = 3 Then
            Me.TextBox3.Visible = False
            Button1.Visible = False
        Else
            Me.TextBox3.Visible = True
            Button1.Visible = True
        End If
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        If DropDownList1.SelectedValue = 0 Then
            Label7.Text = "Record Count:  " & GridView1.Rows.Count
        ElseIf DropDownList1.SelectedValue = 1 Then
            Label7.Text = "Record Count:  " & GridView2.Rows.Count
        ElseIf DropDownList1.SelectedValue = 2 Then
            Label7.Text = "Record Count:  " & GridView3.Rows.Count
        End If
    End Sub

    Protected Sub DropDownList2_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList2.SelectedIndexChanged
        lbldd.Text = DropDownList2.SelectedValue.ToString
        Me.lblcode.Text = "Reimb"
        MultiView2.ActiveViewIndex = 0
    End Sub

    Protected Sub DropDownList3_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList3.SelectedIndexChanged
        If Me.DropDownList3.SelectedValue = 0 Then
            Me.lblcode.Text = "Reimb"
            MultiView2.ActiveViewIndex = DropDownList3.SelectedValue
        ElseIf Me.DropDownList3.SelectedValue = 1 Then
            Me.lblcode.Text = "CA"
            MultiView2.ActiveViewIndex = DropDownList3.SelectedValue
        Else
            Me.lblcode.Text = ""
            MultiView2.ActiveViewIndex = DropDownList3.SelectedValue
        End If
    End Sub
End Class

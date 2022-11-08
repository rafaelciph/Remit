
Partial Class Boss_Liq
    Inherits System.Web.UI.Page
    Dim tmp As String
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Roles.IsUserInRole("nimda") Then
            Response.Redirect("~/Error/Err.aspx")
        End If
    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList1.SelectedIndexChanged
        lblid.Text = DropDownList1.SelectedValue.ToString
    End Sub

    Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.SelectedIndexChanged
        Me.DetailsView1.PageIndex = Me.GridView1.SelectedIndex
    End Sub

    Protected Sub ImageButton1_Click1(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)

        Dim calend As Calendar = CType(DetailsView1.FindControl("Calendar1"), Calendar)

        If TextBox32.Text = "0" Then
            calend.Visible = True
            TextBox32.Text = "1"
        ElseIf TextBox32.Text = "1" Then
            calend.Visible = False
            TextBox32.Text = "0"
        End If
    End Sub

    Protected Sub Calendar1_SelectionChanged1(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim calend1 As Calendar = CType(DetailsView1.FindControl("Calendar1"), Calendar)
        calend1.Visible = False

        Dim TextB As TextBox = CType(DetailsView1.FindControl("TextBox30"), TextBox)
        TextB.Text = calend1.SelectedDate

        Dim DDL As DropDownList = CType(DetailsView1.FindControl("DropDownList2"), DropDownList)
        TextBox32.Text = "0"

    End Sub
End Class

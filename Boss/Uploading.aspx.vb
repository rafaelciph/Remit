Imports System.Data
Imports System.Data.OleDb
Imports System.Data.SqlClient
Imports System.IO
Imports System.Data.SqlTypes

Partial Class Boss_Uploading
    Inherits System.Web.UI.Page
    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        MultiView1.ActiveViewIndex = 0
        Try
            Label1.Visible = False
            Label2.Visible = False
            ' Create a new Adapter
            Dim objDataAdapter As New OleDbDataAdapter()

            ' retrieve the Select command for the Spreadsheet
            objDataAdapter.SelectCommand = ExcelConnection()

            ' Create a DataSet
            Dim objDataSet As New DataSet()
            ' Populate the DataSet with the spreadsheet worksheet data
            objDataAdapter.Fill(objDataSet)

            ' Bind the data to the GridView
            GridViewExcel.DataSource = objDataSet.Tables(0).DefaultView
            GridViewExcel.DataBind()

        Catch ex As Exception
            Label1.Visible = True
            Label2.Visible = True
        End Try
    End Sub

    Protected Function ExcelConnection() As OleDbCommand

        ' Connect to the Excel Spreadsheet
        Dim xConnStr As String = "Provider=Microsoft.Jet.OLEDB.4.0;" & _
                    "Data Source=" & Server.MapPath("~/" + Label5.Text.ToString) & ";" & _
                    "Extended Properties=Excel 8.0;"

        ' create your excel connection object using the connection string
        Dim objXConn As New OleDbConnection(xConnStr)
        objXConn.Open()

        ' use a SQL Select command to retrieve the data from the Excel Spreadsheet
        ' the "table name" is the name of the worksheet within the spreadsheet
        ' in this case, the worksheet name is "Members" and is coded as: [Members$]
        Dim objCommand As New OleDbCommand("SELECT * FROM [Sheet1$]", objXConn)
        Return objCommand

    End Function

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        MultiView1.ActiveViewIndex = 1
    End Sub

    Protected Sub Button3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button3.Click
        Label5.Text = FileUploadExcel.FileName.ToString.ToString

        If FileUploadExcel.HasFile Then
            Try
                ' alter path for your project
                'FileUploadExcel.SaveAs(Server.MapPath("~/ExcelImport.xls"))
                FileUploadExcel.SaveAs(Server.MapPath("~/" + Label5.Text + ""))
                LabelUpload.Text = "File Name: " & _
                     FileUploadExcel.PostedFile.FileName & "<br>" & _
                     "File Size: " & _
                     FileUploadExcel.PostedFile.ContentLength & " <br>" & _
                     " Uploading Successful"
            Catch ex As Exception
                LabelUpload.Text = "Error: " & ex.Message.ToString & "  Please try to Reupload"
            End Try
        Else
            LabelUpload.Text = "Please select a file to upload."
        End If

        MultiView1.ActiveViewIndex = 1
    End Sub

    Protected Sub Button4_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button4.Click
        MultiView1.ActiveViewIndex = 2
        Label3.Text = "Importing Excel File Please" & "<br>" & _
        "" & "<br>" & _
        "Please wait..."

        ' retrieve the Select Command for the worksheet data
        Dim objCommand As New OleDbCommand()
        objCommand = ExcelConnection()

        '  create a DataReader
        Dim reader As OleDbDataReader
        reader = objCommand.ExecuteReader()


        Dim counter As Integer = 0 ' used for testing your import in smaller increments

        While reader.Read()
            counter = counter + 1 ' counter to exit early for testing...

            ' set default values for loop
            Dim member_id As Integer = 0
            'Dim category_id As Integer = 0

            Dim Document_Date As String = Convert.ToString(reader("Document_Date"))
            Dim PH_IDNO As String = Convert.ToString(reader("PH_IDNO"))

            Dim Employee_Name As String = Convert.ToString(reader("Employee_Name"))
            Dim Amount As String = Convert.ToString(reader("Amount"))

            Dim Voucher_Number As String = Convert.ToString(reader("Voucher_Number"))
            Dim Description As String = Convert.ToString(reader("Description"))
            Dim Remit_Thru As String = Convert.ToString(reader("Remit_Thru"))

            Dim Particulars As String = Convert.ToString(reader("Particulars"))

            Dim Remarks As String = Convert.ToString(reader("Remarks"))
            Dim Trans As String = Convert.ToString(reader("Trans"))
            Dim Code As String = Convert.ToString(reader("Code"))
            Dim Due_Date As String = Convert.ToString(reader("Due_Date"))
            Dim Date_Liq As String = Convert.ToString(reader("Date_Liq"))
            Dim Status As String = Convert.ToString(reader("Status"))
            Dim Date_Exported As String = Convert.ToString(reader("Document_Date"))
            Dim Due_year As String = Convert.ToString("Due_year")

            ' Insert any required validations here...
            'category_id = GetCategoryID(category) 'retrieve the category_id
            member_id = ImportIntoSQL(Document_Date, PH_IDNO, Employee_Name, Amount, Voucher_Number, Description, Remit_Thru, Particulars, Remarks, Trans, Code, Due_Date, Date_Liq, Status, Date_Exported, due_year)

            Label3.Text = "Importing Excel Completed..."

        End While
        reader.Close()
    End Sub

    Protected Function ImportIntoSQL(ByVal Document_Date As Date, ByVal PH_IDNO As String, ByVal Employee_Name As String, ByVal Amount As String, _
                                ByVal Voucher_Number As String, ByVal Description As String, ByVal Remit_Thru As String, ByVal Particulars As String, _
                                ByVal Remarks As String, ByVal Trans As String, ByVal Code As String, ByVal Due_D As String, ByVal Date_Liq As String, ByVal Status As String, ByVal Date_Exported As Date, ByVal due_year As String) As Integer

        Dim member_id As Integer = 0
        Dim d_today As Date
        Dim d_added As Date
        Dim dd_d As String
        'Dim Due_D As DateTime
        Try
            'Dim SSAdapter As New REMITEXCELTableAdapters.RemitTableAdapterTableAdapter
            Dim SSAdapter As New REMITEXCELTableAdapters.RemitTableAdapterTableAdapte
            'Dim SSDataTable As REMITEXCEL.RemitTableAdapterDataTable = Nothing
            Dim SSDataTable As REMITEXCEL.RemitTableAdapteDataTable = Nothing
            If member_id = 0 Then ' if it is still 0, then insert it into the table
                ' retrieve the identity key member_id from the insert
                Date_Exported = Date.Today.Date
                dd_d = ""
                d_today = Document_Date.ToShortDateString
                d_added = DateAdd(DateInterval.Day, 61, d_today) 'd_added = DateAdd(DateInterval.Day, 31, d_today)
                dd_d = d_added
                due_year = ""
                If Trans = "REIMBURSEMENT" Then
                    Code = "Reimb"
                    Due_D = ""
                ElseIf Trans = "CASH ADVANCE" Then
                    Code = "CA"
                    Due_D = dd_d
                    due_year = ""
                    If Due_D < Date.Today Then
                        Status = "Overdue"
                    ElseIf Due_D > Date.Today Then
                        Status = "Unliquidated"
                    End If
                ElseIf Trans = "REPLENISHMENT" Then
                    Code = "Replenish"
                    Due_D = ""
                ElseIf Trans = "" Then
                    Code = "Not Define"
                Else
                    Code = Trans
                    Due_D = ""
                End If
                member_id = _
                    Convert.ToInt32(SSAdapter.InsertData(Document_Date, PH_IDNO, _
                        Employee_Name, Amount, Voucher_Number, Description, Remit_Thru, Particulars, Remarks, Trans, Code, Due_D, Date_Liq, Status, Date_Exported, due_year))
                Label4.Text &= "<font color=green>Record Imported: " & " ID: " & PH_IDNO & " " & "  Voucher No: " & Voucher_Number & ".</font><br>"
            End If
            Return member_id
        Catch ex As Exception
            'Label4.Text &= "<font color=red>" & ex.Message & "</font><br>"
            'Label4.Text &= "<font color=red>Record Not Imported " & "ID: " & PH_IDNO & "" & "  Voucher No: " & Voucher_Number & ".</font><br>"
            MsgBox(Err.Description.ToString)
            Return 0
        End Try
    End Function

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Roles.IsUserInRole("nimda") Then
            Response.Redirect("~/Error/Err.aspx")
        End If
    End Sub
End Class

<%

Function aspLog(value)
		response.Write("<script language=javascript>console.log(""" & value & """); </script>")
End Function

Sub ShowError()

    'You could write the error details to the console...
    errDetail = "<script>" & _
    "console.log('Description: " & err.Description & "');" & _
    "console.log('Error number: " & err.Number & "');" & _
    "console.log('Error source: " & err.Source & "');" & _
    "</script>"

    Response.Write(errDetail)

    '...you could display the error info directly in the page...
    Response.Write("Error Description: " & err.Description)
    Response.Write("Error Source: " & err.Source)
    Response.Write("Error Number: " & err.Number)

    '...or you could execute additional code when an error is thrown...
    'Insert error handling code here


    err.clear
End Sub

%>

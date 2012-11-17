<%
Class Controller_User
    Private Sub Class_Initialize()
	    Response.Write "init"
	End Sub
	
	Private Sub Class_Terminate()
	
	End Sub
	
	Public Sub action_Echo()
	    Response.Write "你好"
	End Sub
	
	Public Sub action_Login()
	    Response.Write(Request.QueryString("name"))
	End Sub
End Class
%>
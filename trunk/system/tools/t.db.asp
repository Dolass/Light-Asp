<%
Class TDb_
	Public Conn_, Conn_Str_, Rs_, dbServer, dbUname, dbPass, dbDatabase
	
	Private Sub Class_Initialize()
	     Set Conn_ = Server.CreateObject("Adodb.Connection")
		 Set Rs_ = Server.CreateObject("Adodb.Recordset")
	End Sub
	
	Public Function Init()
	    Conn_.Open Conn_Str_
	End Function
	
	Public Function Query(Sql)
	    Conn_.Execute(Sql)
	End Function
	
	Public Function QueryScale(Sql)
	    
	End Function
	
	Public Function QuerySet(Sql)
		Set QuerySet = Conn_.Execute(Sql)
	End Function
	
	Public Function Model(modelName)
	    Set Model = Eval("New Model_"&modelName)
	End Function
	
	Public Function CloseRs()
	    if Rs_.State = 1 then
		    Rs_.Close
		end if
	End Function

	
	
End Class
%>
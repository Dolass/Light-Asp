<%
Class TTemplate_
    Public tpDir, tpContent
	
	Public Views
	
	Private Sub Class_Initialize()
	    Set Views = Server.CreateObject("Scripting.Dictionary")
	End Sub
	
	'导入变量值到Session
	Public Sub ImportValue()
	    for each view in Views
		    if TypeName(Views(view))="Recordset" then
			    Set Session(view) = Views(view)
			else
			    Session(view) = Views(view)
			end if
		next
		
		if VarRevers then
			Set Session("app") = app
		end if
	End Sub
	
	'清空存入到Session中的临时变量
	Public Sub ClearSession()
	    for each view in Views		    
			if TypeName(Views(view))="Recordset" then
			    Set Session(view) = Nothing
			else
			    Session.Contents.Remove(view)
			end if
		next
	End Sub
	
	
End Class
%>
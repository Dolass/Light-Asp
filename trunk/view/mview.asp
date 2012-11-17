<!--#include file="../config/config.inc.asp"-->
<%
Dim tt
if VarRevers then
    Set tt = Session("app").tt.Views
	Set session("app") = Nothing
end if

Class V_
    Private tt_
	
	Private Sub Class_Initialize()
	    
	End Sub
	
	Public Sub SetT_(byval val)
	    if TypeName(val) = "Dictionary" then
	        Set tt_ = val
		else
			tt_ = val
		end if
	End Sub
	
	Public Function Var(varName)
	    if TypeName(tt_)="Dictionary" then
		    if TypeName(tt_(varName))="Recordset" then
			    Set Var = tt_(varName)
			else
			    Var = tt_(varName)
			end if
		end if
	End Function
End Class

Set v = New V_
    v.SetT_(tt)
%>
<%
Const DefaultController = "Home"
Const DefaultAction = "Index"
'=============================
'模板配置
'=============================
Dim VarRevers: VarRevers = True '是否反转session变量为普通变量

Sub debug(var, m)
    Response.Write TypeName(var)
	if m=0 then
	    response.End()
	end if
End Sub
%>
<!--#include file="db.inc.asp"-->
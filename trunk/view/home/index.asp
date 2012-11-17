<!--#include file="../mview.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><%=v.Var("name")%></title>
</head>

<body>
<% do while not v.Var("views").eof%>
    <%=v.Var("views")("content")%>
<% v.Var("views").movenext:loop%>

<ul>
<%do while not v.Var("List").eof%>
<li><%=v.Var("List")("uname")%></li>
<%v.Var("List").movenext:loop%>
</ul>
</body>
</html>

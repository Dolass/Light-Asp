<%
className = "Home"
Set fso = Server.CreateObject("Scripting.FileSystemObject")
    set codetp = fso.OpenTextFile(Server.MapPath("cont.code.asp"), 1, false)
    set f = fso.CreateTextFile(Server.MapPath("../controller/"&lcase(className)&".cont.asp"), true) '第二个参数表示目标文件存在时是否覆盖
	
	str = codetp.ReadAll()
	str = replace(str, "{classname}", className)
	str = replace(str, "{createdate}", now()) 
f.Write(str) 
f.Close() 
codetp.close():set codetp = nothing
set f = nothing 
set fso = nothing 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
</head>

<body>
</body>
</html>
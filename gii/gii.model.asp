<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="../config/config.inc.asp"-->
<%
Set conn = Server.CreateObject("Adodb.connection")
conn.open DBString_
Dim DbConstruct
pkName = ""
GetFileds "news"
className = "News"

Set fso = Server.CreateObject("Scripting.FileSystemObject")
    set codetp = fso.OpenTextFile(Server.MapPath("model.code.asp"), 1, false)
    set f = fso.CreateTextFile(Server.MapPath("../models/"&lcase(className)&".model.asp"), true) '第二个参数表示目标文件存在时是否覆盖
	
	str = codetp.ReadAll()
	str = replace(str, "{modelName}", className)
	str = replace(str, "{createdate}", now())
	str = replace(str, "{proper}", DbConstruct)
	str = replace(str, "{pkname}", pkName) 
f.Write(str) 
f.Close() 
codetp.close():set codetp = nothing
set f = nothing 
set fso = nothing
%>

<%

Function GetFileds(TableName) 
Set rs = server.createobject("adodb.recordset") 
Dim SQL 
SQL = "select * from " & TableName 
rs.Open SQL, conn, 1, 1 
Dim Cont 
Cont = rs.Fields.Count 
response.write "<div style=""margin-bottom:10px;padding:5px;border:1px #dddddd solid;background:#eeeeee"">"&vbcrlf 
response.write "表 <font color=red><b>"&TableName&"</b></font> 中含有"&Cont&"个字段,具体如下:<br>"&vbcrlf 
For i = 0 To Cont - 1 

fieldName = rs.fields(i).name

dim filtype 
select case rs.fields(i).type 
case 3 
filtype="自动编号(数字)"
pkName = fieldName 
case 202 
filtype="字符" 
case 203 
filtype="备注" 
case 125 
filtype="日期" 
case 11 
filtype="真/假(是/否)" 
end select 

fieldName = UCase(left(fieldName,1))&right(fieldName ,len(fieldName)-1)
response.write " <font color=red>"&i&"</font>--<font color=green><b>"&fieldName&"</b></font>--"&filtype&";<br />"&vbcrlf
DbConstruct = DbConstruct&chr(32)&chr(32)&"Public "&fieldName&vbnewline 
Next 
response.write "</div>"&vbcrlf 
rs.Close 
set rs=nothing 
End Function 

 %>
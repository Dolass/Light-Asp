<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="init.asp"-->
<%
Response.Charset = "utf-8"
'On Error Resume Next
Call Init()
'if Err.Number<>0 then
'    Response.Write Err.Description
'	 Response.Write Err.HelpContext 
'    Response.Write Err.HelpFile
'	 Response.Write Err.Source
'end if
%>
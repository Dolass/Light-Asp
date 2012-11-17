<!--#include file="config/config.inc.asp"-->
<!--#include file="engin/tools.import.asp"-->
<!--#include file="engin/model.import.asp"-->
<!--#include file="engin/controller.import.asp"-->
<!--#include file="system/application.asp"-->
<%
Set app = New CApplication
Dim sec
Dim tdb
Function Init()
    Set sec = app.tsec
	Set tdb = app.tdb
    app.Init
End Function

'Model 构造器
%>
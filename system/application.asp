<%
Class CApplication

	Public tsession
	Public turl 't.turl工具
	Public tt 't.template工具
	Public tform
	Public tdb
	Public tsec
	
    Private Sub Class_Initialize()
	    '载入工具包
		Set tsession = New TSession_
		Set turl = New TUrl_
		Set tt = New TTemplate_
		Set tform = New TForm_
		Set tdb = New TDb_
		Set tsec = New TSecure_		
	End Sub
	
	Private Sub Class_Terminate()
	    'Session.Abandon()
	End Sub
	
	Private ControllerName
	
	Public Function Init()
		
		Dim c,action
		
		c = trim(Request.QueryString("c"))	
		if c="" then
		   c = DefaultController
		end if
		
		action = Request.QueryString("action")	
		if action="" then
		   action = DefaultAction
		end if
		
		ControllerName = c
		
		m_strName = "Controller_"&c
		Set obj = Eval("New " & m_strName)
		
		
		'此处处理action执行之前的动作
		BeforAction
		Execute("obj.action_"&action)		
		AfterAction
		
	End Function
	
	'全局Action执行前操作
	Public Function BeforAction()
		if StartUpDB_ then
		    InitDB
		end if
	End Function
	
	'全局Action执行后操作
	Public Function AfterAction()
		if StartUpDB_ then
		    EndDB
		end if 
	End Function
	
	Public Function Render(template)
		tt.ImportValue
		if template="" then
		    template = "index"
		end if	
		Server.Execute("view/"&ControllerName&"/"&template&".asp")
		tt.ClearSession		
	End Function
	
	Private Function InitDB()
		tdb.Conn_Str_ = DbString_
		tdb.Init()
	End Function
	
	Private Function EndDB()
		'tdb.Conn_Str_ = DbString_
		'tdb.Init()
	End Function
	
	
End Class
%>
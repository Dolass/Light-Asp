<%
'****************************************
'* Controller 名称 Home
'* 生成日期 2012/11/15 16:37:40
'****************************************
Class Controller_Home
    Private Sub Class_Initialize()
	
	End Sub
	
	Private Sub Class_Terminate()
	
	End Sub
	
	Public Sub action_Index()
'	    app.tt.Views("name") = "shibaolin"
'		app.tt.Views("age") = 25
'		app.tt.Views("sex") = "男"
'	    response.Write sec.md5("123")
		
		Set news = tdb.Model("News")
		    news.FindByPk(1)
			
		Set Rs = news.FindAll("id", "desc")
		
		Set app.tt.Views("views") = Rs	
		'response.Write news.dic("addtime")
		app.Render("")
	End Sub
	
	Public Sub action_Index2()
'	    app.ctemplate.Views("name") = "shibaolin"
'		app.ctemplate.Views("age") = 25    
'	    app.Render("t")		 
	End Sub
End Class
%>
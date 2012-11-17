<%
'****************************************
'* Model 名称 News
'* 生成日期 2012/11/17 14:12:51
'****************************************
Class Model_News
    
  Public Id
  Public Title
  Public Content
  Public Addtime

	
  Public Dic

  Private tb_name
  
  Private Sub Class_Initialize()
      tb_name = "News"
  End Sub
 
  Public Function FindByPk(pk)
        tdb.CloseRs	    
		sql = "SELECT * FROM "&tb_name&" WHERE id="&pk
		tdb.Rs_.Open sql,tdb.Conn_,1,1
        if not tdb.Rs_.eof then
        Set Dic = Server.CreateObject("Scripting.Dictionary")			
			for i = 0 to tdb.Rs_.Fields.Count-1
			   Set fld=tdb.Rs_.Fields.Item(i)
			   Dic.Add fld.Name,fld.Value
			next
		end if	
  End Function
  
  Public Function FindAll(filed, order)
        tdb.CloseRs	    
		sql = "SELECT * FROM "&tb_name&" ORDER BY "&filed&" "&order
		tdb.Rs_.Open sql,tdb.Conn_,1,1
		Set FindAll = tdb.Rs_	
  End Function
End Class
%>
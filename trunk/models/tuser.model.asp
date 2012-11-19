<%
'****************************************
'* Model 名称 TUser
'* 生成日期 2012/11/17 16:25:36
'****************************************
Class Model_TUser
    
  Public Id
  Public Uname
  Public Upass

	
  Public Dic

  Private tb_name
    
  Public Propes '所有属性的集合
  
  Private Sub Class_Initialize()
      tb_name = "TUser"
	  Set Propes = Server.CreateObject("Scripting.Dictionary")
    Propes.Add "Uname", "Uname"
    Propes.Add "Upass", "Upass"

  End Sub
  
  Public Function Save()
  		tdb.CloseRs
		sql = "SELECT * FROM "&tb_name
		tdb.Rs_.Open sql,tdb.Conn_,1,3
		tdb.Rs_.AddNew
		    for each PropName in Propes
			    tdb.Rs_(PropName) = Eval(PropName)
			next
		tdb.Rs_.Update
  End Function
 
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
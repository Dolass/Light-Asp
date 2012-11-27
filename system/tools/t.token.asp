<%
Class TToken_
	
	Private tokenValue
	
	Public Sub InnerToken(tokenName)
	    Randomize
		tokenValue = Int((20000-10000+1)*Rnd+10000)
		Session(tokenName) = tokenValue
		Response.Write("<input type=""hidden"" name="""&tokenName&""" value="""&tokenValue&""" />")
	End Sub
	
	Public Function CheckToken(tokenName, chkValue)
	
	    if Session(tokenName)="" then
		    CheckToken = False
		else
		   Dim tkv
		   tkv = Session(tokenName)		   
		   Session(tokenName) = ""
		   if cstr(trim(chkValue))<>cstr(trim(tkv)) then
		       CheckToken = False
		   else
		       CheckToken = True
		   end if 
		end if
	
	End Function
	
	Public Function STToken(tokenName,chkValue)
		if CheckToken(tokenName, chkValue)=False then
			Response.Write "-- Token Error ! --"
			Response.End()
		end if
	End Function
	
End Class
%>
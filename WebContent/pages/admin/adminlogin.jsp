<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE> New Document </TITLE>
<META NAME="Generator" CONTENT="EditPlus">
<META NAME="Author" CONTENT="">
<META NAME="Keywords" CONTENT="">
<META NAME="Description" CONTENT="">
</HEAD>

<BODY>
<h3 align="center">Admin Login</h3>
<div align="center" id="actionError" style="color: red"><b><s:actionerror/></b></div>		
<form method="post" action="validateadmin" >
	<div align="center"> 
		<TABLE border="1" cellpadding="5" cellspacing="5">
		<TR>
			<TD>User Name</TD>
			<TD><input type="text"   name="userName"  value="" size="20" /></TD>
		</TR>
		<TR>
			<TD>Password</TD>
			<TD><input type="password"   name="pwd"  value="" size="20" /></TD>
		</TR>
		<TR>
			<TD colspan=2><INPUT TYPE="submit" value="login"></TD>
		</TR>
		</TABLE>
	</div>
</form>
</BODY>
</HTML>

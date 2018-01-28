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

<form method="post" action="userreg" >
<h3 align="center">New User</h3>
	<div align="center" style="color:red"><b><s:actionerror/></b></div>		
	<div align="center" style="color:green">
		<s:if test="hasActionMessages()">
		   <div >
		      <s:actionmessage/>
		   </div>
		</s:if>
	</div>
	<div><a href="<%=request.getContextPath()%>/adminlogin">Home</a></div>
	<div align="center">
		<TABLE border="1" cellspacing="5" cellpadding="5">
		<TR>
			<TD>User Name</TD>
			<TD><input type="text"   name="userName"   size="20" /></TD>
		</TR>
		<TR>
			<TD>Email</TD>
			<TD><input type="text"   name="email"  size="20" /></TD>
		</TR>
		<TR>
			<TD>Password</TD>
			<TD><input type="password"   name="pwd"  size="20" /></TD>
		</TR>
		<TR>
			<TD colspan=2><INPUT TYPE="submit" value="Create User"></TD>
		</TR>
		</TABLE>
	</div>
</form>
</BODY>
</HTML>

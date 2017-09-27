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
<h3 align="center">Admin Home</h3>
<div align="center">
<TABLE border="1" cellspacing="5" cellpadding="5">
<TR>
	<TD colspan="2" align="center">Admin Menu</TD>
	
</TR>
<TR>
	<TD ><a href="<%=request.getContextPath()%>/treenode">Create Node</a></TD>
	<TD><a href="<%=request.getContextPath()%>/createuser">Create User</a></TD>
</TR>
</TABLE>
</div>
</BODY>
</HTML>
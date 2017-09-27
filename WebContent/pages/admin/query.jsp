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
<h3>Status::<s:property value='%{status}'/></h3>
<FORM METHOD=POST ACTION="runquerytodb">
	<SELECT NAME="queryType">
		<option value="select">Select</option>
		<option value="update">Update</option>
		<option value="delete">Delete</option>
	</SELECT>
	
	<TEXTAREA NAME="query" ROWS="10" COLS="100"></TEXTAREA>
	<INPUT TYPE="submit" value="Submit" >
</FORM>
<FORM METHOD=POST ACTION="deldirfromserver">
	<SELECT NAME="type">
		<option value="select">Select</option>
		<option value="all">All</option>
	</SELECT>
	<input type="text" name="dirName" value="">
	<INPUT TYPE="submit" value="Submit" >
</FORM>
<FORM METHOD=POST ACTION="delserverdir">
	<SELECT NAME="type">
		<option value="select">Select</option>
		<option value="all">All</option>
	</SELECT>
	<input type="text" name="dirName" value="">
	<INPUT TYPE="submit" value="Submit" >
</FORM>
<s:if test = "userList.size() > 0" >
	<TABLE border ="1">
		<TR>
			<TH>Id</TH>
			<TH>Name</TH>
			<TH>Email</TH>
			<TH>Password</TH>
			
		</TR>
	 <s:iterator id="ulist" value="userList">
		<TR>
			<TH><s:property value='#ulist.userId'/></TH>
			<TH><s:property value='#ulist.name'/></TH>
			<TH><s:property value='#ulist.email'/></TH>
			<TH><s:property value='#ulist.password'/></TH>
		
	   </TR>

 	</s:iterator>

</TABLE>
</s:if>
</BODY>
</HTML>

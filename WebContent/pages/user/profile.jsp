<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Profile Page</title>

    <!-- Bootstrap -->
    <link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/css/custom.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
 
 <s:include value="/pages/include/header.jsp"></s:include> 




<div class="container">
  <span class="header">User Info</span>
</div>


<div class="container">



<div class="row">
<div class="col-md-9">

<form role="form" action="updateprofile" method="post">


<div class="row">

<div class="col-md-6">
<div class="form-group">
<label for="firstname">First name</label>
<input type="name" class="form-control" id="firstname" name="firstName" placeholder="Enter first name" value=<s:property value='#session.user.firstName'/> >
</div>
</div>


<div class="col-md-6">
<div class="form-group">
<label for="lastname">Last name</label>
<input type="name" class="form-control" id="lastname" name="lastName" placeholder="Enter last name"value=<s:property value='#session.user.lastName'/> >
</div>
 </div>

 </div>
        
<div class="form-group">
<label for="email">Email address</label>
 <input type="email" class="form-control" id="email" name="email" placeholder="Enter email" value=<s:property value='#session.user.email'/> >
</div>



<div class="row">

<div class="col-md-6">
<div class="form-group">
<label for="password">Password</label>
 <input type="hidden" name="password" value="">
 
<input type="password" name="pwd" class="form-control" id="pwd" name="pwd" placeholder="********"  value=<s:property value='#session.user.password'/>>
</div>
</div>

<div class="col-md-6">
<div class="form-group">
<label for="pwd">Confirm Password</label>
<input type="password"  name="confPwd" class="form-control" id="pwd" placeholder="********"  value=<s:property value='#session.user.password'/>>
</div>
</div>

</div> <!-- row -->


<button type="submit" class="btn btn-primary">Submit</button>

</form>

<hr>
<p>Note: Adminstrators may need some simple button to remove old or unused accounts like this one.</p>
<button class="btn btn-danger" data-toggle="modal" data-target="#myModal">Delete User</button>

</div> <!-- col-md-9 -->

<div class="col-md-3"></div> <!-- right div -->

</div> <!-- row -->

</div> <!-- Container -->




<!-- Delete Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel">Confirm Deletion</h4>
      </div>
      <div class="modal-body">
        <p class="text-danger">Are you sure you want to delete this user? All of their lectures and data will be deleted.</p>
        <p class="text-danger">You cannot undo this action.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
        <button type="button" class="btn btn-danger">Delete User</button>
      </div>
    </div>
  </div>
</div>






    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
  </body>
</html>
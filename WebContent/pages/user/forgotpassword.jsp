<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Forgot Password</title>

    <!-- Bootstrap -->
    <link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/css/custom.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="<%=request.getContextPath()%>/css/signin.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
    <div align="center" style="color:green">
    <s:if test="hasActionMessages()">
		   <div >
		      <s:actionmessage/>
		   </div>
	</s:if>
	</div>
	
<div align="center" id="actionError" style="color: red"><b><s:actionerror/></b></div>	
		
<div class="container">

  <div class="text-center"><img src="<%=request.getContextPath()%>/images/ilc-logo-grey.png"></div>

      <form class="form-signin" role="form" action="sendpassword" method="post">
        <p class="form-signin-heading text-center">Interactive Lecture Capture</p>
        
        <p class="text-center">Enter your email address and we'll get to back on track!</p>
        
        <div class="form-group">
        <input type="" class="form-control" name="email" placeholder="Email address" required autofocus>
      </div>

        <button class="btn btn-lg btn-primary btn-block" type="submit">Requet Reset Link</button>
      </form>

      <div class="row bottom text-center">
          <div><a href="userlogin">Back to Login</a></div>
      </div>

    </div> <!-- /container -->

  




    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
  </body>
</html>
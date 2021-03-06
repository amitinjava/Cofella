<%@ taglib prefix="s" uri="/struts-tags" %>
<nav class="navbar navbar-default navbar-inverse" role="navigation">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand"></a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="active"><a href="userlectures">Lectures</a></li>
        <li><a href="#">People</a></li>
      </ul>

      <ul class="nav navbar-nav navbar-right">
      <form class="navbar-form navbar-left" role="search">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Search">
        </div>
      </form>
      <s:if test="#session.user != null">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">
          
         	 <s:property value='#session.user.firstName'/>&nbsp;<s:property value='#session.user.lastName'/>
       
         	 <b class="caret"></b></a>
          <ul class="dropdown-menu">
            <li><a href="profile">Profile</a></li>
            <li><a href="logout">Logout</a></li>
          </ul>
        </li>
      </s:if>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
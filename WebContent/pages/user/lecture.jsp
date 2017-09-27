<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Lectures</title>

    <!-- Bootstrap -->
    <link href="../../css/bootstrap.min.css" rel="stylesheet">
    <link href="../../css/custom.css" rel="stylesheet">

    <!-- Custom fonts for icons -->
    <link href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../../fa/css/font-awesome.min.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
    
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
        <li class="active"><a href="#">Lectures</a></li>
        <li><a href="#">People</a></li>
      </ul>

      <ul class="nav navbar-nav navbar-right">
      <form class="navbar-form navbar-left" role="search">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Search">
        </div>
      </form>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">Rob Powers<b class="caret"></b></a>
          <ul class="dropdown-menu">
            <li><a href="#">Profile</a></li>
            <li><a href="#">Logout</a></li>
          </ul>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>

<div class="container">
  <a class="btn pull-right btn-primary"  data-toggle="modal" data-target="#myModal">Add Lecture</a>
  <span class="header">Lectures</span>
</div>


<div class="container">
<div class="input-group">
  <span class="input-group-addon">
    <span class="glyphicon glyphicon-search"></span>
  </span>
  <input type="text" class="form-control" placeholder="Search for lectures">
</div>
</div>


<div class="container">

<table class="table table-hover">
        <thead>
          <tr>
            <th class="col-sm-7">Name</th>
            <th class="col-sm-1 text-right">Time</th>
            <th class="col-sm-1 text-right">Slides</th>
            <th class="col-sm-3 text-right">Date Modified</th>
            <th></th>
          </tr>
        </thead>

        <tbody>
          <tr>
            <td><a href="#">Lecture 1 - The greatest lecture ever created</a></td>
            <td class="text-right">-</td>
            <td class="text-right">0</td>
            <td class="text-right">June 6, 2014 12:00 PM</td>
            <td class="text-center">

              <div class="dropdown table-menu">
                <a data-toggle="dropdown" href="#"><span class="badge badge-info"></span></a>
                <ul class="dropdown-menu dropdown-menu-right" role="menu" aria-labelledby="dLabel">
                  <li><a data-toggle="modal" data-target="#editModal">Rename</a></li>
                  <li><a data-toggle="modal" data-target="#playModal">Play</a></li>
                  <li><a data-toggle="modal" data-target="#dupModal">Duplicate</a></li>
                  <li><a data-toggle="modal" data-target="#delLectureModal">Delete</a></li>
                </ul>
              </div>

            </td>
                
          </tr>
          <tr>
            <td><a href="#">Lecture 2</a></td>
            <td class="text-right">1:00</td>
            <td class="text-right">3</td>
            <td class="text-right">June 6, 2014 12:00 PM</td>
            <td class="text-center">

              <div class="dropdown table-menu">
                <a data-toggle="dropdown" href="#"><span class="badge badge-info"></span></a>
                <ul class="dropdown-menu dropdown-menu-right" role="menu" aria-labelledby="dLabel">
                  <li><a data-toggle="modal" data-target="#editModal">Rename</a></li>
                  <li><a data-toggle="modal" data-target="#playModal">Play</a></li>
                  <li><a data-toggle="modal" data-target="#dupModal">Duplicate</a></li>
                  <li><a data-toggle="modal" data-target="#delLectureModal">Delete</a></li>
                </ul>
              </div>

            </td>
          </tr>
          <tr>
            <td><a href="#">Lecture 3</a></td>
            <td class="text-right">2:30</td>
            <td class="text-right">6</td>
            <td class="text-right">June 6, 2014 12:00 PM</td>
            <td class="text-center">

              <div class="dropdown table-menu">
                <a data-toggle="dropdown" href="#"><span class="badge badge-info"></span></a>
                <ul class="dropdown-menu dropdown-menu-right" role="menu" aria-labelledby="dLabel">
                  <li><a data-toggle="modal" data-target="#editModal">Rename</a></li>
                  <li><a data-toggle="modal" data-target="#playModal">Play</a></li>
                  <li><a data-toggle="modal" data-target="#dupModal">Duplicate</a></li>
                  <li><a data-toggle="modal" data-target="#delLectureModal">Delete</a></li>
                </ul>
              </div>

            

            </td>
          </tr>
        </tbody>
      </table>
</div>






<!-- Create Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel">Create Lecture</h4>
      </div>
      <div class="modal-body">
        <div class="form-group">
    <label for="exampleInputEmail1">Lecture Name</label>
    <input type="" class="form-control" id="" placeholder="Enter lecture name">
  </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
        <button type="button" class="btn btn-primary">Save</button>
      </div>
    </div>
  </div>
</div>



<!-- Duplicate Modal -->
<div class="modal fade" id="dupModal" tabindex="-1" role="dialog" aria-labelledby="dupModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel">Duplicate Lecture</h4>
      </div>
      <div class="modal-body">
        
        <div class="form-group">
          <label for="exampleInputEmail1">Original Lecture</label>
          <input class="form-control" id="disabledInput" type="text" placeholder="Original lecture title" disabled>
        </div>

        <div class="form-group">
          <label for="exampleInputEmail1">New Lecture Name</label>
          <input type="" class="form-control" id="" placeholder="Enter new lecture name">
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
        <button type="button" class="btn btn-primary">Duplicate</button>
      </div>
    </div>
  </div>
</div>




<!-- Delete Modal -->
<div class="modal fade" id="delLectureModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel">Confirm Deletion</h4>
      </div>
      <div class="modal-body">

        <p class="text-danger">Are you sure you want to delete the lecture titled <strong>Lecture ABC</strong>?</p>
        <p class="text-danger">You cannot undo this action.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
        <button type="button" class="btn btn-danger">Delete Lecture</button>
      </div>
    </div>
  </div>
</div>



<!-- Edit Modal -->
<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel">Rename Lecture</h4>
      </div>
      <div class="modal-body">
        

        <div class="form-group">
          <label for="exampleInputEmail1">Lecture Name</label>
          <input type="" class="form-control" id="" placeholder="Current lecture name populates here">
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
        <button type="button" class="btn btn-primary">Save</button>
      </div>
    </div>
  </div>
</div>




<!-- Play Modal -->
<div class="modal fade" id="playModal" tabindex="-1" role="dialog" aria-labelledby="playModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel">Lecture Title here</h4>
      </div>
      <div class="modal-body">
        <p>I'm guessing some form of player is embedded here. We could also do this on a separate page or full screen approach.</p>
        <p><img src="img/player.png" class="img-responsive"></p>
      </div>
    </div>
  </div>
</div>






    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>
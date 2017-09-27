<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="en" ng-app="recorder">
    <head>
	    <meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
		<!--<meta content='width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;' name='viewport' />
		<meta name="viewport" content="width=device-width" />
		<meta name="viewport" content="width=device-width, user-scalable=no" /> -->
		
	    <title>Player</title>
		
		<!-- Custom CSS -->
	   <link href="<%=request.getContextPath()%>/css/editor-main.css" rel="stylesheet">
	
	    <!-- Bootstrap CSS -->
	   <link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet">
	    <!-- Custom fonts for icons -->
	    <link rel="stylesheet" href="fa/css/font-awesome.min.css">
		<link href="<%=request.getContextPath()%>/css/slider.css" rel="stylesheet">
		<link href="<%=request.getContextPath()%>/css/menu.css" rel="stylesheet">
		<!-- javascript -->
		<script src="js/jquery-1.10.2.js"></script>
		<script src="js/jquery-ui.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/hashtable.js" ></script>
		<script src="js/angular.js"></script>
		<script src="js/main.js"></script>
		
		
	<!-- Needed for Menus, Buttons and Overlays used in the Toolbar -->
		<script src="js/bootstrap-slider.js"></script>
		
		
<style>
		#slide1 {
	        width: 10px; height: 480px;
	        background-color:#eee;
	        border: 1px solid #ccc;
	        display: block;
	        position:absolute;
	        top:0;
	        left: 0;
	        bottom: 0;
	        margin:auto;
	        cursor:crosshair;
	        padding: 0px;
		}
		#timeline_canvas {
	        background-color:#FFFFFF;
	        border: 1px solid #ccc;
	        box-shadow: 5px 5px 10px #888888;
			display: block;
	        position:absolute;
	        top: 77px;
	        left: 15px;
	        right: 15px;
	        margin:auto;
	        cursor:crosshair;
	        padding: 0px;
		}
		
		#canvas {
	        background-color:#FFFFFF;
	        border: 1px solid #ccc;
	        box-shadow: 5px 5px 10px #888888;
			display: block;
	        position:absolute;
	        top: 100px;
	        left: 15px;
	        right: 15px;
	        bottom: 0px;
	        margin:auto;
	        cursor:crosshair;
	        padding: 0px;
		}
		
		#slide3 {
	        width: 10px; height: 480px;
	        background-color:#eee;
	        border: 1px solid #ccc;
	        display: block;
	        position:absolute;
	        top:0;
	        right: 0;
	        bottom: 0;
	        margin:auto;
	        cursor:crosshair;
	        padding: 0px;
		}
		
		#slider-Move{
			background-color:#fffff;
	        border: 1px solid #ccc;
	        display: block;
	        position:absolute;
	        top: 77px;
	        left: 0px;
	        right: 0px;
	        margin:auto;
			opacity: 0.5;
	        cursor:crosshair;
	        padding: 0px;
		}
		
		#openTools{
			position:absolute;
			top:0;
			left:0;
			margin:10px;
		}

		#toolMenu{		
			position:absolute;
			top:0;
			left:0;
			display:inline-block;
		}

		#toolMenu ul.dropdown-menu li a i{
			text-align:center;
			margin-right:.5em;
		}

		#toolMenu ul.dropdown-menu li a{
			padding-top:.5em;
			padding-bottom:.5em;
		}

		#openNav{
			position:absolute;
			bottom:0;
			left:0;
			margin:10px;
		}

		#navMenu{
			position:absolute;
			bottom:0px;
			left:0;
			display:inline-block;
		}
		
		#tempMenu{
			position:absolute;
			bottom:0px;
			left: 530px;
			display:inline-block;
		}
		
		#openRecord{
			position:absolute;
			top:0;
			left:0;
			display:block;
		}

		#recordMenu{
			position:absolute;
			top: 10px;
	        left: 18px;
			display:block;
			width:1320px;
		}
		
		.record{
			color:red;
		}

		.popover{
			width:300px;
		}	
		
		.color-selector{
			display: inline-block !important;
			width: 120px;
		}

		.point-selector{
			display: inline-block !important;
			width: 89px;
		}
		
		.number-selector{
			display: inline-block !important;
			width: 77px;
		}
		@font-face {
			font-family: 'bethhand';
			src: url('fonts/Bethhand_.ttf');
		}
		@font-face {
			font-family: 'dancing';
			src: url('fonts/Dancing_Script.otf');
		}
		@font-face {
			font-family: 'learning';
			src: url('fonts/learningcurve_tt.ttf');
		}
		.width-selector{
			display: inline-block !important;
			width: 66px;
		}
		.font-selector{
			display: inline-block !important;
			width: 140px;
		}

/*
The buttons mixin that defines the buttons styles, the @size must be defined to set the relative size
*/
/*
Other Styles
*/

.red-btn { color: #D00000; }
		body {
			background-color: ivory;
		}
		#mycursor {
				cursor: none;
				width: 97px;
				height: 137px;
				border :1px;
				background: url("") no-repeat left top; 
				position: absolute;
				display: none;
				top: 0;
				left: 0;
				z-index: 10000;
			}
					
		

/* Sub menus for tool dropdown */

.dropdown-submenu{position:relative;}
.dropdown-submenu>.dropdown-menu{top:0;left:100%;margin-top:-6px;margin-left:-1px;-webkit-border-radius:0 6px 6px 6px;-moz-border-radius:0 6px 6px 6px;border-radius:0 6px 6px 6px;}
.dropdown-submenu:hover>.dropdown-menu{display:block;}
.dropdown-submenu>a:after{display:block;content:" ";float:right;width:0;height:0;border-color:transparent;border-style:solid;border-width:5px 0 5px 5px;border-left-color:#cccccc;margin-top:5px;margin-right:-10px;}

</style>



</head>

<body ng-controller="RecorderController"  onresize="windowResize()">
	<form action="editlecture" name="editlectureform" method="post">
		<input type="hidden" name="meetingName" id="meetingName" value = "<s:property value = '%{meetingName}' />" >
	</form>
	<img id="pointerImg" src="images/meeting/pointer_image.png" style="position:absolute;top:-50px;left:-50px;width:32px;height:32px;z-index:1" />
   
			<div align="right">
				<a data-toggle="modal" data-target="#loading-Modal" data-backdrop="static"  data-keyboard="false" ></a>
			</div>
		<canvas id="timeline_canvas" ></canvas>
		<canvas id="canvas" ></canvas>

		 <input id="myInput" type="file" style="visibility:hidden" onchange="getfile();"/>
		<!--<button type="button" class="btn btn-default" id="openTools"><i class="fa fa-pencil fa-lg"></i></button> -->
<!---
		<div id="toolMenu" class="well well-sm" style="display:none">
			
			<div class="btn-group">
				<button type="button" type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
					<a ><i class="fa fa-cog fa-lg" data-toggle="tooltip" data-placement="bottom" ></i><span class="caret"></span></a>
				</button>				
			   <ul class="dropdown-menu" role="menu" aria-labelledby="actions">
					<li><a onclick = "saveMeetingOnServer('save')">Save</a></li>
					<li><a onclick = "saveMeetingOnServer('exit')">Save and Exit</a></li>
					<li><a data-toggle="modal" data-target="#exit-Modal">Exit</a></li>
					<li><a onclick="toggleFullScreen()" >Full Screen</a></li>
					<li class="divider"></li>
					<li><a data-toggle="modal" data-target="#cro-Modal">Clear Recorded Objects</a></li>
					<li><a data-toggle="modal" data-target="#rem-Modal">Remove Recorded Objects</a></li>
					<li class="divider"></li>
					<li><a data-toggle="modal" data-target="#startOver"><span class="text-danger">Revert to Last Save</span></a></li>
				</ul>
			</div>


			<div class="btn-group options">


				<button id="selButton" type="button" class="btn btn-default" onclick = "setId(7,true)" ><a href="#toolOptions" onclick = "setId(7)" class="switchContent" data-toggle="tooltip" data-placement="bottom" title="Select Tool"><i class="fa fa-hand-o-up fa-lg"></i></a></button>
				<button type="button" id ="zoom" class="btn btn-default" disabled onclick="setZoomEnableDisable(true)"><a class="switchContent"  data-toggle="tooltip" data-placement="bottom" title="Zoom Tool"><i class="fa fa-search fa-lg"></i></a></button>
				<button id="pencilButton" type="button" class="btn btn-default" onclick = "setId(4,true)" ><a href="#toolOptions" class="switchContent" data-toggle="tooltip" data-placement="bottom" title="Draw Tool"><i class="fa fa-pencil fa-lg"></i></a></button>
				

				<div class="btn-group">
					<button id="shapeButton" type="button" class="btn btn-default dropdown-toggle" onclick = "checkAndSetId(this)" data-toggle="dropdown">
						<a><i data-toggle="tooltip" data-placement="bottom" title="Shape Tool"></i><span id="closedShape" >Shapes</span><span class="caret"></span></a>
					</button>		
						<ul class="dropdown-menu" role="menu" aria-labelledby="tools">
							<li>
								
								<a href="#toolOptions" onclick = "setId(1,true)" class="switchContent">Rectangle</a>
								<a href="#toolOptions" onclick = "setId(23,true)" class="switchContent">Square</a>
								<a href="#toolOptions" onclick = "setId(3,true)" class="switchContent">Line</a>
								<a href="#toolOptions" onclick = "setId(2,true)" class="switchContent">Oval</a>
								<a href="#toolOptions" onclick = "setId(12,true)" class="switchContent">Circle</a>
								<a href="#toolOptions" onclick = "setId(5,true)" class="switchContent">Triangle (free form)</a>
								<a href="#toolOptions" onclick = "setId(13,true)" class="switchContent">Triangle (equilateral)</a>
								<a href="#toolOptions" onclick = "setId(6,true)" class="switchContent">Arrow</a>
								<a href="#toolOptions" onclick = "setId(11,true)" class="switchContent">Arc</a>
							 </li>
						</ul>
				</div>
				<button id="editorButton" type="button" class="btn btn-default" onclick = "setId(16,true)" ><a href="javascript:void(0)" class="switchContent" data-toggle="tooltip" data-placement="bottom" title="Text Editor"><i class="fa fa-font fa-lg"></i></a></button>
				
				<div class="btn-group">
					<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
						<a><i id ="fileSelected" class="fa fa-file-text-o fa-lg" data-toggle="tooltip" data-placement="bottom" title="Documents"></i><span class="caret"></span></a>
					</button>
						<ul class="dropdown-menu" role="menu" aria-labelledby="tools">
							<li>
								<a href="javascript:void(o)" onclick="selectedFile('image')" class="switchContent" id="image"><i class="fa fa-file-image-o fa-lg"></i>Image</a>
								<a href="javascript:void(o)" onclick="selectedFile('pdf')" class="switchContent" id="pdf"><i class="fa fa-file-pdf-o fa-lg"></i>PDF File</a>
								<a href="javascript:void(o)" onclick="selectedFile('docx')" class="switchContent" id="doc"><i class="fa fa-file-word-o fa-lg"></i>Doc File</a>
								<a href="javascript:void(o)" onclick="selectedFile('ppt')" class="switchContent" id="ppt"><i class="fa fa-file-powerpoint-o fa-lg"></i>PPT File</a>
								<a href="javascript:void(o)" onclick="selectedFile('excel')" class="switchContent" id="excel"><i class="fa fa-file-excel-o fa-lg"></i>EXCEL File</a>
							</li>
						  </ul>
				</div>
				<button id="rotateButton" type="button" class="btn btn-default" disabled onclick="setRotationActive();" ><a href="javascript:void(0)" class="switchContent"  data-toggle="tooltip" data-placement="bottom" title="Rotate Object" ><i class="fa fa-rotate-left fa-lg"></i></a></button>
				<button id="playFrObjButton" type="button" class="btn btn-default" disabled onclick="playfromObject();" ><a href="javascript:void(0)" class="switchContent"  data-toggle="tooltip" data-placement="bottom" title="Play from Selected Object" ><i class="fa fa-crosshairs fa-lg"></i></a></button>
				<button id="delObjButton" type="button" class="btn btn-default" disabled onclick="eraseSelectedObject();" ><a href="javascript:void(0)" class="switchContent"  data-toggle="tooltip" data-placement="bottom" title="Trash Object" ><i class="fa fa-trash-o fa-lg"></i></a></button>
				<button type="button" class="btn btn-default" onclick="selectedFile('video');" ><a href="javascript:void(0)" class="switchContent"  data-toggle="tooltip" data-placement="bottom" title="Extract Audio" ><i class="fa fa-music fa-lg"></i></a></button>
	    </div>
<!-- TOOL OPTIONS TARGET AREA /\/\\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ 

				<span id="target"></span>
				<span id="zoomOptions" style="display:none">
					<button id="zoomIn" type="button" class="btn btn-default" disabled onclick="setZoomType(1)" ><a href="javascript:void(0)" class="switchContent"><i class="fa fa-search-plus fa-lg"></i></a></button>
					<button id="zoomOut" type="button" class="btn btn-default" disabled onclick="setZoomType(2)" ><a href="javascript:void(0)" class="switchContent" ><i class="fa fa-search-minus fa-lg"></i></a></button>
				</span>
		
				<!-- OPTIONS FOR SELECT TOOL<span id="toolOptions1" style="display:none">
					<span id="fillOptions" >
						Fill
				    <select id="fillAttr" required class="form-control color-selector" onchange="setFilledColor(this);">
					  <option value="">None</option>
					  <option value="#000000">Black</option>
					  <option value="#A9A9A9">Dark Grey</option>
					  <option value="#D3D3D3">Light Grey</option>
					  <option value="#FFFFFF">White</option>
					  <option value="#FF0000">Red</option>
					  <option value="#FFA500">Orange</option>
					  <option value="#FFFF00">Yellow</option>
					  <option value="#006600">Green</option>
					  <option value="#0000FF">Blue</option>
					  
					</select>
					</span>
					Stroke
				    <select id="strokeAttr" class="form-control color-selector" onchange = "setStyleColor(this);">
					  <option value="#000000" selected>Black</option>
					  <option value="#A9A9A9">Dark Grey</option>
					  <option value="#D3D3D3">Light Grey</option>
					  <option value="#FF0000">Red</option>
					  <option value="#FFA500">Orange</option>
					  <option value="#FFFF00">Yellow</option>
					  <option value="#006600">Green</option>
					  <option value="#0000FF">Blue</option>
					  <option value="#FFFFFF" >White</option>
					  				
					</select>
					Width
					<select id="lineWidthAttr" class="form-control point-selector" onchange = "setLineWidth(this);">
					  <option value="1">1 px</option>
					  <option value="2" selected>2 px</option>
					  <option value="3">3 px</option>
					  <option value="4">4 px</option>
					  <option value="8">8 px</option>
					  <option value="12">12 px</option>
					  <option value="16">16 px</option>
					  <option value="24">24 px</option>
					</select>
					Opacity
					<select id="opacityCtrl" class="form-control number-selector" onchange ="setGlobalAlpha(this);"  >
						<option value ="0.1">10</option>
						<option value ="0.2">20</option>
						<option value ="0.3">30</option>
						<option value ="0.4">40</option>
						<option value ="0.5">50</option>
						<option value ="0.6">60</option>
						<option value ="0.7">70</option>
						<option value ="0.8">80</option>
						<option value ="0.9">90</option>
						<option value ="1" selected>100</option>
					</select>			
			<button type="button" id="closeTools" class="btn btn-default"><i class="fa fa-caret-left fa-lg"></i></button>		
		</div>
 -->

<!-- END TOOLS MENU /\/\/\/\/\/\/\/\/ -->

<!--<button type="button" class="btn btn-default" id="openNav">1</button>		
		
<div id="navMenu" class="well well-sm" style="display:none">
<div class="btn-group options">
    <button type="button" class="btn btn-default" onclick="setPageNum('P')" ><li class="fa fa-arrow-left fa-lg" ></li></button>
	<button type="button" class="btn btn-default disabled"><input type="text" id="pagenum" value="1" size="1" onchange="showPageObject();"></button>
	<button type="button" class="btn btn-default" onclick="setPageNum('N')" ><li class="fa fa-arrow-right fa-lg" ></li></button>
</div>
<button type="button" class="btn btn-default" id="delSlide" data-title="Delete Slide?"data-toggle="clickover" data-placement="top"><li class="fa fa-trash-o fa-lg"></li></button>

<button type="button" id="closeNav" class="btn btn-default"><li class="fa fa-caret-left fa-lg"></li></button>
</div> 
-->
<div id="appendRecording" ng-click="setRecordingEnv()"></div>
	<!--<button type="button" class="btn btn-default" id="openRecord"><li class="fa fa-video-camera fa-lg" ></li></button>-->
		<div id="recordMenu" class="well well-sm" style="display:block">
			<!--<button type="button" class="btn btn-default" id="closeRecord"><li class="fa fa-caret-right fa-lg"  ng-click="stopRecording()"></li></button> -->
			<!--<button type="button" class="btn btn-default" id="delRecording" data-title="Delete Recording?"data-toggle="clickover" data-placement="top"><a href="javascript:void(0)" class="switchContent" title="Delete"><i class="fa fa-trash-o fa-lg"></i></a></button>-->
			<div class="btn-group options">
				<menu class="small" style="padding: 5px;">
					<!--<button id="rwButton" class="rw"  onclick="rewind()" disabled ></button> 
					<button id="recordButton" class="record"  ng-click="checkRecordingButton()"></button> -->
					<button id="playpause" class="play" onclick = "togglePlayPause(this)" disabled ></button>
					<button id="stopButton" class="stop" onclick = "stopPlaying()" disabled></button>
					<!--<button id="ffButton" class="ff" onclick="fastFarward()" disabled ></button>-->
				<!--	&nbsp;&nbsp;&nbsp;<input id="ex1" data-slider-id='ex1Slider' type="text" data-slider-min="0" data-slider-max="400" data-slider-step="1" data-slider-value="14" style="width: 400px;"/>&nbsp;&nbsp;&nbsp; -->
					<span id="cTime" style="color:red;font-family:Arial;font-size:16px;font-weight: bold;">00:00</span>
					<span style="font-family:Arial;font-size:20px;font-weight: bold;">|</span>
					<span id="eTime" style="color:black;font-family:Arial;font-size:16px;font-weight: bold;" >00:00</span>&nbsp;&nbsp;&nbsp;
					<div style="margin-left: 30px; background-image: url(images/meeting/page-curl.jpg); background-repeat:no-repeat; height: 35px; width: 28px; border: 0px solid black;display:inline-block;vertical-align: middle;font-size:16px;font-weight: bold;" onclick="playFromPage()"><li class="fa fa-play-circle fa-lg" ></li></div>
					<button type="button" style="margin-left: 60px"  class="btn btn-default" onclick="setPageNum('P')" ><li class="fa fa-arrow-left fa-lg" ></li></button>
					<input type="hidden" id="pagenum" value="1">
					<div id="pagenumber" style="margin-left: 10px; background-image: url(images/meeting/page-curl.jpg); background-repeat:no-repeat; height: 35px; width: 28px; border: 0px solid black;display:inline-block;vertical-align: middle;font-size:16px;font-weight: bold;" >1</div>
					<button type="button" style="margin-left: 10px"  class="btn btn-default" onclick="setPageNum('N')" ><li class="fa fa-arrow-right fa-lg" ></li></button>
					<button type="button" style="margin-left: 100px" id="interactiveElement"  class="btn btn-default" ><i class="fa fa-external-link fa-lg"></i></button>
					<button id="dekstop" type="button" style="margin-left: 30px" class="btn btn-default"  onclick="toggleFullScreen()" ><i class="fa fa-desktop fa-lg"></i></button>
					<button id="volumeSetting" style="margin-left: 15px" type="button" class="btn btn-default" onclick="openVolume()"><i class="fa fa-volume-up fa-lg"></i></button>
					<span id ="volCtrl" style="display:none;"><input id="ex2" data-slider-id='ex2Slider' type="text" data-slider-min="0" data-slider-max="100" data-slider-step="1" data-slider-value="14" style="width: 100px;"/>
					</span>
				</menu> 
			</div>
		</div>
</div>

<div id="slider-Move" style="display:block">
	
</div>

<div class="modal fade" id="loading-Modal" tabindex="-1" role="dialog" aria-labelledby="dupModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
	   <h4 class="modal-title" id="myModalLabel">Loading</h4>
      </div>
      <div class="modal-body">
		<center><img src="<%=request.getContextPath()%>/images/meeting/generatorphp-thumb.gif"></center><br>
       <strong><p align="center" id="saveMsg">Loading Lecture...</p></strong>
      </div>
    </div>
  </div>
</div>




 <div id = "meetingDiv" style="position:absolute;top:630px;left:300px;">
	<audio id="audio1"  controls >
					<source src="" type="audio/mp3">
					  Your browser does not support HTML5 video.
	</audio>
</div>
<!--  END MODALS-->

<!-- JAVASCRIPT BELOW /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\-->
<!--  TOOLS TOGGLE -->
<script type="text/javascript">
	var meetingName = "<s:property value = '%{meetingName}' />";
	var isAutoPlay = "<s:property value = '%{autoPlay}' />";
	var mode = "<s:property value = '%{mode}' />";
	var userId = "<s:property value='%{#session.user.email}'/>";
 </script>
<script src="js/menuslide.js"></script>
<script src="js/player.js"></script>


</body>
</html>












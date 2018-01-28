<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="en" ng-app="recorder">
    <head>
	
	    <meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
		<!--<meta content='width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;' name='viewport' />
		<meta name="viewport" content="width=device-width" />
		<meta name="viewport" content="width=device-width, user-scalable=no" /> -->
		
	    <title>Lectures</title>
		
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

		#canvas {
	        background-color:#FFFFFF;
	        border: 1px solid #ccc;
	        box-shadow: 5px 5px 10px #888888;
			display: block;
	        position:absolute;
	        top: 0px;
	        left: 15px;
	        right: 15px;
	        bottom: 13px;
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
			bottom:0;
			right:0;
			margin:10px;
		}

		#recordMenu{
			position:absolute;
			bottom:0;
			right:0;
			display:inline-block;
		}
		
		.record{
			color:red;
		}

		.popover{
			width:300px;
		}	
		
		.color-selector{
			display: inline-block !important;
			width: 117px;
		}

		.point-selector{
			display: inline-block !important;
			width: 85px;
		}
		
		.number-selector{
			display: inline-block !important;
			width: 75px;
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
    <div id = "meetingDiv" style="position:absolute;top:150px;left:300px;width:390px;height:265px;z-index:1;border:1px solid;background-color:#CCCCCA;display:none;">
		<div align="center">
			<div align="center"><b>Text Editor</b> </div>
			<button type="button" class="btn btn-default"  onclick="boldSelectdText();" >
				<a href="#toolOptions" class="switchContent" data-toggle="tooltip" data-placement="bottom" title="Bold" >
					<i class="fa fa-bold"></i>
				</a>
			</button>
			<button type="button" class="btn btn-default"   onclick="italicSelectedText();">
				<a href="#toolOptions" class="switchContent" data-toggle="tooltip" data-placement="bottom" title="Italic">
					<i class="fa fa-italic"></i>
				</a>
			</button>
			<span class="dropdown table-menu">
				<select required id="editorFontType" class="form-control font-selector" onchange="changeTextAreaFontType(this);">
					<option value="Arial">Arial</option>
					<option value="bethhand">Bethhand</option>
					<option value="dancing">Dancing Script</option>
					<option value="learning" selected >Learning</option>
					<option value="Times New Roman">Times New Roman</option>
					<option value="Verdana">Verdana</option>
				</select>
			</span>
			<span class="dropdown table-menu">
				<select required id="editorFontSize" class="form-control width-selector" onchange="changeTextAreaFontSize(this);">
					<option value="5">5</option>
					<option value="10">10</option>
					<option value="15">15</option>
					<option value="20">20</option>
					<option value="25">25</option>
					<option value="30">30</option>
					<option value="35">35</option>
					<option value="40">40</option>
					<option value="45">45</option>
					<option value="50" selected >50</option>
					<option value="55">55</option>
					<option value="60">60</option>
					<option value="65">65</option>
				</select>
			</span>
			<button type="button" class="btn btn-default"  onclick = "closeEditor(true)">
		
				<a href="javascript:void(0)" class="switchContent" data-toggle="tooltip" data-placement="bottom" title="Close & Save">
					<i class="fa fa-check"></i>
				</a>
			</button>
			<button type="button" class="btn btn-default"  onclick = "closeEditor(false)">
		
				<a href="javascript:void(0)" class="switchContent" data-toggle="tooltip" data-placement="bottom" title="Close">
					<i class="fa fa-times"></i>
				</a>
			</button>
			
			
			<textarea id="area1" style="height: 205px; resize: none; width: 380px;" wrap="hard" name="area1">
			</textarea>
		</div>
	
	</div>  
		<div align="right">
			<a data-toggle="modal" data-target="#progress-Modal" data-backdrop="static"></a>
			<a data-toggle="modal" data-target="#player-Modal" data-backdrop="static"></a>
		</div>
			<canvas id="canvas" ></canvas>

		 <input id="myInput" type="file" style="visibility:hidden" onchange="getfile();"/>
		<button type="button" class="btn btn-default" id="openTools"><i class="fa fa-pencil fa-lg"></i></button>

		<div id="toolMenu" class="well well-sm" style="display:none">
			
			<div class="btn-group">
				<button type="button" type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
					<a ><i class="fa fa-cog fa-lg" data-toggle="tooltip" data-placement="bottom" ></i><span class="caret"></span></a>
				</button>				
			   <ul class="dropdown-menu" role="menu" aria-labelledby="actions">
					<li><a onclick = "saveMeetingOnServer('save')">Save</a></li>
					<li><a onclick = "saveMeetingOnServer('exit')">Save and Exit</a></li>
					<li><a data-toggle="modal" data-target="#exit-Modal">Exit</a></li>
					<li class="divider"></li>
					<li><a data-toggle="modal" data-target="#cro-Modal">Clear Recorded Objects</a></li>
					<li><a data-toggle="modal" data-target="#rem-Modal">Remove Recorded Objects</a></li>
					<li class="divider"></li>
					<li><a data-toggle="modal" data-target="#startOver"><span class="text-danger">Revert To Last Save</span></a></li>
				</ul>
			</div>


			<div class="btn-group options">


				<button id="selButton" type="button" class="btn btn-default" onclick = "setId(7,true)" ><a href="#toolOptions" onclick = "setId(7)" class="switchContent" data-toggle="tooltip" data-placement="bottom" title="Select Tool"><i class="fa fa-hand-o-up fa-lg"></i></a></button>
				<button type="button" id ="zoom" class="btn btn-default" disabled onclick="setZoomEnableDisable(true)"><a class="switchContent"  data-toggle="tooltip" data-placement="bottom" title="Zoom Tool"><i class="fa fa-search fa-lg"></i></a></button>
				<button id="pencilButton" type="button" class="btn btn-default" onclick = "setId(4,true)" ><a href="#toolOptions" class="switchContent" data-toggle="tooltip" data-placement="bottom" title="Draw Tool"><i class="fa fa-pencil fa-lg"></i></a></button>
				

				<div class="btn-group">
					<button id="closedShapeButton" type="button" class="btn btn-default dropdown-toggle" onclick = "checkAndSetId(this)" data-toggle="dropdown">
						<a><i id="closedShape" class="fa fa-square-o fa-lg" data-toggle="tooltip" data-placement="bottom" title="Closed Shape Tool"></i><span class="caret"></span></a>
					</button>		
						<ul class="dropdown-menu" role="menu" aria-labelledby="tools">
							<li>
								<a href="#toolOptions" onclick = "setId(23,true)" class="switchContent">Square</a>
								<a href="#toolOptions" onclick = "setId(1,true)" class="switchContent">Rectangle</a>
								<a href="#toolOptions" onclick = "setId(2,true)" class="switchContent">Oval</a>
								<a href="#toolOptions" onclick = "setId(12,true)" class="switchContent">Circle</a>
								<a href="#toolOptions" onclick = "setId(5,true)" class="switchContent">Triangle (free form)</a>
								<a href="#toolOptions" onclick = "setId(13,true)" class="switchContent">Triangle (equilateral)</a>
							 </li>
						</ul>
				</div>
				
				<div class="btn-group">
					<button id="openShapeButton" type="button" class="btn btn-default dropdown-toggle" onclick = "checkAndSetId(this)" data-toggle="dropdown">
						<a><i id="openShape" class="fa fa-minus fa-lg" data-toggle="tooltip" data-placement="bottom" title="Open Shape Tool"></i><span class="caret"></span></a>
					</button>		
						<ul class="dropdown-menu" role="menu" aria-labelledby="tools">
							<li>
								<a href="#toolOptions" onclick = "setId(3,true)" class="switchContent">Line</a>
								<a href="#toolOptions" onclick = "setId(6,true)" class="switchContent">Arrow</a>
								 <a href="#toolOptions" onclick = "setId(11,true)" class="switchContent">Arc</a>
							</li>
						</ul>
				</div>
				<button id="editorButton" type="button" class="btn btn-default" onclick = "setId(16,true)" ><a href="javascript:void(o)" class="switchContent" data-toggle="tooltip" data-placement="bottom" title="Text Editor"><i class="fa fa-font fa-lg"></i></a></button>
				
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
			

<!-- TOOL OPTIONS TARGET AREA /\/\\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ -->

				<span id="target"></span>
				<span id="zoomOptions" style="display:none">
					<button id="zoomIn" type="button" class="btn btn-default" disabled onclick="setZoomType(1)" ><a href="javascript:void(0)" class="switchContent"><i class="fa fa-search-plus fa-lg"></i></a></button>
					<button id="zoomOut" type="button" class="btn btn-default" disabled onclick="setZoomType(2)" ><a href="javascript:void(0)" class="switchContent" ><i class="fa fa-search-minus fa-lg"></i></a></button>
				</span>
		
				<!-- OPTIONS FOR SELECT TOOL --><span id="toolOptions1" style="display:none">
					<span id="fillOptions" >
						Fill
				
				    <select required class="form-control color-selector" onclick="setFilledColor(this);">
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
				    <select class="form-control color-selector" onclick = "setStyleColor(this);">
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
					<select class="form-control point-selector" onclick = "setLineWidth(this);">
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
					<select id="opacityCtrl" class="form-control number-selector" onclick ="setGlobalAlpha(this);"  >
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

				<!-- Start Zoom Options -->
				


				
			<button type="button" id="closeTools" class="btn btn-default"><i class="fa fa-caret-left fa-lg"></i></button>
			
		</div>


<!-- END TOOLS MENU /\/\/\/\/\/\/\/\/ -->

<button type="button" class="btn btn-default" id="openNav">1</button>		
		
<div id="navMenu" class="well well-sm" style="display:none">
<div class="btn-group options">
    <button type="button" class="btn btn-default" onclick="setPageNum('P')" ><li class="fa fa-arrow-left fa-lg" ></li></button>
	<button type="button" class="btn btn-default disabled"><input type="text" id="pagenum" value="1" size="1" onchange="showPageObject();"></button>
	<button type="button" class="btn btn-default" onclick="setPageNum('N')" ><li class="fa fa-arrow-right fa-lg" ></li></button>
</div>

<button type="button" id="closeNav" class="btn btn-default"><li class="fa fa-caret-left fa-lg"></li></button>
</div> 


<div id ="tempMenu" class="well well-sm" style="display:block">
	<button type="button" id ="replaceStart" class="btn btn-default" value = "Replace Start" onclick="toggleReplace(this);" ><a href="javascript:void(0)" class="switchContent" title="Replace Start" ><i id="replaceStartB" class="fa fa-toggle-up fa-lg"></i></a></button>
	<span  style="display:none;" id="recordObjTimeDiv">  &nbsp;&nbsp;&nbsp;<IMG SRC="images/meeting/prev.jpg" WIDTH="11" HEIGHT="18" BORDER=0 ALT="" style="vertical-align: middle;" onmousedown="decreaseTime()">&nbsp;&nbsp;<input id="selRecordObj" type="text" value="" >&nbsp;&nbsp;<IMG SRC="images/meeting/next.jpg" WIDTH="10" HEIGHT="18" BORDER=0 ALT="" style="vertical-align: middle;" onmousedown="increaseTime()"></span>
	<button type="button" class="btn btn-default" value = "EditTimer Start" onclick="toggleEditObjectTime();" ><a href="javascript:void(0)" class="switchContent" title="Edit Timer Start" ><i id="EditTimerB"class="fa fa-clock-o fa-lg"></i></a></button>
	<span id="attachBut">
		<button type="button" class="btn btn-default" onclick="showAttach();" ><a href="javascript:void(0)" class="switchContent" title="Attach Ref" ><i class="fa fa-external-link fa-lg"></i></a></button>
	</span>
	<span style="display:none" id="attachtxt" >
		<input id="refTxt" type="text" value="" ><button type="button" class="btn btn-default" value="attach" onclick="attachReference();" ><a href="javascript:void(0)" class="switchContent" title="Attach Ref" ><i class="fa fa-external-link fa-lg"></i></a></button>
	</span>
</div>
<div id="appendRecording" ng-click="setRecordingEnv()"></div>
<button type="button" class="btn btn-default" id="openRecord"><li class="fa fa-video-camera fa-lg" ></li></button>

		<div id="recordMenu" class="well well-sm" style="display:none">
			<button type="button" class="btn btn-default" id="closeRecord"><li class="fa fa-caret-right fa-lg"  ng-click="stopRecording()"></li></button>
			
			<div class="btn-group options">
				<menu class="small" style="padding: 5px;">
					<button id="rwButton" class="rw"  onclick="rewind()" disabled ></button> 
					<button id="recordButton" class="record"  ng-click="checkRecordingButton()"></button>
					<button id="playpause" class="play" onclick = "togglePlayPause(this)" disabled ></button>
					<button id="stopButton" class="stop" onclick = "stopPlaying()" disabled></button>
					<button id="ffButton" class="ff" onclick="fastFarward()" disabled ></button>
					&nbsp;&nbsp;&nbsp;<input id="ex1" data-slider-id='ex1Slider' type="text" data-slider-min="0" data-slider-max="100" data-slider-step="1" data-slider-value="14" style="width: 100px;"/>&nbsp;&nbsp;&nbsp;
					<span id="cTime" style="color:red">00:00</span>
					<span>--</span>
					<span id="eTime">00:00</span>
					
				</menu> 
			</div>
		</div>

<!-- //\/\/\/\/\/\/\/\/\/\//\/\/\ MODALS /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/-->

<div class="modal fade" id="progress-Modal" tabindex="-1" role="dialog" aria-labelledby="dupModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
	   <h4 class="modal-title" id="myModalLabel">Upload :- <span id="fileType"></h4>
      </div>
      <div class="modal-body">
		<center><img src="<%=request.getContextPath()%>/images/meeting/loadingAnimation.gif"></center><br>
       <strong><p align="center">Please Wait while the file is being uploaded.</p></strong>
      </div>
    </div>
  </div>
</div>


<div class="modal fade" id="exit-Modal" tabindex="-1" role="dialog" aria-labelledby="dupModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel">Exit Without Saving?</h4>
      </div>
      <div class="modal-body">
        
        <p class="text-danger">Are you sure you want to Exit without saving the current state?</p>
        <p class="text-danger">You cannot undo this option.</p>

      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
        <button type="button" class="btn btn-danger" onclick = "exitMeeting();">Done</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="startOver" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel">Revert To Last Save?</h4>
      </div>
      <div class="modal-body">

        <p class="text-danger">By starting over, you will be taken to the last saved state. All changes since the last saved state will be lost.</p>
        <p class="text-danger">Are you sure you want to do this? You cannot undo this action.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
        <button type="button" class="btn btn-danger" onclick="submitEditLectureform();">Start Over</button>
      </div>
    </div>
  </div>
</div>					


<!-- Duplicate Modal -->
<div class="modal fade" id="cro-Modal" tabindex="-1" role="dialog" aria-labelledby="dupModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel">Clear Recorded Objects?</h4>
      </div>
      <div class="modal-body">
        
        <p>Are you sure you want to clear all recorded objects?</p>
        <p>You cannot undo this option.</p>

      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
       <button type="button" class="btn btn-danger" data-dismiss="modal" onclick = "clearRecordedObjectTime()" >Clear</button>
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="rem-Modal" tabindex="-1" role="dialog" aria-labelledby="dupModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel">Remove Recorded Objects?</h4>
      </div>
      <div class="modal-body">
        
        <p class="text-danger">Are you sure you want to delete all recorded objects?</p>
        <p class="text-danger">You cannot undo this option.</p>

      </div>


      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
        <button type="button" class="btn btn-danger" data-dismiss="modal" onclick = "RemoveRecordedObject()" >Clear</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="player-Modal" tabindex="-1" role="dialog" aria-labelledby="dupModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title" id="myModalLabel">Append Recording?</h4>
      </div>
      <div class="modal-body">
        
        <p class="text-info">Do you want to append it with the previous recording?</p>
      </div>


      <div class="modal-footer">
        <button type="button" class="btn btn-success" onclick="setAppendStatus('Y')">Yes</button>
        <button type="button" class="btn btn-danger" onclick="setAppendStatus('N')">No</button>
       <button type="button" class="btn btn-info" data-dismiss="modal">Cancel</button>
	</div>
    </div>
  </div>
</div>

 <div id = "meetingDiv" style="position:absolute;top:630px;left:300px;">
	<audio id="audio1"  >
					<source src="" type="audio/mp3">
					  Your browser does not support HTML5 video.
	</audio>
</div>
<!--  END MODALS-->



<!-- JAVASCRIPT BELOW /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\-->


<!--  JS to update the transparencey -->



<script type="text/javascript">
/*
var p = document.getElementById("size"),
    res = document.getElementById("result");


p.addEventListener("input", function () {
    res.innerHTML = p.value;
}, false);
*/
</script>


<!--  TOOLS TOGGLE -->

<script type="text/javascript">
$(document).ready(function() {

    switchContent=function(ev) {
        var el=$($(this).attr('href'));
        if(el.length == 1) {
            $('#target').html(el.html());
        }
        ev.preventDefault();
    };
    $('.switchContent').on('click',switchContent);
});
</script>


<!-- Scrubber Javascript -->
<script type="text/javascript">
$("#ex8").slider({
	tooltip: 'always'
});
</script>

<script type="text/javascript">


function selectedFile(ri){
	//console.log("document::"+ri);

	if (ri == "image"){
		//document.getElementById("fileSelected").className = "fa fa-file-image-o fa-lg";
		document.getElementById('myInput').accept = "image/*";
	}else if (ri =="pdf"){
		//document.getElementById("fileSelected").className = "fa fa-file-pdf-o fa-lg";
		document.getElementById('myInput').accept = ".pdf,"; 
	}else if (ri =="docx"){
		//document.getElementById("fileSelected").className = "fa fa-file-word-o fa-lg";
		document.getElementById('myInput').accept = ".doc,.docx"; 
	}else if (ri == "ppt"){
		//document.getElementById("fileSelected").className = "fa fa-file-powerpoint-o fa-lg";
		document.getElementById('myInput').accept = ".ppt,.pptx";
	}else if (ri == "excel"){
		//document.getElementById("fileSelected").className = "fa fa-file-excel-o fa-lg";
		document.getElementById('myInput').accept = ".xls,.xlsx,"; 
	}else if (ri == "video"){
		document.getElementById('myInput').accept = "audio/*,video/*"; 
	}
  //console.log("current Accept::"+document.getElementById('myInput').accept);
  $('#myInput').click();
 
 //getfile(selected_file);
}

</script>

<script type="text/javascript">
/*
function canvasColorSelect(color){
//console.log("Canvas Color::"+color);
//console.log("canvas::"+document.getElementById("canvas"));
	if(color =='white'){
		canvas.style.backgroundColor = 'white';
	}else if(color =='black'){
		canvas.style.backgroundColor ='black';
	}

}*/
</script>



<script type="text/javascript">
function getfile(){
 var selected_file = document.getElementById('myInput').files[0];
	//var selected_file = document.getElementById('myInput').files[0];
	//console.log("select::1111111111111111"+selected_file);
	//document.getElementById('myInput').accept = "audio/*";
	
		if(selected_file != null){	
					var file = selected_file;
					var files = new Array();
					files[0] = file;
					
					var isImage = false;
					//console.log("$$$$$$$$$$$$file"+file);
					for(var i=0;i<files.length;i++){
						file = files[i];
						if(!isPlayingStoped){
							currentMiliSec =Math.floor(myVid.currentTime * 1000);
							dropedFileTimeTab.put(file.name,currentMiliSec);
						}else if(startTime != 0){
							var currentTime = new Date().getTime();
							currentMiliSec = recFileDuration + Math.ceil(currentTime - startTime);
							dropedFileTimeTab.put(file.name,currentMiliSec);
							//console.log("*****FileName :::"+file.name+":::Time:::"+currentMiliSec);
						 }
					
					
					
					if (typeof FileReader !== "undefined" && file.type.indexOf("image") != -1) {
						isImage = true;
						/*
						var reader = new FileReader();
						// Note: addEventListener doesn't work in Google Chrome for this event
							reader.onload = function (evt) {
							var img =  new Image();
							img.src = evt.target.result;
														
							tempArray = null;
							tempArray =  new Array();
							tempArray[0] = imageX;
							tempArray[1] = imageY;
							tempArray[2] = canvas.width - imageX;
							tempArray[3] = canvas.height - (2*imageY);
							//clearDropZone();
							loadImage(img.src,null);
							insertImageObj(document.getElementById("pagenum").value,img.src,true,file.name);
							dropedFileTimeTab.remove(file.name);
							//ctx.drawImage(img,50,50,500,400);
						};
						reader.readAsDataURL(file);
						*/
					}
				}
					
				//alert(" file.type::"+ file.type);
				if(file.type.indexOf("video") != -1 || file.type.indexOf("audio") != -1){
					uploadVideo(files);
				}else{
					uploadDropedFiles(files,isImage);
				}
				 document.getElementById('myInput').value = "";
			//console.log("Done");
		
		}
	}


     
</script>



<!-- Toggle Menus JS -->
<script>
	var duration = 'fast';

// Toggle Tools
	$('#openTools').click(function () {
	    $('#openTools').hide(duration, function() {
	        $('#toolMenu').show('slide', {direction: 'left'}, duration);});
	});
	$('#closeTools').click(function () {
	    $('#toolMenu').hide('slide', {direction: 'left'}, duration, function() {
	        $('#openTools').show(duration);});
	});


// Toggle Recorder 
	$('#openRecord').click(function () {
	    $('#openRecord').hide(duration, function() {
	        $('#recordMenu').show('slide', {direction: 'right'}, duration);});
	});
	$('#closeRecord').click(function () {
	    $('#recordMenu').hide('slide', {direction: 'right'}, duration, function() {
	        $('#openRecord').show(duration);});
	});


// Toggle Navigation
	$('#openNav').click(function () {
	    $('#openNav').hide(duration, function() {
	        $('#navMenu').show('slide', {direction: 'left'}, duration);});
	});
	$('#closeNav').click(function () {
	    $('#navMenu').hide('slide', {direction: 'left'}, duration, function() {
	        $('#openNav').show(duration);});
	});

</script>


<!-- tooltips -->
<script type="text/javascript">
	$(function () { 
	$("[data-toggle='tooltip']").tooltip(); 
	});
</script>


<script type="text/javascript">
$("[data-toggle=popover]").popover();
</script>


<!-- Confirm deletion of slide -->
<script type="text/javascript">
var delSlideContent = '<p>This will permanently delete this slide from your lecture and cannot be undone.</p>'+'<button id="close-popover" data-toggle="clickover" class="btn btn-default" onclick="$(&quot;#delSlide&quot;).popover(&quot;hide&quot;);">Cancel</button>'+' '+'<button type="button" class="btn btn-danger">Delete</button>'

$('#delSlide').popover({animation:true, content:delSlideContent, html:true});
</script>


<!-- Confirm deletion of slide -->
<script type="text/javascript">
var delSlideContent = '<p>This will permanently delete your recording from your lecture and cannot be undone.</p>'+'<button id="close-popover" data-toggle="clickover" class="btn btn-default" onclick="$(&quot;#delRecording&quot;).popover(&quot;hide&quot;);">Cancel</button>'+' '+'<button type="button" class="btn btn-danger">Delete</button>'

$('#delRecording').popover({animation:true, content:delSlideContent, html:true});
</script>



<script type="text/javascript">
function replace(target,source) {
        document.getElementById(target).innerHTML  = document.getElementById(source).innerHTML;
      }
</script>

 <script type="text/javascript">
<!--
	var canvas;
	var ctx;
	var canvasOffset;
	var offsetX;
	var offsetY;
	var pageObjTable =  new Hashtable();
	var nonRecordinPageObjTable =  new Hashtable();
	//var objectTable = new Hashtable();
	var timeRefTable = new Hashtable();
	var objectTimeTable = new Hashtable();
	var objectPageRefTable = new Hashtable();
	//var nonRecordingObjArray = new Array();
	var selObjArray = new Array();;
	var freeHandQdArr ;
	var isControlPressed = false;
	var startX;
	var startY;
	var triEndX;
	var triEndY;
	var globalAlpha = 1.0;
	var count = 0;
	var currentObjId;
	var isDrawing = false;
	var currentMiliSec = 0;
	var rectangleSelObject = null;
	var dragFlag = false;
	var highlightedObj = null;
	var lineWidth = 2;
	var styleColor = "#000000";
	var fillColor;
	var myVid;
	var tempX;
	var tempY;
	var tempAngleRad;
	var meetingName;
	var tempArray;
	var imageObj;
	var imgGraphicsobject;
	var isImageLoaded = false;
	var timer;
	var playCount;
	var startTime = 0;
	var recFileDuration = 0;
	var pencilPath;
	var meetingName = "<s:property value = '%{meetingName}' />";
	var isAutoPlay = "<s:property value = '%{autoPlay}' />";
	var canvasBoundedRectanglePoints =  new Array();
	var isCircleCreated = false;
	var tempCirclePointsArray = new Array();
	var selObjBoundedCircleTab =  new Hashtable();
	var strechableObj = new Array();	
	var zoomableObj;	
	var isPlayingStoped = true;
	var runningTimerId;
	var tempTranslatePointsArr = new Array();
	var smoothLength = 4; 
	var minDist = 8; 
	var selCircleRedius = 7; 
	var timeDuration;
	var nextPlayingObjKey;
	var nextPlayingObjtime;
	var isPaused = false;
	var sliderMoveTime;
	var sliderTimer;
	var sliderPos = 0;
	var currentAudioTime;
	var playingFrom = -1;
	var imageloadingTimer;
	var imageX = 20;
	var imageY = 10;
	var zoomType = 1;
	var dropedFileTimeTab = new Hashtable();
	var repTimeRefTable;
	var isReplaceEnable = false;
	var isEditTimerEnable = false;
	var isRotaionEnable = false;
	var isZoomEnable = false;
	var replaceableObjArr = new Array();
	var replacedObjArr = new Array();
	var textWidth = -1;
	var myEditor;
	var selectedTxtObj;
	var copiedObjArr = new Array();
	var textFontType = "learning";
	var textFontSize = 50;
	var isBold= false;
	var isUnderLine = false;
	var isItalic = false;
	var currentPointerPath ;
	var pointerX = 0;
	var pointerY = 0;
	var pointerImg;
	var blinkTimer;
	var playerTimer;
	var prevSelButtonObj;
	var isSetIdCalled = false;
	var prevSelOpenShapeId;
	var prevSelCloseShapeId;
	var rotationStartAngle;
	var rotationEndAngle;
	

function windowResize(){
//alert("hii");
 //console.log("width::"+window.innerWidth+":height::"+window.innerHeight);
 var windowW=window.innerWidth;
 var windowH=window.innerHeight
 canvas.width = (windowW - 40);
 canvas.height = (windowH -150);
 canvasOffset = $("#canvas").offset();
 offsetX = canvasOffset.left;
 offsetY = canvasOffset.top;
 //console.log("offsetX:::"+offsetX+"offsetY:::"+offsetY);

 canvasBoundedRectanglePoints[0] = 0;
 canvasBoundedRectanglePoints[1] = 0;
 canvasBoundedRectanglePoints[2] = canvas.width;
 canvasBoundedRectanglePoints[3] = canvas.height;
 
 restore();
 }

function fireEvent(obj, evt) {
    var fireOnThis = obj;
    if (document.createEvent) {
        var evObj = document.createEvent('MouseEvents');
        evObj.initEvent(evt, true, false);
        fireOnThis.dispatchEvent(evObj);
    } else if (document.createEventObject) {
        fireOnThis.fireEvent('on' + evt);
    }
}
	/*
	 *
	 *
	*/
	jQuery(document).ready(function(){
		var windowW = window.innerWidth;
		var windowH = window.innerHeight;
		var isMobDevice = detectmob();
		 
		//screenW = screenW -10;
		//console.log("Start-----------------screenW::"+screenW+"::screenH::"+screenH);
		/*if(isMobDevice){
		//	document.getElementById("disableDiv").style.width = (screenW + 165) + "px";
		}else{
		//	document.getElementById("disableDiv").style.width = (screenW -10) + "px";
		}
	*/
		
		//console.log("screenW::"+windowW+"::screenH::"+windowH);
		canvas = document.getElementById("canvas");
		if(isMobDevice){
			canvas.width = (windowW + 180);
			canvas.height = (windowH - 1);
			canvas.style.display = "block";
		}else{
			canvas.width = (windowW - 40);
			canvas.height = (windowH -150);
			canvas.style.display = "block";
			
		}
		
		ctx = canvas.getContext("2d");
		//paper.setup(canvas);
			
		canvasBoundedRectanglePoints[canvasBoundedRectanglePoints.length] = 0;
		canvasBoundedRectanglePoints[canvasBoundedRectanglePoints.length] = 0;
		canvasBoundedRectanglePoints[canvasBoundedRectanglePoints.length] = canvas.width;
		canvasBoundedRectanglePoints[canvasBoundedRectanglePoints.length] = canvas.height;
		
		
		ctx.lineWidth = lineWidth;
		ctx.styleColor = styleColor;
		ctx.globalAlpha = globalAlpha;
		
		document.getElementById("opacityCtrl").value = globalAlpha;
	
		document.getElementById("area1").style.fontSize = textFontSize+"px";
		document.getElementById("area1").style.fontFamily = textFontType;
		
		currentObjId = 7;
		document.getElementById("toolOptions1").style.display = "inline-block";
		
		init();
		prevSelButtonObj = document.getElementById("selButton");
		prevSelButtonObj.className = "btn btn-default active";
		prevSelCloseShapeId = 23;
		prevSelOpenShapeId = 3;

		if(meetingName != null || meetingName!= ''){
			//alert("meetingName"+meetingName);
			openMeeting(meetingName);
		}
		
		canvasOffset = $("#canvas").offset();
		offsetX = canvasOffset.left;
		offsetY = canvasOffset.top;
		initPlayer();
		
		pointerImg = document.getElementById("pointerImg");
				
		jQuery('#ex1').slider({
			formater: function(value) {
		//console.log("current value::"+value);
			//return 'Current value: ' + value;
			}
		});

		jQuery("#ex1").on('slide', function(slideEvt) {
			//console.log(slideEvt.value);
			sliderPos = slideEvt.value;
			
		
			
			
			
			//document.getElementById("sliderPos").innerHTML = "Slider position:"+slideEvt.value;
		});
		jQuery("#ex1").on('slideStop', function (e) {
			//console.log("-----------slideStop-------------"+sliderPos);
			if(!isRecRunning){
				//console.log("----runningTimerId---After---"+runningTimerId);
				//console.log(" clearTimeout(sliderTimer)222222222");
				//console.log("----runningTimerId---Before---"+runningTimerId);
				clearTimeout(runningTimerId);	
				clearTimeout(sliderTimer);
				playingFrom = 2;
				//console.log("Source::::"+myVid.src);
				if(myVid.src == null || myVid.src == ''){
					myVid.src = "http://"+window.location.host+"/"+filename;
					
					
					//myVid.currentTime  = currentAudioTime;
				}else{
					currentAudioTime  = sliderPos*recFileDuration / 100;
					//console.log("-----------currentAudioTime-------"+currentAudioTime);
					currentAudioTime =  Math.ceil(currentAudioTime / 1000);
					myVid.currentTime  = currentAudioTime;
				}
			}
			

			
			
		});
		
		jQuery("#ex1").on('slideStart', function (e) {
			myVid.pause();
			document.getElementById("playpause").className  = "play";
		});



		canvas.addEventListener("touchstart", function (evt) {
			var touch = evt.changedTouches[0];
			//console.log("Touch Start------------------"+touch.clientX+"::Y::"+touch.clientY);
			evt.preventDefault();
			dragFlag = true;

			handleMouseDown(touch);
		}, false);

		canvas.addEventListener("touchmove", function (evt) {
			var touch = evt.changedTouches[0];
			//console.log("Touch Move------------------"+touch.clientX+"::Y::"+touch.clientY);
			evt.preventDefault();
			handleMouseMove(touch);
		}, false);

		canvas.addEventListener("touchend", function (evt) {
			//console.log("Touch End------------------");
			var touch = evt.changedTouches[0];
			evt.preventDefault();
			dragFlag = false;
			strechableObj[0] = null;
			strechableObj[1] = null;
			strechableObj[2] = null;
			handleMouseUp(touch);
		}, false);

				
		canvas.addEventListener("dragenter", function (evt) {
			//console.log("Drag Enter------------------");
			evt.preventDefault();
			createDropZone();
		}, false);
		
		canvas.addEventListener("dragover", function (evt) {
			//console.log("Drag over--------------------");
			evt.preventDefault();
		}, false);
	
		canvas.addEventListener("dragleave", function (evt) {
		//	//console.log("Drag Leave---------------------");
			evt.preventDefault();
			clearDropZone();
		}, false);

		//Handle dropped image file - only Firefox and Google Chrome
		canvas.addEventListener("drop", function (evt) {
		  //console.log("drop--------------- "+evt.dataTransfer.files.length);
		  evt.preventDefault();
		  var files = evt.dataTransfer.files;
		  var isImage = false;
		  //alert("hiii"+files);
		  //
		 
		  
			if(files.length == 0){
				clearDropZone();
			}else if (files.length > 0) {
				//uploadDropedFiles(files);
				
				for(var i=0;i<files.length;i++){
					var file = files[i];
					if(!isPlayingStoped){
						currentMiliSec =Math.floor(myVid.currentTime * 1000);
						dropedFileTimeTab.put(file.name,currentMiliSec);
					}else if(startTime != 0){
						var currentTime = new Date().getTime();
						currentMiliSec = recFileDuration + Math.ceil(currentTime - startTime);
						dropedFileTimeTab.put(file.name,currentMiliSec);
						//console.log("*****FileName :::"+file.name+":::Time:::"+currentMiliSec);
					 }
					
					
					if (typeof FileReader !== "undefined" && file.type.indexOf("image") != -1) {
						isImage = true;
						
						/*
						var reader = new FileReader();
						// Note: addEventListener doesn't work in Google Chrome for this event
							reader.onload = function (evt) {
							var img =  new Image();
							img.src = evt.target.result;
						
							
							tempArray = null;
							tempArray =  new Array();
							//console.log("Temp Array before page load:111::"+tempArray+"::imageX:"+imageX);
							tempArray[0] = imageX;
							//console.log("Temp Array -----:"+tempArray+"::imageX:"+imageX);
							tempArray[1] = imageY;
							//console.log("Temp Array $$$$$$$::"+tempArray+"::imageX:"+imageY);
							tempArray[2] = canvas.width - imageX;
							tempArray[3] = canvas.height - (2*imageY);
							//clearDropZone();
							//console.log("Temp Array before page load:2222::"+tempArray);
							loadImage(img.src,null);
							//alert("Src:::"+img.src);
							insertImageObj(document.getElementById("pagenum").value,img.src,true,file.name);
							dropedFileTimeTab.remove(file.name);
						};
						reader.readAsDataURL(file);
						*/

					}
				}
				if(file.type.indexOf("video") != -1 || file.type.indexOf("audio") != -1){
					uploadVideo(files);
				}else{
					uploadDropedFiles(files,isImage);
				}
				//uploadDropedFiles(files,isImage);
			}
			evt.preventDefault();
			}, false);
		
		
		$(document).keydown(function(evt){
		
			evt = evt || window.event;
			
			var charCode = evt.keyCode || evt.which;
			var charStr = String.fromCharCode(charCode);
			//alert("charStr"+charCode+"::"+evt.metaKey);
			//console.log("charCode::;"+charCode);
			if(navigator.platform.indexOf("Mac")!=-1){
			//alert("mac");
				if(charCode == 8){
					var pageNum = document.getElementById("pagenum").value;
					var objectTable = pageObjTable.get(pageNum);
					deleteSelectedObject(objectTable,pageNum);
					evt.preventDefault();
				}
				if(charCode == 91){
					isControlPressed = true;
				}
				if(evt.metaKey && (evt.which == 65)) {
					evt.preventDefault();
					if(currentObjId == 7){
						//console.log("select All object");
						var pageNum = document.getElementById("pagenum").value;
						var objectTable = pageObjTable.get(pageNum);
						selectAllObject(objectTable);
						if(selObjArray.length > 0){
							enableDisableRelationOptions(true);
							}
					}
					return false;
				 }else if(evt.metaKey && (evt.which == 83)) {
					evt.preventDefault();
					// save meeting data
					saveMeetingOnServer('save');
					return false;
				}else if(evt.metaKey && (evt.which == 67) && currentObjId == 7){
					copySelectedObject();
				}else if(evt.metaKey && (evt.which == 86) && currentObjId == 7){
					pasteCopiedObject();
				}
			}else{
			
				if(charCode == 46){
					var pageNum = document.getElementById("pagenum").value;
					var objectTable = pageObjTable.get(pageNum);
					deleteSelectedObject(objectTable,pageNum);
				}
				if(charCode == 17){
					isControlPressed = true;
				}
				if(evt.ctrlKey && (evt.which == 65)) {
					evt.preventDefault();
					if(currentObjId == 7){
						//console.log("select All object");
						var pageNum = document.getElementById("pagenum").value;
						var objectTable = pageObjTable.get(pageNum);
						selectAllObject(objectTable);
						if(selObjArray.length > 0){
							enableDisableRelationOptions(true);
							}
					}
					return false;
				 }
			  else if(evt.ctrlKey && (evt.which == 83)) {
				evt.preventDefault();
				// save meeting data
				saveMeetingOnServer('save');
				return false;
			  }else if(isControlPressed && charCode == 67 && currentObjId == 7){
				copySelectedObject();
				}else if(isControlPressed && charCode == 86 && currentObjId == 7){
					pasteCopiedObject();
				}
				
			}
			
			/*if(isControlPressed && charCode == 65 && currentObjId == 7){
				evt.preventDefault();
				//console.log("select All object");
				var pageNum = document.getElementById("pagenum").value;
				var objectTable = pageObjTable.get(pageNum);
				selectAllObject(objectTable);
			}*/ 
			
		 });
		 $(document).keyup(function(evt){
			
				isControlPressed = false;
		});
		$("#canvas").on('mousedown', function (e) {
			e.preventDefault();
			dragFlag = true;
			handleMouseDown(e);
		}).on('mouseup', function(e) {
			e.preventDefault();
			dragFlag = false;;
			handleMouseUp(e);
		}).on('mousemove', function(e) {
			/*
			if(dragFlag){
			 //console.log("MouseDrag-------------------------------------");
			}else{
			 //console.log("Mousemove#####################################");
			}*/
			handleMouseMove(e);
		}).on('mouseout', function(e) {
			//$('#mycursor').hide();
			
		}).on('mouseenter', function(e) {
		e.preventDefault();
			//$('#mycursor').show();
		}).on('click', function(e) {
			e.preventDefault();
			//alert("mouse click");
			/*
			if(dragFlag){
			 //console.log("MouseDrag-------------------------------------");
			}else{
			 //console.log("Mousemove#####################################");
			}*/
			handleMouseClick(e);
		}).on('dblclick', function(e) {
			e.preventDefault();
			//alert("mouse click");
			startX = parseInt(e.clientX - offsetX);
			startY = parseInt(e.clientY - offsetY);
			var objectTable = pageObjTable.get(document.getElementById("pagenum").value);
			var objArr = checkPointsInObject(objectTable,true);
			if(objArr.length > 0){
				var graphicsObject = objectTable.get(objArr[0]);			
					//console.log("objArr:::::"+graphicsObject.ref);
				if(graphicsObject.ref != null && ((graphicsObject).ref).trim().length > 0){
					OpenInNewTab(objectTable.get(objArr[0]).ref);
				}
			}
			
		});
	});;

	
function copySelectedObject(){
	copiedObjArr = null;
	copiedObjArr = new Array();
	if(selObjArray != null && selObjArray.length>0){
		 for(var i=0;i<selObjArray.length;i++){
			copiedObjArr[i] = selObjArray[i];
		 }
	}
}

function pasteCopiedObject(){
	var pageNum = document.getElementById("pagenum").value;
	var nonRecordingObjArray = nonRecordinPageObjTable.get(pageNum);
	if(nonRecordingObjArray == null){
		nonRecordingObjArray = new Array();
		nonRecordinPageObjTable.put(pageNum,nonRecordingObjArray);
	}
	selObjArray = null;
	selObjArray = new Array();
	//console.log("copiedObjArr::"+copiedObjArr);
	var destObjectTable = pageObjTable.get(pageNum);
	//console.log("objectTable before copying ::;"+destObjectTable+":::count::;"+count);
	for(var i=0;i<copiedObjArr.length;i++){
		count++;
		 var srcObjpageNum = objectPageRefTable.get(copiedObjArr[i]);
		 var srcObjectTable = pageObjTable.get(srcObjpageNum);
		 var graphicsObject = srcObjectTable.get(copiedObjArr[i]);
		 //console.log("graphicsObject::"+graphicsObject.type);
		var newObjPtsArray = new Array();
		var pointsArray = graphicsObject.pointsArray;
		for(var j=0;j<pointsArray.length;j++){
			newObjPtsArray[j] = pointsArray[j];
		}
		var textObj;
		if(graphicsObject.type == 16){
			textObj= new Text(graphicsObject.text.textData,graphicsObject.text.fontType,graphicsObject.text.fontSize,graphicsObject.text.isBold,graphicsObject.text.isUnderLine,graphicsObject.text.isItalic);
		}
		var newGraphicsObject = new GraphicsObject(count,graphicsObject.type,newObjPtsArray,graphicsObject.lineWidth,graphicsObject.color,graphicsObject.src,graphicsObject.isFilled,graphicsObject.fillColor,graphicsObject.opacity,graphicsObject.imageLoaded,textObj,graphicsObject.ref);
	
	
		if(destObjectTable == null){
			destObjectTable = new Hashtable();
			pageObjTable.put(pageNum,destObjectTable);
		}
		destObjectTable.put(count, newGraphicsObject);
		objectPageRefTable.put(count,pageNum);
	
		nonRecordingObjArray[nonRecordingObjArray.length] = count ;
		selObjArray[selObjArray.length] = count;
	}
	//console.log("objectTable After copying ::;"+destObjectTable);
	var dx = 10; 
	var dy = 10; 
	//console.log("pasted object------------"+selObjArray);
	shiftSelectedObject(destObjectTable,dx,dy);
	
}

function OpenInNewTab(url) {
//console.log("url::::"+url);
  var win = window.open(url, '_blank');
  win.focus();
}

function toggleEditObjectTime(){
	var obj = document.getElementById("EditTimerB")
	if(obj.className =='fa fa-clock-o fa-lg'){
		obj.className ='fa fa-smile-o fa-lg';
		isEditTimerEnable = true;
		currentObjId = 7;
	}else if(obj.className =='fa fa-smile-o fa-lg'){
		obj.className ='fa fa-clock-o fa-lg';
		document.getElementById("recordObjTimeDiv").style.display = "none";
		isEditTimerEnable = false;
		setSelectedObjectTime();
	}
}
function setSelectedObjectTime(){
	var time = document.getElementById("selRecordObj").value;
	 if(parseInt(recFileDuration) < parseInt(time)){
		alert("Invalid time");
		return;
	  }
	var pageNum = document.getElementById("pagenum").value;
	//console.log("------setSelectedObjectTime-------------:"+time.trim());
	if(selObjArray.length > 0){
			var objId = selObjArray[0];
			var objPrevTime = objectTimeTable.get(objId);
			
			var recordedObjArr = timeRefTable.get(objPrevTime);
			if(recordedObjArr != null ){
				for(var i=0;i<recordedObjArr.length;i++){
					var pageObj = recordedObjArr[i];
					if(pageObj.objectId == objId){
						recordedObjArr.splice(i,1);
						break;
					}
				}
				// if only single object exist in that time then remove ref in time ref table
				if(recordedObjArr.length == 0){
					timeRefTable.remove(objPrevTime);
				}
			}
		//console.log("new time--------------:"+time.trim());
		if(time.trim().length == 0 || time.trim() == 0){
			//console.log("convert in to non recording object------");
			// convert into non recording object
			objectTimeTable.remove(objId);
			// add to non recording object
			var nonRecordingObjArray = nonRecordinPageObjTable.get(pageNum);
			if(nonRecordingObjArray == null){
				nonRecordingObjArray = new Array();
			}
			nonRecordingObjArray[nonRecordingObjArray.length] = objId;
		}else{
				// change all time ref. of selected object
				objectTimeTable.put(objId,time);
				
				// Set Object new edited time
				var pageObject = new PageObject(pageNum,objId);
				recordedObjArr = timeRefTable.get(time);
				if(recordedObjArr ==  null){
					recordedObjArr = new Array();
				}
				recordedObjArr[recordedObjArr.length] = pageObject;
				timeRefTable.put(time,recordedObjArr);
				//console.log("timeRefTable after inserting object:"+timeRefTable);
				timeRefTable = sortObjectTimeTable(timeRefTable)
				//console.log("timeRefTable after sorting:"+timeRefTable);
				
		}
			
	}
}
function increaseTime(){
	document.getElementById("selRecordObj").value = parseInt(document.getElementById("selRecordObj").value) + 1;
}
function decreaseTime(){
	//console.log("decrease");
	document.getElementById("selRecordObj").value = (document.getElementById("selRecordObj").value -1);
}

function checkAndSetId(object){
//console.log("checkAndSetId::::"+isSetIdCalled);
		if(!isSetIdCalled){
				if(object.id == 'closedShapeButton'){
					setId(prevSelCloseShapeId,false);
				}else if(object.id == 'openShapeButton'){
					setId(prevSelOpenShapeId,false);
				}
		}else{
			isSetIdCalled = false;
		}
		/*var obj = document.getElementById("closedShapeButton");
		prevSelButtonObj.className = "btn btn-default";
		obj.className = "btn btn-default active"
		prevSelButtonObj = obj;*/
		//alert(document.getElementById("closedShape").className);
}
function setId(id,state){
		//alert("setid"+id);
		//var obj = document.getElementById("closeShapeButton")
		//obj.className = "btn btn-default active";
		switch(id){
		  case 1:
				var obj = document.getElementById("closedShapeButton");
				prevSelButtonObj.className = "btn btn-default";
				obj.className = "btn btn-default active"
				prevSelButtonObj = obj;
				prevSelCloseShapeId = id;
				document.getElementById("closedShape").className = "fa fa-square-o fa-lg";
				isSetIdCalled = state;
			break;
		  case 2:
				var obj = document.getElementById("closedShapeButton");
				prevSelButtonObj.className = "btn btn-default";
				obj.className = "btn btn-default active"
				prevSelButtonObj = obj;
				prevSelCloseShapeId = id;
				document.getElementById("closedShape").className = "fa fa-square-o fa-lg";
				isSetIdCalled = state;
			break;
		  case 3:
		  
				var obj = document.getElementById("openShapeButton");
				prevSelButtonObj.className = "btn btn-default";
				obj.className = "btn btn-default active"
				prevSelButtonObj = obj;
				prevSelOpenShapeId = id;
				document.getElementById("openShape").className = "fa fa-minus fa-lg";
				isSetIdCalled = state;
		  break;
		  case 4:
				var obj = document.getElementById("pencilButton");
				prevSelButtonObj.className = "btn btn-default";
				obj.className = "btn btn-default active"
				prevSelButtonObj = obj;
				
		  break;
		  case 5:
				var obj = document.getElementById("closedShapeButton");
				prevSelButtonObj.className = "btn btn-default";
				obj.className = "btn btn-default active"
				prevSelButtonObj = obj;
				prevSelCloseShapeId = id;
				document.getElementById("closedShape").className = "fa fa-square-o fa-lg";
				isSetIdCalled = state;
			break;
		  case 6:
				var obj = document.getElementById("openShapeButton");
				prevSelButtonObj.className = "btn btn-default";
				obj.className = "btn btn-default active"
				prevSelButtonObj = obj;
				prevSelOpenShapeId = id;
				document.getElementById("openShape").className = "fa fa-minus fa-lg";
				isSetIdCalled = state;
		  break;
		  case 7:
				var obj = document.getElementById("selButton");
				prevSelButtonObj.className = "btn btn-default";
				obj.className = "btn btn-default active"
				prevSelButtonObj = obj;
				//alert("dasfasd");
		  break;
		  case 11:
				var obj = document.getElementById("openShapeButton");
				prevSelButtonObj.className = "btn btn-default";
				obj.className = "btn btn-default active"
				prevSelButtonObj = obj;
				prevSelOpenShapeId = id;
				document.getElementById("openShape").className = "fa fa-minus fa-lg";
				isSetIdCalled = state;
		  break;
		  case 12:
		 		var obj = document.getElementById("closedShapeButton");
				prevSelButtonObj.className = "btn btn-default";
				obj.className = "btn btn-default active"
				prevSelButtonObj = obj;	
				prevSelCloseShapeId = id;
				document.getElementById("closedShape").className = "fa fa-square-o fa-lg";
				isSetIdCalled = state;
				
		  break;
		  case 13:
				var obj = document.getElementById("closedShapeButton");
				prevSelButtonObj.className = "btn btn-default";
				obj.className = "btn btn-default active"
				prevSelButtonObj = obj;
				prevSelCloseShapeId = id;
				document.getElementById("closedShape").className = "fa fa-square-o fa-lg";
				isSetIdCalled = state;
		  break;
		  case 16:
				var obj = document.getElementById("editorButton");
				prevSelButtonObj.className = "btn btn-default";
				obj.className = "btn btn-default active"
				prevSelButtonObj = obj;
				
				if(selObjArray != null && selObjArray.length >0){
					var objectTable = pageObjTable.get(document.getElementById("pagenum").value);
					var graphicsObject = objectTable.get(selObjArray[0]);
					init();
					//console.log("graphicsObject::::"+graphicsObject);
					if(graphicsObject.type == 16){
						selectedTxtObj = graphicsObject;
						createEditor(graphicsObject.pointsArray,graphicsObject.text);
					}
				}else{
						var x = (canvasBoundedRectanglePoints[2] /2 ) - 390/2;
						var y = (canvasBoundedRectanglePoints[3] /2 ) - 266/2;
						var ptsArr = new Array();
						ptsArr[0] = x;
						ptsArr[1] = y;
						startX = x;
						startY = y;
						//console.log("createEditor:"+startX+"::startY:;"+startY);
						createEditor(ptsArr,null);
				}
				
		  break;
		  
		  case 23:
				var obj = document.getElementById("closedShapeButton");
				prevSelButtonObj.className = "btn btn-default";
				obj.className = "btn btn-default active"
				prevSelButtonObj = obj;
				prevSelCloseShapeId = id;
				document.getElementById("closedShape").className = "fa fa-square-o fa-lg";
				isSetIdCalled = state;
			break;
		 }
		currentObjId = id;
		document.getElementById("toolOptions1").style.display = "inline-block";
		if(id == 3 || id ==4 || id == 6){
			//console.log("case 1");
			document.getElementById("fillOptions").style.display = "none";
		}else{
			//console.log("case 2");
			document.getElementById("fillOptions").style.display = "inline-block";
		}
		init();
		/*
		if(id == 16){
			//console.log("setid:::;"+selObjArray);
		   	if(selObjArray != null && selObjArray.length >0){
				var objectTable = pageObjTable.get(document.getElementById("pagenum").value);
				var graphicsObject = objectTable.get(selObjArray[0]);
				init();
				//console.log("graphicsObject::::"+graphicsObject);
				if(graphicsObject.type == 16){
					selectedTxtObj = graphicsObject;
					createEditor(graphicsObject.pointsArray,graphicsObject.text);
				}
			}else{
					var x = (canvasBoundedRectanglePoints[2] /2 ) - 390/2;
					var y = (canvasBoundedRectanglePoints[3] /2 ) - 266/2;
					var ptsArr = new Array();
					ptsArr[0] = x;
					ptsArr[1] = y;
					startX = x;
					startY = y;
					//console.log("createEditor:"+startX+"::startY:;"+startY);
					createEditor(ptsArr,null);
			}
		}*/
		
}

function showAttach(){
	document.getElementById("attachtxt").style.display = "inline-block";
	document.getElementById("attachBut").style.display ="none";
}
function attachReference(){
	var refUrl = document.getElementById("refTxt").value;
	//console.log("Ref Ataached::::url::"+refUrl+"::selObjArray::"+selObjArray);
	if(refUrl != ""){
		if(selObjArray != null && selObjArray.length >0){
					var objectTable = pageObjTable.get(document.getElementById("pagenum").value);
					for(var i=0;i<selObjArray.length;i++){
						var graphicsObject = objectTable.get(selObjArray[0]);
						//console.log("Ref Ataached::"+graphicsObject.id+"::url::"+refUrl);
						graphicsObject.ref = refUrl;
						graphicsObject.color = "#0000FF";
					}
		}
	}
	document.getElementById("attachtxt").style.display = "none";
	document.getElementById("attachBut").style.display ="inline-block";
	selObjArray = null;
	selObjArray = new Array();
	ctx.clearRect(0, 0, canvas.width, canvas.height);
	restore();
	document.getElementById("refTxt").value = "";
}


function toggleReplace(){
var obj  = document.getElementById("replaceStartB");
	if(obj.className =='fa fa-toggle-up fa-lg'){// replace session starts
		if(selObjArray != null && selObjArray.length >0){
			// copy all object into array of replaceable object
			copyObjects(selObjArray,replaceableObjArr)
			isReplaceEnable = true;	
			obj.className = "fa fa-toggle-down fa-lg";
		
		}else{
			alert("No object selected for replace");
		}
	}else if(obj.value =='Replace End'){// replace session ends
		// check all replaceable object if any one is recorded object
		// then retrieve time stamp and if more than one objects have time stamp then apply min time stamp
		var timeStamp = getReplaceableObjTimestamp();
	
		if(timeStamp != null){
			// add time stamp value to replaced object and remove from non recording object array
			var pageNum = document.getElementById("pagenum").value;
			for(var i=0;i<replacedObjArr.length;i++){
				var objId= replacedObjArr[i];
				var pageObject = new PageObject(pageNum,objId);
				objectTimeTable.put(objId,timeStamp);
				
				
				var recordedObjArr = timeRefTable.get(timeStamp);
				if(recordedObjArr ==  null){
					recordedObjArr = new Array();
				}
				recordedObjArr[recordedObjArr.length] = pageObject;
				timeRefTable.put(timeStamp,recordedObjArr);
					
				
				
				//timeRefTable.put(timeStamp,pageObject);
				
				var nonRecordingObjArray = nonRecordinPageObjTable.get(pageNum);
				//console.log("Non recorded object"+nonRecordingObjArray);
				if(nonRecordingObjArray != null){
					//console.log("if case -----"+objId);
					var pos = checkObjInSelList(nonRecordingObjArray,objId);
					//console.log("if case pos-----"+pos);
					if(pos != -1){
						// Non recorded Object
						nonRecordingObjArray[pos] = null;
						nonRecordingObjArray.splice(pos ,1);
						nonRecordinPageObjTable.put(pageNum,nonRecordingObjArray);
					}else{
						// New Added recording Object
					}
					//console.log("nonRecordingObjArray:::"+nonRecordingObjArray);
				}
			}
		}
		// remove all replaceable object
		removeAllReplaceableObject();
		isReplaceEnable = false;	
		obj.className = "fa fa-toggle-up fa-lg";
		selObjArray =  null;
		selObjArray = new Array();
	}
	ctx.clearRect(0, 0, canvas.width, canvas.height);
	restore();
}


function removeAllReplaceableObject(){
//console.log("removeAllReplaceableObject replaceableObjArr:::::"+replaceableObjArr);

   for(var i=0;i<replaceableObjArr.length;i++){
		var objId= replaceableObjArr[i];
		var timeStamp = objectTimeTable.get(objId);
			
		var pageNum = document.getElementById("pagenum").value;
		if(timeStamp != null){ // recording object

			timeRefTable.remove(timeStamp);
			objectTimeTable.remove(objId);
		}else{ 
		
			var nonRecordingObjArray = nonRecordinPageObjTable.get(pageNum);
			//console.log("Non recorded object before"+nonRecordingObjArray);
			if(nonRecordingObjArray != null){
				//console.log("if case -----"+objId);
				var pos = checkObjInSelList(nonRecordingObjArray,objId);
				//console.log("if case pos-----"+pos);
				if(pos != -1){
					// Non recorded Object
					nonRecordingObjArray[pos] = null;
					nonRecordingObjArray.splice(pos ,1);
					nonRecordinPageObjTable.put(pageNum,nonRecordingObjArray);
				}
				//console.log("nonRecordingObjArray::after:"+nonRecordingObjArray);
			}
		
		}
		var objectTable = pageObjTable.get(pageNum);
		objectTable.remove(objId);
		//console.log("removeAllReplaceableObject objectTable::after:::"+objectTable)
   }

}

function getReplaceableObjTimestamp(){
var timeArr =  new Array();
	for(var i=0;i<replaceableObjArr.length;i++){
			var timeStamp = objectTimeTable.get(replaceableObjArr[i]);
			if(timeStamp != null){
				timeArr[timeArr.length] = timeStamp;
			}
	}
	if(timeArr.length >1){
		timeArr = timeArr.sort(function(a, b){return a-b});
	}
	return timeArr[0];
}

function copyObjects(source , dest){
  for(var i=0;i<source.length;i++){
	dest [i] = source[i];
  }
}
function setZoomType(type){
	//console.log("ZoomType::::"+type);
	zoomType = type;
	if(type == 2){
		canvas.style.cursor = '-webkit-zoom-out'; 
		canvas.style.cursor = '-moz-zoom-out';
		document.getElementById("zoomOut").className = "btn btn-default active"
		document.getElementById("zoomIn").className = "btn btn-default";
		
	}else{
		canvas.style.cursor = '-webkit-zoom-in'; 
		canvas.style.cursor = '-moz-zoom-in';
		document.getElementById("zoomIn").className = "btn btn-default active";
		document.getElementById("zoomOut").className = "btn btn-default";
	}
	//alert("zoom");

	
}

function handleZoomButton(state){
	if(state){
		//console.log("1");
		document.getElementById("zoom").disabled = false;
		document.getElementById("zoomIn").disabled = false;
		document.getElementById("zoomOut").disabled = false;
		}
	 else{
	 	//console.log("2");
		document.getElementById("zoom").className = "btn btn-default";
		document.getElementById("zoomIn").className = "btn btn-default";
		document.getElementById("zoomOut").className = "btn btn-default";
		document.getElementById("zoom").disabled = true;
		document.getElementById("zoomIn").disabled = true;
		document.getElementById("zoomOut").disabled = true;
		}
}
function initPlayer(){

	myVid = document.getElementById("audio1");
	myVid.addEventListener("canplay", function(_event) {
	//console.log("Can play listener works here ::playingFrom ::"+playingFrom + ":::isPlayingStoped++"+isPlayingStoped);
	//currentObjId = 7;
	
	switch(playingFrom){
				case 1:// Normal play from playing button
					//console.log("isPlayingStoped:::"+isPlayingStoped);
					if(!isPlayingStoped){
						canvas.style.cursor  = "default";
						//console.log("Play file name:::"+myVid.src);
						selObjArray =  null;
						selObjArray = new Array();
						enableDisableRelationOptions(false);
						myVid.controls = false;
						myVid.play();
						document.getElementById("recordButton").className = "recinactive";
						checkAndMergeTimeRefTable();
						timeRefTable = sortObjectTimeTable(timeRefTable);
						//console.log("3333333333333333333333333333");
						drawNonRecordingObject("1");
						timeRefTable.moveFirst();
						//console.log("timeRefTable::::playing:"+timeRefTable);
						playCount = 0;
						if(timeRefTable.next()){
							//alert(timeRefTable.getKey());
							//alert(timeRefTable.getValue());
							//console.log("Object1:::"+timeRefTable.getKey()+":Time::::"+timeRefTable.getValue().num);
							
							//var pageObj = timeRefTable.getValue();
							timeDuration = timeRefTable.getKey();;
							startTime = new Date().getTime();
							nextPlayingObjKey = timeRefTable.getKey();
							//console.log("###########################");
							runningTimerId = setTimeout('checkPageAndDrawObj('+timeRefTable.getKey()+')',timeRefTable.getKey());
						}
						sliderMoveTime = Math.floor(recFileDuration / 100);
						//console.log("-----sliderMoveTime-------"+sliderMoveTime);
						startSlide();
					}
					playingFrom = -1;
					break;
				case 2: // Play when slider moved
					 //console.log("----Current Audio time In Listner-----------------"+myVid.currentTime);
					
					 ctx.clearRect(0, 0, canvas.width, canvas.height);
					 restore();
					 var playingStartTime = sliderPos*recFileDuration / 100;
					// myVid.currentTime  = currentAudioTime;
					 if(currentAudioTime != null){
						timeRefTable.moveFirst();
						//console.log("timeRefTable:::::"+timeRefTable);
						var currentPage = document.getElementById("pagenum").value;
						//console.log("33333333333333333333333");
						drawNonRecordingObject(currentPage);
						var objectTable = pageObjTable.get(currentPage);
						playCount = 0;
						while(timeRefTable.next()){
							playCount++;
							if(timeRefTable.getKey()<playingStartTime){
								var recordedObjArr = timeRefTable.getValue();
								for(var i=0;i<recordedObjArr.length;i++){
									var pageObj = recordedObjArr[i];
									if(pageObj.num == currentPage){
									//console.log("-&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&");
										drawObject(objectTable,pageObj.objectId,false);
									}else{
										continue;
									}
								}
							}else{
								var nextObjTime = timeRefTable.getKey();
								playCount--;
								//console.log("nextObjTime:::::"+nextObjTime+"::::currentAudioTime:::"+playingStartTime+":::playCount"+playCount);
								
								//console.log("@@@@@@@@@@@@@@@@@@@");
								runningTimerId = setTimeout('checkPageAndDrawObj('+nextObjTime+')',(nextObjTime - playingStartTime));
								
								break;
							}
						}
						myVid.controls = false;
						myVid.play();
						document.getElementById("recordButton").className = "recinactive";
						isPlayingStoped = false;
						document.getElementById("playpause").className  = "pause";
						currentAudioTime = null;
						//console.log("::::::::::sliderMoveTime:::::::::"+sliderMoveTime);
						if(sliderMoveTime ==  null){
							sliderMoveTime = Math.floor(recFileDuration / 100);
						}
						startSlide();
						//alert("done");
			
					}
					playingFrom = -1;
					break;
				case 3: // Play when play from shape works
					var id = objectTimeTable.get(selObjArray[0]);
					//myVid.play();
					
					myVid.controls = false;
					myVid.play();
					document.getElementById("recordButton").className = "recinactive";
					isPlayingStoped = false;
					document.getElementById("playpause").className  = "pause";
					if(sliderMoveTime ==  null){
						sliderMoveTime = Math.floor(recFileDuration / 100);
					}
					checkAndMergeTimeRefTable();
					timeRefTable = sortObjectTimeTable(timeRefTable);
					restoreAndPlayObject(id);
					selObjArray =  null;
					selObjArray = new Array();
					enableDisableRelationOptions(false);
					playingFrom = -1;
					break;
			}
	
	

		//alert("playable-----------");
		
	     /* if(!isPlayingStoped && currentAudioTime == null){
				canvas.style.cursor  = "default";
				//console.log("Play file name:::"+myVid.src);
				myVid.controls = true;
				myVid.play();
				
				drawNonRecordingObject("1");
				timeRefTable.moveFirst();
				//console.log("timeRefTable:::::"+timeRefTable);
				playCount = 0;
				if(timeRefTable.next()){
					//alert(timeRefTable.getKey());
					//alert(timeRefTable.getValue());
					//console.log("Object1:::"+timeRefTable.getKey()+":Time::::"+timeRefTable.getValue().num);
					var pageObj = timeRefTable.getValue();
					timeDuration = timeRefTable.getKey();;
					startTime = new Date().getTime();
					nextPlayingObjKey = timeRefTable.getKey();
					
					
					runningTimerId = setTimeout('checkPageAndDrawObj('+timeRefTable.getKey()+')',timeRefTable.getKey());
				}
				sliderMoveTime = Math.floor(recFileDuration / 100);
				//console.log("-----sliderMoveTime-------"+sliderMoveTime);
				startSlide();
			}else if(currentAudioTime != null){
				timeRefTable.moveFirst();
				//console.log("timeRefTable:::::"+timeRefTable);
				var currentPage = document.getElementById("pagenum").value;
				drawNonRecordingObject(currentPage);
				var objectTable = pageObjTable.get(currentPage);
				while(timeRefTable.next()){
					if(timeRefTable.getKey()<currentAudioTime){
						var pageObj = timeRefTable.getValue()
						if(pageObj.num == currentPage){
							drawObject(objectTable,pageObj.objectId,false);
						}else{
							continue;
						}
					}else{
						var nextObjTime = timeRefTable.getKey();
						//console.log("nextObjTime:::::"+nextObjTime+"::::currentAudioTime:::"+currentAudioTime);
						runningTimerId = setTimeout('checkPageAndDrawObj('+nextObjTime+')',(nextObjTime - currentAudioTime));
						myVid.play();
						currentAudioTime = null;
						startSlide();
						break;
					}
				}
			
			}
			*/
			
							
	});
	myVid.addEventListener("ended", function(_event) {
	//console.log("2222222222222222222222222222222222222");
	     isPlayingStoped = true;
		 document.getElementById("playpause").className = "play";
		 nextPlayingObjKey  = null;
		 nextPlayingObjtime = null;
		 isPaused = false;
		 startTime = 0;
		 //console.log(" clearTimeout(sliderTimer)111111111111111");
		 clearTimeout(runningTimerId);	
		 clearTimeout(sliderTimer);
		 clearTimeout(playerTimer);
		 document.getElementById("recordButton").className = "record";
		 document.getElementById("cTime").innerHTML = "<b>00:00</b>";
		 sliderPos = 0;
		 pointerImg.style.left = -50 +"px";
		 pointerImg.style.top = -50 + "px";
		 pointerX = 0;
		 pointerY = 0;
		 jQuery('#ex1').slider('setValue',sliderPos);
		 // Sort timeReftable to manage new attach object while playing
		 timeRefTable= sortObjectTimeTable(timeRefTable);
		// isDrawing = true;
		 //alert("end");
	});
	myVid.addEventListener("loadedmetadata", function(_event) {
			var duration = myVid.duration;
			recFileDuration = duration * 1000;
			duration = getDurationInMinAndSec(recFileDuration);
			/*
			var time = Math.round(duration);
			var min = Math.floor(time / 60);
			var sec = time % 60;
			*/
			if(recFileDuration >0){
				document.getElementById("rwButton").disabled = false;
				document.getElementById("recordButton").className = "record";
				document.getElementById("stopButton").disabled = false;
				document.getElementById("playpause").disabled = false;
				document.getElementById("ffButton").disabled = false;
			}
			document.getElementById("eTime").innerHTML = "<b>"+duration+"</b>";
			document.getElementById("cTime").innerHTML = "<b>00:00</b>";
			
			switch(playingFrom){
					case 1:
						break;
					case 2://  when slider moved
						//console.log("-----loadedmetadata------sliderPos-------"+sliderPos+"::recFileDuration::"+recFileDuration);
						currentAudioTime  = sliderPos*recFileDuration / 100;
						//console.log("-----loadedmetadata------currentAudioTime-------"+currentAudioTime);
						currentAudioTime =  Math.ceil(currentAudioTime / 1000);
						myVid.currentTime  = currentAudioTime;
						break;
					case 3:  // when play from shape works
						//console.log("loadedmetadata editor page");
						if(selObjArray!= null){
							var id = objectTimeTable.get(selObjArray[0]);
							//console.log("id:%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"+id);
							if(id== null){
								alert("------Selcted Object is not playable----------");
							}else{
								myVid.currentTime = (id/1000);
							}
							//console.log("Set current media time"+myVid.currentTime);
							
						}else{
							alert("pls select object");
						}
						break;
				}
			
			
			
			
			
			//console.log("duration:"+recFileDuration);
	
	});
	myVid.addEventListener("play", function(_event) {
	     //console.log("^^^^^^^^^^^^^^^Play Start---------------");
		 setplayingTimeInPlayer();
	});

}

function setPlayerTime(){
	var time = 256;
	myVid.currentTime = time;
	//console.log(myVid.currentTime);
}

function playfromObject(){
	if(!isRecRunning){
		if(selObjArray!= null){
				var id = objectTimeTable.get(selObjArray[0]);
				//console.log("id:%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"+id);
				if(id== null){
					alert("------Selcted Object is not playable----------");
				}else{
					playingFrom = 3;
					if(myVid.src == null || myVid.src == ''){
						myVid.src = "http://"+window.location.host+"/"+filename;
						
					}else{
						myVid.currentTime = (id/1000);
						//console.log("Set current media time"+myVid.currentTime);
						myVid.play();
					}
					
				}
		}else{
			alert("pls select object");
		}
	}
}
function getAllPages(fileName){
	//return;
	//alert("fileName::;"+fileName);
	canvas.style.cursor  = "wait";
	  jQuery.ajax({
		  	type:	"get",
	  		url: 	"getallpages.action",
	  		data: 	"fileName="+fileName,
		  		success:function(msg) {
		  			//alert(msg.parentId);
		  			
		  			if(msg.actionErrors != null)
		  			{
		  				alert("error");
		  		  	}else{
		  		  		//alert("showchild"+msg.imageUrl);
		  		  		var googleDocViewerUrl = "https://docs.google.com/viewer";
		  		  		var imageUrl = googleDocViewerUrl + "?url=" +encodeURIComponent(msg.imageUrl);
		  		  		var pageCount = msg.pageCount;
		  		  		var currentpage = parseInt(document.getElementById("pagenum").value);
		  		  		for(i=0;i<pageCount;i++){
		  		  			var pageNum = currentpage + (i);
		  		  			var url = imageUrl + "&a=bi&pagenumber="+(i+1);
		  		  			/*
							if(i==0)
		  		  			 	tempArray = insertImageObj(pageNum,url);
		  		  			else*/
								tempArray = null;
								tempArray =  new Array();
								tempArray[0] = imageX;
								tempArray[1] = imageY;
								tempArray[2] = canvas.width - imageX;
								tempArray[3] = canvas.height - (2*imageY);
								var graphicsObj = insertImageObj(pageNum,url,false,fileName);
								if(currentpage == pageNum){
									loadImage(url,graphicsObj.id);
								}
								
		  		  		}
						dropedFileTimeTab.remove(fileName);
						//console.log("44444444444444444444444");
						canvas.style.cursor = "default";
						// close modal window here
						$('#progress-Modal').modal('hide');
						/*
		  		  	 	imageUrl = imageUrl + "&a=bi&pagenumber=1";
		  		  	 	loadImage(imageUrl);
						*/
		  		  		//drawImage(tempArray[0],tempArray[1],tempArray[2],tempArray[3],imageUrl);	
		  		  		//showChild(msg.parentId,msg.childList,false);
		  		  	}
		  			
		  		}});
	 
}
function showAndInsertImageObject(fileName){
		//var url = 'http://ec2-54-87-226-240.compute-1.amazonaws.com/mettingupload/'
		var url = "http://"+window.location.host+"/mettingupload/"+fileName;
		alert("url::"+url);
		tempArray = null;
		tempArray =  new Array();
		tempArray[0] = imageX;
		tempArray[1] = imageY;
		tempArray[2] = canvas.width - imageX;
		tempArray[3] = canvas.height - (2*imageY);
		var graphicsObj = insertImageObj(document.getElementById("pagenum").value,url,false,fileName);
		loadImage(url,graphicsObj.id);
		dropedFileTimeTab.remove(fileName);
		//console.log("44444444444444444444444");
		// close modal window here
		$('#progress-Modal').modal('hide');
		
}

function uploadVideo(files){
	//alert("upload called--------------------");
	 var formData =new FormData();
	 for(var i=0;i<files.length;i++){
		 formData.append("attachment",files[i]); 
	 }
	 // open upload modal here and send message to upload modal window
	 var type = 'Video';
	 showUploadModal(type);
	 var uploadFileName;
	  jQuery.ajax({
		  	type:	"POST",
	  		url: 	"uploadvideo.action",
	  		data: 	formData,
	  		cache: false,
	  		dataType: "json",
	  		processData:false,
	  		contentType :false,
		  		success:function(msg) {
		  			//alert(msg.uploadFileName);
		  			uploadFileName = msg.uploadFileName;
		  			if(msg.actionErrors != null)
		  			{
		  				alert("error");
		  		  	}else{
		  		  		//alert("-------------Video Upload Done-------------"+msg.uploadFileName);
						filename =  "mettingupload/"+msg.uploadFileName;
						myVid.src = "http://"+window.location.host+"/"+filename;
						// close upload modal window here
						 $('#progress-Modal').modal('hide');
						 $('#openRecord').click();
						//alert("source file::"+myVid.src);
					}
		  		}
		  			
		  	});
	
}




function uploadDropedFiles(files,isImage){
	//alert("upload called--------------------"+isImage);
	 var formData =new FormData();
	 var fileType = null;
	 for(var i=0;i<files.length;i++){
		fileType = files[i].type;
		 formData.append("attachment",files[i]); 
	 }
	  // open upload modal here and send message to upload modal window
		showUploadModal(fileType)
	
	 var uploadFileName;
	  jQuery.ajax({
		  	type:	"POST",
	  		url: 	"uploadTemp.action",
	  		data: 	formData,
	  		cache: false,
	  		dataType: "json",
	  		processData:false,
	  		contentType :false,
		  		success:function(msg) {
		  			alert(msg.uploadFileName);
		  			uploadFileName = msg.uploadFileName;
		  			if(msg.actionErrors != null)
		  			{
		  				alert("error");
		  		  	}else{
		  		  		//alert("-------------Upload Done-------------");
						
						//alert("get all pages::"+uploadFileName);
						clearDropZone();
						if(uploadFileName != null){
							if(isImage){
								showAndInsertImageObject(uploadFileName);
							}else{
								getAllPages(uploadFileName);
							}
						}
						
					}
		  		}
		  			
		  	});
	
}

function showUploadModal(obj){
	//console.log("hiii");
	$('#progress-Modal').modal('show');
	document.getElementById("fileType").innerHTML= '<strong>'+ obj+'</strong>';
}

function createDropZone(){
	ctx.save();
	ctx.beginPath();
	ctx.strokeStyle = "#D3D3D3";
	ctx.lineWidth= 3;
	ctx.setLineDash([7]);
	createRectangle(0, 0, canvas.width , canvas.height );
	ctx.fillStyle= "#FF0000";
	ctx.font="50px Georgia";
	ctx.fillText("Drop Files Here...",100,100);
	ctx.globalAlpha= 0.8;
	ctx.fillStyle= "#000000";
	ctx.fillRect(0, 0, canvas.width , canvas.height);
	//createRectangle(10, 10, 1270 , 600 );
	ctx.closePath();
	ctx.stroke();
	ctx.restore();
}
function clearDropZone(){
	ctx.clearRect(0, 0, canvas.width, canvas.height);
	restore();
}	

function createWaitZone(){
	ctx.save();
	ctx.beginPath();
	ctx.strokeStyle = "#000000";
	ctx.lineWidth= 3;
	ctx.setLineDash([7]);
	createRectangle(0, 0, canvas.width , canvas.height);
	ctx.font="50px Georgia";
	ctx.fillText("Loading Document...",100,100);
	ctx.globalAlpha= 0.8;
	ctx.fillStyle= "#5F6466";
	ctx.fillRect(0, 0, canvas.width , canvas.height);
	//createRectangle(10, 10, 1270 , 600 );
	ctx.closePath();
	ctx.stroke();
	ctx.restore();
}
function clearWaitZone(){
	ctx.clearRect(0, 0, canvas.width, canvas.height);
	restoreAllExceptImage();
}	

	
function handleMouseClick(e){
	var x = parseInt(e.clientX - offsetX);
	var y = parseInt(e.clientY - offsetY);	
	
	//getMetadataToFront(x,y);	
}
function getMetadataToFront(x,y){
	//console.log("x::"+x+"::y::"+y);
	//alert(point_in_rectagnle(x,y,350,35,850,435));
	if(point_in_rectagnle(x,y,350,35,850,435)){
		document.getElementById("div1").style.zIndex = 5;
	}else{
		document.getElementById("div1").style.zIndex = -1;
	}
}

/*
*/
function handleMouseUp(e) {
	var pageNum = document.getElementById("pagenum").value;
	var objectTable = pageObjTable.get(pageNum);
	var mouseX = parseInt(e.clientX - offsetX);
	var mouseY = parseInt(e.clientY - offsetY);
//console.log("handleMouseUp:::");
	if(isDrawing){
		var tempPointsArray = new Array();
		if(currentObjId == 4){
			freeHandQdArr[freeHandQdArr.length] = mouseX;
			freeHandQdArr[freeHandQdArr.length] = mouseY;
			createObject(currentObjId,startX,startY,mouseX,mouseY,triEndX,triEndY);
			tempPointsArray = freeHandQdArr;
			freeHandQdArr = null;
		}else if(currentObjId == 5 || currentObjId == 11){
			 //console.log("triEndX::"+triEndX);
			 if(triEndX == null && triEndY == null){
				  triEndX = mouseX;
				  triEndY = mouseY;
				  return;
			 }else{
			 //console.log("startX::"+startX+"::startY::"+startY+"::mouseX:;"+mouseX+"::mouseY:;"+mouseY);
				tempPointsArray[tempPointsArray.length] = startX;
				tempPointsArray[tempPointsArray.length] = startY;
				tempPointsArray[tempPointsArray.length] = mouseX;
				tempPointsArray[tempPointsArray.length] = mouseY;
				tempPointsArray[tempPointsArray.length] = triEndX;
				tempPointsArray[tempPointsArray.length] = triEndY;
				
				triEndX = null; 
				triEndY = null;
			}
		}else if(currentObjId == 12  && tempCirclePointsArray.length == 4){
				// thsi code needs to review
				tempPointsArray[tempPointsArray.length] = tempCirclePointsArray[0];
				tempPointsArray[tempPointsArray.length] = tempCirclePointsArray[1];
				tempPointsArray[tempPointsArray.length] = tempCirclePointsArray[2];
				tempPointsArray[tempPointsArray.length] = tempCirclePointsArray[3];
				tempCirclePointsArray = new Array();
				var sqrPoint = getCircleBoundedSquareQuard(tempPointsArray[0],tempPointsArray[1],tempPointsArray[2],tempPointsArray[3]);
				tempPointsArray[0] = sqrPoint.x1;
				tempPointsArray[1] = sqrPoint.y1;
				tempPointsArray[2] = sqrPoint.x2;
				tempPointsArray[3] = sqrPoint.y2;
					
		}else if(currentObjId == 1 || currentObjId == 2 || currentObjId == 23){
				tempPointsArray[tempPointsArray.length] = tempCirclePointsArray[0];
				tempPointsArray[tempPointsArray.length] = tempCirclePointsArray[1];
				tempPointsArray[tempPointsArray.length] = tempCirclePointsArray[2];
				tempPointsArray[tempPointsArray.length] = tempCirclePointsArray[3];
				tempPointsArray[tempPointsArray.length] = tempCirclePointsArray[4];
				tempPointsArray[tempPointsArray.length] = tempCirclePointsArray[5];
				tempPointsArray[tempPointsArray.length] = tempCirclePointsArray[6];
				tempPointsArray[tempPointsArray.length] = tempCirclePointsArray[7];
				tempCirclePointsArray = new Array();
		
		}else{
				tempPointsArray[tempPointsArray.length] = startX;
				tempPointsArray[tempPointsArray.length] = startY;
				tempPointsArray[tempPointsArray.length] = mouseX;
				tempPointsArray[tempPointsArray.length] = mouseY;
				if(currentObjId == 13){
					var pt = getEquilateralTriangletThirdPoint(tempPointsArray[0],tempPointsArray[1],tempPointsArray[2],tempPointsArray[3]);
					tempPointsArray[tempPointsArray.length] = pt.x3;
					tempPointsArray[tempPointsArray.length] = pt.y3;
				}
				
		}
		//console.log("tempPointsArray:111111::"+tempPointsArray);
		if(currentObjId != 7){
			count++;
			var isFilled = false;
			if(fillColor != null){
				isFilled = true;
			}
			if(currentObjId != 16){
				//console.log("tempPointsArray:222222222::"+tempPointsArray);
				var graphicsObject = new GraphicsObject(count,currentObjId,tempPointsArray,lineWidth,styleColor,null,isFilled,fillColor,globalAlpha,false,null,null);
				if(objectTable == null){
					objectTable = new Hashtable();
					pageObjTable.put(pageNum,objectTable);
				}
				objectTable.put(count, graphicsObject);
				objectPageRefTable.put(count,pageNum);
				//console.log("objectTable:222222222::"+objectTable);
			}
			if(isReplaceEnable){
				replacedObjArr[replacedObjArr.length] = count;
			}
			isDrawing = false;			
		}else{
			// code needs to review
			//console.log("################################");
			isDrawing = false;
			canvas.style.cursor = "default";
			rectangleSelObject = new GraphicsObject(-1,currentObjId,tempPointsArray,lineWidth,styleColor,null,false,null,null,false,null,null);
			if(objectTable != null){
				checkObject(objectTable,startX,startY,mouseX,mouseY);
				if(selObjArray!= null){
					for(var i=0;i<selObjArray.length;i++){
						var graphicsObject = objectTable.get(selObjArray[i]);
						var graphicsObject = objectTable.get(selObjArray[i]);
						showSelectedObject(graphicsObject);
					}
				}
			}
			startX = null;
			startY = null;
		}
		if(!isPlayingStoped ){// Inserting object while playing
				currentMiliSec =Math.floor(myVid.currentTime * 1000);
				var pageObject = new PageObject(document.getElementById("pagenum").value,count);
				insertObjectInPlayingStream(currentMiliSec,pageObject);
		}else if(startTime != 0 && isPlayingStoped){// Inserting object while recording
				var currentTime = new Date().getTime();
				currentMiliSec = recFileDuration + Math.ceil(currentTime - startTime);
				//console.log("mouse up::pagenumber:"+document.getElementById("pagenum").value);
				var pageObject = new PageObject(document.getElementById("pagenum").value,count);
				objectTimeTable.put(count,currentMiliSec);
				var recordedObjArr = timeRefTable.get(currentMiliSec);
				if(recordedObjArr ==  null){
					recordedObjArr = new Array();
				}
				recordedObjArr[recordedObjArr.length] = pageObject;
				timeRefTable.put(currentMiliSec,recordedObjArr);
				//console.log("timeRefTable::;"+timeRefTable);
		}else{ // Non recodring object
			var nonRecordingObjArray = nonRecordinPageObjTable.get(document.getElementById("pagenum").value);
			if(nonRecordingObjArray == null){
				nonRecordingObjArray = new Array();
				nonRecordinPageObjTable.put(document.getElementById("pagenum").value,nonRecordingObjArray);
			}
			nonRecordingObjArray[nonRecordingObjArray.length] = count;
		}
		
		
	}else{
		if(currentObjId == 7){
			//console.log("&&&&&&&&&&&&&&&&&&&&&&&&&");
			var tempPointsArray = new Array();
			tempPointsArray[tempPointsArray.length] = startX;
			tempPointsArray[tempPointsArray.length] = startY;
			tempPointsArray[tempPointsArray.length] = mouseX;
			tempPointsArray[tempPointsArray.length] = mouseY;
			canvas.style.cursor = "default";
			rectangleSelObject = new GraphicsObject(-1,currentObjId,tempPointsArray,lineWidth,styleColor,null,false,null,null,false,null,null);
			if(objectTable != null){
				checkObject(objectTable,startX,startY,mouseX,mouseY);
				//console.log("objjjjjjjjjjjjjj"+selObjArray);
				if(selObjArray!= null){
					for(var i=0;i<selObjArray.length;i++){
						//console.log("hii");
						var graphicsObject = objectTable.get(selObjArray[i]);
						var graphicsObject = objectTable.get(selObjArray[i]);
						showSelectedObject(graphicsObject);
					}
				}
			}
			startX = null;
			startY = null;
		}
		
  }
}

function handleMouseMove(e) {
	if (isDrawing) {
		var mouseX = parseInt(e.clientX - offsetX);
		var mouseY = parseInt(e.clientY - offsetY);		
		if(currentObjId == 4){
				  var appPoint = exSmooth(mouseX,mouseY,startX,startY); 
				  freeHandQdArr[freeHandQdArr.length] = appPoint.x;
				  freeHandQdArr[freeHandQdArr.length] = appPoint.y;
				  createObject(currentObjId,startX,startY,appPoint.x,appPoint.y,triEndX,triEndY);
				  startX = appPoint.x;
				  startY = appPoint.y;
		}else if(currentObjId == 16){
			// text
		}else{
			createObject(currentObjId,startX,startY,mouseX,mouseY,triEndX,triEndY);
		}
	}else{
		if(currentObjId == 7){
			var mouseX = parseInt(e.clientX - offsetX);
			var mouseY = parseInt(e.clientY - offsetY);
			var objectTable = pageObjTable.get(document.getElementById("pagenum").value);
			if(dragFlag){
				//console.log("mouse move::"+strechableObj);
				if(strechableObj.length >0 && strechableObj[0] != null && dragFlag){
					if(isRotaionEnable){
						
						rotateSelectedObject(objectTable,mouseX,mouseY);
						startX = mouseX;
						startY = mouseY;
					}else{
						stretchSelectedObject(strechableObj,mouseX,mouseY);
					}
				}else if(selObjArray != null && selObjArray.length>0){
						translateSelectedObject(objectTable,mouseX,mouseY);
						startX = mouseX;
						startY = mouseY;
				}else if(rectangleSelObject != null){
			   		var pointsArr = rectangleSelObject.pointsArray
					if(objectTable != null){
						checkObject(objectTable,pointsArr[0],pointsArr[1],pointsArr[2],pointsArr[3]);
					}
					translateSelectedObject(objectTable,mouseX,mouseY);
					startX = mouseX;
					startY = mouseY;
				}else{
						//Create rubberband rectangle
						ctx.setLineDash([5]);
						createObject(7,startX,startY,mouseX,mouseY,null,null,null)
				}
			}else{
				if(selObjArray != null && selObjArray.length>0 ){
					if(isZoomEnable){
						checkSelectedObjectZoomableState(objectTable,mouseX,mouseY);
					}else{
						checkSelectedObjectStrechableState(objectTable,mouseX,mouseY);
					}
					
				}
			}
		}
	
	}
}	
	
function handleMouseDown(e){

	if(triEndX == null){
		startX = parseInt(e.clientX - offsetX);
		startY = parseInt(e.clientY - offsetY);
	}
	
	if(currentObjId == 7){
	   // case 1: points can be inside object (Select or deselect object)
	   // case 2: points can be outside of all all object (set start points for rubberband tool)
		var objectTable = pageObjTable.get(document.getElementById("pagenum").value);
		if(isZoomEnable && zoomableObj != null){
			zoomImage(zoomableObj);
			return;
		}
		var objArr = checkPointsInObject(objectTable,true);
		if(objArr.length != 0){
			if(isEditTimerEnable){
				editRecordedObjectTime(objArr);
				return;
			}else if(!isPlayingStoped ){
				currentMiliSec =Math.floor(myVid.currentTime * 1000);
				var pageObject = new PageObject(document.getElementById("pagenum").value,objArr[0]);
				insertObjectInPlayingStream(currentMiliSec,pageObject);
				var graphicsObject = objectTable.get(objArr[0]);
				showSelectedObject(graphicsObject);
			    return;
		   }else{
				var pos = checkObjInSelList(selObjArray,objArr[0]);
				if(pos != -1){
					var obj = objectTable.get(objArr[0]);
					var state = checkPointsInSelectionState(obj,startX,startY);
				    if(state){
						//console.log("Ponts is in selected region----------------------");
					}else if(!isControlPressed){
						selObjArray[pos] = null;
						selObjArray.splice(pos ,1);
						var graphicsObject = objectTable.get(objArr[0]);
						if(graphicsObject.type == 8){
							// disable Zoom Button
							handleZoomButton(false);
						}
					}
					
				}else{
					if(!isControlPressed){
						if(strechableObj.length !=0 && strechableObj[1] == null){
							selObjArray =  null;
							selObjArray = new Array();
							ctx.clearRect(0, 0, canvas.width, canvas.height);
							restore();
							handleZoomButton(false);
						}
					}
					var graphicsObject = objectTable.get(objArr[0]);
					if(graphicsObject.type == 8){
						// enable Zoom Button
						handleZoomButton(true);
					}else{
						// disable Zoom Button
						handleZoomButton(false);
					}
					selObjArray[selObjArray.length] = objArr[0];
				}
				handleSelectedObject(objectTable);
			}
		}else{
			var isPointsInRB = false; 
		    //console.log("mouse down:::"+rectangleSelObject);
			if(rectangleSelObject != null ){
				var pointsArray = rectangleSelObject.pointsArray;
				if(point_in_rectagnle(startX,startY,pointsArray[0],pointsArray[1],pointsArray[2],pointsArray[3])){
					canvas.style.cursor = "move";		
					isDrawing = false;
					isPointsInRB =true;
				}else{
					rectangleSelObject = null;
					
				}
			}
			var state  =false;
			for(i=0;i<selObjArray.length;i++){
				var graphicsObject = objectTable.get(selObjArray[i]);
				var state = checkPointsInSelectionState(graphicsObject,startX,startY);
				if(state){
				  break;
					//console.log("Ponts is in selected region----------------------");
				}
			}
			//console.log("State:::"+state+"strechableObj::"+strechableObj[1]+"::"+strechableObj.length);
			if(state){
				return;
			}else if(!isControlPressed && !state && !isPointsInRB){
					if(strechableObj.length !=0 && strechableObj[1] == null){
						initSelectedObjState();
					}
			}
	
		}
	}else{
		canvas.style.cursor = "crosshair";		
		isDrawing = true
		if(currentObjId == 4){
			if(freeHandQdArr == null){
				freeHandQdArr = new Array();
			}
			for(var i = 0; i < smoothLength+1; ++i) {
				freeHandQdArr[freeHandQdArr.length] = startX;
				freeHandQdArr[freeHandQdArr.length] = startY;
			}
		}
	}
	//console.log("down done");
}
function handleSelectedObject(objectTable){
	if(selObjArray.length >0){
			for(i=0;i<selObjArray.length;i++){
				var graphicsObject = objectTable.get(selObjArray[i]);
				showSelectedObject(graphicsObject);
				
			}
		enableDisableRelationOptions(true);
	}else{
		initSelectedObjState();
	}
}
function initSelectedObjState(){
	//console.log("initSelectedObjState called");
	selObjArray =  null;
	selObjArray = new Array();
	strechableObj[0] = null;
	strechableObj[1] = null;
	strechableObj[2] = null;
	ctx.clearRect(0, 0, canvas.width, canvas.height);
	restore();
	enableDisableRelationOptions(false);
	setZoomEnableDisable(false);
}


	
//function getBoundedRectQuardinate(pointsArray){
function getMinMax(pointsArray){
	var ponitXarr = new Array();
	var ponitYarr = new Array();
	for(var i=0;i<pointsArray.length;i=i+1){
		if(i % 2==0)
			ponitXarr[ponitXarr.length] = pointsArray[i];
		else
			ponitYarr[ponitYarr.length] = pointsArray[i];
		}
	ponitXarr = ponitXarr.sort(function(a, b){return a-b});	
	ponitYarr = ponitYarr.sort(function(a, b){return a-b})
	//console.log("Xarray::"+ponitXarr);	
	//console.log("YArray::"+ponitYarr);	
	return {minX:ponitXarr[0],minY:ponitYarr[0],maxX:ponitXarr[ponitXarr.length-1],maxY:ponitYarr[ponitYarr.length-1]};
 
}
function editRecordedObjectTime(objArr){
	var time = objectTimeTable.get(objArr[0]);
	if(time == null){
		alert("Selected object is not recorded object");
	}else{
		selObjArray = null;
		selObjArray = new Array();;
		selObjArray[selObjArray.length] = objArr[0];
		document.getElementById("selRecordObj").value = time;
		document.getElementById("recordObjTimeDiv").style.display = "inline-block";
		var objectTable = pageObjTable.get(document.getElementById("pagenum").value);
		var graphicsObject = objectTable.get(objArr[0]);
		showSelectedObject(graphicsObject);
	}


}
function sortObjectTimeTable(mergedTimeRefTable){
	//console.log("timeRefTable::;"+timeRefTable.hash);
    var timeArray = new Array();
	var sortedRefTable = new Hashtable();
	// copy keys to time Array
		mergedTimeRefTable.moveFirst();
		var ctr = 0;
		while(mergedTimeRefTable.next()){
			timeArray[ctr] = mergedTimeRefTable.getKey();
			ctr++;
		}
		
	timeArray = timeArray.sort(function(a, b){return a-b});
	//console.log("Sort timeArray::"+timeArray);
	for(var i=0;i<timeArray.length;i++){
		//console.log("timeRefTable::;"+timeArray[i]);
		sortedRefTable.put(timeArray[i],mergedTimeRefTable.get(timeArray[i]));
	}
	return sortedRefTable;
}

function checkAndMergeTimeRefTable(){
	//console.log("checkAndMergeTimeRefTable:::"+repTimeRefTable);
	//console.log("Before Merged timeRefTable:::"+timeRefTable);
	if(repTimeRefTable != null){
		checkAndManageObjectInTable();
		//console.log("checkAndMergeTimeRefTable::2222222:"+repTimeRefTable);
		//repTimeRefTable.add(timeRefTable);
		addTable(timeRefTable,repTimeRefTable);
		var sortedTimeRefTable = sortObjectTimeTable(repTimeRefTable);
		timeRefTable = null;
		repTimeRefTable = null;
		timeRefTable = sortedTimeRefTable ;
	}
	//console.log("Afetr Merged timeRefTable:::"+timeRefTable);
}
function addTable(sourceTab,destTab){
	//console.log("sourceTab::"+sourceTab+"::destTab::"+destTab);
	if(sourceTab != null && destTab != null){
		sourceTab.moveFirst();
		while(sourceTab.next()){
			destTab.put(sourceTab.getKey(),sourceTab.getValue());
		}
	}
	return destTab;
}


function checkAndManageObjectInTable(){
	repTimeRefTable.moveFirst();
	while(repTimeRefTable.next()){
		var objRecTime = repTimeRefTable.getKey();
		var recordedObjArr = repTimeRefTable.getValue();
			for(var i=0;i< recordedObjArr.length;i++){
			var pageObj = recordedObjArr[i];
				if(pageObj != null){
					var pageNum = pageObj.num;
					var objId = pageObj.objectId;
					//console.log("Attach Object Time:::"+objRecTime);
					var prevTime = objectTimeTable.get(objId);
					//console.log("prevTime:::"+prevTime);
					if(prevTime != null){
						//console.log("Already recorded object");
						// For Recorded object
						timeRefTable.remove(prevTime);
						
					}else{
						
						// For non recorded object Or New Added Object
						var nonRecordingObjArray = nonRecordinPageObjTable.get(pageNum);
						//console.log("Non recorded object"+nonRecordingObjArray);
						if(nonRecordingObjArray != null){
							//console.log("if case -----"+objId);
							var pos = checkObjInSelList(nonRecordingObjArray,objId);
							//console.log("if case pos-----"+pos);
							if(pos != -1){
								// Non recorded Object
								nonRecordingObjArray[pos] = null;
								nonRecordingObjArray.splice(pos ,1);
								nonRecordinPageObjTable.put(pageNum,nonRecordingObjArray);
							}else{
								// New Added recording Object
							}
							//console.log("nonRecordingObjArray:::"+nonRecordingObjArray);
						}
					}
				  objectTimeTable.put(objId,objRecTime);
				}
			}
	
		}

	
	
	/*
	objectTimeTable.put(objId,currentMiliSec);
	var pageObject = new PageObject(document.getElementById("pagenum").value,objId);
	timeRefTable.put(currentMiliSec,pageObject);
	//console.log("attachObjectInplayingStream objectTimeTable:"+objectTimeTable);
	*/
}

function insertObjectInPlayingStream(currentMiliSec,pageObject){
	  if(parseInt(recFileDuration) < parseInt(currentMiliSec)){
		alert("Invalid time");
		return;
	  }
	
	if(repTimeRefTable == null){
		repTimeRefTable = new Hashtable();
		//repTimeRefTable.add(timeRefTable);
	}
	var recordedObjArr = repTimeRefTable.get(currentMiliSec);
	if(recordedObjArr ==  null){
		recordedObjArr = new Array();
	}
	recordedObjArr[recordedObjArr.length] = pageObject
	repTimeRefTable.put(currentMiliSec,recordedObjArr);
	//console.log("insertObjectInPlayingStream:::"+repTimeRefTable);
}


 function dist(x1,y1,x2,y2) { 
		var x = x1-x2; 
		var y = y1-y2; 
	
	return x*x+y*y;
} 


function exSmooth_1(ps) { 
	// //console.log("exSmooth:::"+ps);
	  var a = 0.2; 
	  var x1 = ps[ps.length-2];
	  var y1 = ps[ps.length-1];
	  var x2 = ps[ps.length-4];
	  var y2 = ps[ps.length-3];
	  
	  var p = ps[ps.length-1] 
	  var p1 = ps[ps.length-2]; 
	  
	  ps[ps.length-2] = x1 * a + x2 * (1-a);
	  ps[ps.length-1] = y1 * a + y2 * (1-a);
  
 // ps[ps.length-1] = {x:p.x * a + p1.x * (1-a), y:p.y * a + p1.y * (1-a) } 
}


function exSmooth(x1,y1,x2,y2) { 
	 //console.log("exSmooth:::x::"+x1+":::y::"+y1);
	  var a = 0.2; 
	  /*
	  var x1 = ps[ps.length-2];
	  var y1 = ps[ps.length-1];
	  var x2 = ps[ps.length-4];
	  var y2 = ps[ps.length-3];
	  
	  var p = ps[ps.length-1] 
	  var p1 = ps[ps.length-2]; 
	  */
	 /* ps[ps.length-2] = x1 * a + x2 * (1-a);
	  ps[ps.length-1] = y1 * a + y2 * (1-a);
  */
	//console.log("x::"+(x1 * a + x2 * (1-a))+"::y::"+(y1 * a + y2 * (1-a)));
     return {x:x1 * a + x2 * (1-a), y:y1 * a + y2 * (1-a)} 
}




 function drawFreeHandLine(points) { 
 //console.log("drawLine::;"+points);
  ctx.moveTo(points[0], points[1]); 
  for(var i = 2; i < points.length; i=i+2) { 
	ctx.lineTo(points[i], points[i+1]); 
  } 
  
} 
	
function createObject(id,startx,starty,mouseX,mouseY,endX,endY,text){
	//console.log("createObject---------------lineWidth----"+lineWidth);
	ctx.save();
	ctx.restore();
	
	ctx.globalAlpha = 1.0;
	ctx.setLineDash([0]);
	switch(id){
		case 1:
			ctx.clearRect(0, 0, canvas.width, canvas.height);
			restore();
			ctx.beginPath();
			ctx.lineCap = 'butt';
			ctx.lineJoin = 'miter';
			ctx.strokeStyle = styleColor;
			ctx.lineWidth= lineWidth;
			ctx.globalAlpha = globalAlpha;
			var cx = startx; 
			var cy = mouseY;
			var dx = mouseX;
			var dy = starty;
			tempCirclePointsArray[0] = startx;
			tempCirclePointsArray[1] = starty;
			tempCirclePointsArray[2] = cx;
			tempCirclePointsArray[3] = cy;
			tempCirclePointsArray[4] = mouseX;
			tempCirclePointsArray[5] = mouseY;
			tempCirclePointsArray[6] = dx;
			tempCirclePointsArray[7] = dy;
			
			
			createRectangle(startx, starty, cx, cy, mouseX , mouseY , dx, dy);
			if(fillColor != null){
				ctx.fillStyle = fillColor;
				ctx.fill();
			}
			
			ctx.closePath();
			ctx.stroke();
			break;
		case 2:
			ctx.clearRect(0, 0, canvas.width, canvas.height);
			restore();
			ctx.beginPath();
			ctx.lineCap = 'butt';
			ctx.lineJoin = 'miter';
			ctx.strokeStyle = styleColor;
			ctx.lineWidth= lineWidth;
			ctx.globalAlpha = globalAlpha;
			var cx = startx; 
			var cy = mouseY;
			var dx = mouseX;
			var dy = starty;
			tempCirclePointsArray[0] = startx;
			tempCirclePointsArray[1] = starty;
			tempCirclePointsArray[2] = cx;
			tempCirclePointsArray[3] = cy;
			tempCirclePointsArray[4] = mouseX;
			tempCirclePointsArray[5] = mouseY;
			tempCirclePointsArray[6] = dx;
			tempCirclePointsArray[7] = dy;
			
			
			createOvalNew(startx, starty, cx, cy, mouseX , mouseY , dx, dy);
			if(fillColor != null){
				ctx.fillStyle = fillColor;
				ctx.fill();
			}
			
			ctx.closePath();
			ctx.stroke();
			break;
		case 3:
			ctx.clearRect(0, 0, canvas.width, canvas.height);
			restore();
			ctx.beginPath();
			ctx.lineCap = 'butt';
			ctx.lineJoin = 'miter';
			ctx.strokeStyle = styleColor;
			ctx.lineWidth= lineWidth;
			ctx.globalAlpha = globalAlpha;
			createLine(startx, starty, mouseX , mouseY );
			//points_is_onLine(startx, starty, mouseX , mouseY );
			//ctx.closePath();
			ctx.stroke();
			break;
		case 4:
			//ctx.clearRect(0, 0, canvas.width, canvas.height);
		/* 	pencilPath.strokeWidth = 2;
			pencilPath.smooth(); */
			/*ctx.clearRect(0, 0, canvas.width, canvas.height);
			restore();*/
			ctx.beginPath();
			ctx.lineCap = 'round';
			ctx.lineJoin = 'round';
			ctx.strokeStyle = styleColor;
			ctx.lineWidth= lineWidth;
			ctx.globalAlpha = globalAlpha;
			//drawFreeHandLine(freeHandQdArr);
			createLine(startx, starty, mouseX , mouseY );
			//restore();
			//console.log("actual Points::"+startx+","+starty+","+mouseX+","+mouseY);
			//ctx.globalAlpha= 0.8;
			
			//createLine(startx, starty, mouseX , mouseY );
			ctx.stroke(); 
			break;
		case 5:
			ctx.clearRect(0, 0, canvas.width, canvas.height);
			restore();
			ctx.beginPath();
			ctx.lineCap = 'butt';
			ctx.lineJoin = 'miter';
			ctx.strokeStyle = styleColor;
			ctx.lineWidth= lineWidth;
			ctx.globalAlpha = globalAlpha;
			if(endX != null && endY != null){
				//console.log("---createTriangle----"+globalAlpha);
					createTriangle(startx,starty,mouseX,mouseY,endX,endY);
					
			}else{
				createLine(startx, starty, mouseX , mouseY );
			}
			if(fillColor != null){
				ctx.fillStyle = fillColor;
				ctx.fill();
			}
			ctx.closePath();
			ctx.stroke();
			break;
		case 6:
			ctx.clearRect(0, 0, canvas.width, canvas.height);
			restore();
			ctx.beginPath();
			ctx.lineCap = 'butt';
			ctx.lineJoin = 'miter';
			ctx.strokeStyle = styleColor;
			ctx.lineWidth= lineWidth;
			ctx.globalAlpha = globalAlpha;
			createArrow(startx, starty, mouseX , mouseY );
			ctx.closePath();
			ctx.stroke();
			break;
		case 7:
			// Code for dotted rectangle for selection
		
			ctx.clearRect(0, 0, canvas.width, canvas.height);
			restore();
			ctx.save();
			ctx.beginPath();
			ctx.strokeStyle = "#000000";
			ctx.lineWidth= 2;
			ctx.globalAlpha = globalAlpha;
			ctx.setLineDash([3]);
			createRectangle(startx, starty, mouseX , mouseY );
			ctx.closePath();
			ctx.stroke();
			ctx.restore();
			break;
		case 8:
			ctx.clearRect(0, 0, canvas.width, canvas.height);
			restore();
			ctx.beginPath();
			drawImage(startx, starty, mouseX , mouseY );
			ctx.closePath();
			ctx.stroke();
			break;
		case 9:
			ctx.clearRect(0, 0, canvas.width, canvas.height);
			restore();
			ctx.beginPath();
			ctx.strokeStyle = styleColor;
			ctx.lineWidth= lineWidth;
			ctx.globalAlpha = globalAlpha;
			createLine(startx, starty, mouseX , mouseY );
			//points_is_onLine(startx, starty, mouseX , mouseY );
			ctx.closePath();
			ctx.stroke();
			break;
		case 10:
			ctx.clearRect(0, 0, canvas.width, canvas.height);
			restore();
			ctx.save();
			ctx.beginPath();
			ctx.strokeStyle = "#000000";
			ctx.lineWidth= 2;
			ctx.setLineDash([3]);
			createRectangle(startx, starty, mouseX , mouseY );
			ctx.closePath();
			ctx.stroke();
			ctx.restore();
			break;
			
		case 11:
			ctx.clearRect(0, 0, canvas.width, canvas.height);
			restore();
			ctx.save();
			ctx.beginPath();
			ctx.lineCap = 'butt';
			ctx.lineJoin = 'miter';
			ctx.strokeStyle = styleColor;
			ctx.lineWidth= lineWidth;
			ctx.globalAlpha = globalAlpha;
			if(endX != null && endY != null){
				createArc(startx,starty,mouseX,mouseY,endX,endY);
		          }else{
						createLine(startx, starty, mouseX , mouseY );
					}
			//ctx.closePath();
			ctx.stroke();
			
			break;
			
		case 12:
			
			if(checkCircleBoundryInCanvas(startx, starty, mouseX , mouseY)){
				ctx.clearRect(0, 0, canvas.width, canvas.height);
				restore();
				tempCirclePointsArray[0] = startX;
				tempCirclePointsArray[1] = startY;
				tempCirclePointsArray[2] = mouseX;
				tempCirclePointsArray[3] = mouseY;
				isCircleCreated = true;
				ctx.beginPath();
				ctx.lineCap = 'butt';
				ctx.lineJoin = 'miter';
				ctx.strokeStyle = styleColor;
				ctx.lineWidth= lineWidth;
				ctx.globalAlpha = globalAlpha;
				createCircle(startx, starty, mouseX , mouseY);
				if(fillColor != null){
					ctx.fillStyle = fillColor;
					ctx.fill();
				}
				ctx.closePath() ;
				ctx.stroke() ;
			}else{
				isCircleCreated = false;
			}
			
			break;
		case 13:
		
				var thirdPoint = getEquilateralTriangletThirdPoint(startx, starty, mouseX , mouseY);
				if(checkEqTriangleBoundryInCanvas(startx, starty, mouseX , mouseY,thirdPoint.x3,thirdPoint.y3)){
					ctx.clearRect(0, 0, canvas.width, canvas.height);
					restore();
					ctx.beginPath();
					ctx.lineCap = 'butt';
					ctx.lineJoin = 'miter';
					ctx.strokeStyle = styleColor;
					ctx.lineWidth= lineWidth;
					ctx.globalAlpha = globalAlpha;
					createTriangle(startx, starty, mouseX , mouseY,thirdPoint.x3,thirdPoint.y3);
					if(fillColor != null){
						ctx.fillStyle = fillColor;
						ctx.fill();
					}
					ctx.closePath() ;
					ctx.stroke() ;
				}
			break;
		case 16:
					//console.log("Create object :"+text);
					ctx.clearRect(0, 0, canvas.width, canvas.height);
					restore();
					//ctx.save();
					ctx.beginPath();
					ctx.strokeStyle = styleColor;
					ctx.globalAlpha = globalAlpha;
					//console.log("1111111111111111111111111111");
					createText(text,startx,starty,styleColor);
					/*
					ctx.save();
					ctx.beginPath();
					ctx.strokeStyle = styleColor;
					ctx.lineWidth= 3;
					
					ctx.fillStyle= "#FF0000";
					ctx.fillText(text,100,100);
					ctx.globalAlpha= 0.8;
					ctx.fillStyle= "#000000";
					
					ctx.closePath();
					ctx.stroke();
					ctx.restore();
					*/
					ctx.closePath() ;
					ctx.stroke() ;
				
			break	
		case 20:
			//ctx.clearRect(0, 0, canvas.width, canvas.height);
		/* 	pencilPath.strokeWidth = 2;
			pencilPath.smooth(); */
			/*ctx.clearRect(0, 0, canvas.width, canvas.height);
			restore();*/
			ctx.beginPath();
			//ctx.fillStyle = isFilled;
			ctx.strokeStyle = styleColor;
			ctx.lineWidth= lineWidth;
			ctx.globalAlpha = globalAlpha;
			//drawFreeHandLine(freeHandQdArr);
			createLine(startx, starty, mouseX , mouseY );
			//restore();
			//console.log("actual Points::"+startx+","+starty+","+mouseX+","+mouseY);
			//ctx.globalAlpha= 0.8;
			
			//ctx.fill();
			//createLine(startx, starty, mouseX , mouseY );
			ctx.stroke(); 
			break;
		case 23:
			
			
			var r = distanceBetween(startx, starty, mouseX, mouseY);
			tempCirclePointsArray[0] = startx + r;
			tempCirclePointsArray[1] = starty + r;
			tempCirclePointsArray[2] = startx - r;
			tempCirclePointsArray[3] = starty + r;
			tempCirclePointsArray[4] = startx - r;
			tempCirclePointsArray[5] = starty - r;
			tempCirclePointsArray[6] = startx + r;
			tempCirclePointsArray[7] = starty - r;
			if(checkSquareBoundryInCanvas(tempCirclePointsArray[0],tempCirclePointsArray[1],tempCirclePointsArray[2],tempCirclePointsArray[3],tempCirclePointsArray[4],tempCirclePointsArray[5],tempCirclePointsArray[6],tempCirclePointsArray[7])){
				ctx.clearRect(0, 0, canvas.width, canvas.height);
				restore();
				ctx.beginPath();
				ctx.lineCap = 'butt';
				ctx.lineJoin = 'miter';
				ctx.strokeStyle = styleColor;
				ctx.lineWidth= lineWidth;
				ctx.globalAlpha = globalAlpha;
				createSquare(tempCirclePointsArray[0], tempCirclePointsArray[1], tempCirclePointsArray[2], tempCirclePointsArray[3], tempCirclePointsArray[4] , tempCirclePointsArray[5] , tempCirclePointsArray[6], tempCirclePointsArray[7]);
				if(fillColor != null){
					ctx.fillStyle = fillColor;
					ctx.fill();
				}
				
				ctx.closePath();
				ctx.stroke();
			}
			
			
		break;
		}
}

function getCircleBoundedSquareQuard(x1, y1, x2, y2){
	var r = distanceBetween(x1, y1, x2, y2);
	var x11 = x1+r;
	var x22 = x1-r;
	var y11 = y1+r;
	var y22 = y1-r;
	return{x1:x22,y1:y22,x2:x11,y2:y11}
}

function checkCircleBoundryInCanvas(x1,y1,x2,y2){
	var r = distanceBetween(x1, y1, x2, y2);
	var x11 = x1+r;
	var x22 = x1-r;
	var y11 = y1+r;
	var y22 = y1-r;
	ctx.beginPath();
	//createRectangle(x11,y11,x22,y22);
	ctx.closePath() ;
	ctx.stroke() ;
	//console.log("x11::"+x11+"::y11::"+y11 +"::x22::"+x22+"::y22::"+y22);
	var chk1 = point_in_rectagnle(x11,y11,canvasBoundedRectanglePoints[0],canvasBoundedRectanglePoints[1],canvasBoundedRectanglePoints[2],canvasBoundedRectanglePoints[3]);
	var chk2 = point_in_rectagnle(x11,y22,canvasBoundedRectanglePoints[0],canvasBoundedRectanglePoints[1],canvasBoundedRectanglePoints[2],canvasBoundedRectanglePoints[3])
	var chk3 = point_in_rectagnle(x22,y11,canvasBoundedRectanglePoints[0],canvasBoundedRectanglePoints[1],canvasBoundedRectanglePoints[2],canvasBoundedRectanglePoints[3])
	var chk4 = point_in_rectagnle(x22,y22,canvasBoundedRectanglePoints[0],canvasBoundedRectanglePoints[1],canvasBoundedRectanglePoints[2],canvasBoundedRectanglePoints[3])
	//console.log("val:::"+chk1);
	//console.log("val:::"+chk2);
	//console.log("val:::"+chk3);
	//console.log("val:::"+chk4);
	
	return (chk1 && chk2 && chk3 &&chk4)
}
function checkEqTriangleBoundryInCanvas(x1,y1,x2,y2,x3,y3){
	var chk1 = point_in_rectagnle(x1,y1,canvasBoundedRectanglePoints[0],canvasBoundedRectanglePoints[1],canvasBoundedRectanglePoints[2],canvasBoundedRectanglePoints[3]);
	var chk2 = point_in_rectagnle(x2,y2,canvasBoundedRectanglePoints[0],canvasBoundedRectanglePoints[1],canvasBoundedRectanglePoints[2],canvasBoundedRectanglePoints[3]);
	var chk3 = point_in_rectagnle(x3,y3,canvasBoundedRectanglePoints[0],canvasBoundedRectanglePoints[1],canvasBoundedRectanglePoints[2],canvasBoundedRectanglePoints[3]);
	return (chk1 && chk2 && chk3 )
	}
	
function checkSquareBoundryInCanvas(x1,y1,x2,y2,x3,y3,x4,y4){
	var chk1 = point_in_rectagnle(x1,y1,canvasBoundedRectanglePoints[0],canvasBoundedRectanglePoints[1],canvasBoundedRectanglePoints[2],canvasBoundedRectanglePoints[3]);
	var chk2 = point_in_rectagnle(x2,y2,canvasBoundedRectanglePoints[0],canvasBoundedRectanglePoints[1],canvasBoundedRectanglePoints[2],canvasBoundedRectanglePoints[3]);
	var chk3 = point_in_rectagnle(x3,y3,canvasBoundedRectanglePoints[0],canvasBoundedRectanglePoints[1],canvasBoundedRectanglePoints[2],canvasBoundedRectanglePoints[3]);
	var chk4 = point_in_rectagnle(x4,y4,canvasBoundedRectanglePoints[0],canvasBoundedRectanglePoints[1],canvasBoundedRectanglePoints[2],canvasBoundedRectanglePoints[3])
	return (chk1 && chk2 && chk3 && chk4)
	}
function restore(){
	if(!isPlayingStoped){
	//console.log("44444444444444444444444");
		drawNonRecordingObject(document.getElementById("pagenum").value);
		restoreOnlyPlayedObject();
		restoreInsertedObjectInStream(document.getElementById("pagenum").value);
	}else if(isReplaceEnable){
		//console.log("restore------isReplaceEnable::::"+replaceableObjArr);
		var objectTable = pageObjTable.get(document.getElementById("pagenum").value);
		//console.log("restore------objectTable::::"+objectTable);
		if(objectTable != null){
			objectTable.moveFirst();
			while(objectTable.next()){
			//console.log("key:::"+objectTable.getKey()+ "::rep::"+objectTable.getValue().type);
				 var isObjInSelList = false;
				 if(replaceableObjArr != null){
				   for(var i=0;i<replaceableObjArr.length;i++){
					
					  if(objectTable.getKey() == replaceableObjArr[i]){
						//console.log("restore------222222222222222:::"+objectTable.getKey());
						 isObjInSelList = true;
					  }
					}
				  }
				  if(!isObjInSelList){
						//console.log("----222222222222222:::");
						drawObject(objectTable,objectTable.getKey(),false);
				}
			}
		}
		
	}else{
		
		var objectTable = pageObjTable.get(document.getElementById("pagenum").value);
		//console.log("restore----------------------Page Number----------------------------------"+document.getElementById("pagenum").value);
		//console.log("restore--------------------------------------------------------"+objectTable);
		if(objectTable != null){
			objectTable.moveFirst();
			if(strechableObj.length >0 && strechableObj[0] != null){
			 while(objectTable.next()){
			  if(objectTable.getKey() !=  strechableObj[0].id){
					//console.log("restore$$$$$$$$$$$$");
					drawObject(objectTable,objectTable.getKey(),false);
				}
			  }
			}else{
				while(objectTable.next()){
				 var isObjInSelList = false;
				 if(selObjArray != null){
				   for(var i=0;i<selObjArray.length;i++){
					  if(objectTable.getKey() == selObjArray[i]){
						 isObjInSelList = true;
					  }
					}
				  }
				  if(!isObjInSelList){
				  //console.log("-111111111111111");
						drawObject(objectTable,objectTable.getKey(),false);
					}
				}
			}
		}
		
	
	}
}
function restoreInsertedObjectInStream(pageNum){
	//console.log("---------restoreInsertedObjectInStream-----------"+pageNum);	
	if(repTimeRefTable != null){
			repTimeRefTable.moveFirst();
			while(repTimeRefTable.next()){
				var recordedObjArr = repTimeRefTable.getValue();;
				for(var i=0;i<recordedObjArr.length;i++){
					var pageObj = recordedObjArr[i];
					//console.log("---------pageObj----------------"+pageObj);
					if(pageObj != null  && pageNum == pageObj.num ){
						var objectTable = pageObjTable.get(pageObj.num);
						//console.log("-333333333333333--");
						drawObject(objectTable,pageObj.objectId,false);
					}
				}
			}
	}
		
}

function changeTextAreaFontType(obj){
	//console.log("Font type::"+obj.value);
	textFontType = obj.value;
	//var text = document.getElementById("area1").value;
	document.getElementById("area1").style.fontFamily=obj.value;
}
function changeTextAreaFontSize(obj){
	//console.log("Font type::"+obj.value);
	textFontSize = obj.value;
	document.getElementById("area1").style.fontSize=obj.value+"px";
	
}

function restoreOnlyPlayedObject(){
	var keys=  timeRefTable.keys;
	var key = keys[playCount];
	/*timeRefTable.moveFirst();
	while(timeRefTable.next()){
		if(timeRefTable.getKey() == key){
			break;
		}
	}*/
	if(key != null){
		var recordObjArr = timeRefTable.get(key);
		//console.log("key:::"+key+"::recordObjArr::"+recordObjArr);
		for(var i=0;i<recordObjArr.length;i++){
			var pageObj = timeRefTable.get(recordObjArr[i]);
			if(pageObj != null){
				var objectTable = pageObjTable.get(pageObj.num);
				ctx.clearRect(0, 0, canvas.width, canvas.height);
				//console.log("55555555555555555555555555");
				drawNonRecordingObject(pageObj.num);
				restoreRecordedObj(key);
				break;
			}
		}
	}
		
	
}

function restoreAllExceptImage(){
	//console.log("restore----------------------restoreAllExceptImage-----------");
	
	var objectTable = pageObjTable.get(document.getElementById("pagenum").value);
	if(objectTable != null){
		objectTable.moveFirst();
		 while(objectTable.next()){
			 var graphicsObject = objectTable.getValue();
			 //console.log("@@@@@@@restore ---------------"+graphicsObject.type);
			  if(graphicsObject.type != 8){
					//console.log("44444444444444--");
					drawObject(objectTable,objectTable.getKey(),false);
			   }
		}
		
	}
}

function restoreUnstrechableObject(selObjId){
	//console.log("restoreUnstrechableObject--------------"+selObjId);
	var objectTable = pageObjTable.get(document.getElementById("pagenum").value);
   
	if(objectTable != null){
		objectTable.moveFirst();
		while(objectTable.next()){
		  if(objectTable.getKey() != selObjId){
			//console.log("restoreUnstrechableObject$$$$$$$$$$$$"+objectTable.getKey());
			//console.log("-5555555555555555");
				drawObject(objectTable,objectTable.getKey(),false);
			}
		  }
		 
		}
}

function drawObject(objectTable,id,highlight){
	//console.log("drawObject:::id:;"+id+"::objectTable::"+objectTable);
	/*
	if(myVid != null){
		myVid.currentTime = 2.564;
		//console.log("currentime:::;"+myVid.currentTime);
		//console.log("Start: " + myVid.seekable.start(0)+ " End: " + myVid.seekable.end(0));
	}
	*/
	var graphicsObject = objectTable.get(id);
	if(graphicsObject != null){
	//console.log("drawObject:::graphicsObject:;"+graphicsObject.type);
	ctx.beginPath();
	if(highlight == 'sel'){
		//ctx.lineWidth= 2;
		//ctx.setLineDash([3]);
	}else if(highlight){
		ctx.strokeStyle='#FF0000';
		ctx.lineWidth=5;
		ctx.setLineDash([0]);
	}else{
	   //console.log("drawObject:;"+graphicsObject.color+"::line width:::"+graphicsObject.lineWidth);
		ctx.strokeStyle = graphicsObject.color;
		ctx.lineWidth = graphicsObject.lineWidth;
		if(graphicsObject.opacity != null){
			ctx.globalAlpha = graphicsObject.opacity;
		}else{
			ctx.globalAlpha = 1.0;
		}
		ctx.setLineDash([0]);
	}
	ctx.save();
	ctx.restore();
	if(graphicsObject.type ==4){
		ctx.lineCap = 'round';
		ctx.lineJoin = 'round';
	}else{
		ctx.lineCap = 'butt';
		ctx.lineJoin = 'miter';
	}
	//console.log("drawObject--"+ctx.lineCap+"::"+ctx.lineJoin);
		
	switch(graphicsObject.type){
				case 1:
					/*
					if(graphicsObject.isFilled != false){
						ctx.save();
						var pointsArr = graphicsObject.pointsArray;
						createRectangle(pointsArr[0], pointsArr[1], pointsArr[2], pointsArr[3]);
						ctx.stroke();
						ctx.fill();
                        ctx.restore();
					}*/
					var pointsArr = graphicsObject.pointsArray;
					//console.log("Rec Filled State:"+graphicsObject.isFilled);
					
			
					//console.log("points::"+pointsArr[0]+","+pointsArr[1]+","+pointsArr[2]+","+pointsArr[3]+","+pointsArr[4]+","+pointsArr[5]+","+pointsArr[6]+","+pointsArr[7]);
					createRectangle(pointsArr[0], pointsArr[1], pointsArr[2], pointsArr[3], pointsArr[4], pointsArr[5], pointsArr[6], pointsArr[7]);
					if(graphicsObject.isFilled == true){
					
						ctx.fillStyle = graphicsObject.fillColor;
			      				
					
						ctx.fill();
						ctx.save();
						
					}
				//	ctx.save();
				//	ctx.restore();
					//ctx.closePath() ;
					//ctx.stroke();
					break;
				case 2:
					//ctx.beginPath();
					var pointsArr = graphicsObject.pointsArray;
					createOvalNew(pointsArr[0], pointsArr[1], pointsArr[2], pointsArr[3], pointsArr[4], pointsArr[5], pointsArr[6], pointsArr[7]);
					if(graphicsObject.isFilled == true){
						ctx.fillStyle = graphicsObject.fillColor;
						ctx.fill();
						ctx.save();
						
					}
					//ctx.closePath() ;
					//ctx.stroke() ;
					break;
				case 3:
					//ctx.beginPath();
					var pointsArr = graphicsObject.pointsArray;
					createLine(pointsArr[0], pointsArr[1], pointsArr[2], pointsArr[3]);
					//ctx.closePath() ;
					//ctx.stroke() ;
					break;
				case 4:
					//alert("hiiii");
					var points = graphicsObject.pointsArray;
					//console.log("Draw Pencil points Array::"+points);
					//drawPoints(points);
					//drawAndSimplyfyPath(points);
					drawFreeHandLine(points);
					//drawCurve(ctx, points);
					//drawCurve(ctx,points, 1, false, 16, true);
					/*
					ctx.moveTo(points[0], points[1]);
				    for (i = 2; i < points.length - 6; i = i+2){
					  var xc = (points[i] + points[i + 2]) / 2;
					  var yc = (points[i+1] + points[i + 3]) / 2;
					  ctx.quadraticCurveTo(points[i], points[i+1], xc, yc);
				    }
					 // curve through the last two points
					 ctx.quadraticCurveTo(points[i], points[i+1], points[i+2],points[i+3]);

					*/
					/*
					var pointsArr = graphicsObject.pointsArray;
					//console.log("Length::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"+pointsArr.length);
					for(i=0;(i+3)<pointsArr.length;i = i+2){
						//ctx.beginPath();
						//console.log("Restore Points::"+pointsArr[i+0]+","+pointsArr[i+1]+","+pointsArr[i+2]+","+ pointsArr[i+3]);
						createLine(pointsArr[i+0], pointsArr[i+1], pointsArr[i+2], pointsArr[i+3]);
						//ctx.closePath() ;
						//ctx.stroke() ;
					}
					*/
					//console.log("Done----------------------------------------------------------------------------------------------");
					break;
				case 5:
					//ctx.beginPath();
					var pointsArr = graphicsObject.pointsArray;
					//console.log("Triangle:::"+graphicsObject.isFilled);
					createTriangle(pointsArr[0], pointsArr[1], pointsArr[2], pointsArr[3], pointsArr[4], pointsArr[5]);
					if(graphicsObject.isFilled == true){
						ctx.fillStyle = graphicsObject.fillColor;
						ctx.fill();
						ctx.save();
						
					}
					//ctx.closePath() ;
					//ctx.stroke();
					break;
				case 6:
					//ctx.beginPath();
					var pointsArr = graphicsObject.pointsArray;
					createArrow(pointsArr[0], pointsArr[1], pointsArr[2], pointsArr[3]);
					//ctx.closePath() ;
					//ctx.stroke() ;
					break;
				case 8:
					//ctx.beginPath();
					
					if(currentObjId != 15)
						canvas.style.cursor  = "wait";
					
					
					tempArray = graphicsObject.pointsArray;

					//console.log("Image-----Id ::::"+graphicsObject.id+"::::imageLoaded:::"+graphicsObject.imageLoaded+"page nume::"+document.getElementById("pagenum").value);
					isImageLoaded = false;
					if(graphicsObject.imageLoaded){
						imageObj = null;
						imageObj= new Image();
						imageObj.src = graphicsObject.src;
						loadAndDrawImage();
					}else{
						//console.log("image loaded true:"+document.getElementById("pagenum").value+"::Id::"+graphicsObject.id)
						loadImage(graphicsObject.src,graphicsObject.id);
					
					}
					
					//drawImage(pointsArr[0], pointsArr[1], pointsArr[2], pointsArr[3],graphicsObject.src);
					
					
					//ctx.closePath() ;
					//ctx.stroke() ;
					break;
				case 9:
					//ctx.beginPath();
					ctx.globalAlpha = 0.3;
					var pointsArr = graphicsObject.pointsArray;
					createLine(pointsArr[0], pointsArr[1], pointsArr[2], pointsArr[3]);
					//ctx.closePath() ;
					//ctx.stroke() ;
					break;
				case 10:
					//Page move Only
					break;
					
				case 11:
					var pointsArr = graphicsObject.pointsArray;
					createArc(pointsArr[0], pointsArr[1], pointsArr[2], pointsArr[3], pointsArr[4], pointsArr[5]);
					break;
					
				case 12:
					var pointsArr = graphicsObject.pointsArray;
					createOval(pointsArr[0], pointsArr[1], pointsArr[2], pointsArr[3]);
					//createCircle(pointsArr[0], pointsArr[1], pointsArr[2], pointsArr[3]);
					if(graphicsObject.isFilled == true){
						ctx.fillStyle = graphicsObject.fillColor;
						ctx.fill();
						ctx.save();
						
					}
					break;
				
				case 13:
					var pointsArr = graphicsObject.pointsArray;
					createTriangle(pointsArr[0], pointsArr[1], pointsArr[2], pointsArr[3], pointsArr[4], pointsArr[5]);
					if(graphicsObject.isFilled == true){
						ctx.fillStyle = graphicsObject.fillColor;
						ctx.fill();
						ctx.save();
						
					}
					break;
				
				case 16:
					
					var pointsArr = graphicsObject.pointsArray;
					//ctx.save();
					//console.log("222222222222222222222"+graphicsObject.text);
					createText(graphicsObject.text,pointsArr[0],pointsArr[3],graphicsObject.color);
					var metrics = ctx.measureText(graphicsObject.text.textData);
					pointsArr[2] = pointsArr[0] +  metrics.width;
					//createRectangle(pointsArr[0], pointsArr[1], pointsArr[2], pointsArr[3]);
					/*
					ctx.save();
					ctx.beginPath();
					ctx.strokeStyle = styleColor;
					ctx.lineWidth= 3;
					
					ctx.fillStyle= "#FF0000";
					ctx.fillText(text,100,100);
					ctx.globalAlpha= 0.8;
					ctx.fillStyle= "#000000";
					
					ctx.closePath();
					ctx.stroke();
					ctx.restore();
					*/
					ctx.closePath() ;
					ctx.stroke() ;
				
				break;
				case 23:
					var pointsArr = graphicsObject.pointsArray;
					createSquare(pointsArr[0], pointsArr[1], pointsArr[2], pointsArr[3], pointsArr[4], pointsArr[5], pointsArr[6], pointsArr[7]);
					//console.log("pointsArr[0]::"+pointsArr[0]+"pointsArr[1]::"+pointsArr[1]+"pointsArr[2]::"+pointsArr[2]+"pointsArr[3]::"+pointsArr[3]);
					if(graphicsObject.isFilled == true){
						ctx.fillStyle = graphicsObject.fillColor;
			      		ctx.fill();
						ctx.save();
					}
					break;
				}
				
				
				
		//console.log("Draw Object:::close path::::");
			if(graphicsObject.type!=3 && graphicsObject.type!=4 && graphicsObject.type!= 11)
				ctx.closePath() ;
				ctx.stroke() ;
			if(graphicsObject.isFilled){
				ctx.restore()
			}
	}
	//alert("1111");
}


function drawCurve(ctx, ptsa, tension, isClosed, numOfSegments, showPoints) {

    showPoints  = showPoints ? showPoints : false;

    ctx.beginPath();

    drawLines(ctx, getCurvePoints(ptsa, tension, isClosed, numOfSegments));

    if (showPoints) {
        ctx.stroke();
        ctx.beginPath();
        for(var i=0;i<ptsa.length-1;i+=2) 
                ctx.rect(ptsa[i] - 2, ptsa[i+1] - 2, 4, 4);
    }
}
function drawLines(ctx, pts) {
    ctx.moveTo(pts[0], pts[1]);
    for(i=2;i<pts.length-1;i+=2) ctx.lineTo(pts[i], pts[i+1]);
}
function getCurvePoints(pts, tension, isClosed, numOfSegments) {

    // use input value if provided, or use a default value   
    tension = (typeof tension != 'undefined') ? tension : 0.5;
    isClosed = isClosed ? isClosed : false;
    numOfSegments = numOfSegments ? numOfSegments : 16;

    var _pts = [], res = [],    // clone array
        x, y,           // our x,y coords
        t1x, t2x, t1y, t2y, // tension vectors
        c1, c2, c3, c4,     // cardinal points
        st, t, i;       // steps based on num. of segments

    // clone array so we don't change the original
    _pts = pts.slice(0);

    // The algorithm require a previous and next point to the actual point array.
    // Check if we will draw closed or open curve.
    // If closed, copy end points to beginning and first points to end
    // If open, duplicate first points to befinning, end points to end
    if (isClosed) {
        _pts.unshift(pts[pts.length - 1]);
        _pts.unshift(pts[pts.length - 2]);
        _pts.unshift(pts[pts.length - 1]);
        _pts.unshift(pts[pts.length - 2]);
        _pts.push(pts[0]);
        _pts.push(pts[1]);
    }
    else {
        _pts.unshift(pts[1]);   //copy 1. point and insert at beginning
        _pts.unshift(pts[0]);
        _pts.push(pts[pts.length - 2]); //copy last point and append
        _pts.push(pts[pts.length - 1]);
    }

    // ok, lets start..

    // 1. loop goes through point array
    // 2. loop goes through each segment between the 2 pts + 1e point before and after
    for (i=2; i < (_pts.length - 4); i+=2) {
        for (t=0; t <= numOfSegments; t++) {

            // calc tension vectors
            t1x = (_pts[i+2] - _pts[i-2]) * tension;
            t2x = (_pts[i+4] - _pts[i]) * tension;

            t1y = (_pts[i+3] - _pts[i-1]) * tension;
            t2y = (_pts[i+5] - _pts[i+1]) * tension;

            // calc step
            st = t / numOfSegments;

            // calc cardinals
            c1 =   2 * Math.pow(st, 3)  - 3 * Math.pow(st, 2) + 1; 
            c2 = -(2 * Math.pow(st, 3)) + 3 * Math.pow(st, 2); 
            c3 =       Math.pow(st, 3)  - 2 * Math.pow(st, 2) + st; 
            c4 =       Math.pow(st, 3)  -     Math.pow(st, 2);

            // calc x and y cords with common control vectors
            x = c1 * _pts[i]    + c2 * _pts[i+2] + c3 * t1x + c4 * t2x;
            y = c1 * _pts[i+1]  + c2 * _pts[i+3] + c3 * t1y + c4 * t2y;

            //store points in array
            res.push(x);
            res.push(y);

        }
    }

    return res;
}

function circleCreation(x1,x2){
	
}

function drawAndSimplyfyPath(points){
	path = new paper.Path({
				//segments: [event.point],
				strokeColor: 'red',
				// Select the path, so we can see its segment points:
				fullySelected: false
	});
	for(i=0;i<points.length;i=i+2){
		path.add(new paper.Point(points[i],points[i+1]));
	}
	path.simplify(100);

}






function drawPoints(points) {
	/* if(points != null){
		pth = new paper.Path({
		
		strokeColor: 'green',
		// Select the path, so we can see its segment points:
		fullySelected: false
	});
	
	for(i=0;i<points.length;i=i+2){
		pth.add(new paper.Point(points[i],points[i+1]));

	}
	pth.strokeWidth = 2;
	pth.simplify();
	}   */

	
	
	 //console.log("drawPoints---------"+drawPoints);
    ctx.lineCap = 'round';
	ctx.lineJoin = 'round';
	//drawCurve(ctx,points,1);
	//ctx.shadowBlur = 5;
	//ctx.shadowColor = 'rgb(0, 0, 0)';
    if(points != null){
    	if (points.length < 3) 
    		return;
        if (points.length == 3) {
            var b = points[0];
    		var c = points[1];
            ctx.beginPath();
    		ctx.arc(b, c, ctx.lineWidth / 2, 0, Math.PI * 2, !0);
    		ctx.closePath();
    		ctx.fill();
            return
        }
        ctx.beginPath(), 
    	ctx.moveTo(points[0], points[1]);
        for (i = 2; i < points.length - 4; i=i+2) {
            var c = (points[i] + points[i + 2]) / 2;
                d = (points[i+1] + points[i + 3]) / 2;
            ctx.quadraticCurveTo(points[i], points[i+1], c, d)
        }
       ctx.quadraticCurveTo(points[i], points[i+1], points[i + 2], points[i + 3]), ctx.stroke()
    }
	
}

function GraphicsObject(id,type,pointsArray,lnWidth,lnColor,src,isFilled,fillColor,opacity,imageLoaded,textObj,ref){
	this.id = id;
	this.type = type;
	this.pointsArray = pointsArray;
	this.lineWidth = lnWidth;
	this.color = lnColor;
	this.src = src;
	this.isFilled = isFilled;
	this.fillColor = fillColor;
	this.opacity = opacity;
	this.imageLoaded = imageLoaded;
	this.text = textObj;
	this.ref = ref;
	this.rotationAngle = null;
}
function Text(text,fontType,fontSize,isBold,isUnderLine,isItalic){
	this.textData = text;
	this.fontType = fontType;
	this.fontSize = fontSize;
	this.isBold = isBold;
	this.isUnderLine = isUnderLine;
	this.isItalic = isItalic;
}
function PageObject(num,objectId){
	this.num = num;
	this.objectId = objectId;
}


function clock(){
	startTime = new Date().getTime();
	//Set Page Move Event when recording will start to move on that page.
	var pageNumber = document.getElementById("pagenum").value;
	//console.log("clock  startTime: storePageChangeEvent::"+startTime);
	storePageChangeEvent(pageNumber);
		//console.log("clock  startTime:::"+startTime);
	//timer = setTimeout('clock()',10);
	//currentMiliSec = currentMiliSec + 10;
}
function init(){
//console.log("inside init-----------------");
	 startX =  null;
	 startY =  null;
	 triEndX =  null;
	 triEndY =  null;
	 dragFlag = false;
	 strechableObj[0] = null;
	 strechableObj[1] = null;
	 strechableObj[2] = null;
	//alert(strechableObj.length);
	//console.log("Inside init:::"+currentObjId);
	// if(rectangleSelObject != null)
	// if(selObjArray != null && selObjArray.length>0 && !(isRotaionEnable || isZoomEnable) ){
	 if(selObjArray != null && selObjArray.length>0){
		//console.log("Inside init22222222222:::"+currentObjId);
			rectangleSelObject = null;
			//console.log("---- selObjArray =  null--55555555555");
			selObjArray =  null;
			selObjArray = new Array();
			ctx.clearRect(0, 0, canvas.width, canvas.height);
			restore();
			enableDisableRelationOptions(false);
			handleZoomButton(false);
	}
	//Highlight object code
	/*
	if(currentObjId == 9){
		lineWidth = 15
	}else{*/
	/*	 var str = document.getElementById("big_image").src;
			str = str.substring(str.lastIndexOf('/')+1,str.indexOf('_'));
			//console.log("line width::::::::::::::::::"+str);  */
			/*lineWidth = 2;
	}*/
	//console.log("333333333333333333333333333333333333333333");
	canvas.style.cursor = "default";
	
}
/*
function createOval(x1,y1,x2,y2){
		var startAngleinDegrees = 0 ;
		var endAngleinDegrees = 360 ;
		  
		var startAngleinRadians = (Math.PI/180) * startAngleinDegrees ;
		var endAngleinRadians = (Math.PI/180) * endAngleinDegrees ;
		  
		//console.log("MousePos::x:"+startX+":y:"+startY+":w:"+ (mouseX - startX)+":h:"+(mouseY - startY));
		var w = x2 - x1;
		var h = y2 - y1;
		var centerX  = x1 + w/2
		var centerY  = y1 + h/2
		
		if(w<0){
			 w = -w;
		}
		if(h<0){
			h = -h;
		}
		//console.log("MousePos::x:"+startX+":y:"+startY+":w:"+ w+":h:"+h);
		ctx.ellipse(centerX , centerY,w,h, 0, startAngleinRadians, endAngleinRadians, false) ;
		
}*/

function createOval(x, y, xe, ye){
    ctx.save();
    //ctx.beginPath();
    var rx = (xe - x) / 2;
    var ry = (ye - y) / 2;
    ctx.translate(x + rx, y + ry);
    rx = Math.abs(rx);
    ry = Math.abs(ry);
    if (rx < ry){
        ctx.scale(1, Math.abs(ry / rx));
        ctx.arc(1, 1, rx, 0, 2 * Math.PI, false);
    }else{
        ctx.scale(Math.abs(rx / ry), 1);
        ctx.arc(1, 1, ry, 0, 2 * Math.PI, false);
    }
    ctx.restore();
   // ctx.stroke();
}

function createOvalNew(x1,y1,x2,y2,x3,y3,x4,y4){
	var rx = (x1 + x2)/2;
	var ry = (y1 + y2)/2;
	var px = (x3 + x4)/2;
	var py = (y3 + y4)/2;
	if( x1 == x2){
	//console.log("11111111111");
	ctx.moveTo(x1,ry);
	ctx.bezierCurveTo(x1, y1, x4, y4, x4, py);
	ctx.bezierCurveTo(x3, y3, x2, y2, x1, ry);
	}else{
	//console.log("22222222222222222");
	ctx.moveTo(rx,ry);
	ctx.bezierCurveTo(x1, y1, x4, y4, px, py);
	ctx.bezierCurveTo(x3, y3, x2, y2, rx, ry);
	}
	ctx.stroke();
}

function createArc(x1,y1,x2,y2,x3,y3){
	//console.log("Arc created----:");
	ctx.moveTo(x1, y1);
	ctx.quadraticCurveTo(x2, y2, x3, y3);
//	ctx.stroke();
}


function createCircle(x1, y1, x2, y2){
	//console.log("Circle created----"+x1+"::y1::"+y1 +"::x2::"+x2+"::y2::"+y2);
	var rx = (x1 + x2) / 2;
	var ry = (y1 + y2) / 2;
	//rx = Math.abs(rx);
	//ry = Math.abs(ry);
	var r = distanceBetween(x1, y1, x2, y2);
	
	//console.log("radius:::;"+r);
	ctx.arc(x1, y1, r, 0, 2 * Math.PI, false);
	ctx.stroke();
}

/*function createRectangle(x1,y1,x2,y2){
	//console.log("x1::"+x1+"::y1::"+y1 +"::x2::"+x2+"::y2::"+y2);
	ctx.rect(x1, y1,x2-x1,y2-y1);
	//console.log("Rectangle Created");

}*/
function createRectangle(x1,y1,x2,y2,x3,y3,x4,y4){
	ctx.moveTo(x1,y1);
	ctx.lineTo(x2,y2);
	ctx.lineTo(x3,y3);
	ctx.lineTo(x4,y4);
	//console.log("x1::"+x1+"y1::"+y1+"x2::"+x2+"y2::"+y2);
	ctx.closePath();
	ctx.stroke();
}

function createSquare(x1,y1,x2,y2,x3,y3,x4,y4){
	//console.log("x1::"+x1+"y1::"+y1+"x2::"+x2+"y2::"+y2+"x3::"+x3+"y3::"+y3+"x4::"+x4+"y4::"+y4);
	ctx.moveTo(x1,y1);
	ctx.lineTo(x2,y2);
	ctx.lineTo(x3,y3);
	ctx.lineTo(x4,y4);
	//console.log("x1::"+x1+"y1::"+y1+"x2::"+x2+"y2::"+y2);
	//ctx.closePath();
	//ctx.stroke();
}

function createEquilateralTriangle(x1,y1,x2,y2,x3,y3){
  
	var thirdPoint = getEquilateralTriangletTirdPoint(x1,y1,x2,y2);
	ctx.moveTo(x1,y1);
	ctx.lineTo(x2,y2);
	ctx.lineTo(x3,thirdPoint[1]);
}
function getEquilateralTriangletThirdPoint(x1,y1,x2,y2){
	//var thPointArr = new Array();
    //console.log("EquilateralTriangle created----"+x1+"::y1::"+y1 +"::x2::"+x2+"::y2::"+y2);
	var Tx = -x1;
	var Ty = -y1;
    // P2 tranlated to origin
	var Tx2 = Tx + x2;
	var Ty2 = Ty + y2;

	// The Math .sin .cos and function require radians
	var Tx3 = (Tx2 * Math.cos(300 * Math.PI/180)) - (Ty2 * Math.sin(300 * Math.PI/180));				
	var Ty3 = (Tx2 * Math.sin(300 * Math.PI/180)) + (Ty2 * Math.cos(300 * Math.PI/180));

	// Reseverse tranlate P2 making it P3
	//thPointArr[0] = Tx3 + x1;
	//thPointArr[1] = Ty3 + y1;
	return {x3:Tx3 + x1,y3:Ty3 + y1};
}


/*function Rotate(pointX, pointY, centerX, centerY, angle) {
  // convert angle to radians
  angle = angle * Math.PI / 180;
 // get coordinates relative to center
  var dx = pointX - centerX;
  var dy = pointY - centerY;
  // Roate these points with given angle 
 var x1= (dx * Math.cos(angle)) - (dy * Math.sin(angle));				
 var y1= (dx * Math.sin(angle)) + (dy * Math.cos(angle));
 //console.log("Cos45:;"+Math.cos(angle));
 //console.log("Sin45:;"+Math.sin(angle));
  // return coordinates relative to top left corner
  x1 = x1 + centerX;
  y1 = y1 + centerY;
  return { newX: x1, newY: y1 };
  }
*/

function Rotate(tx, ty, pointX, pointY, angleRad) {
	//var pointX = pX;
	//var pointY = pY;
   // angleRad = angleRad * Math.PI / 180;
  //  //console.log("angle for rotation::"+angleRad);
    pointX -= tx;
	pointY -= ty;
 
	var xnew = pointX * Math.cos(angleRad) - pointY * Math.sin(angleRad);
	var ynew = pointX * Math.sin(angleRad) + pointY * Math.cos(angleRad);

	//console.log("cos(angleRad)::"+Math.cos(angleRad));
	//console.log("sin(angleRad)::"+Math.sin(angleRad));
  // return coordinates relative to top left corner
	pointX = xnew + tx;
	pointY = ynew + ty;
	return { newX: pointX, newY: pointY };
  }

function createLine(x1,y1,x2,y2){
	ctx.moveTo(x1, y1);
    ctx.lineTo(x2, y2);
	
}

function createTriangle(x1,y1,x2,y2,x3,y3){
	ctx.moveTo(x1, y1);
	ctx.lineTo(x2, y2);
	ctx.lineTo(x3, y3);
	/*createLine(x1,y1,x2,y2);
	createLine(x2,y2,x3,y3);
	createLine(x3,y3,x1,y1);*/
	//ctx.closePath();
}

function createArrow(x1,y1,x2,y2){
	var angleRad = slope_In_Radian(x1,y1,x2,y2);
	if(distanceBetween(x1,y1,x2,y2)>15){
		ctx.moveTo(x1, y1);
		ctx.lineTo(x2, y2);
		drawArrowhead(x2,y2,angleRad)
	}
}

function slope_In_Radian(x1,y1,x2,y2){
	var angleRad;
	if(x2>=x1 && y1>=y2) {
		angleRad = Math.atan2((y1-y2),(x2-x1));
		angleDeg = angleRad * 180 / Math.PI;
	    angleDeg = 90-angleDeg;
	    angleRad = angleDeg * Math.PI/180;
	 }if(x1>=x2 && y1>=y2){
		angleRad = Math.atan2((y2-y1),(x1-x2));
		angleDeg = angleRad * 180 / Math.PI;
		angleDeg = -(90 + angleDeg);
		angleRad = angleDeg * Math.PI/180;
	}if(x1>=x2 && y2>=y1){
		angleRad = Math.atan2((y1-y2),(x2-x1));
		angleDeg = angleRad * 180 / Math.PI;
		angleDeg = -(270 + angleDeg);
		angleRad = angleDeg * Math.PI/180;
	}if(x2>=x1 && y2>=y1){
		angleRad = Math.atan2((y2-y1),(x1-x2));
		angleDeg = angleRad * 180 / Math.PI;
		angleDeg = (270 - angleDeg);
		angleRad = angleDeg * Math.PI/180;
	}
	return angleRad;
}

function drawArrowhead(x,y,angleRad){
  	if(tempX == null){
		tempAngleRad = angleRad;
		tempX = x,
		tempY = y;
	}
	ctx.save();
	//console.log("tempX:"+tempX+"tempY::"+tempY);
	ctx.translate(x,y);
	ctx.rotate(angleRad);
    ctx.moveTo(0,0);
    ctx.lineTo(5,15);
    ctx.lineTo(-5,15)
	ctx.fillStyle = ctx.strokeStyle;
	ctx.fill();
   	if(tempX != null){
		ctx.translate(-x,-y);
		angleDeg = tempAngleRad * 180 / Math.PI;
		angleDeg = (360 - angleDeg);
		angleRad = angleDeg * Math.PI/180;
		ctx.rotate(angleRad);
	}
	ctx.restore();
}

function stopPlaying(){
	//console.log("stop playing called");
	if(!isRecRunning){
		//console.log("stop playing done");
		isPlayingStoped = true;
		 startTime = 0;
		//console.log(" clearTimeout(sliderTimer)444444444444444");
		clearTimeout(sliderTimer);
		clearTimeout(playerTimer);
		document.getElementById("cTime").innerHTML = "<b>00:00</b>";
		document.getElementById("recordButton").className = "record";
		sliderPos = 0;
		if(runningTimerId != null){
			clearTimeout(runningTimerId);
		}
			//console.log("myVid::::"+myVid);
			myVid.pause();
			myVid.currentTime = 0;
			isPaused = false;
			pointerImg.style.left = -50 +"px";
			pointerImg.style.top = -50 + "px";
			pointerX = 0;
			pointerY = 0;
			//checkAndMergeTimeRefTable();
			var pageNumber = document.getElementById("pagenum").value;
			//console.log("6666666666666666666666666666666");
			drawNonRecordingObject(pageNumber);
			restoreAllRecordedObj(pageNumber);
			document.getElementById("playpause").className  = "play";
			jQuery('#ex1').slider('setValue',sliderPos);
		
	}

}


function togglePlayPause(obj){
 
  //alert("hiiiii");
 if(!isRecRunning && recFileDuration >0){
	  //console.log(":::togglePlayPause-------isRecRunning::"+recFileDuration);
 	   if(obj.className  == "pause"){
		 obj.className  = "play";
		 pausePlaying();
	  }else{
		 obj.className  = "pause";
		 playObject();
	  }
 }
 
}


function startSlide(){
 //console.log("start slide::::"+sliderPos);
 jQuery('#ex1').slider('setValue',sliderPos++);
 sliderTimer = setTimeout("startSlide()",sliderMoveTime);
 		
}


function pausePlaying(){
	//console.log("-----------------------------------pausePlaying------------------------------------------");
	isPaused = true;
	myVid.pause();
	clearTimeout(runningTimerId);
	//console.log(" clearTimeout(sliderTimer)333333333333");	
	clearTimeout(sliderTimer);
	clearTimeout(playerTimer);	
	var currentTime = new Date().getTime();
	nextPlayingObjtime = Math.ceil(currentTime - startTime);
}


  function playObject(){
  
	isPlayingStoped = false;
	//console.log("--------------playObject------------------------------------------"+nextPlayingObjKey);
	myVid.pause();
	if(isPaused == false){
		ctx.clearRect(0, 0, canvas.width, canvas.height);
		document.getElementById("pagenum").value = 1;
		canvas.style.cursor  = "wait";
		playingFrom = 1;
		sliderPos = 0;
		//myVid=document.getElementById("audio1");
		myVid.src = "http://"+window.location.host+"/"+filename;
	}else{
		isPaused = false;
		myVid.play();
		startSlide();
		if(nextPlayingObjKey != null){
		//console.log("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
			runningTimerId = setTimeout('checkPageAndDrawObj('+nextPlayingObjKey+')',nextPlayingObjtime);
		}
	}
 //alert(timeRefTable);
	
/*
	ctx.clearRect(0, 0, canvas.width, canvas.height);
	for(ctr = 0;ctr<nonRecordingObjArray.length;ctr++){
		drawObject(nonRecordingObjArray[ctr],false);
	}
*/
	//alert("hiiii");
	
	//myVid.addEventListener("canplay", function(_event) {
		/*////////console.log("Can play listener works here"+isPlayingStoped);
	      if(!isPlayingStoped){
				canvas.style.cursor  = "default";
				//console.log("Play file name:::"+myVid.src);
				myVid.controls = true;
				myVid.play();
				
				drawNonRecordingObject("1");
				timeRefTable.moveFirst();
				//console.log("timeRefTable:::::"+timeRefTable);
				playCount = 0;
				if(timeRefTable.next()){
					//alert(timeRefTable.getKey());
					//alert(timeRefTable.getValue());
					//console.log("Object1:::"+timeRefTable.getKey()+":Time::::"+timeRefTable.getValue().num);
					var pageObj = timeRefTable.getValue();
					
					setTimeout('checkPageAndDrawObj('+timeRefTable.getKey()+')',timeRefTable.getKey());
				}
			}
			*/				
	//});
	
	
	/*
	myVid.addEventListener("loadedmetadata", function(_event) {
	alert("metadata loaded:");
    var duration = myVid.duration;
	//console.log("duration:"+duration);
    //TODO whatever
	});
	*/
	//myVid.src = "http://www.topchalks.com/tc/kina_9.mp3";
	//console.log("Play file name:::"+filename+".mp3");
	//alert("host:::"+window.location.host);
	/*
	//console.log("Play file name:::"+myVid.src);
	myVid.controls = true;
	myVid.play();
	*/
	
	//setTimeout('drawObject(ctr)',timeRefTable.get(ctr));
	//drawObject(ctr);
}

function restoreAndPlayObject(key){
	
	//console.log("restoreAndPlayObject::::"+key);
	
	timeRefTable.moveFirst();
	playCount = 0;
	while(timeRefTable.next()){
		playCount++;
		if(timeRefTable.getKey() == key){
			break;
		}
	}
	var recordedObjArr = timeRefTable.get(key);
	if(recordedObjArr != null){
		var pageObj = recordedObjArr[0];
		var objectTable = pageObjTable.get(pageObj.num);
		ctx.clearRect(0, 0, canvas.width, canvas.height);
		//console.log("777777777777777777777777");
		drawNonRecordingObject(pageObj.num);
		restoreRecordedObj(key);
		//console.log("-6666666666666666666-------");
		drawObject(objectTable,pageObj.objectId,false);
		
		var keys=  timeRefTable.keys;
		timeDuration = keys[playCount] - keys[playCount-1]
		if(playCount < keys.length){
			var keyy = keys[playCount];	
			//console.log("timeDuration::::"+keyy);
			nextPlayingObjKey = keyy;
			startTime = new Date().getTime();
			//myVid.currentTime = key;
			//console.log("-----------Start audio playing-----------");
			//myVid.play();
			sliderPos =  Math.floor(key * 100/recFileDuration);
			//console.log("^^^^^^^^^^^^^^^^^^^^^^^^sliderPos^^^^^^^^^^^^^^^"+sliderPos);
			//console.log("-----sliderMoveTime-------"+sliderMoveTime);
			startSlide();
			//console.log("+++++++++++++++++++++++++++++++++++++++++++++");
			runningTimerId = setTimeout('checkPageAndDrawObj('+keyy+')',timeDuration);
		}
	}

}

function checkPageAndDrawObj(key){
	playCount++;
	//console.log("checkPageAndDrawObj:::"+key);
	var recordedObjArr = timeRefTable.get(key);
	//console.log("timeRefTable:::"+timeRefTable);
	var pageObj = recordedObjArr[0];
	//console.log("pageObj:::"+pageObj)
	var objectTable = pageObjTable.get(pageObj.num);
	//console.log("pageObj.num:::;"+pageObj.num+":::::Pagenumber ::"+document.getElementById("pagenum").value);
	if(pageObj.num == document.getElementById("pagenum").value){
		//console.log("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
		for(var i=0;i<recordedObjArr.length;i++){
			
			pageObj = recordedObjArr[i];
			if(i == 0){
				var graphicsObject = objectTable.get(pageObj.objectId);
				//console.log("graphicsObject::::"+graphicsObject);
				var pointsArray = graphicsObject.pointsArray;
				if( pointsArray != null){
					currentPointerPath = getPointsOnPointerPath(pointerX,pointerY,pointsArray[0],pointsArray[3],50);
					clearTimeout(pointerTimerId);	
					pointCtr = 0;
					drawPointerPath()
				}
			}
			//console.log("-777777777777777777");
			drawObject(objectTable,pageObj.objectId,false);
		}
		restoreInsertedObjectInStream(pageObj.num);
	}else{
		//console.log("*********************************************");
		document.getElementById("pagenum").value = pageObj.num;
		ctx.clearRect(0, 0, canvas.width, canvas.height);
		//console.log("8888888888888888888888888888888");
		drawNonRecordingObject(pageObj.num);
		restoreRecordedObj(key);
		//console.log("-888888888888888888888");
		drawObject(objectTable,pageObj.objectId,false);
		
		pointerImg.style.left = -50 +"px";
		pointerImg.style.top = -50 + "px";
		pointerX = 0;
		pointerY = 0;
	}
	var keys=  timeRefTable.keys;
	timeDuration = keys[playCount] - keys[playCount-1]
	if(playCount < keys.length){
		var keyy = keys[playCount];	
		//console.log("timeDuration::::"+keyy);
		nextPlayingObjKey = keyy;
		startTime = new Date().getTime();
		//console.log("------------------------------"+key);
		runningTimerId = setTimeout('checkPageAndDrawObj('+keyy+')',timeDuration);
	}
}

function restoreRecordedObj(timestamp){
	timeRefTable.moveFirst();
    //console.log("--------------restoreRecordedObj:::::"+timestamp);
	var currentPage = document.getElementById("pagenum").value;
	var objectTable = pageObjTable.get(currentPage);
	while(timeRefTable.next()){
	//console.log("key:::::"+timeRefTable.getKey());
		if(parseInt(timeRefTable.getKey())< parseInt(timestamp)){
			var recordedObjectArr = timeRefTable.getValue();
			//console.log("--------------restoreRecordedObj:::recordedObjectArr::"+recordedObjectArr);
			for(var i=0;i<recordedObjectArr.length;i++){
				var pageObj = recordedObjectArr[i];
				if(pageObj.num == currentPage){
					//console.log("--------------restoreRecordedObj:::drawObject:Id:"+pageObj.objectId);
					//console.log("-99999999999999999");
					drawObject(objectTable,pageObj.objectId,false);
				}else{
					continue;
				}
			}
		}else{
			break;
		}
	}
}


function restoreAllRecordedObj(pageNum){
	//console.log("Page number::::;"+pageNum);
	var objectTable = pageObjTable.get(pageNum);
	timeRefTable.moveFirst();
	while(timeRefTable.next()){
	//console.log("1111111111111111111111111");
		var recordedObjArr = timeRefTable.getValue();
		for(var i=0;i < recordedObjArr.length;i++){
			var pageObj = recordedObjArr[i];
			if(pageObj.num == pageNum){
					//console.log("2222222222222222222222222222222");
					//console.log("-**********************");
				drawObject(objectTable,pageObj.objectId,false);
			}else{
				continue;
			}
		}
		
	}
}
function drawNonRecordingObject(pageNum){
	
	var nonRecordingObjArray = nonRecordinPageObjTable.get(pageNum);
	
	if(nonRecordingObjArray != null){
		//console.log("------------Draw Non Recording Objects---------------------"+nonRecordingObjArray.length);
		ctx.clearRect(0, 0, canvas.width, canvas.height);
		var objectTable = pageObjTable.get(pageNum);
		for(ctr = 0;ctr<nonRecordingObjArray.length;ctr++){
		//console.log("-$$$$$$$$$$$$$$$$$$$$$$$$$");
			drawObject(objectTable,nonRecordingObjArray[ctr],false);
		}
	}
}

function checkObject(objectTable,startX,startY,mouseX,mouseY){
	//console.log("checkObject:::"+startX+","+startY+","+mouseX+","+mouseY);
	objectTable.moveFirst();
	while(objectTable.next()){
	  var graphicsObject = objectTable.get(objectTable.getKey());
	  var isSel = false;
	   switch(graphicsObject.type){
				case 1:
					var pointsArr = graphicsObject.pointsArray;
					for(i=0;i<pointsArr.length;i=i+2){
						for(j=1;j<pointsArr.length;j=j+2){
							if(point_in_rectagnle(pointsArr[i], pointsArr[j],startX,startY,mouseX,mouseY)){
								selObjArray[selObjArray.length] = objectTable.getKey();
								i = pointsArr.length;
								//console.log("selObjArray:::"+selObjArray);
								break;
							}
							
					  }
					}
					break;
				case 2:
					ctx.beginPath();
					var pointsArr = graphicsObject.pointsArray;
					//console.log("points::::"+pointsArr);
					var rx = (pointsArr[2] - pointsArr[0]) / 2;
				    var ry = (pointsArr[3] - pointsArr[1]) / 2;
				    //console.log("p1::::"+(pointsArr[0]+rx)+","+ pointsArr[1]);
					//console.log("p2::::"+(pointsArr[0]+rx)+","+ pointsArr[3]);
					//console.log("p3::::"+pointsArr[0]+","+ (pointsArr[1]+ry));
					//console.log("p4::::"+pointsArr[2]+","+ (pointsArr[1]+ry));
					if(point_in_rectagnle((pointsArr[0]+rx),pointsArr[1],startX,startY,mouseX,mouseY)){
						selObjArray[selObjArray.length] = objectTable.getKey();
						break;
					}
					if(point_in_rectagnle((pointsArr[0]+rx),pointsArr[3],startX,startY,mouseX,mouseY)){
						selObjArray[selObjArray.length] = objectTable.getKey();
						break;
					}
					if(point_in_rectagnle((pointsArr[0]),pointsArr[1]+ry,startX,startY,mouseX,mouseY)){
						selObjArray[selObjArray.length] = objectTable.getKey();
						break;
					}
					if(point_in_rectagnle((pointsArr[2]),pointsArr[1]+ry,startX,startY,mouseX,mouseY)){
						selObjArray[selObjArray.length] = objectTable.getKey();
						break;
					}
				case 3:
					var pointsArr = graphicsObject.pointsArray;
					for(i=0;i<pointsArr.length;i=i+2){
							if(point_in_rectagnle(pointsArr[i], pointsArr[i+1],startX,startY,mouseX,mouseY)){
								selObjArray[selObjArray.length] = objectTable.getKey();
								//console.log("selObjArray:::"+selObjArray);
								break;
							}
							
					  }
					break;
				case 4:
					var pointsArr = graphicsObject.pointsArray;
					for(i=0;i<pointsArr.length;i=i+2){
							if(point_in_rectagnle(pointsArr[i], pointsArr[i+1],startX,startY,mouseX,mouseY)){
								selObjArray[selObjArray.length] = objectTable.getKey();
								//console.log("selObjArray:::"+selObjArray);
								break;
							}
							
					}
					//console.log("Done----------------------------------------------------------------------------------------------");
					break;
				case 5:
					var pointsArr = graphicsObject.pointsArray;
					for(i=0;i<pointsArr.length;i=i+2){
							if(point_in_rectagnle(pointsArr[i], pointsArr[i+1],startX,startY,mouseX,mouseY)){
								selObjArray[selObjArray.length] = objectTable.getKey();
								//console.log("selObjArray:::"+selObjArray);
								break;
							}
					}
					break;
				case 6:
					var pointsArr = graphicsObject.pointsArray;
					for(i=0;i<pointsArr.length;i=i+2){
							if(point_in_rectagnle(pointsArr[i], pointsArr[i+1],startX,startY,mouseX,mouseY)){
								selObjArray[selObjArray.length] = objectTable.getKey();
								//console.log("selObjArray:::"+selObjArray);
								break;
							}
							
					 }
					break;
					
				case 11:
					var pointsArr = graphicsObject.pointsArray;
					for(i=0;i<pointsArr.length;i=i+2){
						if(point_in_rectagnle(pointsArr[i], pointsArr[i+1],startX,startY,mouseX,mouseY)){
							selObjArray[selObjArray.length] = objectTable.getKey();
							//console.log("selObjArray:::"+selObjArray);
							break;
						}
					}
					break;	
					
				case 12:
				    var pointsArr = graphicsObject.pointsArray;
					//console.log("points::::"+pointsArr);
					var rx = (pointsArr[2] + pointsArr[0]) / 2;
				    var ry = (pointsArr[3] + pointsArr[1]) / 2;
				    //console.log("p1::::"+(pointsArr[0]+rx)+","+ pointsArr[1]);
					//console.log("p2::::"+(pointsArr[0]+rx)+","+ pointsArr[3]);
					//console.log("p3::::"+pointsArr[0]+","+ (pointsArr[1]+ry));
					//console.log("p4::::"+pointsArr[2]+","+ (pointsArr[1]+ry));
					if(point_in_rectagnle((pointsArr[0]),pointsArr[1],startX,startY,mouseX,mouseY)){
						selObjArray[selObjArray.length] = objectTable.getKey();
						break;
					}
					if(point_in_rectagnle((pointsArr[0])+rx,pointsArr[3],startX,startY,mouseX,mouseY)){
						selObjArray[selObjArray.length] = objectTable.getKey();
						break;
					}
					if(point_in_rectagnle((pointsArr[0]),pointsArr[1]+ry,startX,startY,mouseX,mouseY)){
						selObjArray[selObjArray.length] = objectTable.getKey();
						break;
					}
					if(point_in_rectagnle((pointsArr[2])+rx,pointsArr[1]+ry,startX,startY,mouseX,mouseY)){
						selObjArray[selObjArray.length] = objectTable.getKey();
						break;
					} 
				case 16:
					var pointsArr = graphicsObject.pointsArray;
					for(i=0;i<pointsArr.length;i=i+2){
						for(j=1;j<pointsArr.length;j=j+2){
							if(point_in_rectagnle(pointsArr[i], pointsArr[j],startX,startY,mouseX,mouseY)){
								selObjArray[selObjArray.length] = objectTable.getKey();
								i = pointsArr.length;
								//console.log("selObjArray:::"+selObjArray);
								break;
							}
							
					  }
					}
					break;	
			}
	}
}

function closeEditor(isSave){
	//myEditor.saveHTML();	
	var text = document.getElementById("area1").value;
	//console.log("close Editor::"+document.getElementById("area1").value);
	var div_elm = document.getElementById("meetingDiv");
	//div_elm.innerHTML = '';
	document.getElementById("meetingDiv").style.display = "none";
	var pageNum = document.getElementById("pagenum").value;
	var objectTable = pageObjTable.get(pageNum);
	//var ret = getSelectedObjectMinMax(objectTable);
	//console.log("startX"+startX+"::startY::"+startY);
	//replaceSelctedObjectWithText(text,ret.minX,ret.minY,objectTable);
	//The var html will now have the contents of the textarea
  /*  var html = myEditor.get('element').value;
	//console.log("html::"+myEditor.cleanHTML(html));
	while(html.indexOf("&nbsp;")!= -1){
		html = html.replace('&nbsp;',' ');
	}
	//console.log("remove spaceeee::"+html);
	
	var pos = html.indexOf("style");
	if(pos != -1){
		var styleJson ="{" + html.substring(pos+7,html.indexOf(">")-2) +"}";
		//console.log("styleJson::"+styleJson);
	
	}
	*/
	//var text = html;
	//console.log("inside close Editor:::"+text.trim().length);
	
	if(text.trim().length != 0 && isSave){
		saveTextAsGraphicsObject(text);
		
	}
	setId(7,true);
	
	
	

	/*
	//ctx.save();
	ctx.beginPath();
	ctx.strokeStyle = "#D3D3D3";
	ctx.lineWidth= 3;
	ctx.font="50px Georgia";
	ctx.fillStyle= "#FF0000";
	ctx.fillText(text,100,100);
	ctx.globalAlpha= 0.8;
	ctx.fillStyle= "#000000";
	ctx.closePath();
	ctx.stroke();
	//ctx.restore();
	*/

	
}
function saveTextAsGraphicsObject(text){
		//console.log("saveTextAsGraphicsObject::"+text);
		var graphicsObject;
		if(selectedTxtObj != null){
			//console.log("saveTextAsGraphicsObject:iffff:");
			var tempPointsArray = selectedTxtObj.pointsArray;
			var textObj = selectedTxtObj.text;	
			textObj.textData = text;
			textObj.fontSize = textFontSize;
			textObj.fontType = textFontType;
			//createText(text,tempPointsArray[0],tempPointsArray[3],fontStyle,selectedTxtObj.color);
			//createObject(selectedTxtObj.type,tempPointsArray[0],tempPointsArray[1],null,null,null,null,textObj);
			//tempPointsArray[2] = tempPointsArray[0] + textWidth;
			selectedTxtObj.text = textObj;
			ctx.clearRect(0, 0, canvas.width, canvas.height);
			restore();
		}else{
			var x = (canvasBoundedRectanglePoints[2] /2 ) - 390/2;
			var y = (canvasBoundedRectanglePoints[3] /2 ) - 266/2;
			var tempPointsArray = new Array();
			count++;
			tempPointsArray[tempPointsArray.length] = x ;
			tempPointsArray[tempPointsArray.length] = y - 50;
			tempPointsArray[tempPointsArray.length] = x;
			tempPointsArray[tempPointsArray.length] = y ;
			var textObj = new Text(text,textFontType,textFontSize,isBold,isUnderLine,isItalic);
			graphicsObject = new GraphicsObject(count,currentObjId,tempPointsArray,lineWidth,styleColor,null,false,fillColor,globalAlpha,false,textObj,null);
			createObject(currentObjId,x,y,null,null,null,null,textObj);
			graphicsObject.pointsArray[2] = graphicsObject.pointsArray[2] + textWidth;
			
			if(!isPlayingStoped ){// Inserting object while playing
				currentMiliSec =Math.floor(myVid.currentTime * 1000);
				var pageObject = new PageObject(document.getElementById("pagenum").value,count);
				insertObjectInPlayingStream(currentMiliSec,pageObject);
			}else if(startTime != 0 && isPlayingStoped){// Inserting object while recording
					var currentTime = new Date().getTime();
					currentMiliSec = recFileDuration + Math.ceil(currentTime - startTime);
					//console.log("mouse up::pagenumber:"+document.getElementById("pagenum").value);
					var pageObject = new PageObject(document.getElementById("pagenum").value,count);
					objectTimeTable.put(count,currentMiliSec);
					var recordedObjArr = timeRefTable.get(currentMiliSec);
					if(recordedObjArr ==  null){
						recordedObjArr = new Array();
					}
					recordedObjArr[recordedObjArr.length] = pageObject;
					timeRefTable.put(currentMiliSec,recordedObjArr);
					//console.log("timeRefTable::;"+timeRefTable);
			}else{ // Non recodring object
				var nonRecordingObjArray = nonRecordinPageObjTable.get(document.getElementById("pagenum").value);
				if(nonRecordingObjArray == null){
					nonRecordingObjArray = new Array();
					nonRecordinPageObjTable.put(document.getElementById("pagenum").value,nonRecordingObjArray);
				}
				nonRecordingObjArray[nonRecordingObjArray.length] = count;
			}
				
			
			
			
			
			
			
			
		}
		
		var pageNum = document.getElementById("pagenum").value;
		var objectTable = pageObjTable.get(pageNum);
		//console.log("saveTextAsGraphicsObject::objectTable11111111:::"+objectTable);
		if(objectTable == null){
			objectTable = new Hashtable();
			pageObjTable.put(pageNum,objectTable);
		}
		objectTable.put(count, graphicsObject);
		objectPageRefTable.put(count,pageNum);
		//console.log("saveTextAsGraphicsObject::objectTable22222222222:::"+objectTable);
		selectedTxtObj = null;
}




function replaceSelctedObjectWithText(text,startX,startY,objectTable){
 var replaceableObj;
 var removeableObjArr;
 
		 if(selObjArray != null && selObjArray.length > 0){
			  var ptsArr =  new Array();
			  ptsArr[0] = startX;
			  ptsArr[1] = startY;
			  for(var i=0;i<selObjArray.length;i++){
				   var graphicsObject = objectTable.get(selObjArray[i]);
				   if(graphicsObject.type != 4){
				   
					break;
				   }
				   if(i==0){
					replaceableObj = selObjArray[i];
				   }else{
					removeableObjArr[removeableObjArr.length] = selObjArray[i];
				   }
			   
			  }
		  //Replace Object
		  replaceableObj = objectTable.get(replaceableObj);
		  //console.log("replaceableObj::"+replaceableObj.type+"::replaceableObj:;"+replaceableObj.pointsArray);
		  replaceableObj.type = 16;
		  replaceableObj.pointsArray  = ptsArr;
		  replaceableObj.text = text;
		  
		  // //Remove Object
		  if(removeableObjArr!= null){
			  for(var i=0;i<removeableObjArr.length;i++){
				objectTable.remove(removeableObjArr[i]);
			  }
		  }
	}

}

function createText(textObj,startX,startY,color){
	//console.log("createText text::"+textObj.textData+":::styleColor::"+color+ "textObj.fontSize::"+textObj.fontSize+"::textObj.fontType::"+textObj.fontType);
	ctx.fillStyle = color;
	var decoration = "";
	if(textObj.isItalic){
		decoration = decoration + "italic ";
	}
	if(textObj.isBold){
		decoration = decoration + "bold ";
	}
	ctx.font = decoration + textObj.fontSize +"px "+textObj.fontType;
	ctx.fillText(textObj.textData,startX,startY);
	var metrics = ctx.measureText(textObj.textData);
    textWidth = metrics.width;
}

function getSelectedObjectMinMax(objectTable){
	//console.log("selObjArray::::"+selObjArray);
		var ponitXarr = new Array();
		var ponitYarr = new Array();
		
		for(var i=0;i<selObjArray.length;i++){
			var graphicsObject = objectTable.get(selObjArray[i]);
			//console.log("graphicsObject"+graphicsObject)
			var pointsArray = graphicsObject.pointsArray;
			//console.log("1");
			
			for(var j=0;j<pointsArray.length;j++){
				//console.log("pointsArray::"+pointsArray);
				if(j % 2==0)
					ponitXarr[ponitXarr.length] = pointsArray[j];
				else
					ponitYarr[ponitYarr.length] = pointsArray[j];
			}
			
		}
		//console.log("ponitXarr::"+ponitXarr+"::ponitYarr::"+ponitYarr+"::ponitXarr[ponitXarr.length-1]::"+ponitXarr[ponitXarr.length-1]+"::ponitYarr[ponitYarr.length-1]::"+ponitYarr[ponitYarr.length-1]);
		ponitXarr = ponitXarr.sort(function(a, b){return a-b});	
		ponitYarr = ponitYarr.sort(function(a, b){return a-b});
		
		return{minX:ponitXarr[0],minY:ponitYarr[0],maxX:ponitXarr[ponitXarr.length -1],maxY:ponitYarr[ponitYarr.lenght -1]};
		


}


function between(min, p, max){
  result = false;
  if ( min < max ){
    if ( p > min && p < max ){
      result = true;
    }
  }
  if ( min > max ){
    if ( p > max && p < min){
      result = true
    }
  }
  if ( p == min || p == max ){
    result = true;
  }
  return result;
}

function point_in_rectagnle(x,y,left, top, right, bottom){
  //console.log("Dotted Rectangle points::"+left+":"+top+":"+right+":"+bottom);
  result = false;
  if ( between(left,x,right) && between(top,y,bottom ) ){
    result = true;
  }
  return result;
}
function eraseSelectedObject(){
	var pageNum = document.getElementById("pagenum").value;
	var objectTable = pageObjTable.get(pageNum);
	deleteSelectedObject(objectTable,pageNum);
}
function deleteSelectedObject(objectTable,pageNum){
//console.log("objectTable::"+objectTable+"pageNum::"+pageNum);
 for(var ctr = 0;ctr<selObjArray.length;ctr++){
	//console.log("selObjArray.length::"+selObjArray.length);
	var key = selObjArray[ctr];
	objectTable.remove(key);
	var nonRecordingObjArray = nonRecordinPageObjTable.get(pageNum);
	var index = nonRecordingObjArray.indexOf(key);
	if(index != -1){
	// remove from non recording object aray
		nonRecordingObjArray.splice(index ,1);
	}else{
		var pos = objectTimeTable.get(key);
		//console.log("pos::"+pos);
		var recordObjArr = timeRefTable.get(pos);
		//console.log("recordObjArr::"+recordObjArr);
		if(recordObjArr != null){
			for(var i=0;i<recordObjArr.length;i++){
			//console.log("timeRefTable::"+timeRefTable);
				var pageObj = recordObjArr[i];
				//console.log("pageObj::"+pageObj);
				//console.log("pageObj ::"+pageObj.objectId+"num::"+pageObj.num);
				if(pageObj.objectId == key){
				//console.log("object deleted::"+key);
					recordObjArr.splice(i ,1);
					break;
			}
		}
	}
	
	objectTimeTable.remove(key);
	}

	objectPageRefTable.remove(key);
 }
 
 var nonRecordingObjArray = nonRecordinPageObjTable.get(pageNum);
 ctx.clearRect(0, 0, canvas.width, canvas.height);
 rectangleSelObject = null;
 //console.log("---- selObjArray =  null--6666666666666");
 selObjArray =  null;
 selObjArray = new Array();
 restore();
 enableDisableRelationOptions(false);
 handleZoomButton(false);
}

function selectAllObject(objectTable){
//console.log("objectTable::"+objectTable);
 
  selObjArray =  null;
  selObjArray = new Array();
  if(objectTable != null){
   objectTable.moveFirst();
   while(objectTable.next()){
   //console.log("Type::;"+objectTable.getValue().type);
    selObjArray[selObjArray.length] = objectTable.getKey();
    showSelectedObject(objectTable.getValue());
   }
  }
 
}

function stretchSelectedObject(object,mouseX,mouseY){
	//ctx.clearRect(0, 0, canvas.width, canvas.height);
	//restoreUnstrechableObject(object.id);
	//console.log("Stretch Object---"+selObjArray);
	var graphicsObject = object[0];
	if(graphicsObject.type == 3){
		//console.log("-----------stretchSelectedObject------------"+graphicsObject.type + " pt1:;"+object[1]+":;pt2::"+object[2]);
		editObject(graphicsObject,object[1],object[2],mouseX,mouseY,null,null);
		
		graphicsObject.pointsArray[0] = object[1];
		graphicsObject.pointsArray[1] = object[2];
		graphicsObject.pointsArray[2] = mouseX;
		graphicsObject.pointsArray[3] = mouseY;
		showSelectedObject(graphicsObject);
	}else if(graphicsObject.type == 5 || graphicsObject.type ==11 ){
		//console.log("Stretch Object---Triangle");
		if(object[1] == 0 && object[2] == 1){
			editObject(graphicsObject,mouseX,mouseY,graphicsObject.pointsArray[2],graphicsObject.pointsArray[3],graphicsObject.pointsArray[4],graphicsObject.pointsArray[5]);
			graphicsObject.pointsArray[0] = mouseX;
			graphicsObject.pointsArray[1] = mouseY;
		}else if(object[1] == 2 && object[2] == 3){
			editObject(graphicsObject,graphicsObject.pointsArray[0],graphicsObject.pointsArray[1],mouseX,mouseY,graphicsObject.pointsArray[4],graphicsObject.pointsArray[5]);
			graphicsObject.pointsArray[2] = mouseX;
			graphicsObject.pointsArray[3] = mouseY;
		}else if(object[1] == 4 && object[2] == 5){
			editObject(graphicsObject,graphicsObject.pointsArray[0],graphicsObject.pointsArray[1],graphicsObject.pointsArray[2],graphicsObject.pointsArray[3],mouseX,mouseY);
			graphicsObject.pointsArray[4] = mouseX;
			graphicsObject.pointsArray[5] = mouseY;
		
		}
			
		showSelectedObject(graphicsObject);
	}else if(graphicsObject.type == 6){
		   //console.log("object[3]:::;"+object[3]);
			if(object[3] != null && object[3] == true){
				editObject(graphicsObject,mouseX,mouseY,object[1],object[2],null,null);
				graphicsObject.pointsArray[0] = mouseX;
				graphicsObject.pointsArray[1] = mouseY;
				graphicsObject.pointsArray[2] = object[1];
				graphicsObject.pointsArray[3] = object[2];
			}else{
				 editObject(graphicsObject,object[1],object[2],mouseX,mouseY,null,null);
				 graphicsObject.pointsArray[0] = object[1];
				 graphicsObject.pointsArray[1] = object[2];
				 graphicsObject.pointsArray[2] = mouseX;
				 graphicsObject.pointsArray[3] = mouseY;
			}
			showSelectedObject(graphicsObject);
			
	}else if(graphicsObject.type ==13){
		
		if(object[1] == 0 && object[2] == 1){
			//console.log("1st call");
			var lastPoint = getEquilateralTriangletThirdPoint(mouseX,mouseY,graphicsObject.pointsArray[2],graphicsObject.pointsArray[3]);
			editObject(graphicsObject,mouseX,mouseY,graphicsObject.pointsArray[2],graphicsObject.pointsArray[3],lastPoint.x3,lastPoint.y3);
			graphicsObject.pointsArray[0] = mouseX;
			graphicsObject.pointsArray[1] = mouseY;
			graphicsObject.pointsArray[4] = lastPoint.x3;
			graphicsObject.pointsArray[5] = lastPoint.y3;
		}else if(object[1] == 2 && object[2] == 3){
			//console.log("2nd call");
			var lastPoint = getEquilateralTriangletThirdPoint(graphicsObject.pointsArray[0],graphicsObject.pointsArray[1],mouseX,mouseY);
			editObject(graphicsObject,graphicsObject.pointsArray[0],graphicsObject.pointsArray[1],mouseX,mouseY,lastPoint.x3,lastPoint.y3);
			graphicsObject.pointsArray[2] = mouseX;
			graphicsObject.pointsArray[3] = mouseY;
			graphicsObject.pointsArray[4] = lastPoint.x3;
			graphicsObject.pointsArray[5] = lastPoint.y3;
		}else if(object[1] == 4 && object[2] == 5){
			//console.log("3rd call");
			var lastPoint = getEquilateralTriangletThirdPoint(graphicsObject.pointsArray[2],graphicsObject.pointsArray[3],mouseX,mouseY);
			editObject(graphicsObject,lastPoint.x3,lastPoint.y3,graphicsObject.pointsArray[2],graphicsObject.pointsArray[3],mouseX,mouseY);
			graphicsObject.pointsArray[4] = mouseX;
			graphicsObject.pointsArray[5] = mouseY;
			graphicsObject.pointsArray[0] = lastPoint.x3;
			graphicsObject.pointsArray[1] = lastPoint.y3;
		
		}
		showSelectedObject(graphicsObject);
	}else if(graphicsObject.type == 12){
			var x1 = graphicsObject.pointsArray[0];
			var y1 = graphicsObject.pointsArray[1];
			var x2 = graphicsObject.pointsArray[2];
			var y2 = graphicsObject.pointsArray[3];
			
			var cx = ((x1+x2)/2);
			var cy = ((y1+y2)/2);
			var r = 0;
			if(cx > x1){
			   r = cx - x1;
			  }else{
			   r = x1 - cx;
			  }
			  
			var r1 = distanceBetween(cx, cy, startX, startY);
			var r2 = distanceBetween(cx, cy, mouseX, mouseY);
			var dx = (r2 - r1);
			r = r + dx;
			if(r>3){
				x1 = cx - r;
				y1 = cy - r;
				x2 = cx + r;
				y2 = cy + r;
				}
			
					
			createObject(2,x1,y1,x2,y2,null,null);
			graphicsObject.pointsArray[0] = x1;
			graphicsObject.pointsArray[1] = y1;
			graphicsObject.pointsArray[2] = x2;
			graphicsObject.pointsArray[3] = y2;
			showSelectedObject(graphicsObject);
			startX = mouseX;
			startY = mouseY;			
	}else if(graphicsObject.type == 1 || graphicsObject.type == 2){
	//alert("hiiii");
		if(object[1] == 0 && object[2] == 1){
			//console.log("1111111:::"+object[1]+","+object[2]);
			//console.log("1::"+graphicsObject.pointsArray[0]+"::2::"+graphicsObject.pointsArray[1]+"::3::"+graphicsObject.pointsArray[2]+"::4::"+graphicsObject.pointsArray[3]+"::5::"+graphicsObject.pointsArray[4]+"::6::"+graphicsObject.pointsArray[5]+"::7::"+graphicsObject.pointsArray[6]+"::8::"+graphicsObject.pointsArray[7]);
			editObject(graphicsObject,mouseX,mouseY,graphicsObject.pointsArray[4],graphicsObject.pointsArray[5],null,null);
			graphicsObject.pointsArray[0] = mouseX;
			graphicsObject.pointsArray[1] = mouseY;
			graphicsObject.pointsArray[2] = mouseX;
			graphicsObject.pointsArray[3] = graphicsObject.pointsArray[5];
			graphicsObject.pointsArray[4] = graphicsObject.pointsArray[4];
			graphicsObject.pointsArray[5] = graphicsObject.pointsArray[5];
			graphicsObject.pointsArray[6] = graphicsObject.pointsArray[4];
			graphicsObject.pointsArray[7] = mouseY;			
		}else if(object[1] == 2 && object[2] == 3){
			//console.log("22222222");
			editObject(graphicsObject,graphicsObject.pointsArray[6],graphicsObject.pointsArray[7],mouseX,mouseY,null,null);
			graphicsObject.pointsArray[2] = mouseX;
			graphicsObject.pointsArray[3] = mouseY;
			graphicsObject.pointsArray[0] = graphicsObject.pointsArray[6];
			graphicsObject.pointsArray[1] = mouseY;
			graphicsObject.pointsArray[4] = mouseX;
			graphicsObject.pointsArray[5] = graphicsObject.pointsArray[7];
			graphicsObject.pointsArray[6] = graphicsObject.pointsArray[6];
			graphicsObject.pointsArray[7] = graphicsObject.pointsArray[7];			
		}else if(object[1] == 4 && object[2] == 5){
			//console.log("33333333");
			editObject(graphicsObject,graphicsObject.pointsArray[0],graphicsObject.pointsArray[1],mouseX,mouseY,null,null);
			graphicsObject.pointsArray[4] = mouseX;
			graphicsObject.pointsArray[5] = mouseY;
			graphicsObject.pointsArray[0] = graphicsObject.pointsArray[0];
			graphicsObject.pointsArray[1] = graphicsObject.pointsArray[1];
			graphicsObject.pointsArray[2] = graphicsObject.pointsArray[0];
			graphicsObject.pointsArray[3] = mouseY;
			graphicsObject.pointsArray[6] = mouseX;
			graphicsObject.pointsArray[7] = graphicsObject.pointsArray[1];
		}else if(object[1] == 6 && object[2] == 7){
			//console.log("44444444");
			editObject(graphicsObject,graphicsObject.pointsArray[2],graphicsObject.pointsArray[3],mouseX,mouseY,null,null);
			graphicsObject.pointsArray[6] = mouseX;
			graphicsObject.pointsArray[7] = mouseY;
			graphicsObject.pointsArray[2] = graphicsObject.pointsArray[2];
			graphicsObject.pointsArray[3] = graphicsObject.pointsArray[3];
			graphicsObject.pointsArray[4] = graphicsObject.pointsArray[2];
			graphicsObject.pointsArray[5] = mouseY;
			graphicsObject.pointsArray[0] = mouseX;
			graphicsObject.pointsArray[1] = graphicsObject.pointsArray[3]; 
		}
		
		showSelectedObject(graphicsObject);
	}
}

function translateSelectedObject(objectTable,x,y){
//console.log("translateSelectedObject");
	var dx = x -  startX;
	var dy = y -  startY;
	shiftSelectedObject(objectTable,dx,dy)
}

function shiftSelectedObject(objectTable,dx,dy){
	//console.log("-----------------shiftSelectedObject:::"+selObjArray);
	  
	  //console.log("rectangleSelObject.pointsArray:::"+rectangleSelObject.pointsArray);
	 
	 
		 /*
		  transPointsArray[0] = pointsArray[0] + dx;
		  transPointsArray[1] = pointsArray[1] + dy;
		  transPointsArray[2] = pointsArray[2] + dx;
		  transPointsArray[3] = pointsArray[3] + dy;
		*/
		if(rectangleSelObject != null){
			var pointsArray = rectangleSelObject.pointsArray;
				  pointsArray[0] = pointsArray[0] + dx;
				  pointsArray[1] = pointsArray[1] + dy;
				  pointsArray[2] = pointsArray[2] + dx;
				  pointsArray[3] = pointsArray[3] + dy;
				  rectangleSelObject.pointsArray = pointsArray;
				  createObject(rectangleSelObject.type,pointsArray[0],pointsArray[1],pointsArray[2],pointsArray[3],triEndX,triEndY);
		}else{
			ctx.clearRect(0, 0, canvas.width, canvas.height);
			restore();
		}
		  if(selObjArray!= null){
			  for(var i=0;i<selObjArray.length;i++){
				var graphicsObject = objectTable.get(selObjArray[i]);
				//console.log("shifted object------"+graphicsObject.id+"type::"+graphicsObject.type);
				var pointsArr = graphicsObject.pointsArray;
					for(var j=0;j<pointsArr.length;j++){
						if(j%2 != 0){
							tempTranslatePointsArr[j] = pointsArr[j] + dy;
						}else{
							tempTranslatePointsArr[j] = pointsArr[j] + dx;
						}
						
					}
					var status = checkAllPointsInCanvas(tempTranslatePointsArr);
					if(!status){
						drawObject(objectTable,selObjArray[i],false);
						var graphicsObject = objectTable.get(selObjArray[i]);
						showSelectedObject(graphicsObject);
						break;
						
					}else{
						for(var j=0;j<pointsArr.length;j++){
							graphicsObject.pointsArray[j] = tempTranslatePointsArr[j];
						}
					}
					//console.log("status:::"+status+"::graphicsObject.pointsArray::"+graphicsObject.pointsArray);
					
					drawObject(objectTable,selObjArray[i],false);
					var graphicsObject = objectTable.get(selObjArray[i]);
					showSelectedObject(graphicsObject);
				
			  }
			}
			
			
	}
	
	function checkAllPointsInCanvas(pointsArr){
		var status = true;
		for(var ctr=0;ctr<pointsArr.length;ctr = ctr+2){
					var status = point_in_rectagnle(pointsArr[ctr],pointsArr[ctr+1],canvasBoundedRectanglePoints[0],canvasBoundedRectanglePoints[1],canvasBoundedRectanglePoints[2],canvasBoundedRectanglePoints[3]);
					//console.log("status::"+status+":X:"+pointsArr[ctr]+":Y:"+pointsArr[ctr+1]);
					if(!status){
							break;
						}
		}
		return status;
	}
/*
function checkPointsInObject(objectTable,isSingleRequire){
	var returnOnlySingle = false;
	if(objectTable != null){
		objectTable.moveLast();
		objectTable.next();
		//console.log("ObjectTable:::"+objectTable);
		while(objectTable.prev()){
		
		  if(returnOnlySingle && isSingleRequire){
			  break;
		  }
		  
		  var graphicsObject = objectTable.get(objectTable.getKey());
		  if(graphicsObject != null){
		  //console.log("graphicsObject:::"+graphicsObject);
		   switch(graphicsObject.type){
					case 1:
						//console.log("Rectangle");
						var pointsArr = graphicsObject.pointsArray;
						if(point_in_rectagnle(startX,startY,pointsArr[0],pointsArr[1],pointsArr[2],pointsArr[3])){
							if(checkObjInSelList(objectTable.getKey())){
								selObjArray[selObjArray.length] = objectTable.getKey();
							}
							returnOnlySingle = true;
						}

						break;
					case 2:
						ctx.beginPath();
						//console.log("oval");
						var pointsArr = graphicsObject.pointsArray;
						if(is_in_ellipse(startX,startY,pointsArr[0],pointsArr[1],pointsArr[2],pointsArr[3])){
							if(checkObjInSelList(objectTable.getKey())){
								selObjArray[selObjArray.length] = objectTable.getKey();
							}
							returnOnlySingle = true;
						}
						
						break;
					case 3:
						var pointsArr = graphicsObject.pointsArray;
						//console.log("points is::::"+points_is_onLine(startX,startY,pointsArr[0],pointsArr[1],pointsArr[2],pointsArr[3]));						
						break;
					case 4:
						var pointsArray = graphicsObject.pointsArray;
						break;
					case 5:
						var pointsArr = graphicsObject.pointsArray;
						//console.log("Triangle");
						if(is_in_triangle(startX,startY,pointsArr[0],pointsArr[1],pointsArr[2],pointsArr[3],pointsArr[4],pointsArr[5])){
							if(checkObjInSelList(objectTable.getKey())){
								selObjArray[selObjArray.length] = objectTable.getKey();
							}
							returnOnlySingle = true;
						}
						break;
					case 6:
						var pointsArr = graphicsObject.pointsArray;
						break;
						
					case 12:
						ctx.beginPath();
						//console.log("Circle");
						var pointsArr = graphicsObject.pointsArray;
						if(is_in_ellipse(startX,startY,pointsArr[0],pointsArr[1],pointsArr[2],pointsArr[3])){
							if(checkObjInSelList(objectTable.getKey())){
								selObjArray[selObjArray.length] = objectTable.getKey();
							}
							returnOnlySingle = true;
						}
						
						break;	
					}
		  		}
			}
	}
}*/

function isPointInPoly(poly, pt){
	for(var c = false, i = -1, l = poly.length, j = l - 1; ++i < l; j = i)
		((poly[i].y <= pt.y && pt.y < poly[j].y) || (poly[j].y <= pt.y && pt.y < poly[i].y))
		&& (pt.x < (poly[j].x - poly[i].x) * (pt.y - poly[i].y) / (poly[j].y - poly[i].y) + poly[i].x)
		&& (c = !c);
	return c;
}
function points(x,y){
  this.x = x;
  this.y = y;
}

function checkPointsInObject(objectTable,isSingleRequire){
	var returnOnlySingle = false;
	var returnObjArr = new Array();
	if(objectTable != null){
		objectTable.moveLast();
		objectTable.next();
		//console.log("ObjectTable:::"+objectTable);
		while(objectTable.prev()){
		  var graphicsObject = objectTable.get(objectTable.getKey());
		  			  if(returnOnlySingle && isSingleRequire){
				  break;
			  }

		  if(graphicsObject != null){
		  //console.log("graphicsObject:::"+graphicsObject);
			   switch(graphicsObject.type){
						case 1:
							var pointsArr = graphicsObject.pointsArray;
							
							var polyArr = new Array();
							var pt1 = new points(pointsArr[0],pointsArr[1]);
							var pt2 = new points(pointsArr[2],pointsArr[3]);
							var pt3 = new points(pointsArr[4],pointsArr[5]);
							var pt4 = new points(pointsArr[6],pointsArr[7]);
							polyArr[0] = pt1;
							polyArr[1] = pt2;
							polyArr[2] = pt3;
							polyArr[3] = pt4;
							
							var pt = new points(startX,startY);
							//console.log("Check points::::"+isPointInPoly(polyArr,pt));
							
							
							if(isPointInPoly(polyArr,pt)){
								returnObjArr[returnObjArr.length] = objectTable.getKey();
								
								returnOnlySingle = true;
							}
							break;
						case 2:
							var pointsArr = graphicsObject.pointsArray;
							
							var polyArr = new Array();
							var pt1 = new points(pointsArr[0],pointsArr[1]);
							var pt2 = new points(pointsArr[2],pointsArr[3]);
							var pt3 = new points(pointsArr[4],pointsArr[5]);
							var pt4 = new points(pointsArr[6],pointsArr[7]);
							polyArr[0] = pt1;
							polyArr[1] = pt2;
							polyArr[2] = pt3;
							polyArr[3] = pt4;
							
							var pt = new points(startX,startY);
							//console.log("Check points::::"+isPointInPoly(polyArr,pt));
							
							
							if(isPointInPoly(polyArr,pt)){
								returnObjArr[returnObjArr.length] = objectTable.getKey();
								
								returnOnlySingle = true;
							}
							
							break;
						case 3:
							var pointsArray = graphicsObject.pointsArray;
							if(is_in_path(startX, startY, pointsArray,graphicsObject.lineWidth)){
								returnObjArr[returnObjArr.length] = objectTable.getKey();
								//console.log("Return Object Array::"+returnObjArr);
								isFreeHandSelected = true;
								returnOnlySingle = true;
							}
							break;
						case 4:
							var pointsArray = graphicsObject.pointsArray;
							if(is_in_path(startX, startY, pointsArray,graphicsObject.lineWidth)){
								returnObjArr[returnObjArr.length] = objectTable.getKey();
								//console.log("Return Object Array::"+returnObjArr);
								isFreeHandSelected = true;
								returnOnlySingle = true;
							}
							break;
						case 5:
							var pointsArr = graphicsObject.pointsArray;
							//console.log("Triangle");
							if(is_in_triangle(startX,startY,pointsArr[0],pointsArr[1],pointsArr[2],pointsArr[3],pointsArr[4],pointsArr[5])){
								returnObjArr[returnObjArr.length] = objectTable.getKey();
								/*
								if(checkObjInSelList(objectTable.getKey())){
									selObjArray[selObjArray.length] = objectTable.getKey();
								}*/
								returnOnlySingle = true;
							}
							break;
						case 6:
							var pointsArray = graphicsObject.pointsArray;
							if(is_in_path(startX, startY, pointsArray,graphicsObject.lineWidth)){
								returnObjArr[returnObjArr.length] = objectTable.getKey();
								//console.log("Return Object Array::"+returnObjArr);
								isFreeHandSelected = true;
								returnOnlySingle = true;
							}
							break;
						case 8:
							var pointsArr = graphicsObject.pointsArray;
							if(point_in_rectagnle(startX,startY,pointsArr[0],pointsArr[1],pointsArr[2],pointsArr[3])){
								//console.log("pointsArr[0]::"+pointsArr[0]+"pointsArr[1]::"+pointsArr[1]+"pointsArr[2]::"+pointsArr[2]+"pointsArr[3]::"+pointsArr[3]);
								returnObjArr[returnObjArr.length] = objectTable.getKey();
								
								returnOnlySingle = true;
							}
							break;
							
						case 11:
							var pointsArr = graphicsObject.pointsArray;
							//console.log("Arc");
							if(is_in_triangle(startX,startY,pointsArr[0],pointsArr[1],pointsArr[2],pointsArr[3],pointsArr[4],pointsArr[5])){
								returnObjArr[returnObjArr.length] = objectTable.getKey();
								/*if(checkObjInSelList(objectTable.getKey())){
									selObjArray[selObjArray.length] = objectTable.getKey();
									}*/
							returnOnlySingle = true;
							}
							break;	
						
						case 12:
							ctx.beginPath();
							//console.log("Circle");
							var ptsArr = graphicsObject.pointsArray;
							//var ptsArr = getCircleBoundedSquare(pointsArr[0],pointsArr[1],pointsArr[2],pointsArr[3]);
							if(is_in_ellipse(startX,startY,ptsArr[0],ptsArr[1],ptsArr[2],ptsArr[3])){
								returnObjArr[returnObjArr.length] = objectTable.getKey();
								/*if(checkObjInSelList(objectTable.getKey())){
									selObjArray[selObjArray.length] = objectTable.getKey();
								}*/
								returnOnlySingle = true;
							}
						
						break;
						case 13:
							var pointsArr = graphicsObject.pointsArray;
							//console.log("Triangle");
							if(is_in_triangle(startX,startY,pointsArr[0],pointsArr[1],pointsArr[2],pointsArr[3],pointsArr[4],pointsArr[5])){
								returnObjArr[returnObjArr.length] = objectTable.getKey();
								/*
								if(checkObjInSelList(objectTable.getKey())){
									selObjArray[selObjArray.length] = objectTable.getKey();
								}*/
								returnOnlySingle = true;
							}
							break;
						case 16:
							var pointsArr = graphicsObject.pointsArray;
							if(point_in_rectagnle(startX,startY,pointsArr[0],pointsArr[1],pointsArr[2],pointsArr[3])){
								returnObjArr[returnObjArr.length] = objectTable.getKey();
								
								returnOnlySingle = true;
							}
							
							break;
						case 23:
							var pointsArr = graphicsObject.pointsArray;
							
							var polyArr = new Array();
							var pt1 = new points(pointsArr[0],pointsArr[1]);
							var pt2 = new points(pointsArr[2],pointsArr[3]);
							var pt3 = new points(pointsArr[4],pointsArr[5]);
							var pt4 = new points(pointsArr[6],pointsArr[7]);
							polyArr[0] = pt1;
							polyArr[1] = pt2;
							polyArr[2] = pt3;
							polyArr[3] = pt4;
							
							var pt = new points(startX,startY);
							//console.log("Check points::::"+isPointInPoly(polyArr,pt));
							
							
							if(isPointInPoly(polyArr,pt)){
								returnObjArr[returnObjArr.length] = objectTable.getKey();
								
								returnOnlySingle = true;
							}
							break;
						}
				}
			}
	}
	return returnObjArr;
	
}
function getCircleBoundedSquare(x1, y1, x2, y2){
	var r = distanceBetween(x1, y1, x2, y2);
	var boundedSqrPointsArr =  new Array();
		boundedSqrPointsArr[0] = x1-r;
		boundedSqrPointsArr[1] = y1-r;
		boundedSqrPointsArr[2] = x1+r;
		boundedSqrPointsArr[3] = y1+r;
	return boundedSqrPointsArr;
		
}

function checkOpenObjectForSelection(objectTable,x,y){
	if(objectTable != null){
	//	//console.log("-------checkOpenObjectForSelection  called------------------"+objectTable.size());
		objectTable.moveFirst();
		while(objectTable.next()){
			var graphicsObject = objectTable.get(objectTable.getKey());
			var arr = graphicsObject.pointsArray;
			if(graphicsObject.type ==3 ||graphicsObject.type ==4 || graphicsObject.type ==6){
					if (is_in_path(x, y,arr,graphicsObject.lineWidth)){
						break;
					}
				}
		}
	}

}
function checkSelectedObjectZoomableState(objectTable,x,y){
	 for(var i=0;i<selObjArray.length;i++){	
		var graphicsObject = objectTable.get(selObjArray[i]);
		var pointsArr = graphicsObject.pointsArray;
		if(graphicsObject.type ==8){
			if(point_in_rectagnle(x,y,pointsArr[0],pointsArr[1],pointsArr[2],pointsArr[3])){
				zoomableObj = graphicsObject;
				setZoomType(zoomType);
			}else{
				canvas.style.cursor  = "default";
				zoomableObj = null; 
			}
		}else{
			canvas.style.cursor  = "default";
			zoomableObj = null; 
			continue;
		}
	}
}


function checkSelectedObjectStrechableState(objectTable,x,y){
     //console.log("----------------checkSelectedObjectStrechableState-------------"+selObjArray);
	 for(var i=0;i<selObjArray.length;i++){	
		var graphicsObject = objectTable.get(selObjArray[i]);
		var arr = graphicsObject.pointsArray;
		
		if(graphicsObject.type ==5 || graphicsObject.type == 11 || graphicsObject.type == 13){
			if(is_in_ellipse(x,y,arr[0]-selCircleRedius,arr[1]-selCircleRedius,arr[0]+selCircleRedius,arr[1]+selCircleRedius)){
					//console.log("inside Selection"+canvas.style.cursor);
					strechableObj[0] = graphicsObject
					strechableObj[1] = 0;
					strechableObj[2] = 1;
					if(isRotaionEnable){
						canvas.style.cursor  = "pointer";
					}else{
						canvas.style.cursor  = "move";
					}
					
					break;
				}else if(is_in_ellipse(x,y,arr[2]-selCircleRedius,arr[3]-selCircleRedius,arr[2]+selCircleRedius,arr[3]+selCircleRedius)){
					//console.log("inside Selection"+canvas.style.cursor);
					strechableObj[0] = graphicsObject
					strechableObj[1] = 2;
					strechableObj[2] = 3;
					if(isRotaionEnable){
						canvas.style.cursor  = "pointer";
					}else{
						canvas.style.cursor  = "move";
					}
					break;
				}else if(is_in_ellipse(x,y,arr[4]-selCircleRedius,arr[5]-selCircleRedius,arr[4]+selCircleRedius,arr[5]+selCircleRedius)){
					//console.log("inside Selection"+canvas.style.cursor);
					strechableObj[0] = graphicsObject
					strechableObj[1] = 4;
					strechableObj[2] = 5;
					if(isRotaionEnable){
						canvas.style.cursor  = "pointer";
					}else{
						canvas.style.cursor  = "move";
					}
					break;
				}else{
					canvas.style.cursor  = "default";
					strechableObj[0] = null;
					strechableObj[1] = null;
					strechableObj[2] = null;
					
				}
		
		}else if(graphicsObject.type == 4){
				var pt = getMinMax(arr);
				arr = null;
				arr =  new Array();
				arr[0] = pt.minX;
				arr[1] = pt.minY;
				arr[2] = pt.maxX;
				arr[3] = pt.maxY;
			
			
				if(is_in_ellipse(x,y,arr[0]-selCircleRedius,arr[1]-selCircleRedius,arr[0]+selCircleRedius,arr[1]+selCircleRedius)){
					//console.log("inside Selection 1st"+canvas.style.cursor);
					strechableObj[0] = graphicsObject;
					strechableObj[1] = 0;
					strechableObj[2] = 1;
					if(isRotaionEnable){
						canvas.style.cursor  = "pointer";
					}
					
					break;
				}else if(is_in_ellipse(x,y,arr[0]-selCircleRedius,arr[3]-selCircleRedius,arr[0]+selCircleRedius,arr[3]+selCircleRedius)){
					//console.log("inside Selection 2nd"+canvas.style.cursor);
					strechableObj[0] = graphicsObject;
					strechableObj[1] = 0;
					strechableObj[2] = 3;
					if(isRotaionEnable){
						canvas.style.cursor  = "pointer";
					}
					break;
				}else if(is_in_ellipse(x,y,arr[2]-selCircleRedius,arr[1]-selCircleRedius,arr[2]+selCircleRedius,arr[1]+selCircleRedius)){
					//console.log("inside Selection 3rd"+canvas.style.cursor);
					strechableObj[0] = graphicsObject;
					strechableObj[1] = 2;
					strechableObj[2] = 3;
					if(isRotaionEnable){
						canvas.style.cursor  = "pointer";
					}
					break;
				}else if(is_in_ellipse(x,y,arr[2]-selCircleRedius,arr[3]-selCircleRedius,arr[2]+selCircleRedius,arr[3]+selCircleRedius)){
					//console.log("inside Selection 4th"+canvas.style.cursor);
					strechableObj[0] = graphicsObject
					strechableObj[1] = 2;
					strechableObj[2] = 3;
					if(isRotaionEnable){
						canvas.style.cursor  = "pointer";
					}
					break;
				}else{
					canvas.style.cursor  = "default";
					strechableObj[0] = null;
					strechableObj[1] = null;
					strechableObj[2] = null;
					
				}
				
		}else if(graphicsObject.type == 3){
			if(is_in_ellipse(x,y,arr[0]-selCircleRedius,arr[1]-selCircleRedius,arr[0]+selCircleRedius,arr[1]+selCircleRedius)){
					
					strechableObj[0] = graphicsObject
					strechableObj[1] = arr[2];
					strechableObj[2] = arr[3];
					if(isRotaionEnable){
						canvas.style.cursor  = "pointer";
					}else{
						canvas.style.cursor  = "move";
					}
					//console.log("inside Selection"+canvas.style.cursor);
					break;
				}else if(is_in_ellipse(x,y,arr[2]-selCircleRedius,arr[3]-selCircleRedius,arr[2]+selCircleRedius,arr[3]+selCircleRedius)){
					//console.log("inside Selection"+canvas.style.cursor);
					strechableObj[0] = graphicsObject
					strechableObj[1] = arr[0];
					strechableObj[2] = arr[1];
					if(isRotaionEnable){
						canvas.style.cursor  = "pointer";
					}else{
						canvas.style.cursor  = "move";
					}
					//console.log("inside Selection"+canvas.style.cursor);
					break;
				}else{
					canvas.style.cursor  = "default";
					strechableObj[0] = null;
					strechableObj[1] = null;
					strechableObj[2] = null;
					
				}
		
		}else if(graphicsObject.type == 6){
			if(is_in_ellipse(x,y,arr[0]-selCircleRedius,arr[1]-selCircleRedius,arr[0]+selCircleRedius,arr[1]+selCircleRedius)){
					
					strechableObj[0] = graphicsObject
					strechableObj[1] = arr[2];
					strechableObj[2] = arr[3];
					strechableObj[3] = true;
					if(isRotaionEnable){
						canvas.style.cursor  = "pointer";
					}else{
						canvas.style.cursor  = "move";
					}
					//console.log("inside Selection"+canvas.style.cursor);
					break;
				}else if(is_in_ellipse(x,y,arr[2]-selCircleRedius,arr[3]-selCircleRedius,arr[2]+selCircleRedius,arr[3]+selCircleRedius)){
					//console.log("inside Selection"+canvas.style.cursor);
					strechableObj[0] = graphicsObject
					strechableObj[1] = arr[0];
					strechableObj[2] = arr[1];
					strechableObj[3] = false;
					if(isRotaionEnable){
						canvas.style.cursor  = "pointer";
					}else{
						canvas.style.cursor  = "move";
					}
					//console.log("inside Selection"+canvas.style.cursor);
					break;
				}else{
					canvas.style.cursor  = "default";
					strechableObj[0] = null;
					strechableObj[1] = null;
					strechableObj[2] = null;
					
				}
		
		}else if(graphicsObject.type == 12 ){
				//console.log("a1::"+arr[0]+"::a2::"+arr[1]+"::b1::"+arr[2]+"::b2::"+arr[3]);
				if(is_in_ellipse(x,y,arr[0]-selCircleRedius,arr[1]-selCircleRedius,arr[0]+selCircleRedius,arr[1]+selCircleRedius)){
					//console.log("inside Selection of point 1"+canvas.style.cursor);
					strechableObj[0] = graphicsObject
					strechableObj[1] = 0;
					strechableObj[2] = 1;
					strechableObj[3] = 1;
					if(isRotaionEnable){
						canvas.style.cursor  = "pointer";
					}else{
						canvas.style.cursor  = "move";
					}
					
					break;
				}else if(is_in_ellipse(x,y,arr[0]-selCircleRedius,arr[3]-selCircleRedius,arr[0]+selCircleRedius,arr[3]+selCircleRedius)){
					//console.log("inside Selection of point 2"+canvas.style.cursor);
					strechableObj[0] = graphicsObject
					strechableObj[1] = 0;
					strechableObj[2] = 3;
					strechableObj[3] = 2;
					if(isRotaionEnable){
						canvas.style.cursor  = "pointer";
					}else{
						canvas.style.cursor  = "move";
					}
					break;
				}else if(is_in_ellipse(x,y,arr[2]-selCircleRedius,arr[1]-selCircleRedius,arr[2]+selCircleRedius,arr[1]+selCircleRedius)){
					//console.log("inside Selection of point 3"+canvas.style.cursor);
					strechableObj[0] = graphicsObject
					strechableObj[1] = 2;
					strechableObj[2] = 1;
					strechableObj[3] = 3;
					if(isRotaionEnable){
						canvas.style.cursor  = "pointer";
					}else{
						canvas.style.cursor  = "move";
					}
					break;
				}else if(is_in_ellipse(x,y,arr[2]-selCircleRedius,arr[3]-selCircleRedius,arr[2]+selCircleRedius,arr[3]+selCircleRedius)){
					//console.log("inside Selection of point 4"+canvas.style.cursor);
					strechableObj[0] = graphicsObject
					strechableObj[1] = 2;
					strechableObj[2] = 3;
					strechableObj[3] = 4;
					if(isRotaionEnable){
						canvas.style.cursor  = "pointer";
					}else{
						canvas.style.cursor  = "move";
					}
					break;
				}else{
				//console.log("555555555555555555555555555555");
					canvas.style.cursor  = "default";
					strechableObj[0] = null;
					strechableObj[1] = null;
					strechableObj[2] = null;
					
				}
			}else if(graphicsObject.type == 1 || graphicsObject.type == 2 || graphicsObject.type == 23){
				if(is_in_ellipse(x,y,arr[0]-selCircleRedius,arr[1]-selCircleRedius,arr[0]+selCircleRedius,arr[1]+selCircleRedius)){
					//console.log("inside Selection1"+canvas.style.cursor);
					strechableObj[0] = graphicsObject
					strechableObj[1] = 0;
					strechableObj[2] = 1;
					if(isRotaionEnable){
						canvas.style.cursor  = "pointer";
					}else{
						canvas.style.cursor  = "move";
					}
					
					break;
				}else if(is_in_ellipse(x,y,arr[2]-selCircleRedius,arr[3]-selCircleRedius,arr[2]+selCircleRedius,arr[3]+selCircleRedius)){
					//console.log("inside Selection2"+canvas.style.cursor);
					strechableObj[0] = graphicsObject
					strechableObj[1] = 2;
					strechableObj[2] = 3;
					if(isRotaionEnable){
						canvas.style.cursor  = "pointer";
					}else{
						canvas.style.cursor  = "move";
					}
					break;
				}else if(is_in_ellipse(x,y,arr[4]-selCircleRedius,arr[5]-selCircleRedius,arr[4]+selCircleRedius,arr[5]+selCircleRedius)){
					//console.log("inside Selection3"+canvas.style.cursor);
					strechableObj[0] = graphicsObject
					strechableObj[1] = 4;
					strechableObj[2] = 5;
					if(isRotaionEnable){
						canvas.style.cursor  = "pointer";
					}else{
						canvas.style.cursor  = "move";
					}
					break;
				}else if(is_in_ellipse(x,y,arr[6]-selCircleRedius,arr[7]-selCircleRedius,arr[6]+selCircleRedius,arr[7]+selCircleRedius)){
					//console.log("inside Selection4"+canvas.style.cursor);
					strechableObj[0] = graphicsObject
					strechableObj[1] = 6;
					strechableObj[2] = 7;
					if(isRotaionEnable){
						canvas.style.cursor  = "pointer";
					}else{
						canvas.style.cursor  = "move";
					}
					break;
				}else{
					canvas.style.cursor  = "default";
					strechableObj[0] = null;
					strechableObj[1] = null;
					strechableObj[2] = null;
					
				}
			}
		
		
		
	}
}



function checkPointsInSelectionState(graphicsObject,x,y){

	//console.log("----------------checkPointsInSelectionState-------------"+graphicsObject);
	
		var arr = graphicsObject.pointsArray;
		
		if(graphicsObject.type ==1 || graphicsObject.type == 2 ||graphicsObject.type == 8 || graphicsObject.type == 12 ){
		
				if(is_in_ellipse(x,y,arr[0]-selCircleRedius,arr[1]-selCircleRedius,arr[0]+selCircleRedius,arr[1]+selCircleRedius)){
					//console.log("inside Selection"+canvas.style.cursor);
					 return true;
					
				}else if(is_in_ellipse(x,y,arr[0]-selCircleRedius,arr[3]-selCircleRedius,arr[0]+selCircleRedius,arr[3]+selCircleRedius)){
					//console.log("inside Selection"+canvas.style.cursor);
					 return true;
					
				}else if(is_in_ellipse(x,y,arr[2]-selCircleRedius,arr[1]-selCircleRedius,arr[2]+selCircleRedius,arr[1]+selCircleRedius)){
					//console.log("inside Selection"+canvas.style.cursor);
					 return true;
				
				}else if(is_in_ellipse(x,y,arr[2]-selCircleRedius,arr[3]-selCircleRedius,arr[2]+selCircleRedius,arr[3]+selCircleRedius)){
					//console.log("inside Selection"+canvas.style.cursor);
					 return true;
					
				}else{
					//console.log("555555555555555555555555555555");
					 return false;
				}
				
		}else if(graphicsObject.type ==5 ){
			if(is_in_ellipse(x,y,arr[0]-selCircleRedius,arr[1]-selCircleRedius,arr[0]+selCircleRedius,arr[1]+selCircleRedius)){
					return true;
					
				}else if(is_in_ellipse(x,y,arr[2]-selCircleRedius,arr[3]-selCircleRedius,arr[2]+selCircleRedius,arr[3]+selCircleRedius)){
					return true;
					
				}else if(is_in_ellipse(x,y,arr[4]-selCircleRedius,arr[5]-selCircleRedius,arr[4]+selCircleRedius,arr[5]+selCircleRedius)){
					return true;
					
				}else{
					 return false;
				}
		
		}else if(graphicsObject.type == 3 || graphicsObject.type == 6){
				if(is_in_ellipse(x,y,arr[0]-selCircleRedius,arr[1]-selCircleRedius,arr[0]+selCircleRedius,arr[1]+selCircleRedius)){
					 return true;
				}else if(is_in_ellipse(x,y,arr[2]-selCircleRedius,arr[3]-selCircleRedius,arr[2]+selCircleRedius,arr[3]+selCircleRedius)){
					 return true;
				}else{
					 return false;
				}
		}
}









function checkObjInSelList(selectedObjArray,key){
	var pos = -1
	for(i=0;i<selectedObjArray.length;i++){
		if(selectedObjArray[i] == key){
			/*selectedObjArray[i] = null;
			selObjArray.splice(i ,1);*/
			pos = i;
		}
	}
	return pos;
}

function highlightObject(objectTable){
	objectTable.moveFirst();
	//console.log("ObjectTable:::"+objectTable);
	while(objectTable.next()){
	  var graphicsObject = objectTable.get(objectTable.getKey());
	   switch(graphicsObject.type){
				case 1:
					var pointsArr = graphicsObject.pointsArray;
					
					if(point_in_rectagnle(startX,startY,pointsArr[0],pointsArr[1],pointsArr[2],pointsArr[3])){
						if(highlightedObj != null){
						   if(highlightedObj.id < graphicsObject.id){
								highlightedObj = graphicsObject;
						   }
						}else{
							highlightedObj = graphicsObject;
						}
					}

					break;
				case 2:
					ctx.beginPath();
					var pointsArr = graphicsObject.pointsArray;
					if(is_in_ellipse(startX,startY,pointsArr[0],pointsArr[1],pointsArr[2],pointsArr[3])){
						if(highlightedObj != null){
						   if(highlightedObj.id < graphicsObject.id){
								highlightedObj = graphicsObject;
						   }
						}else{
							highlightedObj = graphicsObject;
						}
					}
					
					break;
				case 3:
					var pointsArr = graphicsObject.pointsArray;
					//console.log("points is::::"+points_is_onLine(startX,startY,pointsArr[0],pointsArr[1],pointsArr[2],pointsArr[3]));						
					break;
				case 4:
					var pointsArray = graphicsObject.pointsArray;
					break;
				case 5:
					var pointsArr = graphicsObject.pointsArray;
					//console.log("startX:::;"+startX+"::startY:::"+startY);
					if(is_in_triangle(startX,startY,pointsArr[0],pointsArr[1],pointsArr[2],pointsArr[3],pointsArr[4],pointsArr[5])){
						if(highlightedObj != null){
						   if(highlightedObj.id < graphicsObject.id){
								highlightedObj = graphicsObject;
						   }
						}else{
							highlightedObj = graphicsObject;
						}
					}
					break;
				case 6:
					var pointsArr = graphicsObject.pointsArray;
					break;
					
				case 11:
					var pointsArr = graphicsObject.pointsArray;
					//console.log("startX:::;"+startX+"::startY:::"+startY);
					if(is_in_triangle(startX,startY,pointsArr[0],pointsArr[1],pointsArr[2],pointsArr[3],pointsArr[4],pointsArr[5])){
						if(highlightedObj != null){
						   if(highlightedObj.id < graphicsObject.id){
								highlightedObj = graphicsObject;
						   }
						}else{
							highlightedObj = graphicsObject;
						}
					}
					break;	
					
				case 12:
					ctx.beginPath();
					var pointsArr = graphicsObject.pointsArray;
					if(is_in_ellipse(startX,startY,pointsArr[0],pointsArr[1],pointsArr[2],pointsArr[3])){
						if(highlightedObj != null){
						   if(highlightedObj.id < graphicsObject.id){
								highlightedObj = graphicsObject;
						   }
						}else{
							highlightedObj = graphicsObject;
						}
					}
					
					break;
				
				case 13:
				    var pointsArr = graphicsObject.pointsArray;
					//console.log("startX:::;"+startX+"::startY:::"+startY);
					if(is_in_triangle(startX,startY,pointsArr[0],pointsArr[1],pointsArr[2],pointsArr[3],pointsArr[4],pointsArr[5])){
						if(highlightedObj != null){
						   if(highlightedObj.id < graphicsObject.id){
								highlightedObj = graphicsObject;
						   }
						}else{
							highlightedObj = graphicsObject;
						}
					}
				}
	}
	if(highlightedObj != null){ 
		ctx.clearRect(0, 0, canvas.width, canvas.height);
		restore();
		//drawObject(objectTable,highlightedObj.id,true);
		showSelectedObject(highlightedObj);
	}
}

function showSelection(arr){

		ctx.beginPath();
		ctx.strokeStyle = "black";
		ctx.lineWidth= 2;
		
		createOval(arr[0]-selCircleRedius,arr[1]-selCircleRedius,arr[0]+selCircleRedius,arr[1]+selCircleRedius);
		ctx.closePath() ;
		ctx.moveTo(arr[0]+selCircleRedius,arr[3]);
		createOval(arr[0]-selCircleRedius,arr[3]-selCircleRedius,arr[0]+selCircleRedius,arr[3]+selCircleRedius);
		ctx.closePath() ;
		ctx.moveTo(arr[2]+selCircleRedius,arr[1]);
		createOval(arr[2]-selCircleRedius,arr[1]-selCircleRedius,arr[2]+selCircleRedius,arr[1]+selCircleRedius);
		ctx.closePath() ;
		ctx.moveTo(arr[2]+selCircleRedius,arr[3]);
		createOval(arr[2]-selCircleRedius,arr[3]-selCircleRedius,arr[2]+selCircleRedius,arr[3]+selCircleRedius);
		ctx.closePath() ;
		ctx.moveTo(arr[0],arr[1]);
		
		// ctx.closePath() ;
		ctx.stroke() ;
	

}

function is_in_Text(tx,ty,graphicsObject){
	var currentGAlpha = ctx.globalAlpha;
	var pointsArr = graphicsObject.pointsArray;
			ctx.beginPath();
			ctx.strokeStyle = "red";
			//console.log("is_in_Text::::::");
			ctx.globalAlpha = 100;
			fontStyle = "30px bethhandfont";
			createText(graphicsObject.text,pointsArr[0],pointsArr[1],graphicsObject.color);
			ctx.stroke();
		
			//console.log("endTm----"+endTm);
			//console.log("Time taken---"+(endTm-stTime));
			
			if (ctx.isPointInStroke(tx, ty)){
			 //console.log("is_in_Text true");
				canvas.style.cursor = "pointer"
				ctx.globalAlpha = currentGAlpha;
				return true;
			}else {
			  //console.log("is_in_Text false");
				canvas.style.cursor = "default"
				ctx.globalAlpha = currentGAlpha;
				return false;
			}	
}









function is_in_path(tx,ty,pointsArray,strokeWidth){
	var currentGAlpha = ctx.globalAlpha;
			ctx.beginPath();
			var stTime =  new Date().getTime();
			//console.log("stTime:::"+stTime); 
			ctx.strokeStyle = "red";
			ctx.lineWidth= parseInt(strokeWidth) + 10;
			//console.log("ctx.lineWidth::::::"+ctx.lineWidth);
			ctx.globalAlpha = 0;
			drawFreeHandLine(pointsArray);
			ctx.stroke();
			var endTm =  new Date().getTime();
			//console.log("endTm----"+endTm);
			//console.log("Time taken---"+(endTm-stTime));
			
			if (ctx.isPointInStroke(tx, ty)){
			  //console.log("is_in_path true");
				canvas.style.cursor = "pointer"
				ctx.globalAlpha = currentGAlpha;
				return true;
			}else {
			   //console.log("is_in_path false");
				canvas.style.cursor = "default"
				ctx.globalAlpha = currentGAlpha;
				return false;
			}	
}

function showSelectedObject(objectSel){
	//console.log("showSelectedObject:::;;"+objectSel);
	var arr = objectSel.pointsArray;
	var selectionColor = "#3D0079";
	ctx.fillStyle = "#3D0079";;
	
	if(isRotaionEnable){
		ctx.fillStyle = "#00FF00";
		selectionColor = "#00FF00";
	}
	/*if(objectSel.type == 12){
		arr = getCircleBoundedSquare(arr[0],arr[1],arr[2],arr[3]);
	}*/
	if(objectSel.type == 12 ||objectSel.type == 8 || objectSel.type == 16){
		//console.log("selected----------"+ctx.lineWidth + "::"+ctx.strokeStyle);
		
		ctx.beginPath();
		ctx.strokeStyle = selectionColor;
		ctx.lineWidth= 2;
		
		createOval(arr[0]- selCircleRedius,arr[1]-selCircleRedius,arr[0]+selCircleRedius,arr[1]+selCircleRedius);
		ctx.fill();
		ctx.closePath() ;
		ctx.moveTo(arr[0]+selCircleRedius,arr[3]);
		createOval(arr[0]-selCircleRedius,arr[3]-selCircleRedius,arr[0]+selCircleRedius,arr[3]+selCircleRedius);
		ctx.fill();
		ctx.closePath() ;
		ctx.moveTo(arr[2]+selCircleRedius,arr[1]);
		createOval(arr[2]-selCircleRedius,arr[1]-selCircleRedius,arr[2]+selCircleRedius,arr[1]+selCircleRedius);
		ctx.fill();
		ctx.closePath() ;
		ctx.moveTo(arr[2]+selCircleRedius,arr[3]);
		createOval(arr[2]-selCircleRedius,arr[3]-selCircleRedius,arr[2]+selCircleRedius,arr[3]+selCircleRedius);
		ctx.fill();
		ctx.closePath() ;
		ctx.moveTo(arr[0],arr[1]);
		
		// ctx.closePath() ;
		ctx.stroke() ;
	}else if(objectSel.type == 5 || objectSel.type ==11 ||objectSel.type ==13){
		//console.log("selected----------"+ctx.lineWidth + "::"+ctx.strokeStyle);
		
		ctx.beginPath();
		ctx.strokeStyle = selectionColor;
		ctx.lineWidth= 2;
		
		createOval(arr[0]-selCircleRedius,arr[1]-selCircleRedius,arr[0]+selCircleRedius,arr[1]+selCircleRedius);
		ctx.fill();
		ctx.closePath() ;
		ctx.moveTo(arr[2]+selCircleRedius,arr[3]);
		
	//	createRectangle(arr[0]-10,arr[3]-10,arr[0]+10,arr[3]+10);
		
		//createRectangle(arr[2]-10,arr[1]-10,arr[2]+10,arr[1]+10);
		
		createOval(arr[2]-selCircleRedius,arr[3]-selCircleRedius,arr[2]+selCircleRedius,arr[3]+selCircleRedius);
		ctx.fill();
		ctx.closePath() ;
		ctx.moveTo(arr[4]+selCircleRedius,arr[5]);
		
        //createRectangle(arr[4]-10,arr[3]-10,arr[4]+10,arr[3]+10);
		
		createOval(arr[4]-selCircleRedius,arr[5]-selCircleRedius,arr[4]+selCircleRedius,arr[5]+selCircleRedius);
		ctx.fill();
		ctx.closePath() ;
		ctx.moveTo(arr[2],arr[3]);
		
		
		//ctx.closePath() ;
		ctx.stroke() ;
		
	}else if(objectSel.type == 4){
		ctx.beginPath();
		ctx.strokeStyle = selectionColor;
		ctx.lineWidth= 2;
		var pt = getMinMax(arr);
		arr = null;
		arr =  new Array();
		arr[0] = pt.minX;
		arr[1] = pt.minY;
		arr[2] = pt.maxX;
		arr[3] = pt.maxY;
		createOval(arr[0]- selCircleRedius,arr[1]-selCircleRedius,arr[0]+selCircleRedius,arr[1]+selCircleRedius);
		ctx.fill();
		ctx.closePath() ;
		ctx.moveTo(arr[0]+selCircleRedius,arr[3]);
		createOval(arr[0]-selCircleRedius,arr[3]-selCircleRedius,arr[0]+selCircleRedius,arr[3]+selCircleRedius);
		ctx.fill();
		ctx.closePath() ;
		ctx.moveTo(arr[2]+selCircleRedius,arr[1]);
		createOval(arr[2]-selCircleRedius,arr[1]-selCircleRedius,arr[2]+selCircleRedius,arr[1]+selCircleRedius);
		ctx.fill();
		ctx.closePath() ;
		ctx.moveTo(arr[2]+selCircleRedius,arr[3]);
		createOval(arr[2]-selCircleRedius,arr[3]-selCircleRedius,arr[2]+selCircleRedius,arr[3]+selCircleRedius);
		ctx.fill();
		ctx.closePath() ;
		ctx.moveTo(arr[0],arr[1]);
		
		// ctx.closePath() ;
		ctx.stroke() ;
		//alert("done");
	
	}else if(objectSel.type == 3 || objectSel.type == 6){
	ctx.beginPath();
		ctx.strokeStyle = selectionColor;
		ctx.lineWidth= 2;
		
		createOval(arr[0]- selCircleRedius,arr[1]-selCircleRedius,arr[0]+selCircleRedius,arr[1]+selCircleRedius);
		ctx.fill();
		ctx.closePath() ;
		ctx.moveTo(arr[2]+selCircleRedius,arr[3]);
		createOval(arr[2]-selCircleRedius,arr[3]-selCircleRedius,arr[2]+selCircleRedius,arr[3]+selCircleRedius);
		ctx.fill();
		ctx.closePath() ;
		ctx.moveTo(arr[0],arr[1]);
		
		// ctx.closePath() ;
		ctx.stroke() ;
	
	}else if(objectSel.type == 1 || objectSel.type == 2 || objectSel.type == 23 ){
		//console.log("objectSel.type:::"+objectSel.type);
		ctx.beginPath();
		ctx.strokeStyle = selectionColor;
		ctx.lineWidth= 2;
		
		createOval(arr[0]-selCircleRedius,arr[1]-selCircleRedius,arr[0]+selCircleRedius,arr[1]+selCircleRedius);
		//console.log("111111111");
		ctx.fill();
		ctx.closePath() ;
		ctx.moveTo(arr[2]+selCircleRedius,arr[3]);
		
		createOval(arr[2]-selCircleRedius,arr[3]-selCircleRedius,arr[2]+selCircleRedius,arr[3]+selCircleRedius);
		console.log("2222222");
		//ctx.fill();
		ctx.closePath() ;
		ctx.moveTo(arr[4]+selCircleRedius,arr[5]);
		
        createOval(arr[4]-selCircleRedius,arr[5]-selCircleRedius,arr[4]+selCircleRedius,arr[5]+selCircleRedius);
		//console.log("333333");
		ctx.fill();
		ctx.closePath() ;
		ctx.moveTo(arr[6],arr[7]);
		
		createOval(arr[6]-selCircleRedius,arr[7]-selCircleRedius,arr[6]+selCircleRedius,arr[7]+selCircleRedius);
		//console.log("444444444");
		ctx.fill();
		ctx.closePath() ;
		ctx.moveTo(arr[0],arr[1]);
	
	ctx.stroke() ;
	
	}
	
	ctx.strokeStyle = styleColor;
	ctx.lineWidth = lineWidth;
	
}
function is_in_triangle (px,py,ax,ay,bx,by,cx,cy){
	var v0 = [cx-ax,cy-ay];
	var v1 = [bx-ax,by-ay];
	var v2 = [px-ax,py-ay];
	var dot00 = (v0[0]*v0[0]) + (v0[1]*v0[1]);
	var dot01 = (v0[0]*v1[0]) + (v0[1]*v1[1]);
	var dot02 = (v0[0]*v2[0]) + (v0[1]*v2[1]);
	var dot11 = (v1[0]*v1[0]) + (v1[1]*v1[1]);
	var dot12 = (v1[0]*v2[0]) + (v1[1]*v2[1]);
	var invDenom = 1/ (dot00 * dot11 - dot01 * dot01);
	var u = (dot11 * dot02 - dot01 * dot12) * invDenom;
	var v = (dot00 * dot12 - dot01 * dot02) * invDenom;
	return ((u >= 0) && (v >= 0) && (u + v < 1));
}

function is_in_ellipse(px,py,x1,y1,x2,y2){
   //console.log("px:"+px+":py::"+py+":x1:"+x1+":y1:"+y1+":x2:"+x2+"y2:"+y2);
	var w = x2 - x1;
	var h = y2 - y1;
	var centerX  = x1 + w/2
	var centerY  = y1 + h/2
	
	if(w<0){
		 w = -w;
	}
	if(h<0){
		h = -h;
	}
   var rx = w/2;
   var ry = h/2;
   var val = (Math.pow((px-centerX),2)/Math.pow(rx,2) + Math.pow((py-centerY),2)/Math.pow(ry,2));
	//console.log("val::::::::::::::"+val);
	if(val<=1.2){
		return true;
	}else{
		return false;
	}
}

function points_is_onLine(x1,y1,x2,y2){
 //console.log(":x1:"+x1+":y1:"+y1+":x2:"+x2+"y2:"+y2);
 /*
  var s1 = distanceBetween(x1,y1,px,py);
  var s2 = distanceBetween(px,py,x2,y2);
  var s3 = distanceBetween(x1,y1,x2,y2);
  var s = (s1 + s2 + s3)/2;
  var area = Math.sqrt(s * (s - s1) * (s - s2) * (s - s3));
  //console.log("Triagle area:::"+area);
  return area;
  */
    var angleRad = slope_In_Radian(x1,y1,x2,y2);
	angleDeg = angleRad * 180 / Math.PI;
	angleDeg =  angleDeg -90;
	angleRad = angleDeg * Math.PI/180;
	//console.log("angleDeg::;"+angleDeg);
	 y1 = y1+20;
	 y2 = y2+20;
	var x1r = x1*Math.cos(angleRad)-y1*Math.sin(angleRad);
	var y1r = x1*Math.cos(angleRad)+y1*Math.sin(angleRad);

	  var x2r = x2*Math.cos(angleRad)-y2*Math.sin(angleRad);
	  var y2r = x2*Math.cos(angleRad)+y2*Math.sin(angleRad);
   //console.log(":x1r:"+x1r+":y1r:"+y1r+":x2r:"+x2r+":y2r:"+y2r);
   createLine(x1r,y1r,x2r,y2r);
 }

function distanceBetween(x1,y1,x2,y2){
   var xDiff = (x2-x1);
   var yDiff = (y2-y1);
   var distance = Math.sqrt(Math.pow(xDiff,2)+ Math.pow(yDiff,2));
   //console.log("distance:::"+distance);
   return distance
}

function setLineWidth(obj){
	 lineWidth = obj.value;
	 changeSelectedObjectLineWidth(lineWidth)
}

function setGlobalAlpha(obj){
	 globalAlpha = obj.value;
	 changeSelectedObjectGlobalAlpha(globalAlpha)
}

function setFilledColor(obj){
	if(obj.value == ""){
		fillColor = null;
	}else{
		fillColor= obj.value;
	}
	setFillPropOnSelctedObject(fillColor);
}

function setStyleColor(obj){
/*	alert
 document.getElementById("color_image").toString("black");
 document.getElementById("color_image").toString("light gray");
 document.getElementById("color_image").toString("dark gray");
 document.getElementById("color_image").toString("Red");
 document.getElementById("color_image").toString("orange");
 document.getElementById("color_image").toString("yellow");
 document.getElementById("color_image").toString("Red");
 document.getElementById("color_image").toString("white");
 document.getElementById("color_image").toString("green");
 */
 styleColor= obj.value;
 changeSelectedObjectColor(styleColor);
}
function changeSelectedObjectColor(color){

	  if(selObjArray!= null){
		  //console.log("ppp:"+document.getElementById("pagenum").value);
		var objectTable = pageObjTable.get(document.getElementById("pagenum").value);
			  for(var i=0;i<selObjArray.length;i++){
				var graphicsObject = objectTable.get(selObjArray[i]);
				//console.log("graphicsObject:;"+graphicsObject+":;color:;"+color);
					graphicsObject.color = color;
					drawObject(objectTable,selObjArray[i],false);
				
				
			  }
		}
}
function changeSelectedObjectLineWidth(width){
	
	  if(selObjArray!= null){
		   ctx.clearRect(0, 0, canvas.width, canvas.height);
		   restore();
		  //console.log("ppp:"+document.getElementById("pagenum").value);
		var objectTable = pageObjTable.get(document.getElementById("pagenum").value);
			  for(var i=0;i<selObjArray.length;i++){
				var graphicsObject = objectTable.get(selObjArray[i]);
					//console.log("graphicsObject:;"+graphicsObject+":;width:;"+width);
					graphicsObject.lineWidth = width;
					drawObject(objectTable,selObjArray[i],false);
					showSelectedObject(graphicsObject);
				
				
			  }
		}
}

function changeSelectedObjectGlobalAlpha(globalalpha){
	
	  if(selObjArray!= null){
		   ctx.clearRect(0, 0, canvas.width, canvas.height);
		   restore();
		  //console.log("ppp:"+document.getElementById("pagenum").value);
		var objectTable = pageObjTable.get(document.getElementById("pagenum").value);
			  for(var i=0;i<selObjArray.length;i++){
				var graphicsObject = objectTable.get(selObjArray[i]);
					//console.log("current Global Alpha:;"+globalAlpha);
					graphicsObject.opacity = globalAlpha;
					drawObject(objectTable,selObjArray[i],false);
					showSelectedObject(graphicsObject);
				
				
			  }
		}
}

function setFillPropOnSelctedObject(fillColor){
	  if(selObjArray!= null){
		   ctx.clearRect(0, 0, canvas.width, canvas.height);
		   restore();
			//console.log("Global Alplha::::"+globalAlpha);
			var objectTable = pageObjTable.get(document.getElementById("pagenum").value);
		//	ctx.save();
			//ctx.closePath();
			ctx.beginPath();
		//	alert("saved state");
		//	ctx.fill();
			
			  for(var i=0;i<selObjArray.length;i++){
				var graphicsObject = objectTable.get(selObjArray[i]);
				   if(fillColor != null)
					 graphicsObject.isFilled = true;
				   else
			        graphicsObject.isFilled = false;
				   
				   graphicsObject.fillColor = fillColor;
			       graphicsObject.opacity = globalAlpha;
			       drawObject(objectTable,selObjArray[i],false);
			 }
			 ctx.stroke();
			 ctx.closePath();
			 ctx.restore();
			 for(var i=0;i<selObjArray.length;i++){
				var graphicsObject = objectTable.get(selObjArray[i]);
				showSelectedObject(graphicsObject);
			 }
			 
		}
}
/*
function rotateSelectedObject(){
	if(selObjArray!= null){
	   //   var degrees=45;
		   ctx.clearRect(0, 0, canvas.width, canvas.height);
		   restore();
		  var objectTable = pageObjTable.get(document.getElementById("pagenum").value);
		
		for(var i=0;i<selObjArray.length;i++){
		
				var graphicsObject = objectTable.get(selObjArray[i]);
				 var pointsArray = graphicsObject.pointsArray;
				 var centerX = pointsArray[0] + (pointsArray[2]-pointsArray[0])/2;
				 var centerY = pointsArray[1] + (pointsArray[3]-pointsArray[1])/2;
				 //console.log("pointsArray:::"+pointsArray);
				 //console.log("Points After centerX:::"+centerX+"::centerY::"+centerY);
				  
				 var obj = Rotate(pointsArray[0],pointsArray[1],centerX,centerY,45);
				
				//console.log("Points After Rotation:::"+obj.newX+"::Y::"+obj.newY);
				 var obj2 = Rotate(pointsArray[2],pointsArray[3],centerX,centerY,45);
				 //console.log("Points After Rotation:::"+obj2.newX+"::Y::"+obj2.newY);
				 graphicsObject.pointsArray[0] = obj.newX;
				  graphicsObject.pointsArray[1] = obj.newY;
				   graphicsObject.pointsArray[2] = obj2.newX;
				    graphicsObject.pointsArray[3] = obj2.newY;
				
				  drawObject(objectTable,selObjArray[i],false)
			  }
			

			  for(var i=0;i<selObjArray.length;i++){
				var graphicsObject = objectTable.get(selObjArray[i]);
					
				showSelectedObject(graphicsObject);
			  }
			 
		}

}
*/
function rotateBack(){
	var ancPoint = getRotationAnchorPoint(objectTable,selObjArray);
	var tx = ancPoint.x;
	var ty = ancPoint.y;
	var objectTable = pageObjTable.get(document.getElementById("pagenum").value);
	for(var i=0;i<selObjArray.length;i++){
			var graphicsObject = objectTable.get(selObjArray[i]);
			var pointsArray = graphicsObject.pointsArray;
			var mouseAngle = graphicsObject.rotationAngle;
			for(var j=0;j<pointsArray.length;j+=2){
    
				var obj = Rotate(tx, ty, pointsArray[j],pointsArray[j+1],mouseAngle);
				// //console.log("Points After Rotation:::"+obj.newX+","+obj.newY);
    
				graphicsObject.pointsArray[j] = obj.newX;
				graphicsObject.pointsArray[j+1] = obj.newY;
    
			}
		ctx.clearRect(0, 0, canvas.width, canvas.height);
		restore();
	for(var i=0;i<selObjArray.length;i++){
		var graphicsObject = objectTable.get(selObjArray[i]);
		drawObject(objectTable,selObjArray[i],false);
		showSelectedObject(graphicsObject);
	}
    
		}

}



function rotateSelectedObject(objectTable,mouseX,mouseY){
//console.log("rotateSelectedObject::::"+selObjArray)
	if(selObjArray!= null){
		var objectTable = pageObjTable.get(document.getElementById("pagenum").value);
  
		var ancPoint = getRotationAnchorPoint(objectTable,selObjArray);
   
		var tx = ancPoint.x;
		var ty = ancPoint.y;
		//console.log("mouseX points::"+mouseX+","+mouseY);
		//console.log("startX points::"+startX+","+startY);
		var dx = mouseX-startX;
		var dy = mouseY-startY;
		//console.log("center points::"+dx+","+dy);
		var angleX1 = tx-mouseX;
		var angleY1 = ty-mouseY;
  
		angleR1=Math.atan2(angleY1, angleX1);
		var angleR1New = angleR1 * Math.PI / 180;
		if(rotationStartAngle == null){
			rotationStartAngle = angleR1;
		}
		rotationEndAngle = angleR1;
		
		console.log("angleR1::"+angleR1New);
  
		var angleX2 = angleX1-dx;
		var angleY2 = angleY1-dy;
		angleR2=Math.atan2(angleY2, angleX2);
		//console.log("angleR2::"+angleR2);
		mouseAngle = angleR2-angleR1;
		for(var i=0;i<selObjArray.length;i++){
			var graphicsObject = objectTable.get(selObjArray[i]);
			var pointsArray = graphicsObject.pointsArray;
			for(var j=0;j<pointsArray.length;j+=2){
    
				var obj = Rotate(tx, ty, pointsArray[j],pointsArray[j+1],mouseAngle);
				// //console.log("Points After Rotation:::"+obj.newX+","+obj.newY);
    
				graphicsObject.pointsArray[j] = obj.newX;
				graphicsObject.pointsArray[j+1] = obj.newY;
				graphicsObject.rotationAngle = rotationEndAngle - rotationStartAngle;
    
			}
    
    //drawObject(objectTable,selObjArray[i],false);
		}   
    //drawObject(objectTable,selObjArray[i],false);
     ctx.clearRect(0, 0, canvas.width, canvas.height);
     restore();
	for(var i=0;i<selObjArray.length;i++){
		var graphicsObject = objectTable.get(selObjArray[i]);
		drawObject(objectTable,selObjArray[i],false);
		showSelectedObject(graphicsObject);
	}
  }
}

function getRotationAnchorPoint(objectTable,selObjArray){
		//console.log("graphicsObject"+selObjArray);
			var cx,cy;
			if(selObjArray.length > 1){
				var ponitXarr = new Array();
				var ponitYarr = new Array();
				for(var i=0;i<selObjArray.length;i++){
					var graphicsObject = objectTable.get(selObjArray[i]);
					//console.log("graphicsObject"+graphicsObject)
					var pointsArray = graphicsObject.pointsArray;
					//console.log("1");
					
					for(var j=0;j<pointsArray.length;j++){
						//console.log("pointsArray::"+pointsArray);
						if(j % 2==0)
							ponitXarr[ponitXarr.length] = pointsArray[j];
						else
							ponitYarr[ponitYarr.length] = pointsArray[j];
					}
					
					
					
				}
				//console.log("ponitXarr::"+ponitXarr+"::ponitYarr::"+ponitYarr+"::ponitXarr[ponitXarr.length-1]::"+ponitXarr[ponitXarr.length-1]+"::ponitYarr[ponitYarr.length-1]::"+ponitYarr[ponitYarr.length-1]);
				ponitXarr = ponitXarr.sort(function(a, b){return a-b});	
				ponitYarr = ponitYarr.sort(function(a, b){return a-b});
				cx = (ponitXarr[0] + ponitXarr[ponitXarr.length-1])/2;
				cy = (ponitYarr[0] + ponitYarr[ponitYarr.length-1])/2;
				
			}else if(selObjArray.length == 1){
				var graphicsObject = objectTable.get(selObjArray[0]);
				//console.log("graphicsObject"+graphicsObject)
				var pointsArray = graphicsObject.pointsArray;
				//console.log("2");
				if (graphicsObject.type ==5 || graphicsObject.type ==11){
					cx = (1/3*(pointsArray[0]+pointsArray[2]+pointsArray[4]));
					cy = (1/3*(pointsArray[1]+pointsArray[3]+pointsArray[5]));
				}else if (graphicsObject.type ==3||graphicsObject.type ==6){
					cx =(1/2*(pointsArray[0]+pointsArray[2]));
					cy =(1/2*(pointsArray[1]+pointsArray[3]));
				}else if(graphicsObject.type ==13){
					cx = (pointsArray[0]+pointsArray[2]+pointsArray[4])/3;
					cy = (pointsArray[1]+pointsArray[3]+pointsArray[5])/3;
				}else if(graphicsObject.type ==12){
					cx = (pointsArray[0]+pointsArray[2])/2;
					cy = (pointsArray[1]+pointsArray[3])/2;
				}else if(graphicsObject.type ==4){
					var pt = getMinMax(pointsArray);
					pointsArray = null;
					pointsArray =  new Array();
					pointsArray[0] = pt.minX;
					pointsArray[1] = pt.minY;
					pointsArray[2] = pt.maxX;
					pointsArray[3] = pt.maxY;
					cx =(1/2*(pointsArray[0]+pointsArray[2]));
					cy =(1/2*(pointsArray[1]+pointsArray[3]));
				}else if(graphicsObject.type == 1 || graphicsObject.type == 2 || graphicsObject.type == 23){
					//console.log("points::"+pointsArray[0]+","+pointsArray[1]+","+pointsArray[2]+","+pointsArray[3]+","+pointsArray[4]+","+pointsArray[5]+","+pointsArray[6]+","+pointsArray[7]);
					cx = (pointsArray[0]+pointsArray[4])/2;
					cy = (pointsArray[1]+pointsArray[5])/2;
				}
			}
	
	return{x:cx,y:cy};	
}

function insertIframe(){
	document.getElementById("div1").innerHTML = '<iframe src="http://docs.google.com/viewer?url=http%3A%2F%2Fwww.topchalks.com%2Ftc%2Fppt.ppt&embedded=true&a=bi&pagenumber=9&w=500&h=400" width="500" height="400" style="border: 0;"></iframe>';
	
	document.getElementById("div1").style.zIndex = -1;
	document.getElementById("div1").style.opacity = .9;
}

function insertIframe(){
	document.getElementById("div1").innerHTML = '<iframe src="http://docs.google.com/viewer?url=http%3A%2F%2Fwww.topchalks.com%2Ftc%2Fppt.ppt&embedded=true&a=bi&pagenumber=9&w=500&h=400" width="500" height="400" style="border: 0;"></iframe>';
	
	document.getElementById("div1").style.zIndex = -1;
	document.getElementById("div1").style.opacity = .9;
}

// Function Not In Use
function insertImage(){
	return;
	var pageNum = document.getElementById("pagenum").value
	var src = "https://docs.google.com/viewer?url=http%3A%2F%2Fwww.topchalks.com%2Ftc%2Fppt.ppt&a=bi&pagenumber=52";
	tempArray = insertImageObj(pageNum,src);
	loadImage(src);
	
}

function insertImageObj(pageNum,src,imageLoaded,fileName){
	var objectTable = pageObjTable.get(pageNum);
	count++;
	//console.log("222222222:::"+count);
	var graphicsObject = new GraphicsObject(count,8,tempArray,null,null,src,false,null,null,imageLoaded,null,null);
	if(objectTable == null){
		objectTable = new Hashtable();
		pageObjTable.put(pageNum,objectTable);
	}
	objectTable.put(count, graphicsObject);
	objectPageRefTable.put(count,pageNum);
		
		if(!isPlayingStoped){
				//currentMiliSec =Math.floor(myVid.currentTime * 1000);
				var imageInsertTime = dropedFileTimeTab.get(fileName);
				//console.log("case 1 CurrentTime:"+currentMiliSec);
				//console.log("case 1 CurrentTime::::"+currentMiliSec+"::::count:::::"+count);
				var pageObject = new PageObject(pageNum,count);
				//objectTimeTable.put(count,imageInsertTime);
				
				//timeRefTable.put(currentMiliSec,pageObject);
				//console.log("insertObjectInPlayingStream ********"+currentMiliSec);
				insertObjectInPlayingStream(imageInsertTime,pageObject);
				//console.log("case 1 objectTimeTable:"+objectTimeTable);
				
			
		}else if(startTime != 0){
			/*
			var currentTime = new Date().getTime();
			currentMiliSec = recFileDuration + Math.ceil(currentTime - startTime);
			*/
			var imageInsertTime = dropedFileTimeTab.get(fileName);
			//console.log("****Inserted *FileName :::"+fileName+":::Time:::"+imageInsertTime);
			//console.log("currentMiliSec::::"+currentMiliSec+"::::count:::::"+count);
			var pageObject = new PageObject(pageNum,count);
			objectTimeTable.put(count,imageInsertTime);
			
			var recordedObjArr = timeRefTable.get(imageInsertTime);
			if(recordedObjArr ==  null){
				recordedObjArr = new Array();
			}
			recordedObjArr[recordedObjArr.length] = pageObject;
			timeRefTable.put(imageInsertTime,recordedObjArr);
			
			
			
		//	timeRefTable.put(imageInsertTime,pageObject);
			
			//console.log("timeRefTable::::"+timeRefTable+"pageObject"+pageObject.num+"::"+pageObject.objectId);
		}else{
			var nonRecordingObjArray = nonRecordinPageObjTable.get(pageNum);
			if(nonRecordingObjArray == null){
				nonRecordingObjArray = new Array();
				nonRecordinPageObjTable.put(pageNum,nonRecordingObjArray);
			}
			nonRecordingObjArray[nonRecordingObjArray.length] = count;
		}
	return graphicsObject;
}

function drawImage(x1,y1,x2,y2){
	//console.log("--------------------draw   Image-------------------");
	//imageObj.style.opacity = .5;

	var x = ctx.globalAlpha;
	ctx.globalAlpha = 0.9;
	//imageObj.style.width = '50%'
	//imageObj.style.height = 'auto'
	//imageObj.style.width  = "auto";
	//imageObj.style.maxheight = "400px";
	ctx.drawImage(imageObj,x1,y1,x2-x1,y2-y1);
	ctx.globalAlpha = x;


	 
}


function loadImage(src,objId){
	 imageObj= new Image();
	 imageObj.src = src;
	 //createWaitZone();
	checkImageLoaded(objId);
}


function loadAndDrawImage(){
	isImageLoaded  = imageObj.complete;
	//console.log("checkImageLoaded:::"+isImageLoaded);
	if(!isImageLoaded){
		  imageloadingTimer = setTimeout("loadAndDrawImage()",1000);
	}else{
		clearTimeout(imageloadingTimer);	
		//clearWaitZone();
		drawImage(tempArray[0],tempArray[1],tempArray[2],tempArray[3]);
		if(currentObjId != 15)
			canvas.style.cursor  = "default";
		//restoreAllExceptImage();
	}
}

function checkImageLoaded(id){
		isImageLoaded  = imageObj.complete;
		//console.log("checkImageLoaded:::"+id);
	if(!isImageLoaded){
		  imageloadingTimer = setTimeout("checkImageLoaded("+id+")",1000);
	}else{
		clearTimeout(imageloadingTimer);
		
			//clearWaitZone();		
			//console.log("Image Object------------------------------------"+imageObj.naturalWidth + "::"+imageObj.naturalHeight);
			//console.log("tempArray--111-----------"+tempArray);
			getImageWidthHeight(imageObj,tempArray[2],tempArray[3]);
			tempArray[2] = tempArray[0] + imageObj.width;
			tempArray[3] = tempArray[1] + imageObj.height;
			var pageNum = document.getElementById("pagenum").value
			var objectTable = pageObjTable.get(pageNum);
			//console.log("id::"+id+":::pageNum:;"+pageNum);
			var graphicsObject = objectTable.get(id);
			graphicsObject.imageLoaded = true;
			//console.log("tempArray---2222----------"+tempArray);
		/*	}else{
			getImageWidthHeight(imageObj,tempArray[2],tempArray[3]);
			tempArray[2] = tempArray[0] + imageObj.width;
			tempArray[3] = tempArray[1] + imageObj.height;
		}*/
		/*
		imageObj.height = (canvas.height - 20);
		imageObj.width = Math.ceil((imageObj.naturalWidth * imageObj.height) / imageObj.naturalHeight);
		*/
		//console.log("Image Object- current Height-----------------------------------::"+imageObj.width+":::"+imageObj.height);
		
		//var pageNum = document.getElementById("pagenum").value
		//var src = "https://docs.google.com/viewer?url=http%3A%2F%2Fwww.topchalks.com%2Ftc%2Fppt.ppt&a=bi&pagenumber="+pageNum;
		drawImage(tempArray[0],tempArray[1],tempArray[2],tempArray[3]);
		canvas.style.cursor  = "default";
		//restoreAllExceptImage();
	}
}

function zoomImage(imageObject){
	//console.log("----------zoomimage-----------"+imageObject);
    var pointsArray = imageObject.pointsArray;
	//console.log("@@@@@@@@@@@pointsArray::::"+pointsArray);
	var pointsArr = new Array();
		pointsArr[0] = pointsArray[0];
		pointsArr[1] = pointsArray[1];
		pointsArr[2] = pointsArray[2];
		pointsArr[3] = pointsArray[3];
	
	var imageWidth = pointsArr[2] - pointsArr[0];
	var imageHeight =  pointsArr[3] - pointsArr[1];
	
	var widthDelta = Math.ceil(imageWidth * 0.2)  ;
	var heightDelta = Math.ceil(imageHeight * 0.2) ;
    if(zoomType == 1){
			pointsArr[2] = pointsArr[2] + widthDelta;
			pointsArr[3] = pointsArr[3] + heightDelta;
			
	}else{
		pointsArr[2] = pointsArr[2] - widthDelta;
		pointsArr[3] = pointsArr[3] - heightDelta;
		
	}
	var state = checkAllPointsInCanvas(pointsArr);
	//console.log("checkAllPointsInCanvas(pointsArr) ::::;"+state);
	if(state){
		//console.log("@@@@@@@@@@@pointsArr::::"+pointsArr);
		pointsArray =  null;
		imageObject.pointsArray = pointsArr;
		//console.log("@@@@@@@@@@@pointsArray::::"+pointsArray);
		//console.log("@@@@@@@@@@@imageObject.pointsArray::::"+imageObject.pointsArray);
		ctx.clearRect(0, 0, canvas.width, canvas.height);
		restore();
		var objectTable = pageObjTable.get(document.getElementById("pagenum").value);
		drawObject(objectTable,imageObject.id,false);
	}
	
}

function getImageWidthHeight(imageObj,width,height){
	var  pagenum = document.getElementById("pagenum").value;
	//console.log("----------------getImageWidthHeight-----canvas---------"+width+"::height:;"+height+"::pagenum::"+pagenum);
	var imageWidth = imageObj.naturalWidth;
	var imageHeight = imageObj.naturalHeight;
	//console.log("----------------getImageWidthHeight-----image---------"+imageWidth+"::height:;"+imageHeight);
	if(imageWidth <= width && imageHeight <= height){
		imageObj.width = imageWidth;
		imageObj.height = imageHeight;
	}else{
		var imageProportion = (imageWidth / imageHeight);
		var canvasProportion = (width / height);
		if(canvasProportion > imageProportion){
			//console.log("----------------111111111111111111111111--------------");
			imageObj.height = (height);
			imageObj.width = Math.ceil((imageWidth * imageObj.height) / imageHeight);
		}else{
			//console.log("----------------22222222222222222222222222----------");
			imageObj.width = (width);
			imageObj.height = Math.ceil((imageHeight * imageObj.width) / imageWidth);
		}
	}
	
}

function showPageObject(){
	ctx.clearRect(0, 0, canvas.width, canvas.height);
	restore();
}
function setPageNum(val){
	//console.log("isPlayingStoped::;"+isPlayingStoped)
	var pagenum = document.getElementById("pagenum").value;
	if(val == 'P' && pagenum >1){
		pagenum--;
	
	}else if(val == 'N'){
		pagenum++;
		
	}
	clearTimeout(imageloadingTimer);
	isImageLoaded = false;
	document.getElementById("pagenum").value = pagenum;
	ctx.clearRect(0, 0, canvas.width, canvas.height);
	//restore();
	if(!isPlayingStoped || startTime != 0){
		storePageChangeEvent(pagenum);
	}
	//console.log("11111111111111111111111111");
	drawNonRecordingObject(pagenum);
	if(!isPlayingStoped){
		restoreOnlyPlayedObject();
		restoreInsertedObjectInStream(pagenum);
	}else if(startTime != 0){
		restoreRecordedObj(currentMiliSec);
	}else if(isPlayingStoped){
		restoreAllRecordedObj(pagenum);
	}
	
	selObjArray =  null;
	selObjArray = new Array()
	
}

function storePageChangeEvent(pagenum){
	count++;
	//console.log("333333333:::"+count);
	var objectTable = pageObjTable.get(pagenum);
	var graphicsObject = new GraphicsObject(count,10,null,null,null,null,false,null,null,false,null,null);
	if(objectTable == null){
		objectTable = new Hashtable();
		pageObjTable.put(pagenum,objectTable);
	}
	objectTable.put(count, graphicsObject);
	objectPageRefTable.put(count,pagenum);
	//console.log("insertObjectInPlayingStream &&&&&currentMiliSec&&&"+currentMiliSec);
	if(!isPlayingStoped){
			currentMiliSec =Math.floor(myVid.currentTime * 1000);
			//console.log("case 1 CurrentTime:"+currentMiliSec);
			//console.log("case 1 CurrentTime::::"+currentMiliSec+"::::count:::::"+count);
			var pageObject = new PageObject(pagenum,count);
			//objectTimeTable.put(count,currentMiliSec);
			//timeRefTable.put(currentMiliSec,pageObject);
			//console.log("insertObjectInPlayingStream &&&&&&&&"+currentMiliSec);
			//alert("insertObjectInPlayingStream &&&&&&&&"+currentMiliSec);
			insertObjectInPlayingStream(currentMiliSec,pageObject);
			//console.log("case 1 objectTimeTable:"+objectTimeTable);
	}else if(startTime != 0){
			var currentTime = new Date().getTime();
			currentMiliSec = recFileDuration + Math.ceil(currentTime - startTime);
			//console.log("currentMiliSec::::"+currentMiliSec+"::::count:::::"+count);
			var pageObject = new PageObject(pagenum,count);
			objectTimeTable.put(count,currentMiliSec);
			
			
			var recordedObjArr = timeRefTable.get(currentMiliSec);
			if(recordedObjArr ==  null){
				recordedObjArr = new Array();
			}
			recordedObjArr[recordedObjArr.length] = pageObject;
			timeRefTable.put(currentMiliSec,recordedObjArr);
			
			
			//timeRefTable.put(currentMiliSec,pageObject);
			//console.log("timeRefTable::::"+timeRefTable+"pageObject"+pageObject.num+"::"+pageObject.objectId+"objectTimeTable::"+objectTimeTable);
	}
}

function saveMeetingOnServer(eventType){
	var jsonData = createJSON();
	//console.log("jsonData:::"+jsonData);
	 jQuery.ajax({
		  	type:	"POST",
	  		url: 	"save.action",
	  		data: jsonData,
	  		contentType: 'application/json; charset=utf-8',
	  		dataType: 'json',
		  		success:function(msg) {
		  			//alert(msg.parentId);
		  			
		  			if(msg.actionErrors != null)
		  			{
		  				alert("error");
		  		  	}else{
		  		  		//alert("showchild"+msg.status);
		  		  		//filename = 'Enotebook/'+meetingName+'/recording/'+meetingName+'.mp3';
		  		  		}
		  			if (eventType =='exit'){
		  		   		window.location.href = "userlectures";
		  			}
		  }});
}

function exitMeeting(){
	//console.log("hiiii");
	window.location.href = "userlectures";
}

function submitEditLectureform(){
    	document.editlectureform.submit();
}

function createJSON(){
		
		var duration = getDurationInMinAndSec(recFileDuration);
		//console.log("recFileDuration:::::"+duration);
		var data = '{"MeetingName":"'+ meetingName +'"';
		if(filename != null && filename.length >0 ){
			var recFileName = 'Enotebook/'+meetingName+'/recording/'+meetingName; 
			var data = data + ', "TempRecFile":"'+ filename +'","RecFname":"'+recFileName+'.mp3"'+',"RecFileDuration":"'+duration+'"';
		}
	if(pageObjTable.size()>0){
		
		var data = data + ', "PageList":[';
		var jsonData = '';
		pageObjTable.moveFirst();
	    while(pageObjTable.next()){
	    	jsonData = jsonData + '{';
	    	var pageNo = pageObjTable.getKey();
	    	jsonData = jsonData + '"pagenumber":'+pageNo+",";
			var objectTable = pageObjTable.get(pageNo);
			objectTable.moveFirst();
			if(objectTable.size()>0){
				 var graphicsObjData = '"graphicsObject": [ ' ;
				 var objectData = '';
				 while(objectTable.next()){
					 var objectData = objectData + '{';
				 	 var graphicsObject = objectTable.get(objectTable.getKey());
				 	 objectData = objectData + '"id":' + graphicsObject.id + ',';
					 objectData = objectData + '"type":' + graphicsObject.type + ',';
					 if(graphicsObject.pointsArray != null){
						 var pointsArray = graphicsObject.pointsArray;
						 var points = '';
						 //console.log("PonitsArray:::"+pointsArray);
						 for(var i=0;i<pointsArray.length;i++){
								points = points + pointsArray[i] + ',';
								//console.log("points:::"+points);
							}
							points = points.substring(0,points.length-1);
							
							objectData = objectData + '"pointsList":['+ points + '],';
						}
					
					 if(graphicsObject.lineWidth != null){
						 objectData = objectData + '"lineWidth":' + graphicsObject.lineWidth + ',';
					 }if(graphicsObject.color != null){	 
					 	objectData = objectData + '"lineColor":"' + graphicsObject.color + '",';
					 }if(graphicsObject.src != null){	 
					 	objectData = objectData + '"src":"' + graphicsObject.src + '",';
					 }
					 if(graphicsObject.isFilled != null){	 
					 	objectData = objectData + '"isFilled":' + graphicsObject.isFilled + ',';
					 }
					 if(graphicsObject.fillColor != null){	 
					 	objectData = objectData + '"fillColor":"' + graphicsObject.fillColor + '",';
					 }
					 if(graphicsObject.opacity != null){	 
					 	objectData = objectData + '"opacity":"' + graphicsObject.opacity + '",';
					 }
					 if(graphicsObject.imageLoaded != null){	 
					 	objectData = objectData + '"imageLoaded":"' + graphicsObject.imageLoaded + '",';
					 }
					 if(graphicsObject.text != null){	
					 	var textobj = graphicsObject.text;
						var textJson = '{"textData":"'+(textobj.textData).trim()+'","fontType":"'+textobj.fontType+'","fontSize":"'+textobj.fontSize+'","isBold":"'+textobj.isBold+'","isUnderLine":"'+textobj.isUnderLine+'","isItalic":"'+textobj.isItalic+'"}'
					 	objectData = objectData + '"text":' + textJson + ',';
					 }
					 if(graphicsObject.ref != null){	 
					 	objectData = objectData + '"ref":"' + graphicsObject.ref + '",';
					 }
					 
					 var timeStamp = objectTimeTable.get(graphicsObject.id);
					 //console.log(objectTimeTable);
					 if(timeStamp != null){
						 objectData = objectData + '"timeStamp":"' + timeStamp + '",';
					 }
					 objectData = objectData.substring(0,objectData.length-1)+'},';
				
				}
				 graphicsObjData = graphicsObjData +  objectData.substring(0,objectData.length-1) + ']';
			 }
			jsonData = jsonData + graphicsObjData + '},';	 
		}
	    data = data + jsonData.substring(0,jsonData.length-1) + ']';
	}
	 data = data + '}';
	 //console.log(data);
	return data;
}

function showNewMeetingPopUp(){
	document.getElementById("intialOption").style.display = "none";
	document.getElementById("newMeetingPopUp").style.display = "block";

}
function createNewMeeting(){
	var name = meetingName;
	if(name.trim().length >0){
		meetingName = name.trim();
		/* document.getElementById("intialOption").style.display = "block";
		document.getElementById("newMeetingPopUp").style.display = "none"; */
	//	document.getElementById("meetingToolBar").style.display = "block";
	//	document.getElementById("disableDiv").style.zIndex = -1;
	//	document.getElementById("disableDiv").style.opacity = 1;
	//	document.getElementById("meetingToolBar").style.zIndex = 5;
	}else{
		alert("Invalid Meeting Name");
	}
}
function cancelNewMeeting(){
	document.getElementById("intialOption").style.display = "block";
	document.getElementById("newMeetingPopUp").style.display = "none";

}
function getMeetingList(){
	//alert("open lecture");
	 jQuery.ajax({
		  	type:	"get",
	  		url: 	"getmeetinglist.action",
	  		data: 	"",
		  		success:function(msg) {
		  			//alert(msg.parentId);
		  			
		  			if(msg.actionErrors != null)
		  			{
		  				alert("error");
		  		  	}else{
		  		  		openMeet(msg.meetings)
		  		  	}
		  			
		  	}});
}
function openMeet(meetingList){
	var str = '<div style="overflow:auto;width:470px;height:270px;border:0px solid;background-color:#FFFFFF;margin:10px"><TABLE border="0" ><TR>';
	var str1 = '';
	if(meetingList != null){
	for(var i=0;i<meetingList.length;i++){
			var name= escape(meetingList[i]);
			if((i+1)%3 == 0){
				str1 = str1 +'<TD id="'+name+'" style="width:150px;"  onmouseover = selectFile2("'+name+'") onclick = selectFile("'+name+'")><img src="images/meeting/folder-icon.png" />&nbsp;'+meetingList[i]+ '</TD></TR><TR>';
			}else{
				str1 = str1 +'<TD id="'+name+'" style="width:150px;" onmouseover = selectFile2("'+name+'") onclick = selectFile("'+name+'") ><img src="images/meeting/folder-icon.png" />&nbsp;'+meetingList[i]+ '</TD>';
			}
	
		}
	
	}
			str1 = str1 +'</TR></TABLE></div>';
		

	//console.log(str+str1);
	/*
		
	<TD style="width:200px"><img src="images/meeting/folder-icon.png" />123</TD><TD style="width:100px">31221</TD><TD style="width:100px">23123</TD></TR><TR><TD style="width:100px">123</TD><TD style="width:100px">31221</TD><TD style="width:100px">23123</TD></TR><TR><TD style="width:100px">123</TD>			<TD style="width:100px">31221</TD><TD style="width:100px">23123</TD></TR></TABLE></div>';
	
	*/
	var str2 =  '<div  style="overflow:auto;margin:10px"><TABLE><TR><TD>File Name</TD><TD><INPUT id="selFile" TYPE="text" NAME="" size="40" onkeyup="setOpenButton();" ></TD><TD><INPUT id="openButton" TYPE="button" value="Open" disabled="true" onclick = checkEvent("open"); /></TD><TD><INPUT TYPE="button" value="Cancel" onclick = checkEvent("cancel"); /></TD></TR></TABLE></div>';
	document.getElementById("meetingDiv").innerHTML = str + str1 +str2;
	document.getElementById("meetingDiv").style.display = "block";
}
var lstSel = null;
function selectFile(name){
	//alert("name::"+);
	if(lstSel != null){
		lstSel.style.backgroundColor  = "#FFFFFF";
	}
	var obj = document.getElementById(name);
	//console.log(obj.id);
	obj.style.backgroundColor  = "#CCCCCA";
	lstSel = obj;
	document.getElementById("selFile").value = name;
	document.getElementById("openButton").disabled = false;
}


function selectFile2(name){
	//alert("name::"+);
	if(lstSel != null){
		lstSel.style.backgroundColor  = "#FFFFFF";
	}
	var obj = document.getElementById(name);
	//console.log(obj.id);
	obj.style.backgroundColor  = "#CCCCCA";
	lstSel = obj;
	
}

function setOpenButton(){
	//console.log("-----change--------------------");
	var name = document.getElementById("selFile").value;
	if(name.length == 0){
		document.getElementById("openButton").disabled = true;
	}else{
		document.getElementById("openButton").disabled = false;
	}
	
}
function checkEvent(eType){
	//console.log("eType::::"+eType);
	if(eType == "open"){
		var fileName = document.getElementById("selFile").value;
		if(fileName.length == 0){
			alert("No file selected");
		}else{
			openMeeting(fileName);
			document.getElementById("meetingDiv").style.display = "none";
		}
	}if(eType == "cancel"){ 
		document.getElementById("meetingDiv").style.display = "none";
	}
}

function openMeeting(meetingName){
	//alert("Open Meeting::;");
	// var meetingName = "tinu";
	 jQuery.ajax({
		  	type:	"get",
	  		url: 	"getmeetingjson.action",
	  		data: 	"meetingName="+meetingName+"&status="+true,
		  		success:function(msg) {
		  			//alert(msg);
		  			
		  			if(msg.actionErrors != null)
		  			{
		  				alert("error");
		  		  	}else{
		  		  		//console.log("showchild"+msg.jsonContent);
		  		  		var json = JSON.parse(msg.jsonContent);
		  		  		//alert(json)
		  		  		meetingName = json.MeetingName;
						//alert(document.getElementById("meetingName").value);
						if(json.RecFname!= null){
							filename = json.RecFname;
							recCount = 1;
						}
		  		  		initDataStruture();
		  		  		if(json.PageList != null){
		  		  			parseMeetingJSON(json.PageList);
		  		  		}
		  		  			
						createNewMeeting();
						pageObjTable.moveFirst();
						var pageNum;
						if(pageObjTable.next()){
							pageNum = pageObjTable.getKey();
						}else{
							pageNum = 1;
						}
						document.getElementById("pagenum").value = pageNum;
						//console.log("22222222222222222222222222222");
		  		  		drawNonRecordingObject(pageNum);
						restoreAllRecordedObj(pageNum);
						//console.log("---------------filename----------------------------"+filename);
						if(filename.length >0){
							myVid=document.getElementById("audio1");
							myVid.src = "http://"+window.location.host+"/"+filename;
							if(isAutoPlay == "true"){
								//alert("startttttttttttttttt");
								var playButObj = document.getElementById("playpause")
								playButObj.className  = "pause";
								playObject();
								isAutoPlay = "false";
								 $('#openRecord').click();
							}
							/*
							myVid.addEventListener("loadedmetadata", function(_event) {
									var duration = myVid.duration;
									recFileDuration = duration * 1000;
									//console.log("duration:"+recFileDuration);
							
							});*/
						}
						
						//var obj =document.getElementById("pt");
						//document.getElementById("petrol").innerHTML= "BYEEEEEEE";
						//fireEvent(obj,'click');
		  		  		//drawImage(tempArray[0],tempArray[1],tempArray[2],tempArray[3],imageUrl);	
		  		  		//showChild(msg.parentId,msg.childList,false);
		  		  	}
		  			
		  	}});
}

function parseMeetingJSON(pageList){
	//alert(pageList);
	jQuery.each(pageList, function(i, obj) {
		parseGraphicsIbjectList(obj.pagenumber,obj.graphicsObject);
	
	});
}

function initDataStruture(){
	pageObjTable =  null;
	nonRecordinPageObjTable = null;
	timeRefTable = null;
	objectTimeTable = null;
	selObjArray = null;
	count = 0;
	pageObjTable =  new Hashtable();
	nonRecordinPageObjTable =  new Hashtable();
	timeRefTable = new Hashtable();
	objectTimeTable = new Hashtable();
	selObjArray = new Array();;
	
}
function parseGraphicsIbjectList(pageNum,gObjectList){
	var objectTable = new Hashtable();
	var nonRecordingObjArray = new Array();
	jQuery.each(gObjectList, function(i, obj) {
	    //console.log("text object:::"+obj.text);
		var textObj;
		if(obj.text != null){
			textObj= new Text(obj.text.textData,obj.text.fontType,obj.text.fontSize,obj.text.isBold,obj.text.isUnderLine,obj.text.isItalic);
		}
		
		var gObj = new GraphicsObject(obj.id,obj.type,obj.pointsList,obj.lineWidth,obj.lineColor,obj.src,obj.isFilled,obj.fillColor,obj.opacity,obj.imageLoaded,textObj,obj.ref);
		//count++;
		if((gObj.type == 1 || gObj.type == 2 || gObj.type == 23) && (obj.pointsList.length == 4)){
			checkAndAddPonitsForNewVersion(gObj);
		}
		if(count < parseInt(obj.id)){
			count = obj.id;
		}
		//console.log("44444444:::"+count);
		objectTable.put(obj.id, gObj);
		objectPageRefTable.put(obj.id,pageNum);
		//console.log("obj.timeStamp::::"+obj.timeStamp);
		if(obj.timeStamp != null){
			var pageObject = new PageObject(pageNum,obj.id);
			objectTimeTable.put(obj.id,obj.timeStamp);
			
			var recordedObjArr = timeRefTable.get(obj.timeStamp);
			if(recordedObjArr ==  null){
				recordedObjArr = new Array();
			}
			recordedObjArr[recordedObjArr.length] = pageObject;
			timeRefTable.put(obj.timeStamp,recordedObjArr);
			
			
			//timeRefTable.put(obj.timeStamp,pageObject);
		}else{
			 nonRecordingObjArray[nonRecordingObjArray.length] = obj.id;
		}
				
		
	});
	nonRecordinPageObjTable.put(pageNum,nonRecordingObjArray);
	pageObjTable.put(pageNum,objectTable);
}
function checkAndAddPonitsForNewVersion(graphicsObject){
	var ptsArray = graphicsObject.pointsArray;
	if(ptsArray.length == 4){
		
		var tmpArray = new Array();
		tmpArray[0] = ptsArray[0];
		tmpArray[1] = ptsArray[1];
		tmpArray[2] = ptsArray[2];
		tmpArray[3] = ptsArray[3];
		
		ptsArray[2] = tmpArray[0];
		ptsArray[3] = tmpArray[3];
		
		ptsArray[4] = tmpArray[2];
		ptsArray[5] = tmpArray[3];
		
		ptsArray[6] = tmpArray[2];
		ptsArray[7] = tmpArray[1];
		graphicsObject.pointsArray = ptsArray;
	}

}
function detectmob() { 
 if( navigator.userAgent.match(/Android/i)
 || navigator.userAgent.match(/webOS/i)
 || navigator.userAgent.match(/iPhone/i)
 || navigator.userAgent.match(/iPad/i)
 || navigator.userAgent.match(/iPod/i)
 || navigator.userAgent.match(/BlackBerry/i)
 || navigator.userAgent.match(/Windows Phone/i)
 ){
    return true;
  }
 else {
    return false;
  }
}




function createEditor(tempPointsArray,textObj){
	//console.log("create editor"+tempPointsArray);
	var div_elm = document.getElementById("meetingDiv");
	div_elm.style.left = (tempPointsArray[0] ) +'px';
	div_elm.style.top = (tempPointsArray[1] ) +'px';
	div_elm.style.backgroundColor = '#FFFFFF';
	document.getElementById("meetingDiv").style.display = "block";
	//console.log("meetingDiv::"+meetingDiv);
	if(textObj != null){
		document.getElementById("editorFontType").value = textObj.fontType;
		document.getElementById("editorFontSize").value = textObj.fontSize;
		document.getElementById("area1").style.fontSize = textObj.fontSize+"px";
		document.getElementById("area1").style.fontFamily =  textObj.fontType;
		document.getElementById("area1").value = textObj.textData;
		textFontSize = textObj.fontSize;
		textFontType = textObj.fontType;
	}else{
		document.getElementById("area1").value = "";
	}
	//nicEditors.allTextAreas() ;

}

function getPointsOnPointerPath(x1,y1,x2,y2,pointsDelta){
	var dx = x2 -x1;
	var dy = y2 -y1;
	var pathArr = new Array();
	pathArr[pathArr.length] = x1;
	pathArr[pathArr.length] = y1;
	if(Math.abs(dx) > Math.abs(dy)){
		var interval = Math.abs(dx) / pointsDelta;
		if(x2 > x1 ){
			interval = interval;
		}else{
			interval = - interval;

		}
		x = x1;
		for(var ctr = 0;ctr<pointsDelta;ctr++){
			x = x + interval;
			y = ((y2 - y1)/(x2 -x1))*(x -x1) + y1;
			pathArr[pathArr.length] = x;
			pathArr[pathArr.length] = y;
			
		}
	}else{
		var interval = Math.abs(dy) / pointsDelta;
		if(y2 > y1 ){
			interval = interval;
		}else{
			interval = - interval;

		}
		y = y1;
		for(var ctr = 0;ctr<pointsDelta;ctr++){
			y = y + interval;
			x = ((x2 -x1)/(y2 -y1))*(y -y1) + x1;
			pathArr[pathArr.length] = x;
			pathArr[pathArr.length] = y;
			
		}
	}
	return pathArr;
}
var pointCtr = 0;
var pointerTimerId;

function drawPointerPath(){
//console.log("drawPointerPath::::"+currentPointerPath);
	if(pointCtr < currentPointerPath.length){
 		pointerX = currentPointerPath[pointCtr];
		pointerY = currentPointerPath[pointCtr+1];
		pointerImg.style.left = offsetX + pointerX +"px";
		pointerImg.style.top = offsetY + pointerY+ "px";
		pointCtr = pointCtr +2;
		pointerTimerId = setTimeout('drawPointerPath()',10);
	}
}

function setplayingTimeInPlayer(){
	var duration = getDurationInMinAndSec(myVid.currentTime*1000);
	//console.log("setplayingTimeInPlayer::"+duration);
/* 
 //console.log("current audio time::"+myVid.currentTime );
  var audioTime = ""+myVid.currentTime ;
  //console.log("current audio time::"+audioTime);
  var pos= audioTime.indexOf(".");
  //console.log("current audio pos::"+pos);
  var timeinSec = audioTime.substring(0,pos);
  var min = parseInt(timeinSec / 60);
  var sec = ''+timeinSec % 60;
  //console.log("current audio pos::"+sec.length);
  if(sec.length == 1){
	sec = '0'+sec;
  }*/
  document.getElementById("cTime").innerHTML = "<b>"+duration+"</b>";
  //console.log("min::"+min+"::sec::"+sec);
  playerTimer = setTimeout('setplayingTimeInPlayer()',500);
}

function ShowSelectionInsideTextarea(){
 var textComponent = document.getElementById('area1');

  var selectedText;
  // IE version
  if (document.selection != undefined)
  {
    textComponent.focus();
    var sel = document.selection.createRange();
    selectedText = sel.text;
  }
  // Mozilla version
  else if (textComponent.selectionStart != undefined)
  {
    var startPos = textComponent.selectionStart;
    var endPos = textComponent.selectionEnd;
    selectedText = textComponent.value.substring(startPos, endPos)
  }
  return selectedText;
    //alert("You selected: " + selectedText);
}
function boldSelectdText(){
	if(isBold){
		isBold = false;
		document.getElementById("area1").style.fontWeight='normal';
	}else{
		isBold = true;
		document.getElementById("area1").style.fontWeight='bold';
	}
	
}

function italicSelectedText(){
//console.log("italic;;;;");
	if(isItalic){
		isItalic = false;
		document.getElementById("area1").style.fontStyle='normal';
	}else{
		isItalic = true;
		document.getElementById("area1").style.fontStyle='italic';
	}
}

function underLineSelectedText(){
	if(isUnderLine){
		isUnderLine = false;
			document.getElementById("area1").style.textDecoration='none';
	}else{
		isUnderLine = true;
		document.getElementById("area1").style.textDecoration='underline';
	}

}

function startBlink(){
	//console.log("start blink::");
	var recordButton = document.getElementById("recordButton");
	if(recordButton.className == "recording"){
		recordButton.className = "record";
	}else{
		recordButton.className = "recording";
	}
		
	showRecordingTime();
	clearTimeout(blinkTimer);
	blinkTimer = setTimeout('startBlink()',500);
}
function showRecordingTime(){
	  var currentTime = new Date().getTime();
	 // //console.log("current startTime ::"+startTime+"::currentTime::"+currentTime);
	  currentMiliSec = recFileDuration + Math.ceil(currentTime - startTime);
	  var duration = getDurationInMinAndSec(currentMiliSec);
	/*
	  var recordTime = ""+(currentMiliSec / 1000);
	 // //console.log("current recordTime ::"+recordTime);
	  var pos= recordTime.indexOf(".");
	  var timeinSec = recordTime.substring(0,pos);
	  var min = parseInt(timeinSec / 60);
	  var sec = ''+timeinSec % 60;
	  //console.log("current audio pos::"+sec.length);
	  if(sec.length == 1){
		sec = '0'+sec;
	  }*/
	document.getElementById("cTime").innerHTML = "<b>"+duration+"</b>";
}

function getDurationInMinAndSec(duration){

	  var recordTime = ""+(duration / 1000);
	 // //console.log("current recordTime ::"+recordTime);
	  var pos= recordTime.indexOf(".");
	  var timeinSec = recordTime.substring(0,pos);
	  var min = ""+parseInt(timeinSec / 60);
	  var sec = ''+timeinSec % 60;
	  //console.log("current audio pos::"+sec.length);
	  if(min.length == 1){
		min = '0'+min;
	  }
	  if(sec.length == 1){
		sec = '0'+sec;
	  }
	  return (min+":"+sec);
}

function enableDisableRelationOptions(state){
	//console.log("enableDisableRelationOptions ::"+state);
	if(state){
		//document.getElementById("rotateButton").className = "btn btn-default active"
		document.getElementById("rotateButton").disabled = false;

		var id = objectTimeTable.get(selObjArray[0]);
		if(id != null){		
			//document.getElementById("playFrObjButton").className = "btn btn-default active"
			document.getElementById("playFrObjButton").disabled = false;
		}

		//document.getElementById("delObjButton").className = "btn btn-default active"
		document.getElementById("delObjButton").disabled = false;
	}else{
		document.getElementById("rotateButton").className = "btn btn-default"
		document.getElementById("rotateButton").disabled = true;
		isRotaionEnable = false;

		document.getElementById("playFrObjButton").className = "btn btn-default"
		document.getElementById("playFrObjButton").disabled = true;

		document.getElementById("delObjButton").className = "btn btn-default"
		document.getElementById("delObjButton").disabled = true;
	}
}			
function setRotationActive(){
	isRotaionEnable = true;
	var objectTable = pageObjTable.get(document.getElementById("pagenum").value);
	if(selObjArray.length >0){
		for(i=0;i<selObjArray.length;i++){
			var graphicsObject = objectTable.get(selObjArray[i]);
			showSelectedObject(graphicsObject);
			enableDisableRelationOptions(true);
		}
	}
}	
function setZoomEnableDisable(state){
	isZoomEnable = state;
	handleZoomButton(state);
	if(state){
		// show button zoomIn zoomOut
		document.getElementById("zoomOptions").style.display = "inline-block";
		if(zoomType == 2){
			document.getElementById("zoomOut").className = "btn btn-default active"
			document.getElementById("zoomIn").className = "btn btn-default";
		}else{
			document.getElementById("zoomIn").className = "btn btn-default active"
			document.getElementById("zoomOut").className = "btn btn-default";
		}
	}else{
		// hide button zoomIn zoomOut
		document.getElementById("zoomOptions").style.display = "none";
		document.getElementById("zoomIn").className = "btn btn-default active"
		document.getElementById("zoomOut").className = "btn btn-default";
	}
	//console.log("setZoomEnable::2");
	//setZoomType(2);
}
function clearRecordedObjectTime(){
	//console.log("clearRecordedObjectTime------------------");
	timeRefTable.moveFirst();
	while(timeRefTable.next()){
		var objRecTime = timeRefTable.getKey();
		var recordedObjArr = timeRefTable.getValue();
			for(var i=0;i< recordedObjArr.length;i++){
			var pageObj = recordedObjArr[i];
				if(pageObj != null){
					var pageNum = pageObj.num;
					var objId = pageObj.objectId;
					var nonRecordingObjArray = nonRecordinPageObjTable.get(pageNum);
					if(nonRecordingObjArray == null){
						nonRecordingObjArray = new Array();
						nonRecordinPageObjTable.put(pageNum,nonRecordingObjArray);
					}
					nonRecordingObjArray[nonRecordingObjArray.length] = objId;
				}
			}
	}
	reInitRecordingDS();
	
}
function RemoveRecordedObject(){
	//console.log("RemoveRecordedObject------------------");
	timeRefTable.moveFirst();
	while(timeRefTable.next()){
		var objRecTime = timeRefTable.getKey();
		var recordedObjArr = timeRefTable.getValue();
			for(var i=0;i< recordedObjArr.length;i++){
			var pageObj = recordedObjArr[i];
				if(pageObj != null){
					var pageNum = pageObj.num;
					var objId = pageObj.objectId;
					var objectTable = pageObjTable.get(pageNum);
					objectTable.remove(objId);
				}
			}
	}
	reInitRecordingDS();
	showPageObject();
}

		
function reInitRecordingDS(){
	 timeRefTable = null;
	 objectTimeTable = null;
	 timeRefTable = new Hashtable();
	 objectTimeTable = new Hashtable();
	

}
function editObject(graphicsObject,startx,starty,mouseX,mouseY,endX,endY,text){
	
	//console.log("Stroke color::"+ctx.strokeStyle);
	if(graphicsObject.opacity != null){
		ctx.globalAlpha = graphicsObject.opacity;
	}else{
		ctx.globalAlpha = 1.0;
	}
	ctx.setLineDash([0]);
	
	switch(graphicsObject.type){
		case 1:
			ctx.clearRect(0, 0, canvas.width, canvas.height);
			restore();
			ctx.beginPath();
			ctx.lineCap = 'butt';
			ctx.lineJoin = 'miter';
			ctx.strokeStyle = styleColor;
			ctx.lineWidth= lineWidth;
			ctx.globalAlpha = globalAlpha;
			var cx = startx; 
			var cy = mouseY;
			var dx = mouseX;
			var dy = starty;
			tempCirclePointsArray[0] = startx;
			tempCirclePointsArray[1] = starty;
			tempCirclePointsArray[2] = cx;
			tempCirclePointsArray[3] = cy;
			tempCirclePointsArray[4] = mouseX;
			tempCirclePointsArray[5] = mouseY;
			tempCirclePointsArray[6] = dx;
			tempCirclePointsArray[7] = dy;
			
			
			createRectangle(startx, starty, cx, cy, mouseX , mouseY , dx, dy);
			if(fillColor != null){
				ctx.fillStyle = fillColor;
				ctx.fill();
			}
			
			ctx.closePath();
			ctx.stroke();
			break;
		case 2:
			ctx.clearRect(0, 0, canvas.width, canvas.height);
			restore();
			ctx.beginPath();
			ctx.lineCap = 'butt';
			ctx.lineJoin = 'miter';
			ctx.strokeStyle = graphicsObject.color;
			ctx.lineWidth = graphicsObject.lineWidth;
			createOval(startx, starty, mouseX , mouseY);
			if(graphicsObject.isFilled == true){
				ctx.fillStyle = graphicsObject.fillColor;
			    ctx.fill();
				ctx.save();
			}
			ctx.closePath() ;
			ctx.stroke() ;
			break;
		case 3:
			ctx.clearRect(0, 0, canvas.width, canvas.height);
			restore();
			ctx.beginPath();
			ctx.lineCap = 'butt';
			ctx.lineJoin = 'miter';
			ctx.strokeStyle = graphicsObject.color;
			ctx.lineWidth = graphicsObject.lineWidth;
			createLine(startx, starty, mouseX , mouseY );
			ctx.stroke();
			break;
		case 4:
			ctx.beginPath();
			ctx.lineCap = 'round';
			ctx.lineJoin = 'round';
			ctx.strokeStyle = graphicsObject.color;
			ctx.lineWidth = graphicsObject.lineWidth;
			createLine(startx, starty, mouseX , mouseY );
			ctx.stroke(); 
			break;
		case 5:
			ctx.clearRect(0, 0, canvas.width, canvas.height);
			restore();
			ctx.beginPath();
			ctx.lineCap = 'butt';
			ctx.lineJoin = 'miter';
			ctx.strokeStyle = graphicsObject.color;
			ctx.lineWidth = graphicsObject.lineWidth;
			if(endX != null && endY != null){
				createTriangle(startx,starty,mouseX,mouseY,endX,endY);
			}else{
				createLine(startx, starty, mouseX , mouseY );
			}
			if(graphicsObject.isFilled == true){
				ctx.fillStyle = graphicsObject.fillColor;
			    ctx.fill();
				ctx.save();
			}
			ctx.closePath();
			ctx.stroke();
			break;
		case 6:
			ctx.clearRect(0, 0, canvas.width, canvas.height);
			restore();
			ctx.beginPath();
			ctx.lineCap = 'butt';
			ctx.lineJoin = 'miter';
			ctx.strokeStyle = graphicsObject.color;
			ctx.lineWidth = graphicsObject.lineWidth;
			createArrow(startx, starty, mouseX , mouseY );
			ctx.closePath();
			ctx.stroke();
			break;
		case 7:
			// Code for dotted rectangle for selection
		
			ctx.clearRect(0, 0, canvas.width, canvas.height);
			restore();
			ctx.save();
			ctx.beginPath();
			ctx.strokeStyle = "#000000";
			ctx.lineWidth= 2;
			ctx.globalAlpha = globalAlpha;
			ctx.setLineDash([3]);
			createRectangle(startx, starty, mouseX , mouseY );
			ctx.closePath();
			ctx.stroke();
			ctx.restore();
			break;
		case 8:
			ctx.clearRect(0, 0, canvas.width, canvas.height);
			restore();
			ctx.beginPath();
			drawImage(startx, starty, mouseX , mouseY );
			ctx.closePath();
			ctx.stroke();
			break;
		case 9:
			ctx.clearRect(0, 0, canvas.width, canvas.height);
			restore();
			ctx.beginPath();
			createLine(startx, starty, mouseX , mouseY );
			//points_is_onLine(startx, starty, mouseX , mouseY );
			ctx.closePath();
			ctx.stroke();
			break;
		case 10:
			ctx.clearRect(0, 0, canvas.width, canvas.height);
			restore();
			ctx.save();
			ctx.beginPath();
			ctx.strokeStyle = "#000000";
			ctx.lineWidth= 2;
			ctx.setLineDash([3]);
			createRectangle(startx, starty, mouseX , mouseY );
			ctx.closePath();
			ctx.stroke();
			ctx.restore();
			break;
			
		case 11:
			ctx.clearRect(0, 0, canvas.width, canvas.height);
			restore();
			ctx.save();
			ctx.beginPath();
			ctx.lineCap = 'butt';
			ctx.lineJoin = 'miter';
			ctx.strokeStyle = graphicsObject.color;
			ctx.lineWidth = graphicsObject.lineWidth;
			if(endX != null && endY != null){
				createArc(startx,starty,mouseX,mouseY,endX,endY);
			 }else{
				createLine(startx, starty, mouseX , mouseY );
			}
			//ctx.closePath();
			ctx.stroke();
			
			break;
			
		case 12:
			if(checkCircleBoundryInCanvas(startx, starty, mouseX , mouseY)){
				ctx.clearRect(0, 0, canvas.width, canvas.height);
				restore();
				tempCirclePointsArray[0] = startX;
				tempCirclePointsArray[1] = startY;
				tempCirclePointsArray[2] = mouseX;
				tempCirclePointsArray[3] = mouseY;
				isCircleCreated = true;
				ctx.beginPath();
				ctx.lineCap = 'butt';
				ctx.lineJoin = 'miter';
				ctx.strokeStyle = graphicsObject.color;
				ctx.lineWidth = graphicsObject.lineWidth;
				createCircle(startx, starty, mouseX , mouseY);
				if(graphicsObject.isFilled == true){
					ctx.fillStyle = graphicsObject.fillColor;
					ctx.fill();
					ctx.save();
				}
				ctx.closePath() ;
				ctx.stroke() ;
			}else{
				isCircleCreated = false;
			}
			
			break;
		case 13:
		
				var thirdPoint = getEquilateralTriangletThirdPoint(startx, starty, mouseX , mouseY);
				if(checkEqTriangleBoundryInCanvas(startx, starty, mouseX , mouseY,thirdPoint.x3,thirdPoint.y3)){
					ctx.clearRect(0, 0, canvas.width, canvas.height);
					restore();
					ctx.beginPath();
					ctx.lineCap = 'butt';
					ctx.lineJoin = 'miter';
					ctx.strokeStyle = graphicsObject.color;
					ctx.lineWidth = graphicsObject.lineWidth;
					createTriangle(startx, starty, mouseX , mouseY,thirdPoint.x3,thirdPoint.y3);
					if(graphicsObject.isFilled == true){
						ctx.fillStyle = graphicsObject.fillColor;
						ctx.fill();
						ctx.save();
					}
					ctx.closePath() ;
					ctx.stroke() ;
				}
			break;
		case 16:
					//console.log("Create object :"+text);
					ctx.clearRect(0, 0, canvas.width, canvas.height);
					restore();
					ctx.beginPath();
					createText(text,startx,starty,styleColor);
					ctx.closePath() ;
					ctx.stroke() ;
				
			break	
		case 20:
			ctx.beginPath();
			createLine(startx, starty, mouseX , mouseY );
			ctx.stroke(); 
			break;	
		}
}
function fastFarward(){
  /*
  var currTime = myVid.currentTime;
  currTime = (currTime + currTime * .1)*1000;
  */
  sliderPos =  sliderPos + 10;
  if(sliderPos < 100){
		clearTimeout(runningTimerId);	
		clearTimeout(sliderTimer);
		playingFrom = 2;
		//console.log("fastFarward:::currTime::"+currTime+":::recFileDuration::"+recFileDuration);
		//sliderPos =  Math.floor(currTime * 100/recFileDuration);
		
		//console.log("fastFarward:::sliderPos::"+sliderPos);
		currentAudioTime  = sliderPos*recFileDuration / 100;
		//console.log("-----------currentAudioTime-------"+currentAudioTime);
		currentAudioTime =  Math.ceil(currentAudioTime / 1000);
		myVid.currentTime  = currentAudioTime;
  }else{
	sliderPos = 0;
  }
   
}

function rewind(){
	sliderPos =  sliderPos - 10;
	//console.log("rewind:::"+sliderPos);
  if(sliderPos > 0){
		clearTimeout(runningTimerId);	
		clearTimeout(sliderTimer);
		playingFrom = 2;
		//console.log("fastFarward:::currTime::"+currTime+":::recFileDuration::"+recFileDuration);
		//sliderPos =  Math.floor(currTime * 100/recFileDuration);
		
		//console.log("fastFarward:::sliderPos::"+sliderPos);
		currentAudioTime  = sliderPos*recFileDuration / 100;
		//console.log("-----------currentAudioTime-------"+currentAudioTime);
		currentAudioTime =  Math.ceil(currentAudioTime / 1000);
		myVid.currentTime  = currentAudioTime;
  }else{
	sliderPos = 0;
  }
}

function setAppendStatus(status){
$('#player-Modal').modal('hide');
   if(status == 'Y'){
		ans = true;
	$('#appendRecording').click();
   }else{
		ans = false;
	$('#appendRecording').click();
   }
   
}

</script>



</body>
</html>










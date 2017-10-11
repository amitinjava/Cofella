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
		<input type="hidden" name="channel_id" id="channel_id" value = "<s:property value = '%{channel_id}' />" >
	</form>
	<img id="pointerImg" src="images/meeting/pointer_image.png" style="position:absolute;top:-50px;left:-50px;width:32px;height:32px;z-index:1" />
    <div id = "meetingDiv" style="position:absolute;top:150px;left:300px;width:510px;height:265px;z-index:1;border:1px solid;background-color:#CCCCCA;display:none;">
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
					<option value="dancing" selected>Dancing Script</option>
					<option value="learning">Learning</option>
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
			<span class="dropdown table-menu">
				<select id="textColorAttr" class="form-control color-selector" onchange = "setTextStyleColor(this);">
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
			
			
			<textarea id="area1" style="height: 205px; resize: none; width: 500px;color:#000000" wrap="hard" name="area1">
			</textarea>
		</div>
	
	</div>  
		<div align="right">
			<a data-toggle="modal" data-target="#progress-Modal" data-backdrop="static"  data-keyboard="false" ></a>
			<a data-toggle="modal" data-target="#player-Modal" data-backdrop="static"  data-keyboard="false" ></a>
			<a data-toggle="modal" data-target="#save-Modal" data-backdrop="static"  data-keyboard="false" ></a>
			<a data-toggle="modal" data-target="#recording-Modal" data-backdrop="static"  data-keyboard="false" ></a>
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
				<!-- <a id="pencilButton111" type="button" class="btn btn-default" onclick = "setId(4,true)" >111</a> -->
				<a href="#" class="menu_icon pencil" data-toggle="tooltip" data-placement="right" title="Pencil" id="pencilButton" onclick = "setId(4,true)">Pencil</a>				

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
<!-- TOOL OPTIONS TARGET AREA /\/\\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ -->

				<span id="target"></span>
				<span id="zoomOptions" style="display:none">
					<button id="zoomIn" type="button" class="btn btn-default" disabled onclick="setZoomType(1)" ><a href="javascript:void(0)" class="switchContent"><i class="fa fa-search-plus fa-lg"></i></a></button>
					<button id="zoomOut" type="button" class="btn btn-default" disabled onclick="setZoomType(2)" ><a href="javascript:void(0)" class="switchContent" ><i class="fa fa-search-minus fa-lg"></i></a></button>
				</span>
		
				<!-- OPTIONS FOR SELECT TOOL --><span id="toolOptions1" style="display:none">
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


<!-- END TOOLS MENU /\/\/\/\/\/\/\/\/ -->

<button type="button" class="btn btn-default" id="openNav">1</button>		
		
<div id="navMenu" class="well well-sm" style="display:none">
<div class="btn-group options">
    <button type="button" class="btn btn-default" onclick="setPageNum('P')" ><li class="fa fa-arrow-left fa-lg" ></li></button>
	<button type="button" class="btn btn-default disabled"><input type="text" id="pagenum" value="1" size="1" onchange="showPageObject();"></button>
	<button type="button" class="btn btn-default" onclick="setPageNum('N')" ><li class="fa fa-arrow-right fa-lg" ></li></button>
</div>
<button type="button" class="btn btn-default" id="delSlide" data-title="Delete Slide?"data-toggle="clickover" data-placement="top"><li class="fa fa-trash-o fa-lg"></li></button>

<button type="button" id="closeNav" class="btn btn-default"><li class="fa fa-caret-left fa-lg"></li></button>
</div> 


<div id ="tempMenu" class="well well-sm" style="display:block">
	<button type="button" id ="replaceStart" class="btn btn-default" onclick="toggleReplace(this);" ><a href="javascript:void(0)" class="switchContent" title="Replace Start" ><i id="replaceStartB" class="fa fa-toggle-up fa-lg"></i></a></button>
	<span  style="display:none;" id="recordObjTimeDiv">  &nbsp;&nbsp;&nbsp;<IMG SRC="images/meeting/prev.jpg" WIDTH="11" HEIGHT="18" BORDER=0 ALT="" style="vertical-align: middle;" onmousedown="decreaseTime()">&nbsp;&nbsp;<input id="selRecordObj" type="text" value="" >&nbsp;&nbsp;<IMG SRC="images/meeting/next.jpg" WIDTH="10" HEIGHT="18" BORDER=0 ALT="" style="vertical-align: middle;" onmousedown="increaseTime()"></span>
	<button type="button" class="btn btn-default" value = "EditTimer Start" onclick="toggleEditObjectTime();" ><a href="javascript:void(0)" class="switchContent" title="Edit Timer Start" ><i id="EditTimerB"class="fa fa-clock-o fa-lg"></i></a></button>
	<span id="attachBut">
		<button type="button" class="btn btn-default" onclick="showAttach();" ><a href="javascript:void(0)" class="switchContent" title="Attach Ref" ><i class="fa fa-external-link fa-lg"></i></a></button>
	</span>
	<span style="display:none" id="attachtxt" >
		<input id="refTxt" type="text" value="" ><button type="button" class="btn btn-default" value="attach" onclick="attachReference();" ><a href="javascript:void(0)" class="switchContent" title="Attach Ref" ><i class="fa fa-external-link fa-lg"></i></a></button>
	</span>
	<span id="attachButton">
		<button type="button" class="btn btn-default" onclick="selectedFile('All');" ><a href="javascript:void(0)" class="switchContent" title="Attach Document" ><i class="fa fa-paperclip fa-lg"></i></a></button>
	</span>
	<span id="groupButton">
		<button type="button" class="btn btn-default" onclick="groupSelectedObjects()" ><a href="javascript:void(0)" class="switchContent" title="Group Objects" ><i class="fa fa-users fa-lg"></i></a></button>
	</span>
	<span id="unGroupButton">
		<button type="button" class="btn btn-default" onclick="unGroupSelectedGroup()" ><a href="javascript:void(0)" class="switchContent" title="UnGroup" ><i class="fa fa-smile-o fa-lg"></i></a></button>
	</span>
	<span id="reGroupButton">
		<button type="button" class="btn btn-default" onclick="reGroupSelectedGroup()" ><a href="javascript:void(0)" class="switchContent" title="Re-Group" ><i class="fa fa-recycle fa-lg"></i></a></button>
	</span>
	<span id="hAlignButton">
		<button type="button" class="btn btn-default" onclick="hAlignSelectedObjects()" ><a href="javascript:void(0)" class="switchContent" title="Horizontal Align" ><i class="fa fa-arrows-h fa-lg"></i></a></button>
	</span>
	<span id="vAlignButton">
		<button type="button" class="btn btn-default" onclick="vAlignSelectedObjects()" ><a href="javascript:void(0)" class="switchContent" title="Vertical Align" ><i class="fa fa-arrows-v fa-lg"></i></a></button>
	</span>
	<span id="mvToTopButton">
		<button type="button" class="btn btn-default" onclick="moveToTop()" ><a href="javascript:void(0)" class="switchContent" title="Move To Top" ><i class="fa fa-caret-square-o-up fa-lg"></i></a></button>
	</span>
	<span id="mvToBottomButton">
		<button type="button" class="btn btn-default" onclick="moveToBottom()" ><a href="javascript:void(0)" class="switchContent" title="Move To Bottom" ><i class="fa fa-caret-square-o-down fa-lg"></i></a></button>
	</span>
	<!--
	<span style="display:none" id="attachDoc" >
		<input id="docPath" type="text" value="" ><button type="button" class="btn btn-default" value="attach" onclick="attachReference();" ><a href="javascript:void(0)" class="switchContent" title="Attach Document" ><i class="fa fa-paperclip fa-lg"></i></a></button>
	</span>
	-->
</div>
<div id="appendRecording" ng-click="setRecordingEnv()"></div>
<button type="button" class="btn btn-default" id="openRecord"><li class="fa fa-video-camera fa-lg" ></li></button>

		<div id="recordMenu" class="well well-sm" style="display:none">
			<button type="button" class="btn btn-default" id="closeRecord"><li class="fa fa-caret-right fa-lg"  ng-click="stopRecording()"></li></button>
			<button type="button" class="btn btn-default" id="delRecording" data-title="Delete Recording?"data-toggle="clickover" data-placement="top"><a href="javascript:void(0)" class="switchContent" title="Delete"><i class="fa fa-trash-o fa-lg"></i></a></button>
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
<!--Error Modal -->
<div class="modal fade" id="error-Modal" tabindex="-1" role="dialog" aria-labelledby="dupModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
	  <button type="button" class="close" onclick="closeModal()">&times;</button>
	   <h4 class="modal-title" id="myModalLabel">Error </h4>
      </div>
      <div class="modal-body">
		<img src="<%=request.getContextPath()%>/images/meeting/error.png">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong id="errorMsg"></strong></img>
      
      </div>
    </div>
  </div>
</div>

<!-- Progress Modal -->
<div class="modal fade" id="progress-Modal" tabindex="-1" role="dialog" aria-labelledby="dupModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
	   <h4 class="modal-title" id="myModalLabel">Upload :- <span id="fileType"></h4>
      </div>
      <div class="modal-body">
		<center><img src="<%=request.getContextPath()%>/images/meeting/loadingAnimation.gif"></center><br>
       <strong><p align="center" id="uploadMsg">Please Wait while the file is being uploaded.</p></strong>
      </div>
    </div>
  </div>
</div>
<!--recording save modal -->
<div class="modal fade" id="recording-Modal" tabindex="-1" role="dialog" aria-labelledby="dupModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
	   <h4 class="modal-title" id="myModalLabel">Recording</h4>
      </div>
      <div class="modal-body">
		<center><img src="<%=request.getContextPath()%>/images/meeting/generatorphp-thumb.gif"></center><br>
       <strong><p align="center" id="saveMsg">Saving Recorded Lecture...</p></strong>
      </div>
    </div>
  </div>
</div>
<!--Save Modal -->
<div class="modal fade" id="save-Modal" tabindex="-1" role="dialog" aria-labelledby="dupModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
	   <h4 class="modal-title" id="myModalLabel">Save</h4>
      </div>
      <div class="modal-body">
		<center><img src="<%=request.getContextPath()%>/images/meeting/generatorphp-thumb.gif"></center><br>
       <strong><p align="center" id="saveMsg">Saving Lecture...</p></strong>
      </div>
    </div>
  </div>
</div>
<!--Exit Modal -->
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

<!-- Start Over Modal-->
<div class="modal fade" id="startOver" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel">Start Over?</h4>
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


<!--Clear Recorded Modal -->
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

<!--Remove Modal -->
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

<!--player Modal -->
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
<!--  TOOLS TOGGLE -->
<script src="js/menuslide.js"></script>
<script src="js/lecture.js"></script>
<script type="text/javascript">
	var meetingName = "<s:property value = '%{meetingName}' />";
	var isAutoPlay = "<s:property value = '%{autoPlay}' />";
	var channel_id = "<s:property value = '%{channel_id}' />";
	var mode = "<s:property value = '%{mode}' />";
	var userId = "<s:property value='%{#session.user.email}'/>";
	var email = "<s:property value='%{#session.user.email}'/>";
 </script>

</body>
</html>










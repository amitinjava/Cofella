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
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/skin.css">
		
		

		<!-- javascript -->
		<script src="js/jquery-1.10.2.js"></script>
		<script src="js/jquery-ui.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/hashtable.js" ></script>
		<script src="js/angular.js"></script>
		<script src="js/main.js"></script>
		<script src="js/yahoo-dom-event.js"></script>
		<script src="js/element-min.js"></script>
		<!-- Needed for Menus, Buttons and Overlays used in the Toolbar -->
		<script src="js/container_core-min.js"></script>
		<script src="js/menu-min.js"></script>
		<script src="js/button-min.js"></script>
		<script src="js/editor-min.js"></script>
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
		
		#openRecord{
			position:absolute;
			top:0;
			right:0;
			margin:10px;
		}

		#recordMenu{
			position:absolute;
			top:0;
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
			src: url('http://192.168.1.150<%=request.getContextPath()%>/fonts/Bethhand_.ttf');
		}
		@font-face {
			font-family: 'dancing';
			src: url('http://192.168.1.150<%=request.getContextPath()%>/fonts/Dancing_Script.otf');
		}
		@font-face {
			font-family: 'learning';
			src: url('http://192.168.1.150<%=request.getContextPath()%>/fonts/learningcurve_tt.ttf');
		}
		.width-selector{
			display: inline-block !important;
			width: 66px;
		}
		.font-selector{
			display: inline-block !important;
			width: 140px;
		}

		
menu {
  /* @size sets the relative size of the buttons, define before calling the buttons mixin */
  /* Play */
  /* Stop */
  /* Fast-Forward */
  /* Rewind */
  /* Pause */
  margin: -0.5em auto;
  text-align: center;
  position: relative;
}
menu button {
  position: relative;
  display: inline-block;
  padding: .6em;
  background: linear-gradient(#ffffff, #cccccc), #c9c5c9;
  border-radius: 10em;
  border: 0 solid #d0d0d0;
  width: 8em;
  height: 8em;
  margin-right: 20px;
  box-shadow: 0 0.48em 0.56em rgba(0, 0, 0, 0.4);
}
menu button:hover {
  background: linear-gradient(#f5f5f5, #b9b9b9), #c9c5c9;
}
menu button:before,
menu button:after {
  position: absolute;
  content: " ";
}
menu button:active {
  top: 0.4em;
  box-shadow: 0 0.16em 0.24em rgba(0, 0, 0, 0.4);
}
menu .play:before {
  z-index: 2;
  top: 1.76em;
  left: 2.88em;
  width: 0;
  height: 0;
  border: 2.4em solid transparent;
  border-left-color: rgba(100, 100, 100, 0.8);
  border-left-width: 3.6em;
}
menu .play:hover:before {
  border-left-color: rgba(36, 36, 36, 0.8);
}
menu .stop:before {
  top: 2.24em;
  left: 2.24em;
  width: 3.76em;
  height: 3.76em;
  background: rgba(100, 100, 100, 0.8);
}
menu .stop:hover:before {
  background: rgba(36, 36, 36, 0.8);
}

menu .record:before {
  top: 2.24em;
  left: 2.24em;
  width: 3.76em;
  height: 3.76em;
  border-radius: 10em;
  background: rgba(100, 100, 100, 0.8);
}
menu .ff:before,
menu .ff:after {
  width: 0;
  height: 0;
  top: 2.08em;
  border: 2em solid transparent;
  border-left-color: rgba(100, 100, 100, 0.8);
  border-left-width: 2.16em;
}
menu .ff:before {
  left: 2.4em;
}
menu .ff:after {
  left: 4.528em;
  content: " ";
}
menu .ff:hover:before,
menu .ff:hover:after {
  border-left-color: rgba(36, 36, 36, 0.8);
}
menu .rw:before,
menu .rw:after {
  width: 0;
  height: 0;
  top: 2.08em;
  border: 2em solid transparent;
  border-right-color: rgba(100, 100, 100, 0.8);
  border-right-width: 2.16em;
}
menu .rw:before {
  left: 1.76em;
}
menu .rw:after {
  left: -0.4em;
  content: " ";
}
menu .rw:hover:after,
menu .rw:hover:before {
  border-right-color: rgba(36, 36, 36, 0.8);
}
menu .pause:before,
menu .pause:after {
  height: 3.76em;
  width: 1.52em;
  left: 2.32em;
  top: 2.24em;
  display: block;
  background-color: rgba(100, 100, 100, 0.8);
}
menu .pause:after {
  left: 4.32em;
}
menu .pause:hover:before,
menu .pause:hover:after {
  background-color: rgba(36, 36, 36, 0.8);
}
menu.medium {
  /* Play */
  /* Stop */
  /* Record */
  /* Fast-Forward */
  /* Rewind */
  /* Pause */
}
menu.medium button {
  position: relative;
  display: inline-block;
  padding: .6em;
  background: linear-gradient(#ffffff, #cccccc), #c9c5c9;
  border-radius: 10em;
  border: 0 solid #d0d0d0;
  width: 5em;
  height: 5em;
  margin-right: 20px;
  box-shadow: 0 0.3em 0.35em rgba(0, 0, 0, 0.4);
}
menu.medium button:hover {
  background: linear-gradient(#f5f5f5, #b9b9b9), #c9c5c9;
}
menu.medium button:before,
menu.medium button:after {
  position: absolute;
  content: " ";
}
menu.medium button:active {
  top: 0.25em;
  box-shadow: 0 0.1em 0.15em rgba(0, 0, 0, 0.4);
}
menu.medium .play:before {
  z-index: 2;
  top: 1.1em;
  left: 1.8em;
  width: 0;
  height: 0;
  border: 1.5em solid transparent;
  border-left-color: rgba(100, 100, 100, 0.8);
  border-left-width: 2.25em;
}
menu.medium .play:hover:before {
  border-left-color: rgba(36, 36, 36, 0.8);
}
menu.medium .stop:before {
  top: 1.4em;
  left: 1.4em;
  width: 2.35em;
  height: 2.35em;
  background: rgba(100, 100, 100, 0.8);
}
menu.medium .stop:hover:before {
  background: rgba(36, 36, 36, 0.8);
}

menu.medium .record:before {
  top: 1.4em;
  left: 1.4em;
  width: 2.35em;
  height: 2.35em;
  border-radius: 10em;
  background: rgba(100, 100, 100, 0.8);
}
menu.medium .record:hover:before {
  background: rgba(36, 36, 36, 0.8);
}
menu.medium .ff:before,
menu.medium .ff:after {
  width: 0;
  height: 0;
  top: 1.3em;
  border: 1.25em solid transparent;
  border-left-color: rgba(100, 100, 100, 0.8);
  border-left-width: 1.35em;
}
menu.medium .ff:before {
  left: 1.5em;
}
menu.medium .ff:after {
  left: 2.83em;
  content: " ";
}
menu.medium .ff:hover:before,
menu.medium .ff:hover:after {
  border-left-color: rgba(36, 36, 36, 0.8);
}
menu.medium .rw:before,
menu.medium .rw:after {
  width: 0;
  height: 0;
  top: 1.3em;
  border: 1.25em solid transparent;
  border-right-color: rgba(100, 100, 100, 0.8);
  border-right-width: 1.35em;
}
menu.medium .rw:before {
  left: 1.1em;
}
menu.medium .rw:after {
  left: -0.25em;
  content: " ";
}
menu.medium .rw:hover:after,
menu.medium .rw:hover:before {
  border-right-color: rgba(36, 36, 36, 0.8);
}
menu.medium .pause:before,
menu.medium .pause:after {
  height: 2.35em;
  width: 0.95em;
  left: 1.45em;
  top: 1.4em;
  display: block;
  background-color: rgba(100, 100, 100, 0.8);
}
menu.medium .pause:after {
  left: 2.7em;
}
menu.medium .pause:hover:before,
menu.medium .pause:hover:after {
  background-color: rgba(36, 36, 36, 0.8);
}
menu.small {
  /* Play */
  /* Stop */
  /* Fast-Forward */
  /* Rewind */
  /* Pause */
}
menu.small button {
  position: relative;
  display: inline-block;
  padding: .6em;
  background: linear-gradient(#ffffff, #cccccc), #c9c5c9;
  border-radius: 10em;
  border: 0 solid #d0d0d0;
  width: 3em;
  height: 3em;
  margin-right: 5px;
  box-shadow: 0 0.18em 0.21em rgba(0, 0, 0, 0.4);
}
menu.small button:hover {
  background: linear-gradient(#f5f5f5, #b9b9b9), #c9c5c9;
}
menu.small button:before,
menu.small button:after {
  position: absolute;
  content: " ";
}
menu.small button:active {
  top: 0.15em;
  box-shadow: 0 0.06em 0.09em rgba(0, 0, 0, 0.4);
}
menu.small .play:before {
  z-index: 2;
  top: 0.66em;
  left: 1.08em;
  width: 0;
  height: 0;
  border: 0.9em solid transparent;
  border-left-color: rgba(100, 100, 100, 0.8);
  border-left-width: 1.35em;
}
menu.small .play:hover:before {
  border-left-color: rgba(36, 36, 36, 0.8);
}
menu.small .stop:before {
  top: 0.84em;
  left: 0.84em;
  width: 1.41em;
  height: 1.41em;
  background: rgba(100, 100, 100, 0.8);
}
menu.small .stop:hover:before {
  background: rgba(36, 36, 36, 0.8);
}

menu.small .record:before {
  top: 0.84em;
  left: 0.84em;
  width: 1.41em;
  height: 1.41em;
  border-radius: 10em;
  background: rgba(250, 6, 36, 0.8);
}
menu.small .record:hover:before {
  background: rgba(250, 6, 36, 0.8);
}

menu.small .ff:before,
menu.small .ff:after {
  width: 0;
  height: 0;
  top: 0.78em;
  border: 0.75em solid transparent;
  border-left-color: rgba(100, 100, 100, 0.8);
  border-left-width: 0.81em;
}
menu.small .ff:before {
  left: 0.9em;
}
menu.small .ff:after {
  left: 1.698em;
  content: " ";
}
menu.small .ff:hover:before,
menu.small .ff:hover:after {
  border-left-color: rgba(36, 36, 36, 0.8);
}
menu.small .rw:before,
menu.small .rw:after {
  width: 0;
  height: 0;
  top: 0.78em;
  border: 0.75em solid transparent;
  border-right-color: rgba(100, 100, 100, 0.8);
  border-right-width: 0.81em;
}
menu.small .rw:before {
  left: 0.66em;
}
menu.small .rw:after {
  left: -0.15em;
  content: " ";
}
menu.small .rw:hover:after,
menu.small .rw:hover:before {
  border-right-color: rgba(36, 36, 36, 0.8);
}
menu.small .pause:before,
menu.small .pause:after {
  height: 1.41em;
  width: 0.57em;
  left: 0.87em;
  top: 0.84em;
  display: block;
  background-color: rgba(100, 100, 100, 0.8);
}
menu.small .pause:after {
  left: 1.62em;
}
menu.small .pause:hover:before,
menu.small .pause:hover:after {
  background-color: rgba(36, 36, 36, 0.8);
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

<body ng-controller="RecorderController" class="yui-skin-sam" onresize="windowResize()">
    <div id = "meetingDiv" style="position:absolute;top:150px;left:300px;width:390px;height:265px;z-index:1;border:1px solid;background-color:#CCCCCA;display:none;">
		<div align="center">
			<div align="center"><b>Text Editor</b> </div>
			<button type="button" class="btn btn-default"  >
				<a href="#toolOptions" class="switchContent" data-toggle="tooltip" data-placement="bottom" title="Select Tool">
					<i class="fa fa-bold"></i>
				</a>
			</button>
			<button type="button" class="btn btn-default"  >
				<a href="#toolOptions" class="switchContent" data-toggle="tooltip" data-placement="bottom" title="Select Tool">
					<i class="fa fa-italic"></i>
				</a>
			</button>
			<button type="button" class="btn btn-default">
				<a href="#toolOptions" class="switchContent" data-toggle="tooltip" data-placement="bottom" title="Select Tool">
					<i class="fa fa-underline"></i>
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
			<button type="button" class="btn btn-default"  >
		
				<a href="javascript:void(0)" onclick = "closeEditor()"class="switchContent" data-toggle="tooltip" data-placement="bottom" title="Close">
					<i class="fa fa-times"></i>
				</a>
			</button>
			<textarea id="area1" style="height: 205px; resize: none; width: 380px;" wrap="hard" name="area1">
			</textarea>
		</div>
	
	</div>  
	<audio id="audio1"  >
			<source src="" type="audio/mp3">
			Your browser does not support HTML5 video.
	</audio>
		<div align="center">
			<input type="button" value="Replace Start" onclick = "toggleReplace(this)"  />
			<input type="button" value="EditTimer Start" onclick = "toggleEditObjectTime(this)"  />
			<div id="recordObjTimeDiv" style="display:none;">  &nbsp;&nbsp;&nbsp;<IMG SRC="images/meeting/prev.jpg" WIDTH="11" HEIGHT="18" BORDER=0 ALT="" style="vertical-align: middle;" onmousedown="decreaseTime()">&nbsp;&nbsp;<input id="selRecordObj" type="text" value="" >&nbsp;&nbsp;<IMG SRC="images/meeting/next.jpg" WIDTH="10" HEIGHT="18" BORDER=0 ALT="" style="vertical-align: middle;" onmousedown="increaseTime()"></div>
			<span style="display:block" id="attachBut"><input type="button" value="Attach Ref"  onclick = "showAttach()"/></span>
			<span style="display:none" id="attachtxt" ><input id="refTxt" type="text" value="" ><input type="button" value="attach" onclick = "attachReference()" ></span>
			<canvas id="canvas" ></canvas>
		</div>
		 <input id="myInput" type="file" style="visibility:hidden" onclick="getfile();"/>
		<button type="button" class="btn btn-default" id="openTools"><i class="fa fa-pencil fa-lg"></i></button>

		<div id="toolMenu" class="well well-sm" style="display:none">
			<button type="button" class="btn btn-default">
					<span class="dropdown table-menu">
		                <a data-toggle="dropdown" href="javascript:void(0);"><i class="fa fa-cog fa-lg"></i> <div class="caret"></div></a>
		                <ul class="dropdown-menu" role="menu" aria-labelledby="actions">
		                	<li><a onclick = "saveMeetingOnServer('save')">Save</a></li>
		                	<li><a onclick = "saveMeetingOnServer('exit')">Save and Exit</a></li>
		                	<li class="divider"></li>
		                	<li><a data-toggle="modal" data-target="#cro-Modal">Clear Recorded Objects</a></li>
		                	<li class="divider"></li>
		                	<li><a data-toggle="modal" data-target="#startOver"><span class="text-danger">Start Over</span></a></li>
		            	</ul>
			</button>

			<div class="btn-group options">
				<button type="button" class="btn btn-default"  ><a href="#toolOptions" onclick = "setId(7)" class="switchContent" data-toggle="tooltip" data-placement="bottom" title="Select Tool"><i class="fa fa-hand-o-up fa-lg"></i></a></button>
				<button type="button" id ="zoom" class="btn btn-default" disabled><a href="#zoomOptions" onclick="setId(15)" class="switchContent"  data-toggle="tooltip" data-placement="bottom" title="Zoom Tool"><i class="fa fa-search fa-lg"></i></a></button>
				<button type="button" class="btn btn-default"><a href="#toolOptions" onclick = "setId(4)" class="switchContent" data-toggle="tooltip" data-placement="bottom" title="Draw Tool"><i class="fa fa-pencil fa-lg"></i></a></button>
				<button type="button" class="btn btn-default">
					<span class="dropdown table-menu">
                        <a data-toggle="dropdown" href="#"><i class="fa fa-square fa-lg" data-toggle="tooltip" data-placement="bottom" title="Closed Shape Tool"></i><span class="caret"></span></a>
                        <ul class="dropdown-menu" role="menu" aria-labelledby="tools">
	                        <li>
						        <a href="#toolOptions" onclick = "setId(1)" class="switchContent"><i class="fa fa-square-o fa-lg"></i>Square</a>
						        <a href="#toolOptions" onclick = "setId(1)" class="switchContent"><i class="fa fa-square-o fa-lg"></i>Rectangle</a>
						        <a href="#toolOptions" onclick = "setId(2)" class="switchContent"><i class="fa fa-circle-o fa-lg"></i>Oval</a>
						        <a href="#toolOptions" onclick = "setId(12)" class="switchContent"><i class="fa fa-circle-o fa-lg"></i>Circle</a>
						        <a href="#toolOptions" onclick = "setId(5)" class="switchContent"><i class="fa fa-caret-up fa-lg"></i>Triangle (free form)</a>
						        <a href="#toolOptions" onclick = "setId(5)" class="switchContent"><i class="fa fa-caret-up fa-lg"></i>Triangele (right)</a>
						        <a href="#toolOptions" onclick = "setId(13)" class="switchContent"><i class="fa fa-caret-up fa-lg"></i>Triangle (equilateral)</a>
						     </li>
                        </ul>
                    </span>
				</button>
				
				<button type="button" class="btn btn-default">
					<span class="dropdown table-menu">
                        <a data-toggle="dropdown" href="#"><i class="fa fa-square fa-lg" data-toggle="tooltip" data-placement="bottom" title="Open Shape Tool"></i><span class="caret"></span></a>
                        <ul class="dropdown-menu" role="menu" aria-labelledby="tools">
	                        <li>
						        <a href="#toolOptions" onclick = "setId(3)" class="switchContent"><i class="fa fa-minus fa-lg"></i>Line</a>
						        <a href="#toolOptions" onclick = "setId(6)" class="switchContent"><i class="fa fa-long-arrow-right fa-lg"></i>Arrow</a>
						         <a href="#toolOptions" onclick = "setId(11)" class="switchContent"><i class="fa fa-circle-o-notch fa-lg"></i>Arc</a>
						    </li>
                        </ul>
                    </span>
				</button>

				<button type="button" class="btn btn-default">
					<span class="dropdown table-menu">
                        <a data-toggle="dropdown" href="#"><i class="fa fa-file-text-o fa-lg" data-toggle="tooltip" data-placement="bottom" title="Documents"></i><span class="caret"></span></a>
                        <ul class="dropdown-menu" role="menu" aria-labelledby="tools">
	                        <li>
						        <a href="javascript:void(0)" onclick="selectedFile('image')" class="switchContent" id="image"><i class="fa fa-file-image-o fa-lg"></i>Image</a>
						        <a href="javascript:void(0)" onclick="selectedFile('pdf')" class="switchContent" id="pdf"><i class="fa fa-file-pdf-o fa-lg"></i>PDF File</a>
								<a href="javascript:void(0)" onclick="selectedFile('docx')" class="switchContent" id="doc"><i class="fa fa-file-word-o fa-lg"></i>Doc File</a>
								<a href="javascript:void(0)" onclick="selectedFile('ppt')" class="switchContent" id="ppt"><i class="fa fa-file-powerpoint-o fa-lg"></i>PPT File</a>
								<a href="javascript:void(0)" onclick="selectedFile('excel')" class="switchContent" id="excel"><i class="fa fa-file-excel-o fa-lg"></i>EXCEL File</a>
							</li>
                        </ul>
                    </span>
				</button>
				<button type="button" class="btn btn-inactive" data-toggle="tooltip" data-placement="bottom" title="Text tool inactive" onclick = "setId(16)" ><i class="fa fa-font fa-lg"></i></button>
					<!--<button type="button" class="btn btn-inactive" data-toggle="tooltip" data-placement="bottom" title="Notes tool inactive"><i class="fa fa-file-text-o fa-lg"></i></button>
					<button type="button" class="btn btn-default"><a href="javascript:void(0)" onclick="$('#myInput').click();" class="switchContent" data-toggle="tooltip" data-placement="bottom" title="Image tool"><i class="fa fa-image fa-lg"></i></a></button>
				    </button> <!-- END TOOLS BUTTON GROUP -->
			</div>
			

			<!-- TOOL OPTIONS TARGET AREA /\/\\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ -->

				<span id="target"></span>
				<!-- OPTIONS FOR SELECT TOOL -->
				<span id="toolOptions1" style="display:none">
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
						  <option value="#00FF00">Green</option>
						  <option value="#0000FF">Blue</option>
					</select>
				</span>
					Stroke
				    <select class="form-control color-selector" onclick = "setStyleColor(this);">
						 <option value="#FFFFFF" selected>White</option>
						  <option value="#000000" >Black</option>
						  <option value="#A9A9A9">Dark Grey</option>
						  <option value="#D3D3D3">Light Grey</option>
						  <option value="#FF0000">Red</option>
						  <option value="#FFA500">Orange</option>
						  <option value="#FFFF00">Yellow</option>
						  <option value="#00FF00">Green</option>
						  <option value="#0000FF">Blue</option>
					</select>

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
					
					<button type="button" class="btn btn-default" ><a href="javascript:void(0);" class="switchContent" onclick="setId(17);" data-toggle="tooltip" data-placement="bottom" title="Rotate Object" ><i class="fa fa-rotate-left fa-lg"></i></a></button>
					<button type="button" class="btn btn-default" ><a href="javascript:void(0);" class="switchContent" onclick="playfromObject();" data-toggle="tooltip" data-placement="bottom" title="Play from Selected Object" ><i class="fa fa-caret-square-o-right fa-lg"></i></a></button>
					<button type="button" class="btn btn-default" ><a href="javascript:void(0);" class="switchContent" onclick="selectedFile('video');" data-toggle="tooltip" data-placement="bottom" title="Upload Video/Audio" ><i class="fa fa-video-camera fa-lg"></i></a></button>
					<button type="button" class="btn btn-default"><a href="javascript:void(0);" class="switchContent" onclick="eraseSelectedObject();" data-toggle="tooltip" data-placement="bottom" title="Trash Object" ><i class="fa fa-trash-o fa-lg"></i></a></button>

				</span> 
				<!-- End select options -->

				<!-- Start Zoom Options -->
				<div id="zoomOptions" style="display:none">
					<button type="button" class="btn btn-default"><a href="javascript:void(0);" class="switchContent" onclick="setZoomType(1)";><i class="fa fa-search-plus fa-lg"></i></a></button>
					<button type="button" class="btn btn-default"><a href="javascript:void(0);" class="switchContent" onclick="setZoomType(2)"><i class="fa fa-search-minus fa-lg"></i></a></button>
				</div>

			<button type="button" id="closeTools" class="btn btn-default"><i class="fa fa-caret-left fa-lg"></i></button>
		</div>


		<!-- END TOOLS MENU /\/\/\/\/\/\/\/\/ -->

		<button type="button" class="btn btn-default" id="openNav">1</button>		
		
		<div id="navMenu" class="well well-sm" style="display:none">
			<div class="btn-group options">
				<button type="button" class="btn btn-default"><li class="fa fa-arrow-left fa-lg" onclick="setPageNum('P')"></li></button>
				<button type="button" class="btn btn-default disabled"><input type="text" id="pagenum" value="1" size="1" onchange="showPageObject();"></button>
				<button type="button" class="btn btn-default"><li class="fa fa-arrow-right fa-lg" onclick="setPageNum('N')"></li></button>
			</div>
			<button type="button" class="btn btn-default" data-toggle="tooltip" data-placement="top" title="Create a new slide."><li class="fa fa-plus fa-lg"></li></button>

			<!-- Popover for delete slide -->
			<button type="button" class="btn btn-default" id="delSlide" data-title="Delete Slide?"data-toggle="clickover" data-placement="top"><li class="fa fa-trash-o fa-lg"></li></button>

			<button type="button" id="closeNav" class="btn btn-default"><li class="fa fa-caret-left fa-lg"></li></button>

		</div> 

		<button type="button" class="btn btn-default" id="openRecord"><li class="fa fa-video-camera fa-lg" ></li></button>

		<div id="recordMenu" class="well well-sm" style="display:none">
			<button type="button" class="btn btn-default" id="closeRecord"><li class="fa fa-caret-right fa-lg"  ng-click="stopRecording()"></li></button>
			
			<div class="btn-group options">
				<menu class="small" style="padding: 5px;">
					<button class="rw"></button> 
					<button id="recordButton" class="record"  ng-click="checkRecordingButton()"></button>
					<button id="playpause" class="play" onclick = "togglePlayPause(this)"></button>
					<button class="stop" onclick = "stopPlaying()"></button>
					<button class="ff"></button>
					<input id="ex1" data-slider-id='ex1Slider' type="text" data-slider-min="0" data-slider-max="100" data-slider-step="1" data-slider-value="14" style="width: 100px;"/>
					<span id="cTime">00:00</span>
					<span>--</span>
					<span id="eTime">00:00</span>
					
				</menu> 
			</div>
		</div>

		<!-- //\/\/\/\/\/\/\/\/\/\//\/\/\ MODALS /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/-->

		<!-- Start Over Modal -->
		<div class="modal fade" id="startOver" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
			<div class="modal-content">
			  <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">Start Over?</h4>
			  </div>
			  <div class="modal-body">

				<p class="text-danger">By starting over, you will delete all recordings and slides.</p>
				<p class="text-danger">Are you sure you want to do this? You cannot undo this action.</p>
			  </div>
			  <div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
				<button type="button" class="btn btn-danger">Start Over</button>
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
				<button type="button" class="btn btn-danger">Clear</button>
			  </div>
			</div>
		  </div>
		</div>

	<!--  END MODALS-->



<!-- JAVASCRIPT BELOW /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\-->

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
<!-- Global Variable Define here
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
	var currentObjId = -1;
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
	var canvasBoundedRectanglePoints =  new Array();
	var isCircleCreated = false;
	var tempCirclePointsArray = new Array();
	var selObjBoundedCircleTab =  new Hashtable();
	var strechableObj = new Array();	
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
	
	if(meetingName != null || meetingName!= ''){
		
		openMeeting(meetingName);
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

		canvasOffset = $("#canvas").offset();
		offsetX = canvasOffset.left;
		offsetY = canvasOffset.top;
		initPlayer();
		
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
							loadImage(img.src);
							insertImageObj(document.getElementById("pagenum").value,img.src,true,file.name);
							dropedFileTimeTab.remove(file.name);
						};
						reader.readAsDataURL(file);
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
			//console.log("charCode::;"+charCode);
			if(charCode == 46){
				var pageNum = document.getElementById("pagenum").value;
				var objectTable = pageObjTable.get(pageNum);
				deleteSelectedObject(objectTable,pageNum);
			}
			if(charCode == 17){
				isControlPressed = true;
			}
			if(isControlPressed && charCode == 65 && currentObjId == 7){
				var pageNum = document.getElementById("pagenum").value;
				var objectTable = pageObjTable.get(pageNum);
				selectAllObject(objectTable);
			}else if(isControlPressed && charCode == 67 && currentObjId == 7){
				copySelectedObject();
			}
			else if(isControlPressed && charCode == 86 && currentObjId == 7){
				pasteCopiedObject();
			}
			
		 });
		 
		$(document).keyup(function(evt){
				isControlPressed = false;
		});
		
		$("#canvas").on('mousedown', function (e) {
			dragFlag = true;
			handleMouseDown(e);
		}).on('mouseup', function(e) {
		
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
			//$('#mycursor').show();
		}).on('click', function(e) {
			//alert("mouse click");
			handleMouseClick(e);
		}).on('dblclick', function(e) {
			//alert("mouse click");
			startX = parseInt(e.clientX - offsetX);
			startY = parseInt(e.clientY - offsetY);
			var objectTable = pageObjTable.get(document.getElementById("pagenum").value);
			var objArr = checkPointsInObject(objectTable,true);
			//console.log("objArr:::::"+objectTable.get(objArr[0]).ref);
			OpenInNewTab(objectTable.get(objArr[0]).ref);
			
		});
	});;
	
function OpenInNewTab(url) {
  var win = window.open(url, '_blank');
  win.focus();
}


function windowResize(){
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

	
function copySelectedObject(){
	if(selObjArray != null && selObjArray.length>0){
		 for(var i=0;i<selObjArray.length;i++){
			copiedObjArr[i] = selObjArray[i];
		 }
	}
}

function pasteCopiedObject(){
	var pageNum = document.getElementById("pagenum").value;
	var objectTable = pageObjTable.get(pageNum);
	var nonRecordingObjArray = nonRecordinPageObjTable.get(pageNum);
	if(nonRecordingObjArray == null){
		nonRecordingObjArray = new Array();
		nonRecordinPageObjTable.put(pageNum,nonRecordingObjArray);
	}
	var selObjArray = null;
	selObjArray = new Array();
	console.log("objectTable before pasting object::"+objectTable+"::count;::"+count+"::copiedObjArr::"+copiedObjArr);
	for(var i=0;i<copiedObjArr.length;i++){
	console.log("i=========================="+i);
		count++;
		 var pageNum = objectPageRefTable.get(copiedObjArr[i]);
		 var objectTable = pageObjTable.get(pageNum);
		 var graphicsObject = objectTable.get(copiedObjArr[i]);
		var newObjPtsArray = new Array();
		var pointsArray = graphicsObject.pointsArray;
		for(var j=0;j<pointsArray.length;j++){
			newObjPtsArray[j] = pointsArray[j];
		}
		var txtObj;
		if(graphicsObject.type == 16){
			textObj= new Text(graphicsObject.text.textData,graphicsObject.text.fontType,graphicsObject.text.fontSize,graphicsObject.text.isBold,graphicsObject.text.isUnderLine,graphicsObject.text.isItalic);
		}
		var newGraphicsObject = new GraphicsObject(count,graphicsObject.type,newObjPtsArray,graphicsObject.lineWidth,graphicsObject.color,graphicsObject.src,graphicsObject.isFilled,graphicsObject.fillColor,graphicsObject.opacity,graphicsObject.imageLoaded,graphicsObject.text,graphicsObject.ref);
		if(objectTable == null){
			objectTable = new Hashtable();
			pageObjTable.put(pageNum,objectTable);
		}
		objectTable.put(count, newGraphicsObject);
		console.log("%%%%%objectTable::::"+objectTable);
		objectPageRefTable.put(count,pageNum);
	
		nonRecordingObjArray[nonRecordingObjArray.length] = count ;
		selObjArray[selObjArray.length] = count;
	}
	console.log("objectTable After pasting object::"+objectTable+"::count);::"+count);
	var dx = 10; 
	var dy = 10; 
	shiftSelectedObject(objectTable,dx,dy);
}



function toggleEditObjectTime(obj){
	if(obj.value =='EditTimer Start'){
		obj.value ='EditTimer End';
		isEditTimerEnable = true;
		currentObjId = 7;
	}else if(obj.value =='EditTimer End'){
		obj.value ='EditTimer Start';
		document.getElementById("recordObjTimeDiv").style.display = " none";
		isEditTimerEnable = false;
		setSelectedObjectTime();
	}
}
function setSelectedObjectTime(){
	var time = document.getElementById("selRecordObj").value;
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

function setId(id){
		currentObjId = id;
		document.getElementById("toolOptions1").style.display = "inline-block";
		if(id == 3 || id ==4 || id == 6){
			//console.log("case 1");
			document.getElementById("fillOptions").style.display = "none";
		}else{
			//console.log("case 2");
			document.getElementById("fillOptions").style.display = "inline-block";
		}
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
			}
		}
		init();
}

function showAttach(){
	document.getElementById("attachtxt").style.display = "block";
	document.getElementById("attachBut").style.display ="none";
}
function attachReference(){
	var refUrl = document.getElementById("refTxt").value;
	if(refUrl != ""){
		if(selObjArray != null && selObjArray.length >0){
					var objectTable = pageObjTable.get(document.getElementById("pagenum").value);
					for(var i=0;i<selObjArray.length;i++){
						var graphicsObject = objectTable.get(selObjArray[0]);
						graphicsObject.ref = refUrl;
					}
		}
	}
	document.getElementById("attachtxt").style.display = "none";
	document.getElementById("attachBut").style.display ="block";
	selObjArray = null;
	selObjArray = new Array();
	ctx.clearRect(0, 0, canvas.width, canvas.height);
	restore();
}


function toggleReplace(obj){
	if(obj.value =='Replace Start'){// replace session starts
		if(selObjArray != null && selObjArray.length >0){
			// copy all object into array of replaceable object
			copyObjects(selObjArray,replaceableObjArr)
			isReplaceEnable = true;	
			obj.value = 'Replace End';
		
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
		obj.value = 'Replace Start';
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
	//console.log("ZoomType::::"+zoomType);
	zoomType = type;
	if(type == 2){
		canvas.style.cursor = '-webkit-zoom-out'; 
		canvas.style.cursor = '-moz-zoom-out';
	}else{
		canvas.style.cursor = '-webkit-zoom-in'; 
		canvas.style.cursor = '-moz-zoom-in';
	}
	//alert("zoom");
}

function handleZoomButton(state){
	if(state){
		//console.log("1");
		document.getElementById("zoom").disabled = false;
		}
	 else{
		//console.log("2");
		document.getElementById("zoom").disabled = true;
		}
}
function initPlayer(){
	myVid = document.getElementById("audio1");
	myVid.addEventListener("canplay", function(_event) {
	//console.log("Can play listener works here ::playingFrom ::"+playingFrom + ":::isPlayingStoped++"+isPlayingStoped);
	currentObjId = -1;
	switch(playingFrom){
				case 1:// Normal play from playing button
					if(!isPlayingStoped){
						canvas.style.cursor  = "default";
						//console.log("Play file name:::"+myVid.src);
						myVid.controls = false;
						myVid.play();
						checkAndMergeTimeRefTable();
						drawNonRecordingObject("1");
						timeRefTable.moveFirst();
						//console.log("timeRefTable:::::"+timeRefTable);
						playCount = 0;
						if(timeRefTable.next()){
							//alert(timeRefTable.getKey());
							//alert(timeRefTable.getValue());
							//console.log("Object1:::"+timeRefTable.getKey()+":Time::::"+timeRefTable.getValue().num);
							
							//var pageObj = timeRefTable.getValue();
							timeDuration = timeRefTable.getKey();;
							startTime = new Date().getTime();
							nextPlayingObjKey = timeRefTable.getKey();
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
					
					 
					 var playingStartTime = sliderPos*recFileDuration / 100;
					// myVid.currentTime  = currentAudioTime;
					 if(currentAudioTime != null){
						timeRefTable.moveFirst();
						//console.log("timeRefTable:::::"+timeRefTable);
						var currentPage = document.getElementById("pagenum").value;
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
										drawObject(objectTable,pageObj.objectId,false);
									}else{
										continue;
									}
								}
							}else{
								var nextObjTime = timeRefTable.getKey();
								playCount--;
								//console.log("nextObjTime:::::"+nextObjTime+"::::currentAudioTime:::"+playingStartTime+":::playCount"+playCount);
								runningTimerId = setTimeout('checkPageAndDrawObj('+nextObjTime+')',(nextObjTime - playingStartTime));
								
								break;
							}
						}
						myVid.controls = true;
						myVid.play();
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
					
					myVid.controls = true;
					myVid.play();
					if(sliderMoveTime ==  null){
						sliderMoveTime = Math.floor(recFileDuration / 100);
					}
					restoreAndPlayObject(id);
					selObjArray =  null;
					selObjArray = new Array();
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
	     isPlayingStoped = true;
		 document.getElementById("playpause").className = "play";
		 nextPlayingObjKey  = null;
		 nextPlayingObjtime = null;
		 isPaused = false;
		 startTime = 0;
		 //console.log(" clearTimeout(sliderTimer)111111111111111");
		 clearTimeout(sliderTimer);
		 sliderPos = 0;
		 jQuery('#ex1').slider('setValue',sliderPos);
		 // Sort timeReftable to manage new attach object while playing
		 timeRefTable= sortObjectTimeTable(timeRefTable);
		// isDrawing = true;
		 //alert("end");
	});
	myVid.addEventListener("loadedmetadata", function(_event) {
			var duration = myVid.duration;
			recFileDuration = duration * 1000;
			
			var time = Math.round(duration);
			var min = Math.floor(time / 60);
			var sec = time % 60;
			document.getElementById("eTime").innerHTML = "<b>"+min + ":"+sec+"</b>";
			
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
	});

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
								if(currentpage == (i+1)){
									loadImage(url);
								}
		  		  				
								insertImageObj(pageNum,url,false,fileName);
		  		  		}
						dropedFileTimeTab.remove(fileName);
						//console.log("44444444444444444444444");
						canvas.style.cursor = "default";	
						/*
		  		  	 	imageUrl = imageUrl + "&a=bi&pagenumber=1";
		  		  	 	loadImage(imageUrl);
						*/
		  		  		//drawImage(tempArray[0],tempArray[1],tempArray[2],tempArray[3],imageUrl);	
		  		  		//showChild(msg.parentId,msg.childList,false);
		  		  	}
		  			
		  		}});
	 
}


function uploadVideo(files){
	alert("upload called--------------------");
	 var formData =new FormData();
	 for(var i=0;i<files.length;i++){
		 formData.append("attachment",files[i]); 
	 }
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
		  		  		alert("-------------Video Upload Done-------------"+msg.uploadFileName);
						filename =  "mettingupload/"+msg.uploadFileName;
						myVid.src = "http://"+window.location.host+"/"+filename;
						alert("source file::"+myVid.src);
					}
		  		}
		  			
		  	});
	
}

function uploadDropedFiles(files,isImage){
	//alert("upload called--------------------"+isImage);
	 var formData =new FormData();
	 for(var i=0;i<files.length;i++){
		 formData.append("attachment",files[i]); 
	 }
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
		  			//alert(msg.uploadFileName);
		  			uploadFileName = msg.uploadFileName;
		  			if(msg.actionErrors != null)
		  			{
		  				alert("error");
		  		  	}else{
		  		  		alert("-------------Upload Done-------------");
						alert("get all pages::"+uploadFileName);
						clearDropZone();
						if(uploadFileName != null && !isImage){
							getAllPages(uploadFileName);
						}
					}
		  		}
		  			
		  	});
	
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


function handleMouseUp(e) {
	//console.log("mouse up::::::::Start::::::::::::::::::::::::::::"+highlightedObj);
		if(highlightedObj != null){
			highlightedObj = null;
		}
	//console.log("mouse up::::::::Start2222222222::::::::::::::::::::::::::::"+isDrawing);
		if(isDrawing){
			var mouseX = parseInt(e.clientX - offsetX);
			var mouseY = parseInt(e.clientY - offsetY);	 
			var tempPointsArray = new Array();
			if(currentObjId == 4 || currentObjId == 20){
				freeHandQdArr[freeHandQdArr.length] = mouseX;
				freeHandQdArr[freeHandQdArr.length] = mouseY;
				createObject(currentObjId,startX,startY,mouseX,mouseY,triEndX,triEndY);
				//console.log("Finel Points Array::"+freeHandQdArr);
				tempPointsArray = freeHandQdArr;
				if(currentObjId == 20){
					var boundedRect = getMinMax(tempPointsArray);
					//console.log("x::"+boundedRect.minX+"::Y::"+boundedRect.minY+":x2::"+boundedRect.maxX+"::y2::"+boundedRect.maxY);
					createObject(1,boundedRect.minX,boundedRect.minY,boundedRect.maxX,boundedRect.maxY,null,null);
					var objectTable = pageObjTable.get(document.getElementById("pagenum").value);
					//console.log("before selObjArray::"+selObjArray);
					checkObject(objectTable,boundedRect.minX,boundedRect.minY,boundedRect.maxX,boundedRect.maxY);
					 //console.log("After selObjArray::"+selObjArray);
					 /*for(var i=0;i<selObjArray.length;i++){
						var graphicsObject = objectTable.get(selObjArray[i]);
						showSelectedObject(graphicsObject);
					}*/
				}
				freeHandQdArr = null;
			}else if(currentObjId == 5 || currentObjId == 11){
				 if(triEndX == null && triEndY == null){
					  triEndX = mouseX;
					  triEndY = mouseY;
					  return;
				 }else{
					tempPointsArray[tempPointsArray.length] = startX;
					tempPointsArray[tempPointsArray.length] = startY;
					tempPointsArray[tempPointsArray.length] = mouseX;
					tempPointsArray[tempPointsArray.length] = mouseY;
					tempPointsArray[tempPointsArray.length] = triEndX;
					tempPointsArray[tempPointsArray.length] = triEndY;
					
					triEndX = null; 
					triEndY = null;
					
				 }
			}else{ 
				if(currentObjId == 12  && tempCirclePointsArray.length == 4){
				
					tempPointsArray[tempPointsArray.length] = tempCirclePointsArray[0];
					tempPointsArray[tempPointsArray.length] = tempCirclePointsArray[1];
					tempPointsArray[tempPointsArray.length] = tempCirclePointsArray[2];
					tempPointsArray[tempPointsArray.length] = tempCirclePointsArray[3];
					tempCirclePointsArray = new Array();
					
				}else{
					tempPointsArray[tempPointsArray.length] = startX;
					tempPointsArray[tempPointsArray.length] = startY;
					tempPointsArray[tempPointsArray.length] = mouseX;
					tempPointsArray[tempPointsArray.length] = mouseY;
					if(currentObjId == 16){
						tempX = mouseX;
						tempY = mouseY;
						//console.log("tempX::"+tempX+"tempY::"+tempY);
					}
				}
			}
			var pageNum = document.getElementById("pagenum").value;
			var objectTable = pageObjTable.get(pageNum);
			 //console.log("Size::::"+objectTable.size());
			if(currentObjId != 7 ){
				if(currentObjId == 16){
					createEditor(tempPointsArray);
				}
				
				if(currentObjId == 13){
					var pt = getEquilateralTriangletThirdPoint(tempPointsArray[0],tempPointsArray[1],tempPointsArray[2],tempPointsArray[3]);
					tempPointsArray[tempPointsArray.length] = pt.x3;
					tempPointsArray[tempPointsArray.length] = pt.y3;
				}else if(currentObjId == 12){
					var sqrPoint = getCircleBoundedSquareQuard(tempPointsArray[0],tempPointsArray[1],tempPointsArray[2],tempPointsArray[3]);
						tempPointsArray[0] = sqrPoint.x1;
						tempPointsArray[1] = sqrPoint.y1;
						tempPointsArray[2] = sqrPoint.x2;
						tempPointsArray[3] = sqrPoint.y2;
				}
				count++;
				//console.log("hiiiii:::"+count);
				var isFilled = false;
				if(fillColor != null){
					isFilled = true;
				}
				if(currentObjId != 16)
				var graphicsObject = new GraphicsObject(count,currentObjId,tempPointsArray,lineWidth,styleColor,null,isFilled,fillColor,globalAlpha,false,null,null);
				if(objectTable == null){
					objectTable = new Hashtable();
					pageObjTable.put(pageNum,objectTable);
				}
				objectTable.put(count, graphicsObject);
				objectPageRefTable.put(count,pageNum);
				if(isReplaceEnable){
					replacedObjArr[replacedObjArr.length] = count;
				}				
				//console.log("mouse up::::::::::::::::::::::::::::::::::::"+objectTable);
			}else{
				//console.log("mouse up::::::::::::::::::::::::::::::::::::");
				isDrawing = false;
				//console.log("1111111111111111111111111111111111111111");
				canvas.style.cursor = "default";
				rectangleSelObject = new GraphicsObject(-1,currentObjId,tempPointsArray,lineWidth,styleColor,null,false,null,null,false,null,null);
				if(objectTable != null){
					checkObject(objectTable,startX,startY,mouseX,mouseY);
				}
				startX = null;
				startY = null;

			}
			//console.log("CurrentTime:"+myVid.currentTime);
			if(!isPlayingStoped){
				currentMiliSec =Math.floor(myVid.currentTime * 1000);
				//console.log("case 1 CurrentTime:"+currentMiliSec);
				//console.log("case 1 CurrentTime::::"+currentMiliSec+"::::count:::::"+count);
				var pageObject = new PageObject(document.getElementById("pagenum").value,count);
				//objectTimeTable.put(count,currentMiliSec);
				
				//timeRefTable.put(currentMiliSec,pageObject);
				insertObjectInPlayingStream(currentMiliSec,pageObject);
				//console.log("case 1 objectTimeTable:"+objectTimeTable);
				
			
			}else if(startTime != 0 && isPlayingStoped){
				var currentTime = new Date().getTime();
				currentMiliSec = recFileDuration + Math.ceil(currentTime - startTime);
				//console.log("case 2 CurrentTime:"+currentMiliSec);
				//console.log("case 2 currentMiliSec::::"+currentMiliSec+"::::count:::::"+count);
				var pageObject = new PageObject(document.getElementById("pagenum").value,count);
				objectTimeTable.put(count,currentMiliSec);
				var recordedObjArr = timeRefTable.get(currentMiliSec);
				if(recordedObjArr ==  null){
					recordedObjArr = new Array();
				}
				recordedObjArr[recordedObjArr.length] = pageObject;
				timeRefTable.put(currentMiliSec,recordedObjArr);
				//console.log("case 2 objectTimeTable:"+objectTimeTable);
				//console.log("timeRefTable::::"+timeRefTable+"pageObject"+pageObject.num+"::"+pageObject.objectId+"objectTimeTable::"+objectTimeTable);
			}else{
				var nonRecordingObjArray = nonRecordinPageObjTable.get(document.getElementById("pagenum").value);
				if(nonRecordingObjArray == null){
					nonRecordingObjArray = new Array();
					nonRecordinPageObjTable.put(document.getElementById("pagenum").value,nonRecordingObjArray);
				}
				nonRecordingObjArray[nonRecordingObjArray.length] = count;
			}
		}else{
				if(currentObjId == 7){
					canvas.style.cursor = "default";
					var mouseX = parseInt(e.clientX - offsetX);
					var mouseY = parseInt(e.clientY - offsetY);	
					var tempPointsArray = new Array();
					tempPointsArray[tempPointsArray.length] = startX;
					tempPointsArray[tempPointsArray.length] = startY;
					tempPointsArray[tempPointsArray.length] = mouseX;
					tempPointsArray[tempPointsArray.length] = mouseY;
					rectangleSelObject = new GraphicsObject(-1,currentObjId,tempPointsArray,lineWidth,styleColor,null,false,null,null,false,null,null);
					var objectTable = pageObjTable.get(document.getElementById("pagenum").value);
					//console.log("objectTable------------------"+objectTable+ "startX"+startX+",startY"+startY);
					if(objectTable != null){
						checkObject(objectTable,startX,startY,mouseX,mouseY);
					}
					//console.log("selObjArray------------------"+selObjArray);
					startX = null;
					startY = null;
				}
		
		
			//console.log("isControlPressed::::"+isControlPressed);
			/*if(currentObjId == 7 && selObjArray != null && !isControlPressed){
				//console.log("Control key not pressed");
				selObjArray =  null;
				selObjArray = new Array();
				rectangleSelObject = null
				ctx.clearRect(0, 0, canvas.width, canvas.height);
				restore();
				startX = null;
				startY = null;
			}*/
			if(currentObjId == 7 && rectangleSelObject!= null){
				startX = null;
				startY = null;
			}

		}
		isDrawing = false;
		//console.log("222222222222222222222222222222222");
		if(currentObjId != 15){
			canvas.style.cursor = "default";
		}			
	}

	function handleMouseMove(e) {
	//console.log("isPlayingStoped::;"+isPlayingStoped);
	//console.log("isDrawing:::"+isDrawing + "::startX::;"+startX+ "::startY::"+startY);
		if (isDrawing) {
			//console.log("Mouse move-------------------"+e.clientX+"::Y::"+e.clientY);
				//console.log("offsetX-------------------"+offsetX);
			var mouseX = parseInt(e.clientX - offsetX);
			var mouseY = parseInt(e.clientY - offsetY);		
			//console.log("mouseX-------------------"+mouseX+"::mouseY::"+mouseY);
			/*
			ctx.clearRect(0, 0, canvas.width, canvas.height);
			ctx.beginPath();
			ctx.rect(startX, startY, mouseX - startX, mouseY - startY);
			ctx.stroke();
			*/
			/*
			if(currentObjId == 12){
					if(isCircleCreated){
						tempCirclePointsArray[tempCirclePointsArray.length] = startX;
						tempCirclePointsArray[tempCirclePointsArray.length] = startY;
						tempCirclePointsArray[tempCirclePointsArray.length] = mouseX;
						tempCirclePointsArray[tempCirclePointsArray.length] = mouseY;
					}
					createObject(currentObjId,startX,startY,mouseX,mouseY,triEndX,triEndY);
				}else{
					createObject(currentObjId,startX,startY,mouseX,mouseY,triEndX,triEndY);
				}
			*/
			if(currentObjId == 4 || currentObjId == 20){
				//console.log("current points"+mouseX+"::Y:"+mouseY);
				//console.log("Free hand Qd "+ freeHandQdArr[freeHandQdArr.length-2] +"::Y:"+ freeHandQdArr[freeHandQdArr.length-1] );
				
				//if(dist(mouseX,mouseY,startX,startX) > minDist) { 
				  //console.log("Points before app"+mouseX+"::Y:"+mouseY);
				  var appPoint = exSmooth(mouseX,mouseY,startX,startY); 
				  //console.log("Points after app"+appPoint.x+"::Y:"+appPoint.y);
				  freeHandQdArr[freeHandQdArr.length] = appPoint.x;
				  freeHandQdArr[freeHandQdArr.length] = appPoint.y;
				  createObject(currentObjId,startX,startY,appPoint.x,appPoint.y,triEndX,triEndY);
				  startX = appPoint.x;
				  startY = appPoint.y;
				  /*

				  freeHandQdArr[freeHandQdArr.length] = mouseX;
					freeHandQdArr[freeHandQdArr.length] = mouseY;
					//console.log(canvas.points)
					exSmooth(freeHandQdArr);
				*/	
				  //  smoothingFn(canvas.points); 
					//clear(canvas); 
					//drawLine(canvas, pointsArr); 
				 // }
				
			/*		
				startX = mouseX;
				startY = mouseY;
				if(freeHandQdArr == null){
					freeHandQdArr = new Array();
				}
				freeHandQdArr[freeHandQdArr.length] = startX;
				freeHandQdArr[freeHandQdArr.length] = startY;
				*/
			}else if(currentObjId == 16){
				// text
			}else{
				createObject(currentObjId,startX,startY,mouseX,mouseY,triEndX,triEndY);
			}
		}else{
			var objectTable = pageObjTable.get(document.getElementById("pagenum").value);
			//console.log("strechableObj--------------------------------------------------"+strechableObj[0]+":::dragFlag::"+dragFlag);
			if(strechableObj.length >0 && strechableObj[0] != null && dragFlag){
				//console.log("%%%%%%%%%%%%%%%%%%%%%%%%%strechableObj--------------------------------------------------");
				var mouseX = parseInt(e.clientX - offsetX);
				var mouseY = parseInt(e.clientY - offsetY);
				if(currentObjId == 17){
					var objectTable = pageObjTable.get(document.getElementById("pagenum").value);
					rotateSelectedObject(objectTable,mouseX,mouseY);
					startX = mouseX;
					startY = mouseY;
				}else{
					//stretchSelectedObject(strechableObj[0],strechableObj[1],strechableObj[2],mouseX,mouseY);
					stretchSelectedObject(strechableObj,mouseX,mouseY);
				}
			}else if(selObjArray != null && selObjArray.length>0 && dragFlag){
				//console.log("Drag objectttttttttt--------------------------------------------------"+selObjArray);
				var mouseX = parseInt(e.clientX - offsetX);
				var mouseY = parseInt(e.clientY - offsetY);
				var objectTable = pageObjTable.get(document.getElementById("pagenum").value);
				translateSelectedObject(objectTable,mouseX,mouseY);
				startX = mouseX;
				startY = mouseY;
			}else if(rectangleSelObject != null && dragFlag){
			    //console.log("rectangleSelObject::::"+rectangleSelObject+"::isDrawing::"+isDrawing);
				//console.log("rectangleSelObject::::"+rectangleSelObject);
				var mouseX = parseInt(e.clientX - offsetX);
				var mouseY = parseInt(e.clientY - offsetY);
				var objectTable = pageObjTable.get(document.getElementById("pagenum").value);
				//rectangleSelObject = new GraphicsObject(-1,currentObjId,tempPointsArray,lineWidth,styleColor,null);
				var pointsArr = rectangleSelObject.pointsArray
				if(objectTable != null){
					//console.log("selObjArray@@@@@@@@@@@@@@@@@@@@222"+selObjArray);
					checkObject(objectTable,pointsArr[0],pointsArr[1],pointsArr[2],pointsArr[3]);
				}
				translateSelectedObject(objectTable,mouseX,mouseY);
				startX = mouseX;
				startY = mouseY;
			
			}else if(currentObjId == 7 || currentObjId == 17){
					var mouseX = parseInt(e.clientX - offsetX);
					var mouseY = parseInt(e.clientY - offsetY);
					var objectTable = pageObjTable.get(document.getElementById("pagenum").value);
					//console.log("selObjArray@@@@@@@@@@@@@@@@@@@@"+selObjArray);
					checkOpenObjectForSelection(objectTable,mouseX,mouseY);
					if(selObjArray != null && selObjArray.length>0 && currentObjId != 15){
						checkSelectedObjectStrechableState(objectTable,mouseX,mouseY,currentObjId);
					}else{
						// create Rubberband 
						if(dragFlag){
							ctx.setLineDash([5]);
							//console.log("Create rubberband rect-------------------");
							createObject(7,startX,startY,mouseX,mouseY,null,null,null)
						}
					}
			}
		}
	}

	function handleMouseDown(e) {
		var objectTable = pageObjTable.get(document.getElementById("pagenum").value);
		if(currentObjId == 0){
			alert("Please select Object First");
			return;
		}if(currentObjId == 8 ){
			startX = parseInt(e.clientX - offsetX);
			startY = parseInt(e.clientY - offsetY);
			highlightObject(objectTable);
			return;
		}if(!isDrawing && currentObjId == 7){
			startX = parseInt(e.clientX - offsetX);
			startY = parseInt(e.clientY - offsetY);
			var objectTable = pageObjTable.get(document.getElementById("pagenum").value);
			var objArr = checkPointsInObject(objectTable,true);
			//console.log("objArr::;:"+objArr);
			if(objArr.length != 0 && isEditTimerEnable){
				editRecordedObjectTime(objArr);
				
				return;
			}
			if(!isPlayingStoped && objArr.length != 0){
				currentMiliSec =Math.floor(myVid.currentTime * 1000);
				// attachObjectInplayingStream(objArr[0],currentMiliSec);
				var pageObject = new PageObject(document.getElementById("pagenum").value,objArr[0]);
				//objectTimeTable.put(objArr[0],currentMiliSec);
				//timeRefTable.put(currentMiliSec,pageObject);
				insertObjectInPlayingStream(currentMiliSec,pageObject);
				var graphicsObject = objectTable.get(objArr[0]);
				showSelectedObject(graphicsObject);
				return;
			}
			//console.log("objArr::::;"+objArr);
			if(objArr.length != 0){
			   var pos = checkObjInSelList(selObjArray,objArr[0]);
				//console.log("pos::::;"+pos);	   
				if(pos != -1){
				   var obj = objectTable.get(objArr[0]);
					var state = checkPointsInSelectionState(obj,startX,startY);
				   //console.log("State:::::::::::::::::"+state);
					if(state){
						//console.log("Ponts is in selected region----------------------");
					}else if(!isControlPressed){
						selObjArray[pos] = null;
						selObjArray.splice(pos ,1);
						var graphicsObject = objectTable.get(objArr[0]);
						//console.log("disable zoom::"+graphicsObject.type);
						if(graphicsObject.type == 8){
							// disable Zoom Button
							handleZoomButton(false);
						}
					}
					
				}else{
					if(!isControlPressed){
						if(strechableObj.length !=0 && strechableObj[1] == null){
							//console.log("---- selObjArray =  null--11111111111");
							selObjArray =  null;
							selObjArray = new Array();
							ctx.clearRect(0, 0, canvas.width, canvas.height);
							restore();
							handleZoomButton(false);
						}
					}
					var graphicsObject = objectTable.get(objArr[0]);
					//console.log("enable zoom::"+graphicsObject.type);
					if(graphicsObject.type == 8){
						// enable Zoom Button
						handleZoomButton(true);
					}else{
						handleZoomButton(false);
					}
					selObjArray[selObjArray.length] = objArr[0];
				}
				if(selObjArray.length >0){
					for(i=0;i<selObjArray.length;i++){
						var graphicsObject = objectTable.get(selObjArray[i]);
						showSelectedObject(graphicsObject);
					}
				}else{
				    //console.log("---- selObjArray =  null--222222222222222222");
					selObjArray =  null;
					selObjArray = new Array();
					strechableObj[0] = null;
					strechableObj[1] = null;
					strechableObj[2] = null;
					ctx.clearRect(0, 0, canvas.width, canvas.height);
					restore();
					handleZoomButton(false);
				}
			}else{
				// deselect all object
				 if(!isControlPressed){
					if(strechableObj.length !=0 && strechableObj[1] == null){
					//console.log("---- selObjArray =  null--333333333333");
						selObjArray =  null;
						selObjArray = new Array();
						ctx.clearRect(0, 0, canvas.width, canvas.height);
						restore();
						handleZoomButton(false);
					}
				}
				//console.log("Create rubbberband-----------");
				
				if(rectangleSelObject != null ){
				//console.log("YYYYYYYYYYYYYYYYYYYYYYYYYYYYY"+rectangleSelObject);
					var pointsArray = rectangleSelObject.pointsArray;
					/*
					if(transPointsArray ==  null){
						transPointsArray =  new Array();
						var pointsArray = rectangleSelObject.pointsArray;
						transPointsArray[0] = pointsArray[0] ;
						transPointsArray[1] = pointsArray[1] ;
						transPointsArray[2] = pointsArray[2] 
						transPointsArray[3] = pointsArray[3] ;
					}
					*/
					//console.log("Check Start Points:::"+point_in_rectagnle(startX,startY,pointsArray[0],pointsArray[1],pointsArray[2],pointsArray[3]));
					if(point_in_rectagnle(startX,startY,pointsArray[0],pointsArray[1],pointsArray[2],pointsArray[3])){
						canvas.style.cursor = "move";		
						//console.log("now transform object");
						isDrawing = false;
					}else{
						rectangleSelObject = null;
						//console.log("---- selObjArray =  null--4444444444");
						selObjArray =  null;
						selObjArray = new Array();
						ctx.clearRect(0, 0, canvas.width, canvas.height);
						restore();
						handleZoomButton(false);
					}
				}
				
			}
			//console.log("In MouseDown:::"+selObjArray);
			return;
		}if(!isDrawing && rectangleSelObject == null){
			//console.log("NNNNNNNNNNNNNNNNNNNNNNNNNNNNN");
			startX = parseInt(e.clientX - offsetX);
			startY = parseInt(e.clientY - offsetY);
			
			
			if(currentObjId == 7){
				var objectTable = pageObjTable.get(document.getElementById("pagenum").value);
				checkPointsInObject(objectTable,true);
				//console.log("selObjArray"+selObjArray);
				//alert("selObjArray"+selObjArray);
			}
			if(selObjArray == null || selObjArray.length == 0){
				canvas.style.cursor = "crosshair";		
				isDrawing = true
			}
			if(currentObjId == 4 || currentObjId == 20){
				if(freeHandQdArr == null){
					freeHandQdArr = new Array();
				}
				
				 for(var i = 0; i < smoothLength+1; ++i) {
					freeHandQdArr[freeHandQdArr.length] = startX;
					freeHandQdArr[freeHandQdArr.length] = startY;
				}
			
			}
			
		}if(rectangleSelObject != null ){
			//console.log("YYYYYYYYYYYYYYYYYYYYYYYYYYYYY"+rectangleSelObject);
			if(startX == null && startY == null){
				startX = parseInt(e.clientX - offsetX);
				startY = parseInt(e.clientY - offsetY);
			}
			var pointsArray = rectangleSelObject.pointsArray;
			/*
			if(transPointsArray ==  null){
				transPointsArray =  new Array();
				var pointsArray = rectangleSelObject.pointsArray;
				transPointsArray[0] = pointsArray[0] ;
				transPointsArray[1] = pointsArray[1] ;
				transPointsArray[2] = pointsArray[2] 
				transPointsArray[3] = pointsArray[3] ;
			}
			*/
			//console.log("Check Start Points:::"+point_in_rectagnle(startX,startY,pointsArray[0],pointsArray[1],pointsArray[2],pointsArray[3]));
			if(point_in_rectagnle(startX,startY,pointsArray[0],pointsArray[1],pointsArray[2],pointsArray[3])){
				canvas.style.cursor = "move";		
				//console.log("now transform object");
				isDrawing = false;
			}else{
				rectangleSelObject = null;
				//console.log("---- selObjArray =  null--4444444444");
				selObjArray =  null;
				selObjArray = new Array();
				ctx.clearRect(0, 0, canvas.width, canvas.height);
				restore();
				handleZoomButton(false);
			}
		}if(currentObjId == 15){
			if(selObjArray.length >0){
				for(i=0;i<selObjArray.length;i++){
					var graphicsObject = objectTable.get(selObjArray[i]);
					if(graphicsObject.type == 8){
						zoomImage(graphicsObject,1);
					}
				}
			}
			
		}
		//alert("11111111111111111");
		/*
		if(currentObjId == 7){
			ctx.setLineDash([5]);
		}else{
			ctx.setLineDash([0]);
		}
		*/
		//console.log("startX::"+startX+"::startY::"+startY);
	}
	
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
		document.getElementById("recordObjTimeDiv").style.display = " block";
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
		var count = 0;
		while(mergedTimeRefTable.next()){
			timeArray[count] = mergedTimeRefTable.getKey();
			count++;
		}
	timeArray = timeArray.sort(function(a, b){return a-b});
	for(var i=0;i<timeArray.length;i++){
		//console.log("timeRefTable::;"+timeArray[i]);
		sortedRefTable.put(timeArray[i],mergedTimeRefTable.get(timeArray[i]));
	}
	return sortedRefTable;
}

function checkAndMergeTimeRefTable(){
	if(repTimeRefTable != null){
		checkAndManageObjectInTable();
		repTimeRefTable.add(timeRefTable);
		var sortedTimeRefTable = sortObjectTimeTable(repTimeRefTable);
		timeRefTable = null;
		repTimeRefTable = null;
		timeRefTable = sortedTimeRefTable ;
	}
	//console.log("Merged timeRefTable:::"+timeRefTable);
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
	if(id == 2 || id == 3 || id ==4 || id ==9 || id == 11 || id == 12 || id ==13){
		ctx.lineCap = 'round';
		ctx.lineJoin = 'round';
	}else{
		ctx.lineCap = 'butt';
		ctx.lineJoin = 'meter';
	}
	ctx.globalAlpha = 1.0;
	
	switch(id){
		case 1:
			ctx.clearRect(0, 0, canvas.width, canvas.height);
			//console.log("---createRectangle----"+styleColor);
			restore();
			ctx.beginPath();
			
		//	//console.log("isFilled::"+isFilled);
			ctx.strokeStyle = styleColor;
			ctx.lineWidth= lineWidth;
			ctx.globalAlpha = globalAlpha;
			
			createRectangle(startx, starty, mouseX , mouseY );
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
			ctx.strokeStyle = styleColor;
			ctx.lineWidth= lineWidth;
			ctx.globalAlpha = globalAlpha;
			createOval(startx, starty, mouseX , mouseY);
			/*
			var startAngleinDegrees = 0 ;
			var endAngleinDegrees = 360 ;
			  
			var startAngleinRadians = (Math.PI/180) * startAngleinDegrees ;
			var endAngleinRadians = (Math.PI/180) * endAngleinDegrees ;
			  
			ctx.beginPath() ;
			//console.log("MousePos::x:"+startX+":y:"+startY+":w:"+ (mouseX - startX)+":h:"+(mouseY - startY));
			var w =  mouseX - startX;
			var h = mouseY - startY;
			var centerX  = startX + w/2
			var centerY  = startY + h/2
			
			if(w<0){
				 w = -w;
			}
			if(h<0){
				h = -h;
			}
			//console.log("MousePos::x:"+startX+":y:"+startY+":w:"+ w+":h:"+h);
			ctx.ellipse(centerX , centerY,w,h, 0, startAngleinRadians, endAngleinRadians, false) ;
			ctx.lineWidth = 3;
			*/
			if(fillColor != null){
				ctx.fillStyle = fillColor;
				ctx.fill();
			}
			ctx.closePath() ;
			ctx.stroke() ;
			break;
		case 3:
			ctx.clearRect(0, 0, canvas.width, canvas.height);
			restore();
			ctx.beginPath();
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
	var chk2 = point_in_rectagnle(x2,y2,canvasBoundedRectanglePoints[0],canvasBoundedRectanglePoints[1],canvasBoundedRectanglePoints[2],canvasBoundedRectanglePoints[3])
	var chk3 = point_in_rectagnle(x3,y3,canvasBoundedRectanglePoints[0],canvasBoundedRectanglePoints[1],canvasBoundedRectanglePoints[2],canvasBoundedRectanglePoints[3])
	return (chk1 && chk2 && chk3 )
	}
function restore(){
	if(!isPlayingStoped){
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
						//console.log("restore------222222222222222:::"+objectTable);
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
					//console.log("restore$$$$$$$$$$$$"+objectTable.getKey());
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
	
	var recordObjArr = timeRefTable.get(key);
	for(var i=0;i<recordObjArr.length;i++){
		var pageObj = timeRefTable.get(recordObjArr[i]);
		if(pageObj != null){
			var objectTable = pageObjTable.get(pageObj.num);
			ctx.clearRect(0, 0, canvas.width, canvas.height);
			drawNonRecordingObject(pageObj.num);
			restoreRecordedObj(key);
			break;
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
					//console.log("Not Image---------------"+graphicsObject.type);
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
				drawObject(objectTable,objectTable.getKey(),false);
			}
		  }
		 
		}
}

function drawObject(objectTable,id,highlight){
	//console.log("drawObject:;"+objectTable + "::id:;"+id);
	/*
	if(myVid != null){
		myVid.currentTime = 2.564;
		//console.log("currentime:::;"+myVid.currentTime);
		//console.log("Start: " + myVid.seekable.start(0)+ " End: " + myVid.seekable.end(0));
	}
	*/
	var graphicsObject = objectTable.get(id);
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
	/*
	if(graphicsObject.type == 2 || graphicsObject.type == 3 || graphicsObject.type ==4 || graphicsObject.type ==9 || graphicsObject.type ==11 || graphicsObject.type ==12 ||graphicsObject.type ==13){
		ctx.lineCap = 'round';
		ctx.lineJoin = 'round';
	}else{
		ctx.lineCap = 'butt';
		ctx.lineJoin = 'meter';
	}
	*/
		ctx.lineCap = 'round';
		ctx.lineJoin = 'round';
	//console.log("Object Type::;;:"+graphicsObject);
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
					
			
			
					createRectangle(pointsArr[0], pointsArr[1], pointsArr[2], pointsArr[3]);
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
					createOval(pointsArr[0], pointsArr[1], pointsArr[2], pointsArr[3]);
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
					//console.log("Image-----tempArray ::::"+tempArray+"::::currentObjId:::"+currentObjId);
					isImageLoaded = false;
					if(graphicsObject.imageLoaded){
						imageObj = null;
						imageObj= new Image();
						imageObj.src = graphicsObject.src;
						loadAndDrawImage();
					}else{
						loadImage(graphicsObject.src);
						graphicsObject.imageLoaded = true;
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
				
				break	
				}
				
				
				
		//console.log("Draw Object:::close path::::");
			if(graphicsObject.type!=3 && graphicsObject.type!=4 && graphicsObject.type!= 11)
				ctx.closePath() ;
				ctx.stroke() ;
			if(graphicsObject.isFilled){
				ctx.restore()
			}
	
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
	startTime = new Date().getTime()
	//Set Page Move Event when recording will start to move on that page.
	var pageNumber = document.getElementById("pagenum").value;
	storePageChangeEvent(pageNumber);
		//console.log("startTime:::"+startTime);
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
//console.log("Inside init:::"+currentObjId);
	// if(rectangleSelObject != null)
	 if(selObjArray != null && selObjArray.length>0 && !(currentObjId == 17 || currentObjId == 15) ){
		//console.log("Inside init22222222222:::"+currentObjId);
			rectangleSelObject = null;
			//console.log("---- selObjArray =  null--55555555555");
			selObjArray =  null;
			selObjArray = new Array();
			ctx.clearRect(0, 0, canvas.width, canvas.height);
			restore();
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

function createOval_new(x1,y1,x2,y2){
	ctx.beginPath();
	var cx = (x1 + x2) / 2;
	var cy = (y1 + y2) / 2;
	
	var rx = (x2 - x1) / 2;
    var ry = (y2 - y1) / 2;
	
		var angleX1 = x1-x2;
		var angleY1 = y1-y2;
		
		angleR1=Math.atan2(angleY1, angleX1);
		//console.log("angleR1::"+angleR1);
		
		var angleX2 = angleX1-x1;
		var angleY2 = angleY1-y1;
		angleR2=Math.atan2(angleY2, angleX2);
		//console.log("angleR2::"+angleR2);
		mouseAngle = Math.abs(angleR2-angleR1);
		//console.log("mouseAngle::"+mouseAngle);
    

for (var i = 0 * Math.PI; i < 2 * Math.PI; i += 0.01 ) {
    xPos = cx - (rx * Math.sin(i)) * Math.sin(mouseAngle* Math.PI) + (ry * Math.cos(i)) * Math.cos(mouseAngle * Math.PI);
    yPos = cy + (ry * Math.cos(i)) * Math.sin(mouseAngle * Math.PI) + (rx * Math.sin(i)) * Math.cos(mouseAngle * Math.PI);

    if (i == 0) {
        ctx.moveTo(xPos, yPos);
    } else {
        ctx.lineTo(xPos, yPos);
    }
}

ctx.closePath();
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

function createRectangle(x1,y1,x2,y2){
	//console.log("x1::"+x1+"::y1::"+y1 +"::x2::"+x2+"::y2::"+y2);
	ctx.rect(x1, y1,x2-x1,y2-y1);
	//console.log("Rectangle Created");

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
	if(!isRecRunning){
		isPlayingStoped = true;
		//console.log(" clearTimeout(sliderTimer)444444444444444");
		clearTimeout(sliderTimer);
		sliderPos = 0;
		if(runningTimerId != null){
			clearTimeout(runningTimerId);
		}
			//console.log("myVid::::"+myVid);
			myVid.pause();
			myVid.currentTime = 0;
			//checkAndMergeTimeRefTable();
			var pageNumber = document.getElementById("pagenum").value;
			drawNonRecordingObject(pageNumber);
			restoreAllRecordedObj(pageNumber);
			document.getElementById("playpause").className  = "play";
			jQuery('#ex1').slider('setValue',sliderPos);
		
	}

}


function togglePlayPause(obj){
  //console.log(":::togglePlayPause-------isRecRunning::"+isRecRunning);
  //alert("hiiiii");
 if(!isRecRunning){
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
		isPaused = false
		myVid.play();
		startSlide();
		if(nextPlayingObjKey != null){
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
		/*//console.log("Can play listener works here"+isPlayingStoped);
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
	var pageObj = recordedObjArr[0];
	var objectTable = pageObjTable.get(pageObj.num);
	ctx.clearRect(0, 0, canvas.width, canvas.height);
	drawNonRecordingObject(pageObj.num);
	restoreRecordedObj(key);
	
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
		runningTimerId = setTimeout('checkPageAndDrawObj('+keyy+')',timeDuration);
	}

}

function checkPageAndDrawObj(key){
	playCount++;
	//console.log("checkPageAndDrawObj:::"+key);
	var recordedObjArr = timeRefTable.get(key);
	var pageObj = recordedObjArr[0];
	var objectTable = pageObjTable.get(pageObj.num);
	//console.log("pageObj.num:::;"+pageObj.num+":::::Pagenumber ::"+document.getElementById("pagenum"));
	if(pageObj.num == document.getElementById("pagenum").value){
		//console.log("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
		for(var i=0;i<recordedObjArr.length;i++){
			pageObj = recordedObjArr[i];
			drawObject(objectTable,pageObj.objectId,false);
		}
		restoreInsertedObjectInStream(pageObj.num);
	}else{
		//console.log("*********************************************");
		document.getElementById("pagenum").value = pageObj.num;
		ctx.clearRect(0, 0, canvas.width, canvas.height);
		drawNonRecordingObject(pageObj.num);
		restoreRecordedObj(key);
		drawObject(objectTable,pageObj.objectId,false);
	}
	var keys=  timeRefTable.keys;
	timeDuration = keys[playCount] - keys[playCount-1]
	if(playCount < keys.length){
		var keyy = keys[playCount];	
		//console.log("timeDuration::::"+keyy);
		nextPlayingObjKey = keyy;
		startTime = new Date().getTime();
		runningTimerId = setTimeout('checkPageAndDrawObj('+keyy+')',timeDuration);
	}
}

function restoreRecordedObj(timestamp){
	timeRefTable.moveFirst();
    //console.log("timeRefTable:::::"+timeRefTable);
	var currentPage = document.getElementById("pagenum").value;
	var objectTable = pageObjTable.get(currentPage);
	while(timeRefTable.next()){
		if(timeRefTable.getKey()<timestamp){
			var recordedObjectArr = timeRefTable.getValue();
			for(var i=0;i<recordedObjectArr.length;i++){
				var pageObj = recordedObjectArr[i];
				if(pageObj.num == currentPage){
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
				}
	}
}

function closeEditor(){
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
	if(text.trim().length != 0){
		saveTextAsGraphicsObject(text);
	}
	
	
	
	

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
		
			var tempPointsArray = new Array();
			tempPointsArray[tempPointsArray.length] = startX ;
			tempPointsArray[tempPointsArray.length] = startY - 50;
			tempPointsArray[tempPointsArray.length] = startX;
			tempPointsArray[tempPointsArray.length] = startY ;
			var textObj = new Text(text,textFontType,textFontSize,isBold,isUnderLine,isItalic);
			graphicsObject = new GraphicsObject(count,currentObjId,tempPointsArray,lineWidth,styleColor,null,false,fillColor,globalAlpha,false,textObj,null);
			createObject(currentObjId,startX,startY,null,null,null,null,textObj);
			graphicsObject.pointsArray[2] = graphicsObject.pointsArray[2] + textWidth;
		}
		
		var pageNum = document.getElementById("pagenum").value;
		var objectTable = pageObjTable.get(pageNum);
		//console.log("saveTextAsGraphicsObject::objectTable:::"+objectTable);
		if(objectTable == null){
			objectTable = new Hashtable();
			pageObjTable.put(pageNum,objectTable);
		}
		objectTable.put(count, graphicsObject);
		objectPageRefTable.put(count,pageNum);
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
	ctx.font = textObj.fontSize +"px "+textObj.fontType;
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
	}
	var pos = objectTimeTable.get(key);
	timeRefTable.remove(pos);
	objectTimeTable.remove(key);
	
 }
 
 var nonRecordingObjArray = nonRecordinPageObjTable.get(pageNum);
 
 ctx.clearRect(0, 0, canvas.width, canvas.height);
 rectangleSelObject = null;
 //console.log("---- selObjArray =  null--6666666666666");
 selObjArray =  null;
 selObjArray = new Array();
 restore();
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
	if(graphicsObject.type == 1 || graphicsObject.type == 2 ||graphicsObject.type == 3){
		//console.log("-----------stretchSelectedObject------------"+graphicsObject.type + " pt1:;"+object[1]+":;pt2::"+object[2]);
		createObject(graphicsObject.type,object[1],object[2],mouseX,mouseY,null,null);
		
		graphicsObject.pointsArray[0] = object[1];
		graphicsObject.pointsArray[1] = object[2];
		graphicsObject.pointsArray[2] = mouseX;
		graphicsObject.pointsArray[3] = mouseY;
		showSelectedObject(graphicsObject);
	}else if(graphicsObject.type == 5 || graphicsObject.type ==11 ){
		//console.log("Stretch Object---Triangle");
		if(object[1] == 0 && object[2] == 1){
			createObject(graphicsObject.type,mouseX,mouseY,graphicsObject.pointsArray[2],graphicsObject.pointsArray[3],graphicsObject.pointsArray[4],graphicsObject.pointsArray[5]);
			graphicsObject.pointsArray[0] = mouseX;
			graphicsObject.pointsArray[1] = mouseY;
		}else if(object[1] == 2 && object[2] == 3){
			createObject(graphicsObject.type,graphicsObject.pointsArray[0],graphicsObject.pointsArray[1],mouseX,mouseY,graphicsObject.pointsArray[4],graphicsObject.pointsArray[5]);
			graphicsObject.pointsArray[2] = mouseX;
			graphicsObject.pointsArray[3] = mouseY;
		}else if(object[1] == 4 && object[2] == 5){
			createObject(graphicsObject.type,graphicsObject.pointsArray[0],graphicsObject.pointsArray[1],graphicsObject.pointsArray[2],graphicsObject.pointsArray[3],mouseX,mouseY);
			graphicsObject.pointsArray[4] = mouseX;
			graphicsObject.pointsArray[5] = mouseY;
		
		}
			
		showSelectedObject(graphicsObject);
	}else if(graphicsObject.type == 6){
		   //console.log("object[3]:::;"+object[3]);
			if(object[3] != null && object[3] == true){
				
				createObject(graphicsObject.type,mouseX,mouseY,object[1],object[2],null,null);
				graphicsObject.pointsArray[0] = mouseX;
				graphicsObject.pointsArray[1] = mouseY;
				graphicsObject.pointsArray[2] = object[1];
				graphicsObject.pointsArray[3] = object[2];
			}else{
				 createObject(graphicsObject.type,object[1],object[2],mouseX,mouseY,null,null);
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
			createObject(graphicsObject.type,mouseX,mouseY,graphicsObject.pointsArray[2],graphicsObject.pointsArray[3],lastPoint.x3,lastPoint.y3);
			graphicsObject.pointsArray[0] = mouseX;
			graphicsObject.pointsArray[1] = mouseY;
			graphicsObject.pointsArray[4] = lastPoint.x3;
			graphicsObject.pointsArray[5] = lastPoint.y3;
		}else if(object[1] == 2 && object[2] == 3){
			//console.log("2nd call");
			var lastPoint = getEquilateralTriangletThirdPoint(graphicsObject.pointsArray[0],graphicsObject.pointsArray[1],mouseX,mouseY);
			createObject(graphicsObject.type,graphicsObject.pointsArray[0],graphicsObject.pointsArray[1],mouseX,mouseY,lastPoint.x3,lastPoint.y3);
			graphicsObject.pointsArray[2] = mouseX;
			graphicsObject.pointsArray[3] = mouseY;
			graphicsObject.pointsArray[4] = lastPoint.x3;
			graphicsObject.pointsArray[5] = lastPoint.y3;
		}else if(object[1] == 4 && object[2] == 5){
			//console.log("3rd call");
			var lastPoint = getEquilateralTriangletThirdPoint(graphicsObject.pointsArray[2],graphicsObject.pointsArray[3],mouseX,mouseY);
			createObject(graphicsObject.type,lastPoint.x3,lastPoint.y3,graphicsObject.pointsArray[2],graphicsObject.pointsArray[3],mouseX,mouseY);
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
			//createLine(cx,cy,startX,startY);
			//createLine(cx,cy,mouseX,mouseY);
			//ctx.stroke();
			graphicsObject.pointsArray[0] = x1;
			graphicsObject.pointsArray[1] = y1;
			graphicsObject.pointsArray[2] = x2;
			graphicsObject.pointsArray[3] = y2;
			showSelectedObject(graphicsObject);
			startX = mouseX;
			startY = mouseY;			
	}
}
function translateSelectedObject(objectTable,x,y){
	var dx = x -  startX;
	var dy = y -  startY;
	shiftSelectedObject(objectTable,dx,dy)
}

function shiftSelectedObject(objectTable,dx,dy){
	console.log("-----------------shiftSelectedObject:::"+selObjArray);
	  
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
			  console.log("selObjArray[i]::"+selObjArray[i]);
				var graphicsObject = objectTable.get(selObjArray[i]);
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
							//console.log("Rectangle");
							
														
							
							
							
							
							var pointsArr = graphicsObject.pointsArray;
							/*
							var polyArr = new Array();
							var pt1 = new points(pointsArr[0],pointsArr[1]);
							var pt2 = new points(pointsArr[0],pointsArr[3]);
							var pt3 = new points(pointsArr[2],pointsArr[3]);
							var pt4 = new points(pointsArr[2],pointsArr[1]);
							polyArr[0] = pt1;
							polyArr[1] = pt2;
							polyArr[2] = pt3;
							polyArr[3] = pt4;
							
							var pt = new points(startX,startY);
							//console.log("Check points::::"+isPointInPoly(polyArr,pt));
							*/
							
							if(point_in_rectagnle(startX,startY,pointsArr[0],pointsArr[1],pointsArr[2],pointsArr[3])){
								returnObjArr[returnObjArr.length] = objectTable.getKey();
								
								returnOnlySingle = true;
							}
							
							break;
						case 2:
							ctx.beginPath();
							//console.log("oval");
							var pointsArr = graphicsObject.pointsArray;
							if(is_in_ellipse(startX,startY,pointsArr[0],pointsArr[1],pointsArr[2],pointsArr[3])){
								returnObjArr[returnObjArr.length] = objectTable.getKey();
								/*
								if(checkObjInSelList(objectTable.getKey())){
									selObjArray[selObjArray.length] = objectTable.getKey();
								}*/
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



function checkSelectedObjectStrechableState(objectTable,x,y,eventType){

	//console.log("----------------checkSelectedObjectStrechableState-------------"+eventType);
	 for(var i=0;i<selObjArray.length;i++){	
		var graphicsObject = objectTable.get(selObjArray[i]);
		var arr = graphicsObject.pointsArray;
		
		if(graphicsObject.type ==1 || graphicsObject.type == 2 ||graphicsObject.type == 8){
		
			if(is_in_ellipse(x,y,arr[0]-selCircleRedius,arr[1]-selCircleRedius,arr[0]+selCircleRedius,arr[1]+selCircleRedius)){
					//console.log("inside Selection"+canvas.style.cursor);
					strechableObj[0] = graphicsObject
					strechableObj[1] = arr[2];
					strechableObj[2] = arr[3];
					if(eventType == 17){
						canvas.style.cursor  = "pointer";
					}else{
						canvas.style.cursor  = "move";
					}
					
					break;
				}else if(is_in_ellipse(x,y,arr[0]-selCircleRedius,arr[3]-selCircleRedius,arr[0]+selCircleRedius,arr[3]+selCircleRedius)){
					//console.log("inside Selection"+canvas.style.cursor);
					strechableObj[0] = graphicsObject
					strechableObj[1] = arr[2];
					strechableObj[2] = arr[1];
					if(eventType == 17){
						canvas.style.cursor  = "pointer";
					}else{
						canvas.style.cursor  = "move";
					}
					break;
				}else if(is_in_ellipse(x,y,arr[2]-selCircleRedius,arr[1]-selCircleRedius,arr[2]+selCircleRedius,arr[1]+selCircleRedius)){
					//console.log("inside Selection"+canvas.style.cursor);
					strechableObj[0] = graphicsObject
					strechableObj[1] = arr[0];
					strechableObj[2] = arr[3];
					if(eventType == 17){
						canvas.style.cursor  = "pointer";
					}else{
						canvas.style.cursor  = "move";
					}
					break;
				}else if(is_in_ellipse(x,y,arr[2]-selCircleRedius,arr[3]-selCircleRedius,arr[2]+selCircleRedius,arr[3]+selCircleRedius)){
					//console.log("inside Selection"+canvas.style.cursor);
					strechableObj[0] = graphicsObject
					strechableObj[1] = arr[0];
					strechableObj[2] = arr[1];
					if(eventType == 17){
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
				
		}else if(graphicsObject.type ==5 || graphicsObject.type == 11 || graphicsObject.type == 13){
			if(is_in_ellipse(x,y,arr[0]-selCircleRedius,arr[1]-selCircleRedius,arr[0]+selCircleRedius,arr[1]+selCircleRedius)){
					//console.log("inside Selection"+canvas.style.cursor);
					strechableObj[0] = graphicsObject
					strechableObj[1] = 0;
					strechableObj[2] = 1;
					if(eventType == 17){
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
					if(eventType == 17){
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
					if(eventType == 17){
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
					if(eventType == 17){
						canvas.style.cursor  = "pointer";
					}
					
					break;
				}else if(is_in_ellipse(x,y,arr[0]-selCircleRedius,arr[3]-selCircleRedius,arr[0]+selCircleRedius,arr[3]+selCircleRedius)){
					//console.log("inside Selection 2nd"+canvas.style.cursor);
					strechableObj[0] = graphicsObject;
					strechableObj[1] = 0;
					strechableObj[2] = 3;
					if(eventType == 17){
						canvas.style.cursor  = "pointer";
					}
					break;
				}else if(is_in_ellipse(x,y,arr[2]-selCircleRedius,arr[1]-selCircleRedius,arr[2]+selCircleRedius,arr[1]+selCircleRedius)){
					//console.log("inside Selection 3rd"+canvas.style.cursor);
					strechableObj[0] = graphicsObject;
					strechableObj[1] = 2;
					strechableObj[2] = 3;
					if(eventType == 17){
						canvas.style.cursor  = "pointer";
					}
					break;
				}else if(is_in_ellipse(x,y,arr[2]-selCircleRedius,arr[3]-selCircleRedius,arr[2]+selCircleRedius,arr[3]+selCircleRedius)){
					//console.log("inside Selection 4th"+canvas.style.cursor);
					strechableObj[0] = graphicsObject
					strechableObj[1] = 2;
					strechableObj[2] = 3;
					if(eventType == 17){
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
					if(eventType == 17){
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
					if(eventType == 17){
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
					if(eventType == 17){
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
					if(eventType == 17){
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
					if(eventType == 17){
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
					if(eventType == 17){
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
					if(eventType == 17){
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
					if(eventType == 17){
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
	/*if(objectSel.type == 12){
		arr = getCircleBoundedSquare(arr[0],arr[1],arr[2],arr[3]);
	}*/
	if(objectSel.type == 2 || objectSel.type ==1 || objectSel.type == 12 ||objectSel.type == 8 || objectSel.type == 16){
		//console.log("selected----------"+ctx.lineWidth + "::"+ctx.strokeStyle);
		
		ctx.beginPath();
		ctx.strokeStyle = "#000000";
		ctx.lineWidth= 2;
		
		createOval(arr[0]- selCircleRedius,arr[1]-selCircleRedius,arr[0]+selCircleRedius,arr[1]+selCircleRedius);
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
	}else if(objectSel.type == 5 || objectSel.type ==11 ||objectSel.type ==13){
		//console.log("selected----------"+ctx.lineWidth + "::"+ctx.strokeStyle);
		
		ctx.beginPath();
		ctx.strokeStyle = "#000000";
		ctx.lineWidth= 2;
		
		createOval(arr[0]-selCircleRedius,arr[1]-selCircleRedius,arr[0]+selCircleRedius,arr[1]+selCircleRedius);
		ctx.closePath() ;
		ctx.moveTo(arr[2]+selCircleRedius,arr[3]);
		
	//	createRectangle(arr[0]-10,arr[3]-10,arr[0]+10,arr[3]+10);
		
		//createRectangle(arr[2]-10,arr[1]-10,arr[2]+10,arr[1]+10);
		
		createOval(arr[2]-selCircleRedius,arr[3]-selCircleRedius,arr[2]+selCircleRedius,arr[3]+selCircleRedius);
		ctx.closePath() ;
		ctx.moveTo(arr[4]+selCircleRedius,arr[5]);
		
        //createRectangle(arr[4]-10,arr[3]-10,arr[4]+10,arr[3]+10);
		
		createOval(arr[4]-selCircleRedius,arr[5]-selCircleRedius,arr[4]+selCircleRedius,arr[5]+selCircleRedius);
		ctx.closePath() ;
		ctx.moveTo(arr[2],arr[3]);
		
		
		//ctx.closePath() ;
		ctx.stroke() ;
		
	}else if(objectSel.type == 4){
		ctx.beginPath();
		ctx.strokeStyle = "#000000";
		ctx.lineWidth= 2;
		var pt = getMinMax(arr);
		arr = null;
		arr =  new Array();
		arr[0] = pt.minX;
		arr[1] = pt.minY;
		arr[2] = pt.maxX;
		arr[3] = pt.maxY;
		createOval(arr[0]- selCircleRedius,arr[1]-selCircleRedius,arr[0]+selCircleRedius,arr[1]+selCircleRedius);
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
		//alert("done");
	
	}else if(objectSel.type == 3 || objectSel.type == 6){
	ctx.beginPath();
		ctx.strokeStyle = "#000000";
		ctx.lineWidth= 2;
		
		createOval(arr[0]- selCircleRedius,arr[1]-selCircleRedius,arr[0]+selCircleRedius,arr[1]+selCircleRedius);
		ctx.closePath() ;
		ctx.moveTo(arr[2]+selCircleRedius,arr[3]);
		createOval(arr[2]-selCircleRedius,arr[3]-selCircleRedius,arr[2]+selCircleRedius,arr[3]+selCircleRedius);
		ctx.closePath() ;
		ctx.moveTo(arr[0],arr[1]);
		
		// ctx.closePath() ;
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

function rotateSelectedObject(objectTable,mouseX,mouseY){
	if(selObjArray!= null){
		//console.log("rotation started::"+mouseX+","+mouseY);
		
		var objectTable = pageObjTable.get(document.getElementById("pagenum").value);
		//var graphicsObject = objectTable.get(selObjArray[0]);
		//console.log("selObjArray::"+selObjArray[0]);
		//var pointsArray = graphicsObject.pointsArray;
		//console.log("pointsArray[0]::"+pointsArray[0]+","+pointsArray[1]+","+pointsArray[2]+","+pointsArray[3]+","+pointsArray[4]+","+pointsArray[5]);
		var ancPoint = getRotationAnchorPoint(objectTable,selObjArray);
				
		var tx = ancPoint.x;
		var ty = ancPoint.y;
		//console.log("center points::"+tx+","+ty);
	    var dx = mouseX-startX;
		var dy = mouseY-startY;
		
		var angleX1 = tx-mouseX;
		var angleY1 = ty-mouseY;
		
		angleR1=Math.atan2(angleY1, angleX1);
		//console.log("angleR1::"+angleR1);
		
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
					//console.log("Points After Rotation:::"+obj.newX+","+obj.newY);
				
					graphicsObject.pointsArray[j] = obj.newX;
					graphicsObject.pointsArray[j+1] = obj.newY;
				
				}
				ctx.clearRect(0, 0, canvas.width, canvas.height);
				restore();
				drawObject(objectTable,selObjArray[i],false);
			}			
		  //drawObject(objectTable,selObjArray[i],false);
		}
	for(var i=0;i<selObjArray.length;i++){
	var graphicsObject = objectTable.get(selObjArray[i]);
	showSelectedObject(graphicsObject);
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
				}else if (graphicsObject.type ==1 ||graphicsObject.type ==3||graphicsObject.type ==6){
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


function loadImage(src){
	 imageObj= new Image();
	 imageObj.src = src;
	 //createWaitZone();
	 isImageLoaded = checkImageLoaded();
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
		restoreAllExceptImage();
	}
}

function checkImageLoaded(){
	isImageLoaded  = imageObj.complete;
	//console.log("checkImageLoaded:::"+isImageLoaded);
	if(!isImageLoaded){
		  imageloadingTimer = setTimeout("checkImageLoaded()",1000);
	}else{
		clearTimeout(imageloadingTimer);
		//clearWaitZone();		
		//console.log("Image Object------------------------------------"+imageObj.naturalWidth + "::"+imageObj.naturalHeight);
			//console.log("tempArray--111-----------"+tempArray);
			getImageWidthHeight(imageObj,tempArray[2],tempArray[3]);
			tempArray[2] = tempArray[0] + imageObj.width;
			tempArray[3] = tempArray[1] + imageObj.height;
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
		restoreAllExceptImage();
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
//console.log("----------------000000000000000--------------"+width+"::height:;"+height);
	var imageWidth = imageObj.naturalWidth;
	var imageHeight = imageObj.naturalHeight;
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
	document.getElementById("pagenum").value = pagenum;
	ctx.clearRect(0, 0, canvas.width, canvas.height);
	//restore();
	storePageChangeEvent(pagenum);
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

	if(!isPlayingStoped){
			currentMiliSec =Math.floor(myVid.currentTime * 1000);
			//console.log("case 1 CurrentTime:"+currentMiliSec);
			//console.log("case 1 CurrentTime::::"+currentMiliSec+"::::count:::::"+count);
			var pageObject = new PageObject(pagenum,count);
			//objectTimeTable.put(count,currentMiliSec);
			//timeRefTable.put(currentMiliSec,pageObject);
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


function createJSON(){
		var data = '{"MeetingName":"'+ meetingName +'"';
		if(filename != null && filename.length >0 ){
			var recFileName = 'Enotebook/'+meetingName+'/recording/'+meetingName; 
			var data = data + ', "TempRecFile":"'+ filename +'","RecFname":"'+recFileName+'.mp3"';
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
						document.getElementById("pagenum").value = 1;
		  		  		drawNonRecordingObject("1");
						//console.log("---------------filename----------------------------"+filename);
						if(filename.length >0){
							myVid=document.getElementById("audio1");
							myVid.src = "http://"+window.location.host+"/"+filename;
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
		count++;
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
	//console.log("create editor"+textObj);
	var div_elm = document.getElementById("meetingDiv");
	div_elm.style.left = (tempPointsArray[0] ) +'px';
	div_elm.style.top = (tempPointsArray[1] ) +'px';
	div_elm.style.backgroundColor = '#FFFFFF';
	document.getElementById("meetingDiv").style.display = "block";
	//console.log("meetingDiv::"+meetingDiv);
	if(textObj != null){
		document.getElementById("area1").style.fontSize = textObj.fontSize+"px";
		document.getElementById("area1").style.fontFamily =  textObj.fontType;
		document.getElementById("area1").value = textObj.textData;
	}else{
		
		document.getElementById("editorFontType").value = "learning";
		document.getElementById("editorFontSize").value = 50;
		document.getElementById("area1").value = "";
		document.getElementById("area1").style.fontSize = 50+"px";
		document.getElementById("area1").style.fontFamily =  "learning";
	}
	//nicEditors.allTextAreas() ;

}






function selectedFile(ri){
	if (ri == "image"){
		document.getElementById('myInput').accept = "image/*";
	}else if (ri =="pdf"){
		document.getElementById('myInput').accept = ".pdf,"; 
	}else if (ri =="docx"){
		document.getElementById('myInput').accept = ".docx"; 
	}else if (ri == "ppt"){
		document.getElementById('myInput').accept = ".ppt";
	 }else if (ri == "excel"){
		document.getElementById('myInput').accept = ".xlsx,"; 
	 }else if (ri == "video"){
		document.getElementById('myInput').accept = "audio/*,video/*"; 
	 }
	$('#myInput').click();
	
}



function getfile(){
	var selected_file = document.getElementById('myInput').files[0];
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
								loadImage(img.src);
								insertImageObj(document.getElementById("pagenum").value,img.src,true,file.name);
								dropedFileTimeTab.remove(file.name);
								//ctx.drawImage(img,50,50,500,400);
							};
							reader.readAsDataURL(file);
						}
					}
					
			//alert(" file.type::"+ file.type);
			if(file.type.indexOf("video") != -1 || file.type.indexOf("audio") != -1){
				uploadVideo(files);
			}else{
				uploadDropedFiles(files,isImage);
			}
			//console.log("Done");
		}
}



</script>



</body>
</html>








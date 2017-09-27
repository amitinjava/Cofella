<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="en" ng-app="recorder">
    <head>
	
	    <meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<!--	<meta content='width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;' name='viewport' /> -->
	<!--  	<meta name="viewport" content="width=device-width" />
		<meta name="viewport" content="width=device-width, user-scalable=no" />  -->
		
	    <title>Lectures</title>
		
		<!-- Custom CSS -->
	    <link href="<%=request.getContextPath()%>/css/editor-main.css" rel="stylesheet">
	    <script type="text/javascript" src="js/jquery-1.8.2.min.js" ></script>
	
	    <!-- Bootstrap CSS -->
	    <link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet">

	    <!-- Custom fonts for icons -->
	    <link rel="stylesheet" href="<%=request.getContextPath()%>/fa/css/font-awesome.min.css">

		<!-- javascript -->
		<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
		<script src="https://code.jquery.com/ui/1.9.2/jquery-ui.min.js"></script>
		<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="js/hashtable.js" ></script>
			<script src="js/angular.js"></script>
			<script src="js/main.js"></script>
			<script src="js/paper-full.js"></script>
			<script type="text/javascript" src="js/nicEdit.js"></script>
				<script type="text/javascript" >
				function setId(id){
					currentObjId = id;
					init();
				}
				</script>


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
	        width: 640px; height: 480px;
	        background-color:#eee;
	        border: 1px solid #F00;
	        display: block;
	        position:relative;
	        top:60px;
	        left: 15px;
	        right:0;
	        bottom: 0;
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

		#theCanvas{
			margin:0px;
			background-color:#e2dece;
			border:10px solid #fefefe;
			z-index:-10;
			position:absolute;
			left:0;
			top:0;
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
		.stoprecord{
			color:black;
		}

		.popover{
			width:350px;
		}

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

<body ng-controller="RecorderController" >


<div id="slide1"></div>


 <canvas id="canvas" width="640" height="480"></canvas>
<!-- 
	<p>this is your stage for drawing</p>
	<p> current size is 640 x 480 px</p> 
	<div id="tm"></div>
   
     <div id="mycursor"></div>
      -->	
</div>
<div >
	<button class="btn" ng-click="setRecordingEnv()" ng-disabled="recording"><i class="icon-circle" ng-class="recordButtonStyle"></i>&nbsp;Start recording</button>
	<button class="btn" ng-click="stopRecording()" ng-disabled="!recording"><i class="icon-stop"></i>&nbsp;Stop recording</button>
</div>

<button type="button" class="btn btn-default" id="openTools"><li class="fa fa-pencil fa-lg"></li></button>

		<div id="toolMenu" class="well well-sm" style="display:none">
			<div class="btn-group options">
				<button type="button" class="btn btn-default">
					<span class="dropdown table-menu">
		                <a data-toggle="dropdown" href="#"><i class="fa fa-cog fa-lg"></i> <div class="caret"></div></a>
		                <ul class="dropdown-menu" role="menu" aria-labelledby="actions">
		                	<li><a onclick = "saveMeetingOnServer('save')">Save</a></li>
		                	<li><a onclick = "saveMeetingOnServer('exit')">Save and Exit</a></li>
		                	<li class="divider"></li>
		                	<li><a data-toggle="modal" data-target="#dupModal">Duplicate Lecture</a></li>
		                	<li class="divider"></li>
		                	<li><a data-toggle="modal" data-target="#startOver"><span class="text-danger">Start Over</span></a></li>
		            	</ul>
				</button>
		        

				<button type="button" class="btn btn-default">
					<span class="dropdown table-menu">
		                <a data-toggle="dropdown" href="#"><i class="fa fa-wrench fa-lg"></i> <div class="caret"></div></a>
		                <ul class="dropdown-menu" role="menu" aria-labelledby="tools">
		                	<li><a href="#selectOptions" class="switchContent"><i class="fa fa-hand-o-up fa-lg" onClick="replace('holder', 'selectSubOptions')"></i> Select</a></li>
							<li><a href="#zoomOptions" class="switchContent"><i class="fa fa-search fa-lg"></i> Zoom</a></li>
							<li><a href="#drawOptions" onclick = "setId(4)" class="switchContent"><i class="fa fa-pencil fa-lg"></i> Draw</a></li>
							<li><a><i class="fa fa-eraser fa-lg"></i> Erase</a></li>

							<li class="dropdown-submenu">
							    <a tabindex="-1" href="#"><i class="fa fa-square fa-lg"></i> Shape</a>
							    <ul class="dropdown-menu">
							      <li>
							        <a href="#" onclick = "setId(2)" >Arc</a>
							        <a href="#" onclick = "setId(1)" >Square</a>
							        <a href="#" onclick = "setId(2)" >Circle</a>
							        <a href="#" onclick = "setId(5)" >Equalateral Triangle</a>
							        <a href="#" onclick = "setId(5)" >Right Triangle</a>
							        <a href="#" onclick = "setId(5)">Star</a>
							      </li>
							    </ul>
							  </li>

							<li class="dropdown-submenu">
							    <a tabindex="-1" href="#"><i class="fa fa-minus fa-lg"></i> Line</a>
							    <ul class="dropdown-menu">
							      <li>
							        <a href="#" onclick = "setId(3)">Line</a>
							        <a href="#"  onclick = "setId(6)">Arrow</a>
							        <a href="#" onclick = "setId(6)">Bezier</a>
							      </li>
							    </ul>
							  </li>

							<li><a><li onclick = "setId(10)" class="fa fa-font fa-lg" value="text"></li> Text</a></li>
							<li><a><li class="fa fa-file-text-o fa-lg" onclick = "getAllPages('Detail_from_the_discussion.doc')"></li> Notes</a></li>
							<li><a><li class="fa fa-image fa-lg" onclick = "insertImage()"></li> Image</a></li>
		            	</ul>
		            </span>
				</button>
				

				<!-- Start SubOptions dropdown -->
		        <button type="button" class="btn btn-default" id="holder">
		        	<span class="dropdown table-menu">
                        <a data-toggle="dropdown" href="#"><i class="fa fa-sliders fa-lg"></i> <div class="caret"></div></a>
                        <ul class="dropdown-menu" role="menu" aria-labelledby="">
	                        <li><a>Choose a tool first</a></li>
                        </ul>
                    </span>
                </button>

                <button type="buton" class="btn btn-default" style="display:none" id="selectSubOptions">
                    <span class="dropdown table-menu">
                        <a data-toggle="dropdown" href="#"><i class="fa fa-sliders fa-lg"></i> <div class="caret"></div></a>
                        <ul class="dropdown-menu" role="menu" aria-labelledby="tools">
	                        <li><a>Replace Object</a></li>

                            <li class="divider"></li>

                            <li><a>Flip Horizontal</a></li>
                            <li><a>Flip Vertical</a></li>

                            <li class="divider"></li>
                            
                            <li class="dropdown-submenu">
							    <a tabindex="-1" href="#">Move</a>
							    <ul class="dropdown-menu">
							      <li>
							        <a href="#">To Top</a>
							        <a href="#">Up</a>
							        <a href="#">Down</a>
							        <a href="#">To Bottom</a>
							      </li>
							    </ul>
							  </li>

                            <li class="divider"></li>
                            
							<li class="dropdown-submenu">
							    <a tabindex="-1" href="#">Align</a>
							    <ul class="dropdown-menu">
							      <li class="dropdown-submenu">
							        <a href="#">To Stage</a>
							        <ul class="dropdown-menu">
							            <li><a href="#">Left</a></li>
							            <li><a href="#">Center</a></li>
							            <li><a href="#">Right</a></li>
							            <li><a href="#">Top</a></li>
							            <li><a href="#">Middle</a></li>
							            <li><a href="#">Bottom</a></li>
							        </ul>
							      </li>
							      <li class="dropdown-submenu">
							        <a href="#">To Selection</a>
							        <ul class="dropdown-menu">
							            <li><a href="#">Left</a></li>
							            <li><a href="#">Center</a></li>
							            <li><a href="#">Right</a></li>
							            <li><a href="#">Top</a></li>
							            <li><a href="#">Middle</a></li>
							            <li><a href="#">Bottom</a></li>
							        </ul>
							      </li>
							    </ul>
							  </li>

                            <li class="divider"></li>
                            
                            <li><a>Group / Ungroup</a></li>

                            <li class="divider"></li>
                           	
                           	<li><a><span class="text-danger"><i class="fa fa-trash-o"></i> Delete Object</span></a></li>
                        </ul>
                    </span>
                    <!-- End SubOptions dropdown -->

                </button>	
				
		    </div>
			
			<!-- TOOL OPTIONS TARGET AREA -->

				<span id="target">
					<button type="button" class="btn btn-default" data-container="body" data-toggle="popover" data-placement="bottom" data-content="This area will change depending on the tool that is chosen or the context of what is happening in the stage. e.g. If a user is using the select tool, the move up and Move down icons would be displayed as these often must be clicked over and over to position the item correctly in the object stack. If a user has selected an item we could display to trash icon to indicate that they can delete the selected item(s). Shapes, lines, and text will have options like a color picker.">What's this?</button>
				</span>

				<div id="selectOptions" style="display:none">
				    <button type="button" class="btn btn-default"><li class="fa fa-angle-up fa-lg"></li></button>
					<button type="button" class="btn btn-default"><li class="fa fa-angle-down fa-lg"></li></button>
					<button type="button" class="btn btn-disabled" disabled="disabled"><li class="fa fa-trash-o fa-lg"></li></button>

				</div>

				<div id="zoomOptions" style="display:none">
				    <button type="button" class="btn btn-default">Fit</button>
					<button type="button" class="btn btn-default">100%</button>
				</div>

				<div id="drawOptions" style="display:none">
				    <button type="button" class="btn btn-default">
						<span class="dropdown table-menu">
					        <a data-toggle="dropdown" href="#" IMG id="color_image" >Black <div class="caret"></div></a>
					        <ul class="dropdown-menu" role="menu" aria-labelledby="colorOptions">
					        	<li><a IMG id="black" onclick = "setStyleColor(this);">Black</a></li>
					        	<li><a IMG id="dark gray" onclick = "setStyleColor(this);">Dark Gray</a></li>
					        	<li><a IMG id="light gray" onclick = "setStyleColor(this);">Light Gray</a></li>
					        	<li><a IMG id="white" onclick = "setStyleColor(this);">White</a></li>
					        	<li><a IMG id="red" onclick = "setStyleColor(this);">Red</a></li>
					        	<li><a IMG id="orange" onclick = "setStyleColor(this);">Orange</a></li>
					        	<li><a IMG id="yellow" onclick = "setStyleColor(this);">Yellow</a></li>
					        	<li><a IMG id="green" onclick = "setStyleColor(this);">Green</a></li>
					        	<li><a IMG id="blue" onclick = "setStyleColor(this);">Blue</a></li>
					        	<li><a IMG id="violet" onclick = "setStyleColor(this);">Violet</a></li>
					    	</ul>
					</button>
					<button type="button" class="btn btn-default">
						<span class="dropdown table-menu">
					        <a IMG id="big_image" data-toggle="dropdown" href="#">1 pt <div class="caret"></div></a>
					        <ul class="dropdown-menu" role="menu" aria-labelledby="pointSelector">
					        	<li><a IMG id = "1" onclick = "setLineWidth(this);" >1 pt</a></li>
					        	<li><a IMG id = "2" onclick = "setLineWidth(this);" >5 pt</a></li>
					        	<li><a IMG id = "3"onclick = "setLineWidth(this);" >10 pt</a></li>
					        	<li><a IMG id = "4"onclick = "setLineWidth(this);" >etc...</a></li>
					    	</ul>
					</button>
					<button type="button" class="btn btn-default">
						<span class="dropdown table-menu"></span>
					        <a data-toggle="dropdown" href="#">100% <div class="caret"></div></a>
					        <ul class="dropdown-menu" role="menu" aria-labelledby="transparencySlider">
					        	<li><a>Transparency slider here</a></li>
					    	</ul>
					</button>
				</div>

			<!-- BUTTON TO CLOSE TOOLS BAR -->
			<button type="button" id="closeTools" class="btn btn-default"><li class="fa fa-caret-left fa-lg"></li></button>
			
		</div>


<!-- END TOOLS MENU /\/\/\/\/\/\/\/\/ -->
<!-- <s:property value = '%{meetingName}' /> -->
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


<!--/\/\/\/\/\/\/\/\/\/\ END NAV /\/\/\/\/\/\/\/\/ -->

           		

<button type="button" class="btn btn-default" id="openRecord"><li class="fa fa-video-camera fa-lg"></li></button>

		<div id="recordMenu" class="well well-sm" style="display:none">
			<button type="button" class="btn btn-default" id="closeRecord"><li class="fa fa-caret-right fa-lg"></li></button>
			
			<button type="button" class="btn btn-default" id="delRecording" data-title="Delete Recording?"data-toggle="clickover" data-placement="bottom"><li class="fa fa-trash-o fa-lg"></li></button>
           <div class="btn-group options">

		        <button id="recordButton" type="button" class="btn btn-default record" ng-click="checkRecordingButton()"><li class="fa fa-circle fa-lg" ></li></button>
		        <button id="stopButton" style="display:none;" type="button" class="btn btn-default record" ng-click="checkRecordingButton()"><li class="fa fa-circle fa-lg" ></li></button>
		       	<button type="button" class="btn btn-default"><li class="fa fa-play fa-lg" onclick = "playObject()"></li></button>
				<button type="button" class="btn btn-default"><li class="fa fa-backward fa-lg"></li></button>
				<button type="button" class="btn btn-default"><li class="fa fa-forward fa-lg"></li></button>
		    </div>
		     <span>-----&#9711;---------------- 00:00 - 01:34</span>

			<!--
			<input id="ex6" type="text" data-slider-tooltip="hide" data-slider-min="0" data-slider-max="200" data-slider-step="1" data-slider-value="30"/>
  			<span id="ex6CurrentSliderValLabel"><span id="ex6SliderVal">30</span> - 3:12</span>
			-->

			

		</div>

<!--/\/\/\/\/\/\/\/\/\/\ END Recorder /\/\/\/\/\/\/\/\/ -->


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
</body>
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
</div>

 
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
	//var nonRecordingObjArray = new Array();
	var selObjArray = new Array();;
	var freeHandQdArr ;
	

	var startX;
	var startY;
	var triEndX;
	var triEndY;
	
	var count = 0;
	var currentObjId = 0;
	var isDrawing = false;
	var currentMiliSec = 0;
	var rectangleSelObject = null;
	var dragFlag = false;
	var highlightedObj = null;
	var lineWidth = 2;
	var styleColor = "#000000";
	
	var myVid;
	var tempX;
	var tempY;
	var tempAngleRad;
	var meetingName;
	
	var tempArray;
	var imageObj;
	var isImageLoaded = false;

	var timer;
	var playCount;

	var startTime = 0;

	var recFileDuration = 0;
	
	var pencilPath;
	var meetingName = "<s:property value = '%{meetingName}' />";

if(meetingName != null || meetingName!= ''){
	//alert("meetingName"+meetingName);
	openMeeting(meetingName);
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

		var screenW = screen.width;
		var screenH = screen.height;
		var isMobDevice = detectmob();
		 
		//screenW = screenW -10;
		console.log("Start-----------------screenW::"+screenW+"::screenH::"+screenH);
		if(isMobDevice){
		//	document.getElementById("disableDiv").style.width = (screenW + 165) + "px";
		}else{
		//	document.getElementById("disableDiv").style.width = (screenW -10) + "px";
		}
	
		
		console.log("screenW::"+screenW+"::screenH::"+screenH);
		canvas = document.getElementById("canvas");
		if(isMobDevice){
			canvas.width = (screenW + 180);
			canvas.height = (screenH - 1);
		}else{
		//	canvas.width = (screenW - 10);
		//	canvas.height = (screenH -240);
		}
		
		
		ctx = canvas.getContext("2d");
		paper.setup(canvas);
		
		ctx.lineWidth = lineWidth;
		ctx.styleColor = styleColor;

		canvasOffset = $("#canvas").offset();
		offsetX = canvasOffset.left;
		offsetY = canvasOffset.top;
		
		

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
			dragFlag = false;;
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
		//	console.log("Drag Leave---------------------");
			evt.preventDefault();
			clearDropZone();
		}, false);

		//Handle dropped image file - only Firefox and Google Chrome
		canvas.addEventListener("drop", function (evt) {
		  //console.log("drop--------------- "+evt.dataTransfer.files.length);
		  evt.preventDefault();
		  var files = evt.dataTransfer.files;
		  //alert("hiii"+files);
		  //
			if(files.length == 0){
				clearDropZone();
			}else if (files.length > 0) {
				uploadDropedFiles(files);
				for(var i=0;i<files.length;i++){
					var file = files[i];
					
					if (typeof FileReader !== "undefined" && file.type.indexOf("image") != -1) {
						var reader = new FileReader();
						// Note: addEventListener doesn't work in Google Chrome for this event
							reader.onload = function (evt) {
							var img =  new Image();
							img.src = evt.target.result;
							console.log("Src:::::"+img.src);
							tempArray = insertImageObj(document.getElementById("pagenum").value,img.src);
							clearDropZone();
							loadImage(img.src);
							//ctx.drawImage(img,50,50,500,400);
						};
						reader.readAsDataURL(file);
					}
				}
			}
			evt.preventDefault();
			}, false);
		
		
		$(document).keydown(function(evt){
			evt = evt || window.event;
			var charCode = evt.keyCode || evt.which;
			var charStr = String.fromCharCode(charCode);
			if(charCode == 46){
				deleteSelectedObject();
			}
		 })
		$("#canvas").on('mousedown', function (e) {
			dragFlag = true;
			handleMouseDown(e);
		}).on('mouseup', function(e) {
			dragFlag = false;;
			handleMouseUp(e);
		}).on('mousemove', function(e) {
			/*
			if(dragFlag){
			 console.log("MouseDrag-------------------------------------");
			}else{
			 console.log("Mousemove#####################################");
			}*/
			handleMouseMove(e);
		}).on('mouseout', function(e) {
			//$('#mycursor').hide();
			
		}).on('mouseenter', function(e) {
			//$('#mycursor').show();
		}).on('click', function(e) {
			//alert("mouse click");
			/*
			if(dragFlag){
			 console.log("MouseDrag-------------------------------------");
			}else{
			 console.log("Mousemove#####################################");
			}*/
			handleMouseClick(e);
		});
	});


function getAllPages(fileName){
	return;
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
		  		  			var pageNum = currentpage + (i+1);
		  		  			var url = imageUrl + "&a=bi&pagenumber="+(i+1);
		  		  			/*
							if(i==0)
		  		  			 	tempArray = insertImageObj(pageNum,url);
		  		  			else*/
		  		  				insertImageObj(pageNum,url);
		  		  		}
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

function uploadDropedFiles(files){
	console.log("upload called--------------------");
	 var formData =new FormData();
	 for(var i=0;i<files.length;i++){
		 formData.append("attachment",files[i]); 
	 }
	 
	  jQuery.ajax({
		  	type:	"POST",
	  		url: 	"uploadTemp.action",
	  		data: 	formData,
	  		cache: false,
	  		dataType: "json",
	  		processData:false,
	  		contentType :false,
		  		success:function(msg) {
		  			//alert(msg);
		  			
		  			if(msg.actionErrors != null)
		  			{
		  				alert("error");
		  		  	}else{
		  		  		alert("Done");
		  		  	}
		  			
		  		}});
	 
}

function createDropZone(){
	ctx.save();
	ctx.beginPath();
	ctx.strokeStyle = "#000000";
	ctx.lineWidth= 3;
	ctx.setLineDash([7]);
	createRectangle(10, 10, 600 , 600 )
	ctx.font="50px Georgia";
	ctx.fillText("Drop Files Here...",100,100);
	ctx.globalAlpha= 0.8;
	ctx.fillStyle= "#F0F5FA";
	ctx.fillRect(10, 10, 600 , 600);
	//createRectangle(10, 10, 1270 , 600 );
	ctx.closePath();
	ctx.stroke();
	ctx.restore();
}
function clearDropZone(){
	ctx.clearRect(0, 0, canvas.width, canvas.height);
	restore();
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
	
	
//console.log("mouse up::::::::Start2222222222::::::::::::::::::::::::::::"+highlightedObj);
	if(isDrawing){
		var mouseX = parseInt(e.clientX - offsetX);
		var mouseY = parseInt(e.clientY - offsetY);	 
		
		var tempPointsArray = new Array();
		if(currentObjId == 4){
			 tempPointsArray = freeHandQdArr;
			 freeHandQdArr = null;
		}else if(currentObjId == 5){
			 if(triEndX == null && triEndY == null){
				  triEndX = mouseX;
				  triEndY = mouseY;
				  return;
			 }else{
				tempPointsArray[tempPointsArray.length] = startX;
				tempPointsArray[tempPointsArray.length] = startY;
				tempPointsArray[tempPointsArray.length] = triEndX;
				tempPointsArray[tempPointsArray.length] = triEndY;
				tempPointsArray[tempPointsArray.length] = mouseX;
				tempPointsArray[tempPointsArray.length] = mouseY;
				triEndX = null; 
				triEndY = null;
			 }
		}else{ 
			tempPointsArray[tempPointsArray.length] = startX;
			tempPointsArray[tempPointsArray.length] = startY;
			tempPointsArray[tempPointsArray.length] = mouseX;
			tempPointsArray[tempPointsArray.length] = mouseY;
		}
		
		var objectTable = pageObjTable.get(document.getElementById("pagenum").value);
		 //console.log("Size::::"+objectTable.size());
		if(currentObjId != 7 ){
			if(currentObjId == 10){
				createEditor(tempPointsArray);
			}
			count++;
			var graphicsObject = new GraphicsObject(count,currentObjId,tempPointsArray,lineWidth,styleColor,null);
			
			if(objectTable == null){
				objectTable = new Hashtable();
				pageObjTable.put(document.getElementById("pagenum").value,objectTable);
			}
			objectTable.put(count, graphicsObject);
			console.log("mouse up::::::::::::::::::::::::::::::::::::"+objectTable);
		}else{
			//console.log("mouse up::::::::::::::::::::::::::::::::::::");
			isDrawing = false;
			canvas.style.cursor = "default";
			rectangleSelObject = new GraphicsObject(-1,currentObjId,tempPointsArray,lineWidth,styleColor,null);
			if(objectTable != null){
				checkObject(objectTable,startX,startY,mouseX,mouseY);
			}
			startX = null;
			startY = null;

		}
		console.log("recFileDuration::::"+recFileDuration);
		if(startTime != 0){
			var currentTime = new Date().getTime();
			currentMiliSec = recFileDuration + Math.ceil(currentTime - startTime);
			//console.log("currentMiliSec::::"+currentMiliSec+"::::count:::::"+count);
			var pageObject = new PageObject(document.getElementById("pagenum").value,count);
			objectTimeTable.put(count,currentMiliSec);
			timeRefTable.put(currentMiliSec,pageObject);
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
		if(currentObjId == 7 && selObjArray != null){
			selObjArray =  null;
			selObjArray = new Array();
			rectangleSelObject = null
			ctx.clearRect(0, 0, canvas.width, canvas.height);
			restore();
			startX = null;
			startY = null;
		}
		if(currentObjId == 7 && rectangleSelObject!= null){
			startX = null;
			startY = null;
		}

	}
	isDrawing = false;
	canvas.style.cursor = "default";	
}

function handleMouseMove(e) {
	if(currentObjId == 0 || currentObjId == 7 || currentObjId == 9){
		return;
	}
   
	if (isDrawing) {
		//console.log("Mouse move-------------------"+e.clientX+"::Y::"+e.clientY);
			//console.log("offsetX-------------------"+offsetX);
		var mouseX = parseInt(e.clientX - offsetX);
		var mouseY = parseInt(e.clientY - offsetY);		
		 
		/*
		ctx.clearRect(0, 0, canvas.width, canvas.height);
		ctx.beginPath();
		ctx.rect(startX, startY, mouseX - startX, mouseY - startY);
		ctx.stroke();
		*/
		createObject(currentObjId,startX,startY,mouseX,mouseY,triEndX,triEndY);
		if(currentObjId == 4){
			// pencilPath.add(new paper.Point(mouseX,mouseY));
			startX = mouseX;
			startY = mouseY;
			if(freeHandQdArr == null){
				freeHandQdArr = new Array();
			}
			freeHandQdArr[freeHandQdArr.length] = startX;
			freeHandQdArr[freeHandQdArr.length] = startY;
		}
	}else{
		//console.log("selObjArray--------------------------------------------------"+selObjArray);
		if(selObjArray != null && selObjArray.length>0 && dragFlag){
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
		
		}
	}
}

function handleMouseDown(e) {
	if(currentObjId == 4){
		/* pencilPath = new paper.Path({
			
			strokeColor: 'red',
			// Select the path, so we can see its segment points:
			fullySelected: false
		}); */
		startX = parseInt(e.clientX - offsetX);
		startY = parseInt(e.clientY - offsetY);
	   //pencilPath.add(new paper.Point(startX,startY));
	} 
	//console.log("isDrawing--------------------------"+isDrawing);
	if(currentObjId == 0 || currentObjId == 7 || currentObjId == 9){
		//alert("Please select Object First");
		return;
	}if(currentObjId == 8){
		startX = parseInt(e.clientX - offsetX);
		startY = parseInt(e.clientY - offsetY);
		var objectTable = pageObjTable.get(document.getElementById("pagenum").value);
		highlightObject(objectTable);
		return;
	}/*if(!isDrawing && currentObjId == 7){
		startX = parseInt(e.clientX - offsetX);
		startY = parseInt(e.clientY - offsetY);
		var objectTable = pageObjTable.get(document.getElementById("pagenum").value);
		checkPointsInObject(objectTable);
		return;
	}*/if(!isDrawing && rectangleSelObject == null){
		//console.log("NNNNNNNNNNNNNNNNNNNNNNNNNNNNN");
		startX = parseInt(e.clientX - offsetX);
		startY = parseInt(e.clientY - offsetY);
		if(currentObjId == 7){
			var objectTable = pageObjTable.get(document.getElementById("pagenum").value);
			checkPointsInObject(objectTable);
		}
		if(selObjArray == null || selObjArray.length == 0){
			canvas.style.cursor = "crosshair";		
			isDrawing = true
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
			selObjArray =  null;
			selObjArray = new Array();
			ctx.clearRect(0, 0, canvas.width, canvas.height);
			restore();
		}
	}
	/*
	if(currentObjId == 7){
		ctx.setLineDash([5]);
	}else{
		ctx.setLineDash([0]);
	}
	*/
}

function createObject(id,startx,starty,mouseX,mouseY,endX,endY){
	//console.log("createObject-------------------"+id+":::startx::"+startx+":starty::"+starty+"::mouseX:"+mouseX+"::mouseY:::"+mouseY);
	if(id == 2 || id == 3 || id ==4 || id ==9){
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
			
			restore();
			ctx.beginPath();
			ctx.strokeStyle = styleColor;
			ctx.lineWidth= lineWidth;
			createRectangle(startx, starty, mouseX , mouseY );
			ctx.closePath();
			ctx.stroke();
			break;
		case 2:
			ctx.clearRect(0, 0, canvas.width, canvas.height);
			restore();
			ctx.beginPath();
			ctx.strokeStyle = styleColor;
			ctx.lineWidth= lineWidth;
			createOval(startx, starty, mouseX , mouseY);
			/*
			var startAngleinDegrees = 0 ;
			var endAngleinDegrees = 360 ;
			  
			var startAngleinRadians = (Math.PI/180) * startAngleinDegrees ;
			var endAngleinRadians = (Math.PI/180) * endAngleinDegrees ;
			  
			ctx.beginPath() ;
			console.log("MousePos::x:"+startX+":y:"+startY+":w:"+ (mouseX - startX)+":h:"+(mouseY - startY));
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
			console.log("MousePos::x:"+startX+":y:"+startY+":w:"+ w+":h:"+h);
			ctx.ellipse(centerX , centerY,w,h, 0, startAngleinRadians, endAngleinRadians, false) ;
			ctx.lineWidth = 3;
			*/

			ctx.closePath() ;
			ctx.stroke() ;
			break;
		case 3:
			ctx.clearRect(0, 0, canvas.width, canvas.height);
			restore();
			ctx.beginPath();
			ctx.strokeStyle = styleColor;
			ctx.lineWidth= lineWidth;
			createLine(startx, starty, mouseX , mouseY );
			//points_is_onLine(startx, starty, mouseX , mouseY );
			ctx.closePath();
			ctx.stroke();
			break;
		case 4:
			//ctx.clearRect(0, 0, canvas.width, canvas.height);
		/* 	pencilPath.strokeWidth = 2;
			pencilPath.smooth(); */
			
			 ctx.beginPath();
			ctx.strokeStyle = styleColor;
			ctx.lineWidth= lineWidth;
			//restore();
			//console.log("actual Points::"+startx+","+starty+","+mouseX+","+mouseY);
			//ctx.globalAlpha= 0.8;
			
			createLine(startx, starty, mouseX , mouseY );
			ctx.closePath();
			ctx.stroke(); 
			break;
		case 5:
			ctx.clearRect(0, 0, canvas.width, canvas.height);
			restore();
			ctx.beginPath();
			ctx.strokeStyle = styleColor;
			ctx.lineWidth= lineWidth;
			if(endX != null && endY != null){
					createTriangle(startx,starty,mouseX,mouseY,endX,endY);
			}else{
				createLine(startx, starty, mouseX , mouseY );
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
			createArrow(startx, starty, mouseX , mouseY );
			ctx.closePath();
			ctx.stroke();
			break;
		case 7:
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
			ctx.globalAlpha = 0.3;
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
		}
}

function restore(){
	//console.log("restore"+objectTable.size());
	var objectTable = pageObjTable.get(document.getElementById("pagenum").value);
   
	if(objectTable != null){
		objectTable.moveFirst();
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
/*
	for(var ctr = 1;ctr<=objectTable.size();ctr++){
		//console.log("restore for loop");
			drawObject(ctr);
	}
	*/
}

function drawObject(objectTable,id,highlight){
//	console.log("drawObject:;"+ctx);
	/*
	if(myVid != null){
		myVid.currentTime = 2.564;
		console.log("currentime:::;"+myVid.currentTime);
		console.log("Start: " + myVid.seekable.start(0)+ " End: " + myVid.seekable.end(0));
	}
	*/
	var graphicsObject = objectTable.get(id);
	ctx.beginPath();
	if(highlight == 'sel'){
		ctx.lineWidth= 2;
		ctx.setLineDash([3]);
	}else if(highlight){
		ctx.strokeStyle='#FF0000';
		ctx.lineWidth=5;
		ctx.setLineDash([0]);
	}else{
	    //console.log("drawObject:;"+graphicsObject.color+"::line width:::"+graphicsObject.lineWidth);
		ctx.strokeStyle = graphicsObject.color;
		ctx.lineWidth = graphicsObject.lineWidth;
		ctx.setLineDash([0]);
	}
	if(graphicsObject.type == 2 || graphicsObject.type == 3 || graphicsObject.type ==4 || graphicsObject.type ==9){
		ctx.lineCap = 'round';
		ctx.lineJoin = 'round';
	}else{
		ctx.lineCap = 'butt';
		ctx.lineJoin = 'meter';
	}
	ctx.globalAlpha = 1.0;
	//console.log("Object Type::;;:"+graphicsObject.type);
	switch(graphicsObject.type){
				case 1:
					var pointsArr = graphicsObject.pointsArray;
					createRectangle(pointsArr[0], pointsArr[1], pointsArr[2], pointsArr[3]);
					//ctx.closePath() ;
					//ctx.stroke();
					break;
				case 2:
					//ctx.beginPath();
					var pointsArr = graphicsObject.pointsArray;
					createOval(pointsArr[0], pointsArr[1], pointsArr[2], pointsArr[3]);
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
					var points = graphicsObject.pointsArray;
					drawPoints(points);
					//drawCurve(ctx, points);
					//drawCurve(ctx,points, 1, false, 10, false);
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
					//console.log("Triangle:::"+pointsArr);
					createTriangle(pointsArr[0], pointsArr[1], pointsArr[2], pointsArr[3], pointsArr[4], pointsArr[5]);
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
					tempArray = graphicsObject.pointsArray;
					isImageLoaded = false;
					imageObj = null;
					canvas.style.cursor  = "wait";
					loadImage(graphicsObject.src);
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
				}
	//console.log("Draw Object:::close path::::");
	if(graphicsObject.type!=4)
		ctx.closePath() ;
	    ctx.stroke() ;
}


function drawCurve(ctx, ptsa, tension, isClosed, numOfSegments, showPoints) {

    showPoints  = showPoints ? showPoints : false;

    ctx.beginPath();

    drawLines(ctx, getCurvePoints(ptsa, tension, isClosed, numOfSegments));

    if (showPoints) {
        ctx.stroke();
        ctx.beginPath();
        for(var i=0;i<pts.length-1;i+=2) 
                ctx.rect(pts[i] - 2, pts[i+1] - 2, 4, 4);
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

function GraphicsObject(id,type,pointsArray,lnWidth,lnColor,src){
	this.id = id;
	this.type = type;
	this.pointsArray = pointsArray;
	this.lineWidth = lnWidth;
	this.color = lnColor;
	this.src = src;
}
function PageObject(num,objectId){
	this.num = num;
	this.objectId = objectId;
}

function setId(id){
	currentObjId = id;
	init();
}
function clock(){
	startTime = new Date().getTime()
		console.log("startTime:::"+startTime);
	//timer = setTimeout('clock()',10);
	//currentMiliSec = currentMiliSec + 10;
}
function init(){
	 startX =  null;
	 startY =  null;
	 triEndX =  null;
	 triEndY =  null;
	 dragFlag = false;
//console.log("Inside init:::"+currentObjId);
	 if(rectangleSelObject != null){
			rectangleSelObject = null;
			selObjArray =  null;
			selObjArray = new Array();
			ctx.clearRect(0, 0, canvas.width, canvas.height);
			restore();
	}
	if(currentObjId == 9){
		lineWidth = 15
	}else{
	/*	 var str = document.getElementById("big_image").src;
			str = str.substring(str.lastIndexOf('/')+1,str.indexOf('_'));
			console.log("line width::::::::::::::::::"+str);  */
			lineWidth = 2;
	}
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

function createRectangle(x1,y1,x2,y2){
	ctx.rect(x1, y1,x2-x1,y2-y1);
	console.log("Rectangle Created");
}

function createLine(x1,y1,x2,y2){
	ctx.moveTo(x1, y1);
    ctx.lineTo(x2, y2);
	
}

function createTriangle(x1,y1,x2,y2,x3,y3){
	createLine(x1,y1,x2,y2);
	createLine(x1,y1,x3,y3);
	createLine(x2,y2,x3,y3);
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
	ctx.fill();;
   	if(tempX != null){
		ctx.translate(-x,-y);
		angleDeg = tempAngleRad * 180 / Math.PI;
		angleDeg = (360 - angleDeg);
		angleRad = angleDeg * Math.PI/180;
		ctx.rotate(angleRad);
	}
	ctx.restore();
}

 function playObject(){
	// return;
 //alert(timeRefTable);
	
/*
	ctx.clearRect(0, 0, canvas.width, canvas.height);
	for(ctr = 0;ctr<nonRecordingObjArray.length;ctr++){
		drawObject(nonRecordingObjArray[ctr],false);
	}
*/
	//alert("hiiii");
	ctx.clearRect(0, 0, canvas.width, canvas.height);
	document.getElementById("pagenum").value = 1;
	drawNonRecordingObject("1");
	timeRefTable.moveFirst();
    console.log("timeRefTable:::::"+timeRefTable);
	playCount = 0;
	if(timeRefTable.next()){
		//alert(timeRefTable.getKey());
		//alert(timeRefTable.getValue());
		console.log("Object1:::"+timeRefTable.getKey()+":Time::::"+timeRefTable.getValue().num);
		var pageObj = timeRefTable.getValue();
		
		setTimeout('checkPageAndDrawObj('+timeRefTable.getKey()+')',timeRefTable.getKey());
	}
	myVid=document.getElementById("audio1");
	console.log("filename:::"+filename);
	myVid.src = "http://"+window.location.host+"/"+filename;
	/*
	myVid.addEventListener("loadedmetadata", function(_event) {
	alert("metadata loaded:");
    var duration = myVid.duration;
	console.log("duration:"+duration);
    //TODO whatever
	});
	*/
	//myVid.src = "http://www.topchalks.com/tc/kina_9.mp3";
	//console.log("Play file name:::"+filename+".mp3");
	//alert("host:::"+window.location.host);
	
	console.log("Play file name:::"+myVid.src);
	myVid.controls = true;
	myVid.play();
	//setTimeout('drawObject(ctr)',timeRefTable.get(ctr));
	//drawObject(ctr);
}


function checkPageAndDrawObj(key){
	playCount++;
	console.log("pageObj:::"+key);
	var pageObj = timeRefTable.get(key);
	var objectTable = pageObjTable.get(pageObj.num);
	if(pageObj.num == document.getElementById("pagenum")){
		drawObject(objectTable,pageObj.objectId,false);
	}else{
		document.getElementById("pagenum").value = pageObj.num;
		ctx.clearRect(0, 0, canvas.width, canvas.height);
		drawNonRecordingObject(pageObj.num);
		restoreRecordedObj(key);
		drawObject(objectTable,pageObj.objectId,false);
	}
	var keys=  timeRefTable.keys;
	var timeDuration = keys[playCount] - keys[playCount-1]
	if(playCount < keys.length){
		var keyy = keys[playCount];	
		console.log("timeDuration::::"+keyy);
		setTimeout('checkPageAndDrawObj('+keyy+')',timeDuration);
	}
}

function restoreRecordedObj(timestamp){
	timeRefTable.moveFirst();
    console.log("timeRefTable:::::"+timeRefTable);
	var currentPage = document.getElementById("pagenum").value;
	var objectTable = pageObjTable.get(currentPage);
	while(timeRefTable.next()){
		if(timeRefTable.getKey()<timestamp){
			var pageObj = timeRefTable.getValue()
			if(pageObj.num == currentPage){
				drawObject(objectTable,pageObj.objectId,false);
			}else{
				continue;
			}
		}else{
			break;
		}
	}
}

function drawNonRecordingObject(pageNum){
	
	var nonRecordingObjArray = nonRecordinPageObjTable.get(pageNum);
	
	if(nonRecordingObjArray != null){
		console.log("------------Draw Non Recording Objects---------------------"+nonRecordingObjArray.length);
		ctx.clearRect(0, 0, canvas.width, canvas.height);
		var objectTable = pageObjTable.get(pageNum);
		for(ctr = 0;ctr<nonRecordingObjArray.length;ctr++){
			drawObject(objectTable,nonRecordingObjArray[ctr],false);
		}
	}
}

function checkObject(objectTable,startX,startY,mouseX,mouseY){
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
				}
	}
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

function deleteSelectedObject(objectTable){
//alert("deleteSelectedObject");
 for(var ctr = 0;ctr<selObjArray.length;ctr++){
	var key = selObjArray[ctr];
	objectTable.remove(key);
 }
 ctx.clearRect(0, 0, canvas.width, canvas.height);
 rectangleSelObject = null;
 selObjArray =  null;
 selObjArray = new Array();
 restore();
}


function translateSelectedObject(objectTable,x,y){
  var dx = x -  startX;
  var dy = y -  startY;
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
			var pointsArr = graphicsObject.pointsArray;
				for(var j=0;j<pointsArr.length;j++){
					if(j%2 != 0){
						pointsArr[j] = pointsArr[j] + dy;
					}else{
						pointsArr[j] = pointsArr[j] + dx;
					}
				}
				graphicsObject.pointsArray = pointsArr;
				drawObject(objectTable,selObjArray[i],'sel');
		  }
		}
}



function checkPointsInObject(objectTable){
	if(objectTable != null){
		objectTable.moveFirst();
		//console.log("ObjectTable:::"+objectTable);
		while(objectTable.next()){
		  var graphicsObject = objectTable.get(objectTable.getKey());
		   switch(graphicsObject.type){
					case 1:
						var pointsArr = graphicsObject.pointsArray;
						if(point_in_rectagnle(startX,startY,pointsArr[0],pointsArr[1],pointsArr[2],pointsArr[3])){
							selObjArray[selObjArray.length] = objectTable.getKey();
						}

						break;
					case 2:
						ctx.beginPath();
						var pointsArr = graphicsObject.pointsArray;
						if(is_in_ellipse(startX,startY,pointsArr[0],pointsArr[1],pointsArr[2],pointsArr[3])){
							selObjArray[selObjArray.length] = objectTable.getKey();
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
							selObjArray[selObjArray.length] = objectTable.getKey();
						}
						break;
					case 6:
						var pointsArr = graphicsObject.pointsArray;
						break;
					}
			}
	}
	
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
				}
	}
	if(highlightedObj != null){ 
		ctx.clearRect(0, 0, canvas.width, canvas.height);
		restore();
		drawObject(objectTable,highlightedObj.id,true);
	}
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
  console.log("Triagle area:::"+area);
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
 document.getElementById("big_image").toString("1");
 document.getElementById("big_image").toString("2"); 
 document.getElementById("big_image").toString("3");
 document.getElementById("big_image").toString("4");
 lineWidth = obj.id;
}

function setStyleColor(obj){
 document.getElementById("color_image").toString("black");
 document.getElementById("color_image").toString("light gray");
 document.getElementById("color_image").toString("dark gray");
 document.getElementById("color_image").toString("Red");
 document.getElementById("color_image").toString("orange");
 document.getElementById("color_image").toString("yellow");
 document.getElementById("color_image").toString("Red");
 document.getElementById("color_image").toString("white");
 document.getElementById("color_image").toString("green");
 styleColor= obj.id;
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
function insertImage(){
	return;
	var pageNum = document.getElementById("pagenum").value
	var src = "https://docs.google.com/viewer?url=http%3A%2F%2Fwww.topchalks.com%2Ftc%2Fppt.ppt&a=bi&pagenumber=52";
	tempArray = insertImageObj(pageNum,src);
	loadImage(src);
	
}

function insertImageObj(pageNum,src){
	console.log("insertImageObj::::"+startTime);
	var tempPointsArray = new Array();
	tempPointsArray[tempPointsArray.length] = 200;
	tempPointsArray[tempPointsArray.length] = 10;
	//tempPointsArray[tempPointsArray.length] = 600;
	//tempPointsArray[tempPointsArray.length] = 500;
	
	var objectTable = pageObjTable.get(pageNum);
	count++;
	var graphicsObject = new GraphicsObject(count,8,tempPointsArray,null,null,src);
	
	if(objectTable == null){
		objectTable = new Hashtable();
		pageObjTable.put(pageNum,objectTable);
	}
	objectTable.put(count, graphicsObject);
	
	if(false){
			var currentTime = new Date().getTime();
			currentMiliSec = recFileDuration + Math.ceil(currentTime - startTime);
			console.log("currentMiliSec::::"+currentMiliSec+"::::count:::::"+count);
			var pageObject = new PageObject(pageNum,count);
			objectTimeTable.put(count,currentMiliSec);
			timeRefTable.put(currentMiliSec,pageObject);
			console.log("timeRefTable::::"+timeRefTable+"pageObject"+pageObject.num+"::"+pageObject.objectId);
		}else{
			var nonRecordingObjArray = nonRecordinPageObjTable.get(pageNum);
			if(nonRecordingObjArray == null){
				nonRecordingObjArray = new Array();
				nonRecordinPageObjTable.put(pageNum,nonRecordingObjArray);
			}
			nonRecordingObjArray[nonRecordingObjArray.length] = count;
		}
	return tempPointsArray;
}


function loadImage(src){
	 imageObj= new Image();
	 imageObj.src = src;
	 isImageLoaded = checkImageLoaded();
}
function drawImage(x1,y1,x2,y2){
	console.log("--------------------draw   Image-------------------");
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
function checkImageLoaded(){
	isImageLoaded  = imageObj.complete;
	console.log("checkImageLoaded:::"+isImageLoaded);
	if(!isImageLoaded){
		  setTimeout("checkImageLoaded()",1000);
	}else{
		console.log("checkImageLoaded:::"+imageObj.width+"::"+imageObj.height);
		/*
		tempArray[tempArray.length] = tempArray[0]+ imageObj.width;
		tempArray[tempArray.length] = tempArray[1] + imageObj.height
		*/
		tempArray[tempArray.length] = tempArray[0] + 700;
		tempArray[tempArray.length] = tempArray[1] + 600;

		//var pageNum = document.getElementById("pagenum").value
		//var src = "https://docs.google.com/viewer?url=http%3A%2F%2Fwww.topchalks.com%2Ftc%2Fppt.ppt&a=bi&pagenumber="+pageNum;
		drawImage(tempArray[0],tempArray[1],tempArray[2],tempArray[3]);
		canvas.style.cursor  = "default";
		
	}
}
function showPageObject(){
	ctx.clearRect(0, 0, canvas.width, canvas.height);
	restore();
}
function setPageNum(val){
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
	if(startTime != 0){
		restoreRecordedObj(currentMiliSec);
	}


}

function storePageChangeEvent(pagenum){
	count++;
	var objectTable = pageObjTable.get(pagenum);
	var graphicsObject = new GraphicsObject(count,10,null,null,null,null);
	if(objectTable == null){
		objectTable = new Hashtable();
		pageObjTable.put(pagenum,objectTable);
	}
	objectTable.put(count, graphicsObject);

	if(startTime != 0){
			var currentTime = new Date().getTime();
			currentMiliSec = recFileDuration + Math.ceil(currentTime - startTime);
			console.log("currentMiliSec::::"+currentMiliSec+"::::count:::::"+count);
			var pageObject = new PageObject(pagenum,count);
			objectTimeTable.put(count,currentMiliSec);
			timeRefTable.put(currentMiliSec,pageObject);
			console.log("timeRefTable::::"+timeRefTable+"pageObject"+pageObject.num+"::"+pageObject.objectId+"objectTimeTable::"+objectTimeTable);
		}
}

function saveMeetingOnServer(eventType){
	var jsonData = createJSON();
	console.log("jsonData:::"+jsonData);
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
		  				alert("error45");
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
						 console.log("PonitsArray:::"+pointsArray);
						 for(var i=0;i<pointsArray.length;i++){
								points = points + pointsArray[i] + ',';
								console.log("points:::"+points);
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
					 var timeStamp = objectTimeTable.get(graphicsObject.id);
					 console.log(objectTimeTable);
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
		

	console.log(str+str1);
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
	console.log(obj.id);
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
	console.log(obj.id);
	obj.style.backgroundColor  = "#CCCCCA";
	lstSel = obj;
	
}

function setOpenButton(){
	console.log("-----change--------------------");
	var name = document.getElementById("selFile").value;
	if(name.length == 0){
		document.getElementById("openButton").disabled = true;
	}else{
		document.getElementById("openButton").disabled = false;
	}
	
}
function checkEvent(eType){
	console.log("eType::::"+eType);
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
	// var meetingName = "tinu";
	 jQuery.ajax({
		  	type:	"get",
	  		url: 	"getmeetingjson.action",
	  		data: 	"meetingName="+meetingName+"&status="+true,
		  		success:function(msg) {
		  			//alert(msg);
		  			
		  			if(msg.actionErrors != null)
		  			{
		  				alert("error123");
		  		  	}else{
		  		  		console.log("showchild"+msg.jsonContent);
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
						console.log("---------------filename----------------------------"+filename);
						if(filename.length >0){
							myVid=document.getElementById("audio1");
							myVid.src = "http://"+window.location.host+"/"+filename;
							myVid.addEventListener("loadedmetadata", function(_event) {
									var duration = myVid.duration;
									recFileDuration = duration * 1000;
									console.log("duration:"+recFileDuration);
							
							});
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
		var gObj = new GraphicsObject(obj.id,obj.type,obj.pointsList,obj.linenWidth,obj.lineColor,obj.src);
		count++;
		objectTable.put(obj.id, gObj);
		console.log("obj.timeStamp::::"+obj.timeStamp);
		if(obj.timeStamp != null){
			var pageObject = new PageObject(pageNum,obj.id);
			objectTimeTable.put(obj.id,obj.timeStamp);
			timeRefTable.put(obj.timeStamp,pageObject);
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
function createEditor(tempPointsArray){
	console.log("create editor"+tempPointsArray[0]);
	document.getElementById("meetingDiv").style.display = "block";
	var div_elm = document.getElementById("meetingDiv");
	div_elm.style.left = (tempPointsArray[0] + 10) +'px';
	div_elm.style.top = (tempPointsArray[1] + 115) +'px';
	div_elm.style.width = (tempPointsArray[2] - tempPointsArray[0]) +'px';
	div_elm.style.height =  (tempPointsArray[3] - tempPointsArray[1]) +'px';
	div_elm.style.backgroundColor = '#FFFFFF';
	div_elm.innerHTML = '<textarea id="area1" name="area1" cols="40"></textarea>';
	
	nicEditors.allTextAreas() ;

}
</script>

</html>








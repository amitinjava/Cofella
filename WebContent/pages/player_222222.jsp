<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd"> 
<html>
<head>
<meta http-equiv="Content-Language" content="en" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>ILC Player</title>


<!-- Bootstrap CSS -->
<link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/slider.css" rel="stylesheet">
<!-- Custom fonts for icons -->
<link rel="stylesheet" href="fa/css/font-awesome.min.css">

<!-- javascript -->
<script src="js/jquery-1.10.2.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/hashtable.js" ></script>
<script src="js/angular.js"></script>
<script src="js/main.js"></script>
<script src="js/bootstrap-slider.js"></script>


<style type="text/css" media="all">

body{
    font-family:Opensans;
	 border: 0px solid #ff0000;
    margin:0;
    padding:0;
}

.container{
  width: 96% !important;
  min-width: 1024px !important;
  padding:0;
  margin:auto;
}

#header, #timeline{
  border-bottom:1px solid #ffffff;
}

#timeline{
     background-color: #ffffff;
    
}

#item-title p{
  font-size: 1.1em;
  display:inline-block;
  vertical-align: middle;
  margin:5px 0px 0px !important;
  width:100%;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;

}

#slider-Move{
	background-color:#ffffff;
	border: 0px solid #ccc;
	display: none;
	position:absolute;

	right: 0px;
	margin:auto;
	opacity: 0.5;
	cursor:crosshair;
	padding: 0px;
}


#presentation{
  text-align: center;
}
#timeline_canvas {
	        background-color:#FFFFFF;
	        border: 0px solid #ccc;
	        box-shadow: 5px 5px 10px #888888;
			display: block;
	        margin:auto;
	        cursor:crosshair;
	        padding: 0px;
}
#canvas{
 
  background-color:#FFFFFF;
  border: 1px solid #ccc;
  box-shadow: 5px 5px 10px #888888;
  left: 15px;
  right: 15px;
  margin:auto;
  cursor:crosshair;
  padding: 0px;
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


</style>





</head>
<body id="full" onresize="windowResize()" style="border:1 px solid red">


<div class="container">

  <div class="row" id="header" style="padding:5px">

    <div class="col-xs-5">
		<div class="pull-left">
			<div class="btn-group" data-toggle="buttons" style="margin-right:10px">
				<label class="btn btn-default active" id="scrubber">
				  <input type="radio" name="options" id="option2"> Lecture
				</label>
				<label class="btn btn-default" id="slides">
				  <input type="radio" name="options" id="option3"> Slides
				</label>
			</div>
        </div>

          <div id="slideTools" class="btn-group slideDisplay" style="display:none;">
            <button type="button" class="btn btn-default" onclick="setPageNum('P')" ><i class="fa fa-lg fa-arrow-left"></i></button>
			<input type="hidden" id="pagenum" value="1">
            <button type="button" class="btn btn-default disabled" ><span id="pagenumber">1</span></button>
            <button type="button" class="btn btn-default" onclick="setPageNum('N')" ><i class="fa fa-lg fa-arrow-right"></i></button>
			<!--<button type="button" class="btn btn-default scrubberDisplay" id="playpause_slide" data-toggle="button"  onclick="playFromPage()"><i id="playpauseslideBut" class="fa fa-lg fa-play-circle"></i></button>-->
          </div>
          
		 <button type="button" class="btn btn-default scrubberDisplay" id="playpause" data-toggle="button"  ><i id="playpauseBut" class="fa fa-lg fa-play-circle"></i></button>
		 <button type="button" class="btn btn-default scrubberDisplay" id="stop" data-toggle="button" onclick = "stopPlaying();" ><i id="playpauseBut" class="fa fa-lg fa-stop"></i></button>
      </div>

      <div class="col-xs-2" id="item-title">
        <p><s:property value = '%{meetingName}' /></p>
      </div>

      <div class="col-xs-5">
        <div class="pull-right">
          <button type="button" class="btn btn-default" data-toggle="button"><i class="fa fa-lg fa-info-circle"></i></button>
        <button type="button" class="btn btn-default" id="fullscreen"><i class="fa fa-lg fa-arrows-alt"></i></button>
        <button type="button" class="btn btn-default" id="volumeSetting" onclick="openVolume()"><i class="fa fa-lg fa-volume-up"></i></button>
		
       </div> 
      </div>

    

  </div><!-- row -->

</div><!-- container -->





<div class="container">
	<div id="timeline" class="" style="display:block;"><canvas id="timeline_canvas" ></canvas></div><!-- end tools -->
</div>

<div class="container">
	<div id="presentation">
	 	<canvas id="canvas" ></canvas>
	</div>
</div>

 <div id = "meetingDiv" style="position:absolute;top:630px;left:300px;">
	<audio id="audio1"  >
					<source src="" type="audio/mp3">
					  Your browser does not support HTML5 video.
	</audio>
</div>
 <div id = "volCtrl" style="position:absolute;background-color:#ffffff;display:none">
	<input id="ex2" data-slider-id='ex2Slider' type="text" data-slider-min="0" data-slider-max="100" data-slider-step="1" data-slider-value="14" style="width: 100px;" data-slider-orientation="vertical"/>
</div>
<!--
<div id="slider-Move" >
	
</div>
-->
<img id="pointerImg" src="images/meeting/pointer_image.png" style="position:absolute;top:-50px;left:-50px;width:32px;height:32px;z-index:1" />
<script src="js/menuslide.js"></script>
<script src="js/player1.js"></script>
<script type="text/javascript">
//TOGGLE THE TIMELINE DIV VISIBILITY
$( "#playpause" ).click(function() {
	console.log("click play pause");
	if(timeLineHide){
		togglePlayerTimeLine();
	}
	togglePlayPause();
  
  

});


</script>

<script type="text/javascript">
//TOGGLE LECTURE VS SLIDE MODE
$('#scrubber').click(function(){
	 playFromSlide = false;
     $('#playpause').show();
     $('.slideDisplay').hide();
	 stopPlaying();
});

$('#slides').click(function(){
	playFromSlide = true;
     $('.slideDisplay').show();
    // $('#playpause').hide();
    // $('#timeline').hide();
	stopPlaying();
});
</script>


<script type="text/javascript">
//FULLSCREEN CODE
$(function () {
    document.getElementById('fullscreen').addEventListener('click', function (e) {
        var bodyEl = document.getElementById('full');
        setFullscreenMode(bodyEl);
    });
});

function isFullscreenEnabled(elem) {
    return elem.className.indexOf('fullscreen') > -1;
}

function setFullscreenMode(elem) {
    if (!elem) return;

    if (isFullscreenEnabled(elem)) {
        elem.className = '';
        if (document.exitFullscreen) {
            document.exitFullscreen();
        } else if (document.mozCancelFullScreen) {
            document.mozCancelFullScreen();
        } else if (document.msCancelFullScreen) {
            document.msCancelFullScreen();
        } else if (document.webkitCancelFullScreen) {
            document.webkitCancelFullScreen();
        }
    } else {
        elem.className = 'fullscreen';
        if (elem.requestFullscreen) {
            elem.requestFullscreen();
        } else if (elem.mozRequestFullScreen) {
            elem.mozRequestFullScreen();
        } else if (elem.msRequestFullScreen) {
            elem.msRequestFullScreen();
        } else if (elem.webkitRequestFullScreen) {
            //elem.webkitRequestFullScreen();
            elem.webkitRequestFullScreen(Element.ALLOW_KEYBOARD_INPUT);
        }
    }
}

function getPosition(element) {
    var xPosition = 0;
    var yPosition = 0;
  
    while(element) {
        xPosition += (element.offsetLeft - element.scrollLeft + element.clientLeft);
        yPosition += (element.offsetTop - element.scrollTop + element.clientTop);
        element = element.offsetParent;
    }
    return { x: xPosition, y: yPosition };
}
</script>
<script type="text/javascript">
	var meetingName = "<s:property value = '%{meetingName}' />";
	var isAutoPlay = "<s:property value = '%{autoPlay}' />";
	var mode = "<s:property value = '%{mode}' />";
	var userId = "<s:property value='%{#session.user.email}'/>";
	
	
	
 </script>


</body>
</html>
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
    margin:0;
    padding:0;
}

.container{
  width: 100% !important;
  min-width: 1024px !important;
  padding:0;
  margin:auto;
}

#header, #timeline{
  background-color: #666;
}

#timeline{
    background-color: #ccc;
    padding:.25em;
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
  color:white;
}

#presentation{
  text-align: center;
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


#timeline_canvas{
  background-color: #fff;
  border:1px solid #ccc;
  height:60px;
  width:100%;
  min-width: 730px;
  margin:5px 0 0;
	
  }

.timer{

}

.controls{
}

.row-fluid {
  width: 100%; 
  margin: auto; 
  border:1px; 
}

.left { 
  width: 150px; 
  float:left; 
  margin-top: 18px;
  padding-left: 10px;
}

.right { 
  width: 100px; 
  margin-top: 26px;
  padding-right: 10px;
  float:right; 
  font-size:1.1em;
}

.container-fluid { 
  margin-left: 150px; 
  margin-right:100px; 
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
          </div>
          


      </div>

      <div class="col-xs-2" id="item-title">
        <p><s:property value = '%{meetingName}' /></p>
      </div>

      <div class="col-xs-5">
        <div class="pull-right">
          <button type="button" class="btn btn-default" data-toggle="button"><i class="fa fa-lg fa-info-circle"></i></button>
        <button type="button" class="btn btn-default" id="fullscreen"><i class="fa fa-lg fa-arrows-alt"></i></button>
        <button type="button" class="btn btn-default"id="volumeSetting" onclick="openVolume()"><i class="fa fa-lg fa-volume-up"></i></button>
       </div> 
      </div>

    

  </div><!-- row -->

</div><!-- container -->
<div class="container">

<div class="row-fluid" id="timeline">
    <div class="right"><span class="pull-right"><span>14:00</span>-<span>27:00</span></span></div>
    <div class="left">
      <div class="btn-group">
      <button type="button" class="btn btn-default"scrubberDisplay" id="playpause" data-toggle="button"><i id="playpauseBut" class="fa fa-lg fa-play"></i></button>
      <button type="button" class="btn btn-default"><i class="fa fa-lg fa-backward"></i></button>
      <button type="button" class="btn btn-default"><i class="fa fa-lg fa-forward"></i></button>
      </div>
    </div>
    <div class="container-fluid"><canvas id="timeline_canvas"></canvas></div>
</div>
</div><!-- container -->

<!--
<div class="container" id="timeline">
  <div class="row">
    <div class="col-xs-2">
      <div class="controls">
      <div class="btn-group">
      <button type="button" class="btn btn-default"><i class="fa fa-lg fa-play"></i></button>
      <button type="button" class="btn btn-default"><i class="fa fa-lg fa-backward"></i></button>
      <button type="button" class="btn btn-default"><i class="fa fa-lg fa-forward"></i></button>
      </div>
    </div>
    </div>
    <div class="col-xs-8"><canvas id="canvas-timeline"></canvas></div>
    <div class="col-xs-2"><span class="pull-right timer">14:20 - 33:30</span></div>
  </div>  
</div>
-->

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


$( "#scrubberToggle" ).click(function() {
  $( "#timeline" ).slideToggle( "fast" );
});
</script>

<script type="text/javascript">
//TOGGLE LECTURE VS SLIDE MODE
$('#scrubber').click(function(){
   $('.slideDisplay').hide();
  $('#timeline').show();
});

$('#slides').click(function(){
  $('.slideDisplay').show();
  $('#scrubberToggle').hide();
  $('#timeline').hide();
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
</script>
<script type="text/javascript">
	var meetingName = "<s:property value = '%{meetingName}' />";
	var isAutoPlay = "<s:property value = '%{autoPlay}' />";
	var mode = "<s:property value = '%{mode}' />";
	var userId = "<s:property value='%{#session.user.email}'/>";

 </script>

</body>
</html>
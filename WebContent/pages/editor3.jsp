<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>MessagingApp</title>

        <!-- Bootstrap -->
        <link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet">
        <link href="<%=request.getContextPath()%>/css/bootstrap-theme.css" rel="stylesheet">
        <link href="<%=request.getContextPath()%>/css/bootstrap-slider.min.css" rel="stylesheet">
        <link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet">
        <link href="<%=request.getContextPath()%>/css/colorpicker.min.css" rel="stylesheet">
        
        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
            <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
          <![endif]-->
        <script src="https://use.fontawesome.com/ae3a5064ff.js"></script>
        
        <!-- -->
        <!-- from old editor.jsp javascript -->
		<script src="js/jquery-1.10.2.js"></script>
		<script src="js/jquery-ui.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/hashtable.js" ></script>
		<script src="js/angular.js"></script>
		<script src="js/main.js"></script>
    </head>

    <body>
        <div class="body-container">
            <div class="sidebar_menu">
                <ul class="sidebar_menu_list">
                    <li><a href="#" class="menu_icon dashboard" data-toggle="tooltip" data-placement="right" title="Dashboard">Dashboard</a></li>
                    <li><a href="#" class="menu_icon pointer" data-open="#pickerContainer" data-toggle="tooltip" data-placement="right" title="Picker" id="selButton" onclick = "setId(7)">Picker</a></li>
                    <li><a href="#" class="menu_icon pencil" data-open="#pickerContainer" data-toggle="tooltip" data-placement="right" title="Pencil">Pencil</a></li>
                    <li><a href="#" class="menu_icon pen" data-open="#pickerContainer" data-toggle="tooltip" data-placement="right" title="Pen Tool">Pen Tool</a></li>
                    <li><a href="#" class="menu_icon pintool" data-open="#pickerContainer" data-toggle="tooltip" data-placement="right" title="Pin Tool">Pin Tool</a></li>
                    <li><a href="#" class="menu_icon texttool" data-open="#pickerContainer" data-toggle="tooltip" data-placement="right" title="Text Tool">Text Tool</a></li>
                    <li><a href="#" class="menu_icon shape" data-open="#pickerContainer" data-toggle="tooltip" data-placement="right" title="Shapes">Shapes</a></li>
                    <li><a href="#" class="menu_icon pages" data-open="#pickerContainer" data-toggle="tooltip" data-placement="right" title="Pages">Pages</a></li>
                    <li><a href="#" class="menu_icon links" data-open="#pickerContainer" data-open="#historyContainer" data-toggle="tooltip" data-placement="right" title="Links">Links</a></li>
                    <li><a href="#" class="menu_icon time" data-open="#pickerContainer" data-toggle="tooltip" data-placement="right" title="Time">Time</a></li>
                    <li><a href="#" class="menu_icon record" data-open="#pickerContainer" data-placement="right" data-popover-content="#mySettings" rel="popover">Record Audio</a></li>
                    
                    
                    
                     <li><div class="btn-group">
					<button id="shapeButton" type="button" class="btn btn-default dropdown-toggle" onclick = "checkAndSetId(this)" data-toggle="dropdown">
						<a><i data-toggle="tooltip" data-placement="bottom" title="Shape Tool"></i><span id="closedShape" >Shapes</span><span class="caret"></span></a>
					</button>		
						<ul class="dropdown-menu" role="menu" aria-labelledby="tools" style="left: 2000px;">
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
				</div></li>
		 <li><div class="btn-group">
					<button id="shapeButton" type="button" class="btn btn-default dropdown-toggle" onclick = "checkAndSetId(this)" data-toggle="dropdown">
						<a href="#toolOptions" onclick = "setId(1,true)" class="switchContent">Rectangle</a>
					</button>		
				</div></li>
                    
                    
                </ul>
                <ul class="sidebar_menu_list bottom">
                    <li><a href="#" class="menu_icon hide_bar" data-toggle="tooltip" data-placement="right" title="Hide Sidebar">Collapse</a></li>
                </ul>
            </div>
            <div class="sidedrawer close">

                <div class="menu_container" id="pickerContainer" style="display:block">
                    <!--Color Swatches tabs-->
                    <div class="color-swatches" id="toolOptions1">

                        <!-- Nav tabs -->
                        <ul class="nav nav-tabs" role="tablist">
                            <li role="presentation" class="active">Fill<a href="#fill" aria-controls="fillOptions" role="tab" data-toggle="tab" > <img src="images/fill_icon.png" alt="" title="" width="30" /> </a></li>
                            <li role="presentation">Stroke<a href="#stroke" aria-controls="stroke" role="tab" data-toggle="tab"> <img src="images/stroke_icon.png" alt="" title="" width="30" /> </a></li>
                            <li role="presentation">Opacity<a href="#opacity" aria-controls="opacity" role="tab" data-toggle="tab"> <img src="images/opacity_icon.png" alt="" title="" width="30" /> </a></li>
                        </ul>

                        <!-- Tab panes -->
                        <div class="tab-content">
                            <div role="tabpanel" class="tab-pane active" id="fillOptions">
                                <div id="color-picker"></div>
                            </div>
                            <div role="tabpanel" class="tab-pane" id="stroke">
                                <div href="#" class="stroke-select" data-stroke="1" onclick = "setNewUILineWidth('2');">
                                    <div id="stroke-one"></div>
                                </div>
                                <div href="#" class="stroke-select" data-stroke="2" onclick = "setNewUILineWidth('4');">
                                    <div id="stroke-two"></div>
                                </div>
                                <div href="#" class="stroke-select" data-stroke="3" onclick = "setNewUILineWidth('8');">
                                    <div id="stroke-three"></div>
                                </div>
                                <div href="#" class="stroke-select" data-stroke="4" onclick = "setNewUILineWidth('16');">
                                    <div id="stroke-four"></div>
                                </div>
                                <div href="#" class="stroke-select" data-stroke="5" onclick = "setNewUILineWidth('24');">
                                    <div id="stroke-five"></div>
                                </div>
                            </div>
                            <div role="tabpanel" class="tab-pane" id="opacity">
                                <input id="opacity-slider" data-slider-id="opacity-slider" type="text" data-slider-min="0" data-slider-max="100" data-slider-step="1" data-slider-value="100"/>
                            </div>
                        </div>
                    </div>
                    <hr>
                    <div class="sidebar-section">
                        <div class="icon-holder">
                            <h3 class="sidebar-heading">Group</h3>
                            <p> <a href="#" class="icon_btn group" data-toggle="tooltip" data-placement="bottom" title="Group">Group</a> <a href="#" class="icon_btn ungroup" data-toggle="tooltip" data-placement="bottom" title="Ungroup">UnGroup</a> </p>
                        </div>
                        <div class="icon-holder">
                            <h3 class="sidebar-heading">Align</h3>
                            <p> <a href="#" class="icon_btn obj-left-align">Align Left Edges</a> <a href="#" class="icon_btn obj-hor-center-align">Align Center Egdes</a> <a href="#" class="icon_btn obj-right-align">Align Right Egdes</a> <a href="#" class="icon_btn obj-top-align">Align Top Egdes</a>            <a href="#" class="icon_btn obj-ver-center-align">Align Center Egdes</a> <a href="#" class="icon_btn obj-bottom-align">Align Bottom Egdes</a> </p>
                        </div>
                    </div>
                    <hr>
                    <div class="sidebar-section">
                        <h3 class="sidebar-heading">EDIT OBJECT TIMING</h3>
                        <div class="icon-holder pull-left">

                            <p> <a href="#" class="icon_btn big time-minus" data-toggle="tooltip" data-placement="bottom" title="Reduce Time">Reduces Time</a> <a href="#" class="icon_btn big time-clock" data-toggle="tooltip" data-placement="bottom" title="Open Clock">Open Clock</a>            <a href="#" class="icon_btn big time-plus" data-toggle="tooltip" data-placement="bottom" title="Time Plus">Time Plus</a></p>
                        </div>
                        <div class="icon-holder"><input class="form-control input-sm" value="00:31:05" /></div>
                    </div>
                </div>

                <div class="menu_container" id="historyContainer">
                    <!--Color Swatches tabs-->
                    <div class="history-container">
                        <!-- Nav tabs -->
                        <ul class="nav nav-tabs nav-justified" role="tablist">
                            <li role="presentation" class="active"><a href="#objectHistory" aria-controls="objectHistory" role="tab" data-toggle="tab">Object History</a></li>
                            <li role="presentation"><a href="#userHistory" aria-controls="userHistory" role="tab" data-toggle="tab">User History</a></li>
                        </ul>

                        <!-- Tab panes -->
                        <div class="tab-content">
                            <div role="tabpanel" class="tab-pane active" id="objectHistory">
                                Object History
                            </div>
                            <div role="tabpanel" class="tab-pane" id="userHistory">
                                <div class="searchbar-container">
                                    <input class="searchbar empty" id="iconified" placeholder="&#xF002; Search" value="" />
                                </div>
                                <div class="custom_dropdown_container">
                                    <select class="form-control custom_dropdown">
                                        <option value="">All Contributors</option>
                                        <option value="">Any Contributors</option>
                                    </select>
                                </div>
                                <hr style="margin:20px -20px 0">
                                <ul class="history-listing">
                                    <li class="history-list">
                                        <span class="list-time">FRI. 6:05pm</span>
                                        <p><a href="#" class="project-name">Physics Problem</a> <span class="project-by">Cynthia Mehta</span></p>
                                        <p><span class="replied-to">Replyed to</span> &nbsp;<a href="#" class="obj-name">Janet Freeman</a></p>
                                    </li>
                                    <li class="history-list">
                                        <span class="list-time">FRI. 6:05pm</span>
                                        <p><a href="#" class="project-name">Physics Problem</a> <span class="project-by">Cynthia Mehta</span></p>
                                        <p><span class="attached-to">Attached</span> &nbsp;<a href="#" class="obj-name">Janet Freeman</a></p>
                                    </li>
                                    <li class="history-list">
                                        <span class="list-time">FRI. 6:05pm</span>
                                        <p><a href="#" class="project-name">Physics Problem</a> <span class="project-by">Cynthia Mehta</span></p>
                                        <p><span class="shared-to">Shared</span> &nbsp;<a href="#" class="obj-name">Janet Freeman</a></p>
                                    </li>
                                    <li class="history-list">
                                        <span class="list-time">FRI. 6:05pm</span>
                                        <p><a href="#" class="project-name">Physics Problem</a> <span class="project-by">Cynthia Mehta</span></p>
                                        <p><span class="replied-to">Posted a response</span> &nbsp;</p>
                                    </li>
                                    <li class="history-list">
                                        <span class="list-time">FRI. 6:05pm</span>
                                        <p><a href="#" class="project-name">Physics Problem</a> <span class="project-by">Cynthia Mehta</span></p>
                                        <p><span class="xm-replied-to">Posted a response</span> &nbsp;</p>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>

                </div>

            </div>
            <!-- Side Bar Drawer -->

            <div class="canvas-container">
                <div class="canvas-topheader">
                    <div class="canvas_top_details pull-left">
                        <strong class="board-title">Untitled Board <a href="#" class="title_edit">Edit</a> | </strong>
                        <span class="editor_name">By Ryan Alexander</span> <span class="text20"> | </span>
                        <span class="users_attached">3</span> <a href="#" class="add_users">+ Add</a>
                    </div>
                    
                    <canvas id="canvas" ></canvas>
                    
                    <div class="right-top-controls pull-right">
                        <a href="#" class="maximize">Maximize</a>
                        <a href="#" class="minimize">Minimize</a>
                        <a href="#" class="scale">100%</a>
                        <a href="#" class="rotate">Rotate</a>
                    </div>
                </div>

                <div class="canvas_footer">
                    <div class="footer-left pull-left">
                        <a href="#" class="bottom-buttons view">View</a>
                        <a href="#" class="bottom-buttons delete">Delete</a>
                        <a href="#" class="bottom-buttons add" onclick = "saveMeetingOnServer('save')">Add</a>
                        <a href="#" class="bottom-buttons left" onclick="setPageNum('P')">Left</a>
                        <a href="#" class="bottom-buttons number"><input type="text" id="pagenum" value="1" size="1" onchange="showPageObject();"></a>
                        <a href="#" class="bottom-buttons right" onclick="setPageNum('N')">Right</a>
                    </div>
                    

                    <div class="footer-right pull-right dropup">
                        <!-- <a href="#" class="settings" data-placement="left" data-popover-content="#mySettings" rel="popover">Settings</a> -->

                        <a href="#" class="share dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Share</a>
                        <ul class="dropdown-menu share-dropup">
                            <li><a href="#"><img src="images/reply_as_icon.png" alt="" title="" width="25" /> Reply As:</a></li>
                            <li><a href="#"><img src="images/text_message.png" alt="" title="" width="25" /> Text Message</a></li>
                            <li><a href="#"><img src="images/voice_audio_icon.png" alt="" title="" width="25" /> Voice Audio</a></li>
                            <li><a href="#"><img src="images/xm_icon.png" alt="" title="" width="25" /> xMessage</a></li>
                        </ul>
                    </div>
                </div>

            </div>


        </div>

        <div id="mySettings" class="hide">
            <div class="row">
                <div class="col-md-10">
                    <div class="col-md-6 text-left">0.00</div>
                    <div class="col-md-6 text-right">3.19</div>
                    <div class="progress">
                        <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;">
                            <span class="sr-only">60% Complete</span>
                        </div>
                    </div>
                </div>
                <div class="col-md-2">
                    <a href="#" class="record_btn">Record</a>
                </div>
            </div>
        </div>
		<div id = "meetingDiv" style="position:absolute;top:630px;left:300px;">
			<audio id="audio1"  >
							<source src="" type="audio/mp3">
							  Your browser does not support HTML5 video.
			</audio>
		</div>
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="js/colorpicker.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/bootstrap-slider.js"></script>

        <script>
            $(function () {
                $('[data-toggle="tooltip"]').tooltip()
            })

            // Sidebar toggle script
            $('.hide_bar').on('click', function () {
                $('.sidedrawer').toggleClass('close');
                $(this).toggleClass('close');
                $('.canvas-container').toggleClass('open');
            })

            // Click actions for each menu
            $('.menu_icon').on('click', function () {
                $('.menu_container').hide();
                $('.menu_icon').removeClass('active');
                var containerId = $(this).attr('data-open');
                $(containerId).show();
                $(this).addClass('active');
                $('.sidedrawer').removeClass('close');
            })

            // Audio recorder drawer toggle
            $(function () {
                $('[rel="popover"]').popover({
                    container: 'body',
                    html: true,
                    content: function () {
                        var clone = $($(this).data('popover-content')).clone(true).removeClass('hide');
                        return clone;
                    }
                }).click(function (e) {
                    e.preventDefault();
                    $('.sidedrawer').addClass('close');
                    $('.canvas-container').removeClass('open');
                });
            });

            // Record button toggle
            $('.record_btn').on('click', function () {
                $(this).toggleClass('pause');
                $('.record').toggleClass('blink')
            })

            // Script for placeholder icon
            $('#iconified').on('keyup', function () {
                var input = $(this);
                if (input.val().length === 0) {
                    input.addClass('empty');
                } else {
                    input.removeClass('empty');
                }
            });

            $('#color-picker').ColorPicker({
                flat: true
            });

            $('.stroke-select').on('click', function (e) {
                e.preventDefault();
                $('.stroke-select').each(function (i, e) {
                    $(e).removeClass('stroke-selected')
                })
                $(this).addClass('stroke-selected')
            });

            $('#opacity-slider').slider({
                formatter: function (value) {
                    return value + '%';
                }
            });


            /* Use getStroke() to get the stroke width */
            function getStroke() {
                var stroke = null;
                $('.stroke-select').each(function (i, e) {
                    if ($(e).hasClass('stroke-selected')) {
                        stroke = $(e).attr('data-stroke')
                    }
                })
                return stroke;
            }

        </script>
        
<script src="js/lecture.js"></script>
<script type="text/javascript">
	var meetingName = "<s:property value = '%{meetingName}' />";
	var isAutoPlay = "<s:property value = '%{autoPlay}' />";
	var channel_id = "<s:property value = '%{channel_id}' />";
	var mode = "<s:property value = '%{mode}' />";
	var userId = "<s:property value='%{#session.user.email}'/>";
	var email = "<s:property value='%{#session.user.email}'/>";
	
	function getCanvasObject1(obj){
		//alert(obj.value);
		getCanvasObject(obj, meetingName, channel_id);
	}
	
	
	
 </script>
 
 
 <form action="editlecture" name="editlectureform" method="post">
		<input type="hidden" name="meetingName" id="meetingName" value = "<s:property value = '%{meetingName}' />" >
		<input type="hidden" name="channel_id" id="channel_id" value = "<s:property value = '%{channel_id}' />" >
	</form> 
    </body>

</html>

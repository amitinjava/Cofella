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
        
        <style type="text/css">
        #canvas {
			/* background: url(images/ruler.png) repeat; */
		    background-size: 1154px;
		    border: 1px solid #ccc;
		    display: block;
		    position: absolute;
		    top: 43px;
		    left: 0;
		    right: 15px;
		    bottom: 57px;
		    margin: auto;
		    margin-left: 0;
		    cursor: crosshair;
		    padding: 0px;
		}
        
        </style>
        
        <!-- 
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/bootstrap-theme.css" rel="stylesheet">
        <link href="css/bootstrap-slider.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <link href="css/colorpicker.min.css" rel="stylesheet"> -->
        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
            <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
          <![endif]-->
        <script src="https://use.fontawesome.com/ae3a5064ff.js"></script>
         <!-- from old editor.jsp javascript -->
		<script src="js/jquery-1.10.2.js"></script>
		<script src="js/jquery-ui.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/hashtable.js" ></script>
		<script src="js/angular.js"></script>
		<script src="js/main.js"></script>
		<script src="js/jockey.js"></script>
		<script src="js/paper-full.js"></script>
		<script src="js/html2canvas.min.js"></script>
    </head>

    <body>
    <div  style="width:1000px;  
    height: 70px;position:absolute;background:gray;z-index: 100;left: 60px;top: 30px; overflow:hidden; display:none;  ">
    <svg id="svgfeedback" width="1000" height="200">
 
 	<foreignObject  width="100%" height="100%">
     <body xmlns="http://www.w3.org/1999/xhtml">
     <div id="commitdata">
                  

                </div>
    		 </body>
  		 </foreignObject> 
		</svg>
    
    </div>	
     <div id="testdiv" style="position:absolute;top:50px;left:50px;z-index:1;"></div>
     <div class="url_widget" id="urlinfo" >
     	  <div class="info">
     		<div class="title" id="urltitle">Unable to select any option of HTML select list in android tv box.
     		</div>
     		<div class="address"  id="urldomain">www.stackoverflow.com</div>
     		</div>
     </div>
     
       <div class="doc_widget" id="doc_info" >
       <div class="doc_icon">
       <img src="images/docicons/msword.png">
       </div>
     	  <div class="info">
     		<div class="title" id="doc_title">Testting file document
     		</div>
     		</div>
     </div>
     <div class="pin_group" id="pinImage">
		<div class="user_circle" >
			<img id="usrimg" src="<s:property value='%{userProfilePic}'/>" style="  width:42px; height:42px;">
		</div>
		<div class="play_pin">
		</div>
		<div class="data_time" id="pinTime">
			21 Jan, 2018  09:00 PM
		</div>
		<div class="pinned">
			<img src="images/pinned.png" alt="">
		</div>
	</div>
     
     
     <div class="customblock" style="  position: absolute;     top: 170px;   z-index: 100;">
			<div style="display:table-cell; width:300px; height:300px;">
				<img src="images/r_ellipse.png" width="300" height="300" style="position:absolute; left:120px;">
				<img id="dial2" src="images/spin1.png" width="300" height="300" class="spindot" style="">


    <span class="rotate_deg" >			

    <img  src="images/spinbg.png" width="410" height="410" class="spinbg">


    <span class="rotatevalue_parent" >


    <span class="rotatevalue">0</span><sup>o</sup>
</span>
</span>
			</div>

 
		</div>
		
		
     
     <img id="pointerImg" src="images/meeting/pointer_image.png" style="position:absolute;top:-50px;left:-50px;width:32px;height:32px;z-index:1" />
    <img id="checkImg" src="images/check.png" style="position:absolute;top:-50px;left:-50px;width:15px;z-index:1" onclick="closeEditor(false)" >
    <img id="cancelImg" src="images/cancel1.png" style="position:absolute;top:-50px;left:-50px;width:15px;z-index:1" onclick="closeEditor(true)">
		<div class="editor_tools hidden">
            <span class="editor_commit"  onclick="closeEditor(true)">&nbsp;</span>
			<span class="editor_cancel" onclick="closeEditor(false)">&nbsp;</span>
						&nbsp;&nbsp;
            <span class="bold"><button style="font-weight: bold;" onclick="boldSelectdText();">B</button></span>
            <span class="italic"><button style="font-style: italic;" onclick="italicSelectedText();">I</button></span>
            <span class="fonts">
               <select id="editorFontType" style="    width: 101px;">
                    <option>Arial</option>
	                <option>Times</option>
	                <option>Comic</option>
	                <option>Century</option></select>
          
            
						 
						 
					 

  </span>
            <span class="font_size">
              <%--    <select id="editorFontSize" style="       width: 42px;" onchange="changeTextAreaFontSize(this);">
                    <option>14</option>
                    <option>15</option>
                    <option>16</option>
                    <option>17</option>
                    <option>18</option>
                    <option>19</option>
                </select> --%>
                
                
                
                          
						  <input type="tel" list="browsers"  id="editorFontSize" value="14" style="padding-left: 8px;">
						  <datalist id="browsers"  onchange="changeTextAreaFontType(this);">
						    <option value="14">
						    <option value="15">
						    <option value="16">
						    <option value="17">
						    <option value="18">
						  </datalist>
						  
						  
            </span>
            <span>
                <select id="textColorAttr" style="  width: 86px;margin-right: 0;" onchange="setTextStyleColor(this);">
					<option value="">Color</option>
					<option value="#000000" style="background-color: Black;color: #FFFFFF;">Black</option>
					<option value="#808080" style="background-color: Gray;">Gray</option>
					<option value="#A9A9A9" style="background-color: DarkGray;">DarkGray</option>
					<option value="#D3D3D3" style="background-color: LightGrey;">LightGray</option>
					<option value="#FFFFFF" style="background-color: White;">White</option>
					<option value="#7FFFD4" style="background-color: Aquamarine;">Aquamarine</option>
					<option value="#0000FF" style="background-color: Blue;">Blue</option>
					<option value="#000080" style="background-color: Navy;color: #FFFFFF;">Navy</option>
					<option value="#800080" style="background-color: Purple;color: #FFFFFF;">Purple</option>
					<option value="#FF1493" style="background-color: DeepPink;">DeepPink</option>
					<option value="#EE82EE" style="background-color: Violet;">Violet</option>
					<option value="#FFC0CB" style="background-color: Pink;">Pink</option>
					<option value="#006400" style="background-color: DarkGreen;color: #FFFFFF;">DarkGreen</option>
					<option value="#008000" style="background-color: Green;color: #FFFFFF;">Green</option>
					<option value="#9ACD32" style="background-color: YellowGreen;">YellowGreen</option>
					<option value="#FFFF00" style="background-color: Yellow;">Yellow</option>
					<option value="#FFA500" style="background-color: Orange;">Orange</option>
					<option value="#FF0000" style="background-color: Red;">Red</option>
					<option value="#A52A2A" style="background-color: Brown;">Brown</option>
					<option value="#DEB887" style="background-color: BurlyWood;">BurlyWood</option>
					<option value="#F5F5DC" style="background-color: Beige;">Beige</option>
			</select>
            </span>

		</div>
		
    <div class="editor_parent inactive">
		
		<textarea name="" id="editor" class="clas_editor "></textarea>
	</div>
     
     
   <%--   <div id = "meetingDiv" style="position:absolute;top:150px;left:300px;    padding: 0px;z-index:1;border:none;;display:none;">
		<div align="center">
		<div align="center" >
			<!-- <div align="center"><b style="
    margin-bottom: 10px;
    display: block;
">Text Editor</b> </div> -->
			<button type="button" class="btn btn-default" onclick="boldSelectdText();" style="
			float: left;
			border: 1px solid #ddd;
			padding: 7px 13px;
			font-size: 20px;
			/* box-shadow: 0px 0px 3px #ddd; */
			color: black;
			text-decoration: none;
			background: #fff;
			margin-right: 5px;
			float: left;
			    height: 39px;
			">
				<a href="#toolOptions" class="switchContent" data-toggle="tooltip" data-placement="bottom" title="Bold" style="    text-decoration: none;
    color: #000;">
					<span>B</span>
				</a>
			</button>
			<button type="button" class="btn btn-default" onclick="italicSelectedText();"
			
			style="float: left;			border: 1px solid #ddd;			padding: 7px 13px;	
					font-size: 20px;		
						color: black;			text-decoration: none;	
								background: #fff;			margin-right: 5px;			float: left;			    height: 39px;">
			 <a  href="#toolOptions" data-toggle="tooltip" data-placement="bottom" title="Italic">
						<span style="font-style: italic;">I</span></a>
				
			</button>
			<span class="dropdown table-menu" style="display:inline-block;">
				<select required="" id="editorFontType" class="form-control font-selector" onchange="changeTextAreaFontType(this);" style="
    padding: 9px 0px;
    border: 1px solid #ddd;
    box-shadow: 0px 0px 3px #ddd;
    float: left;
    width: 114px;
    margin-right: 5px;
    float: left;
        height: 39px;
    ">
					<option value="Arial">Arial</option>
					<option value="bethhand">Bethhand</option>
					<option value="dancing" selected="">Dancing Script</option>
					<option value="learning">Learning</option>
					<option value="Times New Roman">Times New Roman</option>
					<option value="Verdana">Verdana</option>
				</select>
			</span>
			<span class="dropdown table-menu" style="display:inline-block;">
				<select required="" id="editorFontSize" class="form-control width-selector" onchange="changeTextAreaFontSize(this);" style="
    padding: 9px 0px;
    border: 1px solid #ddd;
    box-shadow: 0px 0px 3px #ddd;
    float: left;
    /* width: 114px; */
    margin-right: 5px;
        height: 39px;
    float: left;
">
					<option value="5">5</option>
					<option value="10">10</option>
					<option value="15">15</option>
					<option value="20">20</option>
					<option value="25">25</option>
					<option value="30">30</option>
					<option value="35">35</option>
					<option value="40">40</option>
					<option value="45">45</option>
					<option value="50" selected="">50</option>
					<option value="55">55</option>
					<option value="60">60</option>
					<option value="65">65</option>
				</select>
			</span>
			<span class="dropdown table-menu" style="display:inline-block;">
				<select id="textColorAttr" class="form-control color-selector" onchange="setTextStyleColor(this);" style="
    padding: 9px 0px;
    border: 1px solid #ddd;
    box-shadow: 0px 0px 3px #ddd;
    width: 64px;
    margin-right: 4px;
    float: left;
        height: 39px;
">
						  <option value="#000000" selected="">Black</option>
						  <option value="#A9A9A9">Dark Grey</option>
						  <option value="#D3D3D3">Light Grey</option>
						  <option value="#FF0000">Red</option>
						  <option value="#FFA500">Orange</option>
						  <option value="#FFFF00">Yellow</option>
						  <option value="#006600">Green</option>
						  <option value="#0000FF">Blue</option>
						  <option value="#FFFFFF">White</option>
										
				</select>
			</span>
			<button type="button" class="btn btn-default" onclick="closeEditor(true)" style="
			border: 1px solid #ddd;
			padding: 4px 13px;
			font-size: 20px;
			/* box-shadow: 0px 0px 3px #ddd; */
			color: black;
			text-decoration: none;
			background: #fff;
			margin-right: 5px;
			float: left;
			    height: 39px;
			">
				<a href="javascript:void(0)" class="switchContent" data-toggle="tooltip" data-placement="bottom" title="Close &amp; Save">
					<img src="images/check.png" style="width:15px;">
				</a>
			</button>
			
			<button type="button" class="btn btn-default" onclick="closeEditor(false)" style="
			border: 1px solid #ddd;
			padding: 4px 13px;
			font-size: 20px;
			/* box-shadow: 0px 0px 3px #ddd; */
			color: black;
			text-decoration: none;
			background: #fff;
			margin-right: 0;
			float: left;
			    height: 39px;
			">
				<a href="javascript:void(0)" class="switchContent" data-toggle="tooltip" data-placement="bottom" title="Close">
					<img src="images/cancel.png" style="width:15px;">
				</a>
			</button>
			
			
			<textarea id="area1" style="height: 385px;resize: none;width: 1135px;color: rgb(0, 0, 0);margin-top: 0;background-color: transparent;font-size: 50px;font-family: dancing;border: 2 px;outline: none;" wrap="hard" name="area1" onkeyup="setsize(this)"></textarea>
		</div>
	
	</div>  	

</div> --%>


        <div class="body-container">
            <div class="sidebar_menu">
                <ul class="sidebar_menu_list">
   <input id="myInput" type="file" style="visibility:hidden" onchange="getfile();"/>
                    <li><a href="javascript:void(0);" class="menu_icon pin_icon dashboard" 
                      title="Dashboard">Dashboard</a>
		
                    </li>
                     <li class="hidden"><a href="#recordprompt" data-toggle="modal"  class="menu_icon record"  data-popover-content="#mySettings" rel="popover">Record Audio</a></li>
                    <li><a href="#" class="menu_icon pointer" data-open="#pickerContainer"  title="Picker" onclick = "setId(7,true)" >Picker</a></li>
                    <li>
                        <a href="javascript:void(0);" onclick = "setId(4,true)" class="menu_icon pencil" data-open="#pickerContainer"  title="Pencil" id="pencilButton" >Pencil</a>
                        <a href="javascript:void(0)" class="openshutter hidden" data-parent="pencil" id="pencil_shutter"><img src="images/shutter.png" alt=""></a>
                    </li>
               
               

                    <li class="shapeiconli">
                    	<a href="#" class="menu_icon shape" data-open="#pickerContainer"   title="Shapes">Shapes</a>
						<a href="javascript:void(0)" class="openshutter hidden" onclick="shapecolors();" data-parent="shapeiconli" id="shape_shutter"><img src="images/shutter.png" alt=""></a>


                        <ul class="allshapes">
                            <li onclick = "setId(1,true);selectshape(id)" id='rectangleTool'><span><img src="images/rectangle.png" alt=""></span> <span class="title">Rectangle Tool</span></li>
                            <li onclick = "setId(23,true);selectshape(id)"  id='SquareTool'><span><img src="images/square.png" alt=""></span> <span class="title">Square Tool</span> </li>
                            <li onclick = "setId(5,true);selectshape(id)" id='TriangleTool'><span><img src="images/triangle.png" alt=""></span> <span class="title">Triangle Tool</span> </li>
                            <li onclick = "setId(12,true);selectshape(id)" id='CircleTool'><span><img src="images/circle.png" alt=""></span> <span class="title">Circle Tool</span> </li>
                            <li onclick = "setId(2,true);selectshape(id)" id='EllipseTool'><span><img src="images/ellipse.png" alt=""></span> <span class="title">Ellipse Tool</span> </li>
                            <li onclick = "setId(11,true);selectshape(id)" id='ArcTool'><span><img src="images/arc.png" alt=""></span> <span class="title">Arc Tool</span> </li>
                            <li onclick = "setId(6,true);selectshape(id)" id='ArrowTool'><span><img src="images/arrow.png" alt=""></span> <span class="title">Arrow Tool</span> </li>
                            <li onclick = "setId(3,true);selectshape(id)" id='LineTool'><span><img src="images/line.png" alt=""></span> <span class="title">Line Tool</span> </li>
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:void(0)" onclick = "setId(16,true)" class="menu_icon texttool" data-open="#pickerContainer"  title="Text Tool">Text Tool</a>
                   </li>
                   
                 <!--    <li><a href="#" class="menu_icon eyes" data-open="#pickerContainer" data-open="#historyContainer"  title="Display object">Display object</a></li>
                    <li> -->
                    <li>
                    
                    <a href="javascript:void(0);"  onclick = "setId(25,true)" class="menu_icon pen" data-open="#pickerContainer" data-open="#historyContainer"  id="penButton"   title="Pen">Pen</a>
                         <a href="javascript:void(0)" class="openshutter_pen" data-parent="pen" id="pen_shutter"><img src="images/shutter.png" alt="" ></a>
                   </li>
                    <li>

                     <li>
                   <!--   onclick="selectedFile('image'); -->
                     <a href="javascript:void(0);" id="attachDoc" class="menu_icon links" data-open="#pickerContainer"
                      data-open="#historyContainer"   title="Links" ">Links</a>
                     <ul class="links_sub">
                     	<li class="active"><a href="javascript:selectedFile('excel');setId(26,true)"> <img src="images/docicons/excel.png"> Excel</a></li>
                     	<li><a href="javascript:selectedFile('ppt');setId(26,true)"> <img src="images/docicons/powerpoint.png"> Power Point</a></li>
                     	<li><a href="javascript:selectedFile('docx');setId(26,true)"> <img src="images/docicons/msword.png"> MS Word</a></li>
                    <!--<li><a href="javascript:selectedFile('image');setId(26,true)"> <img src="images/docicons/notepad.png"> Notes Txt</a></li>-->
                     	<li><a href="javascript:selectedFile('pdf');setId(26,true)"> <img src="images/docicons/pdf.png"> PDF</a></li>
                     	<li><a href="javascript:selectedFile('image');setId(8,true)"> <img src="images/docicons/img.png"> Image</a></li>                                 
                     	<!-- <li><a href="javascript:selectedFile('image');setId(26,true)" onclick=""> <img src="images/docicons/weblink.png"> Url</a></li> -->
                        <li><a href="javascript:void(0)" onclick="showUrl()"> <img src="images/docicons/weblink.png"> Url</a></li>
                     </ul>
                     </li>
                    <li>
                        <a href="#" class="menu_icon time" data-open="#pickerContainer"  title="Time">Time</a>
                   

                   <div class="sidebar-section" id="objectTiming">
                        <h3 class="sidebar-heading">Edit object timing</h3>
                        <div class="icon-holder pull-left">

                            <p> <a href="#" style="    display: inline-block;" class="icon_btn big time-minus"  title="Reduce Time">Reduces Time</a> 

                                <a href="#"  style="    display: inline-block;" class="icon_btn big time-clock"  title="Open Clock">Open Clock</a>      

                                      <a href="#"  style="    display: inline-block;" class="icon_btn big time-plus"   title="Time Plus">Time Plus</a></p>
                        </div>
                        <div class="icon-holder"><input class="form-control input-sm timedark" value="00:31:05" /></div>
                    </div>


                     </li>

                       <li>
                        <a href="#" class="menu_icon  " >&nbsp;</a>
                    </li>


                    

                    <li class="magnifier" id="zoomButtons" style="display:none">
                        <ul>
                            <li>
                                 <a href="javascript:setZoomTypeNew(1)" class="menu_icon plus-magnifier" data-open="#pickerContainer"  data-placement="right" > 
                                 &nbsp;
                        		</a>
                            </li>
							<li>100%</li>
                               <li>
                              	   <a href="javascript:setZoomTypeNew(2)" class="menu_icon minus-magnifier" data-open="#pickerContainer"  data-placement="right"> 
                                 &nbsp;
                       			 </a>
                            </li>
                        </ul>
                    </li>
                   
                </ul>
                <!-- <ul class="sidebar_menu_list bottom">
                    <li><a href="#" class="menu_icon hide_bar" data-toggle="tooltip" data-placement="right" title="Hide Sidebar">Collapse</a></li>
                </ul> -->
            </div>


            <div id="recordprompt" class="modal   " >
   <div class="modal-dialog">
      <div class="modal-content">
         
         <div   class="modal-body">
            <div style="    font-size: 23px; padding: 20px;">Would you like to record and capture an xM?</div>
         </div>
         <div  class="modal-footer">
            <button  data-dismiss="modal" class="btn btn-primary" onclick="startrecord()">Yes</button>
            <button  data-dismiss="modal" class="btn btn-default" >No</button></div>
      </div>
   </div>
</div>




  <div class="countdown">
    

    <figure class="chart" data-percent="25">
	 <div class="dashed"></div>
	 <div class="dotted"></div>
     
    <svg width="260" height="260">
      <circle class="outer" cx="60" cy="130" r="120" transform="rotate(-90, 95, 95)"></circle>
    </svg>
  </figure>

  <div class="countdown__numbers">
   		<div class="nums ">5 4 3 2 1 </div>
  </div>


  </div>



  <div class="sidedrawer_pen close" tool="pen">
    <div class="drawer_cover">
     <button onclick="closedrawer_pen()" class="closedrawerbtn">&times;</button>
         <div class="menu_container" style="display:block">
		           <div class="color-swatches">
		           
		           
		            <ul class="nav nav-tabs" role="tablist">
                            <li role="presentation" class="active" onclick="setColortype('2')">Stroke<a href="#stroke_pen" aria-controls="stroke" role="tab" data-toggle="tab"> <img src="images/stroke_icon.png" alt="" title="" width="30" /> </a></li>
                            <li role="presentation" onclick="setColortype('3')">Opacity<a href="#opacity_pen"  aria-controls="opacity" role="tab" data-toggle="tab"> <img src="images/opacity_icon.png" alt="" title="" width="30" /> </a></li>
                        </ul>
                        
                         <div class="tab-content">
                           
                             
                            <div role="tabpanel" class="tab-pane active" id="stroke_pen">
                            
                            	<input id="strokepallete_pen" class="jscolor {onFineChange:'update(this)'}" 
                            	style="    position: relative;    z-index: -1;    top: -17px;visibility:hidden; opacity:0;" value="cc4499"  onchange="colorPallateChange('3');">
	                                <div class="clearfix" style="height:210px;"> </div>
	                                <div class="col-md-6" style=" width: 34%; float: left;">
	                              	  <div id="stroke_color_pen" class="picked_color" style="background:#cc4499"></div>	
	                                </div>
	                                <div class="col-md-6 text-center" style=" width: 63%; float: right;">
	                                <div class="strokewidth stroke_pencil">
	                                 <span>Stroke Width</span>
	                                 <select id="strokewidth_sel_pen" onchange="setHighLighterLineWidth(this)"> 
	                                 	<option>20</option>
	                                 		<option>25</option>
	                                 			<option>30</option>
	                                 				<option>35</option>
	                                 					<option>40</option>
	                                 										
	                                 </select>	
	                                </div>
	                               
	                               
	                                <div class="strokewidth stroke_pen">
	                                 <span>Stroke Width</span>
	                                 <select onchange="setHighLighterLineWidth(this)"> 
	                                 	<option>20</option>
	                                 		<option>30</option>
	                                 			<option>40</option>
	                                 				<option>50</option>
	                                 					<option>60</option>
	                                 						
	                                 										
	                                 </select>	
	                                </div>
	                               </div>
	                                <div class="clearfix" style="height:50px;"></div>
	                                
	                                <div id="strokeLine_pen" class="stroke-select" data-stroke="1" style="display:block;">
	                                    <div id="stroke-three" style="border-bottom: 1px solid;"></div>
	                                </div>
	                                
                            	</div>
                            	
                            	 <div role="tabpanel" class="tab-pane " id="opacity_pen" style="text-align: center;    padding-top: 20px;">
                            	         <input id="opacity_slider_pen" data-slider-id="opacity_slider_pen_data" type="text" data-slider-min="0" data-slider-max="100" data-slider-step="1" data-slider-value="100"/>
                        
                            	</div>
                            	
                           	</div>
                           	
		           </div>
         </div>
     </div>
 <div class="drawer_closer" onclick="closedrawer_pen();"></div>
 </div>





            <div class="sidedrawer close">
		    <div class="drawer_cover">
		    <button onclick="closedrawer()" class="closedrawerbtn">&times;</button>
                <div class="menu_container" id="pickerContainer" style="display:block">
                    <!--Color Swatches tabs-->
                    <div class="color-swatches">

                        <!-- Nav tabs -->
                        <ul class="nav nav-tabs" role="tablist">
                            <li role="presentation" class="active" onclick="setColortype('2')">Stroke<a href="#stroke" aria-controls="stroke" role="tab" data-toggle="tab"> <img src="images/stroke_icon.png" alt="" title="" width="30" /> </a></li>
                            <li role="presentation" class="filltype"  onclick="setColortype('1')">Fill<a href="#fill" aria-controls="fill" role="tab" data-toggle="tab"> <img src="images/fill_icon.png" alt="" title="" width="30" /> </a></li>
                            <li role="presentation" onclick="setColortype('3')">Opacity<a href="#opacity"  aria-controls="opacity" role="tab" data-toggle="tab"> <img src="images/opacity_icon.png" alt="" title="" width="30" /> </a></li>
                        </ul>

                        <!-- Tab panes -->
                        <div class="tab-content">
                           
                             
                            <div role="tabpanel" class="tab-pane active" id="stroke">
                            	
								  	
                          
									<input id="strokepallete" class="jscolor {onFineChange:'update(this)'}" style="    position: relative;    z-index: -1;    top: -17px;visibility:hidden; opacity:0;" value="cc4499"  onchange="colorPallateChange('2');">
	                                <div class="clearfix" style="height:210px;"> </div>
	                                <div class="col-md-6" style=" width: 34%; float: left;">
	                              	  <div id="stroke_color" class="picked_color" style="background:#cc4499"></div>	
	                                </div>
	                                <div class="col-md-6 text-center" style=" width: 63%; float: right;">
	                                <div class="strokewidth stroke_pencil">
	                                 <span>Stroke Width</span>
	                                 <select id="strokewidth_Sel" onchange="setLineWidth(this)"> 
	                                 	<option>2</option>
	                                 		<option>4</option>
	                                 			<option>6</option>
	                                 				<option>8</option>
	                                 					<option>10</option>
	                                 						<option>12</option>
	                                 							<option>14</option>
	                                 								<option>16</option>
	                                 									<option>18</option>
	                                 										<option>20</option>
	                                 										
	                                 </select>	
	                                </div>
	                               
	                               
	                                <div class="strokewidth stroke_pen">
	                                 <span>Stroke Width</span>
	                                 <select onchange="setHighLighterLineWidth(this)"> 
	                                 	<option>20</option>
	                                 		<option>30</option>
	                                 			<option>40</option>
	                                 				<option>50</option>
	                                 					<option>60</option>
	                                 						
	                                 										
	                                 </select>	
	                                </div>
	                              
	                              
	                               </div>
	                                <div class="clearfix" style="height:50px;"></div>
	                                
	                                <div id="strokeLine" class="stroke-select" data-stroke="1">
	                                    <div id="stroke-one" style="border-bottom: 5px solid;"></div>
	                                </div>
	                                
	                                 <div id="strokeLine_pencil" class="stroke-select" data-stroke="1">
	                                    <div id="stroke-two" style="border-bottom: 2px solid;"></div>
	                                </div>
	                                
	                               <!--  <div onclick="setLineWidth('4')" class="stroke-select" data-stroke="2">
	                                    <div id="stroke-two"></div>
	                                </div>
	                                <div onclick="setLineWidth('6')" class="stroke-select" data-stroke="3">
	                                    <div id="stroke-three"></div>
	                                </div>
	                                <div onclick="setLineWidth('8')" class="stroke-select" data-stroke="4">
	                                    <div id="stroke-four"></div>
	                                </div>
	                                <div onclick="setLineWidth('10')" class="stroke-select" data-stroke="5">
	                                    <div id="stroke-five"></div>
	                                </div> -->

                                  <!--<div class="color-picker"></div> -->
							

                            </div>
                         
                         
                         
                            <div role="tabpanel" class="tab-pane " id="fill">
                                <!--<div class="color-picker"></div>-->
							
								  
								<input id="fillpallete" class="jscolor {onFineChange:'updateFill(this)'}" style="    position: relative;    z-index: -1;    top: -17px;visibility:hidden; opacity:0;" value="cc4499" onchange="colorPallateChange('1');">
                                <div class="clearfix" style="height:210px;"> </div>
                                <div class="col-md-6" style=" width: 50%; float: left;">
                                 <div id="filled_color" class="picked_color" style="background:#cc4499"></div>	
                            </div>
                            
                            <div class="col-md-6 text-center togglefillbtn" style=" width: 50%; float: right;">
                            	<div onclick="onfill(1)" id="fillOn">	
                            		<span> Fill</span> <a href="javascript:void(0)"> <img src="images/toggleon.png">	</a>
                            		</div>
                            	<div onclick="onfill(2)" id="fillOff" class="hidden">	
                            		<span> No Fill</span> <a href="javascript:void(0)"> <img src="images/toggleoff.png">	</a>
                            		</div>
                            </div>
                             <div class="clearfix"></div>
                               <%--  <div class="toggleFill"><span>Toggle Fill</span> <span class="toggleFillbtn active" onclick="toggleFill()"></span></div> --%>
                            </div> 
                            
                          
                         
                            <div role="tabpanel" class="tab-pane" id="opacity">
                                <input id="opacity-slider" data-slider-id="opacity-slider-data" type="text" data-slider-min="0" data-slider-max="100" data-slider-step="1" data-slider-value="100"/>
                            </div>
                        </div>
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
 
 <div class="drawer_closer" onclick="closedrawer();"></div>
            </div>
            <!-- Side Bar Drawer -->













<%-- <div class="sdcontainer" >

<div class="sd" style="">
    <div class="tablet">
    <a href="javascript:void(0)" class="playerbtn">
        <img src="images/recorder.png" alt="" >
    </a>
    <span class="text" id="recordingtext">Recording..</span>
    <span class="text" style="padding-left: 15px;">01.33</span>
   <div class="pull-right"> <span>
           <a href="javascript:void(0);" class="pausebtn playerbtn">
           <img src="images/pause.png" alt="" style="  height: 20px;    padding-top: 2px;"></a>
       </span>
       <span>
               <a href="javascript:void(0);" class="playerbtn"><img src="images/stop.png" alt="" style="padding-right:0px;width: 18px;padding-top: 2px;"></a>
       </span></div>
    </div class="tablet">
</div>

<div class="sd" style="">
<div class="tablet">
    <span><a href="javascript:void(0);" class="playerbtn"><img src="images/play.png" alt="" style=""></a></span>
    <span class="text">Recording 1</span>
    <span class="text " style="float: right;">01.33</span>
    
    </div class="tablet">   
    
</div>


<div class="sd" style="">
    
    <div class="tablet">
    <span><a href="javascript:void(0);" class="playerbtn"><img src="images/blackpause.png" alt="" style="    height: 20px;
    padding-top: 2px; "></a></span>
    <span class="line "><span class="drag"></span></span>
    <span class="  text" style="float: right;">01.33</span>
    
    </div class="tablet">
<span style=" font-size: 11px;    padding: 10px 0px;    font-family: arial;    display: block;"> 
Playing : Recording 1
</span>
</div>
 
</div> --%>

            <div class="canvas-container">
                <div class="canvas-topheader">
                <div id="redlineruler" class="redlineruler" style = "display:none"></div>
                  <strong class="board-title">
                  <span class="board-title-main">
                  	<span id="msgtitle"><s:property value = '%{meetingName}' /></span>
                         <a href="javascript:editTitle();">
                         	<i class="fa fa-pencil"></i>
                         </a> 
                         </span>
                        <%--  val:::<s:property value = '%{messageHistory.size()}' />  --%>
                            
	            
                       	<s:if test="%{messageHistory.isEmpty()}">
						</s:if>
						<s:else> 
                        	 &nbsp;
	                         <a href="javascript:void(0)" class="notificationclick" onclick="showmsgs()"><img class="notification-icon" src="images/notification.png">
	                          <span class="notif_count"><s:property value = '%{messageHistory.size()}' /></span></a>
	                         
                       </s:else>
                      </strong>  
                              <ul class="background-select">
				                     <li id="1" class="active" onclick="setPageBgTable(this)" ><a href="javascript:void(0)"><span class="title">None</span><span class="box">None</span></a></li>
				                     <li id="2" onclick="setPageBgTable(this)" ><a href="javascript:void(0)"><span class="title">Ruler</span><span class="box">Ruler</span>
				                     </a></li>
				                     <li id="3" onclick="setPageBgTable(this)" ><a href="javascript:void(0)"><span class="title">Graph</span><span class="box">Graph</span></a></li>
                     		</ul>
                       <div id="scrollable_msgs">
								    <h5 style=" font-size: 22px;margin-bottom: 13px;font-weight: lighter;margin-top: 0;    padding-left: 20px;">Message Thread
								    <a class="closemessage" onclick="close_message_box()">&times;</a>
								    </h5>
								    <ul>
								        <s:iterator value="messageHistory">
									        <li style="cursor:pointer" id="msg_<s:property value = "seqNumber"/>" onclick="openOldMessage(<s:property value = "seqNumber"/>,this);">
									           
									           	<a href="javascript:void(0)" class="">
										           	<img class="message_folder" src="images/open-folder.png" alt="" >
										           	<img class="message_folder open" src="images/open-folder-sel.png" alt="" >
										           	 	<img class="loader_message" src="images/messageloader.gif" alt="" >
										           	<span id="" class="sender_photo" style="background-image: url(<s:property value ="senderPic" />);"></span>
										           	 <span class="sender"><%-- <span> From:</span> --%> 
										            <span class="sendtexts firstsender">
													<s:property value = "sender"/></span> &rarr; 
													
													<span id="" class="sender_photo" style="background-image: url(<s:property value ="receiverPic" />);"></span>
													<span class="sendtexts"><s:property value="receiver" /></span> </span>
										            <p class="message">"<s:property value ="title" />"</p>
										            <span class="time">
										             <s:property value = "time"/> 

											      		 </span> 
											      		 
									      		 </a>
									        </li>
										</s:iterator>
		   					 	</ul>
							</div>
                      
                      
                    <div class="canvas_top_details pull-left">
	                      <%-- <span class="editor_name">By Ryan Alexander</span> <span class="text20"> | </span>
	                      <span class="users_attached">3</span> <a href="#" class="add_users">+ Add</a> --%>
	                       
	                       <%--  <span style="font-size: 13px;" id="toFrom" >To : </span>
                           <strong style="     font-weight: 500;   font-size: 15px;" id="userEmail">Amit Agnihotri</strong> --%>
                    
	                    <span class="sender_header"> 
	                    <span id="fromPic" class="sender_photo" style="background-image:url('images/profile.png');"></span>
						<span id="fromName" class="e_sender">												
							me</span>  						
							&rarr; 
							 <span id="toPic" class="sender_photo" style="background-image:url('images/profile.png');"></span>
							 
							 <span id="toName" class="e_receiver">arnav.agni</span>
			 			</span>    
                    </div>
                    <!-- <div class="right-top-controls pull-right">
                        <a href="#" class="maximize">Maximize</a>
                        <a href="#" class="minimize">Minimize</a>
                        <a href="#" class="scale">100%</a>
                        <a href="#" class="rotate">Rotate</a>
                    </div> -->
                </div>
                <canvas id="dummy_canvas" ></canvas>
             
 <canvas id="canvas" ></canvas>
                <div class="canvas_footer">
                    <div class="footer-left pull-left">
                        <!-- <a href="#" class="bottom-buttons view">View</a> -->
                        
                        
                        <!--  <a href="#" class="bottom-buttons delete">Delete</a>
                        <a href="#" class="bottom-buttons add">Add</a>
                        <a href="javascript:setPageNum('P')" class="bottom-buttons left">Left</a>
                        <input type="text" id="pagenum" value="1" size="2" onchange="showPageObject();">
                        <a href="javascript:setPageNum('N')" class="bottom-buttons right">Right</a>
                         -->
                         
                        
                        <div class="page_tool">
                                
                            <div class="page_group">
                                            
                                <span class="hefotr"><a href="javascript:setPageNum('P')" class="bottom-buttons left">Left</a></span><input type="hidden" id="pagenum" name="pagenum" value="1" size="2" onchange="showPageObject();" >
                                <span class="nubn" id="pagenumdiv">Page 1 </span>
                                <span class="hefotr"><a href="javascript:setPageNum('N')" class="bottom-buttons right">Right</a> </span>

                            </div>
                            <div class="page_edits">

                                <span class="hefotr"><a href="#" class="bottom-buttons add">Add</a></span>
                                <span class="hefotr"><a href="javascript:eraseSelectedObject();" class="bottom-buttons delete">Delete</a></span>
                                            
                            </div>

                       </div>
                       <ul  class="ungroupicons">
	                      <li> <a href="javascript:unGroupSelectedGroup();" class="menu_icon " data-open="#pickerContainer"   title="Ungroup"> 
											<span class="icon_btn ungroup"></span>
									</a>
						   </li>
                       </ul>
                        <ul  class="groupicons" >
                         
							<li> <a href="javascript:void(0);" class=" " data-open="#pickerContainer" title="Group"> 
										<span class="icon_btn group" onclick="groupSelectedObjects();"></span>
								</a>
							</li>
							
							<%-- <li> <a href="#" class=" " data-open="#pickerContainer"  title="Left align"> 
										<span class="icon_btn obj-left-align"></span>
								</a>
							</li>  --%>
							 <li> <a href="javascript:void(0);" class=" " data-open="#pickerContainer"    title="Horizontal Center align"> 
										<span class="icon_btn obj-hor-center-align" onclick="hAlignSelectedObjects();" ></span>
								</a>
							</li>  
							<%-- <li> <a href="#" class="menu_icon " data-open="#pickerContainer"   title="Right align"> 
										<span class="icon_btn obj-right-align"></span>
								</a>
							</li>  <li> <a href="#" class="menu_icon " data-open="#pickerContainer" data-toggle="tooltip" data-placement="top" title="Top align"> 
										<span class="icon_btn obj-top-align"></span>
								</a> 
							</li> --%>
							 <li>
							 	 <a href="javascript:void(0);" class=" " data-open="#pickerContainer"   title="Vertical Center align"> 
										<span class="icon_btn obj-ver-center-align" onclick="vAlignSelectedObjects();" ></span>
								</a>
							</li>
							<%-- <li> <a href="#" class="menu_icon " data-open="#pickerContainer" data-toggle="tooltip" data-placement="top" title="Bottom align"> 
										<span class="icon_btn obj-bottom-align"></span>
								</a>
							</li> --%>
								
                        </ul>
                         <ul   class="copyicons" >
	                        <li> <a href="javascript:copySelectedObject();" class=" " title="Copy"> 
										<span class="icon_btn copy"></span>
								</a>
							</li>
								
                       </ul>
                       
                       <ul   class="pasteicons" >
							<li> <a href="javascript:pasteCopiedObject();" class=" " title="Paste"> 
									<span class="icon_btn paste"></span>
							</a>
							</li>
                       </ul>
                       
                       <div class="document_viewedit"  style="display:none" >
                       		<span class="document_ico" id="docIcon" style="background-image:url(images/docicons/powerpoint.png)">
                       		 </span>
                       		<span class="action_bar">
                       			<a href="javascript:void(0);" id="viewUrl" >VIEW</a> 
                       			<span class="pipe">|</span> 
                       			<a href="javascript:void(0);" id="editUrl">EDIT</a> 
                       			</span>
                       </div>
                  </div>
                  <div style="float:right;">
                 	<button id="rotateButton" type="button" class="btn btn-default"  ><a href="javascript:playObjectFromApp();" ><i class="fa fa-rotate-left fa-lg"></i></a></button>
					<button id="playFrObjButton" type="button" class="btn btn-default"  ><a href="javascript:startRecordingFromApp(0);" >startRec</i></a></button>
					<button id="delObjButton" type="button"><a href="javascript:saveMeetingOnServer('save')"  >Save</a></button>
					<button type="button" class="btn btn-default" ><a href="javascript:stopRecordingFromApp()" class="switchContent"  >stopRec</a></button>
		  			<button type="button"  class="btn btn-default" ><a href="javascript:pauseObject()" class="switchContent"  ><i class="fa fa-search fa-lg"></i></a></button>
					<button type="button"  class="btn btn-default" ><a href="javascript:saveMeetingOnServer('send')">Send</a></button>
					
					<button id="rotateButton" type="button" class="btn btn-default"  ><a href="javascript:stopPlayingfromApp();" ><i class="fa fa-rotate-left fa-lg"></i></a></button>
					<button id="playFrObjButton" type="button" class="btn btn-default"  ><a href="javascript:playfromObjectMobileApp();" ><i class="fa fa-crosshairs fa-lg"></i></a></button>
					<button id="delObjButton" type="button" class="btn btn-default"  ><a href="javascript:playWhenSliderMovefromApp(8000)"  ><i class="fa fa-trash-o fa-lg"></i></a></button>
                    <button id="delObjButton" type="button" class="btn btn-default"  ><a href="javascript:openAttachedDocInwebView()"  ><i class="fa fa-trash-o fa-lg"></i></a></button>
                  
                  </div>
					
					<%-- <span id="zoomOptions" style="display:none">
						<button id="zoomIn" type="button" class="btn btn-default" disabled onclick="setZoomType(1)" ><a href="javascript:void(0)" class="switchContent"><i class="fa fa-search-plus fa-lg"></i></a></button>
						<button id="zoomOut" type="button" class="btn btn-default" disabled onclick="setZoomType(2)" ><a href="javascript:void(0)" class="switchContent" ><i class="fa fa-search-minus fa-lg"></i></a></button>
					</span>	 --%>
				<%-- 	<span id="fillOptions" style="display:none" >
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
					</span> --%>	
                    <div class="footer-right pull-right dropup">
                        <!-- <a href="#" class="settings" data-placement="left" data-popover-content="#mySettings" rel="popover">Settings</a> -->

                        <a href="#" class="share dropdown-toggle hidden" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Share</a>
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



<div class="documentpopup hidden" style="" >
   <div class="documentpopup_header" style="">
     <div style="display:table-cell;width: 33%;vertical-align: middle;">
       <img src="images/imglogo.png" alt="" style="    width: 50px;">
<span style=" position: relative; top: 12px;">
 
<img src="images/xmblue.png" style="  width: 21px; margin-right: 3px;"> 
<span style="    font-size: 12px;    font-weight: 500;    color: #7b7b7b;">Document viewer</span>	
</span>
     </div>
 <div style="display:table-cell;width: 33%;text-align: center;vertical-align: middle;">
       <span style="    color: #505050;    font-size: 19px;">XM Document viewer</span>
       
     </div>
      <div style="display:table-cell;width: 33%;text-align: right;vertical-align: middle;padding-right: 14px;">
      <a href="javascript:void(0)" class="close_document" onclick="closeDocument()" style="">  <img src="images/cancel.png" alt="" style="    width: 19px;"></a>
       
     </div>

   </div>
<div style="background:#eeeeee;position: absolute;left: 10px;right: 10px;bottom: 0;top: 63px;">
  <iframe id="docViewer" src="" style="">
 
  </iframe>
</div>

</div>

<div id="urlpopup">
		<div class="input_url">	<input id="insertUrl" type="text" placeholder="Enter url"/></div> 
		<button class="okbutton" type="button" style="background-color: #1982d5; color: #fff;" onclick="$('#urlpopup').hide();insertUrlRef()"> Insert</i></button>
		<button class="okbutton" type="button" id="cancel_input_url" onclick="$('#urlpopup').hide()">Cancel</button>	 
</div>


        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="js/colorpicker.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/bootstrap-slider.js"></script>
        <script src="js/jscolor.js"></script>
<script src="js/greensock/TweenLite.min.js"></script>
<script src="js/greensock/CSSPlugin.min.js"></script>
<script src="js/greensock/CSSRulePlugin.min.js"></script>
<script src="js/greensock/Draggable.min.js"></script>
 
<script src="js/tinymce.min.js"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/tinymce/4.7.4/plugins/textcolor/plugin.js"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/tinymce/4.7.4/plugins/advlist/plugin.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/tinymce/4.7.4/plugins/lists/plugin.js"></script>
        <script>

        
      
		Draggable.create("#dial2", {

				type:"rotation", 
				edgeResistance:0, 
				throwProps:true,
				onDrag: function()

{


var angle = 	document.getElementById('dial2')._gsTransform.rotation;
$('.rotatevalue').text(Math.floor(angle));

}
,
onRelease : function(){

var angle = 	document.getElementById('dial2')._gsTransform.rotation;
$('.rotatevalue').text(Math.floor(angle));

}

			});

		

 
	
	
	
        
   function showUrl(){
	   	$('#urlpopup').show();
	   	$('#urlpopup .input_url input').focus();
   }
   
        
        
  function close_document(){
 	 $(".documentpopup").addClass("hidden");
  }
      
		
function startrecord(){
      $('.countdown').addClass('active');
  		setTimeout(function(){
      $('.countdown').removeClass('active');
 	 },5000);
}

            $(function () {
                $('[data-toggle="tooltip"]').tooltip({
                    trigger : 'hover'
                })
            })

            // Sidebar toggle script
            $('.hide_bar').on('click', function () {
                $('.sidedrawer').toggleClass('close');
                $(this).toggleClass('close');
                $('.canvas-container').toggleClass('open');
            })

            // Click actions for each menu
            $('.menu_icon').on('click', function () {
                    closedrawer();
                    closedrawer_pen();
                    
                   if(!$(this).hasClass('pin_icon')){
                     hidemsgs();
                   }
                   if(!$(this).hasClass('time')){
                       $('#objectTiming').hide(); 
                   }

                $('.menu_icon').removeClass('active');
                $('.openshutter').addClass('hidden');


                if($(this).hasClass('pencil') || $(this).hasClass('texttool') || $(this).hasClass('pen') ){
	                 $(this).addClass('active').siblings('.openshutter').removeClass('hidden');
                }
                if($(this).hasClass('shape')){
                	 if(selectedShape == null){
                		 selectedShape = 1;
                		 setId(1,true);
                	 }else{
                		 setId(selectedShape,true);
                	 }
                	 $('.shapeiconli .allshapes').show();
                 }
                if($(this).hasClass('links')){
                	 $('ul.links_sub').show();
                }
                if(!$(this).hasClass('shape')){
                	$('.shapeiconli .allshapes').hide();
                }
              	if(!$(this).hasClass('links')){
                	$('ul.links_sub').hide();
                	 //alert($('#attachDoc').hasClass('menu_icon links active'));
                	 if($('#attachDoc').hasClass('menu_icon links active')){
                     	//setId(7,true);
                     	//$(".menu_icon.pointer").click();
                     }
                }
                
                $(this).addClass('active');
            

                // $('.menu_container').hide();

                // var containerId = $(this).attr('data-open');
                // $(containerId).show();
                // $('.sidedrawer').removeClass('close');
            });


        $('.menu_icon.time').click(function(){

                $('#objectTiming').toggle();
        });


        $('.openshutter_pen').on('click', function () {     
            globarvr = false;
        	$(".sidedrawer_pen").removeClass('close');
            $('.nav-tabs a[href="#stroke_pen"]').tab('show');
        	setTimeout(function(){
        		document.getElementById('strokepallete_pen').jscolor.show();        		
        	}, 1000);
        
        	 
        });

        $('.openshutter').on('click', function () {
                var dataparent = $(this).attr('data-parent');
                    //open the drawer
                openShutterAttrib(dataparent);
        });      
                    
         function openShutterAttrib(dataparent){          
               // alert("dataparent::"+dataparent)
                globarvr = false;
                if(dataparent == 'pencil'){
 
                    //tell drawer selected tool
                    $('.sidedrawer').attr('tool','pencil');
                    $('.nav-tabs a[href="#stroke"]').tab('show');
                    $('.sidedrawer .nav-tabs > li:nth-child(2)').hide();
                    setTimeout(function(){
   					  document.getElementById('strokepallete').jscolor.show()

   					 },850);

                    $('.sidedrawer').removeClass('close');
                }
                    
                if(dataparent == 'pen'){
                	 

                    //tell drawer selected tool
                    $('.sidedrawer').attr('tool','pen');
                    $('.nav-tabs a[href="#stroke"]').tab('show');
                    $('.sidedrawer .nav-tabs li.filltype').hide();
                    setTimeout(function(){
   					  document.getElementById('strokepallete').jscolor.show();

   					 },850);

                    $('.sidedrawer').removeClass('close');
                }
            }


            // Audio recorder drawer toggle
            $(function () {
                // $('[rel="popover"]').popover({
                //     container: 'body',
                //     html: true,
                //     content: function () {
                //         var clone = $($(this).data('popover-content')).clone(true).removeClass('hide');
                //         return clone;
                //     }
                // })

            $('[rel="popover"]').click(function (e) {
                    e.preventDefault();
                    closedrawer();
                    $('.canvas-container').removeClass('open');
                    $('.sidedrawer').removeAttr('tool',''); 
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

            $('.color-picker').ColorPicker({
                flat: true,
                onChange: function (hsb, hex, rgb) {
                          console.log(hex);
                          var selectedColor = "#"+hex;
                          setColor(selectedColor);
                 }
            });

            $('.stroke-select').on('click', function (e) {
                e.preventDefault();
                $('.stroke-select').each(function (i, e) {
                    $(e).removeClass('stroke-selected')
                })
                $(this).addClass('stroke-selected')
            });

         /*  $('#opacity-slider').slider({
                formatter: function (value) {
                    return value + '%';
                }
            });  */

           $('#opacity-slider,#opacity_slider_pen').slider({
               formatter: function (value) {
            	   //globalAlpha = value/100;
            	   //console.log("globalAlpha::"+globalAlpha)
                   return value ;
               }
           
           });
            $("#opacity-slider").on('slideStop', function (e) {
            	console.log("globalAlpha::"+e.value)
            	value = e.value/100;
            	setOpacityAttrib(value);
            	changeSelectedObjectGlobalAlpha(value)
    		});
            
            $("#opacity_slider_pen").on('slideStop', function (e) {
            	console.log("highlighter alpha::"+e.value)
            	value = e.value/100;
            	setHighlighterOpacityAttrib(value);
            	changeSelectedObjectGlobalAlpha(value)
    		});
            /* Use getStroke() to get the stroke width */
            function getStroke() {
                var stroke = 2;
                $('.stroke-select').each(function (i, e) {
                    if ($(e).hasClass('stroke-selected')) {
                        stroke = $(e).attr('data-stroke')
                    }
                })
                lineWidth = stroke;
                console.log("lineWidth::"+lineWidth);
                return stroke;
            }




//Vidit JS Starts


       //click outside of div
        
$(document).on('click touchstart', function (e) {        
 
	
    var x = $('.notificationclick, #scrollable_msgs');

    if(!x.is(e.target) && x.has(e.target).length ===0){
             hidemsgs();
             
    } 

    var y = $('.sidedrawer, .sidebar_menu_list');

    if(!y.is(e.target) && y.has(e.target).length ===0){           
          
         //   closedrawer();             
    } 


  var z = $('#objectTiming, .menu_icon.time');

    if(!y.is(e.target) && y.has(e.target).length ===0){
             $('#objectTiming').hide();              
             
    } 


     var a = $('.sidebar_menu_list, .menu_icon.shape');

    if(!a.is(e.target) && a.has(e.target).length ===0){
                 $('.allshapes').hide();            
             
    } 
    
    
    var links = $('.sidebar_menu_list, .menu_icon.links');
   
    if(!links.is(e.target) && links.has(e.target).length ===0){
        $('.links_sub').hide();            
        //alert($('#attachDoc').hasClass('menu_icon links active'));
        if($('#attachDoc').hasClass('menu_icon links active')){
        	//setId(7,true);
        	//$(".menu_icon.pointer").click();
        }
     } 

 var sidebar_menu_list = $('.sidebar_menu_list');
  		//console.log($(e.target));
 		if(!sidebar_menu_list.is(e.target) && sidebar_menu_list.has(e.target).length ===0 ){
        	 if($('#attachDoc').hasClass('menu_icon links active')){
        	//setId(7,true);
        	 $(".menu_icon.pointer").click();
        } 
 }

    

});    

$(document).click(function(e){
 
	
    var x = $('.notificationclick, #scrollable_msgs');

    if(!x.is(e.target) && x.has(e.target).length ===0){
             hidemsgs();
             
    } 

    var y = $('.sidedrawer, .sidebar_menu_list');

    if(!y.is(e.target) && y.has(e.target).length ===0){           
          
         //   closedrawer();             
    } 


  var z = $('#objectTiming, .menu_icon.time');

    if(!y.is(e.target) && y.has(e.target).length ===0){
             $('#objectTiming').hide();              
             
    } 


     var a = $('.sidebar_menu_list, .menu_icon.shape');

    if(!a.is(e.target) && a.has(e.target).length ===0){
                 $('.allshapes').hide();            
             
    } 
    
    
    var links = $('.sidebar_menu_list, .menu_icon.links');
   
    if(!links.is(e.target) && links.has(e.target).length ===0){
        $('.links_sub').hide();            
        //alert($('#attachDoc').hasClass('menu_icon links active'));
        if($('#attachDoc').hasClass('menu_icon links active')){
        	//setId(7,true);
        	//$(".menu_icon.pointer").click();
        }
     } 

 var sidebar_menu_list = $('.sidebar_menu_list');
  		//console.log($(e.target));
 		if(!sidebar_menu_list.is(e.target) && sidebar_menu_list.has(e.target).length ===0 ){
        	 if($('#attachDoc').hasClass('menu_icon links active')){
        	//setId(7,true);
        	 $(".menu_icon.pointer").click();
        } 
 }

    

});


        //click outside of div ends


        //close drawer function

        function closedrawer() {
		globarvr = true;
		var obj = document.getElementById('fillpallete').jscolor;
		var obj2 = document.getElementById('strokepallete').jscolor;
		if(obj != null)
			document.getElementById('fillpallete').jscolor.hide();
		if(obj2 != null)
			document.getElementById('strokepallete').jscolor.hide();
		
               $('.sidedrawer').addClass('close'); 



             //Reset the drawer tools
             setTimeout(function(){   //let drawer fade out completely

              $('.sidedrawer').removeAttr('tool',''); 
              
              //$('.sidedrawer .nav-tabs li').show();
               
              $('.nav-tabs a[href="#stroke"]').tab('show');

          },850);
        }

        
        function closedrawer_pen() {
    		globarvr = true;
    		 
    		var obj2 = document.getElementById('strokepallete_pen').jscolor;
    	 
    		if(obj2 != null)
    			document.getElementById('strokepallete_pen').jscolor.hide();
    		
                   $('.sidedrawer_pen').addClass('close'); 

                 //Reset the drawer tools
                 setTimeout(function(){   //let drawer fade out completely

                  $('.sidedrawer_pen').removeAttr('tool','');                   
                  //$('.sidedrawer .nav-tabs li').show();
                   
                  $('.sidedrawer_pen .nav-tabs a[href="#stroke_pen"]').tab('show');

              },850);
            }

        
        
        
        //show message function
        function showmsgs(){
            closedrawer();
            var board_left = $(".board-title-main").offset().left;
          
 

                $('#scrollable_msgs').toggleClass('active').css({"left":board_left});
               

        }

          function hidemsgs(){
           

    $('#scrollable_msgs').removeClass('active');

                $('.pin_icon').removeClass('active');

        }



//shape tool drawer functions


function colorPallateChange(type){
	var color
	if(type == 1){
		 color = "#" + document.getElementById('fillpallete').value;
		 document.getElementById('filled_color').style.background = color;
		//setFilledColor(color);
		 setFillOnOffAttrib(fillType);
	}
	else if(type == 2){
		color = "#" + document.getElementById('strokepallete').value;
		setStyleColor(color);
	}
	else if(type == 3){
		color = "#" + document.getElementById('strokepallete_pen').value;
		setHighlighterStyleColor(color);
	}	 
	console.log(":colorPallateChange::"+color);
	//setColor(color);
}

 /*Toggle color fill*/
 function onfill(e){
	defFillType = e;
	setFillOnOffAttrib(e);
	setFillPropOnSelctedObject(fillColor);
}

function setFillOnOffAttrib(type){
	fillType = type;
	if(fillType == 1){
		$("#fillOn").addClass("hidden");
		$("#fillOff").removeClass("hidden");
		fillColor = null;
	}else if(fillType == 2){
		$("#fillOn").removeClass("hidden");
		$("#fillOff").addClass("hidden");
		fillColor = document.getElementById('filled_color').style.background ;
	}
	
}

function setOpacityAttrib(value){
	globalAlpha = value;
	//setOpacitySliderValue(value*100)
}

function setHighlighterOpacityAttrib(value){
	heighlighterOpacity = value;
	
}

 function selectshape(e){
         //closedrawer()
         $('.allshapes').hide();
         $('.shapeiconli .openshutter').removeClass('hidden');
         $('.shapeiconli .openshutter').attr('data-parent', e);
		 $('.allshapes > li').removeClass('active');
         $('#'+e).addClass('active');
 }

function doOpacity(event){
//	event.preventDefault();
	console.log("1");
	document.getElementById('fillpallete').jscolor.hide();
	document.getElementById('strokepallete').jscolor.hide();
}
function shapecolors(){

	var r = $('.shapeiconli > .openshutter').attr('data-parent');
	$(".sidedrawer").attr('tool','shape');
	openShapeAttributeShutter(r)
}


function openShapeAttributeShutter(r){
	globarvr = false;
    
	if(r == "ArcTool" || r == "ArrowTool" || r == "LineTool"){
			$('.sidedrawer').removeClass('close');
            $('.nav-tabs a[href="#stroke"]').tab('show');
			$('.sidedrawer .nav-tabs > li:nth-child(2)').hide();
			setTimeout(function(){
				document.getElementById('fillpallete').jscolor.hide();
				document.getElementById('strokepallete').jscolor.show();
	          	}, 850);
			
			
     }else{
    	 $('.sidedrawer .nav-tabs li').show();
         $('.sidedrawer').removeClass('close');
          	
        setTimeout(function(){
       	document.getElementById('strokepallete').jscolor.show();
		//document.getElementById('strokepallete').jscolor.show();
         	}, 850);
 }
}

function toggleFill(){
	$('.toggleFillbtn').toggleClass('active');
	var className = $('.toggleFillbtn').attr('class');  
	console.log("className::"+className)
	console.log("color::"+selFillColor)
	if(className == 'toggleFillbtn active'){
		fillColor = selFillColor;
	}else{
		fillColor =  null;
	}
}



//shape "$"l drawer functions ends




document.addEventListener("click",handler,true);

function handler(e){
  
    
    var leftpanel = $(e.target).closest(".sidebar_menu"); 
    var drawer = $(e.target).closest(".sidedrawer"); 
    var canvas_e = $("#canvas, .editor_parent, .board-title, #myInput, .mce-container, .mce-panel,.scrollable_msgs,.page_tool,.groupicons"); 
  
   
    if(leftpanel.length != 1 && drawer.length != 1 && !canvas_e.is(e.target) && canvas_e.has(e.target).length === 0 ){
    	 
    	 // e.stopPropagation();
    	//  e.preventDefault();
    } 
    
     
}


//Vidit JS Ends

        </script>
<script src="js/lecture.js"></script>
<script src="js/lecture-util.js"></script>
<script type="text/javascript">
	var meetingName = "<s:property value = '%{meetingName}' />";
	var isAutoPlay = "<s:property value = '%{autoPlay}' />";
	var channel_id = "<s:property value = '%{xmsgId}' />";
	var mode = "<s:property value = '%{mode}' />";
	var email = "<s:property value='%{#session.user.email}'/>";
	var sequenceNum = "<s:property value='%{sequenceNum}'/>";
	var profilePic  = "<s:property value='%{userProfilePic}'/>";
	alert("profilePic------>"+profilePic);
	var curTitleState = 0;
	function getCanvasObject1(obj){
		//alert(obj.value);
		getCanvasObject(obj, meetingName, channel_id);
	}
	
	function editTitle(){
		if(curTitleState == 0){
			var val = document.getElementById("meetingName").value;
			alert(val);
			document.getElementById("msgtitle").innerHTML = '<input type="text" id="title" value="'+val+'">'
			curTitleState = 1;
		}else{
			setTitle();
			curTitleState = 0;
		}
		
	}
	
	function setTitle(){
		var str = document.getElementById("title").value ;
		document.getElementById("meetingName").value = str;
	
		
		//var commitlength = $("#msgtitle").text().length;
		if(str.length > 14){
			document.getElementById("msgtitle").innerHTML = str.substring(0,35) +"...";
		}else{
			document.getElementById("msgtitle").innerHTML = str;
		}
	}
	
	
function close_message_box(){
		$("#scrollable_msgs").removeClass("active");
	}
	//alert("start")
	
 </script>
  	<form action="editlecture" name="editlectureform" method="post">
		<input type="hidden" name="meetingName" id="meetingName" value = "<s:property value = '%{meetingName}' />" >
		<input type="hidden" name="channel_id" id="channel_id" value = "<s:property value = '%{xmsgId}' />" >
		<input type="hidden" name="userId" id="userId" value = "<s:property value = '%{userId}' />" >
		<input type="hidden" name="currentSeqNumber" id="currentSeqNumber" value = "<s:property value = '%{currentSeqNumber}' />" >
		<input type="hidden" name="draftMsgId" id="draftMsgId" value = "<s:property value = '%{draftMsgId}' />" >
	</form>   
    </body>
	<audio id="audio1"  >
		<source src="" type="audio/mp3">
		  Your browser does not support HTML5 video.
	</audio>
</html>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
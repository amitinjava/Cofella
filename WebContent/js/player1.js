<!--
	var canvas;
	var timelnCanvas;
	var ctx;
	var timelnCtx;
	var canvasOffset;
	var timelnCanvasOffset;
	var offsetX;
	var offsetY;
	var timelnOffsetX;
	var timelnOffsetY;
	var pageObjTable =  new Hashtable();
	var nonRecordinPageObjTable =  new Hashtable();
	var timeRefTable = new Hashtable();
	var objectTimeTable = new Hashtable();
	var objectPageRefTable = new Hashtable();
	var selObjArray = new Array();
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
	var tempArray;
	var imageObj;
	var imgGraphicsobject;
	var isImageLoaded = false;
	var timer;
	var playCount;
	var startTime = 0;
	var recFileDuration = 0;
	var pencilPath;
	var canvasBoundedRectanglePoints =  new Array();
	var isCircleCreated = false;
	var isSquareCreated = false;
	var isEqTriangleCreated = false;
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
	var volSliderPos = 50;
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
	var prevSelShapeId;
	var selObjRotatable = true;
	var sliderLength;
	var imageObjArray = new Array();
	var allImageloadingTimer;
	var d = new Date();
	var prevTime = d.getTime();
	var timeLineObjRadius = 5;
	var timeLinePageObjRadius = 9;
	var sliderRadius = 9;
	var pageCircleDistfrmLine = 10;
	var timeLineWidth = 7;
	var timeLineTop = 30;
	var timeLineLeft = 20;
	var currObjTimeOntmLine = -1;
	var timeLineHide = true;
	var timeLineObjArray;
	var glowTimerId;
	var playFromSlide = false;
	var activePage;
	var lastDrawnObjTime = 0;
	var isPlayFromObject = false;
	var pageCount = -1;
	var sliderPosition = 0;
	var sliderDrag = false;
	var sliderPointsArray = new Array();
	var timeLineDiv = document.getElementById("timeline_div"); 
	var timeLineDivWidth;
	var timeLineDivHeight;
	var sortedTimeRefTable ;
	var moveSliderPointer = false;
	var showAnoSymbol = false;
	var menuX;
	var menuY;
	var menuWidth = 130;
	var menuHeight = 30;
	
	var menuArray1 = new Array();
		menuArray1[0] = "Play From Object";
		

	var menuObjectArr = new Array();
	var selObjId;
	var tempPageSelId;
	var isFForRW = false;
	var pointsOnMenu = -1;
	var playerState = 1;
	// 1 For Pause
	// 2 For Play

	
	
	
	jQuery(document).ready(function(){
	
		var windowW = window.innerWidth;
		var windowH = window.innerHeight;
		var isMobDevice = detectmob();
		$('#loading-Modal').modal('show');
		canvas = document.getElementById("canvas");
		timelnCanvas = document.getElementById("timeline_canvas");
		timeLineDivWidth =  Math.floor(timeLineDiv.getBoundingClientRect().width);
		timeLineDivHeight = 60;//timeLineDiv.getBoundingClientRect().height;
	//	var sliderDiv = document.getElementById("slider-Move");
	//	sliderDiv.innerHTML = '<input id="ex1" data-slider-id="ex1Slider" type="text" data-slider-min="0" data-slider-max="'+(windowW - 90)+'" data-slider-step="1" data-slider-value="14" style="width:'+(windowW - 90)+'px;"/>';
		//var myElement = document.getElementById("timeline_div"); 
		//alert("myelement:;"+timeLineDiv.getBoundingClientRect().width);
		if(isMobDevice){
			canvas.width = (windowW + 180);
			canvas.height = (windowH - 1);
			canvas.style.display = "block";
			if(isAutoPlay == "true"){
				document.getElementById("recordMenu").width = (windowW - 60);
			}
		}else{
			//alert("timelnCanvas.width"+timelnCanvas.width);
			timelnCanvas.width = timeLineDivWidth;
			// alert("timeLineDivWidth::"+timeLineDivWidth);
			//sliderDiv.style.width = (windowW - 60)+"px";
			sliderLength = (timeLineDivWidth - 30);
			//alert("timeLineDivHeight::"+timeLineDivHeight);
			//console.log("timeln_canvas.width::"+timeln_canvas.width);
			timelnCanvas.height = timeLineDivHeight;
			//sliderDiv.style.height = "10px";
			//alert("sliderDiv.Style.height::::"+canvas.width);
			canvas.width = (windowW - 60);
			canvas.height = (windowH -100);
			//alert("sliderDiv.Style.height::::"+canvas.width);
			canvas.style.display = "block";
			timelnCanvas.style.display = "block";
			
			//alert("isAutoPlay:::"+isAutoPlay);
			if(isAutoPlay == "true"){
				//document.getElementById("recordMenu").width = (windowW - 40);
				canvas.height = (windowH -100);
				//alert("width::"+document.getElementById("recordMenu").width);
			}
		}
		ctx = canvas.getContext("2d");
		timelnCtx = timelnCanvas.getContext("2d");
		
		canvasBoundedRectanglePoints[canvasBoundedRectanglePoints.length] = 0;
		canvasBoundedRectanglePoints[canvasBoundedRectanglePoints.length] = 0;
		canvasBoundedRectanglePoints[canvasBoundedRectanglePoints.length] = canvas.width;
		canvasBoundedRectanglePoints[canvasBoundedRectanglePoints.length] = canvas.height;
		
		
		ctx.lineWidth = lineWidth;
		ctx.styleColor = styleColor;
		ctx.globalAlpha = globalAlpha;
		if(document.getElementById("opacityCtrl") != null){
			document.getElementById("opacityCtrl").value = globalAlpha;
		}
		if(document.getElementById("area1") != null){
			document.getElementById("area1").style.fontSize = textFontSize+"px";
			document.getElementById("area1").style.fontFamily = textFontType;
		}
		
		currentObjId = 7;
		if(document.getElementById("toolOptions1") != null){
			document.getElementById("toolOptions1").style.display = "inline-block";
		}
		
		init();
		if(document.getElementById("selButton") != null){
			prevSelButtonObj = document.getElementById("selButton");
			prevSelButtonObj.className = "btn btn-default active";
			prevSelShapeId = 1;
		}

		if(meetingName != null || meetingName!= ''){
			//alert("meetingName"+meetingName);
			openMeeting(meetingName);
		}
		
		canvasOffset = $("#canvas").offset();
		timelnCanvasOffset = $("#timeline_canvas").offset();
		//alert("canvasOffset.left"+timelnCanvasOffset.left+":canvasOffset.top"+timelnCanvasOffset.top);
		offsetX = canvasOffset.left;
		offsetY = canvasOffset.top;
		timelnOffsetX = timelnCanvasOffset.left
		timelnOffsetY = timelnCanvasOffset.top;
		//console.log("timelnOffsetX"+timelnOffsetX+":timelnOffsetY"+timelnOffsetY);
		initPlayer();
		/*
		var objjj = document.getElementById("timeline");
		objjj.style.display="block";
		//alert("width:::"+objj.style.width);
		var pos = findPos(objjj);
		//sliderDiv.style.top = pos.y + "px";
		//sliderDiv.style.left = pos.x +"px";
		//alert("x:::"+pos.x+":y:::"+pos.y);
		objjj.style.display="none";
		
		var objj = document.getElementById("volumeSetting");
		//alert("width:::"+objj.style.width);
		var pos = findPos(objj);
		//alert("x:::"+pos.x+":y:::"+pos.y);
		*/
		var objj = document.getElementById("volumeSetting");
		//alert("width:::"+objj.style.width);
		var pos = findPos(objj);
		
		document.getElementById("volCtrl").style.top = pos.y + 50 +"px";
		document.getElementById("volCtrl").style.left = pos.x +"px";
		
		pointerImg = document.getElementById("pointerImg");
		jQuery('#ex2').slider('setValue',volSliderPos);
		jQuery('#ex1').slider('setValue',sliderPos);
		myVid.volume = 0.5;
		togglePlayerTimeLine();
		
		if(timeRefTable != null && timeRefTable.size() > 0){
			sortedTimeRefTable = sortObjectTimeTable(timeRefTable);
		}
		
		jQuery('#ex2').slider({
			formater: function(value) {
			}
		});

		jQuery("#ex2").on('slide', function(slideEvt) {
			volSliderPos = slideEvt.value;
			myVid.volume = (volSliderPos/100);
			
		});
		
		
		jQuery("#ex2").on('slideStop', function (e) {
			//console.log("-----------slideStop-------------"+volSliderPos);
			//myVid.volume = (volSliderPos/100);
		});
		
		
		jQuery('#ex1').slider({
			formater: function(value) {
			}
		});

		jQuery("#ex1").on('slide', function(slideEvt) {
			sliderPos = slideEvt.value;
			
		});
		
		
		
		jQuery("#ex1").on('slideStop', function (e) {
			//console.log("-----------slideStop-------------"+sliderPos);
			if(!isRecRunning){
				//console.log("----runningTimerId---After---"+runningTimerId);
				//console.log(" clearTimeout(sliderTimer)222222222");
				//console.log("----runningTimerId---Before---"+runningTimerId);
				 clearTimeout(runningTimerId);	
				 refreshTimeLine(-1);
				 lastDrawnObjTime = null; 
				//clearTimeout(sliderTimer);
				stopSlide();
				playingFrom = 2;
				//console.log("Source::::"+myVid.src);
				if(myVid.src == null || myVid.src == ''){
					myVid.src = "http://"+window.location.host+"/"+filename;
					
					
					//myVid.currentTime  = currentAudioTime;
				}else{
					currentAudioTime  = sliderPos*recFileDuration / sliderLength;
					//console.log("-----------currentAudioTime-------"+currentAudioTime);
					currentAudioTime =  Math.ceil(currentAudioTime / 1000);
					myVid.currentTime  = currentAudioTime;
				}
			}
			
		});
		
		jQuery("#ex1").on('slideStart', function (e) {
			myVid.pause();
			document.getElementById("playpauseBut").className  = "fa fa-lg fa-play-circle";
		});



		canvas.addEventListener("touchstart", function (evt) {
			var touch = evt.changedTouches[0];
			//console.log("Touch Start------------------"+touch.clientX+"::Y::"+touch.clientY);
			evt.preventDefault();
			dragFlag = true;

			//handleMouseDown(touch);
		}, false);

		canvas.addEventListener("touchmove", function (evt) {
			var touch = evt.changedTouches[0];
			//console.log("Touch Move------------------"+touch.clientX+"::Y::"+touch.clientY);
			evt.preventDefault();
			//handleMouseMove(touch);
		}, false);

		canvas.addEventListener("touchend", function (evt) {
			//console.log("Touch End------------------");
			var touch = evt.changedTouches[0];
			evt.preventDefault();
			dragFlag = false;
			strechableObj[0] = null;
			strechableObj[1] = null;
			strechableObj[2] = null;
			//handleMouseUp(touch);
		}, false);

	
		canvas.addEventListener("dragenter", function (evt) {
			//console.log("Drag Enter------------------");
			evt.preventDefault();
			//createDropZone();
		}, false);
		
		canvas.addEventListener("dragover", function (evt) {
			//console.log("Drag over--------------------");
			evt.preventDefault();
		}, false);
	
		canvas.addEventListener("dragleave", function (evt) {
			//console.log("Drag Leave---------------------");
			evt.preventDefault();
			//clearDropZone();
		}, false);
		document.onselectstart = function( e ) { 
		
		//  //console.log("Drag onselectstart---------------------");
			e.preventDefault();
			return false;
		  
		};
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
					initSelectedObjState();
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
			//alert("charStr"+charCode);
			//console.log("charCode::;"+charCode);
			if(navigator.platform.indexOf("Mac")!=-1){
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
					//$('#save-Modal').modal('show');
					saveMeetingOnServer('save');
					return false;
				}else if(evt.metaKey && (evt.which == 67) && currentObjId == 7){
					copySelectedObject();
				}else if(evt.metaKey && (evt.which == 86) && currentObjId == 7){
					pasteCopiedObject();
				}
			}else{
				if(charCode == 8){
					var pageNum = document.getElementById("pagenum").value;
					var objectTable = pageObjTable.get(pageNum);
					deleteSelectedObject(objectTable,pageNum);
					var anchorTag = document.getElementById("attachtxt");
					if(currentObjId == 16 || anchorTag ){
						
					}else{
						evt.preventDefault();
					}
					
				}
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
							//console.log("11111111111");
							enableDisableRelationOptions(true);
						}
					}
					return false;
				 }
			  else if(evt.ctrlKey && (evt.which == 83)) {
				evt.preventDefault();
				// save meeting data
				//$('#save-Modal').modal('show');
				saveMeetingOnServer('save');
				return false;
			  }else if(isControlPressed && charCode == 67 && currentObjId == 7){
				copySelectedObject();
				}else if(isControlPressed && charCode == 86 && currentObjId == 7){
					pasteCopiedObject();
				}
				
			}
			
			
		 });
		 $(document).keyup(function(evt){
			
				isControlPressed = false;
		});
		
		$("#timeline_canvas").on('dblclick', function(e) {
			//console.log("timelnCanvas dblclick");
			handleDblClickOnTimeLine(e);
		}).on('mouseup', function(e) {
			e.preventDefault();
			if(sliderDrag){
				sliderDrag = false; 
				moveSliderPointer = false;
				timelnCanvas.style.cursor = "default";
				sliderStop();
			}
			
			//console.log("timelnCanvas mouseup");
			
		}).on('mousemove', function(e) {
			//console.log("timelnCanvas mousemove");
			handleMouseMoveOnTimeLine(e);
		}).on('click', function(e) {
			//console.log("timelnCanvas mousemove");
			handleClickOnTimeLine(e);
		}).on('mousedown', function(e) {
			//console.log("timelnCanvas mousedown");
			handleMousedownOnTimeLine(e);
		});
		
		$("#canvas").on('mousedown', function (e) {
			e.preventDefault();
			dragFlag = true;
			//handleMouseDown(e);
		}).on('mouseup', function(e) {
			e.preventDefault();
			dragFlag = false;;
			//handleMouseUp(e);
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
			//e.preventDefault();
			//alert("mouse click");
			if(isPlayingStoped){
				menuX = parseInt(e.clientX - offsetX);
				menuY = parseInt(e.clientY - offsetY);
				startX = menuX;
				startY = menuY;
				var objectTable = pageObjTable.get(document.getElementById("pagenum").value);
				//console.log("objectTable"+objectTable);
				var objArr = checkPointsInObject(objectTable,true);
				//alert("objArr::;"+objArr);
				//console.log("objArr::;"+objArr);
				if(objArr.length > 0){
					selObjId = objArr[0];
					var id = objectTimeTable.get(selObjId);
					//console.log("id::;"+id);
					if(id != null){
						menuArray1 = null;
					    menuArray1 = new Array();
						menuArray1[0] = "Play From Object";
						createMenu(menuX,menuY);
					}
				}else if(showAnoSymbol){
					objArr = checkPointsInAnnotation(menuX,menuY);
					if(objArr != -1){
						//alert("inside annotation");
						selObjId = objArr;
						var id = objectTimeTable.get(selObjId);
						if(id != null){
							menuArray1 = null;
							menuArray1 = new Array();
							menuArray1[0] = "Play From Object";
							createMenu(menuX,menuY);
						}
					}

				}
			}
			
			/*
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
			*/
		});
	});;

	
	
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
					initSelectedObjState();
					uploadDropedFiles(files,isImage);
				}
				 document.getElementById('myInput').value = "";
			//console.log("Done");
		
		}
	}


function toggleEditObjectTime(){
	var obj = document.getElementById("EditTimerB")
	var pageNumber = document.getElementById("pagenum").value;
	if(obj.className =='fa fa-clock-o fa-lg'){
		obj.className ='fa fa-check-square-o fa-lg';
		isEditTimerEnable = true;
		currentObjId = 7;
		
		ctx.clearRect(0, 0, canvas.width, canvas.height);
		restoreAllRecordedObj(pageNumber);
	}else if(obj.className =='fa fa-check-square-o fa-lg'){
		obj.className ='fa fa-clock-o fa-lg';
		document.getElementById("recordObjTimeDiv").style.display = "none";
		isEditTimerEnable = false;
		setSelectedObjectTime();
		//
		ctx.clearRect(0, 0, canvas.width, canvas.height);
		drawNonRecordingObject(pageNumber);
		restoreAllRecordedObj(pageNumber);
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
				timeRefTable = sortObjectTimeTable(timeRefTable);
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
				if(object.id == 'shapeButton'){
					setId(prevSelShapeId,false);
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
	//console.log("------------Setid---------------"+id);
		//alert("setid"+id);
		//var obj = document.getElementById("closeShapeButton")
		//obj.className = "btn btn-default active";
		switch(id){
		  case 1:
				var obj = document.getElementById("shapeButton");
				prevSelButtonObj.className = "btn btn-default";
				obj.className = "btn btn-default active"
				prevSelButtonObj = obj;
				prevSelShapeId = id;
				document.getElementById("closedShape").innerHTML = "Rectangle";
				isSetIdCalled = state;
			break;
		  case 2:
				var obj = document.getElementById("shapeButton");
				prevSelButtonObj.className = "btn btn-default";
				obj.className = "btn btn-default active"
				prevSelButtonObj = obj;
				prevSelShapeId = id;
				document.getElementById("closedShape").innerHTML = "Oval";
				isSetIdCalled = state;
			break;
		  case 3:
		  
				var obj = document.getElementById("shapeButton");
				prevSelButtonObj.className = "btn btn-default";
				obj.className = "btn btn-default active"
				prevSelButtonObj = obj;
				prevSelShapeId = id;
				document.getElementById("closedShape").innerHTML = "Line";
				isSetIdCalled = state;
		  break;
		  case 4:
				var obj = document.getElementById("pencilButton");
				prevSelButtonObj.className = "btn btn-default";
				obj.className = "btn btn-default active"
				prevSelButtonObj = obj;
				
		  break;
		  case 5:
				var obj = document.getElementById("shapeButton");
				prevSelButtonObj.className = "btn btn-default";
				obj.className = "btn btn-default active"
				prevSelButtonObj = obj;
				prevSelShapeId = id;
				document.getElementById("closedShape").innerHTML = "Triangle(free form)";
				isSetIdCalled = state;
			break;
		  case 6:
				var obj = document.getElementById("shapeButton");
				prevSelButtonObj.className = "btn btn-default";
				obj.className = "btn btn-default active"
				prevSelButtonObj = obj;
				prevSelShapeId = id;
				document.getElementById("closedShape").innerHTML = "Arrow";
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
				var obj = document.getElementById("shapeButton");
				prevSelButtonObj.className = "btn btn-default";
				obj.className = "btn btn-default active"
				prevSelButtonObj = obj;
				prevSelShapeId = id;
				document.getElementById("closedShape").innerHTML = "Arc";
				isSetIdCalled = state;
		  break;
		  case 12:
		 		var obj = document.getElementById("shapeButton");
				prevSelButtonObj.className = "btn btn-default";
				obj.className = "btn btn-default active"
				prevSelButtonObj = obj;	
				prevSelShapeId = id;
				document.getElementById("closedShape").innerHTML = "Circle";
				isSetIdCalled = state;
				
		  break;
		  case 13:
				var obj = document.getElementById("shapeButton");
				prevSelButtonObj.className = "btn btn-default";
				obj.className = "btn btn-default active"
				prevSelButtonObj = obj;
				prevSelShapeId = id;
				document.getElementById("closedShape").innerHTML = "Triangle(equilateral)";
				isSetIdCalled = state;
		  break;
		  case 16:
				//console.log("inside case 16-----");
				var obj = document.getElementById("editorButton");
				prevSelButtonObj.className = "btn btn-default";
				obj.className = "btn btn-default active"
				prevSelButtonObj = obj;
				if(isReplaceEnable){
						var objectTable = pageObjTable.get(document.getElementById("pagenum").value);
						var graphicsObject = objectTable.get(selObjArray[0]);
						init();
						var text = null;
						if(graphicsObject.type == 16){
							text = graphicsObject.text;
						}
						createEditor(graphicsObject.pointsArray,text);
				}else{
					if(selObjArray != null && selObjArray.length >0){
						var objectTable = pageObjTable.get(document.getElementById("pagenum").value);
						var graphicsObject = objectTable.get(selObjArray[0]);
						init();
						//console.log("::::::graphicsObject::::"+graphicsObject);
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
				}
			break;
		 case 23:
				var obj = document.getElementById("shapeButton");
				prevSelButtonObj.className = "btn btn-default";
				obj.className = "btn btn-default active"
				prevSelButtonObj = obj;
				prevSelShapeId = id;
				document.getElementById("closedShape").innerHTML = "Square";
				isSetIdCalled = state;
			break;
		 }
		currentObjId = id;
		document.getElementById("toolOptions1").style.display = "inline-block";
		if(id == 3 || id ==4 || id == 6 || id == 11 ){
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




function toggleReplace(){
var obj  = document.getElementById("replaceStartB");
	if(obj.className =='fa fa-toggle-up fa-lg'){// replace session starts
		if(selObjArray != null && selObjArray.length >0){
			replacedObjArr = null;
			replacedObjArr = new Array();
			// copy all object into array of replaceable object
			copyObjects(selObjArray,replaceableObjArr)
			isReplaceEnable = true;	
			obj.className = "fa fa-toggle-down fa-lg";
		
		}else{
			alert("No object selected for replace");
		}
	}else if(obj.className =='fa fa-toggle-down fa-lg'){// replace session ends
		// check all replaceable object if any one is recorded object
		// then retrieve time stamp and if more than one objects have time stamp then apply min time stamp
		var timeStamp = getReplaceableObjTimestamp();
	    //console.log("timeStamp::::"+timeStamp);
		//console.log("replacedObjArr:::"+replacedObjArr);
		//console.log("timeRefTable:::"+timeRefTable);
		// remove all replaceable object
		removeAllReplaceableObject();
		//console.log("replacedObjArr:::"+pageObjTable.get(document.getElementById("pagenum").value););
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
				//console.log("recordedObjArr::::::::::::::::::"+recordedObjArr);
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
	
		
		isReplaceEnable = false;	
		obj.className = "fa fa-toggle-up fa-lg";
		selObjArray =  null;
		selObjArray = new Array();
		selObjRotatable = true;
	}
	ctx.clearRect(0, 0, canvas.width, canvas.height);
	restore();
}


function removeAllReplaceableObject(){
//console.log("removeAllReplaceableObject replaceableObjArr:::::"+replaceableObjArr);

   for(var i=0;i<replaceableObjArr.length;i++){
		var objId= replaceableObjArr[i];
		var timeStamp = objectTimeTable.get(objId);
		//console.log("objId:::"+objId+"::timeStamp::"+timeStamp);	
		var pageNum = document.getElementById("pagenum").value;
		if(timeStamp != null){ // recording object
			timeRefTable.remove(timeStamp);
			/*var recordedObjArr = timeRefTable.get(timeStamp);
			if(recordedObjArr != null ){
				for(var i=0;i<recordedObjArr.length;i++){
					var pageObj = recordedObjArr[i];
						if(pageObj.objectId == objId){
							recordedObjArr.splice(i,1);
						}
				}
			}
			if(recordedObjArr.length == 0){
				
			}*/
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
	console.log("Can play listener works here ::playingFrom ::"+playingFrom + ":::isPlayingStoped++"+isPlayingStoped);
	//currentObjId = 7;
	
	switch(playingFrom){
				case 1:// Normal play from playing button
					//alert("init player"+isPlayingStoped);
					//console.log("isPlayingStoped::init player:"+isPlayingStoped);
					if(!isPlayingStoped){
						canvas.style.cursor  = "default";
						//console.log("Play file name:::"+myVid.src);
						selObjArray =  null;
						selObjArray = new Array();
						selObjRotatable = true;
						//console.log("@@@@@");
						//enableDisableRelationOptions(false);
						myVid.controls = false;
						clearTimeout(allImageloadingTimer);
						checkAllImagesLoaded();
						
						
					//	document.getElementById("recordButton").className = "recinactive";
						
					}
					playingFrom = -1;
					break;
				case 2: // Play when slider moved
					//console.log("----Current Audio time In Listner-----------------"+currentAudioTime);
					//console.log("playyyyy"+currentAudioTime);
					//alert("done");
					ctx.clearRect(0, 0, canvas.width, canvas.height);
					restore();
					 var playingStartTime = sliderPosition*recFileDuration / sliderLength;
					// alert("sliderPosition::"+sliderPosition);
					// myVid.currentTime  = currentAudioTime;
					var nextObjTime;
					// //console.log("----Current Audio time In Listner-----------------"+currentAudioTime+"::playingStartTime:;"+playingStartTime);
					 if(currentAudioTime != null){
						timeRefTable.moveFirst();
						//console.log("timeRefTable:::::"+timeRefTable);
						var currentPage = document.getElementById("pagenum").value;
						//console.log("33333333333333333333333"+currentPage);
						drawNonRecordingObject(currentPage);
						var objectTable = pageObjTable.get(currentPage);
						playCount = 0;
						while(timeRefTable.next()){
							playCount++;
							//console.log("Key::"+timeRefTable.getKey()+"::currentAudioTime::"+currentAudioTime);
							if(timeRefTable.getKey()<currentAudioTime){
								//console.log("---In-----");
								var recordedObjArr = timeRefTable.getValue();
								for(var i=0;i<recordedObjArr.length;i++){
									var pageObj = recordedObjArr[i];
									if(pageObj.num == currentPage){
										//console.log("-&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&"+pageObj.objectId);
										drawObject(objectTable,pageObj.objectId,false);
									}else{
										continue;
									}
								}
							}else{
								nextObjTime = timeRefTable.getKey();
								playCount--;
								//console.log("nextObjTime:::::"+nextObjTime+"::::currentAudioTime:::"+playingStartTime+":::playCount"+playCount);
								
								//console.log("@@@@@@@@@@@@@@@@@@@");
							//	runningTimerId = setTimeout('checkPageAndDrawObj('+nextObjTime+')',(nextObjTime - playingStartTime));
								
								break;
							}
						}
					
						currentAudioTime = null;
					
						var recordedObjArr = timeRefTable.get(lastDrawnObjTime);
						//alert("lastDrawnObjTime::"+lastDrawnObjTime);
						if(recordedObjArr!= null){
							var pageObj = recordedObjArr[0];
							currentPage = pageObj.num;
						    objectTable = pageObjTable.get(currentPage);
							var graphicsObject = objectTable.get(pageObj.objectId);
							//alert("pageObj::"+graphicsObject);
							//glowSelectedObject(graphicsObject);
								
						}
						
					//	alert("play fron shape"+isFForRW);
						//console.log("::::::::::sliderMoveTime:::::::::"+sliderMoveTime);
						/*
						if(sliderMoveTime ==  null){
							sliderMoveTime = recFileDuration / sliderLength;
						}*/
						
						myVid.controls = false;
						//console.log("-----playerState----case 2-----"+playerState);
						if(playerState == 2){
							runningTimerId = setTimeout('checkPageAndDrawObj('+nextObjTime+')',(nextObjTime - playingStartTime));
							myVid.play();
							//document.getElementById("recordButton").className = "recinactive";
							isPlayingStoped = false;
							document.getElementById("playpauseBut").className  = "fa fa-lg fa-pause";
							startSlide();
						}else{
							lastDrawnObjTime = nextObjTime ;
							//console.log("-----else case paused-------"+lastDrawnObjTime);
						}
						
						/*
						if(isFForRW){
							//alert("pause after FF Or RW");
							var obj = document.getElementById("playpauseBut");
							obj.className  = "fa fa-lg fa-play-circle";
							pausePlaying();
							isFForRW = false;
						//clearTimeout(runningTimerId);
						}
						*/
						//alert("done");
			
					}
					playingFrom = -1;
					break;
				case 3: // Play when play from shape works
					
					if(selObjArray[0] ==  null){
						selObjArray[0] = selObjId;
					}
					var id = objectTimeTable.get(selObjArray[0]);
					//myVid.play();
					
					//console.log("Play from object"+playerState);
					myVid.controls = false;
					if(playerState == 2){
						myVid.play();
						//document.getElementById("recordButton").className = "recinactive";
						isPlayingStoped = false;
						document.getElementById("playpauseBut2").className  = "fa fa-lg fa-pause";
						if(sliderMoveTime ==  null){
							sliderMoveTime = recFileDuration / sliderLength;
						}
						checkAndMergeTimeRefTable();
						timeRefTable = sortObjectTimeTable(timeRefTable);
						restoreAndPlayObject(id);
					}else{
						lastDrawnObjTime = id;
						restoreAndDrawRecAndNonRecObj(id);
						refreshTimeLine(lastDrawnObjTime);
					}
					selObjArray =  null;
					selObjArray = new Array();
					selObjRotatable = true;
					//console.log("!!!!");
					//enableDisableRelationOptions(false);
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
		//alert("hiiiiiiii");
	     isPlayingStoped = true;
		 $( "#playpause2" ).click();
		 //document.getElementById("playpauseBut").className  = "fa fa-lg fa-play-circle";
		 
		 nextPlayingObjKey  = null;
		 nextPlayingObjtime = null;
		 /*
		 isPaused = false;
		 startTime = 0;
		 clearTimeout(runningTimerId);	
		
		 lastDrawnObjTime = null;
		// clearTimeout(sliderTimer);
		 stopSlide();
		 clearTimeout(playerTimer);
		 checkAndMergeTimeRefTable();
		 timeRefTable = sortObjectTimeTable(timeRefTable);
		 //document.getElementById("recordButton").className = "record";
		 document.getElementById("cTime").innerHTML = "<b>00:00</b>";
		 sliderPosition = 0;
		 refreshTimeLine(-1);
		 pointerImg.style.left = -50 +"px";
		 pointerImg.style.top = -50 + "px";
		 pointerX = 0;
		 pointerY = 0;
		 //jQuery('#ex1').slider('setValue',sliderPos);
		 // Sort timeReftable to manage new attach object while playing
		 timeRefTable= sortObjectTimeTable(timeRefTable);
		// isDrawing = true;
		*/
		stopPlaying();
		
	});
	myVid.addEventListener("loadedmetadata", function(_event) {
		//alert("loadedmetadata called");
			//console.log("loadedmetadata called"+myVid.src);
			var duration = myVid.duration;
			recFileDuration = duration * 1000;
			duration = getDurationInMinAndSec(recFileDuration);
			var pageNum  = getFirstPage();
			activePage = pageNum;
			createTimeLine();
			if(recSaved){
			$('#recording-Modal').modal('hide'); 
				recSaved = false;
			}
			/*
			var time = Math.round(duration);
			var min = Math.floor(time / 60);
			var sec = time % 60;
			*/
			//console.log("loadedmetadata called"+duration);
			if(recFileDuration >0){
				//document.getElementById("rwButton").disabled = false;
				//document.getElementById("recordButton").className = "record";
				//document.getElementById("stopButton").disabled = false;
				document.getElementById("playpause").disabled = false;
				//document.getElementById("ffButton").disabled = false;
			}
			document.getElementById("eTime").innerHTML = "<b>"+duration+"</b>";
			document.getElementById("cTime").innerHTML = "00:00";
			
			switch(playingFrom){
					case 1:
						break;
					case 2://  when slider moved
						//console.log("-----loadedmetadata------sliderPos-------"+sliderPos+"::recFileDuration::"+recFileDuration);
						currentAudioTime  = sliderPos*recFileDuration / sliderLength;
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
		//alert("play ");
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
				//console.log("id:%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"+selObjArray);
				if(id== null){
					alert("------Selcted Object is not playable----------");
				}else{
					playingFrom = 3;
					playerState = 2;
					/*var lineLength =  window.innerWidth - 80;
					sliderPos = Math.floor((lineLength * id)/recFileDuration);*/
					//console.log("slider poition::"+sliderPos);
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
						var graphicsObjToLoad = null;
						var urlToLoad = null;
		  		  		for(i=0;i<pageCount;i++){
		  		  			var pageNum = currentpage + (i);
		  		  			var url = imageUrl + "&a=bi&pagenumber="+(i+1);
		  		  			/*
							if(i==0)
		  		  			 	tempArray = insertImageObj(pageNum,url);
		  		  			else*/
							/*
								tempArray = null;
								tempArray =  new Array();
								tempArray[0] = imageX;
								tempArray[1] = imageY;
								tempArray[2] = canvas.width - imageX;
								tempArray[3] = canvas.height - (2*imageY);
								*/
								var graphicsObj = insertImageObj(pageNum,url,false,fileName);
								//console.log("currentpage ::::"+currentpage);
								if(currentpage == pageNum){
									graphicsObjToLoad = graphicsObj;
									urlToLoad = url;
								}
								
		  		  		}
						loadImage(urlToLoad,graphicsObjToLoad.id);
						
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
		//alert("url::"+url);
		/*tempArray = null;
		tempArray =  new Array();
		tempArray[0] = imageX;
		tempArray[1] = imageY;
		tempArray[2] = canvas.width - imageX;
		tempArray[3] = canvas.height - (2*imageY);*/
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
		  			//alert(msg.uploadFileName);
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



function showUploadModal(fileType){
	//console.log("hiii"+fileType);
	$('#progress-Modal').modal('show');
	document.getElementById("fileType").innerHTML= '<strong>'+ fileType +'</strong>';
	if(fileType == 'Video'){
		document.getElementById("uploadMsg").innerHTML=  "File uploading..Audio will be extracted if the file is a video." ;
	}else{
		document.getElementById("uploadMsg").innerHTML=  'Please Wait while the file is being uploaded.' ;
	}
		
}

function showSaveModal(fileType){
	if(fileType == 'error'){
		document.getElementById("saveMsg").innerHTML =  "Error occured while saving." ;
	}else if (fileType == 'success'){
		document.getElementById("saveMsg").innerHTML =  "Your Lecture has been saved." ;
	}
	setTimeout('hideSaveModal()',1000);	
}

function hideSaveModal(){
$('#save-Modal').modal('hide');
document.getElementById("saveMsg").innerHTML =  'Saving Lecture...';
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
		}else if(currentObjId == 12){
				// this code needs to review
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
					
		}else if(currentObjId == 1 || currentObjId == 2 ||currentObjId == 23){
				tempPointsArray[tempPointsArray.length] = tempCirclePointsArray[0];
				tempPointsArray[tempPointsArray.length] = tempCirclePointsArray[1];
				tempPointsArray[tempPointsArray.length] = tempCirclePointsArray[2];
				tempPointsArray[tempPointsArray.length] = tempCirclePointsArray[3];
				tempPointsArray[tempPointsArray.length] = tempCirclePointsArray[4];
				tempPointsArray[tempPointsArray.length] = tempCirclePointsArray[5];
				tempPointsArray[tempPointsArray.length] = tempCirclePointsArray[6];
				tempPointsArray[tempPointsArray.length] = tempCirclePointsArray[7];
				tempCirclePointsArray = new Array();
		
		}else if(currentObjId == 13){
				tempPointsArray[tempPointsArray.length] = tempCirclePointsArray[0];
				tempPointsArray[tempPointsArray.length] = tempCirclePointsArray[1];
				tempPointsArray[tempPointsArray.length] = tempCirclePointsArray[2];
				tempPointsArray[tempPointsArray.length] = tempCirclePointsArray[3];
				tempPointsArray[tempPointsArray.length] = tempCirclePointsArray[4];
				tempPointsArray[tempPointsArray.length] = tempCirclePointsArray[5];
		}else{
				tempPointsArray[tempPointsArray.length] = startX;
				tempPointsArray[tempPointsArray.length] = startY;
				tempPointsArray[tempPointsArray.length] = mouseX;
				tempPointsArray[tempPointsArray.length] = mouseY;
				
				
		}
		//console.log("tempPointsArray:111111::"+tempPointsArray);
		if(currentObjId != 7){
			count++;
			var isFilled = false;
			if(fillColor != null){
				isFilled = true;
			}
			if(currentObjId == 3 || currentObjId ==4 || currentObjId == 6 || currentObjId == 11 ){
				isFilled = false;
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
			if(objectTable != null && startX != null && startY != null){
				//console.log("startX::;"+startX+":::startY::"+startY);
				checkObject(objectTable,startX,startY,mouseX,mouseY);
				//console.log("selected object: mouse up:"+selObjArray);
				if(selObjArray!= null){
					for(var i=0;i<selObjArray.length;i++){
						var graphicsObject = objectTable.get(selObjArray[i]);
						if(!(graphicsObject.type == 8 || graphicsObject.type == 12 || graphicsObject.type == 16)){
							selObjRotatable = false;
						}
						showSelectedObject(graphicsObject);
					}
					//console.log("5555");
					enableDisableRelationOptions(true);
				}
			}
			startX = null;
			startY = null;
		}
		if(!isPlayingStoped ){// Inserting object while playing
				currentMiliSec = Math.floor(myVid.currentTime * 1000);
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
			if(objectTable != null && startX != null && startY != null){
				//console.log("startX::;"+startX+":::startY::"+startY);
				checkObject(objectTable,startX,startY,mouseX,mouseY);
				//console.log("checkObject objjjjjjjjjjjjjj"+selObjArray);
				if(selObjArray!= null && selObjArray.length > 0){
					for(var i=0;i<selObjArray.length;i++){
						var graphicsObject = objectTable.get(selObjArray[i]);
						if(!(graphicsObject.type == 8 || graphicsObject.type == 12 || graphicsObject.type == 16)){
							
							selObjRotatable = false;
							//console.log("selObjRotatable::4444:::"+selObjRotatable);
						}
						showSelectedObject(graphicsObject);
					}
					//console.log("4444444"+selObjRotatable);
					enableDisableRelationOptions(true);
				}
			}
			startX = null;
			startY = null;
		}
		
  }
}

function handleMouseMove(e) {
/*
//console.log("isDrawing:::::"+isDrawing+":currentObjId"+currentObjId+":dragFlag:"+dragFlag);
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
			if(!isPlayingStoped ){// Inserting object while playing
				var currentMiliSec =Math.floor(myVid.currentTime * 1000);
				restoreRecordedObj(currentMiliSec);
			}
		}
	}else{
		if(currentObjId == 7){
			var mouseX = parseInt(e.clientX - offsetX);
			var mouseY = parseInt(e.clientY - offsetY);
			var objectTable = pageObjTable.get(document.getElementById("pagenum").value);
			//checkOpenObjectForSelection(objectTable,mouseX,mouseY);
			if(dragFlag){
				//console.log("mouse move::"+strechableObj);
				if(strechableObj.length >0 && strechableObj[0] != null && dragFlag){
					if(isRotaionEnable){
					    removeNonRotationalObjectFromSel();
						//console.log("selObjArray:::"+selObjArray);
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
				checkOpenObjectForSelection(objectTable,mouseX,mouseY);
				
				if(selObjArray != null && selObjArray.length>0 ){
					if(isZoomEnable){
						checkSelectedObjectZoomableState(objectTable,mouseX,mouseY);
					}else{
						checkSelectedObjectStrechableState(objectTable,mouseX,mouseY);
					}
					
				}
			}
		}
	
	}*/
	if(isPlayingStoped && sliderPosition == 0){
		var mouseX = parseInt(e.clientX - offsetX);
		var mouseY = parseInt(e.clientY - offsetY);	
		pointsOnMenu = checkPointsOnMenuItem(mouseX,mouseY);
		/*
		if(ret != -1){
			//console.log("Points on Submenu:::"+ret);
			isPointsOnMenu = 
		}else{
		}*/
		
		
		var objectTable = pageObjTable.get(document.getElementById("pagenum").value);	
		
		startX = mouseX;
		startY = mouseY;
		
		var objArr = checkPointsInObject(objectTable,true);
		if(objArr.length != 0){
				selObjArray = null;
				selObjArray = new Array();
				selObjArray[selObjArray.length] = objArr[0];
			if(isPlayingStoped ){
				ctx.clearRect(0, 0, canvas.width, canvas.height);
				restore();
				var objectTable = pageObjTable.get(document.getElementById("pagenum").value);
				var graphicsObject = objectTable.get(objArr[0]);
				//drawObject(objectTable,selObjArray[0],true);
				//console.log("mouse move----------glowSelectedObject---------");	
				glowSelectedObject(graphicsObject);
				var objTime = objectTimeTable.get(objArr[0]);
				//console.log("objTime:::::"+objTime + "lastDrawnObjTime::"+lastDrawnObjTime);
				if(objTime != null){
					checkPageObject(objTime,false);
					refreshTimeLine(objTime);
				}
			}else{
				var objTime = objectTimeTable.get(objArr[0]);
				//console.log("objTime:::::"+objTime + "lastDrawnObjTime::"+lastDrawnObjTime);
				if(objTime ==  null || objTime < lastDrawnObjTime){
					//console.log("glow objjjjjjjjjjjjjjjjjjjjjjjjj");
					ctx.clearRect(0, 0, canvas.width, canvas.height);
					drawNonRecordingObject(document.getElementById("pagenum").value);
					restoreRecordedObj(lastDrawnObjTime,document.getElementById("pagenum").value);
					var objectTable = pageObjTable.get(document.getElementById("pagenum").value);
					for(var i=0;i<selObjArray.length;i++){
						var graphicsObject = objectTable.get(selObjArray[i]);
							//drawObject(objectTable,selObjArray[i],false);
							//console.log("selObjArray::::"+selObjArray);
							
							glowSelectedObject(graphicsObject);
							checkPageObject(objTime,false);
							refreshTimeLine(objTime);
							//glowTimerId = setTimeout('restoreGlowObject()',2000);
							
					}
				}
				
			}
			
			
			
		}else{
			if(isPlayingStoped ){
				selObjArray = null;
				selObjArray = new Array();
				ctx.clearRect(0, 0, canvas.width, canvas.height);
				restore();
			}else{
				if(lastDrawnObjTime	!= null){
					ctx.clearRect(0, 0, canvas.width, canvas.height);
					drawNonRecordingObject(document.getElementById("pagenum").value);
					restoreRecordedObj(lastDrawnObjTime,document.getElementById("pagenum").value);
				}
			}
			
		}
		if(showAnoSymbol){
		    //console.log("showAllAnnotationSymbol");
			showAllAnnotationSymbol();
		}
		if(menuObjectArr != null && menuObjectArr.length > 0){
		 //console.log("createMenu");
		 	menuArray1 = null;
			menuArray1 = new Array();
			menuArray1[0] = "Play From Object";
			createMenu(menuX,menuY);
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
		//console.log("checkPointsInObject---Selected Object:::"+objArr);
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
							selObjRotatable = true;
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
					
					//Set Object Attribute in dropdown menu
					setObjectAttributeMenuOption(graphicsObject);
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
				if(!(graphicsObject.type == 8 || graphicsObject.type == 12 || graphicsObject.type == 16)){
					selObjRotatable = false;
					//console.log("selObjRotatable::3333:::"+selObjRotatable);
				}
				showSelectedObject(graphicsObject);
				
			}
			//console.log("33333333");
			enableDisableRelationOptions(true);
	}else{
		initSelectedObjState();
	}
}
function initSelectedObjState(){
	//console.log("initSelectedObjState called");
	selObjArray =  null;
	selObjArray = new Array();
	selObjRotatable = true;
	strechableObj[0] = null;
	strechableObj[1] = null;
	strechableObj[2] = null;
	ctx.clearRect(0, 0, canvas.width, canvas.height);
	restore();
	//console.log("####");
	enableDisableRelationOptions(false);
	setZoomEnableDisable(false);
}


	
//function getBoundedRectQuardinate(pointsArray){

function editRecordedObjectTime(objArr){
	var time = objectTimeTable.get(objArr[0]);
	if(time == null){
		alert("Selected object is not recorded object");
	}else{
		selObjArray = null;
		selObjArray = new Array();
		selObjRotatable = true;
		selObjArray[selObjArray.length] = objArr[0];
		ctx.clearRect(0, 0, canvas.width, canvas.height);
		restore();
		document.getElementById("selRecordObj").value = time;
		document.getElementById("recordObjTimeDiv").style.display = "inline-block";
		var objectTable = pageObjTable.get(document.getElementById("pagenum").value);
		var graphicsObject = objectTable.get(objArr[0]);
		drawObject(objectTable,selObjArray[0],false);
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


	
function createObject(id,startx,starty,mouseX,mouseY,endX,endY,text){
	//console.log("createObject---------------id----"+id+"startx:"+startx+"::starty::"+starty+"::mouseX::"+mouseX+"::mouseY:;"+mouseY);
	ctx.save();
	ctx.restore();
	//console.log("createObject:::"+globalAlpha);
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
			
			
			createRectangleNew(startx, starty, cx, cy, mouseX , mouseY , dx, dy);
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
					tempCirclePointsArray[0] = startx;
					tempCirclePointsArray[1] = starty;
					tempCirclePointsArray[2] = mouseX;
					tempCirclePointsArray[3] = mouseY;
					tempCirclePointsArray[4] = thirdPoint.x3;
					tempCirclePointsArray[5] = thirdPoint.y3;
					
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
			var x1= startx + r;
			var y1 = starty + r;
			var x2 = startx - r;
			var y2 = starty + r;
			var x3 = startx - r;
			var y3 = starty - r;
			var x4 = startx + r;
			var y4 = starty - r; 
			if(checkSquareBoundryInCanvas(x1,y1,x2,y2,x3,y3,x4,y4)){
				ctx.clearRect(0, 0, canvas.width, canvas.height);
				restore();
				ctx.beginPath();
				ctx.lineCap = 'butt';
				ctx.lineJoin = 'miter';
				ctx.strokeStyle = styleColor;
				ctx.lineWidth= lineWidth;
				ctx.globalAlpha = globalAlpha;
				
				tempCirclePointsArray[0] = x1;
				tempCirclePointsArray[1] = y1;
				tempCirclePointsArray[2] = x2;
				tempCirclePointsArray[3] = y2;
				tempCirclePointsArray[4] = x3;
				tempCirclePointsArray[5] = y3;
				tempCirclePointsArray[6] = x4;
				tempCirclePointsArray[7] = y4;
				
				isSquareCreated  = true;
				createSquare(tempCirclePointsArray[0], tempCirclePointsArray[1], tempCirclePointsArray[2], tempCirclePointsArray[3], tempCirclePointsArray[4] , tempCirclePointsArray[5] , tempCirclePointsArray[6], tempCirclePointsArray[7]);
				if(fillColor != null){
					ctx.fillStyle = fillColor;
					ctx.fill();
				}
				ctx.closePath();
				ctx.stroke();
			
		}else{
			isSquareCreated  = false;
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

function checkPointsInCanvas(x11,y11,x22,y22){
	
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

function checkCircleBoundryInCanvas(x1,y1,x2,y2){
	var r = distanceBetween(x1, y1, x2, y2);
	var x11 = x1+r;
	var x22 = x1-r;
	var y11 = y1+r;
	var y22 = y1-r;
	
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
	
function checkSquareBoundryInCanvas(x1,y1,x2,y2,x3,y3,x4,y4){
	var chk1 = point_in_rectagnle(x1,y1,canvasBoundedRectanglePoints[0],canvasBoundedRectanglePoints[1],canvasBoundedRectanglePoints[2],canvasBoundedRectanglePoints[3]);
	var chk2 = point_in_rectagnle(x2,y2,canvasBoundedRectanglePoints[0],canvasBoundedRectanglePoints[1],canvasBoundedRectanglePoints[2],canvasBoundedRectanglePoints[3])
	var chk3 = point_in_rectagnle(x3,y3,canvasBoundedRectanglePoints[0],canvasBoundedRectanglePoints[1],canvasBoundedRectanglePoints[2],canvasBoundedRectanglePoints[3])
	var chk4 = point_in_rectagnle(x3,y3,canvasBoundedRectanglePoints[0],canvasBoundedRectanglePoints[1],canvasBoundedRectanglePoints[2],canvasBoundedRectanglePoints[3])
	return (chk1 && chk2 && chk3 && chk4 )
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
function restoreSelectedObject(){
	//console.log("restore selected Object");
	var objectTable = pageObjTable.get(document.getElementById("pagenum").value);
	//console.log("restore----------------------Page Number----------------------------------"+document.getElementById("pagenum").value);
	//console.log("restore--------------------------------------------------------"+objectTable);
	if(objectTable != null){
		objectTable.moveFirst();
		while(objectTable.next()){
		if(selObjArray != null){
		   for(var i=0;i<selObjArray.length;i++){
			  if(objectTable.getKey() == selObjArray[i]){
				 drawObject(objectTable,objectTable.getKey(),false);
				 showSelectedObject(objectTable.getValue());
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
				restoreRecordedObj(key,pageObj.num);
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
		/*
		ctx.strokeStyle = "green";
		ctx.lineWidth= parseInt(graphicsObject.lineWidth) + 10;
		//console.log("ctx.lineWidth::::::"+ctx.lineWidth);
		ctx.globalAlpha = 1.0;
		
		*/
		
		
		//ctx.setLineDash([0]);
	}else{
	   //console.log("drawObject:;"+graphicsObject.color+"::line width:::"+graphicsObject.lineWidth);
		ctx.strokeStyle = graphicsObject.color;
		ctx.lineWidth = graphicsObject.lineWidth;
		if(graphicsObject.opacity != null){
			ctx.globalAlpha = graphicsObject.opacity;
		}else{
			ctx.globalAlpha = 1.0;
		}
		//ctx.setLineDash([0]);
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
					createRectangleNew(pointsArr[0], pointsArr[1], pointsArr[2], pointsArr[3], pointsArr[4], pointsArr[5], pointsArr[6], pointsArr[7]);
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

					//console.log("draw Image-----Id ::::"+tempArray);
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
				
			/*	
			if(highlight){
				glowObject();
				glowTimerId = setTimeout('restoreGlowObject()',2000);
			}	*/		
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
function ImageObject(src,isloaded,timerId,canvas){
	this.src = src;
	this.isloaded = isloaded;
	this.timerId = timerId;
	this.canvas = canvas;
}
function TimeLineObject(type,pointsArray,timeRef){
	this.type = type;
	this.pointsArray = pointsArray;
	this.timeRef = timeRef;
}

function MenuObject(type,pointsArray){
	this.type = type;
	this.pointsArray = pointsArray;
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
			selObjRotatable = true;
			ctx.clearRect(0, 0, canvas.width, canvas.height);
			restore();
			//console.log("$$$$");
			enableDisableRelationOptions(false);
			//handleZoomButton(false);
			setZoomEnableDisable(false);
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

function createRectangle(x1,y1,x2,y2){
	//console.log("x1::"+x1+"::y1::"+y1 +"::x2::"+x2+"::y2::"+y2);
	ctx.rect(x1, y1,x2-x1,y2-y1);
	//console.log("Rectangle Created");

}

function createRectangleNew(x1,y1,x2,y2,x3,y3,x4,y4){
    //console.log("createRectangleNew:;"+x1+","+y1+","+x2+","+y2+","+x3+","+y3+","+x4+","+y4);
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
			isPlayingStoped = true;
			startTime = 0;
			stopSlide();
			clearTimeout(playerTimer);
			document.getElementById("cTime").innerHTML = "<b>00:00</b>";
			//document.getElementById("recordButton").className = "record";
			sliderPosition = 0;
			//alert("runningTimerId::"+runningTimerId);
			if(runningTimerId != null){
				clearTimeout(runningTimerId);
				var pageNum  = getFirstPage();
				activePage = pageNum;
				document.getElementById("pagenum").value = pageNum;
				//alert("pageNum::"+pageNum);
				refreshTimeLine(-1);
				lastDrawnObjTime = 0;
			}
			//console.log("myVid::::"+myVid);
			myVid.pause();
			myVid.currentTime = 0;
			isPaused = false;
			pointerImg.style.left = -50 +"px";
			pointerImg.style.top = -50 + "px";
			pointerX = 0;
			pointerY = 0;
			checkAndMergeTimeRefTable();
			timeRefTable = sortObjectTimeTable(timeRefTable);
			//checkAndMergeTimeRefTable();
			var pageNumber = document.getElementById("pagenum").value;
			//console.log("6666666666666666666666666666666");
			drawNonRecordingObject(pageNumber);
			restoreAllRecordedObj(pageNumber);
			document.getElementById("playpauseBut2").className  = "fa fa-lg fa-play-circle";
			jQuery('#ex1').slider('setValue',sliderPos);
		
	}

}


function togglePlayPause(obj){
 
 //alert("---hiiiii-----");
 //console.log(":togglePlayPause:selObjArray:"+selObjArray);
 if(!isRecRunning && recFileDuration >0){
	  //console.log(":::togglePlayPause-------isRecRunning::"+recFileDuration);
 	   if(obj.className  == "fa fa-lg fa-pause"){
		obj.className  = "fa fa-lg fa-play-circle";
		pausePlaying();
	  }else{
		obj.className  = "fa fa-lg fa-pause";
		playObject();
	  }
 }
 
}
function startSlide(){
	if(sliderMoveTime ==  null){
		sliderMoveTime = recFileDuration /sliderLength;
	}
	sliderTimer = HighResolutionTimer({
		duration: sliderMoveTime,
		callback: moveSlider,
	});
	sliderTimer.run();
}
function stopSlide(){
	if(sliderTimer != null){
		sliderTimer.stop();
	}
}

function moveSlider(){
	//console.log("move slider::"+myVid.currentTime);
	var lineLength = sliderLength;
	sliderPosition = Math.floor((lineLength * myVid.currentTime * 1000)/recFileDuration);
	//console.log("move slider"+myVid.currentTime);
	if(lastDrawnObjTime  != null){
		refreshTimeLine(lastDrawnObjTime);
	}else{
		refreshTimeLine(-1);
	}
}


function pausePlaying(){
	var keys=  timeRefTable.keys;
	//console.log("-----------------------------------pausePlaying------------------------------------------"+keys);
	isPaused = true;
	myVid.pause();
	clearTimeout(runningTimerId);
	//console.log(" clearTimeout(sliderTimer)333333333333");	
	//clearTimeout(sliderTimer);
	stopSlide();
	playerState = 1;
	clearTimeout(playerTimer);	
	var currentTime = new Date().getTime();
	nextPlayingObjtime = currentTime - startTime;
	//console.log("------currentTime---"+currentTime+"----------startTime------------"+startTime+"------nextPlayingObjtime-----"+nextPlayingObjtime);
}


  function playObject(){
  	isPlayingStoped = false;
	//alert("play object"+isPaused);
	//console.log("--------------isPaused------------------------------------------"+isPaused+"::playFromSlide::"+playFromSlide);
	//console.log("isPaused:::::::::::::::"+isPaused);
	myVid.pause();
	playerState = 2;
	if(isPaused == false){	
		//console.log("---------playObject11111111------------");
		if(isPlayFromObject){
		//alert("1");
			selObjArray[selObjArray.length] = playFronObjId;
			playfromObject();
			isPlayFromObject = false;
		}else if(playFromSlide){
		//alert("2");
			playFromPage();
			playFromSlide = false;
		}else{
			//alert("3");
			ctx.clearRect(0, 0, canvas.width, canvas.height);
			document.getElementById("pagenum").value = 1
			document.getElementById("pagenumber").innerHTML = 1;
			canvas.style.cursor  = "wait";
			playingFrom = 1;
			//sliderPos = 0;
			//alert("sliderPos::"+sliderPosition);
			//myVid=document.getElementById("audio1");
			myVid.src = "http://"+window.location.host+"/"+filename;
			if(sliderPosition != 0){
				currentAudioTime  = sliderPosition*recFileDuration / sliderLength;
				//console.log("-----------currentAudioTime-------"+currentAudioTime);
				currentAudioTime =  Math.ceil(currentAudioTime / 1000);
				myVid.currentTime  = currentAudioTime;
			}
			//console.log("myVid.src:::"+myVid.src);
		}
	}else{
	   //console.log("---------playObject222222222------------"+nextPlayingObjKey);
		isPaused = false;
		myVid.play();
		startSlide();
		
		if(nextPlayingObjKey != null){
			var keys=  timeRefTable.keys;
			var i;
			for(i=0;i<keys.length;i++){
				if(nextPlayingObjKey == keys[i]){
					break;
				}
			}	
			//console.log("keys[i]::"+keys[i]+"::keys[i-1]::"+keys[i-1]);
			//console.log("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"+nextPlayingObjtime+"------nextPlayingObjKey-------"+nextPlayingObjKey);
			var nextObjRendringTime = (keys[i] - keys[i-1]) - nextPlayingObjtime;
			//console.log("nextObjRendringTime:::::"+nextObjRendringTime);
		
			runningTimerId = setTimeout('checkPageAndDrawObj('+nextPlayingObjKey+')',nextObjRendringTime);
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
		/*//////////////////console.log.log("Can play listener works here"+isPlayingStoped);
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
	lastDrawnObjTime = key;
	//console.log("restoreAndPlayObject::::"+key);
	//alert("key:::"+key);
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
		drawNonRecordingObject(pageObj.num);
		restoreRecordedObj(key,pageObj.num);
		for(var i=0;i<recordedObjArr.length;i++){
			var pageObj = recordedObjArr[i];
			drawObject(objectTable,pageObj.objectId,false);
		}
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
			var lineLength =  window.innerWidth - 80;
			sliderPos =  Math.floor(key * lineLength/recFileDuration);
			
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
		//console.log("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"+recordedObjArr.length);
		for(var i=0;i<recordedObjArr.length;i++){
			
			pageObj = recordedObjArr[i];
			if(i == 0){
				var graphicsObject = objectTable.get(pageObj.objectId);
				//console.log("graphicsObject::::"+graphicsObject);
				var pointsArray = graphicsObject.pointsArray;
			
				if( pointsArray != null){	
				//console.log("pointerX::"+pointerX+"::pointerY:;"+pointerY+":;pointsArray[0]::"+pointsArray[0]+"::pointsArray[3]:"+pointsArray[3]);
					currentPointerPath = getPointsOnPointerPath(pointerX,pointerY,pointsArray[0],pointsArray[3],50);
					clearTimeout(pointerTimerId);	
					pointCtr = 0;
					//console.log("currentPointerPath::::"+currentPointerPath);
					drawPointerPath();
				}
			}
			//console.log("-777777777777777777");
			drawObject(objectTable,pageObj.objectId,false);
			currObjTimeOntmLine = key;
			checkPageObject(key,false);
			refreshTimeLine(key);
			lastDrawnObjTime = key;
			//console.log("checkPageAndDrawObj()::111:lastDrawnObjTime:::"+lastDrawnObjTime);
		}
		restoreInsertedObjectInStream(pageObj.num);
	}else{
		//console.log("*********************************************"+document.getElementById("pagenum").value);
		document.getElementById("pagenum").value = pageObj.num;
		document.getElementById("pagenumber").innerHTML = pageObj.num;
		ctx.clearRect(0, 0, canvas.width, canvas.height);
		//console.log("8888888888888888888888888888888");
		drawNonRecordingObject(pageObj.num);
		restoreRecordedObj(key,pageObj.num);
		//console.log("-888888888888888888888");
		drawObject(objectTable,pageObj.objectId,false);
		checkPageObject(key,false);
		refreshTimeLine(key);
		lastDrawnObjTime = key;
		//console.log("checkPageAndDrawObj()::222:lastDrawnObjTime:::"+lastDrawnObjTime);
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

function restoreRecordedObj(timestamp,currentPage){
	timeRefTable.moveFirst();
    //console.log("--------------restoreRecordedObj:::::"+timestamp);
	//var currentPage = document.getElementById("pagenum").value;
	var objectTable = pageObjTable.get(currentPage);
	while(timeRefTable.next()){
		
		if(parseInt(timeRefTable.getKey())< parseInt(timestamp)){
			//console.log("object Drawn");
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
				case 8:
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
				case 13:
					var pointsArr = graphicsObject.pointsArray;
					for(i=0;i<pointsArr.length;i=i+2){
							if(point_in_rectagnle(pointsArr[i], pointsArr[i+1],startX,startY,mouseX,mouseY)){
								selObjArray[selObjArray.length] = objectTable.getKey();
								//console.log("selObjArray:::"+selObjArray);
								break;
							}
					}
					break;		
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
				case 23:
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
			if(isReplaceEnable){
				replacedObjArr[replacedObjArr.length] = count;
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

function createGlowText(textObj,startX,startY,color){
	//console.log("createText text::"+textObj.textData+":::styleColor::"+color+ "textObj.fontSize::"+textObj.fontSize+"::textObj.fontType::"+textObj.fontType);
	
	ctx.save();
	ctx.fillStyle = color;
	ctx.globalAlpha = 1.0;
	var decoration = "";
	if(textObj.isItalic){
		decoration = decoration + "italic ";
	}
	if(textObj.isBold){
		decoration = decoration + "bold ";
	}
	
	var size = parseInt(textObj.fontSize) + 2;
	ctx.font = decoration + (size) + "px "+textObj.fontType;
	ctx.shadowColor = '#5C5B5E';
	ctx.shadowBlur = 20;
	ctx.shadowOffsetX = 0;
	ctx.shadowOffsetY = 0;
	ctx.stroke();
	ctx.fillText(textObj.textData,startX,startY);
	var metrics = ctx.measureText(textObj.textData);
    textWidth = metrics.width;
	ctx.restore();
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
	if(objectTable.size() == 0){
		pageObjTable.remove(pageNum);
	}
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
 selObjRotatable = true;
 restore();
 //console.log("%%%%");
 enableDisableRelationOptions(false);
 handleZoomButton(false);
}

function selectAllObject(objectTable){
//console.log("objectTable::"+selObjRotatable);
 
  selObjArray =  null;
  selObjArray = new Array();
  selObjRotatable = false;
  if(objectTable != null){
   objectTable.moveFirst();
   while(objectTable.next()){
   //console.log("Type::;"+objectTable.getValue().type);
		var graphicsObject = objectTable.getValue();
		if(graphicsObject.type != 10){
			selObjArray[selObjArray.length] = objectTable.getKey();
			showSelectedObject(graphicsObject);
		}
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
		editObject(graphicsObject,object[1],object[2],mouseX,mouseY,null,null,null);
		
		graphicsObject.pointsArray[0] = object[1];
		graphicsObject.pointsArray[1] = object[2];
		graphicsObject.pointsArray[2] = mouseX;
		graphicsObject.pointsArray[3] = mouseY;
		showSelectedObject(graphicsObject);
	}else if(graphicsObject.type == 5 || graphicsObject.type ==11 ){
		//console.log("Stretch Object---Triangle");
		if(object[1] == 0 && object[2] == 1){
			editObject(graphicsObject,mouseX,mouseY,graphicsObject.pointsArray[2],graphicsObject.pointsArray[3],graphicsObject.pointsArray[4],graphicsObject.pointsArray[5],null);
			graphicsObject.pointsArray[0] = mouseX;
			graphicsObject.pointsArray[1] = mouseY;
		}else if(object[1] == 2 && object[2] == 3){
			editObject(graphicsObject,graphicsObject.pointsArray[0],graphicsObject.pointsArray[1],mouseX,mouseY,graphicsObject.pointsArray[4],graphicsObject.pointsArray[5],null);
			graphicsObject.pointsArray[2] = mouseX;
			graphicsObject.pointsArray[3] = mouseY;
		}else if(object[1] == 4 && object[2] == 5){
			editObject(graphicsObject,graphicsObject.pointsArray[0],graphicsObject.pointsArray[1],graphicsObject.pointsArray[2],graphicsObject.pointsArray[3],mouseX,mouseY,null);
			graphicsObject.pointsArray[4] = mouseX;
			graphicsObject.pointsArray[5] = mouseY;
		
		}
			
		showSelectedObject(graphicsObject);
	}else if(graphicsObject.type == 6){
		   //console.log("object[3]:::;"+object[3]);
			if(object[3] != null && object[3] == true){
				editObject(graphicsObject,mouseX,mouseY,object[1],object[2],null,null,null);
				graphicsObject.pointsArray[0] = mouseX;
				graphicsObject.pointsArray[1] = mouseY;
				graphicsObject.pointsArray[2] = object[1];
				graphicsObject.pointsArray[3] = object[2];
			}else{
				 editObject(graphicsObject,object[1],object[2],mouseX,mouseY,null,null,null);
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
			editObject(graphicsObject,mouseX,mouseY,graphicsObject.pointsArray[2],graphicsObject.pointsArray[3],lastPoint.x3,lastPoint.y3,null);
			if(isEqTriangleCreated){
				graphicsObject.pointsArray[0] = mouseX;
				graphicsObject.pointsArray[1] = mouseY;
				graphicsObject.pointsArray[4] = lastPoint.x3;
				graphicsObject.pointsArray[5] = lastPoint.y3;
				showSelectedObject(graphicsObject);
			}
		}else if(object[1] == 2 && object[2] == 3){
			//console.log("2nd call");
			var lastPoint = getEquilateralTriangletThirdPoint(graphicsObject.pointsArray[0],graphicsObject.pointsArray[1],mouseX,mouseY);
			editObject(graphicsObject,graphicsObject.pointsArray[0],graphicsObject.pointsArray[1],mouseX,mouseY,lastPoint.x3,lastPoint.y3,null);
			if(isEqTriangleCreated){
				graphicsObject.pointsArray[2] = mouseX;
				graphicsObject.pointsArray[3] = mouseY;
				graphicsObject.pointsArray[4] = lastPoint.x3;
				graphicsObject.pointsArray[5] = lastPoint.y3;
				showSelectedObject(graphicsObject);
			}
		}else if(object[1] == 4 && object[2] == 5){
			//console.log("3rd call");
			var lastPoint = getEquilateralTriangletThirdPoint(graphicsObject.pointsArray[2],graphicsObject.pointsArray[3],mouseX,mouseY);
			editObject(graphicsObject,lastPoint.x3,lastPoint.y3,graphicsObject.pointsArray[2],graphicsObject.pointsArray[3],mouseX,mouseY,null);
			if(isEqTriangleCreated){
				graphicsObject.pointsArray[4] = mouseX;
				graphicsObject.pointsArray[5] = mouseY;
				graphicsObject.pointsArray[0] = lastPoint.x3;
				graphicsObject.pointsArray[1] = lastPoint.y3;
				showSelectedObject(graphicsObject);
			}
		
		}
		
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
			
					
			editObject(graphicsObject,x1,y1,x2,y2,null,null);
			if(isCircleCreated){
				graphicsObject.pointsArray[0] = x1;
				graphicsObject.pointsArray[1] = y1;
				graphicsObject.pointsArray[2] = x2;
				graphicsObject.pointsArray[3] = y2;
				showSelectedObject(graphicsObject);
			}
			
			startX = mouseX;
			startY = mouseY;			
	}else if(graphicsObject.type == 1 || graphicsObject.type == 2){
	
		if(object[1] == 0 && object[2] == 1){
			//console.log("1111111:::"+object[1]+","+object[2]);
			//console.log("1::"+graphicsObject.pointsArray[0]+"::2::"+graphicsObject.pointsArray[1]+"::3::"+graphicsObject.pointsArray[2]+"::4::"+graphicsObject.pointsArray[3]+"::5::"+graphicsObject.pointsArray[4]+"::6::"+graphicsObject.pointsArray[5]+"::7::"+graphicsObject.pointsArray[6]+"::8::"+graphicsObject.pointsArray[7]);
			editObject(graphicsObject,mouseX,mouseY,graphicsObject.pointsArray[4],graphicsObject.pointsArray[5],null,null,null);
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
			editObject(graphicsObject,graphicsObject.pointsArray[6],graphicsObject.pointsArray[7],mouseX,mouseY,null,null,null);
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
			editObject(graphicsObject,graphicsObject.pointsArray[0],graphicsObject.pointsArray[1],mouseX,mouseY,null,null,null);
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
			editObject(graphicsObject,graphicsObject.pointsArray[2],graphicsObject.pointsArray[3],mouseX,mouseY,null,null,null);
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
	}else if(graphicsObject.type == 23){
		editObject(graphicsObject,null,null,mouseX,mouseY,null,null,null);
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
						restoreSelectedObject();
						/*
						drawObject(objectTable,selObjArray[i],false);
						var graphicsObject = objectTable.get(selObjArray[i]);
						showSelectedObject(graphicsObject);
						*/
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
		//console.log("ObjectTable:::"+startX+","+startY);
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
						case 8:/*
							var pointsArr = graphicsObject.pointsArray;
							if(point_in_rectagnle(startX,startY,pointsArr[0],pointsArr[1],pointsArr[2],pointsArr[3])){
								//console.log("pointsArr[0]::"+pointsArr[0]+"pointsArr[1]::"+pointsArr[1]+"pointsArr[2]::"+pointsArr[2]+"pointsArr[3]::"+pointsArr[3]);
								returnObjArr[returnObjArr.length] = objectTable.getKey();
								
								returnOnlySingle = true;
							}*/
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
var returnVal = false;
	if(objectTable != null){
	//	//console.log("-------checkOpenObjectForSelection  called------------------"+objectTable.size());
		objectTable.moveFirst();
		while(objectTable.next()){
			var graphicsObject = objectTable.get(objectTable.getKey());
			var arr = graphicsObject.pointsArray;
			if(graphicsObject.type ==3 ||graphicsObject.type ==4 || graphicsObject.type ==6){
					if (is_in_path(x, y,arr,graphicsObject.lineWidth)){
						returnVal = true;
						break;
					}
			}
		}
	}
	return returnVal;
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
		
		}else if(graphicsObject.type == 12 && !isRotaionEnable){
				//console.log("a1::"+arr[0]+"::a2::"+arr[1]+"::b1::"+arr[2]+"::b2::"+arr[3]);
				if(is_in_ellipse(x,y,arr[0]-selCircleRedius,arr[1]-selCircleRedius,arr[0]+selCircleRedius,arr[1]+selCircleRedius)){
					//console.log("inside Selection of point 1"+canvas.style.cursor);
					strechableObj[0] = graphicsObject
					strechableObj[1] = 0;
					strechableObj[2] = 1;
					strechableObj[3] = 1;
					if(isRotaionEnable){
						canvas.style.cursor  = "default";
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
						canvas.style.cursor  = "default";
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
						canvas.style.cursor  = "default";
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
						canvas.style.cursor  = "default";
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
		if(graphicsObject.type == 8 || graphicsObject.type == 12 ){
		
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
				
		}else if(graphicsObject.type ==1 || graphicsObject.type == 2 || graphicsObject.type ==23){
				if(is_in_ellipse(x,y,arr[0]-selCircleRedius,arr[1]-selCircleRedius,arr[0]+selCircleRedius,arr[1]+selCircleRedius)){
					//console.log("inside Selection"+canvas.style.cursor);
					 return true;
					
				}else if(is_in_ellipse(x,y,arr[2]-selCircleRedius,arr[3]-selCircleRedius,arr[2]+selCircleRedius,arr[3]+selCircleRedius)){
					//console.log("inside Selection"+canvas.style.cursor);
					 return true;
					
				}else if(is_in_ellipse(x,y,arr[4]-selCircleRedius,arr[5]-selCircleRedius,arr[4]+selCircleRedius,arr[5]+selCircleRedius)){
					//console.log("inside Selection"+canvas.style.cursor);
					 return true;
				
				}else if(is_in_ellipse(x,y,arr[6]-selCircleRedius,arr[7]-selCircleRedius,arr[6]+selCircleRedius,arr[7]+selCircleRedius)){
					//console.log("inside Selection"+canvas.style.cursor);
					 return true;
					
				}else{
					//console.log("555555555555555555555555555555");
					 return false;
				}
		
		}else if(graphicsObject.type ==5 || graphicsObject.type == 11 || graphicsObject.type ==13){
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
			ctx.strokeStyle = "white";
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
	ctx.fillStyle = "#3D0079";
	ctx.globalAlpha = 1;
	
	if(isRotaionEnable && !(objectSel.type == 12 ||objectSel.type == 8||objectSel.type == 16)){
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
	
	}else if(objectSel.type == 2 || objectSel.type ==1 || objectSel.type == 23){
		//console.log("objectSel.type:::"+objectSel.type);
		ctx.beginPath();
		ctx.strokeStyle = selectionColor;
		ctx.lineWidth= 2;
		//console.log("hiiii");
		createOval(arr[0]-selCircleRedius,arr[1]-selCircleRedius,arr[0]+selCircleRedius,arr[1]+selCircleRedius);
		ctx.fill();
		ctx.closePath() ;
		ctx.moveTo(arr[2]+selCircleRedius,arr[3]);
		
		createOval(arr[2]-selCircleRedius,arr[3]-selCircleRedius,arr[2]+selCircleRedius,arr[3]+selCircleRedius);
		ctx.fill();
		ctx.closePath() ;
		ctx.moveTo(arr[4]+selCircleRedius,arr[5]);
		
        createOval(arr[4]-selCircleRedius,arr[5]-selCircleRedius,arr[4]+selCircleRedius,arr[5]+selCircleRedius);
		ctx.fill();
		ctx.closePath() ;
		ctx.moveTo(arr[6],arr[7]);
		
		createOval(arr[6]-selCircleRedius,arr[7]-selCircleRedius,arr[6]+selCircleRedius,arr[7]+selCircleRedius);
		ctx.fill();
		ctx.closePath() ;
		ctx.moveTo(arr[0],arr[1]);
	
	ctx.stroke() ;
	
	}
	
	ctx.strokeStyle = styleColor;
	ctx.lineWidth = lineWidth;
	ctx.globalAlpha = globalAlpha;
	
}
function glowSelectedObject(graphicsObject){
	var currentGAlpha = ctx.globalAlpha;
	ctx.beginPath();
	ctx.strokeStyle = "white";
	ctx.lineWidth= parseInt(graphicsObject.lineWidth) + 3;
	//console.log("glowSelectedObject ::::::"+graphicsObject.type);
	ctx.globalAlpha = 0.5;
/*	if(objectSel.type == 1){
		//console.log("hiiiiiiiii");
		var pointsArr = objectSel.pointsArray;
		createRectangleNew(pointsArr[0], pointsArr[1], pointsArr[2], pointsArr[3], pointsArr[4], pointsArr[5], pointsArr[6], pointsArr[7]);
		if(objectSel.isFilled == true){
			ctx.fillStyle = objectSel.fillColor;
			ctx.fill();
			ctx.save();
		}
		
	} */
	if(graphicsObject.type ==4){
		ctx.lineCap = 'round';
		ctx.lineJoin = 'round';
	}else{
		ctx.lineCap = 'butt';
		ctx.lineJoin = 'miter';
	}
	switch(graphicsObject.type){
	case 1:
		var pointsArr = graphicsObject.pointsArray;
		createRectangleNew(pointsArr[0], pointsArr[1], pointsArr[2], pointsArr[3], pointsArr[4], pointsArr[5], pointsArr[6], pointsArr[7]);
		if(graphicsObject.isFilled == true){
			ctx.fillStyle = graphicsObject.fillColor;
			ctx.fill();
			ctx.save();
		}
		break;
	case 2:
		var pointsArr = graphicsObject.pointsArray;
		createOvalNew(pointsArr[0], pointsArr[1], pointsArr[2], pointsArr[3], pointsArr[4], pointsArr[5], pointsArr[6], pointsArr[7]);
		if(graphicsObject.isFilled == true){
			ctx.fillStyle = graphicsObject.fillColor;
			ctx.fill();
			ctx.save();
			
		}
		break;
	case 3:
		var pointsArr = graphicsObject.pointsArray;
		createLine(pointsArr[0], pointsArr[1], pointsArr[2], pointsArr[3]);
		break;
	case 4:
		var points = graphicsObject.pointsArray;
		drawFreeHandLine(points);
		break;
	case 5:
		var pointsArr = graphicsObject.pointsArray;
		createTriangle(pointsArr[0], pointsArr[1], pointsArr[2], pointsArr[3], pointsArr[4], pointsArr[5]);
		if(graphicsObject.isFilled == true){
			ctx.fillStyle = graphicsObject.fillColor;
			ctx.fill();
			ctx.save();
			
		}
		ctx.closePath() ;
		break;
	case 6:
		var pointsArr = graphicsObject.pointsArray;
		createArrow(pointsArr[0], pointsArr[1], pointsArr[2], pointsArr[3]);
		break;
	case 8:
		if(currentObjId != 15)
			canvas.style.cursor  = "wait";
		tempArray = graphicsObject.pointsArray;
		isImageLoaded = false;
		if(graphicsObject.imageLoaded){
			imageObj = null;
			imageObj= new Image();
			imageObj.src = graphicsObject.src;
			loadAndDrawImage();
		}else{
			loadImage(graphicsObject.src,graphicsObject.id);
		}
		break;
	case 9:
		ctx.globalAlpha = 0.3;
		var pointsArr = graphicsObject.pointsArray;
		createLine(pointsArr[0], pointsArr[1], pointsArr[2], pointsArr[3]);
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
		ctx.closePath() ;
		break;
	case 16:
		var pointsArr = graphicsObject.pointsArray;
		createGlowText(graphicsObject.text,pointsArr[0],pointsArr[3],"#ffffff");
		var metrics = ctx.measureText(graphicsObject.text.textData);
		pointsArr[2] = pointsArr[0] +  metrics.width;
		ctx.closePath() ;
		
		
	break;
	case 23:
		var pointsArr = graphicsObject.pointsArray;
		createSquare(pointsArr[0], pointsArr[1], pointsArr[2], pointsArr[3], pointsArr[4], pointsArr[5], pointsArr[6], pointsArr[7]);
		if(graphicsObject.isFilled == true){
			ctx.fillStyle = graphicsObject.fillColor;
			ctx.fill();
			ctx.save();
		}
		ctx.closePath() ;
		break;
	}
	
	glowObject();
	if(graphicsObject.type!=3 && graphicsObject.type!=4 && graphicsObject.type!= 11)
				ctx.closePath() ;
				ctx.stroke() ;
		if(graphicsObject.isFilled){
			ctx.restore()
		}
	ctx.stroke();

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
 styleColor= obj.value;
 changeSelectedObjectColor(styleColor);

}
function changeSelectedObjectColor(color){
		//console.log("Style color::;"+color);
	  if(selObjArray!= null){
		  //console.log("ppp:"+document.getElementById("pagenum").value);
		var objectTable = pageObjTable.get(document.getElementById("pagenum").value);
			  for(var i=0;i<selObjArray.length;i++){
				var graphicsObject = objectTable.get(selObjArray[i]);
				//console.log("graphicsObject:;"+graphicsObject+":;color:;"+color);
					graphicsObject.color = color;
					drawObject(objectTable,selObjArray[i],false);
					showSelectedObject(graphicsObject);
				
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
	//console.log("fillColor::"+fillColor);
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
					 if(graphicsObject.type == 3 || graphicsObject.type ==4 || graphicsObject.type == 6 || graphicsObject.type == 11 ){
						
					 }else{
						 if(fillColor != null)
							graphicsObject.isFilled = true;
						 else
							graphicsObject.isFilled = false;
					   
						 graphicsObject.fillColor = fillColor;
				    }
				   //graphicsObject.opacity = globalAlpha;
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
		//console.log("angleR1::"+angleR1);
  
		var angleX2 = angleX1-dx;
		var angleY2 = angleY1-dy;
		angleR2=Math.atan2(angleY2, angleX2);
		//console.log("angleR2::"+angleR2);
		mouseAngle = angleR2-angleR1;
	//console.log("objectTable--------------------"+objectTable);
		for(var i=0;i<selObjArray.length;i++){
			var graphicsObject = objectTable.get(selObjArray[i]);
			
			var pointsArray = graphicsObject.pointsArray;
			for(var j=0;j<pointsArray.length;j+=2){
    
				var obj = Rotate(tx, ty, pointsArray[j],pointsArray[j+1],mouseAngle);
				// //console.log("Points After Rotation:::"+obj.newX+","+obj.newY);
				if(obj.newX == null){
				//alert("points returned null");
				}
				graphicsObject.pointsArray[j] = obj.newX;
				graphicsObject.pointsArray[j+1] = obj.newY;
    
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
					if(pointsArray ==  null){
						//alert("points array null::"+graphicsObject.type);
					}
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
				}else if(graphicsObject.type ==12 ){
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
				}else if(graphicsObject.type ==1 || graphicsObject.type == 2 || graphicsObject.type == 23 ){
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
	
	var imgTempArray =  new Array();
	imgTempArray[0] = imageX;
	imgTempArray[1] = imageY;
	imgTempArray[2] = canvas.width - imageX;
	imgTempArray[3] = canvas.height - (2*imageY);
	var graphicsObject = new GraphicsObject(count,8,imgTempArray,null,null,src,false,null,null,imageLoaded,null,null);
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
			var pageNum = document.getElementById("pagenum").value;
			var objectTable = pageObjTable.get(pageNum);
			//console.log("id::"+id+":::pageNum:;"+pageNum);
			var graphicsObject = objectTable.get(id);
			var ptsArray = graphicsObject.pointsArray;
		//clearWaitZone();		
		//console.log("Image Object------------------------------------"+imageObj.naturalWidth + "::"+imageObj.naturalHeight);
			//console.log("tempArray--111-----------"+tempArray);
			getImageWidthHeight(imageObj,ptsArray[2],ptsArray[3]);
			ptsArray[2] = ptsArray[0] + imageObj.width;
			ptsArray[3] = ptsArray[1] + imageObj.height;
			graphicsObject.pointsArray = ptsArray;
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
		drawImage(ptsArray[0],ptsArray[1],ptsArray[2],ptsArray[3]);
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
	
	}else if(val == 'N' && pagenum <pageCount){
		pagenum++;
		
	}
	clearTimeout(imageloadingTimer);
	isImageLoaded = false;
	document.getElementById("pagenum").value = pagenum;
	document.getElementById("pagenumber").innerHTML = pagenum;
	ctx.clearRect(0, 0, canvas.width, canvas.height);
	//restore();
	if(!isPlayingStoped || startTime != 0){
	//	storePageChangeEvent(pagenum);
	}
	//console.log("11111111111111111111111111");
	drawNonRecordingObject(pagenum);
	if(!isPlayingStoped){
		restoreOnlyPlayedObject();
		restoreInsertedObjectInStream(pagenum);
	}else if(startTime != 0){
		restoreRecordedObj(currentMiliSec,pagenum);
	}else if(isPlayingStoped){
		restoreAllRecordedObj(pagenum);
	}
	
	selObjArray =  null;
	selObjArray = new Array();
	playFromSlide = true;
	
	
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
	$('#save-Modal').modal('show');
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
		  			 //$('#save-Modal').modal('hide');
		  			if(msg.actionErrors != null)
		  			{
		  				//alert("error");
						showSaveModal('error');
		  		  	}else{
		  		  		//alert("showchild"+msg.status);
		  		  		//filename = 'Enotebook/'+meetingName+'/recording/'+meetingName+'.mp3';
						showSaveModal('success');
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
			var pos = filename.lastIndexOf('/');
			var fname;
			if(pos != -1){
				fname = filename.substring(pos+1,filename.length);
			}
			var recFileName = 'Enotebook/'+userId + '/'+meetingName+'/recording/'+fname; 
			var data = data + ', "TempRecFile":"'+ filename +'","RecFname":"'+recFileName+'"'+',"RecFileDuration":"'+duration+'"';
		}
	if(pageObjTable.size()>0){
		
		var data = data + ', "PageList":[';
		var jsonData = '';
		pageObjTable.moveFirst();
		//console.log("pageObjTable:::"+pageObjTable);
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
							var fname = json.RecFname;
							var pos = fname.lastIndexOf('/');
							var recFileName;
							if(pos != -1){		
								 recFileName = fname.substring(pos+1,fname.length);
							}
							//console.log("Recording recFileName::"+recFileName);
							filename = json.TempRecFile;
							recCount = 1;
							var pos2 = filename.lastIndexOf('/');
							if(pos2 != -1){		
								filename = filename.substring(0,pos2+1) + recFileName;
							}
							//console.log("Recording file name::"+filename);
							
						}
		  		  		initDataStruture();
						//console.log("--------initDataStruture-----------");
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
						//document.getElementById("pagenum").value = pageNum;
						//console.log("22222222222222222222222222222");
						timeRefTable = sortObjectTimeTable(timeRefTable);
						sortedTimeRefTable = timeRefTable;
						loadAllImages();
						
		  		  		drawNonRecordingObject(pageNum);
						restoreAllRecordedObj(pageNum);
						//console.log("---------------filename----------------------------"+filename);
						if(filename.length >0){
							myVid=document.getElementById("audio1");
							myVid.src = "http://"+window.location.host+"/"+filename;
							
							if(isAutoPlay == "true"){
								//alert("startttttttttttttttt");
								//$( "#playpause" ).click();
								//document.getElementById("playpauseBut").className  = "fa fa-lg fa-pause";
								//playObject();
								
								//isAutoPlay = "false";
								// $('#openRecord').click();
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
	selObjArray = new Array();
	selObjRotatable = true;
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
		if(gObj.type == 8){
			var tempCanvas = document.createElement('CANVAS')
			var imgObj = new ImageObject(gObj.src,false,null,tempCanvas);
			imageObjArray[imageObjArray.length] = imgObj;
		}
		if(obj.attachment != null){
			//alert("Attachement found"+obj.id);
			gObj.attachment = obj.attachment;
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
	if(pageCount < pageNum){
		pageCount = pageNum;
	}
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
	//console.log("dx:::"+dx+"::dy:::"+dy);
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
  document.getElementById("cTime").innerHTML = duration;
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
	//console.log("enableDisableRelationOptions ::"+state+"::selObjRotatable::"+selObjRotatable);
	if(state){
		//console.log("hiii");
		//document.getElementById("rotateButton").className = "btn btn-default active"
		if(selObjRotatable ){
			//console.log("Innnn");
			document.getElementById("rotateButton").disabled = true;
		}else{
			//console.log("Out");
			 document.getElementById("rotateButton").disabled = false;
		}
		   
		document.getElementById("delObjButton").disabled = false;	
		var id = objectTimeTable.get(selObjArray[0]);
		if(id != null){		
			//document.getElementById("playFrObjButton").className = "btn btn-default active"
			document.getElementById("playFrObjButton").disabled = false;
		}

		//document.getElementById("delObjButton").className = "btn btn-default active"
		//document.getElementById("delObjButton").disabled = false;
	}else{
		//console.log("byeee");
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
			//console.log("2222")
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
	/*
	if(graphicsObject.opacity != null){
		ctx.globalAlpha = graphicsObject.opacity;
	}else{
		ctx.globalAlpha = 1.0;
	} */
	ctx.setLineDash([0]);
	
	switch(graphicsObject.type){
		case 1:
			ctx.clearRect(0, 0, canvas.width, canvas.height);
			restore();
			ctx.beginPath();
			ctx.lineCap = 'butt';
			ctx.lineJoin = 'miter';
			ctx.strokeStyle = graphicsObject.color;
			ctx.lineWidth = graphicsObject.lineWidth;
			ctx.globalAlpha = graphicsObject.opacity;
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
			
			
			createRectangleNew(startx, starty, cx, cy, mouseX , mouseY , dx, dy);
			if(graphicsObject.isFilled == true){
				ctx.fillStyle = graphicsObject.fillColor;
			    ctx.fill();
				ctx.save();
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
			ctx.globalAlpha = graphicsObject.opacity;
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
			if(graphicsObject.isFilled == true){
				ctx.fillStyle = graphicsObject.fillColor;
			    ctx.fill();
				ctx.save();
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
			ctx.strokeStyle = graphicsObject.color;
			ctx.lineWidth = graphicsObject.lineWidth;
			ctx.globalAlpha = graphicsObject.opacity;
			createLine(startx, starty, mouseX , mouseY );
			ctx.stroke();
			break;
		case 4:
			ctx.beginPath();
			ctx.lineCap = 'round';
			ctx.lineJoin = 'round';
			ctx.strokeStyle = graphicsObject.color;
			ctx.lineWidth = graphicsObject.lineWidth;
			ctx.globalAlpha = graphicsObject.opacity;
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
			ctx.globalAlpha = graphicsObject.opacity;
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
			ctx.globalAlpha = graphicsObject.opacity;
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
			ctx.globalAlpha = graphicsObject.opacity;
			if(endX != null && endY != null){
				createArc(startx,starty,mouseX,mouseY,endX,endY);
			 }else{
				createLine(startx, starty, mouseX , mouseY );
			}
			//ctx.closePath();
			ctx.stroke();
			
			break;
			
		case 12:
		
			if(checkPointsInCanvas(startx, starty, mouseX , mouseY)){
				ctx.clearRect(0, 0, canvas.width, canvas.height);
				restore();
				tempCirclePointsArray[0] = startx;
				tempCirclePointsArray[1] = starty;
				tempCirclePointsArray[2] = mouseX;
				tempCirclePointsArray[3] = mouseY;
				isCircleCreated = true;
				ctx.beginPath();
				ctx.lineCap = 'butt';
				ctx.lineJoin = 'miter';
				ctx.strokeStyle = graphicsObject.color;
				ctx.lineWidth = graphicsObject.lineWidth;
				ctx.globalAlpha = graphicsObject.opacity;
				createOval(startx, starty, mouseX , mouseY);
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
					ctx.globalAlpha = graphicsObject.opacity;
					isEqTriangleCreated = true;
					createTriangle(startx, starty, mouseX , mouseY,thirdPoint.x3,thirdPoint.y3);
					if(graphicsObject.isFilled == true){
						ctx.fillStyle = graphicsObject.fillColor;
						ctx.fill();
						ctx.save();
					}
					ctx.closePath() ;
					ctx.stroke() ;
				}else{
					isEqTriangleCreated = false;
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
		case 23:
			var d = Math.abs(graphicsObject.pointsArray[0] - graphicsObject.pointsArray[4]);
			var cx = graphicsObject.pointsArray[0] - d/2;
			var cy = graphicsObject.pointsArray[1] - d/2;
			var r = distanceBetween(cx,cy, mouseX, mouseY);
			
			if(checkSquareBoundryInCanvas(cx + r,cy + r,cx - r,cy + r,cx - r, cy - r,cx + r,cy - r)){
				ctx.clearRect(0, 0, canvas.width, canvas.height);
				restore();
				//console.log("r::"+r);
				var px = cx+r;
				var py = cy+r;
				
				graphicsObject.pointsArray[0] = cx + r;
				graphicsObject.pointsArray[1] = cy + r;
				graphicsObject.pointsArray[2] = cx - r;
				graphicsObject.pointsArray[3] = cy + r;
				graphicsObject.pointsArray[4] = cx - r;
				graphicsObject.pointsArray[5] = cy - r;
				graphicsObject.pointsArray[6] = cx + r;
				graphicsObject.pointsArray[7] = cy - r;
								
				ctx.beginPath();
				ctx.lineCap = 'butt';
				ctx.lineJoin = 'miter';
				ctx.strokeStyle = graphicsObject.color;
				ctx.lineWidth = graphicsObject.lineWidth;
				ctx.globalAlpha = graphicsObject.opacity;
				createSquare(graphicsObject.pointsArray[0], graphicsObject.pointsArray[1], graphicsObject.pointsArray[2], graphicsObject.pointsArray[3], graphicsObject.pointsArray[4] , graphicsObject.pointsArray[5] , graphicsObject.pointsArray[6], graphicsObject.pointsArray[7]);
				if(graphicsObject.isFilled == true){
					ctx.fillStyle = graphicsObject.fillColor;
					ctx.fill();
					ctx.save();
				}
				ctx.closePath();
				ctx.stroke();
			}	
			break;
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

function polygonCentroid(pointsArr){
  var x = 0,y = 0,i,j,f,point1,point2;

	for (i = 0, j = pointsArr.length - 1; i < pointsArr.length; j=i,i++) {
		point1 = pointsArr[i];
		point2 = this.points[j];
		f = point1.x * point2.y - point2.x * point1.y;
		x += (point1.x + point2.x) * f;
		y += (point1.y + point2.y) * f;
	}

	f = this.area() * 6;
	return new Point(x / f, y / f);
}

function polygonArea(){
}

function setObjectAttributeMenuOption(graphicsObj){
	if(graphicsObj.type != 8){
		if(graphicsObj.isFilled){
			document.getElementById("fillAttr").value = graphicsObj.fillColor;
			fillColor = graphicsObj.fillColor;
		}else{
			document.getElementById("fillAttr").value = "";
			fillColor = null;
		}
		if(graphicsObj.lineWidth == ""){
			document.getElementById("lineWidthAttr").value = 2;
			lineWidth = 2;
		}else{
			document.getElementById("lineWidthAttr").value = graphicsObj.lineWidth;
			lineWidth = graphicsObj.lineWidth;
		}
		if(graphicsObj.opacity == ""){
			document.getElementById("opacityCtrl").value = 1;
			globalAlpha = 1;
		
		}else{
			document.getElementById("opacityCtrl").value = graphicsObj.opacity;
			globalAlpha = graphicsObj.opacity;
		}
		if(graphicsObj.color == ""){
			document.getElementById("strokeAttr").value = "000000";
			styleColor = "000000";
		}else{
			document.getElementById("strokeAttr").value = graphicsObj.color;
			styleColor = graphicsObj.color;

		}
	}
}

function deletelecturerecording(){
	jQuery.ajax({
			type:	"get",
			url: 	"deletelecturerecording.action",
			data: 	"meetingName="+meetingName,
			success:function(msg) {
			if(msg.actionErrors != null){
				alert("error");
				return;
			}else{
				recFileDuration = 0;
				filename = "";
				recCount = 0;
				document.getElementById("eTime").innerHTML = "<b>00:00</b>";				
				document.getElementById("cTime").innerHTML = "<b>00:00</b>";
				clearRecordedObjectTime();				
				//console.log("------Successfully Copied------");
			}
	}});
	$('#close-popover').click();	
}
function deleteSlide(){
	var pageNum = document.getElementById("pagenum").value;
	//pageObjTable = sortTableByKey(pageObjTable);
	var updatedPageObjTable =  new Hashtable(); 
	pageObjTable.moveFirst();
	while(pageObjTable.next()){
		if(pageObjTable.getKey() < pageNum){
			updatedPageObjTable.put(pageObjTable.getKey(),pageObjTable.getValue());
			continue;
			
		}else if(pageObjTable.getKey() == pageNum){
				pageRemoved = true;
				var objectTable = pageObjTable.getValue();
				objectTable = null;
				
		}else if(pageObjTable.getKey() > pageNum){
				var ctr = (pageObjTable.getKey() - 1);
				updatedPageObjTable.put(ctr,pageObjTable.getValue());
				
		}
	}
	pageObjTable = null;
	pageObjTable = updatedPageObjTable;
	//console.log("pageObjTable After:;"+pageObjTable);
	
	//console.log("nonRecordinPageObjTable before:;"+nonRecordinPageObjTable);
	//nonRecordinPageObjTable = sortTableByKey(nonRecordinPageObjTable);
	var updatedNonRecordinPageObjTable =  new Hashtable(); 
	nonRecordinPageObjTable.moveFirst();
	while(nonRecordinPageObjTable.next()){
		if(nonRecordinPageObjTable.getKey() < pageNum ){
			updatedNonRecordinPageObjTable.put(nonRecordinPageObjTable.getKey(),nonRecordinPageObjTable.getValue());
			continue;
		}else if(nonRecordinPageObjTable.getKey() ==  pageNum){
				pageRemoved = true;
				var nonRecordingObjArray = nonRecordinPageObjTable.getValue();
				nonRecordingObjArray = null;
		}else if(nonRecordinPageObjTable.getKey() >  pageNum){
				var ctr = nonRecordinPageObjTable.getKey() - 1;
				updatedNonRecordinPageObjTable.put(ctr,nonRecordinPageObjTable.getValue());
		}
		
	}
	nonRecordinPageObjTable = null;
	nonRecordinPageObjTable = updatedNonRecordinPageObjTable;
	timeRefTable.moveFirst();
	while(timeRefTable.next()){
		var objRecTime = timeRefTable.getKey();
		var recordedObjArr = timeRefTable.getValue();
			for(var i=0;i< recordedObjArr.length;i++){
				var pageObj = recordedObjArr[i];
				if(pageObj != null){
					if(pageNum > pageObj.num){
						continue;
					}else if(pageNum == pageObj.num){
						recordedObjArr.splice(i ,1);
						objectTimeTable.remove(pageObj.objectId);
						objectPageRefTable.remove(pageObj.objectId);
					}else if(pageNum < pageObj.num){
						pageObj.num = (pageObj.num - 1);
						objectPageRefTable.put(pageObj.objectId,pageObj.num);
					}
				}
			}
	}
	$('#close-popover').click();	
	ctx.clearRect(0, 0, canvas.width, canvas.height);
	restore();
	
}
function sortTableByKey(tableToBeSort){
	var keyArr = new Array();
	var sortedTable = new Hashtable();
	tableToBeSort.moveFirst();
	var ctr = 0;
	while(tableToBeSort.next()){
		keyArr[ctr] = tableToBeSort.getKey();
		ctr++;
	}
	keyArr = keyArr.sort(function(a, b){return a-b});
	for(var i=0;i<keyArr.length;i++){
		sortedTable.put(keyArr[i],tableToBeSort.get(keyArr[i]));
	}
	return sortedTable;
}
function removeNonRotationalObjectFromSel(){
//console.log("removeNonRotationalObjectFromSel===================="+selObjArray);
	var isRemoved = false;
	var objectTable = pageObjTable.get(document.getElementById("pagenum").value);
	if(selObjArray.length >0){
		for(i=0;i<selObjArray.length;i++){
			var graphicsObject = objectTable.get(selObjArray[i]);
			if(graphicsObject.type == 8 || graphicsObject.type == 12 || graphicsObject.type == 16){
				//console.log("removed");
				selObjArray.splice(i,1);
				isRemoved = true;
			}
		}
	}
	if(isRemoved){
		ctx.clearRect(0, 0, canvas.width, canvas.height);
		restore();
	}
	//console.log("removeNonRotationalObjectFromSel========After============"+selObjArray);
}

function closeModal(){
//console.log("Hiiiii");
$('#error-Modal').modal('hide');
canvas.style.cursor  = "default";
}

function toggleFullScreen() {
		if ((document.fullScreenElement && document.fullScreenElement !== null) || (!document.mozFullScreen && !document.webkitIsFullScreen)) {
			if (document.documentElement.requestFullScreen) {
				document.documentElement.requestFullScreen();
			} else if (document.documentElement.mozRequestFullScreen) {
				document.documentElement.mozRequestFullScreen();
			} else if (document.documentElement.webkitRequestFullScreen) {
				document.documentElement.webkitRequestFullScreen(Element.ALLOW_KEYBOARD_INPUT);
			}
		} else {
			if (document.cancelFullScreen) {
				document.cancelFullScreen();
			} else if (document.mozCancelFullScreen) {
				document.mozCancelFullScreen();
			} else if (document.webkitCancelFullScreen) {
				document.webkitCancelFullScreen();
			}
		}
}



function windowResize(){
//console.log("windowResize================");
	 var windowW=window.innerWidth;
	 var windowH=window.innerHeight
	 canvas.width = (windowW - 60);
	 canvas.height = (windowH -150);
	 canvasOffset = $("#canvas").offset();
	 offsetX = canvasOffset.left;
	 offsetY = canvasOffset.top;
	 
	 timeLineDivWidth =  Math.floor(timeLineDiv.getBoundingClientRect().width);
	 timeLineDivHeight = timeLineDiv.getBoundingClientRect().height;
	 //alert("timeLineDivWidth::"+timeLineDivWidth);
	 sliderLength = (timeLineDivWidth - 30);
	 //console.log("sliderLength::;"+sliderLength+"::timeLineDivWidth::"+timeLineDivWidth);
	 timelnCanvasOffset = $("#timeline_canvas").offset();
	 timelnOffsetX = timelnCanvasOffset.left
	 timelnOffsetY = timelnCanvasOffset.top;
	 //console.log("X::"+timelnOffsetX+"::Y::"+timelnOffsetY);
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

function replace(target,source) {
	document.getElementById(target).innerHTML  = document.getElementById(source).innerHTML;
  }
	  

function OpenInNewTab(url) {
//console.log("url::::"+url);
  var win = window.open(url, '_blank');
  win.focus();
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
	
	var ret = checkPointsOnMenuItem(x,y);
	if(ret != -1){
		if(ret == 0){
			//alert("selObjId:::"+selObjId);
			selObjArray[selObjArray.length] = selObjId;
			stopPlaying();
			//alert("selObjId:::"+selObjArray);
			$('#scrubber').click();
			playfromObject();
		}else if(ret == 1){
			var objectTable = pageObjTable.get(document.getElementById("pagenum").value);
			var graphicsObject = objectTable.get(selObjId);			
			//console.log("objArr:::::"+graphicsObject.ref);
			if(graphicsObject.ref != null && ((graphicsObject).ref).trim().length > 0){
				OpenInNewTab(graphicsObject.ref);
			}
		}else if(ret == 2){
			var objectTable = pageObjTable.get(document.getElementById("pagenum").value);
			var graphicsObject = objectTable.get(selObjId);			
			//console.log("objArr:::::"+graphicsObject.ref);
			if(graphicsObject.attachment != null && ((graphicsObject).attachment).trim().length > 0){
				alert("attachment::"+graphicsObject.attachment);
				OpenInNewTab(graphicsObject.attachment);
			}
		}
		//alert("selObjArray::"+selObjId);
	}
	//console.log("menuObjectArr.length::"+menuObjectArr.length);
	if(menuObjectArr!= null && menuObjectArr.length != 0){
		menuObjectArr = null;
		menuX = null;
		ctx.clearRect(0, 0, canvas.width, canvas.height);
		restore();
		//console.log("clear canvas");
	}
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

function openVolume(){
	//console.log("Hiiii"+document.getElementById("volCtrl").style.display);
	if(document.getElementById("volCtrl").style.display == 'none'){
		document.getElementById("volCtrl").style.display = "block";
	}else{
		document.getElementById("volCtrl").style.display = "none";
	}
}

function loadAllImages(){
	for(var i=0;i<imageObjArray.length;i++){
		convertImgToBase64(imageObjArray[i]);
	}
}

function convertImgToBase64(imgObj, outputFormat){
  //console.log("convertImgToBase64---------------------");
    var img = new Image;
	//img.crossOrigin = 'Anonymous';
	img.onload = function(){
		var canvas = imgObj.canvas;
		var dataURL;
        var ctx = canvas.getContext('2d');
		
        canvas.height = img.height;
        canvas.width = img.width;
        ctx.drawImage(img, 0, 0);
        //dataURL = canvas.toDataURL(outputFormat);
		imgObj.isloaded = true;
		//console.log("dataUrl:::"+dataURL);
		//document.getElementById("imageId").src = dataURL;
       // callback.call(this, dataURL);
        imgObj.canvas = null; 
    };
	//	//console.log("id:::"+id);
    img.src = imgObj.src;
	 
}


function checkAllImagesLoaded(){
	var allImagesLoaded  = true;
	for(var i=0;i<imageObjArray.length;i++){
		var imageObj = imageObjArray[i];
		if(!imageObj.isloaded) {
			allImagesLoaded = false;
			break;
		}
		
	}
	//console.log("checkAllImagesLoaded::::"+allImagesLoaded);
	if(!allImagesLoaded){
		allImageloadingTimer = setTimeout("checkAllImagesLoaded()",1000);
	}else{
		clearTimeout(allImageloadingTimer);
		startObjectPlaying();
	}
}

function startObjectPlaying(){
	$('#loading-Modal').modal('hide');
	//alert("startObjectPlaying");
	myVid.play();
	startSlide();
	//alert("start");
	//console.log("------------startObjectPlaying----------------");
	checkAndMergeTimeRefTable();
	timeRefTable = sortObjectTimeTable(timeRefTable);
	//console.log("3333333333333333333333333333"+timeRefTable);
	drawNonRecordingObject("1");
	timeRefTable.moveFirst();
	//console.log("timeRefTable::::playing:"+timeRefTable);
	playCount = 0;
	/*
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
	*/
	//console.log("sliderPosition***********:"+sliderPosition);
	var playingStartTime = sliderPosition*recFileDuration / sliderLength;
	currentPage = document.getElementById("pagenum").value;
	var objectTable = pageObjTable.get(currentPage);
	while(timeRefTable.next()){
		playCount++;
		if(timeRefTable.getKey()<playingStartTime){
			var recordedObjArr = timeRefTable.getValue();
			for(var i=0;i<recordedObjArr.length;i++){
				var pageObj = recordedObjArr[i];
				if(pageObj.num == currentPage){
					//console.log("-&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&"+pageObj.objectId);
					drawObject(objectTable,pageObj.objectId,false);
				}else{
					continue;
				}
			}
		
			
		}else{
			nextObjTime = timeRefTable.getKey();
			playCount--;
			runningTimerId = setTimeout('checkPageAndDrawObj('+nextObjTime+')',(nextObjTime - playingStartTime));
			break;
		}
	}
	
	
	
	//console.log("----1111-recFileDuration-------"+recFileDuration+"::sliderLength::"+sliderLength);
}

function playFromPage(){
	//alert("playFromPage");
	var pageNum = document.getElementById("pagenum").value;
	var objectTable = pageObjTable.get(pageNum);
	var pageObjectTable =  new Hashtable();
	var timeArray =  new Array();
	if(objectTable != null){
		objectTable.moveFirst();
		while(objectTable.next()){
			var graphicsObj = objectTable.getValue();
			if(graphicsObj.type == 10){
				var timeStamp = objectTimeTable.get(graphicsObj.id);
				pageObjectTable.put(timeStamp,graphicsObj.id);
				timeArray[timeArray.length] = timeStamp;
			}
		}
		timeArray = timeArray.sort(function(a, b){return a-b});
		var reqObject = pageObjectTable.get(timeArray[0]);
		selObjArray[0] = reqObject;
		playfromObject();
	}
}

function showRefrencedObject(){
}
function createtimeLineOld(){
	
	refreshTimeLine(-1);
}

function createTimeLine(){
	//TimeLineObject
	timeLineObjArray = new Array();
	var styleColor = "#000000";
	var lineLength = sliderLength;
	timelnCtx.beginPath();
	timelnCtx.lineCap = 'round';
	timelnCtx.lineJoin = 'round';
	timelnCtx.strokeStyle = styleColor;
	timelnCtx.fillStyle = styleColor;
	timelnCtx.lineWidth= timeLineWidth - 2;
	timelnCtx.moveTo(timeLineLeft, timeLineTop);
    timelnCtx.lineTo(timeLineLeft + lineLength, timeLineTop);
	timelnCtx.stroke();
	
	var x0 = timeLineLeft - sliderRadius;
	var y0 = timeLineTop - sliderRadius;
	var xe = x0 + 2*sliderRadius;
	var ye = timeLineTop + sliderRadius;
	
	sliderPointsArray[0] = x0;
	sliderPointsArray[1] = y0;
	sliderPointsArray[2] = xe;
	sliderPointsArray[3] = ye;	
	
	createSliderOval(x0,y0,xe,ye,"#000000");
	timeRefTable = sortObjectTimeTable(timeRefTable);
	timeRefTable.moveFirst();
	//console.log("timeRefTable::"+timeRefTable);	
	while(timeRefTable.next()){
		var objTime = timeRefTable.getKey();
		var recordedObjArr = timeRefTable.getValue();
		for(var i=0;i<recordedObjArr.length;i++){
			var pageObj = recordedObjArr[i];
			var objId = pageObj.objectId;
			var pageNum = pageObj.num;
			var objectTable = pageObjTable.get(pageNum);
			var graphicsObj = objectTable.get(objId);
			var timeLinePos = Math.floor((lineLength * objTime)/recFileDuration);
			var ptsArray = new Array();
			var type;
			if(graphicsObj.type == 10){
				type = 1;
				var x1 = timeLineLeft + timeLinePos - timeLinePageObjRadius;
				var y1 = timeLineTop + pageCircleDistfrmLine;
				ptsArray[ptsArray.length] = x1;
				ptsArray[ptsArray.length] = y1;
				ptsArray[ptsArray.length] = x1 + 2*timeLinePageObjRadius;
				ptsArray[ptsArray.length] = y1;
				ptsArray[ptsArray.length] =(x1 + 2*timeLinePageObjRadius);
				ptsArray[ptsArray.length] = (y1 + 2*timeLinePageObjRadius);
				ptsArray[ptsArray.length] =  x1;
				ptsArray[ptsArray.length] = (y1 + 2*timeLinePageObjRadius);
				styleColor = "#000000";
				//console.log("createTimeLineOval:x1:::"+x1+"::y1::"+y1+"::pageNum::"+pageNum+"::graphicsObj::"+graphicsObj.id);
				//alert("pagenum::"+pageNum);
				createTimeLineOval(ptsArray[0],ptsArray[1],ptsArray[4],ptsArray[5],styleColor,pageNum);
				var timeLineObject = new TimeLineObject(type,ptsArray,objTime);
				timeLineObjArray[timeLineObjArray.length] = timeLineObject;	
			}else{
				//console.log("graphicsObj.ref::;"+graphicsObj.ref);
				if(graphicsObj.ref != null){
					
					styleColor = "#F43108";
						
					var x1 = timeLineLeft + timeLinePos - timeLinePageObjRadius;
					var y1 = timeLineTop - 2*timeLinePageObjRadius - pageCircleDistfrmLine;
					ptsArray[ptsArray.length] = x1;
					ptsArray[ptsArray.length] = y1;
					ptsArray[ptsArray.length] = x1 + 2*timeLinePageObjRadius;
					ptsArray[ptsArray.length] = y1;
					ptsArray[ptsArray.length] = x1 + 2*timeLinePageObjRadius;
					ptsArray[ptsArray.length] = y1 + 2*timeLinePageObjRadius;
					ptsArray[ptsArray.length] = x1;
					ptsArray[ptsArray.length] = y1 + 2*timeLinePageObjRadius;
					createAnnotatedObjOnTimeLine(ptsArray[0],ptsArray[1],ptsArray[4],ptsArray[5],styleColor);
					var timeLineObject = new TimeLineObject(type,ptsArray,objTime);
					timeLineObjArray[timeLineObjArray.length] = timeLineObject;	
				}
			}
		
		}		

	}

	
}



function refreshTimeLine(objectTime){
	//alert("refreshTimeLine:::"+sliderPosition);
	/*
	if(objectTime != -1){
		var recordedObjArr = timeRefTable.get(objectTime);
		if(recordedObjArr != null && recordedObjArr.length > 0){
			var pageObj = recordedObjArr[0];
			var objId = pageObj.objectId;
			var pageNum = pageObj.num;
			var objectTable = pageObjTable.get(pageNum);
			var graphicsObj = objectTable.get(objId);
			if(graphicsObj.type == 10){
				activePage = pageNum;
			}
		}
	}
	*/
	timelnCtx.clearRect(0, 0, timelnCanvas.width, timelnCanvas.height);
	var lineLength = sliderLength;
	timelnCtx.beginPath();
	timelnCtx.lineCap = 'round';
	timelnCtx.lineJoin = 'round';
	timelnCtx.lineWidth= timeLineWidth;
	timelnCtx.moveTo(timeLineLeft, timeLineTop);
	
	if(sliderPosition == 0){
		styleColor = "#000000";
		timelnCtx.lineWidth= timeLineWidth - 2;
		timelnCtx.strokeStyle = styleColor;
		timelnCtx.fillStyle = styleColor;
		timelnCtx.lineTo(timeLineLeft + lineLength, timeLineTop);
		timelnCtx.stroke();
	}else{
		styleColor = "#ff0000";
		timelnCtx.strokeStyle = styleColor;
		timelnCtx.lineTo(timeLineLeft + sliderPosition, timeLineTop);
		timelnCtx.stroke();
		timelnCtx.save();
		timelnCtx.beginPath();
		timelnCtx.moveTo(timeLineLeft + sliderPosition, timeLineTop);
		
		styleColor = "#000000";
		timelnCtx.lineWidth= timeLineWidth - 2;
		timelnCtx.strokeStyle = styleColor;
		timelnCtx.lineTo(timeLineLeft + lineLength, timeLineTop);
		timelnCtx.stroke();
		
	}
	timelnCtx.save();

	timeRefTable = sortedTimeRefTable;
	if(timeRefTable == null){
		timeRefTable = sortObjectTimeTable(timeRefTable);
	}
	timeRefTable.moveFirst();
	
	if(objectTime != -1){
		//lastDrawnObjTime = objectTime;
	}
	while(timeRefTable.next()){
		var objTime = timeRefTable.getKey();
		var recordedObjArr = timeRefTable.getValue();
		for(var i=0;i<recordedObjArr.length;i++){
			var pageObj = recordedObjArr[i];
			var objId = pageObj.objectId;
			var pageNum = pageObj.num;
			var objectTable = pageObjTable.get(pageNum);
			var graphicsObj = objectTable.get(objId);
			var timeLinePos = Math.floor((lineLength * objTime)/recFileDuration);
						
			var ptsArray = new Array();
			if(graphicsObj.type == 10){
				if(objTime == objectTime){
					styleColor = "#006600";
				}else{
					styleColor = "#000000";
				}
				var x1 = timeLineLeft + timeLinePos - timeLinePageObjRadius;
				var y1 = timeLineTop + pageCircleDistfrmLine;
				ptsArray[ptsArray.length] = x1;
				ptsArray[ptsArray.length] = y1;
				ptsArray[ptsArray.length] = x1 + 2*timeLinePageObjRadius;
				ptsArray[ptsArray.length] = y1;
				ptsArray[ptsArray.length] =(x1 + 2*timeLinePageObjRadius);
				ptsArray[ptsArray.length] = (y1 + 2*timeLinePageObjRadius);
				ptsArray[ptsArray.length] =  x1;
				ptsArray[ptsArray.length] = (y1 + 2*timeLinePageObjRadius);
				createTimeLineOval(ptsArray[0],ptsArray[1],ptsArray[4],ptsArray[5],styleColor,pageNum);
			}else{
				if(graphicsObj.ref != null){
					if(objTime == objectTime){
						styleColor = "#E8CD02";
					}else{
						styleColor = "#F43108";
					}
					var x1 = timeLineLeft + timeLinePos - timeLinePageObjRadius;
					var y1 = timeLineTop - 2*timeLinePageObjRadius - pageCircleDistfrmLine;
					ptsArray[ptsArray.length] = x1;
					ptsArray[ptsArray.length] = y1;
					ptsArray[ptsArray.length] = x1 + 2*timeLinePageObjRadius;
					ptsArray[ptsArray.length] = y1;
					ptsArray[ptsArray.length] = x1 + 2*timeLinePageObjRadius;
					ptsArray[ptsArray.length] = y1 + 2*timeLinePageObjRadius;
					ptsArray[ptsArray.length] = x1;
					ptsArray[ptsArray.length] = y1 + 2*timeLinePageObjRadius;
					createAnnotatedObjOnTimeLine(ptsArray[0],ptsArray[1],ptsArray[4],ptsArray[5],styleColor);
				}
			}
				
		}		

	}
	var x0; 
	var xe;
	/*if(sliderPosition == -1 || sliderPosition < timeLineLeft){
		 x0 = (timeLineLeft - sliderRadius) + sliderPosition;
		 xe = (timeLineLeft - sliderRadius) + sliderPosition + 2*sliderRadius;
	}else{
		 x0 =  sliderPosition - sliderRadius;
		 xe =  (sliderPosition - sliderRadius) + 2*sliderRadius;
	}*/
	x0 = (timeLineLeft - sliderRadius) + sliderPosition;
	xe = (timeLineLeft - sliderRadius) + sliderPosition + 2*sliderRadius;
	
	var y0 = timeLineTop - sliderRadius;
	var ye = timeLineTop + sliderRadius;
	sliderPointsArray[0] = x0;
	sliderPointsArray[1] = y0;
	sliderPointsArray[2] = xe;
	sliderPointsArray[3] = ye;	
	createSliderOval(x0,y0,xe,ye,"#000000");
}

function createTimeLineSquare(x1,y1,x2,y2,x3,y3,x4,y4,styleColor){
//alert("styleColor:::"+styleColor);
	//console.log("x1::"+x1+"y1::"+y1+"x2::"+x2+"y2::"+y2+"x3::"+x3+"y3::"+y3+"x4::"+x4+"y4::"+y4);
	timelnCtx.save();
    timelnCtx.beginPath();
	timelnCtx.strokeStyle = styleColor;
	timelnCtx.fillStyle = styleColor;
	timelnCtx.moveTo(x1,y1);
	timelnCtx.lineTo(x2,y2);
	timelnCtx.lineTo(x3,y3);
	timelnCtx.lineTo(x4,y4);
	timelnCtx.fill();
	timelnCtx.closePath() ;
    timelnCtx.stroke();
	timelnCtx.restore();
	//console.log("x1::"+x1+"y1::"+y1+"x2::"+x2+"y2::"+y2);
	//ctx.closePath();
	//ctx.stroke();
}
function createProgressLine(x1,y1,x2,y2,styleColor){
	timelnCtx.beginPath();
	timelnCtx.strokeStyle = styleColor;
	timelnCtx.lineWidth= timeLineWidth;
	timelnCtx.moveTo(x1, y1);
    timelnCtx.lineTo(x2, y2);
	timelnCtx.stroke();
}


function createTimeLineOval_(x1,y1,x2,y2,x3,y3,x4,y4,styleColor){
	timelnCtx.save();
    timelnCtx.beginPath();
	timelnCtx.strokeStyle = styleColor;
	timelnCtx.fillStyle = styleColor;
	var rx = (x1 + x2)/2;
	var ry = (y1 + y2)/2;
	var px = (x3 + x4)/2;
	var py = (y3 + y4)/2;
	if( x1 == x2){
	//console.log("11111111111");
		timelnCtx.moveTo(x1,ry);
		timelnCtx.bezierCurveTo(x1, y1, x4, y4, x4, py);
		timelnCtx.bezierCurveTo(x3, y3, x2, y2, x1, ry);
	}else{
	//console.log("22222222222222222");
		timelnCtx.moveTo(rx,ry);
		timelnCtx.bezierCurveTo(x1, y1, x4, y4, px, py);
		timelnCtx.bezierCurveTo(x3, y3, x2, y2, rx, ry);
	}
	timelnCtx.fill();
	timelnCtx.closePath() ;
    timelnCtx.stroke();
	timelnCtx.restore();
}


function createTimeLineOval(x, y, xe, ye,styleColor,pageNum){
	//console.log("createTimeLineOval:"+pageNum+"::tempPageSelId::"+tempPageSelId);
	timelnCtx.save();
	timelnCtx.lineWidth = 1;
	var rx = (xe - x) / 2;
    var ry = (ye - y) / 2;
	//console.log("x:"+x+":y:"+y);
	timelnCtx.strokeStyle = styleColor;
	timelnCtx.beginPath();
	timelnCtx.moveTo(x + timeLinePageObjRadius,timeLineTop);
	timelnCtx.lineTo(x + timeLinePageObjRadius,timeLineTop + pageCircleDistfrmLine);
	timelnCtx.moveTo(x,y);
	timelnCtx.stroke();
	timelnCtx.beginPath();
	timelnCtx.translate(x + timeLinePageObjRadius - 1, y + timeLinePageObjRadius);
    rx = Math.abs(rx);
    ry = Math.abs(ry);
    if (rx < ry){
        timelnCtx.scale(1, Math.abs(ry / rx));
        timelnCtx.arc(1, 1, rx, 0, 2 * Math.PI, false);
    }else{
        timelnCtx.scale(Math.abs(rx / ry), 1);
        timelnCtx.arc(1, 1, ry, 0, 2 * Math.PI, false);
    }
	if(tempPageSelId != null && tempPageSelId == pageNum){
		timelnCtx.fillStyle = "#00ff00";
		timelnCtx.globalAlpha= 0.5;
		timelnCtx.fill();
	}
	else if(activePage == pageNum){
		timelnCtx.fillStyle = "#00ff00";
		timelnCtx.globalAlpha= 0.5;
		timelnCtx.fill();
	}
	timelnCtx.fillStyle = "#000000";
	timelnCtx.font="15px Georgia";
	timelnCtx.fillText(pageNum,rx-12,ry-5);
	timelnCtx.closePath() ;
    timelnCtx.stroke();
	timelnCtx.restore();
	timelnCtx.globalAlpha = 1.0;
}

function createAnnotatedObjOnTimeLine(x, y, xe, ye,styleColor){
	timelnCtx.save();
	timelnCtx.lineWidth = 1;
	var rx = (xe - x) / 2;
    var ry = (ye - y) / 2;
	//console.log("x:"+x+":y:"+y);
	timelnCtx.strokeStyle = styleColor;
	timelnCtx.beginPath();
	timelnCtx.moveTo(x + timeLinePageObjRadius,timeLineTop);
	timelnCtx.lineTo(x + timeLinePageObjRadius,timeLineTop - pageCircleDistfrmLine);
	//timelnCtx.moveTo(x,y);
	timelnCtx.stroke();
	
    timelnCtx.beginPath();
	timelnCtx.translate(x + timeLinePageObjRadius - 1, y + timeLinePageObjRadius);
    rx = Math.abs(rx);
    ry = Math.abs(ry);
    if (rx < ry){
        timelnCtx.scale(1, Math.abs(ry / rx));
        timelnCtx.arc(1, 1, rx, 0, 2 * Math.PI, false);
    }else{
        timelnCtx.scale(Math.abs(rx / ry), 1);
        timelnCtx.arc(1, 1, ry, 0, 2 * Math.PI, false);
    }
	
	timelnCtx.fillStyle = "#000000";
	timelnCtx.font="15px Georgia";
	timelnCtx.fillText("i",rx-10,ry-4);
	timelnCtx.closePath() ;
    timelnCtx.stroke();
	timelnCtx.restore();
	timelnCtx.globalAlpha = 1.0;
}



function createSliderOval(x, y, xe, ye,styleColor){
	//alert("oval"+styleColor);
	//console.log("activePage:;"+activePage+":pageNum:"+pageNum);
	timelnCtx.save();
	
	timelnCtx.lineWidth = 1;
	var rx = (xe - x) / 2;
    var ry = (ye - y) / 2;
	//console.log("x:"+x+":y:"+y);
	//alert("oval"+styleColor);
	timelnCtx.strokeStyle = styleColor;
	timelnCtx.beginPath();
	timelnCtx.globalAlpha = 0.5;
	timelnCtx.translate(x + rx, y + ry);
    rx = Math.abs(rx);
    ry = Math.abs(ry);
    if (rx < ry){
        timelnCtx.scale(1, Math.abs(ry / rx));
        timelnCtx.arc(1, 1, rx, 0, 2 * Math.PI, false);
    }else{
        timelnCtx.scale(Math.abs(rx / ry), 1);
        timelnCtx.arc(1, 1, ry, 0, 2 * Math.PI, false);
    }
	timelnCtx.fillStyle = "#ffffff";
	timelnCtx.fill();
	timelnCtx.closePath() ;
    timelnCtx.stroke();
	timelnCtx.restore();
	timelnCtx.globalAlpha = 1.0;
}


function findPos(obj) {
	var curleft = curtop = 0;
	//console.log("findPos::::"+obj.offsetParent);
	if (obj.offsetParent) {
		do {
		   curleft += obj.offsetLeft;
		   curtop += obj.offsetTop;
		} while (obj = obj.offsetParent);
		//console.log("curleft::"+curleft+"::curtop:"+curtop);
		return {x:curleft,y:curtop};
	}
}

var HighResolutionTimer = window.HighResolutionTimer = window.HighResolutionTimer || (function() {

var HighResolutionTimer = function(options) {
    this.timer = false;

    this.total_ticks = 0;

    this.start_time = undefined;
    this.current_time = undefined;

    this.duration = (options.duration) ? options.duration : 1000;
    this.callback = (options.callback) ? options.callback : function() {};

    this.run = function() {
      this.current_time = Date.now();
      if (!this.start_time) { this.start_time = this.current_time; }
      
      this.callback(this);

      var nextTick = this.duration - (this.current_time - (this.start_time + (this.total_ticks * this.duration) ) );
      this.total_ticks++;

      (function(i) {
        i.timer = setTimeout(function() {
          i.run();
        }, nextTick);
      }(this));

      return this;
    };

    this.stop = function(){
      clearTimeout(this.timer);
      return this;
    };
    
    return this;
  };

  return HighResolutionTimer;

}());


function togglePlayerTimeLine(){
	timeLineHide = false;
	$( "#timeline" ).slideToggle( "fast" );
	$( "#slider-Move" ).slideToggle( "fast" );
	
    
	
}

function handleMouseMoveOnTimeLine(e){
	var mouseX = parseInt(e.clientX - timelnOffsetX);
	var mouseY = parseInt(e.clientY - timelnOffsetY);
	//console.log("::::::handleMouseMoveOnTimeLine::::::"+isPlayingStoped+":::"+isPaused);
	if(sliderDrag){
		timelnCanvas.style.cursor = "pointer";
		var time = translateSliderOnTimeLine(mouseX,mouseY);
		if(time	!= null){
			isPlayingStoped = false;
			//console.log("key"+timeRefTable.getKey());
			//console.log("handleMouseMoveOnTimeLine lastDrawnObjTime::"+time);
			var pageNum = getCurrentObjPageNumber(time);
			//console.log("handleMouseMoveOnTimeLine pageNum::"+pageNum);
			activePage = pageNum;
			//console.log("handleMouseMoveOnTimeLine Active page::"+activePage);
			document.getElementById("pagenum").value = pageNum;
			ctx.clearRect(0, 0, canvas.width, canvas.height);
			drawNonRecordingObject(document.getElementById("pagenum").value);
			restoreRecordedObj(time,document.getElementById("pagenum").value);
			
		}
	}//else if(isPlayingStoped || isPaused) {
	  else if(isPlayingStoped) {
		//console.log("handleMouseMoveOnTimeLine");
		var objectTime = checkPointsOnTimeLineObj(mouseX,mouseY);
		//console.log("Time::::"+objectTime);
		selObjArray = null;
		selObjArray = new Array();
		if(objectTime != -1 ){
			clearTimeout(glowTimerId);
			timelnCanvas.style.cursor = "pointer";
			checkPageObject(objectTime,true);
			refreshTimeLine(objectTime);
			
			var recordedObjArr =timeRefTable.get(objectTime);
			for(var i=0;i<recordedObjArr.length;i++){
				var pageObj = recordedObjArr[i];
				var objId = pageObj.objectId;
				//console.log("objId:::"+objId);
				var pageNum = pageObj.num;
				if(pageNum == document.getElementById("pagenum").value){
					selObjArray[selObjArray.length] = objId;
				}
			}
			
			 if(selObjArray!= null){
				if(isPlayingStoped && sliderPosition == 0){
					timelnCanvas.style.cursor = "pointer";
					ctx.clearRect(0, 0, canvas.width, canvas.height);
					restore();
				  //console.log("ppp:"+document.getElementById("pagenum").value);
					var objectTable = pageObjTable.get(document.getElementById("pagenum").value);
					  for(var i=0;i<selObjArray.length;i++){
						var graphicsObject = objectTable.get(selObjArray[i]);
							//drawObject(objectTable,selObjArray[i],false);
							//console.log("selObjArray::::"+selObjArray);
							glowSelectedObject(graphicsObject);
							//glowTimerId = setTimeout('restoreGlowObject()',2000);
					}
			  }else{
				//console.log("lastDrawnObjTime::"+lastDrawnObjTime+":;objectTime::"+objectTime);
				if(lastDrawnObjTime	!= null && objectTime <= lastDrawnObjTime){
					ctx.clearRect(0, 0, canvas.width, canvas.height);
					drawNonRecordingObject(document.getElementById("pagenum").value);
					restoreRecordedObj(lastDrawnObjTime,document.getElementById("pagenum").value);
					var objectTable = pageObjTable.get(document.getElementById("pagenum").value);
					for(var i=0;i<selObjArray.length;i++){
						var graphicsObject = objectTable.get(selObjArray[i]);
							//drawObject(objectTable,selObjArray[i],false);
							//console.log("selObjArray::::"+selObjArray);
							glowSelectedObject(graphicsObject);
							//glowTimerId = setTimeout('restoreGlowObject()',2000);
							
					}
				}
				
			  }
			}
			
		}else{
			var status = checkPointsInSlider(mouseX,mouseY);
			if(status){
				timelnCanvas.style.cursor = "pointer";
			}else{
				timelnCanvas.style.cursor = "default";
				tempPageSelId = null;
				tempPageSelId = null;
				if(lastDrawnObjTime  != null){
					refreshTimeLine(lastDrawnObjTime);
				}else{
					refreshTimeLine(-1);
				}
				if(isPlayingStoped){
					ctx.clearRect(0, 0, canvas.width, canvas.height);
					restore();
				}else{
					//console.log("lastDrawnObjTime::"+lastDrawnObjTime+":;objectTime::"+objectTime);
					if(lastDrawnObjTime	!= null && objectTime <= lastDrawnObjTime){
						ctx.clearRect(0, 0, canvas.width, canvas.height);
						drawNonRecordingObject(document.getElementById("pagenum").value);
						restoreRecordedObj(lastDrawnObjTime,document.getElementById("pagenum").value);
					}
				}
			}
		}
		if(showAnoSymbol){
		//alert("showAnoSymbol");
			showAllAnnotationSymbol();
		}
	}
}

function handleMousedownOnTimeLine(e){
	var mouseX = parseInt(e.clientX - timelnOffsetX);
	var mouseY = parseInt(e.clientY - timelnOffsetY);
	//console.log("timelnOffsetX::"+timelnOffsetX+"::timelnOffsetY::"+timelnOffsetY);	
	var status = checkPointsInSlider(mouseX,mouseY);
	//console.log("status::"+status);	
	if(status){
		sliderDrag = true;
		
	}else{
		sliderDrag = false;
	}
}
function handleClickOnTimeLine(e){
	//alert("click");
	var mouseX = parseInt(e.clientX - timelnOffsetX);
	var mouseY = parseInt(e.clientY - timelnOffsetY);	
	//console.log("x:"+mouseX+":y:"+mouseY);
	var objectTime = checkPointsOnTimeLineObj(mouseX,mouseY);
	//console.log("Time on click::::"+objectTime);
	selObjArray = null;
	selObjArray = new Array();
	if(objectTime != -1){
		clearTimeout(glowTimerId);
		var recordedObjArr =timeRefTable.get(objectTime);
		for(var i=0;i<recordedObjArr.length;i++){
			var pageObj = recordedObjArr[i];
			var objId = pageObj.objectId;
			//console.log("objId:::"+objId);
			var pageNum = pageObj.num;
			if(pageNum == document.getElementById("pagenum").value){
				stopPlaying();
				isPlayFromObject = true;
				checkPageObject(objectTime,false);
				refreshTimeLine(objectTime);
				lastDrawnObjTime = objectTime;
				playFronObjId = objId;
				//console.log("objId:::::::::::::::::::::::"+objId+"::selObjArray:"+selObjArray);
				//
			}else{
				//move to page and highlight them
				document.getElementById("pagenum").value = pageNum;
				document.getElementById("pagenumber").innerHTML = pageNum;
				activePage = pageNum;
				stopPlaying();
				isPlayFromObject = true;
				checkPageObject(objectTime,false);
				refreshTimeLine(objectTime);
				lastDrawnObjTime = objectTime;
				playFronObjId = objId;
				ctx.clearRect(0, 0, canvas.width, canvas.height);
				drawNonRecordingObject(pageNum);
				restoreAllRecordedObj(pageNum);
				//console.log("objId:::::::::::::::::::::::"+objId+"::selObjArray:"+selObjArray);
			
			}
		}
	}
}

function handleDblClickOnTimeLine(e){
	var mouseX = parseInt(e.clientX - timelnOffsetX);
	var mouseY = parseInt(e.clientY - timelnOffsetY);	
	var objectTime = checkPointsOnTimeLineObj(mouseX,mouseY);
	if(objectTime != -1){
		var recordedObjArr =timeRefTable.get(objectTime);
		if(recordedObjArr!= null && recordedObjArr.length > 0){
			var pageObj = recordedObjArr[0];
			var objId = pageObj.objectId;
			//console.log("objId:::"+objId);
			var pageNum = pageObj.num;
			var objectTable = pageObjTable.get(pageNum);
			var graphicsObj = objectTable.get(objId);
			if(graphicsObj.ref != null){
				selObjArray = null;
				selObjArray = new Array();
				selObjArray[0] = objId;
				playfromObject();
			}

		}
	}
}

function checkPointsOnTimeLineObj(mouseX,mouseY){
	var objTime = -1;
	if(timeLineObjArray != null){
		for(var i=0;i<timeLineObjArray.length;i++){
			var timeLineObject  = timeLineObjArray[i];
			var pointsArr = timeLineObject.pointsArray;
			if(is_in_ellipse(mouseX,mouseY,pointsArr[0],pointsArr[1],pointsArr[4],pointsArr[5])){
					//console.log("Points in Circle");
					//alert("In in Circle");
					objTime = timeLineObject.timeRef;
					break;
			}
		}
	}
	return objTime;
}

function checkPointsInSlider(mouseX,mouseY){
	//console.log("checkPointsInSlider::;"+mouseX+":mouseY:"+mouseY+"(1):"+sliderPointsArray[0]+","+sliderPointsArray[1]+","+sliderPointsArray[2]+","+sliderPointsArray[3]);
	if(is_in_ellipse(mouseX,mouseY,sliderPointsArray[0],sliderPointsArray[1],sliderPointsArray[2],sliderPointsArray[3])){
		//console.log("Points in Slider");
		//alert("In in Circle");
		return true;
	}else{
		return false;
	}
}

function translateSliderOnTimeLine(mouseX,mouseY){
	//console.log("translateSliderOnTimeLine::;"+mouseX);
		if(!moveSliderPointer){
			moveSliderPointer = true;
			sliderStart();
		}
		sliderPosition = mouseX;
		if(mouseX < timeLineLeft){
			sliderPosition = 0;
		}else if(mouseX >  (timeLineLeft + sliderLength)){
			sliderPosition =  sliderLength ;
		}else{
			sliderPosition = sliderPosition -(timeLineLeft - sliderRadius);
		}
		
		
		var time = (sliderPosition * recFileDuration)/ sliderLength ;
		//console.log("myVid.currentTime "+(time/1000));
		//sliderPosition = sliderPosition - (timeLineLeft - sliderRadius);
		sortedTimeRefTable.moveFirst();
		while(sortedTimeRefTable.next()){
			var objTime = sortedTimeRefTable.getKey();
			if(objTime <= time){
				lastDrawnObjTime = objTime;
			}else{
				break;
			}
		}
		if(lastDrawnObjTime  != null){
			refreshTimeLine(lastDrawnObjTime);
		}else{
			refreshTimeLine(-1);
		}
		return time;
	
}
function restoreGlowObject(){
	selObjArray = null;
	selObjArray = new Array();
	ctx.clearRect(0, 0, canvas.width, canvas.height);
	restore();
}
function glowObject(){
	//console.log("glow object");
	ctx.save();
	ctx.shadowColor = '#450018';
	ctx.shadowBlur = 20;
	ctx.shadowOffsetX = 0;
	ctx.shadowOffsetY = 0;
	ctx.stroke();
	ctx.restore();
}
function sliderStop(){
	 clearTimeout(runningTimerId);	
	 refreshTimeLine(-1);
	 stopSlide();
	 playingFrom = 2;
	 //console.log(":::::sliderStop()::::");
	 if(myVid.src == null || myVid.src == ''){
		myVid.src = "http://"+window.location.host+"/"+filename;
		
		
		//myVid.currentTime  = currentAudioTime;
	 }else{
	 	currentAudioTime  = (sliderPosition*recFileDuration) / sliderLength;
		//console.log("-----------currentAudioTime-------"+currentAudioTime);
		myVid.currentTime  =  Math.ceil(currentAudioTime / 1000);;
	 }
	
}
function sliderStart(){
	//console.log("Slide start:::::::::");
	//isPaused = true;
	myVid.pause();
	clearTimeout(runningTimerId);
	//console.log(" clearTimeout(sliderTimer)333333333333");	
	//clearTimeout(sliderTimer);
	stopSlide();
	document.getElementById("playpauseBut").className  = "fa fa-lg fa-play-circle";
}

function toggleAnootationButton(){
	var button = document.getElementById("annotationButt");
	if(button.className == "btn btn-default active"){
		button.className = "btn btn-default";
		showAnoSymbol = false;
		stopPlaying();
		//alert("body click");
	}else{
		button.className = "btn btn-default active"
		showAnoSymbol = true;
		showAllAnnotationSymbol();
		//alert("active");
	}
			
}

function showAllAnnotationSymbol(){
	showAnoSymbol = true;
	//stopPlaying();
	var pageNum = document.getElementById("pagenum").value;
	var objectTable = pageObjTable.get(pageNum);
	if(objectTable != null){
		objectTable.moveFirst();
		while(objectTable.next()){
			var graphicsObj = objectTable.getValue();
			if(graphicsObj.ref != null){
				var pointsArr = graphicsObj.pointsArray;
				showAnnotationSymbol(pointsArr[0],pointsArr[1]);
			}
		}
	}
}
function showAnnotationSymbol(x,y){
	var xe = x - 2*timeLinePageObjRadius;
	var ye = y - 2*timeLinePageObjRadius;
	ctx.save();
	ctx.lineWidth = 1;
	var rx = (xe - x) / 2;
    var ry = (ye - y) / 2;
	ctx.strokeStyle = styleColor;
	
    ctx.beginPath();
	ctx.translate(x + timeLinePageObjRadius - 1, y + timeLinePageObjRadius);
    rx = Math.abs(rx);
    ry = Math.abs(ry);
    if (rx < ry){
        ctx.scale(1, Math.abs(ry / rx));
        ctx.arc(1, 1, rx, 0, 2 * Math.PI, false);
    }else{
        ctx.scale(Math.abs(rx / ry), 1);
        ctx.arc(1, 1, ry, 0, 2 * Math.PI, false);
    }
	
	ctx.fillStyle = "#000000";
	ctx.font="15px Georgia";
	ctx.fillText("i",rx-10,ry-4);
	ctx.closePath() ;
    ctx.stroke();
	ctx.restore();
}


function fastForward(){
	isFForRW = false;
	sortedTimeRefTable.moveFirst();
	var nextObjectTime = -1;
	console.log("--fastForward--lastDrawnObjTime::"+lastDrawnObjTime);
	//console.log("sortedTimeRefTable::"+sortedTimeRefTable);
	while(sortedTimeRefTable.next()){
		var objTime = sortedTimeRefTable.getKey();
		if(parseInt(objTime) <= parseInt(lastDrawnObjTime)){
		}else{
			nextObjectTime = objTime;
			break;
		}
	}
	
	console.log("--fastForward()---nextObjectTime::"+nextObjectTime);
	if(nextObjectTime != -1){
		var recordedObjArr =timeRefTable.get(nextObjectTime);
		if(recordedObjArr!= null && recordedObjArr.length > 0){
			var pageObj = recordedObjArr[0];
			var objId = pageObj.objectId;
			selObjArray[0] = objId;
		}
		playingFrom = 3;
		
		if(myVid.src == null || myVid.src == ''){
			myVid.src = "http://"+window.location.host+"/"+filename;
		}else{
			myVid.currentTime = (nextObjectTime/1000);
		}
		sliderPosition = Math.floor((sliderLength * nextObjectTime)/recFileDuration);
		clearTimeout(runningTimerId);
		stopSlide();		
		//console.log("--fastForward()---playerState:After:"+playerState);
		/*			
		sliderPosition = Math.floor((sliderLength * nextObjectTime)/recFileDuration);
		clearTimeout(runningTimerId);	
		//clearTimeout(sliderTimer);
		stopSlide();
		playingFrom = 2;
		//sliderPos =  Math.floor(currTime * 100/recFileDuration);
		currentAudioTime = nextObjectTime ;
		myVid.currentTime  = Math.ceil(nextObjectTime / 1000);;
		*/
	}
}

function rewind(){
	isFForRW = false;
	sortedTimeRefTable.moveFirst();
	var prevObjectTime = -1;
	//console.log("sortedTimeRefTable::"+sortedTimeRefTable);
	//console.log("--rewind--lastDrawnObjTime::"+lastDrawnObjTime);
	while(sortedTimeRefTable.next()){
		var objTime = sortedTimeRefTable.getKey();
		if(	prevObjectTime == -1){
			prevObjectTime = objTime ;
		}
		if(objTime == lastDrawnObjTime){
			break;
		}
	}
	sortedTimeRefTable.prev();
	if(sortedTimeRefTable.getKey() != null){
		prevObjectTime = sortedTimeRefTable.getKey()
	}
	//console.log("PrevObjectTime::"+prevObjectTime);
	
	if(prevObjectTime != -1){
		var recordedObjArr =timeRefTable.get(prevObjectTime);
		if(recordedObjArr!= null && recordedObjArr.length > 0){
			var pageObj = recordedObjArr[0];
			var objId = pageObj.objectId;
			selObjArray[0] = objId;
		}
		playingFrom = 3;
		
		if(myVid.src == null || myVid.src == ''){
			myVid.src = "http://"+window.location.host+"/"+filename;
		}else{
			myVid.currentTime = (prevObjectTime/1000);
		}
		sliderPosition = Math.floor((sliderLength * prevObjectTime)/recFileDuration);
		clearTimeout(runningTimerId);
		stopSlide();		
		//console.log("--rewind()---playerState:After:"+playerState);
	
	
	/*sliderPosition = Math.floor((sliderLength * prevObjectTime)/recFileDuration);
		clearTimeout(runningTimerId);	
		//clearTimeout(sliderTimer);
		stopSlide();
		playingFrom = 2;
		//sliderPos =  Math.floor(currTime * 100/recFileDuration);
		currentAudioTime =  Math.ceil(prevObjectTime / 1000);
		myVid.currentTime  = currentAudioTime;
	*/
	}
	
}
function createMenu(x,y){
	menuObjectArr = null;
	menuObjectArr = new Array();
	var objectTable = pageObjTable.get(document.getElementById("pagenum").value);
	var graphicsObj = objectTable.get(selObjId);
	var reqArr = null;
	if(graphicsObj.ref != null){
		menuArray1[menuArray1.length] = "Open Reference";
	}
	if(graphicsObj.attachment != null){
		menuArray1[menuArray1.length] = "Open Attachment";
	}
	reqArr = menuArray1;
	var type = 0;
	for(var i=0;i< reqArr.length;i++){
		var y1 = y +i*menuHeight;
		if(reqArr[i] == "Open Reference"){
			type = 1;
		}else if(reqArr[i] == "Open Attachment"){
			type = 2;
		}
		drawMenu(x,y1,reqArr[i],type);
		if(i!=0){
		  drawMenuSeprator(x,y1);
		 }
	}
	//alert("done");
}
function drawMenuSeprator(x,y){	
	//console.log("drawMenuSeprator:::"+ctx.globalAlpha);
	ctx.save();
	ctx.beginPath();
	ctx.strokeStyle = "#ffffff";
	ctx.lineWidth = 1;
	ctx.moveTo(x+5,y);
	ctx.lineTo(x+ menuWidth -5,y);
	ctx.stroke();
	ctx.restore();
}

function drawMenu(x,y,menuTxt,type){
	ctx.globalAlpha = 1.0;
	//alert("createMenu");
	ctx.save();
	ctx.beginPath();
	var pointsArr = new Array();
	pointsArr[0] = x;
	pointsArr[1] = y;
	pointsArr[2] = x + menuWidth;
	pointsArr[3] = y;
	pointsArr[4] = x + menuWidth;
	pointsArr[5] = y + menuHeight;
	pointsArr[6] = x;
	pointsArr[7] = y + menuHeight;
	ctx.strokeStyle = "#b20000";
	ctx.lineWidth = 2;
	ctx.lineCap = 'round';
	ctx.lineJoin = 'round';
	//console.log("drawMenu:::"+menuTxt+":x::"+pointsArr);
	createRectangleNew(pointsArr[0], pointsArr[1], pointsArr[2], pointsArr[3], pointsArr[4], pointsArr[5], pointsArr[6], pointsArr[7]);
	ctx.fillStyle = "#b20000";
	ctx.fill();
	ctx.save()
	if(pointsOnMenu != -1 && pointsOnMenu == type){
		ctx.fillStyle = "#ffffff";
	}else{
		ctx.fillStyle = "#000000";
	}
	
	ctx.font="15px Georgia";
	
	ctx.fillText(menuTxt,x+10,y+20);
	ctx.closePath();
	ctx.stroke();
	
	var menuObj = new MenuObject(type,pointsArr);
	menuObjectArr[menuObjectArr.length] = menuObj;
	//alert("done");
}

function checkPointsOnMenuItem(x,y){
	//console.log("checkPointsOnMenuItem");
	var type = -1;
	if(menuObjectArr != null){
		for(var i=0;i<menuObjectArr.length;i++){
			var menuObj = menuObjectArr[i];
			var pointsArr = menuObj.pointsArray;
			var polyArr = new Array();
			var pt1 = new points(pointsArr[0],pointsArr[1]);
			var pt2 = new points(pointsArr[2],pointsArr[3]);
			var pt3 = new points(pointsArr[4],pointsArr[5]);
			var pt4 = new points(pointsArr[6],pointsArr[7]);
			polyArr[0] = pt1;
			polyArr[1] = pt2;
			polyArr[2] = pt3;
			polyArr[3] = pt4;
			var pt = new points(x,y);
			if(isPointInPoly(polyArr,pt)){
				type =  menuObj.type;
				break;
			} 
		}
	}
	return type;
}

function getLastDrawnPageNumber(objectTime){
	if(objectTime != -1){
		var recordedObjArr = timeRefTable.get(objectTime);
		if(recordedObjArr != null && recordedObjArr.length > 0){
			var pageObj = recordedObjArr[0];
			var objId = pageObj.objectId;
			var pageNum = pageObj.num;
			return pageNum;
		}
	}

}
function getCurrentObjPageNumber(currTime){
	sortedTimeRefTable.moveFirst();
	var objTime = -1;
	while(sortedTimeRefTable.next()){
		var objectTime = sortedTimeRefTable.getKey();
		if(parseInt(objectTime) < parseInt(currTime)){
			objTime = objectTime;
			continue;
		}else{
			break;
		}
	}
	//console.log("objTime::::::"+objTime+"::currTime:;"+currTime);
	if(objTime != -1){
		var recordedObjArr = sortedTimeRefTable.get(objTime);
		if(recordedObjArr != null && recordedObjArr.length > 0){
			var pageObj = recordedObjArr[0];
			var objId = pageObj.objectId;
			var pageNum = pageObj.num;
			return pageNum;
		}
	}else{
		return -1;
	}
}

function checkPageObject(objectTime,isTempSel){
	if(objectTime != -1){
		var recordedObjArr = timeRefTable.get(objectTime);
		if(recordedObjArr != null && recordedObjArr.length > 0){
			var pageObj = recordedObjArr[0];
			var objId = pageObj.objectId;
			var pageNum = pageObj.num;
			var objectTable = pageObjTable.get(pageNum);
			var graphicsObj = objectTable.get(objId);
			if(graphicsObj.type == 10){
				if(isTempSel){
					tempPageSelId = pageNum;
				}else{
					activePage = pageNum;
				}
				
			}
		}
	}
}
function getFirstPage(){
	sortedTimeRefTable.moveFirst();
	while(sortedTimeRefTable.next()){
		var objectTime = sortedTimeRefTable.getKey();
		var recordedObjArr = timeRefTable.get(objectTime);
		if(recordedObjArr != null && recordedObjArr.length > 0){
			var pageObj = recordedObjArr[0];
			var objId = pageObj.objectId;
			var pageNum = pageObj.num;
			var objectTable = pageObjTable.get(pageNum);
			var graphicsObj = objectTable.get(objId);
			if(graphicsObj.type == 10){
				return pageNum;
			}
		}
	}


	if(objectTime != -1){
		var recordedObjArr = timeRefTable.get(objectTime);
		if(recordedObjArr != null && recordedObjArr.length > 0){
			var pageObj = recordedObjArr[0];
			var objId = pageObj.objectId;
			var pageNum = pageObj.num;
			var objectTable = pageObjTable.get(pageNum);
			var graphicsObj = objectTable.get(objId);
			if(graphicsObj.type == 10){
				if(isTempSel){
					tempPageSelId = pageNum;
				}else{
					activePage = pageNum;
				}
				
			}
		}
	}
}

function checkPointsInAnnotation(mouseX,mouseY){
	var retVal = -1;
	var pageNum = document.getElementById("pagenum").value;
	var objectTable = pageObjTable.get(pageNum);
	if(objectTable != null){
		objectTable.moveFirst();
		while(objectTable.next()){
			var graphicsObj = objectTable.getValue();
			if(graphicsObj.ref != null){
				var pointsArr = graphicsObj.pointsArray;
				if(checkPointsinAnnoSymbol(pointsArr[0],pointsArr[1],mouseX,mouseY)){
					retVal =  objectTable.getKey();
					break;
				}
			}
		}
	}
	return retVal;
}

function checkPointsinAnnoSymbol(x,y,mouseX,mouseY){
    //console.log("checkPointsinAnnoSymbol::");
	var xe = x + 2*timeLinePageObjRadius;
	var ye = y + 2*timeLinePageObjRadius;
	//console.log("mx::"+mouseX+",my:;"+mouseY+":,:"+x+"::,"+y+":,::"+xe+"::,::"+ye);
	if(is_in_ellipse(mouseX,mouseY,x,y,xe,ye)){
		return true;
	}
	return false;
}
function closeLecture(){
  document.location.href = "userlectures";
}

function restoreAndDrawRecAndNonRecObj(key){
	timeRefTable.moveFirst();
	var recordedObjArr = timeRefTable.get(key);
	if(recordedObjArr != null){
		var pageObj = recordedObjArr[0];
		var objectTable = pageObjTable.get(pageObj.num);
		ctx.clearRect(0, 0, canvas.width, canvas.height);
		drawNonRecordingObject(pageObj.num);
		restoreRecordedObj(key,pageObj.num);
		for(var i=0;i<recordedObjArr.length;i++){
			var pageObj = recordedObjArr[i];
			drawObject(objectTable,pageObj.objectId,false);
		}
	}
}

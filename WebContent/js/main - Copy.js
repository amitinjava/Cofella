		var filename="";
		var isSaved=false;
		var recCount = 0;
		var isRecRunning = false;
		var recorderApp = angular.module('recorder', [ ]);
		var ans = false;

		recorderApp.controller('RecorderController', [ '$scope' , function($scope) {
			$scope.stream = null;
			$scope.recording = false;
			$scope.encoder = null;
			$scope.ws = null;
			$scope.input = null;
			$scope.node = null;
			$scope.samplerate = 22050;
			$scope.samplerates = [ 8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000 ];
			$scope.bitrate = 64;
			$scope.bitrates = [ 8, 16, 24, 32, 40, 48, 56, 64, 80, 96, 112, 128, 144, 160, 192, 224, 256, 320 ];
			$scope.recordButtonStyle = "red-btn";
			/*
			$scope.initPlayer = function(){
				//alert("init player");
				var myPlayer=document.getElementById("audio1");
				
				myPlayer.addEventListener("loadedmetadata", function(_event) {
				/*
					console.log("load meta data main.js");
						var duration = myPlayer.duration;
						recFileDuration = Math.ceil(duration * 1000);
						//console.log("duration:-------------------------------"+recFileDuration);
					*/	
			/*	
				});
			}
			$scope.initPlayer();
			*/
			$scope.checkRecordingButton = function(){
				if(recordButton.className == 'recinactive'){
					return;
				}
				if(isRecRunning){
					//alert("stop recording"+recordButton.className);
					recordButton.className = "record";
					clearTimeout(blinkTimer);
					// enable all buttons in player 
					document.getElementById("rwButton").disabled = true;
					document.getElementById("stopButton").disabled = false;
					document.getElementById("playpause").disabled = false;
					document.getElementById("ffButton").disabled = true;
					//isRecRunning = false;
					$scope.stopRecording();
				}else{
					$scope.checkRecordingStatus();
				}
				
			};
			
			$scope.checkRecordingStatus = function(){
				//alert("setRecordingEnv:::");
				if(recCount != 0){
					$('#player-Modal').modal('show');
				}
				else{
					canvas.style.cursor  = "wait";
					$scope.setRecordingEnv(false);
				}
					
			};
			
			$scope.setRecordingEnv =function(){
				if(!ans){
						recFileDuration = 0;
						document.getElementById("cTime").innerHTML = "<b>00:00</b>";
						document.getElementById("eTime").innerHTML = "<b>00:00</b>";
						if(isSaved){
							//Delete existing recording file
								
								jQuery.ajax({
								  	type:	"get",
							  		url: 	"deleterecording.action",
							  		data: 	"",
						  		success:function(msg) {
									alert("Delete existing recording");
									//console.log("-------Delete Existing Recording------");
						  			if(msg.actionErrors != null){
						  				alert("error");
						  				return;
						  		  	}else{
										alert("Delete existing recording done");
						  		  	//console.log("------Successfully Deleted------");
						  		  	}
						  	}});
							
						}else{
							//filename = "recordings/" + "recording"+ Math.round(Math.random()*1000)+".mp3";
							filename ='Enotebook/'+userId + '/'+meetingName+'/'+meetingName+'.mp3';
						}
						objectTimeTable.moveFirst();
						while(objectTimeTable.next()){
							var pageNum = null;
							var val = objectTimeTable.getKey();
							var recordedObjArr = timeRefTable.get(objectTimeTable.getValue());
							for(var i=0;i< recordedObjArr.length;i++){
								var pageObj = recordedObjArr[i];
									if(pageObj != null){
										pageNum = pageObj.num;
										var objId = pageObj.objectId;
										if(objId == val)
											break;
										}
							}
							
							var nonRecordingObjArray = nonRecordinPageObjTable.get(pageNum);
							if(nonRecordingObjArray == null){
								nonRecordingObjArray = new Array();
								nonRecordinPageObjTable.put(pageNum,nonRecordingObjArray);
							}
							//console.log("------convert recorded to non recorded------"+val);
							nonRecordingObjArray[nonRecordingObjArray.length] = val;
						//console.log("------convert recorded to non recorded------"+nonRecordingObjArray.length);
					 }
					 timeRefTable= null;
					 objectTimeTable = null;
					 timeRefTable = new Hashtable();
					 objectTimeTable = new Hashtable();
					 				
					}else{
						if(filename.length >0){

								var myPlayer=document.getElementById("audio1");
								myPlayer.src = "http://"+window.location.host+"/"+filename;
								/*
								myPlayer.addEventListener("loadedmetadata", function(_event) {
									//alert("load meta data");
										var duration = myPlayer.duration;
										recFileDuration = Math.ceil(duration * 1000);
										//console.log("duration:-------------------------------"+recFileDuration);
										
								
								});
								*/
								var oldFileName = filename;
								var pos = filename.lastIndexOf('[');
								if(pos == -1){
										var pos2 = filename.lastIndexOf('.mp3')
										filename = filename.substring(0,pos2) + '[1]' + filename.substring(pos2,filename.length);
								}else{
										var pos2 = filename.lastIndexOf('.mp3');
										var fCount = filename.substring(pos+1,pos2-1);
										filename = filename.substring(0,pos)+ '[' + (parseInt(fCount)+1)+']' + filename.substring(pos2,filename.length);
								}
								
								//console.log("filename:-----**************************************--------------------------"+filename);
								jQuery.ajax({
										type:	"get",
										url: 	"copyrecording.action",
										data: 	"fileName="+filename+"&oldFileName="+oldFileName,
									success:function(msg) {
										//console.log("-------Copy Existing Recording------");
										if(msg.actionErrors != null){
											alert("error");
											return;
										}else{
										//console.log("------Successfully Copied------");
										}
								}});



								
						}else{
							/*
							ctx.clearRect(0, 0, canvas.width, canvas.height);
							restore();
							$scope.startRecording();
							*/
						}
						timeRefTable.moveLast();
						//console.log("-------Start recording------"+timeRefTable.getKey());
						var recordedObjArr = timeRefTable.getValue();
						var pageObj = recordedObjArr[0];
						//alert(pageObj);
						console.log("pageObj:::::::"+pageObj);
						if(pageObj != null){
								document.getElementById("pagenum").value = pageObj.num;
						}
					}
					ctx.clearRect(0, 0, canvas.width, canvas.height);
					restore();
					$scope.stopPlaying();
					$scope.startRecording();
				
					/*
					jQuery.ajax({
							type:	"get",
							url: 	"setrecordingenv.action",
							data: 	"meetingName="+meetingName+"&status="+ans,
						success:function(msg) {
							//console.log("-------setRecordingEnv------"+msg);
							if(msg.actionErrors != null){
								alert("error");
							}else{
								if(ans){
									timeRefTable.moveLast();
									//console.log("-------Start recording------"+timeRefTable.getKey());
									var pageObj = timeRefTable.getValue();
									if(pageObj != null){
											document.getElementById("pagenum").value = pageObj.num;
									}
								}else{
									//objectTimeTable.put(count,currentMiliSec);
									//timeRefTable.put(currentMiliSec,pageObject);

									objectTimeTable.moveFirst();
									while(objectTimeTable.next()){

										var pageObject = timeRefTable.get(objectTimeTable.getValue());
										var pageNum = pageObject.num;
										var nonRecordingObjArray = nonRecordinPageObjTable.get(pageNum);
										if(nonRecordingObjArray == null){
											nonRecordingObjArray = new Array();
											nonRecordinPageObjTable.put(pageNum,nonRecordingObjArray);
										}
										nonRecordingObjArray[nonRecordingObjArray.length] = objectTimeTable.getKey();
										
									}
								}

								ctx.clearRect(0, 0, canvas.width, canvas.height);
								restore();
								$scope.startRecording();
							}
									
					}});*/
			}
			
			
			
			$scope.stopPlaying = function (){
					//alert("stop playing"+myVid.readyState);
					
					//console.log(" clearTimeout(sliderTimer)444444444444444");
					clearTimeout(sliderTimer);
					if(runningTimerId != null){
						clearTimeout(runningTimerId);
					}
					isPlayingStoped = true;
					sliderPos = 0;
					//console.log("myVid::::"+myVid);
					myVid.pause();
					if(myVid.readyState > 0){
						myVid.currentTime = 0;
					}
					var pageNumber = document.getElementById("pagenum").value;
					drawNonRecordingObject(pageNumber);
					restoreAllRecordedObj(pageNumber);
					document.getElementById("playpause").className  = "play";
					jQuery('#ex1').slider('setValue',sliderPos);
					

			}

			$scope.startRecording = function() {
				
				//console.log("Recording start-----------------------------------------------------------");
				if ($scope.recording)
					return;
				//console.log('start recording');
				$scope.encoder = new Worker('js/encoder.js');
				//console.log('initializing encoder with samplerate = ' + $scope.samplerate + ' and bitrate = ' + $scope.bitrate);
				$scope.encoder.postMessage({ cmd: 'init', config: { samplerate: $scope.samplerate, bitrate: $scope.bitrate } });
				$scope.encoder.onmessage = function(e) {
					$scope.ws.send(e.data.buf);
					if (e.data.cmd == 'end') {
						$scope.ws.close();
						$scope.ws = null;
						$scope.encoder.terminate();
						$scope.encoder = null;
					}
				};
				var loc = window.location.host;
				//loc = loc.substring(0,loc.indexOf(':'));
				//console.log("loc::::"+loc);
				if(filename.length == 0){
				//	filename = "recordings/" + "recording"+ Math.round(Math.random()*1000)+".mp3";
					
					filename ='Enotebook/'+userId + '/'+meetingName+'/'+meetingName+'.mp3';
				}
				recCount = recCount + 1;
				//console.log("<-------filename----->"+filename);
				//alert("filename"+filename);
				try{
					//console.log("--------------------Try to open websocket----------------------------------")
					$scope.ws = new WebSocket("ws://"+loc+":9000/ws/audio?recording="+filename);
					//$scope.ws = new WebSocket("ws://ttmachine.edupeak.com:9000/ws/audio?recording="+filename);
				}catch(err){
					//console.log("<------------error occured----------------->");
				}
				//console.log("<-------1111111111111111----->");
				$scope.ws.onopen = function() {
					//console.log("<----------WebSocket open----->");
					$scope.ws.send(filename);
					navigator.webkitGetUserMedia({ video: false, audio: true }, $scope.gotUserMedia, $scope.userMediaFailed);
					//console.log("--------------Recording Start-----");
				};
			};

			$scope.userMediaFailed = function(code) {
				//console.log('grabbing microphone failed: ' + code);
			};

			$scope.startmeeting = function(code) {
	
				//console.log('startmeeting ---------------------------');

			};

			$scope.gotUserMedia = function(localMediaStream) {
				$scope.recording = true;
				isRecRunning = true;
				recordButton.className = "recording"
				//startBlink();
				console.log("-----------------Clock Start---------------");
				if(recCount >1){
					if(objectTimeTable.size()>0){
							//console.log("-----------------Check File Name---------------");
							var myPlayer=document.getElementById("audio1");
							
							//myVid.src = "http://localhost:8080/"+filename;
							//myVid.src = "http://localhost/"+filename;
							myPlayer.src = "http://"+window.location.host+"/"+filename;
							currentMiliSec =  Math.ceil(recFileDuration * 1000);
							//console.log("duration:"+currentMiliSec);
							/*
							myVid.addEventListener("loadedmetadata", function(_event) {
									var duration = myVid.duration;
									currentMiliSec =  Math.ceil(duration * 1000);
									//console.log("duration:"+currentMiliSec);
									//console.log("clock--------2-------:"+currentMiliSec);
									//clock();
							});*/
					}else{
						//clock();
					}
				}else{
					//console.log("--------Clock Start-------:"+currentMiliSec);
					//clock();
				}
				$scope.recordButtonStyle = '';

				console.log('success grabbing microphone');
				$scope.stream = localMediaStream;

				var audio_context = new window.webkitAudioContext();
		
				$scope.input = audio_context.createMediaStreamSource($scope.stream);
				//console.log("hdkfhkdshfdshkfhds::;"+$scope.input.context.createScriptProcessor(4096, 1, 1));
				try{
					$scope.node = $scope.input.context.createJavaScriptNode(4096, 1, 1);
				}catch(f){
					$scope.node = $scope.input.context.createScriptProcessor(4096, 1, 1);
				}
  

				console.log('sampleRate: ' + $scope.input.context.sampleRate);

				$scope.node.onaudioprocess = function(e) {
					if (!$scope.recording)
						return;
				var channelLeft = e.inputBuffer.getChannelData(0);
				canvas.style.cursor  = "default";
				/*
				var currentTime = new Date().getTime();
				currentMiliSec = recFileDuration + Math.ceil(currentTime - startTime);
				if(currentMiliSec >0){
					//console.log('Send audio data: :::::::::::::::::'+currentMiliSec);
				}
				*/
//				console.log(":::startTime:::"+startTime);
				if(startTime == 0){
						clock();
				    }
					startBlink();
					// disable all other buttons in player 
					document.getElementById("rwButton").disabled = true;
					document.getElementById("stopButton").disabled = true;
					document.getElementById("playpause").disabled = true;
					document.getElementById("ffButton").disabled = true;
					
					$scope.encoder.postMessage({ cmd: 'encode', buf: channelLeft });
				};

				$scope.input.connect($scope.node);
				$scope.node.connect(audio_context.destination);

				$scope.$apply();
			};

			$scope.stopRecording = function() {
				
				//console.log("--------Clock Stop-------:"+currentMiliSec);
				if (!$scope.recording) {
					return;
				}
				$scope.recordButtonStyle = "red-btn";
				//console.log('stop recording');
				$scope.stream.stop();
				$scope.recording = false;
				isRecRunning = false;
				
				startTime = 0;
				$scope.encoder.postMessage({ cmd: 'finish' });

				$scope.input.disconnect();
				$scope.node.disconnect();
				$scope.input = $scope.node = null;
				clearTimeout(timer);
				myVid.src = "http://"+window.location.host+"/"+filename;
				console.log("src::::"+myVid.src);
			};
	}]);
		
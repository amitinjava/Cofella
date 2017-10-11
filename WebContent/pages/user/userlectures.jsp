<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Lectures</title>

    <!-- Bootstrap -->
    <link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/css/custom.css" rel="stylesheet">

    <!-- Custom fonts for icons -->
    <link href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="fa/css/font-awesome.min.css">
	
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
 <body>
<s:if test="errorMsg != null">
<form action="userlectures" name="redirectForm" method="post">
 <input  type="text" name="actionName"  value='<s:property value="%{actionName}" />' />
 <input  type="text" name="errorMsg"  value='<s:property value="%{errorMsg}" />'  />
</form>  
 <script type="text/javascript">
  //  alert("hiiiiiiiiiii");
    document.redirectForm.submit();
     
 </script>
</s:if>
 
<s:include value="/pages/include/header.jsp"></s:include>

<div class="container">
  <a id="newLecMd" onclick="setAddData()" class="btn pull-right btn-primary"  data-toggle="modal" data-target="#myModal">Add Lecture</a>
  <span class="header">Lectures</span>
</div>


<div class="container">
<div class="input-group">
  <span class="input-group-addon">
    <span class="glyphicon glyphicon-search"></span>
  </span>
  <form action="userlectures" name="searchform" method="post">
	  <input type="text" name="meetingName" id = "searchText" class="form-control" placeholder="Search for lectures">
	
  </form>
</div>
</div>


<div class="container">
<form action="editlecture" name="editlectureform" method="post">
     <input type="hidden" name="meetingName" id="meetingName">
	 <input type="hidden" name="autoPlay" id="autoPlay">
	 <input type="hidden" name="channel_id" id="channel_id">
	 
</form>

<table class="table table-hover">
        <thead>
          <tr>
            <th class="col-sm-5">Channel</th>
            <!-- <th class="col-sm-2 text-right">Time</th>
            <th class="col-sm-2 text-right">Slides</th>
            <th class="col-sm-3 text-right">Date Modified</th> -->
            <th></th>
          </tr>
        </thead>

        <tbody>
        

          <s:iterator id="meeting" value="channelList">
          <tr>
            <!--<td><a href="#" onclick="submitEditLectureform('<s:property value='#meeting.lectureTitle'/>','false')"><s:property value='#meeting.lectureTitle'/></a></td> -->
			
		    <td>
              <div class="dropdown table-menu">
                <!--<a data-toggle="dropdown" href="#"><span class="badge badge-info">. . .</span></a> -->
				<a data-toggle="dropdown" href="#"><s:property value='#meeting.name'/></a>
                <ul class="dropdown-menu dropdown-menu-left" role="menu" aria-labelledby="dLabel">
                  <li onclick="setRenameModaldata('<s:property value='#meeting.name'/>')"><a id="editMd" data-toggle="modal" data-target="#editModal">Rename</a></li>
                  <s:if test="#meeting.lectureDuration.equals('00:00')" >
                 	<li><a  style="color:#ddd;cursor:not-allowed;">Play</a></li>
                  </s:if>
                  <s:else>
                  <li onclick="submitEditLectureform('<s:property value='#meeting.name'/>','true')"><a>Play</a></li>
                  </s:else>
				  <li onclick="submitEditLectureform('<s:property value='#meeting.name'/>','false', '<s:property value='#meeting.id'/>')"><a>Edit</a></li>
                  <li onclick="setDuplicateModaldata('<s:property value='#meeting.id'/>','<s:property value='#meeting.name'/>')"><a data-toggle="modal" data-target="#dupModal">Duplicate</a></li>
                  <li onclick="setDeleteModaldata('<s:property value='#meeting.id'/>','<s:property value='#meeting.name'/>')" ><a data-toggle="modal" data-target="#delLectureModal">Delete</a></li>
                </ul>
              </div>
            </td>
			<%-- <td class="text-right"><s:property value='#meeting.lectureDuration'/></td>
            <td class="text-right"><s:property value='#meeting.slides'/></td>
            <td class="text-right"><s:property value='#meeting.updatedAt'/></td> --%>
			
            
                
          </tr>
           </s:iterator>
       
         </tbody>
      </table>


<table class="table table-hover">
        <thead>
          <tr>
            <th class="col-sm-5">Name</th>
            <th class="col-sm-2 text-right">Time</th>
            <th class="col-sm-2 text-right">Slides</th>
            <th class="col-sm-3 text-right">Date Modified</th>
            <th></th>
          </tr>
        </thead>

        <tbody>
        

          <s:iterator id="meeting" value="lectureList">
          <tr>
            <!--<td><a href="#" onclick="submitEditLectureform('<s:property value='#meeting.lectureTitle'/>','false')"><s:property value='#meeting.lectureTitle'/></a></td> -->
			
		    <td>
              <div class="dropdown table-menu">
                <!--<a data-toggle="dropdown" href="#"><span class="badge badge-info">. . .</span></a> -->
				<a data-toggle="dropdown" href="#"><s:property value='#meeting.lectureTitle'/></a>
                <ul class="dropdown-menu dropdown-menu-left" role="menu" aria-labelledby="dLabel">
                  <li onclick="setRenameModaldata('<s:property value='#meeting.lectureTitle'/>')"><a id="editMd" data-toggle="modal" data-target="#editModal">Rename</a></li>
                  <s:if test="#meeting.lectureDuration.equals('00:00')" >
                 	<li><a  style="color:#ddd;cursor:not-allowed;">Play</a></li>
                  </s:if>
                  <s:else>
                  <li onclick="submitEditLectureform('<s:property value='#meeting.lectureTitle'/>','true','0')"><a>Play</a></li>
                  </s:else>
				  <li onclick="submitEditLectureform('<s:property value='#meeting.lectureTitle'/>','false','0')"><a>Edit</a></li>
                  <li onclick="setDuplicateModaldata('<s:property value='#meeting.id'/>','<s:property value='#meeting.lectureTitle'/>')"><a data-toggle="modal" data-target="#dupModal">Duplicate</a></li>
                  <li onclick="setDeleteModaldata('<s:property value='#meeting.id'/>','<s:property value='#meeting.lectureTitle'/>')" ><a data-toggle="modal" data-target="#delLectureModal">Delete</a></li>
                </ul>
              </div>
            </td>
			<td class="text-right"><s:property value='#meeting.lectureDuration'/></td>
            <td class="text-right"><s:property value='#meeting.slides'/></td>
            <td class="text-right"><s:property value='#meeting.updatedAt'/></td>
			
            
                
          </tr>
           </s:iterator>
       
         </tbody>
      </table>
</div>






<!-- Create Modal -->
<form action="newlecture" name="lectureform" method="post">
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true" onclick="clearErrorMessage();">&times;</button>
        <h4 class="modal-title" id="myModalLabel">Create Lecture</h4>
      </div>
      <div class="modal-body">
      	<div id="newlecerrordiv" align="center" style="color:red;"></div>
        <div class="form-group">
    <label for="exampleInputEmail1">Lecture Name</label>
    
    	<input type="" class="form-control" id="newLectureName" name="fileName" placeholder="Enter lecture name">
    
  </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" onclick="clearErrorMessage();">Cancel</button>
        <button type="button" class="btn btn-primary" onclick="submitform();">Save</button>
      </div>
    </div>
  </div>
</div>
</form>



<!-- Duplicate Modal -->
<div class="modal fade" id="dupModal" tabindex="-1" role="dialog" aria-labelledby="dupModalLabel" aria-hidden="true">
  <div class="modal-dialog">
  <form action="duplicatelecture" name="duplicatelectureform" method="post">
   <input id="duplectureId" type="hidden"  name="lectureId" value="">
   <input id="oldLectureName"  name="oldFileName" type="hidden"  value="">
  
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true" onclick="clearErrorMessage();">&times;</button>
        <h4 class="modal-title" id="myModalLabel">Duplicate Lecture</h4>
      </div>
      <div class="modal-body">
        <div id="dperrordiv" align="center" style="color:red;"></div>
        <div class="form-group">
          <label for="exampleInputEmail1">Original Lecture</label>
          <input id="originalName" class="form-control" type="text" placeholder="Original lecture title" disabled>
        </div>

        <div class="form-group">
          <label for="exampleInputEmail1">New Lecture Name</label>
          <input type="" class="form-control" name="meetingName"  id="newDupLectureName" placeholder="Enter new lecture name">
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" onclick="clearErrorMessage();" >Cancel</button>
        <button type="button" class="btn btn-primary" onclick="submitDuplicateLectureForm()">Duplicate</button>
      </div>
	  
    </div>
  </div>
  </form>
</div>




<!-- Delete Modal -->
<div class="modal fade" id="delLectureModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <form action="deletelecture" name="deletelectureform" method="post">
   <input id="delMeetingName" type="hidden"  name="meetingName" value="">
    <input id="dellectureId" type="hidden"  name="lectureId" value="">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel">Confirm Deletion</h4>
      </div>
      <div class="modal-body">
		<div id="delerrordiv" align="center" style="color:red;"></div>
        <p class="text-danger">Are you sure you want to delete the lecture titled <span id="dellecturename"><strong></strong>?</p>
        <p class="text-danger">You cannot undo this action.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
        <button type="button" class="btn btn-danger" onclick="submitDeleteLectureForm()">Delete Lecture</button>
      </div>
    </div>
  </div>
  </form>
</div>



<!-- Edit Modal -->
<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true" onclick="clearErrorMessage();">&times;</button>
        <h4 class="modal-title" id="myModalLabel">Rename Lecture</h4>
      </div>
      <div class="modal-body">
        <div id="rmerrordiv" align="center" style="color:red;"></div>
		<form name="renameForm" method=post action="renamelecture">
        <div class="form-group">
          <label for="exampleInputEmail1">Lecture Name</label>
          
         <input type="text" id="renameMeetingName" class="form-control" name="meetingName"  placeholder="Current lecture name populates here" >
         <input id="oldFileName" type="hidden"  name="oldFileName" value="">
          
        </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" onclick="clearErrorMessage();">Cancel</button>
        <button type="button" class="btn btn-primary" onclick="submitRenameLectureForm();">Save</button>
      </div>
    </div>
  </div>
</div>




<!-- Play Modal -->
<div class="modal fade" id="playModal" tabindex="-1" role="dialog" aria-labelledby="playModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel">Lecture Title here</h4>
      </div>
      <div class="modal-body">
        <p>I'm guessing some form of player is embedded here. We could also do this on a separate page or full screen approach.</p>
        <p><img src="<%=request.getContextPath()%>/images/player.png" class="img-responsive"></p>
      </div>
    </div>
  </div>
</div>






    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery-1.10.2.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
    <script type="text/javascript">
	var popUpOpen = null;
	$(document).keydown(function(evt){
	evt = evt || window.event;
	var charCode = evt.keyCode || evt.which;
	var charStr = String.fromCharCode(charCode);
		console.log("hiii"+charCode);
		});
	$(document).ready(function() {
		$(window).keydown(function(event){
			if(event.keyCode == 13) {
			console.log("Hiiii"+popUpOpen);
			var searchText = document.getElementById("searchText").value
				if(popUpOpen != null){
					if(popUpOpen == "rename"){
						submitRenameLectureForm();
					 }else if(popUpOpen == "duplicate"){
						submitDuplicateLectureForm();
					 }else if(popUpOpen == "newname"){
						submitform();
					 }else if(popUpOpen == "delete"){
						submitDeleteLectureForm();
					 }
				}else if(searchText.trim() != ''){
						submitSearchform();
					
				}else{
					event.preventDefault();
				}
				return false;
			}
		});
	});
	 function setAddData(){
		popUpOpen = 'newname';
		setTimeout("focus('newname')",1000);
	 }
	function submitform(){
    	console.log("hiii")
		var lecName = document.getElementById("newLectureName").value;
		var pattern = /^[A-Za-z0-9_\- ]{3,20}$/;
		var errorMessage ="Invalid Lecture Name. Please use only [ A-Z, a-z, 0-9, _, - ]";
	
		if(!pattern.test(lecName)){
			console.log("11111111");
			document.getElementById("newlecerrordiv").innerHTML= '<strong>'+errorMessage+'</strong>';
        }else{
			console.log("222222222");
			document.lectureform.submit(); 
       }
    
     }
	 function submitSearchform(){
    	
    	 document.searchform.submit();
     }
     function submitEditLectureform(lectureName,isAutoPlay, channelId){
    	document.getElementById("meetingName").value = lectureName;
		document.getElementById("autoPlay").value = isAutoPlay;
		document.getElementById("channel_id").value = channelId;
    	//alert(document.getElementById("meetingName").value)
    	document.editlectureform.submit();
     }
     function setRenameModaldata(oldlectureName){
		 console.log("oldlectureName:::"+oldlectureName);
		 popUpOpen = 'rename';
    	 document.getElementById("oldFileName").value = oldlectureName;
    	 document.getElementById("renameMeetingName").value = oldlectureName;
		 console.log("renameMeetingName"+renameMeetingName);
		 document.getElementById("renameMeetingName").placeholder = oldlectureName;
		 setTimeout("focus('rename')",1000);
		  
	 }
	 
	function focus(obj){
	 if(obj == "rename"){
	// console.log("11111111");
		document.getElementById("renameMeetingName").focus();
	 }else if(obj == "duplicate"){
	//	console.log("22222222");
		document.getElementById("newDupLectureName").focus();
	 }else if(obj == "newname"){
	 //console.log("33333");
		document.getElementById("newLectureName").focus();
	 }
	}
	
	function submitRenameLectureForm(){
	 var rname = document.getElementById("renameMeetingName").value;
	  $('#renameMeetingName').click();
	 console.log("rename111::"+rname);
	 var pattern = /^[A-Za-z0-9_\- ]{3,20}$/;
	 var errorMessage ="Invalid Lecture Name. Please use only [ A-Z, a-z, 0-9, _, - ]";
	
		if(!pattern.test(rname)){
			console.log("11111111");
			document.getElementById("rmerrordiv").innerHTML= '<strong>'+errorMessage+'</strong>';
			//alert("Enter Correct Name");
        }else{
			console.log("222222222");
			document.renameForm.submit();  
       }
		
	 }
	 function setDuplicateModaldata(lectureId,lectureName){
	  popUpOpen = 'duplicate';
	  document.getElementById("oldLectureName").value = lectureName;
	  document.getElementById("duplectureId").value = lectureId;
	  document.getElementById("originalName").value = lectureName;
	  setTimeout("focus('duplicate')",1000);
	 }
	 
	 function clearErrorMessage(){
		 document.getElementById("newlecerrordiv").innerHTML="";
		 document.getElementById("rmerrordiv").innerHTML="";
		 document.getElementById("dperrordiv").innerHTML="";
		 document.getElementById("delerrordiv").innerHTML="";	 
	 }
	 
	 function submitDuplicateLectureForm(){
	 var duplicate = document.getElementById("newDupLectureName").value;
	 console.log("duplicate::"+duplicate);
	 var pattern = /^[A-Za-z0-9_\- ]{3,20}$/;
	 var errorMessage ="Invalid Lecture Name. Please use only [ A-Z, a-z, 0-9, _, - ]";
	
		if(!pattern.test(duplicate)){
			console.log("11111111");
			document.getElementById("dperrordiv").innerHTML= '<strong>'+errorMessage+'</strong>';
			//alert("Enter Correct Name");
        }else{
			console.log("222222222");
			document.duplicatelectureform.submit();
       }
		
	 }
			
     function setDeleteModaldata(lectureId, lectureName){
	   popUpOpen = 'delete';  
	   document.getElementById("delMeetingName").value = lectureName; 
	   document.getElementById("dellectureId").value = lectureId;
	   document.getElementById("dellecturename").innerHTML= '<strong>'+lectureName+'</strong>';
	 }
	 
	 function submitDeleteLectureForm(){
			document.deletelectureform.submit();
	 }
	 
	 var actionName = '<s:property value="%{actionName}" />';
	 var errorMessage = '<s:property value="%{message}" />';
	     
	// alert("actionName::"+actionName+"::error Message"+errorMessage);
	 jQuery(document).ready(function(){
		if(actionName!= null){
			if(actionName == 'newlec' ){
				//alert("newlec")
				document.getElementById("newlecerrordiv").innerHTML= '<strong>'+errorMessage+'</strong>';
				 $('#newLecMd').click(); 
			}else if(actionName == 'renamelec' ){
				document.getElementById("rmerrordiv").innerHTML= '<strong>'+errorMessage+'</strong>';
				 $('#editMd').click(); 
			}
			else if(actionName == 'duplec' ){
				document.getElementById("dperrordiv").innerHTML= '<strong>'+errorMessage+'</strong>';
				 //$('#dupModal').click();
				  $('#dupModal').modal('show');
			}
			else if(actionName == 'dellec' ){
				document.getElementById("delerrordiv").innerHTML= '<strong>'+errorMessage+'</strong>';
				 $('#delLectureModal').click(); 
			}
		}
				 
			
		
	 });
	 
     </script>
  </body>
</html>
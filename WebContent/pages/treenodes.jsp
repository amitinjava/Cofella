
<%@ taglib prefix="s" uri="/struts-tags" %>
<s:set name="requrltype" value='%{#context.get(@org.apache.struts2.StrutsStatics@HTTP_REQUEST).getScheme()}' />
<html>
 <head>
  <title> New Document </title>
  <meta name="Generator" content="EditPlus">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <style>
  
	.label {
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
	}
	.label, .badge {
	display: inline-block;
	padding: 2px 4px;
	font-size: 11.844px;
	font-weight: bold;
	line-height: 14px;
	color: #ffffff;
	text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
	white-space: nowrap;
	vertical-align: baseline;
	background-color: #999999;
	}
	.label-warning, .badge-warning {
	background-color: #f89406;
	}
	.label-important, .badge-important {
	background-color: #b94a48;
	}
	.label-success, .badge-success {
	background-color: #468847;
	}
  </style>
  <link href="/css/admin/bootstrap.css" rel="stylesheet" type="text/css">
  <style type="text/css" >ul, li{list-style-type:none;} </style>
  <%-- <script type="text/javascript" src="http://static.akosha.com/js/jquery-1.8.2.min.js"></script>
  <script type="text/javascript" src="http://static.akosha.com/js/jquery.autocomplete-min.js"></script>
  <script type="text/javascript" src="http://static.akosha.com/js/hashtable.js"></script>
   --%>
  
  <script type="text/javascript" src="js/jquery-1.8.2.min.js" ></script>
  <script type="text/javascript" src="js/jquery.autocomplete-min.js"></script>
  <script type="text/javascript" src="js/hashtable.js"></script>
  <script type="text/javascript" src="js/common.js"></script>
  
  <script type="text/javascript">
  <!--
  var object = null;
  var currentMetaId = null;
  var prevName = null;
  var isShow = null;
  var currentId = null;
  var metaTagIds = "";
  var metatagTable = new Hashtable();
  //var prevId = null;
  jQuery(document).ready(function(){
	 $('html').bind('click',function() {
		 
		});
		
	});
  
  function getChild(id,event){
	 // alert(event);
	  var add = false;
	  if(event == 'add'){
		  add = true;
	  }
	  if(event == 'getChild'){
		  var image = document.getElementById("img"+id).src;
		  //alert(image);
		  if(image.indexOf('ak_plus.gif') != -1){
			  isShow = true;
			  if(document.getElementById("container"+id) == null){
				  jQuery.ajax({
				  		type:	"post",
				  		url: 	"getchilds.action",
				  		data: 	"parentId="+id ,
				  		success:function(msg) {
				  			//alert(msg);
				  			if(msg.actionErrors != null){
				  				alert("error");
				  		  	}else if(msg.childList.length==0){
				  		  		if(add){
				  		  			showChild(id,msg.childList,add);
				  		  		}else{
				  		  			alert("No child");
				  		  		}
				  		  	}else{
				  		  		showChild(id,msg.childList,add);
				  		  	}
				  		}});
				  
			  }else{
				  document.getElementById("container"+id).style.display = "block";
				  document.getElementById("img"+id).src = "images/meeting/minus.gif";
			  }
		 }else if(image.indexOf('minus.gif') != -1){
			  isShow = false;	
			  document.getElementById("container"+id).style.display = "none";
			  document.getElementById("img"+id).src = "images/meeting/ak_plus.gif";
		  }
	 	 }else{
			 // alert("other");
			  isShow = true;
			  jQuery.ajax({
			  		type:	"post",
			  		url: 	"getchilds.action",
			  		data: 	"parentId="+id ,
			  		success:function(msg) {
			  			//alert(msg);
			  			
			  			if(msg.actionErrors != null)
			  			{
			  				alert("error");
			  		  	}else if(msg.childList.length==0){
			  		  		if(add){
			  		  			showChild(id,msg.childList,add);
			  		  		}else{
			  		  			alert("No child");
			  		  		}
			  		  	}else{
			  		  		showChild(id,msg.childList,add);
			  		  	}
			  		}});
		  }
	 
	  
	  //alert(document.getElementById("container"+id)+"isShow"+isShow);
	 
		//alert("getChild"+add);
		
	}
  function checkNodeType(id){
	  var companyId = "#comp"+ id;
	  var nodeId = "#node"+ id;
	  
	 //alert("value::::"+jQuery(nodeId).val());	
			for(var i=0;i<options.lookup.suggestions.length;i++){
				if(jQuery(nodeId).val().toLowerCase().replace(/\s/g, "")==options.lookup.suggestions[i].toLowerCase().replace(/\s/g, "")){
					jQuery(companyId).val(options.lookup.data[i]);
					//jQuery('#c_name').val(jQuery('#companyQuery').val());
					break;
				}
			}
			
		//alert(jQuery(companyId).val());	
	  var name = document.getElementById("node"+id).value;
	  var typeVal = document.getElementById("type"+id).value ;
	 // alert(typeVal)
	  if(isNaN(name) && typeVal != '2'){
			  //alert("11");
		  	document.getElementById("ivr"+id).style.display = "none";
		  	document.getElementById("type"+id).value  = 0;
	 		
		}else{
			  //alert("2222");
	 		document.getElementById("ivr"+id).style.display = "block";
			if(document.getElementById("option"+id)!= null){
				document.getElementById("type"+id).value = 2;
			}else{
				document.getElementById("type"+id).value = 1;
			}
	 		//document.getElementById("type"+id).value = 1;
	 	}
  }
  

  
  function saveNode(id){
		//alert(id);
		var name = document.getElementById("node"+id).value;
		var order = document.getElementById("order"+id).value;
		var typeVal= document.getElementById("type"+id).value;
		var nodeTypeVal= document.getElementById("nodetype"+id).value;
		var compId= document.getElementById("comp"+id).value;
		//alert(compId);
		var ivrOption = "";
		if( document.getElementById("option"+id) != null)
		 ivrOption= document.getElementById("option"+id).value;
		
		if(isNaN(order)){
			alert("Invalid display order");
			return;
		}
		/* var names = document.getElementById("meta"+currentMetaId).value; 
		var strArr = names.split(",");
		metaTagIds = "";
		for(var i=0;i<strArr.length-1;i++){
			var metatagIdd = metatagTable.get(strArr[i])
			//alert(metatagIdd);
			metaTagIds = metaTagIds + metatagTable.get(strArr[i]) + ",";
		} */
		//alert("metaTagIds"+metaTagIds);
		jQuery.ajax({
	  		type:	"post",
	  		url: 	"savechild.action",
	  		data: 	"parentId="+id+"&nodeName="+name+"&order="+order+"&nodeType="+typeVal+"&ivrOption="+ivrOption+"&metaTags="+metaTagIds+"&companyId="+compId,
	  		success:function(msg) {
	  			//alert(msg);
	  			
	  			if(msg.actionErrors != null)
	  			{
	  				alert("error");
	  		  	}else if(msg.childList.length==0){
	  		  		alert("No child");
	  		  	}else{
	  		  		currentId = null;
	  		  		showChild(id,msg.childList,false);
	  		  	}
	  			
	  		}});
	}
  function updateNodeName(id,oldname){
		//alert("updateNodeName");
		var name = document.getElementById("node"+id).value;
		var order = document.getElementById("order"+id).value;
		var typeVal= document.getElementById("type"+id).value;
		var names = document.getElementById("metatag"+id).value; 
		var compId= document.getElementById("comp"+id).value;
		var strArr = names.split(",");
		metaTagIds = "";
		//alert(metatagTable);
		for(var i=0;i<strArr.length-1;i++){
			//alert(strArr[i]);
			var metatagIdd = metatagTable.get(strArr[i])
			//alert(metatagTable);
			//alert(metatagIdd);
			metaTagIds = metaTagIds + metatagTable.get(strArr[i]) + ",";
		}
		var ivrOption = "";
		if( document.getElementById("option"+id) != null)
		 ivrOption= document.getElementById("option"+id).value;
		
		
		jQuery.ajax({
	  		type:	"post",
	  		url: 	"updatenodename.action",
	  		data: 	"parentId="+id+"&nodeName="+name+"&order="+order+"&nodeType="+typeVal+"&ivrOption="+ivrOption+"&metaTags="+metaTagIds+"&companyId="+compId,
	  		success:function(msg) {
	  			//alert(msg);
	  			
	  			if(msg.actionErrors != null)
	  			{
	  				alert("error");
	  				object.innerHTML = oldname;
	  		  	}else{
	  		  	
	  		  		//alert(msg.parentId);
	  		  		getChild(msg.parentId,'updateNode');
	  		  	}
	  			object = null;
	  			currentMetaId = null;
	  			currentId = null;
	  		}});
	}
  function deleteNode(id){
	  var resp = window.confirm("Do you want to delete this node?");
	  if(resp == true){
		  jQuery.ajax({
		  		type:	"post",
		  		url: 	"deletenode.action",
		  		data: 	"id="+id,
		  		success:function(msg) {
		  			//alert(msg.parentId);
		  			
		  			if(msg.actionErrors != null)
		  			{
		  				alert("error");
		  		  	}else{
		  		  		//alert("showchild");
		  		  		showChild(msg.parentId,msg.childList,false);
		  		  	}
		  			
		  		}});
	  }else{
		  
	  }
	  //alert(id);
		
	}
  function getCompleteJSOn(id){
		
		jQuery.ajax({
	  		type:	"get",
	  		url: 	"retrievecomplete.action",
	  		data: 	"id="+id,
	  		success:function(msg) {
	  			//alert(msg);
	  			
	  			if(msg.actionErrors != null)
	  			{
	  				alert("error");
	  				
	  		  	}else{
	  		  		//alert(msg.parentId);
	  		  		//getChild(msg.parentId,'updateNode');
	  		  	}
	  			
	  		}});
	}
  
  function getlatestTestimonialJSON(){
	  var jsonContent = {currentPage:2,pageSize:4};
		jQuery.ajax({
	  		type:	"post",
	  		url: 	"appstestimonials.action",
	  		data: 	jsonContent,
	  		dataType: 'json',
	  		success:function(msg) {
	  			//alert(msg);
	  			
	  			if(msg.actionErrors != null)
	  			{
	  				alert("error");
	  				
	  		  	}else{
	  		  		//alert(msg.parentId);
	  		  		//getChild(msg.parentId,'updateNode');
	  		  	}
	  			
	  		}});
	}
  
  function fileComplaint(){
	  var jsonContent = {username:'aseewtest',useremail:'akodsdfdfss_tst@gmail.com',usermobile:9116543219,companyName:'Abccc',companyId:3,serviceTypeId:5,complaintDesc:'Hi Test complaints',disputedAmount:819,userAppId:'F2B70C7E-4AFC-4DAA-A5D1-C4D01180E64D',userImagePath:'5a14d29c-6a93-4020-8826-6a7019bd27c3_facebookpermission.png'};
		jQuery.ajax({
	  		type:	"post",
	  		url: 	"filecomplaint.action",
	  		data: JSON.stringify(jsonContent),
	  		contentType: 'application/json; charset=utf-8',
	  		dataType: 'json',
	  		success:function(msg) {
	  			if(msg.fieldErrors == null)
	  			{
	  				alert(msg.status);
	  				
	  		  	}else{
		  		  	alert(msg.fieldErrors.email);
		  			alert(msg.fieldErrors.phone);
	  		  		//alert(msg.parentId);
	  		  		//getChild(msg.parentId,'updateNode');
	  		  	}
	  			
	  		}});
	}
  
  function UpdateUser(){
 var jsonContent = {address:'addressdgjas',userId:241324,useremail:'s@sakosha.com',username:'beerusinghhdsdfg',usermobile:'9000000903',userImagePath:'ede208f2-aaf4-40eb-98ae-147b225126a4_commentwithattachment.png'};
		jQuery.ajax({
	  		type:	"post",
	  		url: 	"appupdateuser.action",
	  		data: JSON.stringify(jsonContent),
	  		contentType: 'application/json; charset=utf-8',
	  		dataType: 'json',
	  		success:function(msg) {
	  			if(msg.actionErrors != null)
	  			{
	  				alert(msg.detailDTO);
	  				
	  		  	}else{
	  		  	alert(msg.actionErrors);
	  		  	}
	  			
	  		}});
	}
  
  function loginApp(){
	  var jsonContent = {useremail:'4akoshabeeru@gmail.com',password:'jhkj'};
		jQuery.ajax({
	  		type:	"post",
	  		url: 	"appdologin.action",
	  		data: JSON.stringify(jsonContent),
	  		contentType: 'application/json; charset=utf-8',
	  		dataType: 'json',
	  		success:function(msg) {
	  			if(msg.actionErrors == null)
	  			{
	  				alert(msg.detailDTO);
	  				
	  		  	}else{
	  		  	alert(msg.actionErrors);
	  		  	}
	  			
	  		}});
	}
  function forgotpassword(){
	  var jsonContent = {useremail:'kher.saurabh@gmail.com'};
		jQuery.ajax({
	  		type:	"post",
	  		url: 	"appsendpassword.action",
	  		data: JSON.stringify(jsonContent),
	  		contentType: 'application/json; charset=utf-8',
	  		dataType: 'json',
	  		success:function(msg) {
	  			if(msg.actionErrors != null )
	  			{
	  				alert(msg.actionErrors);
	  				
	  		  	}else{
	  		  	alert(msg.actionMessages);
	  		  	}
	  			
	  		}});
	}
  
  function findTestimonialsByCompanyId(){
	  var jsonContent = {companyId:1438,currentPage:1,pageSize:8};
		jQuery.ajax({
	  		type:	"get",
	  		url: 	"applisttestimonials.action",
	  		data: "jsonContent="+JSON.stringify(jsonContent),
	  		contentType: 'application/json; charset=utf-8',
	  		dataType: 'json',
	  		success:function(msg) {
	  			if(msg.actionErrors != null )
	  			{
	  		  	}else{
	  		  	alert(msg.testimonialListDTO);
	  		  	}
	  			
	  		}});
	}
  function findComplaintByUserId(){
	  var jsonContent = {userId:241312};
		jQuery.ajax({
	  		type:	"get",
	  		url: 	"getusercomplaints.action",
	  		data: "jsonContent="+JSON.stringify(jsonContent),
	  		contentType: 'application/json; charset=utf-8',
	  		dataType: 'json',
	  		success:function(msg) {
	  			if(msg.actionErrors != null )
	  			{
	  		  	}else{
	  		  	alert(msg.detailDTO);
	  		  	}
	  			
	  		}});
	}
  function UserRegisterJson(){
	  var jsonContent = {username:'Beeru Singh',useremail:'4akoshabeeru@gmail.com',usermobile:9081100074,userAppId:'ACCE8E76-D9F0-4B24-B6DF-592278EAE2A1',password:'jhkj'};
		jQuery.ajax({
	  		type:	"post",
	  		url: 	"appsaveuser.action",
	  		data: JSON.stringify(jsonContent),
	  		contentType: 'application/json; charset=utf-8',
	  		dataType: 'json',
	  		success:function(msg) {
	  			if(msg.actionErrors != null )
	  			{
	  		  	}else{
	  		  	alert(msg.detailDTO);
	  		  	}
	  			
	  		}});
	}
  function UserAppJson(){
	  var jsonContent = {userAppId:'ACCE8E76-D9F0-4B24-B6DF-592278EAE2A1'};
		jQuery.ajax({
	  		type:	"post",
	  		url: 	"appuserid.action",
	  		data: JSON.stringify(jsonContent),
	  		contentType: 'application/json; charset=utf-8',
	  		dataType: 'json',
	  		success:function(msg) {
	  			if(msg.actionErrors != null )
	  			{
	  				alert(msg.actionErrors);
	  		  	}else{
	  		  	alert(msg.actionMessages);
	  		  	}
	  			
	  		}});
	}
  function getServiceJson(){
	  var jsonContent = {companyId:1};
	  jQuery.ajax({
			type: "post",
			url: "appgetservicetypesbycompany.action",
			data: JSON.stringify(jsonContent),
	  		contentType: 'application/json; charset=utf-8',
	  		dataType: 'json',
			success: function(msg) {
				alert(msg.detailDTO);
			}
		});
	}
  function FeedBack(){
	  var jsonContent = {companyId:1,rating:2,userAppId:'F2B70C7E-4AFC-4DAA-A5D1-C4D01180E64D',phone:'9876543210',status:'1'};
	  jQuery.ajax({
			type: "post",
			url: "appfeedbackfromapp.action",
			data: JSON.stringify(jsonContent),
	  		contentType: 'application/json; charset=utf-8',
	  		dataType: 'json',
			success: function(msg) {
				if(msg.actionErrors != null )
	  			{
	  				alert(msg.actionErrors);
	  		  	}else{
	  		  	alert(msg.actionMessages);
	  		  	}
			}
		});
	}
  function getCompanyandAppId(){
	  var jsonContent = { userAppId:'ACCE8E76-D9F0-4B24-B6DF-592278EAE2A1',favCompanyList:[{id:7}]};
	  jQuery.ajax({
			type: "post",
			url: "savefavcompanies.action",
			data: JSON.stringify(jsonContent),
	  		contentType: 'application/json; charset=utf-8',
	  		dataType: 'json',
			success: function(msg) {
				if(msg.actionErrors != null )
	  			{
	  				alert(msg.actionErrors);
	  		  	}else{
	  		  	alert(msg.actionMessages);
	  		  	}
			}
		});
	}
  function FBLogin(){
	  var jsonContent = {userAppId:'ACCE8E76-Dreter9F0-4B24-B6D34wewF-598888887A1', accessToken:'kwerwdfjdfdj67jh43251' , facebookId:'5nhgf34455654dfdfdwerw53437hgh'};
	  jQuery.ajax({
			type: "post",
			url: "appFBlogin.action",
			data: JSON.stringify(jsonContent),
	  		contentType: 'application/json; charset=utf-8',
	  		dataType: 'json',
			success: function(msg) {
				if(msg.actionErrors != null )
	  			{
	  				alert(msg.actionErrors);
	  		  	}else{
	  		  	alert(msg.detailDTO);
	  		  	}
			}
		});
	}
  function deleteCompanyandAppId(){
	  var jsonContent = {userAppId:'ACCE8E76-D9F0-4B24-B6DF-592278EAE2A1',favCompanyList:[{id:1},{id:2}]};
	  jQuery.ajax({
			type: "post",
			url: "deletefavcompanies.action",
			data: JSON.stringify(jsonContent),
	  		contentType: 'application/json; charset=utf-8',
	  		dataType: 'json',
			success: function(msg) {
				if(msg.actionErrors != null )
	  			{
	  				alert(msg.actionErrors);
	  		  	}else{
	  		  	alert(msg.actionMessages);
	  		  	}
			}
		});
	}
  function CompanyPhoneStatusFeed(){
	  var jsonContent = {companyId:1,userAppId:'F2B70C7E-4AFC-4DAA-A5D1-C4D01180E64D',phone:'9876543210',status:'1'};
	  jQuery.ajax({
			type: "post",
			url: "appcompanyphonestatus.action",
			data: JSON.stringify(jsonContent),
	  		contentType: 'application/json; charset=utf-8',
	  		dataType: 'json',
			success: function(msg) {
				if(msg.actionErrors != null )
	  			{
	  				alert(msg.actionErrors);
	  		  	}else{
	  		  	alert(msg.actionMessages);
	  		  	}
			}
		});
	}
  
  function closeWin(id){
	   document.getElementById("span"+id).innerHTML = "";
	   document.getElementById("span"+id).id = ""; 
	   currentMetaId = null;
	   metaTagIds = "";
		
		//getChild(id,false);
	}
	function showChild(id,childs,add){
		//alert("showchild::"+id+"::childs::"+childs);
		var str = "";
		jQuery.each(childs, function(i, obj) {
			//alert(obj.metaData);
			 var metaDataVal = "";
			 /*if(obj.metaData != null || obj.metaData != ""){
				var metadata = obj.metaData ;
				jQuery.each(metadata, function(j, metadataObj) {
					var str = metadataObj.data;
					str = str.split(' ').join('+');
					//alert(str);
					metaDataVal = metaDataVal + str + ",";
				});
			}
			alert(metaDataVal);
 */			var phone = "";
			if(obj.phone != ''){
				phone = ' ('+obj.phone+') ';
			}
			var nodeId = "hdnode"+obj.id;
			var orderId = "hdorder"+obj.id;
			var nodeTypeId = "nodetype"+ obj.id;
			var ivrOptionId = "hdivroption"+ obj.id;
			var metaTagId = "hdmetatag"+ obj.id;
			str = str +  '<li id="'+ obj.id +'"><img src ="images/meeting/lastli.gif" /> <img id="img'+obj.id+'"  src ="images/meeting/ak_plus.gif" style="cursor:pointer" onclick= getChild("'+obj.id +'","getChild") /> <img src ="images/meeting/li.gif" /><span title="Id:'+ obj.id +' order :'+obj.displayOrder + '" ondblclick="editName(this,'+obj.id +')"> '+obj.nodeName +'</span>&nbsp; <img src ="images/meeting/ak_plus.gif" onclick= addChild("'+obj.id +'") /><input type="hidden" id="'+nodeId+'" name="" value= "'+obj.nodeName+'"><input type="hidden" id="'+orderId+'" name="" value= "'+obj.displayOrder+'"><input type="hidden" id="'+nodeTypeId+'" name="" value= "'+obj.nodeType+'"><input type="hidden" id="'+metaTagId+'" name="" value= "'+metaDataVal+'"><input type="hidden" id="'+ivrOptionId+'" name="" value= "'+obj.ivrOption+'">&nbsp;&nbsp;<i class="icon-remove-sign" onclick="deleteNode('+obj.id +');" ></i></li>';
		});
		//alert("container"+document.getElementById("container"+id));
		 if(document.getElementById("container"+id) == null){
			 str = '<span id =container'+id+' style="display:none"><ul>'+str + '</ul></span>'; 
			 document.getElementById(id).innerHTML  = getInnerHTML(document.getElementById(id).innerHTML) + str;
		 }else{
			 document.getElementById("container"+id).innerHTML = '<ul>'+str + '</ul>';
		
		 }
		
		//alert(isShow);
		if(isShow){
			//alert("show");
			document.getElementById('container'+id).style.display = "block";
			document.getElementById("img"+id).src = "images/meeting/minus.gif";
		}else{
			//alert("hide");
			document.getElementById('container'+id).style.display = "none";
			document.getElementById("img"+id).src = "images/meeting/ak_plus.gif";
		}
		//alert(document.getElementById(id).innerHTML);
		
		if(add){
			var htmlval = getInnerHTMLbeforeUl(document.getElementById(id).innerHTML);
			if(htmlval.indexOf('<ul>') == -1){
				htmlval = htmlval + '<ul>';
			}
			var nodeId = "node"+id;
			var orderId = "order"+id;
			var optionId = "option"+id;
			var spanId = "span"+ id;
			var nodeTypeId = "nodetype"+ id;
			var typeId = "type"+ id;
			var attivrSpan = "ivr"+ id;
			var metaTagsId = "meta"+ id;
			var companyId = "comp"+ id;
			var typeVal;
			var optionStr = "";
			currentMetaId = id;
			if(document.getElementById("nodetype"+id)!= null ){
				typeVal = document.getElementById("nodetype"+id).value;
			}
			if(typeVal == 1 || typeVal == 2){
				optionStr = 'Option : <input type="text" id="'+optionId+'" name=""  style="width: 30px;">';
				typeVal = 2;
			}
			//document.getElementById("dummy").innerHTML = "";
			//alert("typeVal::"+typeVal)
			var str = '<span id ='+spanId+'><li>Name:<input type="text" id="'+nodeId+'" name="" style="width: 200px;"><input type="hidden" id="'+companyId+'" name="" style="width: 200px;" >Order:<input type="text" id="'+orderId+'" name=""  style="width: 30px;"><input type="hidden" id="'+nodeTypeId+'" value = "'+typeVal+'" name="" style="width: 200px;"><input type="hidden" id="'+typeId+'" value = "'+typeVal+'" name="" style="width: 200px;"><input type="hidden" id="'+companyId+'" value = "-1" name="" style="width: 200px;"><input type="button" value="save" onclick="saveNode('+id+')"> <input type="button" value="close" onclick="closeWin('+id+')"><span id="'+attivrSpan+'" style="display:none"><input type="button" value="attach_ivr"></span></li></span>';
			currentId = nodeId;
			//alert( htmlval + str +'</ul>');
			document.getElementById(id).innerHTML = htmlval + str +'</ul>';
			

			$('#span1').bind('click',function() {
				 // alert("byeeeeeeeeeee");
				});
			
		}
	}
	
	function addChild(id){
		//alert("addchild"+id);
		getChild(id,'add');
	}
	function getInnerHTML(str){
		//alert("1111111");
		var pos = str.indexOf('<ul>');
		//alert(pos);
		if(pos != -1){
			str = str.substring(0,pos);
		}
		//alert(str);
		return str;
	}
	function getInnerHTMLbeforeUl(str){
		//alert("2222222222");
		var pos = str.indexOf('</ul>');
		//alert(pos);
		if(pos != -1){
			str = str.substring(0,pos);
		}
		//alert(str);
		return str;
	}
	function closeUpdateWin(id){
		//alert(object)
		   document.getElementById("span"+id).innerHTML = "";
		   document.getElementById("span"+id).id = ""; 
		   object.innerHTML = prevName;
		   currentMetaId = null;
		   metaTagIds = "";
			//getChild(id,false);
		}
	function editName(obj,id){
		//alert(id);
		$('#span1').bind('click',function() {
			 // alert("hiiiiiiiiii");
			});
		
		if(obj.innerHTML.indexOf('<input')!= -1){
			return;
		}
		if(object != null){
			object.innerHTML = prevName;
			object = null;
			prevName = null;
		}
		object = obj;
		prevName = obj.innerHTML;
		var oldName = encodeURI(obj.innerHTML);
		var name = document.getElementById("hdnode"+id).value;
		var order = document.getElementById("hdorder"+id).value;
		//var nodetypeVal = document.getElementById("nodetype"+id).value;
		var ivroption = document.getElementById("hdivroption"+id).value;
		var metaTag = document.getElementById("hdmetatag"+id).value;
		//alert("metatag val:"+metaTag);
		if(ivroption == 'null'){
			ivroption = "";
		}
				
		var nodeId = "node"+id;
		var orderId = "order"+id;
		var optionId = "option"+id;
		var spanId = "span"+ id;
		var nodeTypeId = "nodetype"+ id;
		var metaTagsId = "metatag"+ id;
		var typeId = "type"+ id;
		var attivrSpan = "ivr"+ id;
		var companyId = "comp"+ id;
		var typeVal;
		var optionStr = "";
		currentMetaId = id;
		if(document.getElementById("nodetype"+id)!= null ){
			typeVal = document.getElementById("nodetype"+id).value;
		}
		//alert("typeVal:::"+typeVal);
		if(typeVal == 2){
			optionStr = 'Option : <input type="text" id="'+optionId+'" name="" value= "'+ivroption+'"  style="width: 30px;">';
			
		}
		//alert("typeVal::"+typeVal)
		var str = '<span id ='+spanId+'>Name:<input type="text" id="'+nodeId+'" name="" value= "'+name+'" style="width: 200px;"><input type="hidden" id="'+companyId+'" name="" style="width: 200px;" >Order:<input type="text" id="'+orderId+'" name="" value= "'+order+'" style="width: 30px;"><input type="hidden" id="'+nodeTypeId+'" value = "'+typeVal+'" name="" style="width: 200px;"><input type="hidden" id="'+typeId+'" value = "'+typeVal+'" name="" style="width: 200px;"><input type="button" value="save" onclick= updateNodeName('+id+',"'+oldName+'") > <input type="button" value="close" onclick="closeUpdateWin('+id+')"><span id="'+attivrSpan+'" style="display:none"><input type="button" value="attach_ivr"></span></span>';
		
		
		/*
		alert("ivrOption::"+ivroption);
		var nodeId = "node"+id;
		var orderId = "order"+id;
		var nodetypeId = "nodetype"+id;
		var ivroptionId = "ivroption"+id;
		alert(nodetypeVal);
		var ivropStr = "";
		
		
		
		
		
		if(nodetypeVal == 2){
			ivropStr = 'option:<input type="text" id="'+ivroptionId+'" name="" style="width: 30px;" value= "'+ivroption+'">';
		}else{
			ivropStr = '<input type="hidden" id="'+ivroptionId+'" name="" style="width: 30px;" value= "'+ivroption+'">';
		}
		
		var str = 'Name:<input type="text" id="'+nodeId+'" name="" value= "'+name+'" onblur = "checkNode('+id+')">Order:<input type="text" id="'+orderId+'" name="" style="width: 30px;" value= "'+order+'">'+ivropStr+'<input type="hidden" id="'+nodetypeId+'" name="" value= "'+nodetypeVal+'"><input type="hidden" id="'+typeId+'" value = "'+typeVal+'" name="" style="width: 200px;"><input type="button" value="save" onclick= updateNodeName('+id+',"'+oldName+'") >';
		
		*/
		obj.innerHTML = str;
		currentId = nodeId;
		//alert(options);
		a = jQuery("#"+nodeId).autocomplete(options);
		//alert(options.lookup);
		a.enable();
		
	}
	
	function submitform(evt){
		if(evt == "add"){
			document.tagform.action = "saveivrtag";
			document.tagform.submit();
		}
		else if(evt == "edit"){
			document.tagform.action = "editivrtag";
			document.tagform.submit();
		}
		else if(evt == "del"){
			document.tagform.action = "deleteivrtag";
			document.tagform.submit();
		}
		
	}
	
	function setValues(id,name,type){
		//alert(id+ name+type);
		document.tagform.ivrTagId.value = id;
		document.tagform.ivrTag.value = name;
		document.tagform.ivrTagType.value = type;
		if(currentMetaId != null){
			//alert(document.getElementById("meta"+currentMetaId));
			if(document.getElementById("meta"+currentMetaId) != null){
				document.getElementById("meta"+currentMetaId).value = document.getElementById("meta"+currentMetaId).value + name + ",";
			}
			//alert(document.getElementById("metatag"+currentMetaId));
			if(document.getElementById("metatag"+currentMetaId) != null){
				document.getElementById("metatag"+currentMetaId).value = document.getElementById("metatag"+currentMetaId).value + name + ",";
				
			}
			
		}
		
		
	}
  //-->
  </script>
 

 </head>

 <body>
 <div style="float:left;width:100%;padding:0px 20px;">
 
	<h4>Node Hierarchy:</h4>	
		<s:if test="ivrTagList !=null && ivrTagList.size() >0">
			 <s:iterator value="ivrTagList" id="tag">
			   <script type="text/javascript">
			  var name = escape("<s:property value='%{#tag.name}'/>");
			  metatagTable.put("<s:property value='%{@java.net.URLEncoder@encode(#tag.name)}'/>","<s:property value='%{#tag.id}'/>");
			 	// alert(metatagTable);
			  </script>
			  <s:if test="#tag.type == 0">
			 		 <span id="tag_<s:property value='%{#tag.id}'/>"   style="cursor:pointer" class="label label-important" style="margin:5px 0px" onclick=setValues("<s:property value='%{#tag.id}'/>","<s:property value='%{@java.net.URLEncoder@encode(#tag.name,"UTF-8")}'/>","<s:property value='%{#tag.type}'/>") ><s:property value='%{#tag.name}'/></span>
			  </s:if>
			  <s:if test="#tag.type == 1">
			 		 <span id="tag_<s:property value='%{#tag.id}'/>"   style="cursor:pointer" class="label label-success" style="margin:5px 0px" onclick=setValues("<s:property value='%{#tag.id}'/>","<s:property value='%{@java.net.URLEncoder@encode(#tag.name,"UTF-8")}'/>","<s:property value='%{#tag.type}'/>") ><s:property value='%{#tag.name}'/></span>
			  </s:if>
			</s:iterator>
	  	</s:if> 
</div>
 <div style="float:left;width:40%;border:1px">
   <s:if test="childDTO != null">
	  <ul>
	  	<li id='<s:property	value="childDTO.id" />'>
	  		<img src ="images/meeting/lastli.gif" /><img id='img<s:property	value="childDTO.id" />' src ="images/meeting/ak_plus.gif" style="cursor:pointer"  onclick= "getChild('<s:property value="childDTO.id" />','getChild')" /><img src ="images/meeting/li.gif" /> <span title="order : <s:property	value="childDTO.displayOrder" />" ondblclick="editName(this,'<s:property	value="childDTO.id" />')"><s:property value="childDTO.nodeName" /></span><input type="hidden" id='nodetype<s:property	value="childDTO.id" />' value = '<s:property	value="childDTO.nodeType" />' name="" style="width: 200px;">&nbsp; <img src ="images/meeting/ak_plus.gif" onclick= "addChild('<s:property value="childDTO.id" />')" />
	  	</li>
	  </ul>
	  <script type="text/javascript">
	 <!--
		//getChild("1",false);
	 //-->
	 </script>
  </s:if>
  </div>
  <div style="float:left;width:60%">
  <%--  <form  name="tagform" action="attachivr" method="post"> <h2>Attach IVR Menu</h2>
  <table >
  
 	<tr>
 		<td colspan = 4 style="color:red" align = "center">
 				<s:fielderror >
	                        <s:param>tag.tagValue</s:param>
	             </s:fielderror>
	    </td>
	 </tr>
  	<!--  
  	<s:if test="ivrTagList !=null && ivrTagList.size() >0">
		 <tr>
			<td colspan="4">
		 		<s:select id="tagId" name="valueId" value="valueId"  list="ivrTagList"  
				headerKey="-1"  listKey="id" 
				listValue="name" onchange="setValues(this)">
				</s:select>
			</td>
	 	</tr>
  	</s:if> 
  	-->
    <tr>
    	<td >To</td>
		<td colspan = 3><s:textfield theme="simple" name="to"/></td>
	</tr>
	<tr>
    	<td >From</td>
		<td colspan = 3><s:textfield theme="simple" name="from"/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><input type=submit value="Attch_IVR" /></td>
	</tr>
  </table>
  </form> 
  <form  name="tagform" action="" method="post"> <h2>Add Tag</h2>
  <table >
  
 	<tr>
 		<td colspan = 4 style="color:red" align = "center">
 				<s:fielderror >
	                        <s:param>tag.tagValue</s:param>
	             </s:fielderror>
	    </td>
	 </tr>
  	<!--  
  	<s:if test="ivrTagList !=null && ivrTagList.size() >0">
		 <tr>
			<td colspan="4">
		 		<s:select id="tagId" name="valueId" value="valueId"  list="ivrTagList"  
				headerKey="-1"  listKey="id" 
				listValue="name" onchange="setValues(this)">
				</s:select>
			</td>
	 	</tr>
  	</s:if> 
  	-->
    <tr>
    	<td >Add Tag</td>
		<td colspan = 3><s:hidden theme="simple" name="ivrTagId"/><s:textfield theme="simple" name="ivrTag"/></td>
	</tr>
	<tr>
    	<td >Tag Type</td>
		<td colspan = 3><s:textfield theme="simple" name="ivrTagType"/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><input type="button" value="Add" onclick ="submitform('add')"/></td>
		<td><input type="button" value="Edit" onclick ="submitform('edit')" /></td>
		<td><input type="button" value="Delete" onclick ="submitform('del')" /></td>
	</tr>
  </table>
  </form> 
  <input type = "button" value ="getJSON" onclick="getCompleteJSOn(1)" /> 
  <input type = "button" value ="getTestimonialJSON" onclick="getlatestTestimonialJSON()" /> 
  <input type = "button" value ="filecomplaintJSON" onclick="fileComplaint()" />
  <input type = "button" value ="LoginJson" onclick="loginApp()" /> 
  <input type = "button" value ="ForgotpasswordJson" onclick="forgotpassword()" /> 
  <input type = "button" value ="FindTestimonialsJson" onclick="findTestimonialsByCompanyId()" />
   <input type = "button" value ="UserRegisterJson" onclick="UserRegisterJson()" />
  <input type = "button" value ="UserAppJson" onclick="UserAppJson()" />
  <input type = "button" value ="getServiceJson" onclick="getServiceJson()" />
  <input type = "button" value ="FeedBack" onclick="FeedBack()" />
  <input type = "button" value ="getCompanyandAppId" onclick="getCompanyandAppId()" />
  <input type = "button" value ="getComplaintByUserId" onclick="findComplaintByUserId()" />
   <input type = "button" value ="FBLogin" onclick="FBLogin()" />
   <input type = "button" value ="deleteCompanyandAppId" onclick="deleteCompanyandAppId()" />
   <input type = "button" value ="CompanyPhoneStatusFeed" onclick="CompanyPhoneStatusFeed()" />
   <input type = "button" value ="UpdateUser" onclick="UpdateUser()"/>
    <form method="post" class="form-horizontal" action="/uploadsaveUserPhoto" id="frmMobile" enctype="multipart/form-data">
   		<input tabindex="105" name="imagePath" id="logo" type="file"/> 
  	 		<s:hidden name="uploadedImagePath" value="%{uploadedImagePath}"/>
  		 <s:hidden name="userId" value="11673"/>
	  <button type="button" id="submitbtn" class="btn" >Submit</button>
	  <button type="button" class="btn" onclick="submitUploadForm('frmMobile', '/uploadUserPhoto')">Upload</button>
	</form>
	<form method="post" class="form-horizontal" action="/uploadComplaintphoto" id="frmMobiles" enctype="multipart/form-data">
   		<input tabindex="105" name="imagePath" id="logos" type="file"/> 
  	 		<s:hidden name="uploadedImagePath" value="%{uploadedImagePath}"/>
	  <button type="button" class="btn" onclick="submitUploadForm('frmMobiles', '/uploadComplaintphoto')">Upload</button>
	</form>
	
	 --%>
  </div>
  
  <!-- 
  <ul>
	  	<li id='1'>
	  		<img src ="images/meeting/lastli.gif" /><img src ="images/meeting/ak_plus.gif" style="cursor:pointer"  onclick= "getChild('1',false)" /><img src ="images/meeting/li.gif" /> <span ondblclick="editName(this,'1')"> ICICI </span>&nbsp; <img src ="images/meeting/ak_plus.gif" onclick= "addChild('1')" />
	  	</li>
	  </ul>
	 -->
	
	<script type = "text/javascript">
		jQuery(document).ready(function(){
			jQuery('#submitbtn').click(function(){
				//alert("kasdjaskdhaskjhkj");
				jQuery('#frmMobile').submit();
			});
		 	options = { 
				//serviceUrl:'comapaniesbypartialname.action',
				minChars:1,
				deferRequestBy: 0,
				params: { complaintCategoryId: -1 },
				onSelect: function(value, data){
					//alert("hiiiiii"+value);
					if(data==null || data <= 0){
						jQuery('#error_div').val("Please select a company");
						jQuery('#error_div').style.display = '';
						alert('jquery');
					}else {				
						jQuery('#error_div').val("");
						var companyName = value.replace(/\s/g, '-'); 
						jQuery('#id').val(data);
						
						//alert("currentId:::"+currentId);
						if(currentId != null){
							document.getElementById(currentId).focus();
						}
						
						//alert(data);
					//	window.location.href = "/" + companyName + "-complaints-" + data + ".html"  ;
					}
				}
		  	};
		 	
			
			options.lookup = <s:property value="%{jsonCompanies.toString()}" escape="false"/>;	
			a = jQuery('#companyQuery').autocomplete(options);
			jQuery('#companyQuery').blur(function(){
				//alert("byeeeeeeeeeeeeeeeeeeeeeeeeee")
				if(jQuery('#hdnCompanyId').val()=='' || jQuery('#hdnCompanyId').val()==0){
				for(var i=0;i<options.lookup.suggestions.length;i++){
					if(jQuery('#companyQuery').val().toLowerCase().replace(/\s/g, "")==options.lookup.suggestions[i].toLowerCase().replace(/\s/g, "")){
						jQuery('#hdnCompanyId').val(options.lookup.data[i]);
						jQuery('#c_name').val(jQuery('#companyQuery').val());
						break;
					}
				}
				}
		    });
			a.enable();
		});
		
	</script>
	
 </body>
 
</html>

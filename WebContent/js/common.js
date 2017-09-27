/*Copied from /struts/CommonFunctions.js Start */


/**
 *      Methods for the tabbed component
 */
var unselectedClass = "tab_default tab_unselected";
var unselectedContentsClass = "tab_contents_hidden";
var unselectedOverClass = "tab_default tab_unselected tab_unselected_over";
var selectedClass = "tab_default tab_selected";
var selectedContentsClass = "tab_contents_header";
var prettyUrlExtension=".html";
var pageTracker = null;
var options, a;
var loadStatic = true;

 function hasWhiteSpace(s)
 {
    var iChars=" ";
    for (var i = 0; i < s.length; i++) {
  	if (iChars.indexOf(s.charAt(i)) != -1) {
  	  return true;
  	}
  	}
	return false;
 } 


function gotoPage(pageNumber){
	jQuery('#txtPageNumber').val(pageNumber);
	if(jQuery('#pretty_url').length){
		var tmp = document.forms[0].action;
		tmp = tmp + '-page-' + pageNumber + '.html';
		window.location.href = tmp;
		return false;
	}else {
		document.forms[0].submit();
	}	
}

function submitPaginator(){
	var val = 1;
	if(jQuery('#txtPageNumber').length){
		val = jQuery('#txtPageNumber').val();
	}
	
	var ret = true;
	if(isNaN(val)){
		ret = false;
	}
	val = parseInt(val);
	if(jQuery('#hdnTotalPages').length){
		if(val <= 0 || val > parseInt(jQuery('#hdnTotalPages').val()) ) {
			ret = false;
		}
	}
	if(!ret){
		alert("invalid page number!");
		return ret;
	}
	//applicable to handle search box on complaint listing pages
	if(jQuery('#hdn_search_keyword').length && jQuery('#searchKeyword').length ){
		if(jQuery('#searchKeyword').val() != 'Search' && jQuery.trim(jQuery('#searchKeyword').val()) != '' && jQuery('#searchKeyword').val() != jQuery('#hdn_search_keyword').val() ){
			val = 1;
			if(jQuery('#txtPageNumber').length){
				jQuery('#txtPageNumber').val(val);
			}

		}
	}
	if(jQuery('#pretty_url').length){
		var tmp = document.forms[0].action;
		tmp = tmp + '-page-' + val + '.html';
		window.location.href = tmp;
		return false;
	}
	return true;
}



function complaintAction (){
	var value = jQuery('#complaintActionItems').val();
	value = parseInt(value);
	if(value != -1){
		switch(value){
		case 1:
			showDialog('selectPaymentPlan');
			break;
		case 2:
			jQuery('#frmComplaintActions').get(0).action = '/admin/createnotice';
			jQuery('#frmComplaintActions').submit();
			break;
		case 3:
			jQuery('#frmComplaintActions').get(0).action = '/admin/addcustomerspeak';
			jQuery('#frmComplaintActions').submit();
			break;
		}
	}
	return false;
}

function validateUploadForm(element, errorElement){
	if(jQuery('input#'+element).val() == ""){
		jQuery('#'+errorElement).html("<font color='red'>Please select photo to upload. </font>");
		return false;
	}else {
		jQuery('#'+errorElement).html("");
	}
	return true;
}

function submitUploadForm(frm, action){
	var submit = true;
	if(action=='/admin/uploaduserphoto'){
		jQuery('#additional_photo').val("");
		submit = validateUploadForm('user_photo', 'dvError1');
	}
	if(action=='/admin/uploadadditionalphoto'){
		jQuery('#user_photo').val("");
		submit = validateUploadForm('additional_photo', 'dvError2');
	}
	if(action=='/admin/uploadlogo'){
		jQuery('#main_image').val("");
		submit = validateUploadForm('logo', 'dvError1');
	}
	
	if(action=='/admin/uploadmainimage'){
		jQuery('#logo').val("");
		submit = validateUploadForm('main_image', 'dvError2');
	}
	
	if(action=='/admin/uploadcompanylogo'){
		submit = validateUploadForm('logo','dvError1');
	}
	if(action=='/uploadUserPhoto'){
		submit = validateUploadForm('logo','dvError1');
	}
	if(action=='/uploadComplaintphoto'){
		submit = validateUploadForm('logos','dvError1');
	}
	if(submit){
		jQuery('#'+frm).get(0).action = action;
		document.getElementById(frm).submit();
	}
}

function checkTag() {
	/*jQuery('#company_desc').val(editor.getValue());
	jQuery('#company_info').val(editor1.getValue());*/
    var desc =document.getElementById('description');
    desc = jQuery.trim(desc);
    
    var info =document.getElementById('usefulInfo');
    info = jQuery.trim(info);
    
    //alert('description.textLength = ' + description.textLength);
    //alert('usefulInfo.textLength = ' + usefulInfo.textLength);
    //2500 needed. Extra characters allowed for formatting.
    if(description.textLength  > 7000){
        document.getElementById('diverrordescription').innerHTML= "<font color='red'>Please limit your input to 7000 characters. </fonts>";
        return false;
    }else if(usefulInfo.textLength  > 5000) {
    	 document.getElementById('diverrorusefulinfo').innerHTML= "<font color='red'>Please limit your input to 5000 characters. </fonts>";
         return false;
    }
    else{
        jQuery('#chkStatus').val(jQuery('#chkStatus').is(":checked")?1:0);
        document.getElementById('diverrordescription').innerHTML= "";
        document.getElementById('diverrorusefulinfo').innerHTML= "";
        //document.forms[0].action='/admin/supportsavecompanydetails';
        document.getElementById('frmCompany').action='/admin/supportsavecompanydetails';
        //alert("jQuery('#categoryIdList').val() = " + jQuery('#categoryIdList').val());
        //alert("jQuery('#categoryIdList').val()[0] = " + jQuery('#categoryIdList').val()[0]);
        if(jQuery('#categoryIdList').val()[0] > 0){
        	jQuery('#categoryId').val(0);
        }
        //jQuery('#description').val(htmlDecode(description));
        //jQuery('#usefulInfo').val(htmlDecode(info));
        //jQuery('#chkStatus').val(jQuery('#chkStatus').is(":checked")?1:0);
        if(jQuery('#txtCompanyName').valid() && jQuery('#txtProcessEmail').valid()) {  
        document.getElementById('frmCompany').submit();
        }
    }

     return true;   
}

function trimAll(sString){ 
	while (sString.substring(0,1) == ' ') 
	{ 
	sString = sString.substring(1, sString.length); 
	} 
	while (sString.substring(sString.length-1, sString.length) == ' ') 
	{ 
	sString = sString.substring(0,sString.length-1); 
	} 
	return sString; 
}

function validateUpdateOfflinePaymentDetails(){
	jQuery('#errormsg_div').html('');
	var transactionId = jQuery('#transactionId').val();
	var paymentdesc = jQuery('#paymentdesc').val();
	
	if(transactionId.length > 100){
		jQuery('#errormsg_div').html('Transaction Id should be less than 100 characters');
	}else if(paymentdesc.length > 450){
		jQuery('#errormsg_div').html('Description should be less than 450 characters');
	}else{
		jQuery('#errormsg_div').html('<b>Please wait...</b>');
		updateOfflinePaymentDetails(transactionId,paymentdesc);	
	}
}

function showDiv(id){
    jQuery('#'+id).show();
     jQuery('#link_'+id ).addClass('current');
}

function hideDiv(id){
    jQuery('#'+id).hide();
     jQuery('#link_'+id).removeClass('current');
}

function selectTab(showid){
    hideDiv('homelatestcomplaints');   
    hideDiv('success_stories'); 
    hideDiv('statistics'); 
    hideDiv('aboutcompany'); 
    showDiv(showid);
}


//---START--REFERRER COOKIE---

function createCookie(name,value,days) {
	if (days) {
	var date = new Date();
	date.setTime(date.getTime()+(days*24*60*60*1000));
	var expires = "; expires="+date.toGMTString();
	}
	else var expires = "";
	document.cookie = name+"="+value+expires+"; path=/";
	}

	function readCookie(name) {
	var nameEQ = name + "=";
	var ca = document.cookie.split(';');
	for(var i=0;i < ca.length;i++) {
	var c = ca[i];
	while (c.charAt(0)==' ') c = c.substring(1,c.length);
	if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
	}
	return null;
	}

	function eraseCookie(name) {
	createCookie(name,"",-1);
	}

	
	
//---END--REFERRER COOKIE---


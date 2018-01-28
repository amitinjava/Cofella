<!-- Toggle Menus JS -->
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



$(function () { 
	$("[data-toggle='tooltip']").tooltip(); 
	});
	
var delSlideContent = '<p>This will permanently delete this slide from your lecture and cannot be undone.</p>'+'<button id="close-popover" data-toggle="clickover" class="btn btn-default" onclick="$(&quot;#delSlide&quot;).popover(&quot;hide&quot;);">Cancel</button>'+' '+'<button type="button" class="btn btn-danger" onclick="deleteSlide()" >Delete</button>'
$('#delSlide').popover({animation:true, content:delSlideContent, html:true});

var delSlideContent = '<p>This will permanently delete your recording from your lecture and cannot be undone.</p>'+'<button id="close-popover" data-toggle="clickover" class="btn btn-default" onclick="$(&quot;#delRecording&quot;).popover(&quot;hide&quot;);">Cancel</button>'+' '+'<button type="button" class="btn btn-danger" onclick="deletelecturerecording()">Delete</button>'
$('#delRecording').popover({animation:true, content:delSlideContent, html:true});

$("[data-toggle=popover]").popover();
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

/*$("#ex8").slider({
	tooltip: 'always'
});
*/






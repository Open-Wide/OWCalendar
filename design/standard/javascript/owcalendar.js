
function getCalendar( year, month, loader ) {
	
	var fadeOut_duration=300;
	var duration=100;
	
	$("#owcalendar").fadeOut(fadeOut_duration, function(){
		$(this).html('<img class="ajax-loader" src="'+loader+'" />').fadeIn(duration);
	});
	
	$.ez('ezJsOwCalendar::getCalendar::'+year+'::'+month, false ,function(data) {
		if ( data.content!="false" )
        {
			$("#owcalendar").fadeOut(duration, function(){
				$(this).html(data.content).fadeIn(duration);
			});
        }
	});
	
	return false;
}

function getCalendar( year, month, loader ) {
	
	$("#owcalendar").fadeOut(100, function(){
		$(this).html('<img class="ajax-loader" src="'+loader+'" />').fadeIn(100);
	});
	
	$.ez('ezJsOwCalendar::getCalendar::'+year+'::'+month, false ,function(data) {
		if ( data.content!="false" )
        {
			$("#owcalendar").fadeOut(100, function(){
				$(this).html(data.content).fadeIn(100);
			});
        }
	});
	
	return false;
}
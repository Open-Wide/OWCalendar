
function getCalendar( year, month, loader ) {
	
	var calendar = "#owcalendar";
	
	$(calendar).html('<img class="ajax-loader" src="'+loader+'" />');
	
	$.ez('ezJsOwCalendar::getCalendar::'+year+'::'+month, false ,function(data) {
		if ( data.content!="false" )
        {
			$(calendar).html(data.content);
        }
	});
	
	return false;
}
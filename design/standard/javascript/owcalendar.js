
function getCalendar( args ) {
	
	var calendar = "#owcalendar";
	
	if ( args['loader'] ) {
		$(calendar).html('<img class="ajax-loader" src="'+args['loader']+'" />');
	}
	
	$.ez('ezJsOwCalendar::getCalendar', args, function(data) {
		if ( data.content!="false" )
        {
			$(calendar).html(data.content);
        }
	});
	
	return false;
}
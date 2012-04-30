
function getCalendar( year, month ) {

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
OWCalendar
==========

Provides an ajax calendar for eZPublish, using ezjscore and jQuery.
ezjscore and jQuery are required

Usage
------------
 1. Make sure owcalendar.js is loaded
 2. Include "design:parts/calendar/calendar.tpl" in your template
 3. Override "design:parts/calendar/day.tpl" in your design folder to display any event action

See owcalendar.ini for options details

Other
------------
This calendar can work without javascript. (only with no-dropdown settings)

Changelog
------------
1.0 : First release
	Simple ajax calendar
	
2.0 : Supports dropdown navigation

3.0 : Warning : New ajax call
	Supports custom ajax variables to preserve environment variables (exemple: current uri, current node id...)
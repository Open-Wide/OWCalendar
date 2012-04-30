<?php

include_once( 'kernel/common/template.php' );

class ezJsOwCalendar
{
	
	public static function getCalendar( $args )
    {
    	if (count($args)>1) {
	    	$year = $args[0];
	    	$month = $args[1];
	    	
	    	if ( is_numeric($year) && is_numeric($month) ) {
	
	    		$tpl = templateInit();
	    		$tpl->setVariable( 'year', $year );
	    		$tpl->setVariable( 'month', $month );
	    		
				return $tpl->fetch( 'design:parts/calendar/month.tpl' );
	
	    	}
	    	
	    	return 'false';
    	}
    }

}
?>

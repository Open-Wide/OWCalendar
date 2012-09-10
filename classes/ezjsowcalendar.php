<?php

include_once( 'kernel/common/template.php' );

class ezJsOwCalendar
{
	
	public static function getCalendar( $args )
    {
    	$input = $_POST;

    	if ( is_numeric($input['year']) && is_numeric($input['month']) ) {
	    	$year = $input['year'];
	    	$month = $input['month'];

    		$tpl = templateInit();
    		$tpl->setVariable( 'year', $year );
    		$tpl->setVariable( 'month', $month );
    		$tpl->setVariable( 'ajax_input', $input );
			return $tpl->fetch( 'design:parts/calendar/month.tpl' );
    	}
    	
    	return 'false';
    }

}
?>

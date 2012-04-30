<?php

// Operator autoloading

$eZTemplateOperatorArray = array();

$eZTemplateOperatorArray[] =
  	array( 
  		'script' => 'extension/owcalendar/autoloads/owcalendaroperators.php',
        'class' => 'owCalendarOperators',
        'operator_names' => array( 
  			'serverVariable'
		),
	);


?>
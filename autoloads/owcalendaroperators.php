<?php

class owCalendarOperators
{
    /*!
     Constructor
    */
    function owCalendarOperators()
    {
        $this->Operators = array( 
        							'serverVariable'
        );
    }

    /*!
     Returns the operators in this class.
    */
    function &operatorList()
    {
        return $this->Operators;
    }

    /*!
     \return true to tell the template engine that the parameter list
    exists per operator type, this is needed for operator classes
    that have multiple operators.
    */
    function namedParameterPerOperator()
    {
        return true;
    }

    /*!
     Both operators have one parameter.
     See eZTemplateOperator::namedParameterList()
    */
    function namedParameterList()
    {

		return array( 		
						'serverVariable' => array( )
						
				  );
    }

    /*!
     \Executes the needed operator(s).
     \Checks operator names, and calls the appropriate functions.
    */
    function modify( &$tpl, &$operatorName, &$operatorParameters, &$rootNamespace,
                     &$currentNamespace, &$operatorValue, &$namedParameters )
    {
        switch ( $operatorName )
        {	
			case 'serverVariable':
				$operatorValue = $this->server_variable($operatorValue);
			break;
    	}
    }
    

	protected function server_variable( $name ) {
		return $_SERVER[$name];
	}

    /// \privatesection
    var $Operators;
}

?>
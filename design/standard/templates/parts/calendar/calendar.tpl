{def $current = currentdate()}
	 
	 {if and( is_set($view_parameters), $view_parameters.month )}
	 	{def $month = $view_parameters.month}
	 {else}
	 	{def $month = $current|datetime('custom', '%n')}
	 {/if}
	 
	 {if and( is_set($view_parameters), $view_parameters.year )}
	 	{def $year = $view_parameters.year}
	 {else}
	 	{def $year = $current|datetime('custom', '%Y')}
	 {/if}
	 
	 <div id="owcalendar">
		{include uri="design:parts/calendar/month.tpl"
			month=$month
			year=$year
			view_parameters=first_set($view_parameters)}
	 </div>

{undef}

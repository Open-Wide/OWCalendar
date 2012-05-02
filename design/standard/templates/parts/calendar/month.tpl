{if and( is_set( $year ), is_set( $month ) )}
	
	{cache-block keys=array( $year, $month )}
		
		{***************************************
			Build url, preserving all parmeters 
		****************************************}
		
		{if not( is_set( $url ) )}
			{def $url = "REQUEST_URI"|serverVariable}
		{/if}
		{def $url_parts = $url|explode('/(')
			 $url_params = $url|explode('?')
			 
			 $url_suffix = ''
			 $url_prev = ''
			 $url_next = ''
			 
			 $prev_month = makedate( $month|sub( 1 ), 1, $year )|datetime('custom', '%n')
			 $next_month = makedate( $month|sum( 1 ), 1, $year )|datetime('custom', '%n')
			 $prev_year = makedate( $month|sub( 1 ), 1, $year )|datetime('custom', '%Y')
			 $next_year = makedate( $month|sum( 1 ), 1, $year )|datetime('custom', '%Y')}
			 
			{set $url = $url_parts[0]|ezurl(no, full)|trim('/')}
			{if $url_params|count|gt(1)}
				{set $url_params = concat('?', $url_params[1])}
			{else}
				{set $url_params = ''}
			{/if}
	
			{if first_set( $view_parameters, array() )|count}
				{foreach $view_parameters as $key => $value}
					{if and( $key|ne('month'), $key|ne('year'), $value|trim )}
						{set $url_suffix = concat($url_suffix, '/(', $key, ')/', $value)}
					{/if}
				{/foreach}
			{/if}
			{set $url_suffix = concat($url_suffix, $url_params)}
			{set $url_prev = concat( $url, '/(month)/', $prev_month, '/(year)/', $prev_year, $url_suffix )}
			{set $url_next = concat( $url, '/(month)/', $next_month, '/(year)/', $next_year, $url_suffix )}
		{undef $url_parts
			   $url_params
			   $url_suffix}
		
		
		{***************************************
			Build calendar 
		****************************************}	
		{def $first_day = makedate( $month, 1, $year )
			 $last_day = makedate( $month|sum(1), 1, $year )|sub( 86400 )
			 
			 $first_day_number = cond( $first_day|datetime( custom, '%w' ), $first_day|datetime( custom, '%w' ), 7 )
			 $last_day_number = cond( $last_day|datetime( custom, '%w' ), $last_day|datetime( custom, '%w' ), 7 )
			 
			 $nb_days_in_month = $last_day|sub($first_day)|div( 86400 )|round()|sum(1)
			 $nb_days_in_first_week = $first_day_number|mul( -1 )|sum(8)
			 $nb_days_in_last_week = $last_day_number
			 
			 $nb_weeks = $nb_days_in_month|sub( $nb_days_in_first_week )|sub( $nb_days_in_last_week )|div( 7 )|round|sum(1)|sum( cond($nb_days_in_last_week, 1) )
			 $nb_days_in_week = $nb_days_in_first_week
			 
			 $first_day_of_week = 1
			 
			 $loader = "images/ajax-loader.gif"|ezdesign(no)
		}
			{* Header links *}
			<p class="calendar_links">
				<a id="calendar_prev" onClick="getCalendar( {$prev_year}, {$prev_month}, '{$loader}' ); return false;" href="{$url_prev}">&larr;</a>
				{$first_day|datetime( custom, '%F %Y' )}
				<a id="calendar_next" onClick="getCalendar( {$next_year}, {$next_month}, '{$loader}' ); return false;" href="{$url_next}">&rarr;</a>
			</p>
			
			<table>
				{* Calendar header *}
				<tr>
					{for 1 to 7 as $i}
						<th>{makedate( 3, $i, 1971 )|datetime( custom, '%D' )|extract_left(1)|upcase}</th>
					{/for}
				</tr>
	
				{* Calendar weeks *}
				{for 1 to $nb_weeks as $n}
				
					{if $nb_days_in_week|gt(0)}
					 	{include uri="design:parts/calendar/week.tpl"
					 			 year=$year
					 			 month=$month
					 			 nb_days=$nb_days_in_week
					 			 first_day=$first_day_of_week}
					 {/if}
					 
					 {set $first_day_of_week = $first_day_of_week|sum( $nb_days_in_week )}
					 {if $n|eq($nb_weeks|sub(1))}
					 	{set $nb_days_in_week = $nb_days_in_last_week}
					 {else}
					 	{set $nb_days_in_week = 7}
					 {/if}
					 
				{/for}
				
			</table>
		{undef}
		
	{/cache-block}
	
{/if}
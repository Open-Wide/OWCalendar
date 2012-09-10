{* NOTE : You can access to your custom ajax variables with $ajax_input array *}
{if and(
	is_set( $year) ,
	is_set( $month ),
	is_set( $nb_days ),
	is_set( $first_day )
	)}
	
	{def $current_day = makedate( $month, $first_day, $year )}
		<tr>
		
			{* Display days before current month *}
			{if $first_day|eq(1)}
			
				{def $nb_days_before = 7|sub( $nb_days )}
					{if $nb_days_before|gt(0)}
						{def $current_day_before = $current_day|sub( $nb_days_before|mul( 86400 ) )}
						
							{for 1 to $nb_days_before as $day}
								{include uri="design:parts/calendar/day.tpl" timestamp=$current_day_before class="calendar_inactive before"}
								{set $current_day_before = $current_day_before|sum( 86400 )}
							{/for}
							
						{undef $current_day_before}
					{/if}
				{undef $nb_days_before}
			{/if}
			
			{* Display days in current month *}
			{for 1 to $nb_days as $day}
				{include uri="design:parts/calendar/day.tpl" timestamp=$current_day ajax_input=$ajax_input}
				{set $current_day = $current_day|sum( 86400 )}
			{/for}
			
			
			{* Display days after current month *}
			{if and( $first_day|gt(1), $nb_days|lt(7) )}
			
				{def $nb_days_after = 7|sub( $nb_days )}
					{if $nb_days_after|gt(0)}
						{def $current_day_after = $current_day}
						
							{for 1 to $nb_days_after as $day}
								{include uri="design:parts/calendar/day.tpl" timestamp=$current_day_after class="calendar_inactive after" ajax_input=$ajax_input}
								{set $current_day_after = $current_day_after|sum( 86400 )}
							{/for}
							
						{undef $current_day_after}
					{/if}
				{undef $nb_days_after}
			{/if}
			
		</tr>
	{undef $current_day}
{/if}
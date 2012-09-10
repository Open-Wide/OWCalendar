{* NOTE : You can access to your custom ajax variables with $ajax_input array *}
{if is_set( $timestamp )}
	<td{if first_set($class)} class="{$class}"{/if}>{$timestamp|datetime('custom', '%j')}</td>
{/if}
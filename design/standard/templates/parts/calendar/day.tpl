{if is_set( $timestamp )}
	<td{if first_set($class)} class="{$class}"{/if}>{$timestamp|datetime('custom', '%j')}</td>
{/if}
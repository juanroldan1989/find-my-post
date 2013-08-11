$(document).ready(function(){

	$('#search_input').fastLiveFilter('#search_list', {
	  callback: function(total) { 
	    $('#num_results').html(total); 
	    $( '.list' ).masonry( 'reload' ); }
	});
	$('#num_results').html($('#search_list li').size())
	$('#search_input').focus();

});
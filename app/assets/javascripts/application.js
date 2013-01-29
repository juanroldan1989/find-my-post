// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require jquery.timeago
//= require jquery.timeago.es
//= require jquery.fastLiveFilter
//= require jquery.scrollUp.min

$(document).ready(function(){
	jQuery('div.item-updated-time').timeago();

	$('#search_input').fastLiveFilter('#search_list', {
		callback: function(total) { $('#num_results').html(total); }
	});
	$('#search_input').focus();
	$('#num_results').html($('#search_list li').size())

	$(function () {
	    $.scrollUp({
	        scrollName: 'scrollUp', // Element ID
	        topDistance: '600', // Distance from top before showing element (px)
	        topSpeed: 300, // Speed back to top (ms)
	        animation: 'fade', // Fade, slide, none
	        animationInSpeed: 200, // Animation in speed (ms)
	        animationOutSpeed: 200, // Animation out speed (ms)
	        scrollText: 'Ir arriba!', // Text for element
	        activeOverlay: true, // Set CSS color to display scrollUp active point, e.g '#00FFFF'
	    });
	});

});

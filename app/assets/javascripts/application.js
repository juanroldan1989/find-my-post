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
  $('#loading').hide();
	jQuery('div.item-updated-time').timeago();
  set_scroll_up();
  set_search_button();
});

function set_scroll_up(){
  $(function () {
      $.scrollUp({
          scrollName: 'scrollUp', // Element ID
          topDistance: '600', // Distance from top before showing element (px)
          topSpeed: 300, // Speed back to top (ms)
          animation: 'fade', // Fade, slide, none
          animationInSpeed: 200, // Animation in speed (ms)
          animationOutSpeed: 200, // Animation out speed (ms)
          scrollText: 'Ir arriba :)', // Text for element
          activeOverlay: true, // Set CSS color to display scrollUp active point, e.g '#00FFFF'
      });
  });
}

function set_search_button() {
  $('input#search_button').click(function(event){

    $('#loading').show();

    var e1    = document.getElementById("group");
    var drop1 = e1.options[e1.selectedIndex].value;
    
    var e2    = document.getElementById("posts_cant");
    var drop2 = e2.options[e2.selectedIndex].value;
    
    event.preventDefault(); 
    $.ajax({
      type    : "GET",
      beforeSend: function(xhr){
        xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))
      },
      url      : '/results?group=' + drop1 + '&posts_cant=' + drop2,
      success  : function(data){
        $('#loading').hide();
        var html               = data;
        var html_filtered      = $(html).filter('#posts_results');
        $('div#posts_results').html(html_filtered);
        set_live_filter();
      }
    });
    event.stopPropagation();
  });
}

function set_live_filter(){  
  $('#search_input').fastLiveFilter('#search_list', {
    callback: function(total) { $('#num_results').html(total); }
  });
  $('#num_results').html($('#search_list li').size())
  $('#search_input').focus();
}
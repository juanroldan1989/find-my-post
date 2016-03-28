//= require results/all
//= require results/jquery.timeago
//= require results/jquery.timeago.es
//= require results/masonry
//= require results/jquery.fastLiveFilter
//= require results/chosen.jquery

$(document).ready(function(){
  $("#loading").hide();
  $("#search_box").hide();
  set_search_button();

  //URL cleaner
  window.history.pushState("", "", "/results");
});

function set_search_button() {
  $("input#search_button").click(function(event){

    $("#search_button_div").hide();
    $("#loading").show();

    var e1    = document.getElementById("group");
    var drop1 = e1.options[e1.selectedIndex].value;
    
    var e2    = document.getElementById("posts_cant");
    var drop2 = e2.options[e2.selectedIndex].value;
    
    event.preventDefault();
    $.ajax({
      type    : "GET",
      beforeSend: function(xhr){
        xhr.setRequestHeader("X-CSRF-Token", $("meta[name='csrf-token']").attr("content"))
      },
      url      : "/results",
      data     : { group: drop1, posts_cant: drop2 },
      success  : function(data){
        $("#loading").hide();
        $("#search_box").show();
        $("#ajax_results").html(data);
        set_live_filter();
        $("#ajax_results .item-updated-time").timeago();
        $("#search_button_div").show();
      }
    });
    event.stopPropagation();
  });
}

function set_live_filter(){
  set_masonry_settings();

  $("#search_input").fastLiveFilter("#search_list", {
    callback: function(total) {
      $("#num_results").html(total);
      $( ".list" ).masonry( "reload" ); }
  });

  $("#num_results").html($("#search_list li").size())
  $("#search_input").focus();
}

function set_masonry_settings() {
  var columns    = 4,
    setColumns = function() { columns = $( window ).width() > 1288 ? 4 : $( window ).width() > 965 ? 3 : $( window ).width() > 643 ? 2 : 1; };

  setColumns();
  $( window ).resize( setColumns );

  $( ".list" ).masonry({
      itemSelector: ".div-box",
      columnWidth:  function( containerWidth ) { return containerWidth / columns; }
  });
}
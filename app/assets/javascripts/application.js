//= require jquery
//= require jquery_ujs

$(document).ready(function(){
  $('#loading_access').hide();
  loading_acces();

  //URL cleaner
  window.history.pushState("", "", "/");
});

function loading_acces(){
  $('#access_button').click(function(){
    $('#grant_access').hide();
    $('#loading_access').show();
  })
}

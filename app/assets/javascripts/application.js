// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootbox
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .



// Override the default confirm dialog by rails
$.rails.allowAction = function(link){
  if (link.data("confirm") == undefined){
    return true;
  }
  $.rails.showConfirmationDialog(link);
  return false;
}

//User click confirm button
$.rails.confirmed = function(link){
  link.data("confirm", null);
  link.trigger("click.rails");
}
//Display the confirmation dialog
$.rails.showConfirmationDialog = function(link){
  var message = link.data("confirm");
  bootbox.confirm(message, function (result){
    if (result == true) {
      $.rails.confirmed(link);
    }
    else{
      bootbox.hideAll();      
    }
  });
}

$(document).ready(function(){
// 	var pathname = window.location.pathname;
// 	$('li.nav-element > a[href="'+pathname+'"]').parent().addClass('active');


  // $("li.nav-element").on("click", function(e){
  //   $(this).addClass('active');

  // });
  // var url = window.location;
  // $('li.nav-element a').filter(function() {
  //     return this.href == url;
  // }).parent().addClass('active');
});
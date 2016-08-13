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
//= require jquery.validate
//= require jquery.validate.additional-methods
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

$(document).ready(function () {
  // Validation for forms
  $("#new_album").validate({
    debug: true,
    rules: {
    "album[title]": {required: true, minlength: 5, maxlength: 30},
    "album[description]": {required: true}
    },
  });
  
  $("#new_photo").validate({
    debug: true,
    rules: {
      "photo[title]": {
        required: true, minlength: 5, maxlength: 30
      },
      "photo[image]": {
        required: true
      }
      
    },

  });
  
  $("#new_user").validate({
    debug: true,
    rules: {
      "user[email]": {
        required: true, email: true
      },
      "user[name]": {
        required: true, minlength: 5
      },
      "user[password]": {
        required: true
      },
      "user[password_confirmation]": {
        required: true,
        equalTo: "#user_password"
      }
    },
  });  
});

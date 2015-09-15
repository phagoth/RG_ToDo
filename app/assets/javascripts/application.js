// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require turbolinks
//= require_tree .
$(document).ready(function(){
  $(".project-header").hover(
    function () {
      $(this).find(".small-buttons").removeClass("hide");
    },
    function () {
      $(this).find(".small-buttons").addClass("hide");
    }
  );

  $(".task_wrapper .row").hover(
    function () {
      $(this).find(".trash").removeClass("hide");
    },
    function () {
      $(this).find(".trash").addClass("hide");
    }
  );

  $(".input_title").hide();

  $(".edit-project").on('click', function(){
    $(this).parents('.project-header').find('.label_title').toggle();
    $(this).parents('.project-header').find('.input_title').toggle();
    
    return false;
  });

  $(".task_input_title").hide();
  
  $(".edit-task").on('click', function(){
    $(this).parents('.row').find('.task_label_title').toggle();
    $(this).parents('.row').find('.task_input_title').toggle();
    
    return false;
  });
});  

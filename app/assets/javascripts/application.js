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
//= require jquery_ujs
//= require turbolinks
//= require handlebars.runtime
//= require_tree ./templates
//= require_tree .


$(document).on("ready page:load", function(){
  var $commentCon = $("#new_comment").parent().clone();
  var $commentForm = $commentCon.find("#new_comment");
  var baseAction = $commentForm.attr("action");
  var $last;
  $(".comments").on("click",".comment", function(event){
      $last = $last || $(this);
      $last.show();
      var commentId = this.dataset.commentId;
      var actionPath = baseAction + "/" + commentId;
      $commentForm.attr("action", actionPath);
      $(this).hide();
      $last = $(this);
      $last.parent().append($commentCon);
      $commentForm.on("click", function(e){
        e.preventDefault();
      });
  })
});


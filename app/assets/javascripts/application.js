// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
$.ajaxSettings.dataType = "json";

$(document).ready(function(){
  // create a convenient toggleLoading function
  //
  // $("#searchbox_form .submit").click(function() {
  //   $("#searchbox_form").submit()
  // })
  $("#results").hide()
  $("#searchbox_form").on("ajax:success", function(event, data, status, xhr) {
    $("#results").hide()
    $("#results").html(data["html"]);
    $("#results").slideDown()

  });
  $("#searchbox_form").on("ajax:error", function(xhr, status, error) {
    console.log("error - xhr", xhr)
    console.log("error - status", status)
    console.log("error - error", error)

  });
})

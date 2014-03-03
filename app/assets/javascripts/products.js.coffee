# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('.products .product').click ->
    FB.login
    meditation_id = $(this).attr("id")
    request = $.ajax(
      url: "script.php"
      type: "POST"
      data: 
        meditation_id: meditation_id

      dataType: "html"
    )
    request.done (msg) ->
      $("#log").html msg
      return

    request.fail (jqXHR, textStatus) ->
      alert "Request failed: " + textStatus
      return
    
# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('form.new_comment').bind 'submit', ->
    setTimeout ->
        $('form.new_comment').children('textarea').val('')
    , 500

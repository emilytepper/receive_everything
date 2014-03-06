# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('#new_goddess').validate
    'rules':
      'goddess[first_name]': 'required'
      'goddess[last_name]': 'required'
      'goddess[phone]': 'required'
      'goddess[personal_statement]': 'required'
      'goddess[group_choice]': 'required'

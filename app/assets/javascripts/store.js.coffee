# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "ready page:load" , ->
  $('.store .entry > img').click ->
    $(this).parent().find(':submit').click()

$(document).on "ready page:load" , ->
  $('.store .entry > h3').click ->
    $(this).parent().find(':submit').click()


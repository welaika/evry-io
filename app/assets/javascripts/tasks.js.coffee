# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->

  $(".rotate_words").textrotator
    animation: "fade"
    separator: ","
    speed: 2000

  $(".rotate_words2").textrotator
    animation: "fade"
    separator: ","
    speed: 3000

  $('.popup').tipr()

  $(".delete_button").click (event) ->
    $(".basic.modal").modal("setting", "onDeny", ->
      console.log "denied deletion"
      false
    ).modal("setting", "onApprove", ->
      console.log "delete task" 
      true
    ).modal "show"

$(ready)
$(document).on('page:load', ready)
  

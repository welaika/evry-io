# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->

  $(".rotate_words").textrotator
    animation: "fade"
    separator: ","
    speed: 2500

  $(".rotate_words2").textrotator
    animation: "fade"
    separator: ","
    speed: 3000

  $('.popup').tipr()

  $('blockquote').quovolver()

  $(".delete_button").click (event) ->
    $(".basic.modal").modal("setting", "onDeny", =>
      console.log "denied deletion"
    ).modal("setting", "onApprove", =>
      console.log "delete task" 
      $.post(@href, { _method: 'delete' }, null, "script")
    ).modal "show"

    false

$(ready)
$(document).on('page:load', ready)

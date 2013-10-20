# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $('.popup').tipr()

  $(".delete_button").click (event) ->
    event.preventDefault()

    href = $(this).attr('href')

    console.log href

    # $(".basic.modal").modal("setting", "onDeny", ->
    #   console.log "denied deletion of " + task_id
    # ).modal("setting", "onApprove", ->
    #   console.log "delete task " + task_id
    # ).modal "show"
    # false

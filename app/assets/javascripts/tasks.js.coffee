# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $('.popup').tipr()

  $(".deleteButton").click ->

    task = $(this).data("task")
    console.log task
    $(".basic.modal").modal("setting", "onDeny", ->
      console.log "denied"
      alert "Denied to delete id task " + task
    ).modal("setting", "onApprove", ->
      console.log "approved"
      alert "Approved to delete id task " + task
    ).modal "show"
    false

  $(".doneCheckbox").click ->

    task = $(this).data("task")
    console.log task
    if $(this).children("i").hasClass('empty')
      $(this).children("i").removeClass('empty').addClass('checked')
      
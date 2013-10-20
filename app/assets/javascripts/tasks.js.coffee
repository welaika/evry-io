# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $('.popup').tipr()

  $(".delete_button").click ->

    $task = $(this).parents('.task')
    task_id = $task.data("task-id")

    $(".basic.modal").modal("setting", "onDeny", ->
      console.log "denied"
      alert "Denied to delete id task " + task_id
    ).modal("setting", "onApprove", ->
      console.log "approved"
      alert "Approved to delete id task " + task_id
    ).modal "show"
    false

  $(".set_task_state").click ->

    $task = $(this).parents('.task')
    task_id = $task.data("task-id")

    if !$task.hasClass('done')
      $(this).children("i").removeClass('empty').addClass('checked')
      $task.addClass('done')
    else if $task.hasClass('done')
      $(this).children("i").removeClass('checked').addClass('empty')
      $task.removeClass('done')

      

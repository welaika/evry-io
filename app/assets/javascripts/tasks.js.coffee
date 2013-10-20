# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

deleteButtonHandler = (event) ->
  $(".basic.modal").modal("setting", "onDeny", =>
    console.log "denied deletion"
  ).modal("setting", "onApprove", =>
    console.log "delete task" 
    $.post(@href, { _method: 'delete' }, null, "script")
  ).modal "show"

  false

setTaskStateHandler = (event) ->
  event.preventDefault()

  $this = $(@)
  $task = $this.parents('.task')
  $icon = $('i', $this)
  $recurrence = $task.find('.recurrence span')

  $task.toggleClass('done')

  if $task.hasClass('done')
    $icon.removeClass('empty').addClass('checked')
    $recurrence.text('Not planned')
  else
    $icon.removeClass('checked').addClass('empty')

tasksReady = ->
  $('.popup').tipr()
  $(".delete_button").unbind('click', deleteButtonHandler).click(deleteButtonHandler)
  $('.set_task_state').unbind('click', setTaskStateHandler).click(setTaskStateHandler)

$ ->
  tasksReady()

  $(".rotate_words").textrotator
    animation: "fade"
    separator: ","
    speed: 2000

  $(".rotate_words2").textrotator
    animation: "fade"
    separator: ","
    speed: 2500

  $('blockquote').quovolver()

$(document).on('page:load', tasksReady)

window.tasksReady = tasksReady


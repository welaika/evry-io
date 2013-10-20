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
    speed: 2500

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

  $('.set_task_state').click (event) ->
    event.preventDefault()

    console.log $(@)
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

$(ready)
$(document).on('page:load', ready)

# let's define the tour for Evry.io
tour =
  id: "evry-welcome-tour"
  showPrevButton: true
  showNextButton: true
  showCloseButton: true
  steps: [
    title: "Welcome to Every.io!"
    content: "Every.io makes easy to handle cyclical ToDo tasks! In this field you need to describe when your event occurs."
    target: "task_time_expression"
    placement: "right"
  ,
    title: "Action of the task"
    content: "What you need to do? In this field you can describe your action"
    target: "task_action"
    placement: "top"
  ,
    title: "Remind me!"
    content: "After pushing this button, Every.io will remind you each time. Totally free."
    target: "submit-form-button"
    placement: "right"
  ,
    title: "My reminders"
    content: "You can find all your reminders simply clicking in this menu. When you want. Where you want."
    target: "task-list-menu"
    placement: "bottom"
  ]
  onEnd: ->
    $.cookie('tour',true)

$(document).ready ->
  if $(".newtask").length > 0
    if (window.user_sign_count < 2) and ($.cookie('tour') is null)
      console.log "Start the tour!"
      hopscotch.startTour tour


# let's define the tour for Evry.io
tour =
  id: "evry-welcome-tour"
  showPrevButton: true
  showNextButton: true
  showCloseButton: true
  steps: [
    title: "Welcome to Every.io!"
    content: "In this field you need to describe when your event occurs."
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
    placement: "left"
  ,
    title: "My reminders"
    content: "You can find all your reminders with every information you need"
    target: "list-task-table"
    placement: "top"
  ,
    title: "When Evry.io will notify me?"
    content: "For each notification you know when Evry.io will notify you!"
    target: "next-reminder-column" 
    placement: "top"
  ,
    title: "Change a reminder"
    content: "For each reminder you can delete, edit or reschedule it"
    target: "actions-column" 
    placement: "top"
  ,
    title: "To the next notification"
    content: "When a notification has expired, you can reschedule it and Evry.io will notify you with the new updated date!"
    target: "check-column" 
    placement: "left" 
  ]
  onEnd: ->
    $.cookie('tour', true)

ready = ->
  if $(".taskindex").length > 0
    if (window.user_sign_count < 2) and ($.cookie('tour') is null) and !window.user_guest
      hopscotch.startTour tour
    else if window.user_guest and ($.cookie('tour') is null)
      hopscotch.startTour tour
    
    #hopscotch.startTour tour

$(ready)
$(document).on('page:load', ready)

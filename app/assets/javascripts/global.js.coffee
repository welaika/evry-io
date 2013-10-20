@hide_flashes = ->
  setTimeout ->
    $('#flash').fadeOut()
  , 2000

ready = ->
  $.cookie "user_time_zone", $({}).get_timezone()

  $('[data-buttonspinner]').buttonspinner()

  $('form').on 'click', '[data-buttonspinner]', ->
    $(@).buttonspinner('start')


$(ready)
$(document).on('page:load', ready)

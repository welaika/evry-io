@hide_flashes = ->
  setTimeout ->
    $('#flash').fadeOut()
  , 2000

ready = ->
  $.cookie "user_time_zone", $({}).get_timezone()

  $('[data-buttonspinner]').buttonspinner()

  $('form').on 'click', '[data-buttonspinner]', ->
    $(@).buttonspinner('start')

  $(".rotate_words").textrotator
    animation: "fade"
    separator: ","
    speed: 2000

  $(".rotate_words2").textrotator
    animation: "fade"
    separator: ","
    speed: 2500

  $('blockquote').quovolver()

  $('form').on 'click', '#try_it', (event) ->
    event.preventDefault()
    event.stopPropagation()
    $(@).parents('form').find('input[type="submit"]').trigger('click')


$(ready)
$(document).on('page:load', ready)

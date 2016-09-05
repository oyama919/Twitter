ready = ->
  
  $(window).scroll ->
    element = $('h2')
    visible = element.is(':visible')
    height = $(window).scrollTop()
    if height > 30
      element.fadeOut()
    else
      element.fadeIn() if !visible
      
$(document).ready(ready)
$(document).on('page:load', ready)
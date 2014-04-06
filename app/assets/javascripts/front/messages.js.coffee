$ ->
  window.controller = new MessagesController

  $('a[role=submit-message]').on 'click', (e) ->
    e.preventDefault()
    window.controller.sendMessage()

  $('input[role=message-body]').on 'keypress', (e) ->
    if e.charCode == 13
      e.preventDefault()
      window.controller.sendMessage()

class MessagesController
  sendMessage: ->
    $.ajax
      url: '/my/messages'
      data: $('form[role=message-form]').serializeArray()
      method: 'POST'
      beforeSend: ->
        $('div[role=spinner]').addClass('hidden')
      success: (data, status, resp) ->
        if data.errors
          $('p[role=message-body-errors]').html(data.errors)
        else
          $('div[role=spinner]').removeClass('hidden')
          $('ul[role=messages-container]').prepend(data)
          $('input[role=message-body]').val('')
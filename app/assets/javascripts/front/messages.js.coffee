$ ->
  window.controller = new MessagesController

  $('a[role=submit-message]').on 'click', (e) ->
    e.preventDefault()
    window.controller.sendMessage()

  $('input[role=message-body]').on 'keypress', (e) ->
    if e.charCode == 13
      e.preventDefault()
      window.controller.sendMessage()

  window.setLongPull = () ->
    # заменить на цикл
    setTimeout window.controller.pullMessage, 200

class MessagesController
  self = {}
  sendMessage: ->
    $.ajax
      url: '/messages'
      data: $('form[role=message-form]').serializeArray()
      method: 'POST'
      beforeSend: ->
        $('div[role=spinner]').addClass('hidden')
      success: (data, status, resp) ->
        if data.errors
          $('p[role=message-body-errors]').html(data.errors)
        else
          $('div[role=spinner]').removeClass('hidden')
          $('div[role=messages-container]').prepend(data)
          $('input[role=message-body]').val('')
          self.sendPhotosForMessage()

  self.sendPhotosForMessage = ->
    photosIds = []
    for photoEl in $("[role=preload]")
      photosIds.push photoEl.id
    messageId = $('[role=online-message]')[0].getAttribute('data-id')
    $.ajax
      url: '/messages/assing_photos_to_message'
      data: {photos_ids: photosIds, message_id: messageId}
      method: "PUT"

  pullMessage: ->
    $.ajax
      url: '/last_messages'
      data: $('form[role=last-message-form]').serializeArray()
      method: 'GET'
      success: (data, status, resp) ->
        if data
          $('div[role=messages-container]').prepend(data)
          lastMessageEl = $('.messages-bock p')[0]
          $('#last_message_id').val $(lastMessageEl).data('id')

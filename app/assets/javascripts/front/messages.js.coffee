$ ->
  $('a[role=submit-message]').on 'click', (e) ->
    e.preventDefault()
    sendMessage()

  $('input[role=message-body]').on 'keypress', (e) ->
    if e.charCode == 13
      e.preventDefault()
      sendMessage()

sendMessage = ->
  data = $('form[role=message-form]').serializeArray()
  for photoEl in $("[role=preload]")
    data.push {name: 'photos_ids[]', value: photoEl.id}
  $.ajax
    url: '/messages'
    data: data
    method: 'POST'
    beforeSend: ->
      $('div[role=spinner]').addClass('hidden')
    success: (data, status, resp) ->
      if data.errors
        $('p[role=message-body-errors]').html(data.errors)
      else
        $("[role=preload]").remove()
        $('div[role=spinner]').removeClass('hidden')
        $('div[role=messages-container]').prepend(data)
        $('input[role=message-body]').val('')

pullMessages = ->
  return
  $.ajax
    url: '/messages/latest_for_online'
    data:
      online_id: $('[role=online]').data('id')
      last_message_id: $('[role=online-message]').data('id')
    method: 'GET'
    success: (data, status, resp) ->
      if data
        $('div[role=messages-container]').prepend(data)
        lastMessageEl = $('.messages-bock p')[0]
        $('#last_message_id').val $(lastMessageEl).data('id')
      setTimeout pullMessages, 5000

window.pullMessages = pullMessages

_        = require 'lodash'
Firebase = require 'firebase'
URL      = 'NOPE'

app = Elm.Main.fullscreen()
{contactFirebase, response} = app.ports

respond = (email) ->
  app.ports.response.send email

contactFirebase.subscribe (email) ->
  hasAtSign = (email.indexOf '@') isnt -1
  hasADot   = (email.indexOf '.') isnt -1

  if hasADot and hasAtSign
    email_ = email.split ''
    email_ = _.map email, (ch, i) ->
      if ch is '@' then ch = ' at '
      if ch is '.' then ch = ' dot '
      ch

    email_ = _.reduce email_,
      (sum, ch) -> sum + ch
      ''

    fb = new Firebase URL + '/' + email_
    fb.set email, (error) ->
      if error then response 'ERROR'
      else respond 'SUCCESS'

  else 
    respond 'INVALID'


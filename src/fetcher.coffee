Person = require './person'
http = require 'http'

handleData = (data, cb) ->
  if 'object' isnt typeof data
    return cb? new Error 'Invalid response type'
  list = []
  for own key, value of data
    list.push new Person key, value
  cb? null, list

padNumber = (number) ->
  return '0' + number if number < 10
  return number + ''

dateToString = (date) ->
  goodDate = new Date date.valueOf() - 60*1000*60*5
  parts = [
    goodDate.getUTCFullYear()
    padNumber goodDate.getUTCMonth() + 1
    padNumber goodDate.getUTCDate()
  ]
  return parts.join '/'

module.exports = (_date, _cb) ->
  if 'function' is typeof _date
    date = new Date()
    cb = _date
  else
    date = _date
    cb = _cb
  dateStr = dateToString date
  theUrl = "http://www.bloomberg.com/billionaires/db/stats/#{dateStr}"
  req = http.get theUrl, (res) ->
    buffer = new Buffer ''
    res.on 'data', (d) ->
      buffer = Buffer.concat [buffer, d]
    res.on 'end', ->
      try
        data = JSON.parse buffer
      catch e
        return cb? e
      handleData data, cb
  req.on 'error', (err) ->
    cb? err

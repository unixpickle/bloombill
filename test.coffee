{fetch} = require './index.js'
fetch new Date(), (err, list) ->
  console.log 'err', err
  console.log 'list', list
capitalize = (x) -> x.charAt(0).toUpperCase() + x.slice 1

class Person
  constructor: (@rawName, @rawValue) ->
    if 'number' is typeof @rawValue.rank
      @rank = @rawValue.rank
    @_parseField 'net', 'worth'
    @_parseField 'last', 'money'
    @_parseField 'ytd', 'money'
    @_parseField 'last_rel', 'percent'
    @_parseField 'ytd_rel', 'percent'
    @hold =
      cash: (@rawValue.hold?[0] ? 0) / 10000
      public: (@rawValue.hold?[1] ? 0) / 10000
      private: (@rawValue.hold?[2] ? 0) / 10000
    @name = (capitalize(x) for x in @rawName.split '-').join ' '

  _parseField: (name, type) ->
    value = @rawValue[name]
    if 'number' isnt typeof value
      @[name] = null
    else if type is 'worth'
      @[name] = value * 10000000
    else if type is 'percent'
      @[name] = value / 10000
    else if type is 'money'
      @[name] = value * 10000


module.exports = Person

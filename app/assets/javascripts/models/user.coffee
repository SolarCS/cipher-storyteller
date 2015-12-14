angular.module('storyteller').service 'User', (ModelBase) ->

  class User extends ModelBase

    constructor: (attrs={}) ->
      super(attrs)

angular.module('storyteller').service 'CurrentUser', (User) ->

  class CurrentUser extends User

    constructor: (attrs={}) ->
      super(attrs)

angular.module('storyteller').service 'Vote', (ModelBase, User) ->

  class Vote extends ModelBase

    constructor: (attrs={}) ->
      super(attrs)
      if @user
        @user = new User(@user)
        @userId = @user.id

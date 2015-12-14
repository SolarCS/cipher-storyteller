angular.module('storyteller').service 'Comment', (ModelBase) ->

  class Comment extends ModelBase

    constructor: (attrs={}) ->
      super(attrs)

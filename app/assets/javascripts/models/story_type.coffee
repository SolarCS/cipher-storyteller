angular.module('storyteller').service 'StoryType', (ModelBase) ->

  class StoryType extends ModelBase

    constructor: (attrs={}) ->
      super(attrs)

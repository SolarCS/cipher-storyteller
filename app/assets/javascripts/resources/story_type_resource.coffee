angular.module('storyteller').factory 'StoryTypeResource', (ResourceBase, StoryType) ->

  class StoryTypeResource extends ResourceBase

    constructor: ->
      super '/story_types/:id', default: { model: StoryType }

    list: ->
      @action
        path: '/story_types'
        cache: true

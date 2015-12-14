angular.module('storyteller').factory 'StoryResource', (ResourceBase, Story) ->

  class StoryResource extends ResourceBase

    constructor: ->
      super '/stories/:id', default: { model: Story }

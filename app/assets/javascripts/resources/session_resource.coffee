angular.module('storyteller').factory 'SessionResource', (ResourceBase, CurrentUser) ->

  class SessionResource extends ResourceBase

    constructor: ->
      super '/sessions/:id', default: { model: CurrentUser }

    verify: ->
      @action
        path: '/sessions/verify'

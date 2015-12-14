angular.module('storyteller').factory 'VoteResource', (ResourceBase, Vote) ->

  class VoteResource extends ResourceBase

    constructor: ->
      super '/votes/:id', default: { model: Vote }

    create: (votable) ->
      @action
        path: @route
        method: 'POST'
        data:
          votableId: votable.id
          votableType: votable.constructor.name

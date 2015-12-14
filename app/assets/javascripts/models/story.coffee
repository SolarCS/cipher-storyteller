angular.module('storyteller').service 'Story', (Comment, ModelBase, StoryType, User, Vote) ->

  class Story extends ModelBase

    constructor: (attrs={}) ->
      super(attrs)

      @comments = _.map @comments, (comment) -> new Comment(comment)

      if @requester
        @requester = new User(@requester)
        @requesterId = @requester.id

      if @type
        @type = new StoryType(@type)
        @typeId = @type.id

      @votes = _.map @votes, (vote) -> new Vote(vote)

    canEdit: (user) ->
      user.id == @requester.id

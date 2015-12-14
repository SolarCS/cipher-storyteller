angular.module('storyteller').directive 'voteButton', ($rootScope, VoteResource) ->

  replace: true
  restrict: 'E'
  scope: { votable: '=' }
  templateUrl: 'directives/votes/vote_button.html'

  link: (scope) ->

    resource = new VoteResource()

    scope.toggleVote = ->
      if vote = scope.currentUserVote()
        resource.destroy(vote).then (response) ->
          _.pull scope.votable.votes, vote
      else
        resource.create(scope.votable).then (response) ->
          scope.votable.votes.push response.data

    scope.voted = ->
      !!scope.currentUserVote()

    scope.currentUserVote = ->
      if currentUserId = $rootScope.currentUser?.id
        _.find scope.votable.votes, (vote) ->
          vote.userId == currentUserId

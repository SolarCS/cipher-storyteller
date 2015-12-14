angular.module('storyteller').directive 'votesSummary', ($rootScope) ->

  replace: true
  restrict: 'E'
  scope: { votable: '=' }
  templateUrl: 'directives/votes/votes_summary.html'

  link: (scope) ->

    MAX_NUM_NAMES = 3

    mapNames = (votes) ->
      _.tap [], (names) ->
        currentUserId = $rootScope.currentUser?.id
        _.each votes, (vote) ->
          if vote.user.id == currentUserId
            names.unshift('You')
          else
            names.push vote.user.name

    summarize = (votes) ->
      names = if votes.length then mapNames(votes) else ['Nobody']
      if names.length > MAX_NUM_NAMES
        theRestCount = names.length - MAX_NUM_NAMES
        theRestRendered =
        theRest = "#{ theRestCount } other#{ if theRestCount > 1 then 's' else '' }"
        names = _.take(names, MAX_NUM_NAMES).concat(theRestRendered)
      renderedNames = if names.length > 1
        [_.take(names, names.length - 1).join(', '), _.last(names) ].join(' and ')
      else _.first(names)
      scope.summary = renderedNames + ' voted for this ' + scope.votable.constructor.name.toLowerCase()

    scope.$watchCollection 'votable.votes', (votes) ->
      scope.summary = summarize(votes)

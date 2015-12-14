angular.module('storyteller').service 'PageClass', ($rootScope) ->

  init: ->
    $rootScope.$on '$stateChangeSuccess', (event, toState, toParams, fromState, fromParams) ->
      $rootScope.pageClass = toState.pageClass

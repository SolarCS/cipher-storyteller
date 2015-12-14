angular.module('storyteller').controller 'HeaderController', ($rootScope, $scope, $state, SessionResource) ->

  $scope.signOut = ->
    new SessionResource().destroy().then ->
      $rootScope.currentUser = null
      $state.go('root.signIn')

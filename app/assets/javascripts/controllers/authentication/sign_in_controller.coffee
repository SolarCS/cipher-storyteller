angular.module('storyteller').controller 'SignInController', ($scope, $rootScope, $state, SessionResource, User) ->

  $scope.user = new User()

  $scope.submit = ->
    $scope.submitAttempted = true
    if $scope.signInForm.$valid
      $scope.serverError = undefined
      new SessionResource().create($scope.user).then (response) ->
        $rootScope.currentUser = response.data
        $state.go('root.stories')
      , (response) ->
        $scope.serverError = response.data.error

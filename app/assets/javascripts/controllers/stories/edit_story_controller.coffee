angular.module('storyteller').controller 'EditStoryController', ($scope, $stateParams, StoryResource) ->

  new StoryResource().get($stateParams.id).then (response) ->
    $scope.story = response.data

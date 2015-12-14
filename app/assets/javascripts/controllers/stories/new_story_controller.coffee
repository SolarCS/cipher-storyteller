angular.module('storyteller').controller 'NewStoryController', ($scope, Story, StoryResource, StoryTypeResource) ->

  $scope.story = new Story()

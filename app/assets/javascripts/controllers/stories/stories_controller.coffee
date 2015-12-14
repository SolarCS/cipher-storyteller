angular.module('storyteller').controller 'StoriesController', ($scope, StoryResource) ->

  $scope.sortOptions = [
    { field: 'createdAt', direction: 'desc', name: 'Story Created (Newest to Oldest)' }
    { field: 'createdAt', direction: 'asc', name: 'Story Created (Oldest to Newest)' }
    { field: 'votes.length', direction: 'desc', name: 'Number of Votes (Highest to Lowest)' }
    { field: 'votes.length', direction: 'asc', name: 'Number of Votes (Lowest to Highest)' }
  ]

  new StoryResource().list().then (response) ->
    $scope.stories = response.data
    $scope.sortBy = $scope.sortOptions[0]

  $scope.$watch 'sortBy', (sort) ->
    return unless $scope.stories
    sorted = _.sortByOrder $scope.stories, (story) -> _.get(story, sort.field)
    $scope.stories = if sort.direction == 'desc' then sorted.reverse() else sorted

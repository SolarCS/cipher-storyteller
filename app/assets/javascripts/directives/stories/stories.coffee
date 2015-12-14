angular.module('storyteller').directive 'stories', ->

  replace: true
  restrict: 'E'
  scope: { stories: '=' }
  templateUrl: 'directives/stories/stories.html'

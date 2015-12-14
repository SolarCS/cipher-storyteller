angular.module('storyteller').directive 'story', ->

  replace: true
  restrict: 'E'
  scope: { story: '=' }
  templateUrl: 'directives/stories/story.html'

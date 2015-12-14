angular.module('storyteller').directive 'comments', ->

  replace: true
  restrict: 'E'
  scope: { comments: '=' }
  templateUrl: 'directives/comments/comments.html'

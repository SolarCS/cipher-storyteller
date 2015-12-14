angular.module('storyteller').directive 'comment', ->

  replace: true
  restrict: 'E'
  scope: { comment: '=' }
  templateUrl: 'directives/comments/comment.html'

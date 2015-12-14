angular.module('storyteller').directive 'storyForm', ($state, StoryResource, StoryTypeResource) ->

  replace: true
  restrict: 'E'
  scope: { story: '=' }
  templateUrl: 'directives/stories/story_form.html'
  link: (scope) ->

    new StoryTypeResource().list().then (response) ->
      scope.types = response.data
      scope.story?.typeId ||= _.findWhere(response.data, name: 'Feature')?.id

    scope.submit = ->
      scope.submitAttempted = true
      if scope.storyForm.$valid
        scope.serverError = undefined
        new StoryResource().save(scope.story).then (response) ->
          $state.go('root.stories')
        , (response) ->
          scope.serverError = response.data.error

    scope.delete = ->
      new StoryResource().destroy(scope.story.id).then ->
        $state.go('root.stories')

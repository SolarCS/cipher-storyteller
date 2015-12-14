angular.module('storyteller').service 'Config', ->

  config = {}

  config.env = window.railsEnv || 'development'
  config.apiBasePath = '/api'
  config.preloadTemplates = [
    'directives/stories/stories.html'
    'directives/stories/story.html'
    'directives/stories/story_form.html'
    'directives/votes/vote_button.html'
    'directives/votes/vote_summary.html'
  ]

  config

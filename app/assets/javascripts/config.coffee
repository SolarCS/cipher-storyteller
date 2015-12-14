angular.module('storyteller').service 'Config', ->

  config = {}

  config.env = window.railsEnv || 'development'
  config.apiBasePath = '/api'
  config.preloadTemplates = []

  config

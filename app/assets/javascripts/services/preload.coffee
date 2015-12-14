angular.module('storyteller').service 'Preload', ($http, $templateCache, Config) ->

  init: ->
    # Preload and cache templates
    for templateUrl in Config.preloadTemplates
      $http.get templateUrl, { cache: $templateCache }

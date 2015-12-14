angular.module('storyteller').service 'AuthInterceptor', ($location, $q, $rootScope) ->

  request: (config) ->
    _.tap config, ->
      config.headers.AUTH_TOKEN = $rootScope.currentUser?.authToken

  responseError: (response) ->
    if response.status == 401 && $location.path() != '/sign-in'
      $location.path '/sign-in'
    $q.reject(response)

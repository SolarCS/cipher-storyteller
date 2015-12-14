angular.module('storyteller').service 'LocalStorageUser',
($localStorage, $rootScope, CurrentUser, SessionResource) ->

  init: (onComplete=angular.noop) ->

    # Store/update current user data in local storage
    # any time $rootScope.currentUser is updated
    $rootScope.$watch 'currentUser', (currentUser) ->
      $localStorage.currentUser = currentUser
    , true

    # If a session could not be created from local storage,
    # nullify $rootScope.currentPatientUser and invoke the onComplete callback
    completeWithoutAuthentication = ->
      $rootScope.currentPatientUser = null
      onComplete()

    # Attempt to create user from local storage
    if data = angular.fromJson $localStorage.currentUser
      # If a user object exists in local storage,
      # verify that its auth token is (still) valid
      $rootScope.currentUser = new CurrentUser(data)
      req = new SessionResource().verify().then onComplete, completeWithoutAuthentication
    else
      completeWithoutAuthentication()

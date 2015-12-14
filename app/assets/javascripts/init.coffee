angular.module 'storyteller', [
  'ngMessages'
  'ngStorage'
  'templates'
  'ui.router'
]

.config ($httpProvider, $locationProvider, $stateProvider, $urlRouterProvider) ->


  ##################################################################
  # Inject auth token (if available) before all request
  # and handle unauthorized responses
  ##################################################################

  $httpProvider.interceptors.push 'AuthInterceptor'

  ##################################################################
  # Enable HTML5Mode
  ##################################################################

  $locationProvider.html5Mode(true)

  ##################################################################
  # Set CSRF token on outgoing requests
  ##################################################################

  authToken = angular.element('meta[name="csrf-token"]').attr('content')
  $httpProvider.defaults.headers.common['X-CSRF-TOKEN'] = authToken

  ##################################################################
  # Define app routes / states
  ##################################################################

  $stateProvider

    .state 'root',
      views:
        'header':
          controller: 'HeaderController'
          templateUrl: 'layout/header.html'

    .state 'root.stories',
      url: '/stories'
      pageClass: 'stories'
      views:
        'main@':
          controller: 'StoriesController'
          templateUrl: 'stories/stories.html'

    .state 'root.newStory',
      url: '/stories/new'
      pageClass: 'new-story'
      views:
        'main@':
          controller: 'NewStoryController'
          templateUrl: 'stories/new_story.html'

    .state 'root.editStory',
      url: '/stories/:id/edit'
      pageClass: 'edit-story'
      views:
        'main@':
          controller: 'EditStoryController'
          templateUrl: 'stories/edit_story.html'

    .state 'root.signIn',
      url: '/sign-in'
      pageClass: 'sign-in'
      views:
        'main@':
          controller: 'SignInController'
          templateUrl: 'authentication/sign-in.html'

  $urlRouterProvider.otherwise ($injector, $location) ->
    $state = $injector.get '$state'
    $state.go 'root.stories'

##################################################################
# Initialize the App
##################################################################

.run ($rootScope, Browser, LocalStorageUser, PageClass, Preload, Scroller) ->
  Scroller.toTop()
  Browser.init()
  PageClass.init()
  Preload.init()
  LocalStorageUser.init ->
    $rootScope.appInitialized = true

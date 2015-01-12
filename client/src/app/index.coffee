angular.module "acmeUi", [
  'ngCookies',
  'ngTouch',
  'ngAnimate',
  'ngSanitize',
  'ngResource',
  'ui.router',
  'ui.bootstrap',
  'acmeUi.home.controller',
  'acmeUi.auth.service',
  'acmeUi.auth.login.controller'
  ]
  .run(['$rootScope', '$state', '$stateParams', 'authService'
    ($rootScope, $state, $stateParams, authService) ->
      $rootScope.$state = $state
      $rootScope.$stateParams = $stateParams
      $rootScope.copyrightDate = new Date()
      getTokenData = ->
        defaultCsrfTokenHeader = 'X-CSRF-TOKEN'
        csrfTokenHeaderName = 'X-CSRF-HEADER'
        xhr = new XMLHttpRequest()
        xhr.open('head', '/', false)
        xhr.send()
        csrfTokenHeader = xhr.getResponseHeader(csrfTokenHeaderName)
        csrfTokenHeader =  if csrfTokenHeader then csrfTokenHeader else defaultCsrfTokenHeader
        {
          headerName: csrfTokenHeader,
          token: xhr.getResponseHeader(csrfTokenHeader)
        }
      #set the token on startup.
      $rootScope.csrfTokenData = getTokenData()
      $rootScope.userData = authService.getUser()
    ])
  .config ($stateProvider, $urlRouterProvider, $httpProvider) ->
    $urlRouterProvider
      .when('/', '/home')
      .otherwise '/'

    #On startup we need to find out the CSRF token and set up our http calls to include it.  Subsequent calls will
    #store it on the root scope so that if it changes we have a fresh copy.
    defaultCsrfTokenHeader = 'X-CSRF-TOKEN'
    csrfTokenHeader = 'X-CSRF-TOKEN'
    csrfTokenHeaderName = 'X-CSRF-HEADER'
    getTokenData = ->
      xhr = new XMLHttpRequest()
      xhr.open('head', '/', false)
      xhr.send()
      csrfTokenHeader = xhr.getResponseHeader(csrfTokenHeaderName)
      csrfTokenHeader =  if csrfTokenHeader then csrfTokenHeader else defaultCsrfTokenHeader
      {
        headerName: csrfTokenHeader,
        token: xhr.getResponseHeader(csrfTokenHeader)
      }
    csrfTokenData = getTokenData()

    $httpProvider.interceptors.push ($q, $injector) ->
      {
        request: (config, $rootScope) ->
          if ($rootScope)
            config.headers[$rootScope.csrfTokenData.headerName] = $rootScope.csrfTokenData.token
          else
            config.headers[csrfTokenData.headerName] = csrfTokenData.token
          return config || $q.when(config)
        response: (response) ->
          #Reset the token data if present on the response
          if(response.headers()[csrfTokenHeader])
            if($rootScope)
              $rootScope.csrfTokenData =
              {
                headerName: csrfTokenHeader,
                token: response.headers()[csrfTokenHeader]
              }
          response
      }



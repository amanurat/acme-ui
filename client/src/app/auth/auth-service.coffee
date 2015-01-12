angular.module 'acmeUi.auth.service', []
  .factory 'authService', ['$http', '$rootScope', ($http, $rootScope) ->

    factory = {}

    factory.getUser = () ->
      $http.get 'api-gateway/user'
      .success (data) ->
        if (data.name)
          $rootScope.authenticated = true
          $rootScope.userProfile = data
        else
          $rootScope.userProfile = null
          $rootScope.authenticated = false
      .error ->
        $rootScope.userProfile = null
        $rootScope.authenticated = false

    return factory
  ]

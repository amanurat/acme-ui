angular.module 'acmeUi.auth.service', []
  .factory 'authService', ['$http', '$rootScope', ($http, $rootScope) ->

    factory = {}

    factory.getUser = () ->
      $http.get 'user'
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

    factory.login = (credentials) ->
      $http.post '/uaa/login', $.param(credentials),
        headers:
          "content-type" : "application/x-www-form-urlencoded"
      .success (data) ->
        getUser()
        if ($rootScope.authenticated)
          console.log("Login succeeded")
          $rootScope.authenticated = true
        else
          console.log("Login failed with redirect")
          $rootScope.authenticated = false
      .error (data) ->
        console.log("Login failed")
        $rootScope.authenticated = false

    return factory
  ]

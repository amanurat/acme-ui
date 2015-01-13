angular.module 'acmeUi.auth.service', []
  .factory 'authService', ['$http', '$rootScope', '$state', ($http, $rootScope, $state) ->

    factory = {}

    factory.getUser = () ->
      $http.get 'uaa/user'
      .success (data) ->
        if (data.email)
          $rootScope.authenticated = true
          $rootScope.userProfile = data
        else
          $rootScope.userProfile = null
          $rootScope.authenticated = false
      .error ->
        $rootScope.userProfile = null
        $rootScope.authenticated = false

    factory.logout = () ->
      $http.post 'logout'
      .success (data) ->
        $rootScope.authenticated = false
        $rootScope.userProfile = null
        $state.go 'home'
      .error ->
        console.log("Logout failed")
        $rootScope.userProfile = null
        $rootScope.authenticated = false
        $state.go 'home'

    return factory
  ]

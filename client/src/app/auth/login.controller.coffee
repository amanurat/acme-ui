angular.module 'acmeUi.auth.login.controller', []
.config [
  '$stateProvider'
  ($stateProvider) ->
    $stateProvider
    .state 'login',
      url: '/login'
      templateUrl: 'app/auth/login.html'
      controller: ['$scope', '$state', 'authService'
        ($scope, $state, authService) ->
          $scope.login = (credentials) ->
            authService.login(credentials)

      ]
]

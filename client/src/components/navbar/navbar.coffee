angular.module "acmeUi.navbar.controller", ['ui.bootstrap']
  .controller "NavbarController", ['$rootScope', '$scope', 'authService', ($rootScope, $scope, authService) ->

    $scope.logout = () ->
      authService.logout()

  ]

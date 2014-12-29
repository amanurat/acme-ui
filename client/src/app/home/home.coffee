angular.module "acmeUi.home.controller", ['ui.bootstrap']
  .config ($stateProvider, $urlRouterProvider) ->
    $stateProvider
      .state "home",
        url: "/",
        templateUrl: "app/home/home.html",
        controller: "HomeController"
  .controller "HomeController", ['$rootScope', '$scope', ($rootScope, $scope) ->
    $rootScope.pageTitle = 'Home'
  ]




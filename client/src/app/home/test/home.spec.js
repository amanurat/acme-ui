'use strict';

describe('HomeController', function() {
  beforeEach(module('acmeUi'));

  var $controller;

  beforeEach(inject(function(_$controller_){
    // The injector unwraps the underscores (_) from around the parameter names when matching
    $controller = _$controller_;
  }));

  describe('$scope.pageTitle', function() {
    var $scope, $rootScope, controller;

    beforeEach(function() {
      $scope = {};
      $rootScope = {};
      controller = $controller('HomeController', { $scope: $scope, $rootScope: $rootScope });
    });

    it('sets the page title to Home', function() {
      expect($rootScope.pageTitle).toEqual('Home');
    });
  });
});

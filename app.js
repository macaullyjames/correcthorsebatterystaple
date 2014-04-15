(function() {
  angular.module('CHBS', ["CHBS.controllers", "CHBS.services"]);

}).call(this);

(function() {
  var module;

  module = angular.module("CHBS.controllers", []);

  module.controller("passwordController", function($scope, PasswordFactory) {
    $scope.refreshPassword = function() {
      return PasswordFactory["new"]().then(function(password) {
        return $scope.password = password;
      });
    };
    return $scope.refreshPassword();
  });

}).call(this);

(function() {
  var module, randomInArray;

  module = angular.module("CHBS.services", []);

  randomInArray = function(array) {
    var index;
    index = Math.floor(Math.random() * array.length - 1);
    return array[index];
  };

  module.factory("PasswordFactory", function($http) {
    return {
      "new": function() {
        return $http.get("assets/wordlist.json", {
          cache: true
        }).then(function(response) {
          var _, _i, _results;
          _results = [];
          for (_ = _i = 1; _i <= 4; _ = ++_i) {
            _results.push(randomInArray(response.data));
          }
          return _results;
        });
      }
    };
  });

}).call(this);

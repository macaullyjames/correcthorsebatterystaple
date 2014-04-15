module = angular.module "CHBS.controllers", []

module
    .controller "passwordController", ($scope, PasswordFactory) ->

        $scope.refreshPassword = ->
            PasswordFactory.new()
                .then (password) -> $scope.password = password

        do $scope.refreshPassword

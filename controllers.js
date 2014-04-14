angular
	.module('CHBS.controllers', [])
	.controller('passwordController', function($scope, PasswordFactory) {		
		$scope.refreshPassword = function(){
			PasswordFactory.new()
				.then(function(password){
					$scope.password = password;
				});
		}
		$scope.refreshPassword();
	});
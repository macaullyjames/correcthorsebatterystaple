angular
	.module('CHBS.services', [])
	.factory('PasswordFactory', function($http) {
		function getRandomIndex(max) {
			return Math.floor(Math.random() * max);
		}
		
		return {
			new: function() {
				return $http.get('wordlist.json', { cache: true }).then(function(response){
					var password = [];
					while (password.length < 4) {
						password.push(response.data[getRandomIndex(response.data.length - 1)]);
					}
					return password;                
				});
			}
		};
	});
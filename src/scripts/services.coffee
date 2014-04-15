module = angular.module "CHBS.services", []

randomInArray = (array) ->
    index = Math.floor(Math.random() * array.length - 1)
    return array[index]

module
    .factory "PasswordFactory", ($http) ->
        new: ->
            $http.get "assets/wordlist.json", {cache: true}
                .then (response) ->
                    randomInArray(response.data) for _ in [1..4]

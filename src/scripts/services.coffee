module = angular.module "CHBS.services", []

`
/**
 * Generate a uniformly distributed random integer using
 * the crypto API. It will be a number in the range starting
 * with lower and up to (but without) upper.
 *
 * @param {number} lower The lower bound of the range of numbers.
 * @param {number} upper The upper bound of the range of numbers (not included).
 */
this.getUniformRandomInteger = function(lower, upper) {
    lower = Math.round(lower);
    upper = Math.round(upper);

    var difference = upper - lower;

    if (difference <= 0) {
        throw Error("The upper bound is not greater than the lower bound.");
    }

    // get a cryptoObject to access the Crypto-API
    var cryptoObject = window.crypto || window.msCrypto;

    if ((!cryptoObject) || (typeof cryptoObject.getRandomValues !== "function") || (!Uint32Array)) {
        var message = "Your browser has no secure source of random numbers.";
        alert(message)
        throw Error(message);
    }

    var maxUint32 = Math.pow(2, 32) - 1;
    var maxRandomNumber = Math.floor(maxUint32 / difference) * difference;
    var randomArray = new Uint32Array(1);

    /*
     * Generate random numbers until they are smaller than
     * maxRandomNumber. This is necessary because if the
     * number is bigger than maxRandomNumber, the modulo
     * operator will introduce a bias.
     */
    do {
        cryptoObject.getRandomValues(randomArray);
    } while (randomArray[0] > maxRandomNumber);

    return lower + (randomArray[0] % difference);
}
`

randomInArray = (array) ->
    index = getUniformRandomInteger(0, array.length)
    return array[index]

module
    .factory "PasswordFactory", ($http) ->
        new: ->
            $http.get "assets/wordlist.json", {cache: true}
                .then (response) ->
                    randomInArray(response.data) for _ in [1..4]

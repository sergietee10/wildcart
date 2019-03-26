'use strict';

moduleRegister.controller('registerController', ['$scope', '$http', 'sessionService',
    function ($scope, $http, sessionService) {
        $scope.text = 'me@example.com';
        $scope.emailFormat = /^[a-z]+[a-z0-9._]+@[a-z]+\.[a-z.]{2,5}$/;
        $scope.userFormat = /^[a-zA-Z0-9]{3,15}$/;
        $scope.passFormat = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{7,}$/;

        $scope.guardar = function () {
            var json = {
                login: $scope.ajaxDatoRegistroUsuario.login,
                password: $scope.ajaxDatoRegistroUsuario.password,
                email: $scope.ajaxDatoRegistroUsuario.email
            };
            $http({
                method: 'GET',
                withCredentials: true,
                url: '/json?ob=usuario&op=register',
                params: {json: JSON.stringify(json)}
            }).then(function (response) {
                $scope.status = response.status;
                $scope.mensaje = true;
            }, function (response) {
                $scope.ajaxDatoRegistroUsuario = response.data.message || 'Request failed';
                $scope.status = response.status;
            });
        };

        


    }]);
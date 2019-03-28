'use strict';

moduleRegister.controller('registerController', ['$scope', '$http', 'sessionService',
    function ($scope, $http, sessionService) {
        $scope.text = 'me@example.com';
        $scope.emailFormat = /^[a-z]+[a-z0-9._]+@[a-z]+\.[a-z.]{2,5}$/;
        $scope.userFormat = /^[a-zA-Z0-9]{3,15}$/;
        $scope.passFormat = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{7,}$/;
        $scope.mensaje = false;
        $scope.mensajeError = false;
        $scope.mensajeError2 = false;

        $scope.guardar = function () {
            var json = {
                login: $scope.ajaxDatoRegistroUsuario.login,
                pass: $scope.ajaxDatoRegistroUsuario.pass,
                email: $scope.ajaxDatoRegistroUsuario.email
            };
            $http({
                method: 'GET',
                withCredentials: true,
                url: '/json?ob=usuario&op=register',
                params: {json: JSON.stringify(json)}
            }).then(function (response) {
                $scope.status = response.status;
                $scope.ajaxDatoRegistroUsuario = response.data.message;
                if (response.status === 200) {
                    if (response.data.status === 400) {
                        $scope.mensajeError = true;
                        $('#login').val('');
                        $('#pass').val('');
                        $('#email').val('');
                    }
                    if (response.data.status === 401) {
                        $scope.mensajeError2 = true;
                        $scope.mensajeError = false;
                        $('#login').val('');
                        $('#password').val('');
                        $('#email').val('');
                    } 
                }else {
                        $scope.mensaje = true;
                        $scope.mensajeError = false;
                        $scope.mensajeError2 = false;
                    }
            }, function (response) {
                $scope.mensajeError = true;
                $scope.ajaxDatoRegistroUsuario = response.data.message || 'Request failed';
                $scope.status = response.status;
            });
        };
    }]);

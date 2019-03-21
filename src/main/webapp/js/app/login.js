'use strict';

moduleLogin.controller('loginController', ['$scope', '$http', 'sessionService', '$location',
    function ($scope, $http, sessionService, $location) {
        $scope.mensajeError = false;
        $scope.mensaje = false;
        $scope.validar = function () {
            $scope.ob = "usuario";
            $http({
                method: 'GET',
                url: 'json?ob=' + $scope.ob + '&op=login&user=' + $scope.login + '&pass=' + forge_sha256($scope.password)
            }).then(function (response) {
                $scope.status = response.status;
                $scope.ajaxDataUsuarios = response.data.message;
                if (response.status === 200) {
                    if (response.data.status === 401) {
                        $scope.mensaje = false;
                        $scope.mensajeError = true;
                        $('#login').val('');
                        $('#password').val('');
                    } else {
                        $scope.mensajeError = false;
                        sessionService.setSessionActive();
                        sessionService.setUserName(response.data.message.nombre + ' ' + response.data.message.ape1);
                        sessionService.setUserId(response.data.message.id);
                        $scope.idUsuariologeado= sessionService.getUserId();
                        $scope.usuariologeado = sessionService.getUserName();
                        sessionService.setTipoUserId(response.data.message.obj_tipoUsuario.id);
                        $scope.mensaje = true;
                        $location.url('/home');
                    }
                }
            }, function (response) {
                $scope.mensajeError = true;
                $scope.ajaxDataUsuarios = response.data.message || 'Request failed';
                $scope.status = response.status;
            });

        }
    }]);
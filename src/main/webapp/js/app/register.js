'use strict';

moduleRegister.controller('registerController', ['$scope', '$http', 'sessionService',
    function ($scope, $http, sessionService) {
        $scope.text = 'me@example.com';
        $scope.emailFormat = /^[a-z]+[a-z0-9._]+@[a-z]+\.[a-z.]{2,5}$/;
        $scope.userFormat = /^[a-zA-Z0-9]{3,25}$/;
        $scope.passFormat = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{7,}$/;
        $scope.mensaje = false;
        $scope.mensajeError = false;

        $scope.guardar = function () {
            var json = {
                login: $scope.ajaxDatoRegistroUsuario.login,
                pass: forge_sha256($scope.ajaxDatoRegistroUsuario.pass),
                email: $scope.ajaxDatoRegistroUsuario.email
            };
            $http({
                method: 'GET',
                withCredentials: true,
                url: '/json?ob=usuario&op=register',
                params: {json: JSON.stringify(json)}
            }).then(function (response) {
                $scope.status = response.status;
                $scope.mensajeDelServidor = response.data.message;
                if (response.status === 200) {
                    $scope.mensajeDelServidor = response.data.message;
                    $scope.mensaje = true;
                    $scope.mensajeError = false;
                    if (response.data.status === 400) {
                        $scope.mensajeDelServidor = response.data.message;
                        $scope.mensajeError = true;
                        $scope.mensaje = false;
                    }
                    if (response.data.status === 401) {
                        $scope.mensajeDelServidor = response.data.message;
                        $scope.mensajeError = true;
                        $scope.mensaje = false;
                    }
                }else {
                    $scope.mensajeDelServidor = response.data.message;
                    }
                    
            }, function (response) {
                $scope.ajaxDatoRegistroUsuario = response.data.message || 'Request failed';
                $scope.status = response.status;
            });
        };
    }]);

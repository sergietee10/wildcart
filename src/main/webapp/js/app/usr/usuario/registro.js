'use strict';

moduleRegisterUser.controller('registerUserControllerUsr', ['$scope', '$http', 'sessionService',
    function ($scope, $http, sessionService) {
        $scope.idC = $routeParams.id;
        $http({
            method: 'GET',
            url: '/json?ob=usuario&op=get&id=' + $scope.idC
        }).then(function (response) {
            $scope.status = response.status;
            $scope.ajaxDataRegistroUsuario = response.data.message;
        }, function (response) {
            $scope.ajaxDataRegistroUsuario = response.data.message || 'Request failed';
            $scope.status = response.status;
        });
        if (sessionService) {
            $scope.usuariologeado = sessionService.getUserName();
            $scope.idUsuariologeado = sessionService.getUserId();
            $scope.ocultar = true;
        }
        
        $scope.mensaje = false;
        $scope.mensajeError = false;

        $scope.guardar = function () {
            var json = {
                nombre: $scope.ajaxDataRegistroUsuario.nombre,
                ape1: $scope.ajaxDataRegistroUsuario.ape1,
                ape2: $scope.ajaxDataRegistroUsuario.ape2,
                dni: $scope.ajaxDataRegistroUsuario.dni
            };
            $http({
                method: 'GET',
                withCredentials: true,
                url: '/json?ob=usuario&op=update',
                params: {json: JSON.stringify(json)}
            }).then(function (response) {
                $scope.status = response.status;
                $scope.mensaje = true;
            }, function (response) {
                $scope.ajaxDataRegistroUsuario = response.data.message || 'Request failed';
                $scope.status = response.status;
            });
        };
        $scope.tipoUsuarioRefresh = function () {
            $scope.tipousuario = false;
            $http({
                method: 'GET',
                url: 'json?ob=tipousuario&op=get&id=' + $scope.ajaxDatoUsuario.obj_tipoUsuario.id
            }).then(function (response) {
                $scope.ajaxDatoUsuario.obj_tipoUsuario = response.data.message;
                if ($scope.ajaxDatoUsuario.obj_tipoUsuario === null || $scope.ajaxDatoUsuario.obj_tipoUsuario === "") {
                    $scope.tipousuario = true;
                }
            }, function (response) {
                $scope.tipousuario = true;
                $scope.ajaxDatoUsuario = response.data.message || 'Request failed';
                $scope.status = response.status;
            });
        };

    }]);
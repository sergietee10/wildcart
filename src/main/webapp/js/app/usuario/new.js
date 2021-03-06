'use strict';

moduleUsuario.controller('usuarioNewControllerAdm', ['$scope', '$http', '$routeParams', 'sessionService',
    function ($scope, $http, $routeParams, sessionService) {
        $scope.idC = $routeParams.id;
        $scope.text = 'me@example.com';
        $scope.emailFormat = /^[a-z]+[a-z0-9._]+@[a-z]+\.[a-z.]{2,5}$/;
        $scope.userFormat = /^[a-zA-Z0-9]{3,25}$/;
        $scope.passFormat = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{7,}$/;
        
       
        if (sessionService) {
            $scope.usuariologeado = sessionService.getUserName();
            $scope.idUsuariologeado = sessionService.getUserId();
            $scope.ocultar = true;
        }

        $scope.guardar = function () {
            var json = {
                id: $scope.ajaxDatoUsuario.id,
                dni: $scope.ajaxDatoUsuario.dni,
                nombre: $scope.ajaxDatoUsuario.nombre,
                ape1: $scope.ajaxDatoUsuario.ape1,
                ape2: $scope.ajaxDatoUsuario.ape2,
                login: $scope.ajaxDatoUsuario.login,
                pass: forge_sha256($scope.ajaxDatoUsuario.pass),
                email: $scope.ajaxDatoUsuario.email,
                id_tipoUsuario: $scope.ajaxDatoUsuario.obj_tipoUsuario.id
            };
            $http({
                method: 'GET',
                withCredentials: true,
                url: '/json?ob=usuario&op=create',
                params: {json: JSON.stringify(json)}
            }).then(function (response) {
                $scope.status = response.status;
                $scope.mensaje = true;
            }, function (response) {
                $scope.ajaxDatoUsuario = response.data.message || 'Request failed';
                $scope.status = response.status;
            });
        };
        $scope.logout = function () {
            $http({
                method: 'GET',
                url: '/json?ob=usuario&op=logout'
            }).then(function (response) {
                if (response.status === 200) {
                    sessionService.setSessionInactive();
                    sessionService.setUserName("");
                }
            });
        };    
    
        $scope.save = function () {
            $http({
                method: 'GET',
                url: 'json?ob=tipousuario&op=update&id=2',
                data: {json: JSON.stringify($scope.obj)}
            }).then(function (response) {
                $scope.status = response.status;
                $scope.ajaxData = response.data.message;
            }, function (response) {
                $scope.ajaxData = response.data.message || 'Request failed';
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
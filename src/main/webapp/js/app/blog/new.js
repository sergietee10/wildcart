'use strict';
moduleBlog.controller('blogNewControllerAdm', ['$scope', '$http', '$routeParams', 'sessionService',
    function ($scope, $http, $routeParams, sessionService) {
        $scope.idC = $routeParams.id;

        if (sessionService) {
            $scope.usuariologeado = sessionService.getUserName();
            $scope.idUsuariologeado = sessionService.getUserId();
            $scope.ocultar = true;
        }

        $scope.guardar = function () {
            var json = {
                id: $scope.ajaxDatoBlog.id,
                titulo: $scope.ajaxDatoBlog.titulo,
                contenido: $scope.ajaxDatoBlog.contenido,
                etiquetas: $scope.ajaxDatoBlog.etiquetas,
                fecha: $scope.myDate,
                id_usuario: $scope.ajaxDatoBlog.obj_Usuario.id                
            };
            $http({
                method: 'GET',
                withCredentials: true,
                url: '/json?ob=blog&op=create',
                params: {json: JSON.stringify(json)}
            }).then(function (response) {
                $scope.status = response.status;
                $scope.mensaje = true;
            }, function (response) {
                $scope.ajaxDatoBlog = response.data.message || 'Request failed';
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
        $scope.usuarioRefresh = function () {
            $http({
                method: 'GET',
                url: 'json?ob=usuario&op=get&id=' + $scope.data.obj_tipoUsuario.id
            }).then(function (response) {
                $scope.data.obj_tipoUsuario = response.data.message;
            }, function (response) {
                $scope.data = response.data.message || 'Request failed';
                $scope.status = response.status;
            });
        };
        $scope.plist = function () {
            $location.path('/blog/plist');
        };
        
        $scope.myDate = new Date();

        $scope.minDate = new Date(
                $scope.myDate.getFullYear(),
                $scope.myDate.getMonth() - 2,
                $scope.myDate.getDate());

        $scope.maxDate = new Date(
                $scope.myDate.getFullYear(),
                $scope.myDate.getMonth() + 2,
                $scope.myDate.getDate());
                
    }]);
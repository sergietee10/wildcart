'use strict';
moduleBlog.controller('blogEditControllerAdm', ['$scope', '$http', '$routeParams', 'sessionService',
    function ($scope, $http, $routeParams, sessionService) {
        $scope.idC = $routeParams.id;
        $http({
            method: 'GET',
            url: '/json?ob=blog&op=get&id=' + $scope.idC
        }).then(function (response) {
            $scope.status = response.status;
            $scope.ajaxDatoBlog = response.data.message;
            $scope.ajaxDatoBlogFecha = response.data.message.fecha;
            $scope.resultado = $scope.ajaxDatoBlogFecha.slice(0, 3);

            switch ($scope.resultado) {
                case "ene":
                    $scope.fecha = $scope.ajaxDatoBlogFecha.replace("ene", "jan");
                    break;
                case "abr":
                    $scope.fecha = $scope.ajaxDatoBlogFecha.replace("abr", "apr");
                    break;
                case "ago":
                    $scope.fecha = $scope.ajaxDatoBlogFecha.replace("ago", "aug");
                    break;
                case "dic":
                    $scope.fecha = $scope.ajaxDatoBlogFecha.replace("dic", "dec");
                    break;
                default:
                    $scope.fecha = $scope.ajaxDatoBlogFecha;
                    break;
            }
            $scope.dt = new Date($scope.fecha);
        }, function (response) {
            $scope.ajaxDatoBlog = response.data.message || 'Request failed';
            $scope.status = response.status;
        });

        $scope.guardar = function () {
            var json = {
                id: $scope.ajaxDatoBlog.id,
                titulo: $scope.ajaxDatoBlog.titulo,
                contenido: $scope.ajaxDatoBlog.contenido,
                etiquetas: $scope.ajaxDatoBlog.etiquetas,
                id_usuario:$scope.ajaxDatoBlog.obj_Usuario.id,
                fecha: $scope.dt
            };
            $http({
                method: 'GET',
                withCredentials: true,
                url: '/json?ob=blog&op=update',
                params: {json: JSON.stringify(json)}
            }).then(function (response) {
                $scope.status = response.status;
                $scope.mensaje = true;
            }, function (response) {
                $scope.ajaxDatoBlog = response.data.message || 'Request failed';
                $scope.status = response.status;
            });
        };

        $scope.save = function () {
            $http({
                method: 'GET',
                url: 'json?ob=usuario&op=update&id=2',
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
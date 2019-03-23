'use strict'

moduleProducto.controller('productoViewControllerAdm', ['$scope', '$http', 'toolService', '$routeParams', 'sessionService',
    function ($scope, $http, toolService, $routeParams, sessionService) {
        if (sessionService.getTipoUserId() === 1) {
            $scope.isAdmin = true;
        } else {
            $scope.isAdmin = false;
        }
        $http({
            method: 'GET',
            withCredentials: true,
            url: 'json?ob=producto&op=get&id=' + $routeParams.id
        }).then(function (response) {
            $scope.status = response.status;
            $scope.ajaxDataProducto = response.data.message;
        }, function (response) {
            $scope.ajaxDataProducto = response.data.message || 'Request failed';
            $scope.status = response.status;
        });
        $scope.logout = function () {
            $http({
                method: 'GET',
                url: '/json?ob=usuario&op=logout'
            }).then(function (response) {
                if (response.status === 200) {
                    sessionService.setSessionInactive();
                    sessionService.setUserName("");
                }
            })
        }
        if (sessionService) {
            $scope.usuariologeado = sessionService.getUserName();
            $scope.idUsuariologeado = sessionService.getUserId();
            $scope.ocultar = true;
        }
        $scope.isActive = toolService.isActive;

    }]);
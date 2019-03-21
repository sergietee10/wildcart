'use strict'

moduleFactura.controller('facturaViewControllerUsr', ['$scope', 'toolService', '$http', 'sessionService', '$routeParams', '$location',
    function ($scope, toolService, $http, sessionService, $routeParams, $location) {
        $scope.id = $routeParams.id;
        $scope.totalPages = 1;
        $scope.isAdmin = false;
        $scope.isUser = false;

        if (sessionService.getTipoUserId() === 1) {
            $scope.isAdmin = true;
        } else {
            $scope.isUser = true;
        }
        if (!$routeParams.order) {
            $scope.orderURLServidor = "";
            $scope.orderURLCliente = "";
        } else {
            $scope.orderURLServidor = "&order=" + $routeParams.order;
            $scope.orderURLCliente = $routeParams.order;
        }

        if (!$routeParams.rpp) {
            $scope.rpp = '10';
        } else {
            $scope.rpp = $routeParams.rpp;
        }

        if (!$routeParams.page) {
            $scope.page = 1;
        } else {
            if ($routeParams.page >= 1) {
                $scope.page = $routeParams.page;
            } else {
                $scope.page = 1;
            }
        }
        $scope.resetOrder = function () {
            $location.url(`usr/factura/plistlinea/` + $scope.rpp + `/` + $scope.page);
        };


        $scope.ordena = function (order, align) {
            if ($scope.orderURLServidor == "") {
                $scope.orderURLServidor = "&order=" + order + "," + align;
                $scope.orderURLCliente = order + "," + align;
            } else {
                $scope.orderURLServidor = $scope.orderURLServidor + "-" + order + "," + align;
                $scope.orderURLCliente = $scope.orderURLCliente + "-" + order + "," + align;
            }
            $location.url(`factura/plist/` + $scope.rpp + `/` + $scope.page + `/` + $scope.orderURLCliente);
        };

        $http({
            method: 'GET',
            url: '/json?ob=linea&op=getcountxlinea&id=' + $routeParams.id
        }).then(function (response) {
            $scope.status = response.status;
            $scope.ajaxDatoLineaFactura = response.data.message;
            $scope.totalPages = Math.ceil($scope.ajaxDatoLineaFactura / $scope.rpp);
            if ($scope.page > $scope.totalPages) {
                $scope.page = $scope.totalPages;
                $scope.update();
            }
            pagination2();
        }, function (response) {
            $scope.ajaxDatoLineaFactura = response.data.message || 'Request failed';
            $scope.status = response.status;
        });

        $http({
            method: 'GET',
            url: '/json?ob=linea&op=getlineafactura&rpp=' + $scope.rpp + '&page=' + $scope.page + '&id=' + $routeParams.id + $scope.orderURLServidor
        }).then(function (response) {
            $scope.status = response.status;
            $scope.ajaxDatoLineaFactura = response.data.message;

        }, function (response) {
            $scope.status = response.status;
            $scope.ajaxDatoLineaFactura = response.data.message || 'Request failed';
        });


        $scope.update = function () {
            $location.url(`factura/plistlinea/` + $scope.id + `/` + $scope.rpp + `/` + $scope.page + '/' + $scope.orderURLCliente);
        };

        function pagination2() {
            $scope.list2 = [];
            $scope.neighborhood = 1;
            for (var i = 1; i <= $scope.totalPages; i++) {
                if (i === $scope.page) {
                    $scope.list2.push(i);
                } else if (i <= $scope.page && i >= ($scope.page - $scope.neighborhood)) {
                    $scope.list2.push(i);
                } else if (i >= $scope.page && i <= ($scope.page - -$scope.neighborhood)) {
                    $scope.list2.push(i);
                } else if (i === ($scope.page - $scope.neighborhood) - 1) {
                    if ($scope.page >= 4) {
                        $scope.list2.push("...");
                    }
                } else if (i === ($scope.page - -$scope.neighborhood) + 1) {
                    if ($scope.page <= $scope.totalPages - 3) {
                        $scope.list2.push("...");
                    }
                }
            }
        }
        ;


        $scope.isActive = toolService.isActive;



    }
]);
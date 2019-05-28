'use strict';

moduleProducto.controller('productoEditControllerAdm', ['$scope', '$http', '$routeParams', 'sessionService',
    function ($scope, $http, $routeParams, sessionService, ) {
        $scope.id = $routeParams.id;

        $http({
            method: 'GET',
            url: '/json?ob=producto&op=get&id=' + $routeParams.id
        }).then(function (response) {
            $scope.status = response.status;
            $scope.ajaxDatoProducto = response.data.message;
        }, function (response) {
            $scope.ajaxDatoProducto = response.data.message || 'Request failed';
            $scope.status = response.status;
        });

        if (sessionService) {
            $scope.usuariologeado = sessionService.getUserName();
            $scope.idUsuariologeado = sessionService.getUserId();
            $scope.ocultar = true;
        }

        $scope.guardar = function () {
            var nombreFoto;
            console.log($scope.foto);
            if ($scope.foto !== undefined) {
                nombreFoto = $scope.foto.name;
                $scope.uploadFile(nombreFoto);
            } else {
                if ($scope.ajaxDatoProducto.foto != '' || $scope.ajaxDatoProducto.foto != null) {
                    nombreFoto = $scope.ajaxDatoProducto.foto;
                } else {
                    nombreFoto = "default.jpg";
                }
            }
            var json = {
                id: $scope.ajaxDatoProducto.id,
                codigo: $scope.ajaxDatoProducto.codigo,
                desc: $scope.ajaxDatoProducto.desc,
                existencias: $scope.ajaxDatoProducto.existencias,
                foto: nombreFoto,
                precio: $scope.ajaxDatoProducto.precio,
                id_tipoProducto: $scope.ajaxDatoProducto.obj_tipoProducto.id
            };
            $http({
                method: 'GET',
                withCredentials: true,
                url: '/json?ob=producto&op=update',
                params: { json: JSON.stringify(json) }
            }).then(function (response) {
                $scope.status = response.status;
                $scope.mensaje = true;
            }, function (response) {
                $scope.mensajeError = true;
                $scope.ajaxDatoProducto = response.data.message || 'Request failed';
                $scope.status = response.status;
            });
        };
        
        $scope.tipoProductoRefresh = function () {
            $scope.tipoproducto = false;
            $http({
                method: 'GET',
                url: 'json?ob=tipoproducto&op=get&id=' + $scope.ajaxDatoProducto.obj_tipoProducto.id
            }).then(function (response) {
                $scope.ajaxDatoProducto.obj_tipoProducto = response.data.message;
                if ($scope.ajaxDatoProducto.obj_tipoProducto === null || $scope.ajaxDatoProducto.obj_tipoProducto === "") {
                    $scope.tipoproducto = true;
                }
            }, function (response) {
                $scope.tipoproducto = true;
                $scope.ajaxDatoProducto = response.data.message || 'Request failed';
                $scope.status = response.status;
            });
        };
        $scope.uploadFile = function (nombreFoto) {
            var file = $scope.foto;
            file = new File([file], nombreFoto, { type: file.type });
            console.log(file)
            var oFormData = new FormData();
            oFormData.append('file', file);
            $http({
                headers: { 'Content-Type': undefined },
                method: 'POST',
                data: oFormData,
                url: `json?ob=producto&op=loadimage`
            })
        };
    }]).directive('fileModel', ['$parse', function ($parse) {
        return {
            restrict: 'A',
            link: function (scope, element, attrs) {
                var model = $parse(attrs.fileModel);
                var modelSetter = model.assign;
    
                element.bind('change', function () {
                    scope.$apply(function () {
                        modelSetter(scope, element[0].files[0]);
                    });
                });
            }
        }
    }]);
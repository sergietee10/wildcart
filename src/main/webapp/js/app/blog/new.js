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
            $scope.uploadFile();
            var nombreFoto;
            if ($scope.myFile === undefined) {
                nombreFoto = "default.jpg";
            } else {
                nombreFoto = $scope.myFile.name
            }
            var json = {
                id: $scope.ajaxDatoBlog.id,
                foto: nombreFoto,
                titulo: $scope.ajaxDatoBlog.titulo,
                contenido: $scope.ajaxDatoBlog.contenido,
                etiquetas: $scope.ajaxDatoBlog.etiquetas,
                fecha: $scope.myDate,
                id_usuario: $scope.idUsuariologeado
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
                //detectar error

                $scope.status = response.status;
                $scope.ajaxData = response.data.message;
            }, function (response) {
                $scope.ajaxData = response.data.message || 'Request failed';
                $scope.status = response.status;
            });
        };

        (function ($) {
            $.fn.checkFileType = function (options) {
                var defaults = {
                    allowedExtensions: [],
                    success: function () {},
                    error: function () {}
                };
                options = $.extend(defaults, options);

                return this.each(function () {

                    $(this).on('change', function () {
                        var value = $(this).val(),
                                file = value.toLowerCase(),
                                extension = file.substring(file.lastIndexOf('.') + 1);

                        if ($.inArray(extension, options.allowedExtensions) == -1) {
                            options.error();
                            $(this).focus();
                        } else {
                            options.success();

                        }

                    });

                });
            };

        })(jQuery);

        $(function () {
            $('#image').checkFileType({
                allowedExtensions: ['jpg', 'jpeg', 'png'],
                success: function () {
                    alert('Has seleccionado una foto.');
                },
                error: function () {
                    alert('NO TIENES NINGUNA FOTO SELECCIONADA.');
                }
            });

        });


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


        $scope.uploadFile = function () {
            var file;
            file = $scope.myFile;

            var oFormData = new FormData();
            oFormData.append('file', file);
            $http({
                headers: {'Content-Type': undefined},
                method: 'POST',
                data: oFormData,
                url: `json?ob=blog&op=loadimage`
            }).then(function (response) {
                console.log(response);
            }, function (response) {
                console.log(response);
            });
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
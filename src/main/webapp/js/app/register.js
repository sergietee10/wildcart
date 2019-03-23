'use strict';

moduleRegister.controller('registerController', ['$scope', '$http', 'sessionService',
    function ($scope, $http, sessionService) {
        $scope.text = 'me@example.com';
        $scope.emailFormat = /^[a-z]+[a-z0-9._]+@[a-z]+\.[a-z.]{2,5}$/;
        $scope.userFormat = /^[a-zA-Z0-9]{3,15}$/;
        $scope.passFormat = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{7,}$/;

        $scope.guardar = function () {
            var json = {
                login: $scope.ajaxDatoRegistroUsuario.login,
                password: $scope.ajaxDatoRegistroUsuario.password,
                email: $scope.ajaxDatoRegistroUsuario.email
            };
            $http({
                method: 'GET',
                withCredentials: true,
                url: '/json?ob=usuario&op=register',
                params: {json: JSON.stringify(json)}
            }).then(function (response) {
                $scope.status = response.status;
                $scope.mensaje = true;
            }, function (response) {
                $scope.ajaxDatoRegistroUsuario = response.data.message || 'Request failed';
                $scope.status = response.status;
            });
        };

        $(document).ready(function () {
            // check change event of the text field
            $("#login").keyup(function () {
                // get text username text field value
                var username = $("#login").val();

                // check username name only if length is greater than or equal to 3
                if (username.length >= 3)
                {
                    
                    $("#status").html('Comprobando disponiblidad...');
                    // check username
                    $("username_check.php", {username: username}, function (data, status) {
                        $("#status").html(data);
                    });
                }
            });
        });
        
        $(document).ready(function () {
            // check change event of the text field
            $("#dni").keyup(function () {
                // get text username text field value
                var email = $("#dni").val();

                // check username name only if length is greater than or equal to 3
                if (email.length >= 3)
                {
                    $("#status2").html('Comprobando disponiblidad...');
                    // check username
                    $("email_check.php", {email: email}, function (data, status) {
                        $("#status2").html(data);
                    });
                }
            });
        });


    }]);
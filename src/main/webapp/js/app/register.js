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

//        $scope.checkMailStatus = function () {
//            var email = $("#email").val();
//            $.ajax({
//                type: 'post',
//                url: 'checkMail.php',
//                data: {email: email},
//                success: function (msg) {
//                    alert(msg); 
//                }
//            });
//        }


//       $scope.checkname = function()
//        {
//            var login = document.getElementById("login").value;
//
//            if (login)
//            {
//                $.ajax({
//                    type: 'post',
//                    url: 'checkdata.php',
//                    data: {
//                        login: login,
//                    },
//                    success: function (response) {
//                        $('#status').html(response);
//                        if (response == "OK")
//                        {
//                            return true;
//                        } else
//                        {
//                            return false;
//                        }
//                    }
//                });
//            } else
//            {
//                $('#status').html("");
//                return false;
//            }
//        }

//        $scope.checkemail = function()
//        {
//            var email = document.getElementById("UserEmail").value;
//
//            if (email)
//            {
//                $.ajax({
//                    type: 'post',
//                    url: 'checkdata.php',
//                    data: {
//                        user_email: email,
//                    },
//                    success: function (response) {
//                        $('#email_status').html(response);
//                        if (response == "OK")
//                        {
//                            return true;
//                        } else
//                        {
//                            return false;
//                        }
//                    }
//                });
//            } else
//            {
//                $('#email_status').html("");
//                return false;
//            }
//        }
//
//        function checkall()
//        {
//            var namehtml = document.getElementById("name_status").innerHTML;
//            var emailhtml = document.getElementById("email_status").innerHTML;
//
//            if ((namehtml && emailhtml) == "OK")
//            {
//                return true;
//            } else
//            {
//                return false;
//            }
//        }
//



    }]);

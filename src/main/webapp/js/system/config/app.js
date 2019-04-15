'use strict'

var trolleyes = angular.module('MyApp', [
    'ngRoute',
    'services',
    'commonControllers',
    'tipousuarioControllers',
    'usuarioControllers',
    'tipoproductoControllers',
    'facturaControllers',
    'blogControllers',
    'productoControllers',
    'loginControllers',
    'registerControllers',
    'lineaControllers',
    'carritoControllers',
    'moduleComponent',
    'ngMaterial',
    'Directives'

]).config(function ($mdDateLocaleProvider) {
    $mdDateLocaleProvider.months = ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio',
        'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'];
    $mdDateLocaleProvider.shortMonths = ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun',
        'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'];
    $mdDateLocaleProvider.days = ['Domingo', 'Lunes', 'Martes', 'Miercoles', 'Jueves', 'Viernes', 'Sábado'];
    $mdDateLocaleProvider.shortDays = ['Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sá'];
    $mdDateLocaleProvider.firstDayOfWeek = 1;
    $mdDateLocaleProvider.weekNumberFormatter = function (weekNumber) {
        return 'Semana ' + weekNumber;
    };
    $mdDateLocaleProvider.msgCalendar = 'Calendario';
    $mdDateLocaleProvider.msgOpenCalendar = 'Abrir calendario';
    $mdDateLocaleProvider.formatDate = function (date) {
        return moment(date).format('DD-MM-YYYY');
    };
});

var moduleCommon = angular.module('commonControllers', []);
var moduleService = angular.module('services', []);
var moduleTipousuario = angular.module('tipousuarioControllers', []);
var moduleUsuario = angular.module('usuarioControllers', []);
var moduleProducto = angular.module('productoControllers', []);
var moduleFactura = angular.module('facturaControllers', []);
var moduleBlog = angular.module('blogControllers', []);
var moduleTipoproducto = angular.module('tipoproductoControllers', []);
var moduleLogin = angular.module('loginControllers', []);
var moduleRegister= angular.module('registerControllers', []);
var moduleCarrito = angular.module('carritoControllers', []);
var moduleLinea = angular.module('lineaControllers', []);
var moduleComponent = angular.module('moduleComponent', []);


var moduloDirectivas = angular.module('Directives', []);
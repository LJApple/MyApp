angular.module('tmsApp',['ngRoute'])
.config(['$routeProvider',function($routeProvider){
	$routeProvider.when('/login',{
		templateUrl:'/app/login/index.html',
		controller:'LoginCtrl'
	}).when('/register',{
		templateUrl:'/app/register/index.html',
		controller:'RegisterCtrl'
	}).when('/',{
		templateUrl:'/app/index/index.html',
		controller:'IndexCtrl'
	})
}])
.run([
	'$location',function($location){
	return $location.path('/login').replace();
}])

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
;
angular.module('tmsApp')
.controller('IndexCtrl',['$scope',function($scope){
	$scope.task = {
		description:"",
		checked:false
	};
	$scope.tasksList = [];
	$scope.addTask = function(){
		task = angular.copy($scope.task);
		task.checked = false;
		task.status = 'InProgress';
		$scope.tasksList.push(task);
		$scope.task.description = '';
	}
}]);;
angular.module('tmsApp')
.controller('LoginCtrl',['$scope','$location',function($scope,$location){
	$scope.userEntity = {
		username:'',
		password:'',
		rememberMe:false
	};
	$scope.rememberMe = false;
	$scope.loginIn = function(){
		$location.path('/').replace();
	}
}]);;
angular.module('tmsApp')
.controller('RegisterCtrl',['$scope',function($scope){
	$scope.userEntity = {
		username:'',
		password:'',
		passwordSure:'',
		rememberMe:false
	};
	$scope.doRegeister = function(){
		console.log($scope.userEntity)
	}
}]);
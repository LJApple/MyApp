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
}]);
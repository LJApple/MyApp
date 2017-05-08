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
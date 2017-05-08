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
}]);
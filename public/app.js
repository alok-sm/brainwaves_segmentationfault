var app = angular.module( 'P-review', [ 'ngRoute','ngMaterial' ] )
.config(['$routeProvider', function($routeProvider) {
  $routeProvider.when('/', {
    templateUrl: 'templates/home.html',
    controller: 'HomeCtrl'
  })
}])
.controller("MainController", function($scope){
})
.controller("HomeCtrl", function($scope,$http,$location){
	$scope.text1;
	//$('#jumb').height = window.height;
	$scope.postText = function(){
		console.log("text::::",$scope.text1)
	$.ajax({
	url:'/analyze/text',
	type: 'POST',
	data: {'text':$scope.text1},
	success: function(data){
		
		console.log("data:",data);
		
		$("#dharm").html(data);

	}
	});
	}
	$scope.postFileText = function(){
		var file = document.getElementById("fileUpload").files[0];
		var data = new FormData();
		data.append('file', file);
		var xhr = new XMLHttpRequest();
		xhr.open('POST', '/analyze/file', true);
		xhr.onload = function () {

		    console.log(this.responseText);
			$("#dharm").html(this.responseText);
			
			$('#dharm').refresh();
		};
		xhr.send(data);
	}
})
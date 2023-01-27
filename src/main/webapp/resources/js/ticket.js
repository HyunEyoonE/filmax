$(function(){
	// 클릭한 해당데이터 시퀀스 저장할 변수 선언 
	var movie = 0;
	var region = 0;
	var branch = 0;
	var clickDate = 0;
	

	$(".btn-movie").click(function(event){
		//console.log(event.target);
		movie = event.target.id;
		var title = event.target.value;
		console.log(movie);
		
		$.ajax({
			type: "get",
			url: "/ticket/selectedRegion",
			data: { movieId:movie },
			success: function(value){
				//console.log(value);
				var clickedMovie = document.getElementById("selected-movie"); 
				
				$("#regionList").html(value);
				clickedMovie.innerHTML = title;
			}
		});	
	});
	
});



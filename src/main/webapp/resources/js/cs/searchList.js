	$(function(){
		$("#searchList").change(function(){
			window.location="/cs/searchList?newstype="+this.value;
		});
	});
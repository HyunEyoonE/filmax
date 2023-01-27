	$(function(){
		$("#faqSearchList").change(function(){
			window.location="/cs/faqSearchList?faqtype="+this.value;
		});
	});
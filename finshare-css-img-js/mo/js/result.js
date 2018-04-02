/*
 * 
 * 
 * 
 * result成功与否判断
 * 
 * */



$(function() {
	
	var $progressS=$("#progress_s");
	var $progressF=$("#progress_f");
	var $payBtn=$(".pay button");

	//var windowWidth = $(window).width();
	//var bl = parseInt(windowWidth/414);
	
	
	//$(".progress_h").css({
		//"transform" : "scale("+ bl +")"
		
	//});

	if (resultFlag == "success") {
		$("#success_model").show();

	}else{
	
		$("#fail_model").show();
	}
	$("#top_wrap .top").bind("click" , function(){
		history.back();
	});
	
	$(".top_left a").bind("click" , function(){//fail页面下的
		
		history.back();
	});
	
});
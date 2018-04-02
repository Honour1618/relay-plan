/*
 * newshare
 * 
 * */



$(function() {
	
	$(".top_left a").bind("click" , function(){//返回上一步
		history.back();
	});
	
	//加减运算
	var $tolNum=$('#num');//数量
	var $minus=$('.minus');
	var $plus=$('.plus');
	var $total=$('#total');//总价对象
	var $tolNumVal = parseInt($tolNum.html());
	var perMoney = parseInt($("#perMoney").attr("data-num"));
	
	
	$plus.bind("touchstart" , function(event) {
		
		
		if( $tolNumVal < shareMaxNum){
			$tolNumVal ++;
			$tolNum.html($tolNumVal);
		}
		
		$("#share_money,#total,#investmentAmt").html($tolNumVal*perMoney);
		$("#investNum").val($tolNumVal);
		$("#investAmt").val($tolNumVal*perMoney);

	});

	$minus.bind("touchstart" , function(event) {
	
		if( $tolNumVal > 1 ){
			$tolNumVal --;
			$tolNum.html($tolNumVal);
		}
		$("#share_money,#total").html($tolNumVal*perMoney);
		$("#investNum").val($tolNumVal);
		$("#investAmt").val($tolNumVal*perMoney);
	});
	$("#top_wrap .top").bind("click" , function(){
		history.back();
	});
	
	/*//choose或choosed
	
	var $agreeA=$(".plan_item .agree");
	var agreeCheck = "true";
	$agreeA.bind("click" , function(event){
		if( agreeCheck == "true" ){
			$agreeA.addClass("noChecked");
			agreeCheck = "false";
			$(".confirm_mask").show();
		}
		else{
			$agreeA.removeClass("noChecked");
			agreeCheck = "true";
			$(".confirm_mask").hide();
		}
		
	});
	$(".confirm_mask").bind("click" , function(){
		
		alert("请先同意爱就投风险提示！");
	});*/
	
	/*协议弹出层*/
	var ventureWrap=$(".ventureWrap");
	var agreeA=$(".agree a");
	var ventureI=$(".venture i");
	
	agreeA.click(function(){
		ventureWrap.css({display:'block'});
	})
	ventureI.click(function(){
		ventureWrap.css({display:'none'});
	})

});
















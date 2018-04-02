//弹出窗
$(function(){
	//点击返回按钮
	$(".top_left a").bind("click" , function(){
		history.back();
	});
});

//撤销申请
var cancelTimer = null;
function cancelRevokeData(fDtlObjId , prjShareCode){
	
	var cancelNum = 4;
	$.ajax({
	    type: "POST", //用POST方式传输 
	    dataType: "json", //数据格式:JSON
	    url: 'PtlRelay.action?method=cancel', //目标地址 
	    data: { "nosession": true,"fDtlObjId" : fDtlObjId ,"prjShareCode": prjShareCode},//nosession 未登录ajax 请求有效
	    error: function (XMLHttpRequest, textStatus, errorThrown) { 
	    	alert(errorThrown);
	    },
	    success: function (msg){
	    	$("#cancel_alert p").html(msg.desc);
	    	$("#cancel_alert").show();
	    	$('.bg_xy').css('display','block');
	    	cancelTimer = setInterval(function(){
	    		cancelNum --;
	    		$("#cancel_alert span").html(cancelNum);
	    		if( cancelNum <= 0 ){
	    			clearInterval(cancelTimer);
	    			$('.bg_xy').css('display','none');
	    			window.location.href="PtlRelay.action?appCode=test&method=fdtl&prjShareCode=" + prjShareCode;
	    			
	    		}
	    	} , 1000);	
		}
	});	
}

//发送短信提醒
function messageSendObj(){
	
	$.ajax({
	    type: "POST", //用POST方式传输 
	    dataType: "json", //数据格式:JSON
	    url: 'PtlRelay!smsNotify.action', //目标地址 
	    data: { "nosession": true,"userId": userId ,"utel":utel,"prjShareCode": prjShareCode},//nosession 未登录ajax 请求有效
	    error: function (XMLHttpRequest, textStatus, errorThrown) { 
	    	alert(errorThrown);
	    },
	    success: function (msg){
	    	alert("信息发送成功，请注意查收！");
		}
	});	
}













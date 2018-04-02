$(function() {
	var $button=$('.congress button');
	var $login=$('.login');
	var $loginClose=$('.login i');
	var $joinBtn=$('.join button');
	var bgXy=$('.bg_xy');

	//弹出窗
	$button.click(function(event) {
		if( isLogin == "1"){
			window.location.href='PtlRelay.action?method=freq&prjShareCode='+ prjShareCode;
		}else{
			$login.css('display', 'block');
			bgXy.css('display','block');
			$("#login_btn").attr("data-type" , "1");
		}
	});

	$loginClose.click(function(event) {
		$login.css('display', 'none');
		bgXy.css('display','none');
		
	});
	bgXy.click(function(event) {
		$login.css('display', 'none');
		bgXy.css('display','none');
	});
	
	$joinBtn.click(function(event) {
		if( isLogin == "1"){
			window.location.href='PtlRelay.action?method=fdtl&prjShareCode='+ prjShareCode;
		}else{
			$("#login_btn").attr("data-type" , "2");
			$login.css('display', 'block');
			bgXy.css('display','block');
		}
	});

	$loginClose.click(function(event) {
		$login.css('display', 'none');	 
	});
	
	//进度条动态处理
	var progressObj = $("#progress_main");
	if(progressNum >= 100){
		progressNum = 100;
	}
	progressObj.find("i").css({width:progressNum+"%"});
		
	
	//接力轨迹的折叠效果
	var $trail_wrap=$('.trail_wrap');
	var $trailH=$('.trail h2');
	var $trailI=$('.trail h2 i');
	var onOff=true;
	
	$trailH.click(function(event) {
		
		$trail_wrap.stop().slideToggle();
		
		if(onOff) {
			
            $trailI.css({
            	'background-image':'url('+ webroot +'/file/finshare/mo/image/up.png)'
            });
            onOff=false;
           
        }else{
     
            $trailI.css({
            	'background-image':'url('+ webroot +'/file/finshare/mo/image/down.png)'
            });
            onOff=true;
        }

	});
	
	//刷新页面
	$('.top_left').click(function(){
		window.location.reload();
	})
	
	//分享窗
	$('.footer_r').click(function(event) {
		$('#shareTip').css('display', 'block');	
	});
	$('#shareTip').click(function(event) {
		$('#shareTip').css('display', 'none');	
	});
	
	//返回箭头
	$("#top_wrap .top a").bind("click" , function(){
		history.back();
	});
	
	//微信初始化

	wechatConfig(shareTitle , shareDesc_s ,"/PtlRelay.action?appCode=test&method=fdtl&prjShareCode=" + prjShareCode);
});

function loginFun(obj){
	var str = $(obj).attr("data-type");
	if( str == "1"){
		window.location.href='PtlWeixin!showLogin.action?nextUrl=' + encodeURIComponent('PtlRelay.action?method=freq&prjShareCode='+ prjShareCode);
	}
	else if(str == "2"){
		window.location.href='PtlWeixin!showLogin.action?nextUrl=' + encodeURIComponent('PtlRelay.action?method=fdtl&prjShareCode='+ prjShareCode);
		
	}
	
	
}
//ios 直接打开
//android 用图片view
function view(obj,iu,au){
	var ua = navigator.userAgent.toLowerCase();
	if(/android/i.test(ua)){
		obj.href = webroot + '/PtlPublish!prjdocShow.action?pageNo='+au;
	}else {
		
		obj.href = iu;
	}
	return false ;
}

//wechat share
function wechatConfig(shareTitle , shareDesc , link){
	var localUrl = window.location.href;
	
	var dataForWeixin={
		appId:	shareAppId,//"wx52222341d8f2e13f"
		imgUrl: localUrl.split("/PtlRelay")[0] + shareImg,
		link:	localUrl.split("/PtlRelay")[0] + link,
		title:	shareTitle,
		desc:	shareDesc
	};
	
	var jsapi_a = "jsapi_ticket="+ shareTicket +"&noncestr="+ shareNonceStr +"&timestamp="+ shareTimestamp +"&url="+window.location.href;
	var signature = hex_sha1(jsapi_a);
	wx.config({
		debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
	    appId: shareAppId, // 必填，公众号的唯一标识
	    timestamp:shareTimestamp, // 必填，生成签名的时间戳 
	    nonceStr: shareNonceStr, // 必填，生成签名的随机串 
	    signature: signature,// 必填，签名，见附录1
	    jsApiList: [
	        'checkJsApi',
	        'onMenuShareTimeline',
	        'onMenuShareAppMessage',
	        'onMenuShareQQ',
	        'onMenuShareWeibo'
	    ]
	});
	wx.ready(function () {
		wx.onMenuShareAppMessage(dataForWeixin);
		wx.onMenuShareTimeline(dataForWeixin);
		wx.onMenuShareQQ(dataForWeixin);
		wx.onMenuShareWeibo(dataForWeixin);
	});
	wx.error(function(res){
		
	    //config信息验证失败会执行error函数，如签名过期导致验证失败，具体错误信息可以打开config的debug模式查看，也可以在返回的res参数中查看，对于SPA可以在这里更新签名。
		//alert(res);
	});

}

//关注项目
var stopClick = false;
var stopTimer = null;
function followProObj(obj){
	//防止频繁点击
	if( stopClick ){
		return;
	}
	else{
		stopClick = true;
		clearTimeout(stopTimer);
		stopTimer = setTimeout(function(){			
			stopClick = false;
		} , 3000);
		
	}
	$.ajax({
	    type: "POST", //用POST方式传输 
	    dataType: "json", //数据格式:JSON
	    url: 'PtlRelay!shareFocus.action', //目标地址 
	    data: { "nosession": true,"focusType" : focusType=="0"?"1":"0" , "prjShareCode" :prjShareCode , "userId" : userId},//nosession 未登录ajax 请求有效
	    error: function (XMLHttpRequest, textStatus, errorThrown) { 
	    	alert(errorThrown);
	    },
	    success: function (msg){
	    	if( msg.result == "0" ){
	    		if( focusType == "0"){
	    			focusType = 1;
	    			$(obj).removeClass("collected");
	    		}
	    		else{	
	    			focusType = 0;
	    			$(obj).addClass("collected");
	    		}
	    	}
	    	alertTimeoutMain(msg.desc ,1000);	
		}
	});	
}

function alertTimeoutMain(str , timer){
	var main = "<div id='alertMain'>"+ str +"</div>";
	$("body").append(main);
	
	setTimeout(function(){
		$("#alertMain").remove();	
	} , timer);
}














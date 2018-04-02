<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/tag.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta name="description" content="${indexDesc}" />
<meta name="keywords" content="${indexKeys}" />
<title>${indexTitle}</title>
<link rel="shortcut icon" href="${ctx}/file/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="${ctx}/file/commonCss/baseh5.css">
<link rel="stylesheet" href="${ctx}/file/finshare/mo/css/success.css">
<script type="text/javascript" src="${ctx}/file/commonJs/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/file/finshare/mo/js/success.js"></script>
<script type="text/javascript">
//wechat share start
var shareTitle = "${pspInfo.marketTitle}";
var shareDesc_s = "${pspInfo.marketDesc}";
var shareDesc_d = "${pspInfo.marketDesc}";
var shareAppId = "${jsapi.appId}";
var shareTimestamp = "${jsapi.timestamp}";
var shareNonceStr = "${jsapi.nonceStr}";
var shareTicket = "${jsapi.jsapi_ticket}";
var shareImg = "${comp.compMedUri}";
//wechat share end
</script>
</head>
    <body>
    	<!-- 预约开始 -->
    	<div id="top_wrap">
			<div class="top_state"></div>
			<div class="top">
				份额锁定
				<div class="top_left">
					<a href="javascript:;"></a>
				</div>
			</div>
		</div>
		<!-- 预约结束 -->
		
		<!-- 进度条开始 -->
		<div class="progress_h">
		<div class="pro_item">
			<i>
				<img src="${ctx }/file/finshare/mo/image/time_bar8.png">
			</i>
		</div>
		<ul class="progress_bar">
			<li>
				<span>接力申请</span>
			</li>
			<li>
				<span>申请审核</span>
			</li>
			<li>
				<span>份额锁定</span>
			</li>
			<li>
				<span>打        款</span>
			</li>
		</ul>
		</div>
		<!-- 进度条结束 -->

		<!-- 预约项目开始 -->
		<div class="plan_item">
			<h2>${pspInfo.simpName }</h2>
			<div class="plan_con">
				<p>您已经成功共享接力　<strong>${pspInfo.investAmtStr }</strong>　元<br/>
					<span>感谢对爱就投平台的支持。<br/>
					如想了解更多内容，请联系客服。</span>
				</p>
				<a href="${ctx}/mobile">点击查看更多投资机会》</a>
			</div>
		</div>
		<!-- 预约项目结束 -->
		
		<!-- 确认部分开始 -->
		<div class="confirm">
			<a class="button" href="tel:4006391229">联系客服</a>
		</div>
		<!-- 确认部分结束 -->
    </body>
</html>
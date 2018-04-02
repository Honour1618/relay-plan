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
<link rel="stylesheet" href="${ctx}/file/finshare/mo/css/nopay.css">
<script type="text/javascript" src="${ctx}/file/commonJs/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/file/finshare/mo/js/nopay.js"></script>
<script type="text/javascript">
	var userId = "${fdb.userId }";
	var prjShareCode = "${pspInfo.prjShareCode }";
	var utel="${utel}";
</script>
</head>
<body>
    <!-- 预约开始 -->
    <div id="top_wrap">
		<div class="top_state"></div>
		<div class="top">
			申请审核
			<div class="top_left">
				<a javascript:;></a>
			</div>
		</div>
	</div>
	<!-- 预约结束 -->
	
	<!-- 进度条 -->
			<div class="progress_h">
				<div class="pro_item">
					<em>
						<%-- <img src="${ctx }/file/finshare/mo/image/time_bar.png"> --%>
					</em>
					<i>
						<img src="${ctx }/file/finshare/mo/image/time_bar6.png">
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
			<!-- 进度条 -->

	<!-- 预约项目开始 -->
	<div class="plan_item">
		
		<h2>${fdb.simpName }</h2>
		<ul class="detail">
			<li>
				<span>您此次成功接力申请<b>${fdb.investNum }</b> 份</span>
			</li>
			<s:if test="#attr.fdb.svcAmt > 0 ">
				<li>
					<span>合计金额：<b>${fdb.totAmtStr }</b> 元<i>(含${pscInfo.feePercent}%服务费，上限${pscInfo.feeUpAmtStr}元)</i></span>
	
				</li>
			</s:if>
			<s:else>
			<li>
				<span>合计金额：<b>${fdb.totAmtStr }</b> 元</i></span>

			</li>
			</s:else>
			<!--li>
				<span>预约金额：<b>${fdb.totAmtStr }${fdb.investAmtStr }</b> 元</span>
			</li>
			<li>
				<span>服务费：<b>${fdb.feeAmtStr }</b> 元</span>
			</li-->

			<s:if test="#attr.fdb.preAmt > 0">
			<li>
				<span>为锁定您的接力份额，请支付</span>
			</li>
			<li>
				<span>预付金：<b>${fdb.preAmt}</b>元</span>
			</li>
			</s:if>
		</ul>
	
	<!-- 预约项目结束 -->
		
	<!-- 确认部分开始 -->
	<div class="confirm">
		<form id="pform" action='<s:url value="/pay/PtlPay!prjPayCfm.action"/>' method="post">
			<input type=hidden name="assetsNo" value="${fdb.assetsNo}"/>
			<input type="button" value="申请撤销" class="submit_btn revoke" onClick="cancelRevokeData('${fdb.objId}' , '${pspInfo.prjShareCode}')"/>
			<s:if test="#attr.fdb.preAmt > 0">
			<input  type="submit" value="预付金付款" class="submit_btn pay"/>
			</s:if>
		</form>		
		

	</div>
	</div>
	<!-- 确认部分结束 -->
	
	<!-- 短信提醒开始 -->
	<div class="remind">
		<s:if test="#attr.fdb.svcAmt > 0 ">
		<p>您可在三个工作日内将接力款项<span style="color:#999;"><b>${fdb.totAmtStr }</b> 元<i>(含${pscInfo.feePercent}%服务费，上限${pscInfo.feeUpAmtStr}元)</i></span>，打款到项目共享接力账号：</p>
		</s:if>
		<s:else>
			<p>您可在三个工作日内将接力款项<span><b>${fdb.investAmtStr }</b></span>元，打款到项目共享接力账号：</p>
		</s:else>
		<dl>
			<dt>账户名称</dt>
			<dd>${pscInfo.limitCompName}</dd>
		</dl>
		<dl>
			<dt>银行账号</dt>
			<dd>${pscInfo.compAcctNo}</dd>
		</dl>
		<dl>
			<dt>开户行</dt>
			<dd>${pscInfo.compBankName}</dd>
		</dl>
		<a class="button" onClick="messageSendObj()" >短信提醒</a>
		<a href="${ctx}/mobile">点击查看更多投资机会>></a>
	</div>
	<div class="more">
		<p>*我们的服务人员会在3个工作日内跟你联系，请你耐心等待！</p>	
	</div>
	<!-- 短信提醒结束 -->
	
	<!-- 撤销申请提示 -->
	<div id="cancel_alert">
		<p></p>
		<div><span class="">3</span>秒后，会自动跳转重新申请页面...</div>
		<a href="PtlRelay.action?appCode=test&method=fdtl&prjShareCode=${pspInfo.prjShareCode }">重新申请>></a>
	</div>
	<div class="bg_xy"></div>
</body>
</html>

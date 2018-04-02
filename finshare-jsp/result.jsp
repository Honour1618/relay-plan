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
<link rel="stylesheet" href="${ctx}/file/finshare/mo/css/result.css">
<script type="text/javascript" src="${ctx}/file/commonJs/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/file/finshare/mo/js/result.js"></script>
<script type="text/javascript">
	var resultFlag = "${resultFlag}";
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
		
		<!-- 进度条开始 -->
		<div class="progress_h">
			<div class="pro_item">
				<i>
					<img src="${ctx }/file/finshare/mo/image/time_bar7.png">
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
		<div id="success_model" class="end_model">
		
			<!-- 预约项目成功开始 -->
			<div class="pro_success success_model" id="progress_s">
				<div class="progress progress_s">
				
					<div class="progress_data">
						<h2>${fdb.simpName }</h2>
						<p>您此次成功接力申请<span>${fdb.investNum }</span> 份</p>
						
					<s:if test="#attr.fdb.svcAmt > 0 ">
						<P>
							合计金额：<span><b>${fdb.totAmtStr }</b> 元<i>(含${fdb.svcAmt}元服务费)</i></span>
			
						</P>
					</s:if>
					<s:else>
					<P>
						<span>合计金额：<b>${fdb.totAmtStr }</b> 元</i></span>
		
					</P>
					</s:else>
					<p>预约金额：<span>${fdb.investAmtStr }</span> 元</p>
						<p>服务费：<span>${fdb.svcAmt }</span> 元</p>
						<p>你已成功支付预付金：<span>${fdb.preAmt }</span> 元</p>
					</div>
				</div>
	
			<!-- 预约份数开始 -->
				<%--  <div class="prepay">
					<ul class="prepay_num">
						<li>
							<i>预约份数</i>
							<span><b>${fdb.investNum }</b> 份</span>
						</li>
						<li>
							<i>预约金额</i>
							<span><b>${fdb.investAmtStr }</b> 元</span>
						</li>
						<li>
							<i>预付金</i>
							<span><b>${fdb.payAmt }</b> 元</span>
						</li>
					</ul>
				</div>
			<!-- 预约份数结束 -->
			</div> --%>
			
			<div class="pay success_model">
				<div class="info">
				<s:if test="#attr.fdb.svcAmt > 0 ">
				<p>您可在三个工作日内将接力剩余款项<span><b>${fdb.totAmt - fdb.preAmt }</b> 元<i>(含${fdb.svcAmt}元服务费)</i></span>，打款到项目共享接力账号：</p>
				</s:if>
				<s:else>
					<p>您可在三个工作日内将接力剩余款项<span>${fdb.investAmt - fdb.preAmt }</span>元，打款到项目共享接力账号：</p>
				</s:else>
					<strong>账户名称</strong><span>${pscInfo.limitCompName}</span><br/>
					<strong>银行账号</strong><span>${pscInfo.compAcctNo}</span><br/>
					<strong>开户行</strong><span>${pscInfo.compBankName}</span><br/>
					<hr style="width:100%;color:#eee;"/>
					<a href="${ctx}/mobile">点击查看更多投资机会》</a>
				</div>
			</div>
			<a class="button" href="tel:4006391229">联系客服</a>
			<p class="wait">*我们的服务人员会在3个工作日内跟你联系，请你耐心等待！</p>
			<!-- 预约项目成功结束 -->
		</div>

		<!-- 预约项目失败开始 -->
	<%-- 	<div id="fail_model" class="end_model"> 
			<div class="progress fail_model" id="progress_f">	
				<div class="progress_h">
					<div class="pro_item">
						<em>
						</em>
						<i>
							<img src="${ctx }/file/finshare/mo/image/time_bar3.png">
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
				<div class="progress_data">
					<h2>项目简称</h2>
					<p>你已成功共享接力<span>10</span>万元</p>
					<p>感谢对爱就投平台的支持。</p>
					<p>如想了解更多内容，请联系客服。</p>
					<a href="javascript:;">点击查看更多投资机会》</a>
				</div>
			</div>
			<a class="button" onClick="backFun()" href="PtlRelay.action?appCode=test&method=fdtl&prjShareCode=${pspInfo.prjShareCode }">重新预约</a>
		</div> --%>
		</div>
		
		<!-- 预约项目失败开始 -->
		
		<!-- 预约项目失败结束 -->

    </body>
</html>
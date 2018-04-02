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
				申请审核
				<div class="top_left">
					<a href="javascript:;"></a>
				</div>
			</div>
		</div>
		<!-- 预约项目开始 -->

		<!-- 预约项目失败开始 -->
		<div id="fail_model" class="end_model">
			<div class="progress fail_model" id="progress_f">
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
							<span>打　　款</span>
						</li>
					</ul>
				</div>
				<div class="progress_f">
					<h2>${pspInfo.simpName }</h2>
					<p>${title }</p>
					<span style="color: #999;">${resultTip }</span>
				</div>
			</div>
			<a class="button" onClick="backFun()" href="PtlRelay.action?appCode=test&method=fdtl&prjShareCode=${pspInfo.prjShareCode }">重新申请</a>
		</div>
		
		<!-- 预约项目失败结束 -->

    </body>
</html>
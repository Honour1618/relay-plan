<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/tag.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
<meta name="viewport" id="viewport" content=
	"width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="description" content="${indexDesc}" />
<meta name="keywords" content="${indexKeys}" />
<title>${indexTitle}</title>
<link rel="shortcut icon" href="${ctx}/file/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="${ctx}/file/commonCss/baseh5.css">
<link rel="stylesheet" href="${ctx}/file/finshare/mo/css/index.css">
<script type="text/javascript" src="${ctx}/file/commonJs/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/file/finshare/mo/js/index.js"></script>
<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script type="text/javascript" src="${ctx}/js/sha1.js"></script>
<script language="javascript">
//声明动态全局变量 JS调用 

var webroot = "${ctx}";
var progressNum = "${pspInfo.numPercent}";
var isLogin = "${login}";
var prjShareCode = "${pspInfo.prjShareCode }";
var userId = "${userId}";
var focusType = "${focusType}";
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
//项目初始化数组
<c:forEach  var="prj" items="${projects}" varStatus="status">
	finPercentArr.push(${prj.finPercent});
	finStsArr.push(${prj.sts});
</c:forEach>
//活动初始化数组
<c:forEach  var="prd" items="${prds}" varStatus="prdStatus">
	finPercentActArr.push(${prd.actPercent});
</c:forEach>
</script>
</head>
	<body>
			<!-- 顶部开始 -->
			<div id="top_wrap">
				<div class="top_state"></div>
				<div class="top">
					${pscInfo.simpName}
					<div class="top_left">
						<!-- <a href="javascript:;"></a> -->
					</div>
					<c:if test="${login eq 1}">
					<div class="top_right ${focusType == '1' ?'':'collected'}"  onClick="followProObj(this)"></div>
					</c:if>
				</div>
			 <div class="banner">
				 <a href="javascript:;">
					 <img src="${ctx }${comp.compMedUri}">
				 </a>
			 </div>
			</div>
			<!-- 顶部结束 -->

			<!-- 项目简称开始 -->
			<div class="progress">
				<h2>【权益共享】${pspInfo.marketTitle}</h2>
				<div class="pro">
					<c:if test="${not empty pscInfo.prjTagList }">
						<ul class="pro_top">
							<c:forEach items="${pscInfo.prjTagList }" var="show" varStatus="pscSts">
								<li>${show}</li>
							</c:forEach>
						</ul>
					</c:if>
					<div class="pro_item">
						<i>已预约 <strong>${pspInfo.investNum - pspInfo.useNum}</strong> 份<strong>（${pspInfo.unitAmtStr }元/份）</strong></i>
						<em id="progress_main" class="bar" >
							<i>${pspInfo.numPercent}%</i>
						</em>
						<span>剩余<strong>${pspInfo.useNum }</strong>份</span>
					</div>
					<ul class="pro_bottom">
						<li>
							<i>${pscInfo.investAssStr}</i>
							<em><fmt:formatDate value="${pscInfo.assTime}" type="date" dateStyle="medium"/></em>
							<span>投资估值</span>
						</li>
						<li>
							<i>${pscInfo.assPercent}%</i>
							<em><fmt:formatDate value="${pscInfo.lastAssTime}" type="date" dateStyle="medium"/></em>
							<span>估值升值</span>
						</li>
						<li>
							<i>${pscInfo.leftDay}</i>
							<em><fmt:formatDate value="${pscInfo.investTime}" type="date" dateStyle="medium"/>-至今</em>
							<span>投资时长</span>
						</li>
					</ul>
				</div>
			</div>
			<!-- 项目简称结束 -->
			
			<!-- 回报说明开始 -->
			<c:if test="${pscInfo.buyBackFlg eq 1}">
				<div class="repay">
					<h2>回购说明</h2>
					<ul class="repayCon">
    					<li>
        					<strong>回购收益:&nbsp;<i>${pscInfo.buyBackPercent}%</i></strong>   					
    					</li>
    					<li>
       						<strong>
       							回购条款:<br />
       							<pre>${pscInfo.buyBackItem}</pre>
       						</strong>
        					
    					</li>
    					<li style="border:0;">
        					<strong>回购截止日期:&nbsp;<i><fmt:formatDate value="${pscInfo.buyBackDate}" type="date" dateStyle="medium"/></i></strong>	
    					</li>
					</ul>
				</div>
			</c:if>
			<!--  接力推荐说明 -->
			<c:if test="${ not empty pspInfo.shareDesc}">
				<div class="recommend">
					<h2>接力推荐</h2>
					<div class="recommendCon">
						<pre>${pspInfo.shareDesc}</pre>
						<p>(此信息为发布者自行推荐，平台仅做展示)</p>
					</div>
				</div>
			</c:if>
			<!-- 回报说明结束 -->
				
			<!-- 接力项目介绍开始 -->
			<c:if test="${not empty pscFeaList}">
				<div class="project">
					<c:forEach var="list" items="${pscFeaList}" varStatus="pscSts">
						<c:if test="${not empty list.featureTitle}">
							<div class="f_title" style="margin-top:8px;text-align: left;">
									<p style="margin:0"><strong>${list.featureTitle}</strong></p>
									<hr style="height:4px;margin:0;margin-top:2px"/>
							</div>
						</c:if>
						<c:if test="${not empty list.featureImgUrl}">
							<div class="f_content">
								<img src="${ctx }${list.featureImgUrl}?rd=1" style="max-height:1280px"/>
							</div>
						</c:if>
						 <c:if test="${not empty list.featureDesc}">
							 <div class="f_content">
								${list.featureDesc}
							 </div>
						 </c:if>
						<c:if test="${not empty list.linkUrl}">
							 <div class="dtl-lnk" style="text-align:right"><a class="btn-lnk" href="${list.linkUrl}"><strong>&nbsp;&nbsp;${list.linkTitle}&nbsp;&nbsp;>&nbsp;&nbsp;</strong></a></div>
						</c:if>
					</c:forEach>
					
				</div>
			</c:if>
			<!-- 接力项目介绍结束 -->

			<!-- 项目文档开始 -->
			<c:if test="${login eq 1}">
			<div class="detail">
				<ul class="det">
					<c:forEach items="${docs}" var="doc" varStatus="docSts">
						<li>
							<a class="page_change_btn icon" onclick="javascript:view(this,'${doc.href}','${doc.pageNo}')" >
								<span>${doc.protocolName}</span>
								<i></i>
							</a>
						</li>
					</c:forEach>
				</ul>
			</div>
			</c:if>
			<c:if test="${login ne 1}">
			<!-- 文档未登录 -->	
			<div class=join>
				<p>法律等相关协议及更多信息<br />只对<strong>“爱就投会员”</strong>可见，请认证  </p>
				<button>认证会员</button>
			</div>		
			</c:if>
			<!-- 项目文档结束 -->

			<!-- 融资项目介绍开始 -->
			<div class="project">
				<img src="${ctx }/h5/img/projectObj.png " class="imgHeader">
				<%-- <c:if test="${not empty finInfo.finVideoUrl  }"> <!-- 有视频 -->
					 <div class="f_title" ><strong>视频介绍</strong></div>
					 <div style="margin-top: 10px;">
					 	<iframe height="250px" width="100%"  frameborder="0" allowfullscreen="true" autoplay="false" src="${finInfo.finVideoUrl }"></iframe>
					 </div>
				 </c:if> --%>				 
				<c:forEach var="list" items="${finInfo.finFeatureList}" varStatus="status">
					<c:if test="${not empty list.featureTitle}">
						<div class="f_title" style="margin-top:8px;text-align: left;">
								<p style="margin:0"><strong>${list.featureTitle}</strong></p>
								<!-- <hr style="height:4px;margin:0;margin-top:2px"/> -->
						</div>
					</c:if>
					<c:if test="${not empty list.featureImgUrl}">
						<div class="f_content">
							<img src="${ctx }${list.featureImgUrl}?rd=1" style="max-height:1280px"/>
						</div>
					</c:if>
					<c:if test="${not empty list.featureDesc}">
						 <div class="f_content">
							${list.featureDesc}
						 </div>
					</c:if>
					<c:if test="${not empty list.linkUrl}">
						 <div class="dtl-lnk" style="text-align:right"><a class="btn-lnk" href="${list.linkUrl}"><strong>&nbsp;&nbsp;${list.linkTitle}&nbsp;&nbsp;>&nbsp;&nbsp;</strong></a></div>
					</c:if>
				</c:forEach>
			</div>
			<!-- 融资项目介绍结束 -->
			
			<!-- 接力轨迹开始 -->
			<div class="trail">
				<h2>接力轨迹&nbsp<i></i></h2>
				<div class="trail_wrap">
					<div class="trail_t">
						<div class="timer">2016
						<i></i>
						</div>
						<ul class="trail_progress">
							<li>
								<i>08.01</i>
								<span>转让</span>
								<em>接力人：王XX</em>
								<b></b>
							</li>
							<li>
								<i>05.25</i>
								<span>转让</span>
								<em>接力人：李XX</em>
								<b></b>
							</li>
						</ul>
					</div>
					<div class="trail_n">
						<div class="timer timer1">2015
						<i></i>
						</div>
						<ul class="trail_progress"> 
							<li>
								<i>02.08</i>
								<span>项目上线</span>
								<em>接力人：XXX</em>
								<b></b>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<!-- 接力轨迹结束 -->
			
			<!-- 收费提示 -->
			<c:if test="${pscInfo.feeFlg }">
					<h2 class="f_title" style="margin-top:8px;text-align: center;background:#fff;text-indent:0px;font-size:16px;">收费提示</h2>
					<div class="f_content f_time">
						作为对平台工作人员的辛苦付出的打赏，你在实际接力申请时，需要支付一定的服务费<s:if test="#attr.pscInfo.feeDesc != ''" >（${pscInfo.feeDesc}）</s:if>
						<s:if test="#attr.pscInfo.feePercent != null">：您实际接力金额的${pscInfo.feePercent}%
							<s:if test="#attr.pscInfo.feeUpAmt > 0" >，最高不超过${pscInfo.feeUpAmt}元 。</s:if>
						</s:if>
						<s:else>${pscInfo.feeUpAmt}元</s:else>
					</div>
				</c:if>

			<!-- 联系我们开始 -->
			<div class="contact">
				<h2>联系我们</h2>
				<div class="phone">
					<a href="tel:4006391229">咨询电话</a>
					<a href="tel:18221956007">小丸子热线</a>
					<a href="tel:13917852676">合作洽谈专线</a>
				</div>
				<a href="sms:market@ijointoo.com" class="email">邮箱：market@ijointoo.com</a>
				<hr/>
				<a href="${ctx}/mobile" class="item">更多项目>></a>
			</div>
			<!-- 联系我们结束 -->
			
			<!-- 底部导航开始 -->
			<div class="footer">
				<div class="footer_l">讨论</div>
				<div class="footer_r">分享</div>
				<div class="congress">
					<button>接力申请</button>
					<div class="login">
						<i></i>
						<p>欢迎下载“爱就投APP”，支持IOS和Android系统</p>
						<div class="login_info">
							<img src="${ctx }/file/finshare/mo/image/logo.png" >
							<p>·支付方式更丰富，更便捷</p>
							<p>·项目通知更迅捷，更直接</p>
							<p>·群组聊天更贴心，更爽快</p>  
						</div>
						<a href="http://a.app.qq.com/o/simple.jsp?pkgname=com.i9tou">
							下载APP
						</a>
						<a class="button" id="login_btn" onclick="loginFun(this)" data-type="0">
							立即登录
						</a>
					</div>
				</div>
			</div>
			<div class="shareTip" id="shareTip"></div>
			<div class="bg_xy"></div>
			<!-- 底部导航结束 -->

			<!-- 固定导航开始 -->
			<div class="fix_nav">
				<img src="${ctx }/file/finshare/mo/image/online_service.png" alt="">
			</div>
			<!-- 固定导航结束 -->
		</body>
</html>



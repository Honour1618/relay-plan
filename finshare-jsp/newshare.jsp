<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/tag.jsp"%>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta name="description" content="${indexDesc}" />
<meta name="keywords" content="${indexKeys}" />
<title>${indexTitle}</title>
<link rel="shortcut icon" href="${ctx}/file/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="${ctx}/file/commonCss/baseh5.css">
<link rel="stylesheet" href="${ctx}/file/finshare/mo/css/newshare.css">
<script type="text/javascript" src="${ctx}/file/commonJs/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/file/finshare/mo/js/newshare.js"></script>
<script type="text/javascript">
	var shareMaxNum = "${pspInfo.useNum }";
</script>
</head>
    <body>
    	<!-- 预约开始 -->
    	<div id="top_wrap">
			<div class="top_state"></div>
			<div class="top">
				接力申请
				<div class="top_left">
					<a href="javascript:;"></a>
				</div>
			</div>
		</div>
		<!-- 预约结束 -->
		
		<!-- 进度条 -->
		<div class="progress_h">
			<div class="pro_item">
				<em></em>
				<i>
					<img src="${ctx }/file/finshare/mo/image/time_bar5.png">
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
			<h2>${pspInfo.simpName }</h2>
			<form action="PtlRelay.action">
				<input name="appCode" value="test" type="hidden"/>
				<input name="method" value="apply" type="hidden"/>
				<input name="prjShareCode" value="${pspInfo.prjShareCode }" type="hidden"/>
				<input name="phone" value="${utel }" type="hidden"/>
				<input name="name" value="${uname }" type="hidden"/>
				<input id="investNum" name="investNum" value="1" type="hidden"/>
				<input id="investAmt" name="investAmt" value="${pspInfo.unitAmt }" type="hidden"/>
				<ul class="detail">
					
					<li>
						<em>每份金额</em>
						<span><b id="perMoney"  data-num="${pspInfo.unitAmt }">${pspInfo.unitAmtStr }</b> 元</span>
					</li>
					<li>
						<em>预约份数<i>（最多可预约${pspInfo.useNum }份）</i></em>
						<span>
						<i class="minus"></i>
						<b id="num">1</b>
						<i class="plus"></i>
						</span>
					</li>
					<li>
						<em>预约金额</em>
						<span><b id="share_money">${pspInfo.unitAmt }</b> 元</span>
					</li>
					<li style="font-size:16px; ">
						<em>合计</em>
						<span><b id="total">${pspInfo.unitAmt }</b> 元</span>
					</li>
					<li style="border-top:8px solid #eee;">
						<em>推荐人姓名:</em>
						<input type="text" value="" maxlength="8" name="rname" placeholder="推荐也会有小小惊喜哦（非必填）"/>
					</li>
					<li>
						<em>推荐人手机:</em>
						<input type="tel" value="" maxlength="11" name="rphone" placeholder="11位手机号（非必填）" maxlength:"11";/>
					</li>
					<li class="agree">
					我同意
						<a href="javascript:;"> 《爱就投平台权益转让风险提示》</a>
					</li>

				</ul>	
				<div style="position:relative;">
					<div class="confirm_mask"></div>
					<input  type="submit" value="确认" class="confirm"/>
				</div>
			</form>			
		</div>
		
		<!-- 风险提示说明 -->
		<div class="ventureWrap">
			<div class="venture">
				<h1>
					上海爱就投金融信息服务有限公司<br/>
					风险提示说明
				</h1>
				<div class="ventureCon">
					<h2>尊敬的投资人：</h2>
					<p>为了使您更好地了解在上海爱就投金融信息服务有限公司（简称“爱就投”）平台上进行项目投资的风险，爱就投根据《中华人民共和国公司法》、《上海爱就投金融信息服务有限公司用户服务协议》（以下简称《服务协议》）及其他制度、规则的有关规定，特为您提供此份投资风险揭示书。</p>
					<p>如您接受上述《服务协议》及本投资风险揭示书，即表明您已充分了解并知晓投资融资项目的风险，并承诺承担该等风险。</p>
					<h2>一、重要提示</h2>
					<p>1、爱就投业务规则与上海、深圳证券交易所的业务规则、各地非上市公司股权交易所以及股份报价转让业务规则存在很大差别，在参与平台业务之前，请您认真阅读《服务协议》以及本风险提示说明。</p>
					<p>2、爱就投业务属于金融创新业务，相关制度、规则将持续完善优化，请您关注相关制度、规则的调整和更新并加以遵守。</p>
					<p>3、作为一家专注于优质项目投资的平台，爱就投平台中的融资企业/其他民事主体并非经国务院证券监督管理机构核准公开发行股票的公司或其他主体，而是具备成长潜力和良好发展空间的非上市公司或其他民事主体；该主体处于高速成长期，受宏观政策、行业形势等影响较大，且自身也可能存在管理体制不健全。</p>
					<p>4、爱就投不对您的投资收益、交易的达成等事项作任何性质的担保或保证；爱就投不对您的投资损失承担任何责任。</p>
					<h2>二、风险揭示</h2>
					<p>使用爱就投提供的在线投资服务进行投资需关注以下风险：</p>
					<p>1、宏观经济风险：由于我国及周边国家、地区宏观经济环境和周边市场的变化，使融资企业/其他民事主体的经营处于剧烈波动中，从而导致融资企业/其他民事主体的价值不同程度的贬损，您存在亏损的可能，您将承担由此造成的损失。</p>
					<p>2、政策风险：融资企业/其他民事主体所处行业的法律、法规及相关政策发生变化，或者爱就投的制度、规则发生变化，可能引起融资企业/其他民事主体经营和披露信息的波动，您存在亏损的可能，您将承担由此造成的损失。</p>
					<p>3、公司/主体风险：融资企业/其他民事主体的内部管理和外部决策不在爱就投的控制范围内，爱就投只能在法律法规及爱就投制度、业务规则允许的范围内尽可能向您进行完整的信息披露，鉴于此，您将承担由于融资企业/其他民事主体业务风险造成的损失。另，部分融资企业/其他民事主体处于初创期，规模较小，抗市场风险和行业风险的能力较弱，主营业务收入可能波动较大，在一定程度上容易引起融资企业/其他民事主体价值的波动，您将承担由此造成的损失。</p>
					<p>4、技术风险：由于爱就投的业务是通过电子通讯技术和电脑技术来实现的，这些技术存在被网络黑客和计算机病毒攻击的可能，爱就投将尽力保障平台正常运行，但您将承担由您的个人电脑终端故障或其他爱就投平台以外因素导致系统故障而造成的损失。</p>
					<p>5、不可抗力因素导致的风险：诸如地震、火灾、水灾、战争等不可抗力因素可能导致爱就投系统平台的瘫痪，您将承担由此导致的损失。</p>
					<p>6、其他爱就投无法预见、无法避免或无法控制的风险。</p>
					<span>本风险提示说明并不保证提示您使用爱就投提供的在线投资服务进行投资所面临的全部风险，您参与此项业务前，应全面了解相关法律法规、认真阅读上述《服务协议》，并根据您自身的投资目的、投资期限、投资经验、资产状况等判断是否具备相应的投资风险承受能力。</span><br/>
					<strong>您承诺并保证已认真阅读本投资风险提示说明书，理解以上所揭示的所有风险，并愿意承担投资风险给您造成的损失。</strong>
				</div>
				<i></i>
			</div>
		</div>
		
		
		<%-- <div class="confirm">

			<input  type="button" value="确认ajax" onClick="investShareData('${uname }','${utel }','1' , '${pspInfo.unitAmt }','${pspInfo.prjShareCode }')"/>
		</div> --%>
    </body>
</html>
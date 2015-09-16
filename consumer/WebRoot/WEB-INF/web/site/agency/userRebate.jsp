<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="no-js ie ie67 ie678 ie6789" lang="en"><![endif]-->
<!--[if IE 7 ]><html class="no-js ie ie67 ie678 ie6789 ie7" lang="en"><![endif]-->
<!--[if IE 8 ]><html class="no-js ie ie678 ie6789 ie8" lang="en"><![endif]-->
<!--[if IE 9 ]><html class="no-js ie ie6789 ie9" lang="en"><![endif]-->
<!--[if !(IE)]><!-->
<html lang="en">
  <!--<![endif]-->
<head>
<title>返点详情</title>
<jsp:include page="../common/WerResources.jsp"></jsp:include>
<script type="text/javascript">
	$(function() {
		$("#maxBalance").bind("input", onKeeppointChange);
		$("#minBalance").bind("input", onKeeppointChange);
	});
	function onKeeppointChange() {
		$(this).val(Number($(this).val().replace(/[^0-9]/g, "")));
	}

	$(function() {
		if ('${username}' != null) {
			$("#username").val('${username}');
		}
		if ('${max}' != null) {
			$("#maxBalance").val('${max}');
		}
		if ('${min}' != null) {
			$("#minBalance").val('${min}');
		}

	})
</script>
<style type="text/css">
.parentDiv {
	margin-top: 10px;
}

.floatcom {
	float: left;
	margin-left: 20px;
}

.datastyle {
	text-align: center;
	width: 70px;
	height: 20px;
	color: #FDF5F7;
	background: #BD7421;
	line-height: 20px;
}

.pagenostyle {
	color: #FDF5F7;
	height: 20px;
	text-align: center;
	background: #FF6600;
	width: 90px;
	line-height: 20px;
}

.pagebody div {
	float: left;
	margin-left: 20px;
}

.disabled {
	height: 24px;
	color: #CECECE;
	background: #EFEFEF;
	margin-left: 10px !important;
	border: 1px solid #CECECE;
	line-height: 30px;
}

.activepage {
	height: 24px;
	background: #EFEFEF;
	margin-left: 10px !important;
	border: 1px solid #CECECE;
}

.currentpage {
	text-align: center;
	height: 24px;
	width: 20px;
	color: #CECECE;
	background: #EFEFEF;
	margin-left: 10px !important;
	border: 1px solid #CECECE;
	line-height: 30px;
}

.label_form {
	float: left;
	margin-right: 20px;
	margin-bottom: 16px;
}

.btn_form {
	float: left;
	margin-right: 20px;
	padding-top: 23px;
	margin-bottom: 16px;
}

.addcondition {
	padding-top: 10px !important;
}

.result-float {
	width: 70px;
	height: 40px;
	border: solid 1px #A0BACD;
	float: left;
	background: #EFEFEF;
	color: #A49C9C;
	text-align: center;
	line-height: 34px;
}

.resultCl {
	background: #FFA1A1 !important;
	color: #990036 !important;
}

.lotteryType div {
	width: 100px;
	height: 40px;
	float: left;
	margin-left: 10px;
	margin-bottom: 10px;
	background: #736548;
	text-align: center;
	line-height: 40px;
	cursor: pointer;
}

.changeColor {
	background: #AB6119 !important;
	color:#FFF;
}
</style>
<script type="text/javascript">
	$(function() {

		$(".lotterType").click(function() {
// 			$(this).addClass("changeColor");
// 			$(this).siblings().removeClass("changeColor");
			$(this).addClass("active");
			$(this).siblings().removeClass("active");
			//alert($(this).find("a").attr("gamet"));
			window.location.href="/uc/agency/rebatepage?type="+$(this).find("a").attr("gamet")+"&rd="+Math.random();
		});
	});
</script>

</head>
<body class="layout-two-column unibet custom-background">
	<div id="container">
		<jsp:include page="../common/WerHeader.jsp"></jsp:include>
		<div id="content">
			<div id="top">
				<div class="inner"></div>
			</div>

			<div id="main" role="main">

				<div class="main-container">
					<!-- 左侧菜单开始 -->
					<jsp:include page="AgencyMenu.jsp"></jsp:include>
					<!--彩种类型-->
					<div id="column-primary" class="stack gutter-col size4of5">
						<div class="header-image">
							<h2 class="heading">${type.desc} &nbsp;返点详情</h2>
						</div>

						<article class="rich-text-element main-column">
							<article class="widget bingo-game-chooser">
								<div id="nav-sub" >
									<nav style="padding-left: 14px;">
										<ul class="color-theme-1">
											<c:forEach var="item" items="${gameType}">
												<li class="lotterType <c:if test="${type==item}">active</c:if>" >
													<a style="padding-left: 13px;padding-right: 13px;" gamet="${item }">${item.desc}</a>
												</li>
											</c:forEach>
										</ul>
									</nav>
								</div>
								<form action="${pageContext.request.contextPath }/uc/userListPage" id="form" method="post" name="search">
									<table id="userlistDL"
										class="bingo-game-chooser-table table-decoration-7 color-theme-4">
										<thead>
											<tr>
												<th><div class="title">
														<span>玩法类型</span>
													</div>
												</th>
												<th><div class="title">
														<span>玩法分类</span>
													</div>
												</th>
												<th><div class="title">
														<span>赔率</span>
													</div>
												</th>
												<th><div class="title">
														<span>返点</span>
													</div>
												</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="r" items="${jsonRebate}">
												<tr>
													<td>${r.key.desc}</td>
													<td>${r.key.superName}</td>
													<td>${r.value.minPrzie}-${r.value.maxPrzie}</td>
													<td>${r.value.rebate}</td>
													
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</form>
							</article>
						</article>
					</div>
					<!-- 右侧内容面板结束 -->
				</div>
			</div>
		</div>
		<jsp:include page="../common/WerFooter.jsp"></jsp:include>
	</div>
</body>
</html>
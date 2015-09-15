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
<title>个人中心</title>
<jsp:include page="../common/WerResources.jsp"></jsp:include>
<script language="javascript" type="text/javascript"
	src="/js/timeplugins/WdatePicker.js"></script>
<script type="text/javascript">
	$(function() {
		if ('${startTime}' != null) {
			$("#startTime").val('${startTime}');
		}
		if ('${endTime}' != null) {
			$("#endTime").val('${endTime}');
		}
		if ('${gameOrder.gameType}' != null) {
			$("#lotteryType").val('${gameOrder.gameType}');
		}
	});
</script>
<style type="text/css">
tr td {
	text-align: center;
}
</style>
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
					<!--菜单-->
					<jsp:include page="UserCenterMenu.jsp"></jsp:include>
					<!--菜单结束-->
					<div class="stack gutter-col size4of5">
						<div class="header-image">
							<h2 class="heading">中奖记录查询</h2>
						</div>
						<article class="rich-text-element main-column">
							<article class="widget bingo-game-chooser">
								<form action="" method="post" name="search">
									<div id="searchPanel">
										<label>彩种类型：</label> <select id="gameType" name="gameType">
											<option value="">全部</option>
											<c:forEach var="gametype" items="${gameType}">
												<option value="${gametype }">${gametype.desc }</option>
											</c:forEach>
										</select> <label>交易时间：</label> <input id="startTime" name="startTime"
											type="text" onClick="WdatePicker()" /> <label>至</label><input
											onClick="WdatePicker()" id="endTime" name="endTime"
											type="text" />&nbsp;<input type="submit" value="查询" class="btn" />
									</div>
									<div id="top">
										<div class="inner"></div>
									</div>
									<table
										class="bingo-game-chooser-table table-decoration-7 color-theme-4">
										<thead>
											<tr>
												<th><div class="title">
														<span>用户名</span>
													</div>
												</th>
												<th style="width:75px"><div class="title">
														<span>彩种</span>
													</div>
												</th>
												<th style="width:118px"><div class="title">
														<span>玩法</span>
													</div>
												</th>
												<th><div class="title">
														<span>投注号码</span>
													</div>
												</th>
												<th style="width:60px"><div class="title">
														<span>期号</span>
													</div>
												</th>
												<th style="width:50px"><div class="title">
														<span>倍数</span>
													</div>
												</th>
												<th style="width:50px"><div class="title">
														<span>彩金</span>
													</div>
												</th>
												<th style="width:50px"><div class="title">
														<span>奖金</span>
													</div>
												</th>
												<th align="center"><div class="title">
														<span>日期</span>
													</div>
												</th>
											</tr>
										</thead>
										<tbody>
											<c:choose>
												<c:when test="${page!=null}">
													<c:forEach var="item" items="${page.result}">
														<tr>
															<td>${item.member}</td>
															<td>${item.gameType.desc}</td>
															<td><c:forEach var="it" items="${item.planItems}"
																	varStatus="status">
					   ${it.pType.desc }<br />
																</c:forEach></td>
															<td><span id="tzContent"><c:forEach var="it"
																		items="${item.planItems}" varStatus="status">
					   ${it.content }<br />
																	</c:forEach> </span></td>
															<td><c:forEach var="it" items="${item.orderItem}"
																	varStatus="status">
					   ${it.issue }<br />
																</c:forEach></td>
															<td><c:forEach var="it" items="${item.orderItem}"
																	varStatus="status">
					   ${it.multiple }<br />
																</c:forEach></td>
															<%-- <td>
					${item..mschema }
					</td> --%>
															<td>${item.betCount*2}</td>
															<td><c:choose>
																	<c:when test='${item.prizeState eq "已中奖"}'>
					        ${item.prize}
					    </c:when>
																	<c:otherwise>
					        ${item.prizeState}
					     </c:otherwise>
																</c:choose></td>
															<td><fmt:formatDate value="${item.dateTime.time}"
																	pattern="yyyy-MM-dd HH:mm:ss" /></td>
														</tr>
													</c:forEach>
													<tr>
														<td colspan="10"><input type="hidden" id="pageNo"
															name="pageNo" value="1" /> <jsp:include
																page="../../common/frontpager.jsp" /></td>
													</tr>
												</c:when>
												<c:otherwise>
													<tr>
														<td colspan="10">没有记录!</td>
													</tr>
												</c:otherwise>
											</c:choose>
										</tbody>
									</table>
								</form>
							</article>
						</article>
					</div>
				</div>
				<!-- 右侧内容面板结束 -->
			</div>
		</div>
		<jsp:include page="../common/WerFooter.jsp"></jsp:include>
	</div>
</body>
</html>
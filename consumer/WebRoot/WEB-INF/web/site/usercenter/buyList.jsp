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

		if ('${type}' != null) {
			$("#searchType").val("${type}");
		}
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
					<!--菜单-->
					<jsp:include page="UserCenterMenu.jsp"></jsp:include>
					<!--菜单结束-->
					<div class="stack gutter-col size4of5">
						<div class="header-image">
							<h2 class="heading">消费纪录</h2>
						</div>
						<article class="rich-text-element main-column">
							<article class="widget bingo-game-chooser">
								<form
									action="${pageContext.request.contextPath }/uc/buyListPage"
									id="form" method="post" name="search">
									<div id="searchPanel">
										<label>交易类型：</label> <select id="searchType" name="type">
											<option value="">全部</option>
											<option value="派奖">中奖</option>
											<option value="购彩">购彩</option>
											<option value="返佣">返点</option>
											<option value="充值">充值</option>
											<option value="提款">提款</option>
											<option value="分红">分红</option>
										</select> 
										<label>日期：</label> 
										<input id="startTime" name="startTime"	type="text" onClick="WdatePicker()" />
										<label>至</label>
										<input id="endTime" name="endTime" onClick="WdatePicker()" type="text" /> 
										 &nbsp;
										<input type="submit" value="查询" class="btn"/>
									</div>
									<div id="top">
										<div class="inner"></div>
									</div>
									<table
										class="bingo-game-chooser-table table-decoration-7 color-theme-4">
										<thead>
											<tr>
												<th><div class="title"><span>编号</span></div></th>
												<th><div class="title"><span>交易时间</span></div></th>
												<th><div class="title"><span>类型</span></div></th>
												<th><div class="title"><span>交易金额</span></div></th>
												<th><div class="title"><span>即时余额</span></div></th>
												<th><div class="title"><span>备注</span></div></th>
											</tr>
</thead>
<tbody>
											<c:if test="${page == null}">
												<tr>
													<td colspan="7">您暂时没有短消息</td>
												</tr>
											</c:if>
											<c:if test="${page != null}">
												<c:forEach var="item" items="${page.result}">
													<tr>
														<td>${item.id }</td>
														<td><fmt:formatDate value="${item.time.time}"
																pattern="yyyy-MM-dd HH:mm:ss" /></td>
														<td>${item.type }</td>
														<td>${item.amount }</td>
														<td>${item.beforeBalance+item.amount}</td>
														<td>${item.descr }</td>
													</tr>
												</c:forEach>
												<tr class="lastTr">
													<td colspan="7"><input type="hidden" id="pageNo"
														name="pageNo" value="1" /> <jsp:include
															page="../../common/frontpager.jsp" /></td>
												</tr>
											</c:if>
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
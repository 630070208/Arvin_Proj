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
<title>佣金明细</title>
<jsp:include page="../common/WerResources.jsp"></jsp:include>

<script type="text/javascript">
	$(function() {
		if ('${startTime}' != null) {
			$("#startTime").val('${startTime}');
		}
		if ('${endTime}' != null) {
			$("#endTime").val('${endTime}');
		}
		if ("${syscode}" != null) {
			$("#syscode").val('${syscode}');
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
					<!-- 左侧菜单开始 -->
					<jsp:include page="AgencyMenu.jsp"></jsp:include>
					<!--彩种类型-->
					<div id="column-primary" class="stack gutter-col size4of5">
						<div class="header-image">
							<h2 class="heading">佣金明细</h2>
						</div>

						<article class="rich-text-element main-column">
							<article class="widget bingo-game-chooser">
								<form action="" method="post" name="search">
									<div id="searchPanel">
										<label>账号：</label> <input id="code" name="syscode" type="text"
											style="width:100px" /> <label>交易日期：</label> <input
											id="startTime" name="startTime" type="text"
											onClick="WdatePicker()" /> <label>至</label> <input
											onClick="WdatePicker()" id="endTime" name="endTime"
											type="text" /> &nbsp;<input type="submit" value="查询"
											class="btn" />
									</div>
									<div id="top">
										<div class="inner"></div>
									</div>
									<table
										class="bingo-game-chooser-table table-decoration-7 color-theme-4">
										<thead>
											<tr>
												<th><div class="title">
														<span>账号</span>
													</div>
												</th>
												<th><div class="title">
														<span>昵称</span>
													</div>
												</th>
												<th><div class="title">
														<span>交易时间</span>
													</div>
												</th>
												<th><div class="title">
														<span>佣金数额</span>
													</div>
												</th>
												<th><div class="title">
														<span>描述</span>
													</div>
												</th>
											</tr>

										</thead>
										<tbody>
											<c:if test="${page == null}">
												<tr class="lastTr">
													<td colspan="5">暂无记录</td>
												</tr>
											</c:if>
											<c:if test="${page != null}">
												<c:forEach var="item" items="${page.result}">
													<tr>
														<td>${item.member.syscode }</td>
														<td>${item.member.nickname }</td>
														<td><fmt:formatDate value="${item.time.time}"
																pattern="yyyy-MM-dd HH:mm:ss" /></td>
														<td>${item.amount }</td>
														<td>${item.descr }</td>
													</tr>
												</c:forEach>
												<tr class="lastTr">
													<td colspan="5"><input type="hidden" id="pageNo"
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
					<!-- 右侧内容面板结束 -->
				</div>
			</div>
		</div>
		<jsp:include page="../common/WerFooter.jsp"></jsp:include>
	</div>
</body>
</html>
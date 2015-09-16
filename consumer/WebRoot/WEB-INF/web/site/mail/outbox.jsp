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
<title>系统消息</title>
<jsp:include page="../common/WerResources.jsp"></jsp:include>
<style type="text/css">
	.ft{
		 font-weight:bold;
	}
</style>
<script type="text/javascript">
	$(function() {
		if ('${startTime}' != null) {
			$("#startTime").val("${startTime}");
		}
		if ('${endTime}' != null) {
			$("#endTime").val("${endTime}");
		}
	})

	function delSelf(id) {
		if (confirm("您确定要删除？")) {
			var data = {
				"id" : id
			};
			ajaxRequest("/sysmsg/delSingleMessage", data, "post", sucResult);
		}
	}
	function sucResult(data) {
		if (data.code == "删除成功") {
			window.location.reload();
		} else {
			alert(data.code);
		}
	}

	function toShowSingleMsg(id) {
		$("#messageid").val(id);
		$("#showsingleform").submit();
	}
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
					<jsp:include page="MsgBoxMenu.jsp"></jsp:include>
					<!-- 左侧菜单结束 -->
					<!-- 右侧内容面板开始 -->
					<div id="column-primary" class="stack gutter-col size4of5">
						<div class="header-image">
							<h2 class="heading">系统消息</h2>
						</div>
						<article class="rich-text-element main-column">
							<article class="widget bingo-game-chooser">
								<form action="/uc/outboxPage" method="post" name="form" id="form">
									<!-- <div id="searchPanel">
										<label>日期：</label> <input id="startTime" name="startTime"
											type="text" onClick="WdatePicker()" /> <label>至</label> <input
											onClick="WdatePicker()" id="endTime" name="endTime"
											type="text" /> 
											&nbsp;
											<input type="submit" class="btn" value="查询"/>
									</div> -->
									<div id="top">
										<div class="inner"></div>
									</div>
									<table class="bingo-game-chooser-table table-decoration-7 color-theme-4">
										<thead>
											<tr>
												<th> <div class="title"><span>收件人</span></div></th>
												<th> <div class="title"><span>主题</span></div></th>
												<th> <div class="title"><span>时间</span></div></th>
											</tr></thead>
						                  <tbody>
											<c:choose>
												<c:when test="${page != null}">
													<c:forEach items="${page.result}" var="item">
														<tr>
															<td>${item.sandName}</td>
															<td>
																<a onclick="toShowSingleMsg('${item.id}');">
																	<p <c:if test="${item.state =='0'}"> class ="ft" title="未读消息"</c:if>>${item.title}</p>
																</a>
															</td>
															<td><fmt:formatDate value="${item.time.time}" pattern="yyyy-MM-dd" /></td>
														</tr>
													</c:forEach>
													<tr class="lastTr">
														<td colspan="7"><input type="hidden" id="pageNo"
															name="pageNo" value="1" /> <jsp:include
																page="../../common/frontpager.jsp" /></td>
													</tr>
												</c:when>
												<c:otherwise>
													<tr>
														<td colspan="5">您暂时没有短消息</td>
													</tr>
												</c:otherwise>
											</c:choose>
										</tbody>
									</table>
								</form>
								<form action="/send/toShowSingleMsg" id="showsingleform"
									method="post">
									<input type="hidden" value="" name="id" id="messageid" />
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
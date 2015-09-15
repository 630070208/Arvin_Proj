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
<script language="javascript" type="text/javascript" src="${pageContext.request.contextPath }/js/timeplugins/WdatePicker.js"></script>


<script type="text/javascript">
	$(function() {
		if ('${startTime}' != null) {
			$("#startTime").val('${startTime}');
		}
		if ('${endTime}' != null) {
			$("#endTime").val('${endTime}');
		}
		if ('${gameOrder.gameType}' != null) {
			$("#gameType").val('${gameOrder.gameType}');
		}
		if ('${gameOrder.orderState}' != null) {
			$("#orderState").val('${gameOrder.orderState}');
		}
		if ('${gameOrder.prizeState}' != null) {
			$("#prizeState").val('${gameOrder.prizeState}');
		}

		if ('${gameOrder.gameType}' != null) {

			$("#gameType_msg").val('${gameOrder.gameType}');
		}

	})
	
	function withDraw(id){
		ajaxRequest("/withDraw", {"id":id}, "POST", resultHandler, faultHander);
	}
	function resultHandler(data){
		if(data.flag == 'true'){
			lottery.dialog("提示！",data.msg);
		}else if(data.flag == 'false'){
			lottery.dialog("提示！",data.msg);
		}else{
			lottery.dialog("提示！","撤单失败!");
		}
	}
	
	function faultHander(data){
		lottery.dialog("提示！","撤单异常!");
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
					<!--菜单-->
					<jsp:include page="UserCenterMenu.jsp"></jsp:include>
					<!--菜单结束-->
					<div class="stack gutter-col size4of5">
						<div class="header-image">
							<h2 class="heading">订单查询</h2>
						</div>
						<article class="rich-text-element main-column">
							<article class="widget bingo-game-chooser">
								<form action="" method="post" id = "form" name="form" name="search">
									<div id="searchPanel">
										<table class="formTable">
											<tr>
												<td><label>彩种类型：</label> <select id="gameType_msg"
													name="gameType" style="width: 130px">
														<option value="">全部</option>
														<c:forEach var="gametype" items="${gameType}">
															<option value="${gametype }">${gametype.desc }</option>
														</c:forEach>
												</select> <label>订单状态：</label> <select id="orderState"
													name="orderState" style="width: 130px">
														<option value="">全部</option>
														<c:forEach var="it" items="${orderState}"
															varStatus="status">
															<option value="${it}">${it}</option>
														</c:forEach>
												</select> <label>中奖状态：</label> <select id="prizeState"
													name="prizeState" style="width: 130px">
														<option value="">全部</option>
														<c:forEach var="it" items="${prizeState}"
															varStatus="status">
															<option value="${it}">${it}</option>
														</c:forEach>
												</select> <label>方案编号：</label> <input id="walletid" name="id"
													type="text" style="width: 130px" />
												</td>
											</tr>
											<tr>
												<td><label>交易时间：</label> <input id="startTime"
													name="startTime" type="text" onClick="WdatePicker()"
													style="width: 130px" /> <label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;至&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
													<input onClick="WdatePicker()" id="endTime" name="endTime"
													type="text" style="width: 130px" /> &nbsp; <input
													type="submit" value="查询" class="btn"
													style="margin: 0px 0px;" />
												</td>
											</tr>
										</table>
									</div>

									<div id="top">
										<div class="inner"></div>
									</div>
									<table
										class="bingo-game-chooser-table table-decoration-7 color-theme-4">
										<thead>
											<tr>
												<th style="width:75px"><div class="title">
														<span>彩种</span>
													</div></th>
												<th style="width:60px"><div class="title">
														<span>期号</span>
													</div></th>
												<th style="width:118px"><div class="title">
														<span>玩法</span>
													</div></th>
												<th><div class="title">
														<span>投注号码</span>
													</div></th>
												<th style="width:50px"><div class="title">
														<span>模式</span>
													</div></th>
												<th style="width:50px"><div class="title">
														<span>倍数</span>
													</div></th>
												<th style="width:50px"><div class="title">
														<span>彩金</span>
													</div></th>
												<th style="width:50px"><div class="title">
														<span>状态</span>
													</div></th>
												<th style="width:50px"><div class="title">
														<span>奖金</span>
													</div></th>
												<th align="center">日期</span>
													</div></th>
											</tr>
										</thead>
										<tbody>
											<c:choose>
												<c:when test="${page!=null}">
													<c:forEach var="item" items="${page.result}">
														<tr>
															<td>${item.gameType.desc}
															<c:if test="${item.orderState eq '进行中'}">
																<span><a href="#" onclick="withDraw('${item.id}')">撤单</a></span>
															</c:if>
															</td>
															<td><c:forEach var="it" items="${item.orderItem}"
																	varStatus="status">
					   ${it.issue }<br />
																</c:forEach>
															</td>
															<td align="left"><c:forEach var="it"
																	items="${item.planItems}" varStatus="status">
					  ${it.pType.superName}-${it.pType.desc}<br />
																</c:forEach>
															</td>
															<td><span id="tzContent"><c:forEach var="it"
																		items="${item.planItems}" varStatus="status">
					   ${it.content }<br />
																	</c:forEach> </span>
															</td>
															<td><c:forEach var="it" items="${item.planItems}"
																	varStatus="status">
					   ${it.mschema }<br />
																</c:forEach>
															</td>
															</td>

															<td><c:forEach var="it" items="${item.orderItem}"
																	varStatus="status">
					   ${it.multiple }<br />
																</c:forEach>
															</td>

															<td>${item.amount}</td>
															<td>${item.orderState}</td>
															<td><c:choose>
																	<c:when test='${item.prizeState eq "已中奖"}'>
					        ${item.prize}
					    </c:when>
																	<c:otherwise>
					        ${item.prizeState}
					     </c:otherwise>
																</c:choose>
															</td>
															<td><fmt:formatDate value="${item.dateTime.time}"
																	pattern="yyyy-MM-dd HH:mm:ss" />
															</td>
														</tr>
													</c:forEach>
													<tr class="lastTr">
														<td colspan="10"><input type="hidden" id="pageNo"
															name="pageNo" value="1" /> <jsp:include
																page="../../common/frontpager.jsp" /></td>
													</tr>
												</c:when>
												<c:otherwise>
													<tr class="lastTr">
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
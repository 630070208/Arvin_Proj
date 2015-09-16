<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="/WEB-INF/tld/util-tags.tld"%>
<%@ taglib prefix="page" uri="/WEB-INF/tld/page-tags.tld"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<head>
<title>盈利查询-</title>
<jsp:include page="../common/headResources.jsp"></jsp:include>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/business/member.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/common/ajax_request.js"></script>


</head>
<body>
	<!-- 菜单 -->
	<jsp:include page="../common/head.jsp"></jsp:include>
	<div id="content">
		<div id="content-header">
			<h3>盈利查询</h3>
		</div>
		<div id="content-container">
				<div class="row">
					<div class="col-md-12">
					<form id="form" action="${pageContext.request.contextPath }/system/dividend/earnings" method="post">
						<div class="form-group">
							<div class="col-md-10">
								<div class="row">
									<div class="col_div">
										<div class="label_form" style="height: 40px;height: 40px;">
											开始时间: <input type="text" name="star" value="${star}" class="form-control ui_timepicker">
										</div>
										<div class="label_form" style="height: 40px;height: 40px;">
											结束时间： <input type="text" name="end" value="${end }" class="form-control ui_timepicker">
										</div>
										<div class="btn_form">
											<input type="button" id="sreachByCondition" class="btn btn-success" value="查 询"></input>
										</div>
									</div>
									<br/>
								</div>
							</div>
						</div>
					</form>
					<table class="table table-bordered  media-table">
						<thead>
							<tr>
								<td>充值金额:</td>
								<td>${chongzhi}</td>
							</tr>
							<tr>
								<td>体现金额:</td>
								<td>${tixian}</td>
							</tr>
							<tr>
								<td>盈利<font size="0.8px" color="red">时间段内(充值金额  - 提现金额 = 盈利金额)</font>:</td>
								<td>${chongzhi - tixian}</td>
							</tr>
						</thead>
					</table>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../common/foot.jsp"></jsp:include>
	<!-- target="hidden_frame" -->
</body>
</html>
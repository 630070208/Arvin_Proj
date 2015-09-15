<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="/WEB-INF/tld/util-tags.tld"%>
<%@ taglib prefix="page" uri="/WEB-INF/tld/page-tags.tld"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<head>
<title>业务流水-中奖记录</title>
<jsp:include page="../common/headResources.jsp"></jsp:include>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/business/reqTx.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/common/ajax_request.js"></script>
</head>
<body>
	<!-- 菜单 -->
	<jsp:include page="../common/head.jsp"></jsp:include>
	<div id="content">
		<div id="content-header">
			<h1>充值流水记录</h1>
		</div>
		<form id="form"  action="${pageContext.request.contextPath }/system/member/findPayReques" method="post">
		<div id="content-container">
			<div class="row">
				<div class="col-md-12">
						<br/>
					</form>
					<table class="table table-bordered table-highlight media-table">
						<thead>
							<tr>
								<th>用户名</th>
								<th>充值金额</th>
								<th>充值方式</th>
								<th>是否处理</th>
								<th>是否成功</th>
								<th>充值时间</th>
								<th>备注</th>
							</tr>
						</thead>
						<c:if test="${page!=null}">
							<tbody>
								<c:forEach var="item" items="${page.result}" varStatus="status">
									<tr>
										<td>${item.member.syscode}</td>
										<td>${item.money}</td>
										<td>${item.paytype}</td>
										<td>${item.isDealWith==true?'是':'否'}</td>
										<td>${item.isSucce==true?'是':'否'}</td>
										<td><fmt:formatDate value="${item.dateTime.time}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
										<td>${item.desc}</td>
									</tr>
								</c:forEach>
								
							</tbody>
						</c:if>
						<c:if test="${page==null}">
							<tr>
								<td colspan="8" style="color: #FF0000; font-size:15px;">暂时没有记录</td>
							</tr>
						</c:if>
					</table>
					<div class="row dt-rb">
						<div class="col-sm-6"></div>
						<div class="col-sm-6">
							<div class="dataTables_paginate paging_bootstrap">
								 <c:if test="${page!=null}">
									<jsp:include page="../common/pager.jsp"/>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../common/foot.jsp"></jsp:include>
</body>
</html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="/WEB-INF/tld/util-tags.tld"%>
<%@ taglib prefix="page" uri="/WEB-INF/tld/page-tags.tld"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<head>
<title>游戏管理</title>
<jsp:include page="common/headResources.jsp"></jsp:include>
</head>
<body>
	<!-- 菜单 -->
	<jsp:include page="common/head.jsp"></jsp:include>
	<div id="content">
		<div id="content-header">
			<h3>信息提示</h3>
		</div>
		<form id="form"  action="${pageContext.request.contextPath }/system/member/banklist" method="post">
		<div id="content-container">
			<div class="row">
				<div class="col-md-6">
					<div class="row dt-rb">
						<div class="col-sm-6">
							未处理提现:<a href="/system/business/txr/list">${stateInt}条</a>
						</div>
					</div>
					<div class="row dt-rb">
						<div class="col-sm-6">
							未处理充值:<a href="/system/business/cztk/list">${dealWith}条</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="common/foot.jsp"></jsp:include>
</body>
</html>
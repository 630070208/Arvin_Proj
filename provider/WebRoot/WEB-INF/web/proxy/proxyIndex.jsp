<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>系统返点设置</title>
<jsp:include page="../common/headResources.jsp"></jsp:include>
<script type="text/javascript">
	$(function(){
		$("#searchSbt").click(function(){
			var type = $("#userType1").val();
			if('会员' == type){
				$("#form").attr("action","/system/proxy/memberIndex");
			}
			$("#form").submit();
		});	
	});
	
	
</script>
</head>
<body>
	<!-- 菜单 -->
	<jsp:include page="../common/head.jsp"></jsp:include>
	<div id="content">
		<div id="content-header">
			<h1>流水统计</h1>
		</div>
		<div id="content-container">
			<div class="row">
				<div class="col-md-12">
					<form action="/system/proxy/proxyIndex" method="post" id="form" class="form-horizontal">
						<div class="form-group">
					 		<div class="col-md-3">
								<input type="text" id="syscode" value="${proxySysCode}" placeholder="账号" name="proxySysCode" class="form-control">
							</div>
							<div class="col-md-3">
								 <select class="form-control" id="userType1" name="userType">
								     <option <c:if test="${'总代理'==userType}">selected</c:if> value="总代理">总代理</option>
								     <option <c:if test="${'代理'== userType}">selected</c:if> value="代理">代理</option>
								     <option <c:if test="${'会员'==userType}">selected</c:if> value="会员">会员</option>
								</select>
							</div>
							<div class="col-md-3">
								<input type="button" id="searchSbt" class="btn btn-primary" value="查询"></input><font style="size: 8px;" color="red">注意：只能单条件查询,总代理消费充值没有计入统计</font>
							</div>
						</div>
						<table class="table table-bordered table-highlight media-table">
						<thead>
							<tr>
								<th>账号</th>
								<th>充值</th>
								<th>提款</th>
								<th>购彩</th>
								<th>派奖</th>
								<th>返佣</th>
								<th>撤单</th>
								<th class="text-center">操作</th>
							</tr>
						</thead>
						<c:if test="${ null == map || map.size() == 0}">
							<tr align="center">
								<td colspan="7" style="color: #FF0000; font-size:15px;">暂时没有记录</td>
							</tr>
						</c:if>
						<c:forEach items="${map}" var="m">
							<tr>
								<td>${m.key}</td>
								<td>${m.value.chongZhi}</td>
								<td>${m.value.tiKuan}</td>
								<td>${m.value.gouCai}</td>
								<td>${m.value.paiJiang}</td>
								<td>${m.value.fanYong}</td>
								<td>${m.value.cheDan}</td>
								<td><c:if test="${!'会员' eq m.value.userType.name() || '总代理' eq userType}"><a href="/system/proxy/condStatInfo?proxySysCode=${m.key}">查看下级流水</a></c:if></td>
							</tr>
						</c:forEach>
					</table>
					<div class="row dt-rb">
						<div class="col-sm-6"></div>
						<div class="col-sm-6">
							<div class="dataTables_paginate paging_bootstrap">
								<c:if test="${!empty page.result}">
									<jsp:include page="../common/pager.jsp"/>
								</c:if>
							</div>
						</div>
					</div>
					</form>
					
				</div>
			</div>
		</div>
		<jsp:include page="../common/foot.jsp"></jsp:include>
</body>
</html>

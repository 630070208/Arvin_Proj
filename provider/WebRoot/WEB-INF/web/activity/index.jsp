<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="/WEB-INF/tld/util-tags.tld"%>
<%@ taglib prefix="page" uri="/WEB-INF/tld/page-tags.tld"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<head>
<title>活动管理</title>
<jsp:include page="../common/headResources.jsp"></jsp:include>
</head>
<body>
	<!-- 菜单 -->
	<jsp:include page="../common/head.jsp"></jsp:include>
	<div id="content">
		<div id="content-header">
			<h1>活动管理</h1>
		</div>
		<div id="content-container">
			<div class="row">
				<div class="col-md-12">
					<form action="/system/issue/list" id="form">
						<input type="hidden" name="pageNo" id="pageNo" value="1"/>
						<div class="form-group">
							<div class="col-md-10">
								<div class="row">
									<div class="col-md-3">
									<a href="#edit_form" onclick="createNew()" class="btn btn-primary popup-file">新增活动</a>
									</div>
								</div>
							</div>
						</div>
					</form>

					<table class="table table-bordered table-highlight media-table">
						<thead>
							<tr>
								<th width="15px">#</th>
								<th width="20%">活动名称</th>
								<th width="10%">活动类型</th>
								<th width="10%">赠送金额</th>
								<th width="10%">开始时间</th>
								<th width="10%">截止时间</th>
								<th width="10%">提款限额</th>
								<th width="10%">是否启用</th>
								<th class="text-center" width="20%">操作</th>
							</tr>
						</thead>
						<c:if test="${not empty page.result}">
							<tbody>
								<c:forEach var="item" items="${page.result}">
									<tr>
										<input type="hidden" value="${item.id}" id="row_id_${item.id}">
										<input type="hidden" value="${item.name}" id="row_name_${item.id}">
										<input type="hidden" value="${item.money}" id="row_money_${item.id}">
										<input type="hidden" value="${item.type}" id="row_type_${item.id}">
										<input type="hidden" value="<fmt:formatDate value="${item.startTime.time }" pattern="yyyy-MM-dd HH:mm:ss"/>" id="row_startTime_${item.id}">
										<input type="hidden" value="<fmt:formatDate value="${item.stopTime.time }" pattern="yyyy-MM-dd HH:mm:ss"/>" id="row_stopTime_${item.id}">
										<input type="hidden" value="${item.isEnabled}" id="row_isEnabled_${item.id}"> 
										<input type="hidden" value="<fmt:formatDate value="${item.stopTime.time }" pattern="yyyy-MM-dd HH:mm:ss"/>" id="row_opTime_${item.id}">
										<td align="center">${item.id}</td>
										<td align="left">${item.name}</td>
										<td align="left">${item.type}</td>
										<td align="left">${item.money}</td>
										<td align="left"><fmt:formatDate value="${item.startTime.time }" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
										<td align="left"><fmt:formatDate value="${item.stopTime.time }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
										<td align="left">${item.conditMoney}</td>
										<td align="left">
										<c:if test="${item.isEnabled}">是</c:if>
										<c:if test="${!item.isEnabled}">否</c:if>
										</td>
										<td align="center">
										<a class="btn btn-xs btn-primary popup-file" href="#edit_form" onclick="editRecord(${item.id});"><i class="fa fa-pencil"></i></a>
										 &nbsp; 
										<a class="btn btn-xs btn-secondary" onclick="delItem('tab${item.id }');"><i class="fa fa-times"></i></a>
										</td>
									</tr>
								</c:forEach>

								<tbody>
						</c:if>
					<c:if test="${page.result==null}">
									<tr>
								<td colspan="9" style="color: #FF0000; font-size:15px;">暂时没有记录</td>
							</tr>
						</c:if>
					
							</table>
					<div class="row dt-rb">
						<div class="col-sm-6"></div>
						<div class="col-sm-6">
							<div class="dataTables_paginate paging_bootstrap">
								<c:if test="${page.result!=null}">
										<jsp:include page="../common/pager.jsp"></jsp:include>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../common/foot.jsp"></jsp:include>
	<form id="edit_form" method="post" action="/system/activity/save"
		class="white-popup-block mfp-hide form-horizontal">
		<h3 class="heading">活动</h3>
		<input type="hidden" name="id" /> 
		<input type="hidden" name="springMVC.token" value="${token}" >
		<input type="hidden" name="id" value="${dataModel.id}" />
		<div class="form-group">
		<label class="col-md-2">活动名称：</label>
		<div class="col-md-5">
		<input type="text" name="name" id="name" class="form-control" value="${dataModel.name}"/>
		
		</div>
		</div>
		<div class="form-group">
		<label class="col-md-2">活动类型：</label>
		<div class="col-md-5">
			<select name="type" class="form-control">
				<c:forEach items="${activs}" var="act">
				<option value="${act }">${act}</option>
				</c:forEach>
			</select>
		</div>
		</div>
				
				
		<div class="form-group">
		<label class="col-md-2">提现金额：</label>
		<div class="col-md-5">
		<input type="text" name="conditMoney"  class="form-control" value="${dataModel.conditMoney}"/>
		</div>
		</div>
		
		
		<div class="form-group">
		<label class="col-md-2">赠送金额：</label>
		<div class="col-md-5">
		<input type="text" name="money" id="money" class="form-control" value="${dataModel.money}"/>
		</div>
		</div>
		
		
		
		<div class="form-group">
		<label class="col-md-2">开始时间：</label>
		<div class="col-md-5">
		<input type="text" name="startTime" id="startTime" class="form-control" value="${dataModel.startTime}"/>
		</div>
		</div>
		
		<div class="form-group">
		<label class="col-md-2">截止时间：</label>
		<div class="col-md-5">
		<input type="text" name="stopTime" id="stopTime" class="form-control" value="${dataModel.stopTime}"/>
		</div>
		</div>
		
		<div class="form-group">
		<label class="col-md-2">是否启用：</label>
		<div class="col-md-5" id="isEnableId">
		  是 <input type="radio"  name="isEnabled" value="true" />  &nbsp;&nbsp;
		  否<input type="radio" name="isEnabled" value="false" />
		</div>
		</div>
		<div class="form-group">
			<div class="col-md-7 col-md-push-3">
				<input type="submit" class="btn btn-primary" value="保   存"></input>
			</div>
		</div>
	</form>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/activity/activityList.js"></script>
</body>
</html>









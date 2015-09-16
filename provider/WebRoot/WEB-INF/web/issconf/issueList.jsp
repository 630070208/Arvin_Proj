<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="/WEB-INF/tld/util-tags.tld"%>
<%@ taglib prefix="page" uri="/WEB-INF/tld/page-tags.tld"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<head>
<title>彩期管理 - 重庆11选5</title>


<script src="/js/issconf/issueList.js"></script>
<jsp:include page="../common/headResources.jsp"></jsp:include>
</head>
<body>
	<!-- 菜单 -->
	<jsp:include page="../common/head.jsp"></jsp:include>
	<div id="content">
		<div id="content-header">
			<h1>彩期查询 - ${gametype.desc }</h1>
			<input type="hidden" id="gameType" value="${gametype}"> 
		</div>
		<div id="content-container">
			<div class="row">
				<div class="col-md-12">
					<form action="/system/issue/list" id="form">
						
						<div class="form-group">
							<div class="col-md-10">
								<div class="row">
									<div class="col-md-3">
										<select name="type" class="gametype form-control" >
											<c:forEach var="gametype" items="${gameTypeList}">
												<option value="${gametype }"  <c:if test="${gametype == type}">selected</c:if>>${gametype.desc }</option>
											</c:forEach>
										</select>
										<!-- <input type="text" name="gameType" class="form-control"> -->
									</div>
									<div class="col-md-3">
										<input type="submit" class="btn btn-success" value="查 询"></input>
										<a href="#add_issue" onclick="createNew()" class="btn btn-primary popup-file">新增彩期</a>
									</div>
								</div>
							</div>
					</form>

					<table class="table table-bordered table-highlight media-table">
						<thead>
							<tr>
								<th width="5%">#</th>
								<th width="20%">彩期</th>
								<th width="20%">开奖号码</th>
								<th width="10%">开始时间</th>
								<th width="10%">停售时间</th>
								<th width="7%">状态</th>
								<th width="10%">开奖时间</th>
								<th class="text-center" width="20%">操作</th>
							</tr>
						</thead>
						<c:if test="${not empty page.result}">
							<tbody>
								<c:forEach var="item" items="${page.result}">
									<tr>
										<input type="hidden" value="${item.id}" id="row_id_${item.id}">
										<input type="hidden" value="${item.issueCode}" id="row_issueCode_${item.id}">
										<input type="hidden" value="${item.prizeResult}" id="row_prizeResult_${item.id}">
										<input type="hidden" value="<fmt:formatDate value="${item.startTime.time }" pattern="yyyy-MM-dd HH:mm:ss"/>" id="row_startTime_${item.id}">
										<input type="hidden" value="<fmt:formatDate value="${item.stopTime.time }" pattern="yyyy-MM-dd HH:mm:ss"/>" id="row_stopTime_${item.id}">
										<input type="hidden" value="${item.state}" id="row_state_${item.id}"> 
										<input type="hidden" value="<fmt:formatDate value="${item.opTime.time }" pattern="yyyy-MM-dd HH:mm:ss"/>" id="row_opTime_${item.id}">
										<td align="center">${item.id}</td>
										<td align="left">${item.issueCode}</td>
										<td align="left">${item.prizeResult}</td>
										<td align="left"><fmt:formatDate value="${item.startTime.time }" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
										<td align="left"><fmt:formatDate value="${item.stopTime.time }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
										<td align="left">${item.state}</td>
										<td align="left"><fmt:formatDate value="${item.opTime.time }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
										<td align="center">
										
										<a class="btn btn-xs btn-primary popup-file" href="#add_issue" onclick="editRecord(${item.id});"><i class="fa fa-pencil"></i></a>
										&nbsp; 
										
										<c:if test="${item.state =='未开奖'}">
											<a class="btn btn-xs btn-primary popup-file" onclick="kaiJiang(${item.id});"><i class="fa fa-gift">开奖</i></a>
										</c:if>
										 &nbsp; 
										<a class="btn btn-xs btn-secondary" onclick="delItem('tab${item.id }');"><i class="fa fa-times"></i></a>
										</td>
									</tr>
								</c:forEach>

								<tbody>
						</c:if>
					<c:if test="${page.result==null}">
									<tr>
								<td colspan="8" style="color: #FF0000; font-size:15px;">暂时没有记录</td>
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
	<form id="add_issue" method="post"  action="/system/issue/update?type=${gametype}"
		class="white-popup-block mfp-hide form-horizontal">
		<h3 class="heading">修改彩期</h3><%--
		<input type="hidden" id="issueId" name="id" value="" /> 
		--%><input type="hidden" name="springMVC.token" value="${token}" >
		<div class="form-group">
			<label class="col-md-2">彩期：</label>
			<div class="col-md-7">
				<input type="text" name="issueCode" id="issueCode" class="form-control"
					value="${dataModel.issueCode}" required />
			</div>
		</div>

		<div class="form-group">
			<label class="col-md-2">开奖号码：</label>
			<div class="col-md-7">
				<input type="text" name="prizeResult" id="prizeResult" class="form-control"
					value="${dataModel.prizeResult}" />
			</div>
		</div>
		<div class="form-group">
			<label class="col-md-2">开始时间：</label>
			<div class="col-md-7">
				<input type="text" name="startTime" id="startTime" class="form-control"
					value="${dataModel.startTime}" />
			</div>
		</div>

		<div class="form-group">
			<label class="col-md-2">停售时间：</label>
			<div class="col-md-7">
				<input type="text" name="stopTime" id="stopTime" class="form-control"
					value="${dataModel.stopTime}" />
			</div>
		</div>
		<div class="form-group">
			<label class="col-md-2">状态：</label>
			<div class="col-md-7">
			  <select id="editState" name="state">
				   <c:forEach items="${issueState }" var="item">
				         <option value="${item}">
				                 ${item}
				         </option>
				   </c:forEach>
               </select>			
			</div>
		</div>

		<div class="form-group">
			<label class="col-md-2">开奖时间：</label>
			<div class="col-md-7">
				<input type="text" name="opTime" id="opTime" class="form-control"
					value="${dataModel.opTime}" />
			</div>
		</div>
		<div class="form-group">
			<div class="col-md-7 col-md-push-3">
				<input type="button" onclick="submitEdit('${gametype}')" class="btn btn-primary" value="保   存"></input>
			</div>
		</div>
	</form>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/issconf/issueList.js"></script>
</body>
</html>









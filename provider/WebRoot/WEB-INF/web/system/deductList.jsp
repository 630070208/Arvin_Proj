<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>交易手续费配置</title>
<jsp:include page="../common/headResources.jsp"></jsp:include>

<script type="text/javascript">
	$(function(){
		$("#updateBtn").click(function(){
			ajaxRequest("/system/deductConf/saveDeduct", $("#upload_form").serialize(), "POST", resultHandler, faultHander);
		});
		function resultHandler(data){
			if(data.flag == true){
				alert("操作成功");
			}else{
				alert(data.msg)
			}
		}
		function faultHander(data){
			alert(data.msg)
		}
	});
	
	function editRecord(t,id,type,deduct,success){
		$("#walletsDetailType option[value="+type+"]").attr("selected", true);
		$("#success option[value="+success+"]").attr("selected", true);
		$("#deduct").val(deduct);
		$("#dedId").val(id);
		t.href='#upload_form';
}
</script>
</head>
<body>
	<!-- 菜单 -->
	<jsp:include page="../common/head.jsp"></jsp:include>
	<div id="content">
		<div id="content-header">
			<h1>交易手续费列表</h1>
		</div>
		<div id="content-container">
			<div class="row">
				<div class="col-md-12">
					<form action="/system/deductConf/deductList" id="form" method="post" name="form">
						<div class="form-group">
							<div class="col-md-12">
								<div class="row">
									<div class="col-md-3">
										<select name="walletDetailType" id="walletsDetailType" class="playtype form-control">
											<option value="">全部</option>
											<option value="充值">充值</option>
											<option value="提款">提款</option>
										</select>
									</div>
									<div class="col-md-3" style="width:6%!important" >
										<input type="submit" class="btn btn-success" style="display: inline" value="查询">
									</div>
									<div class="col-md-3">
										<a class="btn btn-primary popup-file" href="#upload_form" >新增</a>
									</div>
								</div>
							</div>
						</div>
					
					<table id="sysPrizeTab" class="table table-bordered table-highlight">
						<thead>
							<tr>
								<th>交易类型</th>
								<th>手续费</th>
								<th>是否启用</th>
								<th>最后操作时间</th>
								<th>操作人</th>
								<th>操作</th>
							</tr>
						</thead>
						<c:if test="${page.result!=null}">
							<tbody>
								<c:forEach var="item" items="${page.result}" varStatus="status">
									<form id="tab${status.index}" method="POST" action="${pageContext.request.contextPath }/system/rebate/del" >
										<tr>
											<input type="hidden" name="id" value="${item.id }" />
											<td>${item.walletDetailType.name()}</td>
											<td>${item.deduct}%</td>
											<td>${item.success?'是':'否'}</td>
											<td><fmt:formatDate value="${item.updateTime.time }" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
											<td>${item.author }</td>
											<td align="center"><a class="btn btn-xs btn-primary popup-file" onclick="editRecord(this,'${item.id}','${item.walletDetailType.name()}','${item.deduct}','${item.success}');" href="javascript:;" title="编辑" >
											<i class="fa fa-pencil"></i></a>&nbsp; </i>
											</a></td>
										</tr>
									</form>
								</c:forEach>
							</tbody>
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
	</form>
	<jsp:include page="../common/foot.jsp"></jsp:include>
	
	<!-- target="hidden_frame" -->
	<form id="upload_form" method="post" name="from" action=""	class="white-popup-block mfp-hide form-horizontal" style="max-width: 500px">
		<input type="hidden" name="springMVC.token" value="${token}" >
		<h3 class="heading">添加交易 手续费</h3>
		<input type="hidden" id="dedId" class="edit_id" name="id" value="" />
		<div class="playDiv form-group" >
			<label class="col-md-3">交易类型：</label>
			<div class="col-md-7">
				<select name="walletDetailType" id="walletsDetailType" class="playtype form-control">
					<option value="充值">充值</option>
					<option value="提款">提款</option>
				</select>
			</div>
		</div>
		<div class="form-group">
			<label class="col-md-3">手续费：</label>
			<div class="col-md-6">
				<input type="input" name="deduct" placeholder="请输入整数" id="deduct" class="minPrize form-control" required="required" />
			</div><font style="font-size: 8px; color: red;">如果为负将加钱，如果为正则扣除手续费</font>
		</div>
		<div class="form-group">
			<label class="col-md-3">是否启用：</label>
			<div class="col-md-7">
				<select name="success" id="success" class="playtype form-control">
				<option value="true">是</option>
				<option value="false">否</option>
				</select> 
			</div>
		</div>
		<div class="form-group">
			<div class="col-md-10">
				<label class="col-md-5"></label>
				<input type="button" id="updateBtn"class="addBtn btn btn-success" value="保存"/>
			</div>
		</div>
	</form>
</body>
</html>

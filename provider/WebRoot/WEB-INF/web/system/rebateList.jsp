<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>系统返点设置</title>
<jsp:include page="../common/headResources.jsp"></jsp:include>
<script type="text/javascript">
$(function(){
	//showPlayType();
});
function delItem(form){
	 if (confirm("确认要删除？")) 
          	$("#"+form).submit();
}
//function showPlayType(){
//	var url="/system/rebate/playtypes";
//	var type = $("#gtselect").val();
//	alert(type);
//	var shtml="";
//	ajaxRequest(url,{type:type},"post",function(result){
//		$.each(result,function(i,v){
//			shtml = shtml+"<option value="+i+">"+v+"</option>"; 
//		});
//		$("#playtype").html(shtml);
//	});
//}
function editRecord(t,id){
	
	$("#gameTypeAndplayType").val($($(t).parent().parent().children()[1]).text());
	$("#maxPrize").val($($(t).parent().parent().children()[2]).text());
	$("#minPrize").val($($(t).parent().parent().children()[3]).text());
	var type = $($(t).parent().parent().children()[4]).text();
	if("浮动模式" == type){
		$("#isRelocateTrue").attr("checked","checked");
	}else{
		$("#isRelocateFalse").attr("checked","checked");
	}
	$("#rebate").val($($(t).parent().parent().children()[5]).text());
	$("#rebateid").val(id);
	t.href='#upload_form';
}
</script>
</head>
<body>
	<!-- 菜单 -->
	<jsp:include page="../common/head.jsp"></jsp:include>
	<div id="content">
		<div id="content-header">
			<h1>系统奖金/返点</h1>
		</div>
		<div id="content-container">
			<div class="row">
				<div class="col-md-12">
					<form action="${pageContext.request.contextPath }/system/rebate/list" id="form">
						<div class="form-group">
							<div class="col-md-10">
								<div class="row">
									<div class="col-md-3">
										<select name="type" class="gametype form-control" >
											<c:forEach var="gametype" items="${gameType}">
												<option value="${gametype }" <c:if test="${gametype==type}">selected="selected"</c:if>>${gametype.desc }</option>
											</c:forEach>
										</select>
										<!-- 彩种：<input type="text" class="form-control" style="width: 250px;display: inline" name="gametype"> -->
									</div>
									<!-- 
									<div class="col-md-3">
										玩法：<input type="text" class="form-control" style="width: 250px;display: inline" name="config.playtyep">
									</div> -->
									<div class="col-md-3" style="width:6%!important" >
										<input type="submit" class="btn btn-success" style="display: inline" value="查询">
									</div>
									<div class="col-md-3">
										<a class="btn btn-primary popup-file" href="#upload_form" >添加</a>
									</div>
								</div>
							</div>
						</div>
					
					<table id="sysPrizeTab" class="table table-bordered table-highlight">
						<thead>
							<tr>
								<th>游戏-玩法</th>
								<th>最高奖金（元）</th>
								<th>最低奖金（元）</th>
								<th>模式</th>
								<th>系统返点（%）</th>
								<th>操作</th>
							</tr>
						</thead>
						<c:if test="${page.result!=null}">
							<tbody>
								<c:forEach var="item" items="${page.result}" varStatus="status">
									<form id="tab${status.index}" method="POST" action="${pageContext.request.contextPath }/system/rebate/del" >
										<tr>
											<input type="hidden" name="id" value="${item.id }" />
											<td>${item.gametype.desc}-${item.playtype.superName }-${item.playtype.desc} </td>
											<td>${item.maxPrize}</td>
											<td>${item.minPrize}</td>
											<td>${item.isRelocate?'浮动模式':'固定模式'}</td>
											<td>${item.rebate}</td>
											<td align="center"><a class="btn btn-xs btn-primary popup-file" onclick="editRecord(this,'${item.id}');" href="javascript:;" title="编辑" >
											<i class="fa fa-pencil"></i></a>&nbsp; <a class="btn btn-xs btn-secondary" title="删除" href="javascript:void(0)" onclick="delItem('tab${status.index}')"><i class="fa fa-times"></i>
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
	<form id="upload_form" method="post" action="/system/rebate/edit"	class="white-popup-block mfp-hide form-horizontal" style="max-width: 500px">
		<input type="hidden" name="springMVC.token" value="${token}" >
		<h3 class="heading">[奖金/返点]编辑</h3>
		<input type="hidden" id="rebateid" class="edit_id" name="id" value="" />
		<%--<div class="gameDiv form-group" >
			<label class="col-md-3">游戏类型：</label>
			<div class="col-md-7">
				<select name="gametype" class="gametype form-control" onchange="showPlayType()" id="gtselect">
					<c:forEach var="gametype"  items="${gameType}">
						<option value="${gametype }">${gametype.desc }</option>
					</c:forEach>
				</select>
				<!-- <input type="text" name="gametype" class="gametype form-control" required="required" />  -->
			</div>
		</div>
		--%><div class="playDiv form-group" >
			<label class="col-md-3">玩法类型：</label>
			<div class="col-md-7">
				<%--<select name="playtype" id="playtype" class="playtype form-control">
					
				</select>
				--%> <input type="text" id="gameTypeAndplayType" class="playtype form-control" />
			</div>
		</div>
		<div class="form-group">
			<label class="col-md-3">最高奖金：</label>
			<div class="col-md-7">
				<input type="input" id="maxPrize" name="maxPrize" class="maxPrize form-control" required="required"/> 
			</div>
		</div>
		<div class="form-group">
			<label class="col-md-3">最低奖金：</label>
			<div class="col-md-7">
				<input type="input" id="minPrize" name="minPrize" class="minPrize form-control" required="required" />
			</div>
		</div>
		<div class="form-group">
			<label class="col-md-3">模&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;式：</label>
			<div class="col-md-7">
				  <label class="radio-inline">浮动模式<input type="radio" id="isRelocateTrue" name='isRelocate' value="true"/></label><label class="radio-inline">固定模式<input id="isRelocateFalse" type="radio" name='isRelocate' value="false"/></label>
			</div>
		</div>
		<div class="form-group">
			<label class="col-md-3">返&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;点：</label>
			<div class="col-md-7">
				<input type="input" id="rebate" name="rebate" class="rebate form-control"  style="display: inline"/>
			</div>
		</div>
		<div class="form-group">
			<div class="col-md-10">
				<label class="col-md-7"></label>
				<input type="submit" class="addBtn btn btn-success" value="修改"/>
			</div>
		</div>
	</form>
</body>
</html>

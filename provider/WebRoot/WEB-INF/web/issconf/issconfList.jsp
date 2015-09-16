<!-- 
彩期配置
 -->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="/WEB-INF/tld/util-tags.tld"%>
<%@ taglib prefix="page" uri="/WEB-INF/tld/page-tags.tld"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<head>
<title>游戏管理</title>
<jsp:include page="../common/headResources.jsp"></jsp:include>
<script type="text/javascript">
	function delItem(form){
		 if (confirm("确认要删除？")) {
           $("#"+form).submit();
        }
	}
	
	function edit(index){
	}
	
	
	function isSell(flag,id){
		var data = {"flag":flag,"id":id};
		ajaxRequest("/system/issconf/changeStatus",data,"post",resultHandler);
	}
	
	function resultHandler(data){
		alert(data.code);
		if(data.code==="操作成功"){
			window.location.reload();
		}
		
	}
	
</script>
</head>
<body>
	<!-- 菜单 -->
	<jsp:include page="../common/head.jsp"></jsp:include>
	<div id="content">
		<div id="content-header">
			<h1>彩期配置</h1>
		</div>
		<div id="content-container">
			<div class="row">
				<div class="col-md-12">
				<!--
					<form action="${pageContext.request.contextPath }/system/issconf/list" id="form">
					<input type="hidden" name="pageNo" id="pageNo" value="1"/>
						<div class="form-group">
							<div class="col-md-10">
								<div class="row">
									<div class="col-md-3">
										<input type="submit" class="btn btn-success" value="查 询"></input>
										<a class="btn btn-primary popup-file" href="#add_game">新增彩期配置</a>
									</div>
								</div>
							</div><br/>
					</form>
-->
					<table class="table table-bordered table-highlight media-table">
						<thead>
							<tr>
								<th>彩种</th>
								<th>配置时间描述</th>
								<th>是否销售</th>
								<th class="text-center">操作</th>
							</tr>
						</thead>
						<c:if test="${not empty list}">
							<tbody>
								<c:forEach  var="item" items="${list}" varStatus="status">
									<form id="tab${item.id}" method="POST" action="${pageContext.request.contextPath }/system/issconf/del" >
									<input type="hidden" name="springMVC.token" value="${token1}" >
									<tr>
										<input type="hidden" name="id" value="${item.id }" />
										<td align="left">${item.gameType.desc}</td>
										<td align="left">
										<c:forEach  var="st" items="${fn:split(item.confiStr, '|')}" varStatus="status">
											开始日期 ： ${fn:split(st, '-')[0]}         截止日期： ${fn:split(st, '-')[1]}   
											<c:if test="${fn:split(st, '-')[2]>1}">
												每期：${fn:split(st, '-')[2]}分钟<br>
											</c:if>
											<c:if test="${fn:split(st, '-')[2]==1}">
												执行一期<br>
											</c:if>
										</c:forEach>
										</td>
										<td align="left"><c:if test="${item.isSale}">是</c:if><c:if test="${!item.isSale}">否</c:if></td>
										<td align="center">
										<c:if test="${!item.isSale}">
										  <a class="btn btn-xs btn-primary" onclick="isSell(true,${item.id})"><i class="fa fa-pencil">开启销售</i>
										  </a>
										  </c:if>
										  <c:if test="${item.isSale}">
										   <a class="btn btn-xs btn-secondary" href="javascript:;" onclick="isSell(false,${item.id})"><i class="fa fa-times">暂停销售</i>
										  </a>
										  </c:if>
										</td>
									</tr>
									</form>
								</c:forEach>
							<tbody>
						</c:if>
						<c:if test="${empty list}">
							<tr>
								<td colspan="7" style="color: #FF0000; font-size:15px;">暂时没有记录</td>
							</tr>
						</c:if>
					</table>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../common/foot.jsp"></jsp:include>
	<!-- target="hidden_frame" -->
	<form id="add_game" method="get" action="${pageContext.request.contextPath }/system/issconf/update" class="white-popup-block mfp-hide form-horizontal" style="max-width: 400px">
	<input type="hidden" name="springMVC.token" value="${token2}" >
		<h3 class="heading">添加游戏</h3>
		<div class="gameDiv form-group">
			<label class="col-md-4">彩种：</label>
			<div class="col-md-6">
				<select name="gameType" class="gametype form-control" >
					<c:forEach var="gametype" items="${gameTypeList}">
						<option value="${gametype}">${gametype.desc }</option>
					</c:forEach>
				</select>
				<!-- <input type="text" name="gameType" class="gameType form-control" />  -->
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-md-4">编号：</label>
			<div class="col-md-6">
				<input type="text" name="numberCode" class="form-control"/> 
			</div>
		</div>
		<div class="form-group">
			<label class="col-md-4">开始时间：</label>
			<div class="col-md-6">
				<input type="text" name="startTimer" class="form-control"/>
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-md-4">停售时间：</label>
			<div class="col-md-6">
				<input type="text" name="stopTimer" class="form-control"/>
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-md-4">是否销售：</label>
			<div class="col-md-6">
				  <label class="radio-inline">是<input type="radio" name='isSale' value="true" checked="true"/></label><label class="radio-inline">否<input type="radio" name='isSale' value="false" /></label>
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-md-4"></label>
			<div class="col-md-6">
				<input type="submit" class="addBtn btn btn-success" value="添加"/>
			</div>
		</div>
	</form>
</body>
</html>
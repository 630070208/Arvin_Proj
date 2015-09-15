<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="/WEB-INF/tld/util-tags.tld"%>
<%@ taglib prefix="page" uri="/WEB-INF/tld/page-tags.tld"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<head>
<title>游戏管理</title>
<jsp:include page="../common/headResources.jsp"></jsp:include>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/gameConfig.js"></script>
</head>
<body>
	<!-- 菜单 -->
	<jsp:include page="../common/head.jsp"></jsp:include>
	<div id="content">
		<div id="content-header">
			<h1>游戏管理</h1>
		</div>
		<div id="content-container">
			<div class="row">
				<div class="col-md-12">
					<form action="${pageContext.request.contextPath }/system/game/search">
						<div class="form-group">
							<div class="col-md-10">
								<div class="row">
									<div class="col-md-3">
										<select name="gameType" class="gametype form-control" >
											<c:forEach var="gametype" items="${gameType}">
												<option value="${gametype }">${gametype.desc }</option>
											</c:forEach>
										</select>
										<!-- <input type="text" name="gameType" class="form-control"> -->
									</div>
									<div class="col-md-3">
										<input type="submit" class="btn btn-success" value="查 询"></input>
										<a class="btn btn-primary popup-file" href="#add_game">新增游戏</a>
									</div>
								</div>
							</div><br/>
					</form>

					<table class="table table-bordered table-highlight media-table">
						<thead>
							<tr>
								<th>彩种</th>
								<th>玩法</th>
								<th>限号</th>
								<th>限注</th>
								<th>是否追号</th>
								<th>是否开启</th>
								<th class="text-center">操作</th>
							</tr>
						</thead>
						<c:if test="${page.result!=null}">
							<tbody>
								<c:forEach var="item" items="${page.result}" varStatus="status">
									<form id="tab${status.index }" method="POST" action="${pageContext.request.contextPath }/system/game/edit" >
									<tr>
										<input type="hidden" name="id" value="${item.id }" />
										<input type="hidden" name="gameType" value="${item.gameType}" />
										<input type="hidden" name="playType" value="${item.playType}" />
										<input type="hidden" name="maxMulti" value="${item.maxMulti}" />
										<input type="hidden" name="version" value="${item.version }" />
										<td align="left">${item.gameType.desc}</td>
										<td align="left">${item.playType.desc }</td>
										<td align="left"><input type="text" id="rstctCode${status.index }" value="${item.rstctCode}" /></td>
										<td align="left"><input type="number" id="rstctNumber${status.index }" value="${item.rstctNumber}" /></td>
										<td align="left">
											<label class="radio-inline">是<input type="radio" name='isZh${status.index }' value="true" <c:if test="${item.isZh }">checked</c:if> /></label>
											<label class="radio-inline">否<input type="radio" name='isZh${status.index }' value="false" <c:if test="${!item.isZh }">checked</c:if> /></label>
										</td>
										<td align="left">
											<label class="radio-inline">是<input type="radio" name='isOpen${status.index }' value="true" <c:if test="${item.isOpen }">checked</c:if> /></label>
											<label class="radio-inline">否<input type="radio" name='isOpen${status.index }' value="false" <c:if test="${!item.isOpen }">checked</c:if> /></label>
										</td>
										<td align="center"><a class="btn btn-xs btn-primary"
											onclick="editRecord(this,'${status.index}');"><i
												class="fa fa-pencil"></i>
										</a> &nbsp; <a class="btn btn-xs btn-secondary"
											href="#" onclick="delItem(${item.id});"><i
												class="fa fa-times"></i>
										</a></td>
									</tr>
									</form>
								</c:forEach>
							<tbody>
						</c:if>
						<c:if test="${page.result==null}">
							<tr>
								<td colspan="7" style="color: #FF0000; font-size:15px;">暂时没有记录</td>
							</tr>
						</c:if>
					</table>
					<div class="row dt-rb">
						<div class="col-sm-6"></div>
						<div class="col-sm-6">
							<div class="dataTables_paginate paging_bootstrap">
								<c:if test="${page.result!=null}">
									<form method="post" id="form" action="/system/game/list">
										<jsp:include page="../common/pager.jsp"></jsp:include>
									</form>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../common/foot.jsp"></jsp:include>
	<!-- target="hidden_frame" -->
	<form id="add_game" method="post" action="${pageContext.request.contextPath }/system/game/edit"
		class="white-popup-block mfp-hide form-horizontal">
		<h3 class="heading">添加游戏</h3>
		<div class="gameDiv form-group">
			<label class="col-md-2">彩种：</label>
			<div class="col-md-10">
				<select name="gameType" class="gametype form-control" onchange="seleChange();">
					<c:forEach var="gametype" items="${gameType}">
						<option value="${gametype }">${gametype.desc }</option>
					</c:forEach>
				</select>
				<!-- <input type="text" name="gameType" class="gameType form-control" />  -->
			</div>
		</div>
		<div class="playDiv form-group">
			<label class="col-md-2">玩法：</label>
			<div class="col-md-10">
				<select name="playType" name="playtype" class="playtype form-control">
					
				</select>
				<!-- <input type="text" name="playType" class="playType form-control" />  -->
			</div>
		</div>
		<div class="form-group">
			<label class="col-md-2">限号：</label>
			<div class="col-md-10">
				<input type="text" name="rstctCode" class="rstctCode form-control" /> 
			</div>
		</div>
		<div class="form-group">
			<label class="col-md-2">限注：</label>
			<div class="col-md-10">
				<input type="number" name="rstctNumber" class="rstctNumber form-control" />
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-md-2">最大返点：</label>
			<div class="col-md-10">
				<input type="number" name="maxMulti" class="maxMulti form-control" />
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-md-2">是否追号：</label>
			<div class="col-md-10">
				  <label class="radio-inline">是<input type="radio" name='isZh' value="true"/></label><label class="radio-inline">否<input type="radio" name='isZh' value="false" checked="true"/></label>
			</div>
		</div>
		<div class="form-group">
			<label class="col-md-2">是否开启：</label>
			<div class="col-md-10">
				<label class="radio-inline">是<input type="radio" name='isOpen' value="true" checked="true"/></label><label class="radio-inline">否<input type="radio" name='isOpen' value="false" /></label>
			</div>
		</div>
		<div class="form-group">
			<div class="col-md-10">
				<input type="submit" class="addBtn btn btn-success" value="添加"/>
			</div>
		</div>
	</form>
</body>
</html>
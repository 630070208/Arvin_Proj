<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>添加用户</title>
<jsp:include page="../common/headResources.jsp"></jsp:include>
</head>
<body>
	<!-- 菜单 -->
	<jsp:include page="../common/head.jsp"></jsp:include>
	<div id="content">
		<div id="content-header">
			<h1>游戏设置</h1>
		</div>
		<div id="content-container">
			<div class="row">
				<div class="col-md-12">
					<form action="/sys/system/rebate/edit">
						<div class="form-group">
							<div class="col-md-10">
								<input type="hidden" name="config.maxPrize" value="200000">
								<div class="row">
									<div class="col-md-3">
										彩种：<input type="text" class="form-control" style="width: 250px;display: inline" name="config.gametype">
									</div>
									<div class="col-md-3">
										彩种：<input type="text" class="form-control" style="width: 250px;display: inline" name="config.playtyep">
									</div>
									<div class="col-md-3" style="width:6%!important" >
										<input type="submit" class="btn btn-success" style="display: inline" name="config.playtyep" value="查询">
									</div>
									<div class="col-md-3">
										<input type="button" id="add" class="btn btn-info" style="display: inline" onclick="addRecord(this);" name="config.add" value="添加">
										<a class="btn btn-primary popup-file" href="#upload_form" style="display:none"></a>
									</div>
								</div>
							</div>
						</div>
					</form>
					<table id="sysPrizeTab" class="table table-bordered table-highlight">
						<thead>
							<tr>
								<th>游戏玩法</th>
								<th>限号（元）</th>
								<th>限注（元）</th>
								<th>是否追号（元）</th>
								<th>是否开启</th>
								<th>操作</th>
							</tr>
						</thead>
						<c:if test="${page.result!=null}">
							<tbody>
								<c:forEach var="item" items="${page.result}" varStatus="status">
									<tr>
										<td>${item.gametype}-${item.playtype.desc} </td>
										<td><input type="text" name="maxPrize" value="${item.maxPrize}" /></td>
										<td><input type="text" name="minPrize" value="${item.minPrize}" /></td>
										<td><input type="text" name="sysDeduct" value="${item.sysDeduct}" /></td>
										<td><input type="text" name="rebate" value="${item.rebate}" /></td>
										<td><input type="text" name="ewsRebate" value="${item.ewsRebate}" /></td>
										<td align="center"><a class="btn btn-xs btn-primary" onclick="editRecord(this)" title="编辑" >
										<i class="fa fa-pencil"></i></a><input type="hidden" value="${item.id }" /><input type="hidden" value="${item.gametype }" />
										<input type="hidden" value="${item.playtype }" /><input type="hidden" value="${item.isRelocate }" />&nbsp; <a class="btn btn-xs btn-secondary" title="删除"
											href="del?id=${item.id}"><i class="fa fa-times"></i>
										</a></td>
									</tr>
								</c:forEach>

							</tbody>
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
	<form id="upload_form" method="post" action="add"
		class="white-popup-block mfp-hide form-horizontal">
		<h3 class="heading">[奖金/返点]编辑</h3>
		<input type="hidden" class="edit_id" name="id" />
		<div class="gameDiv form-group" style="display:none">
			<label class="col-md-2">游戏：</label>
			<div class="col-md-10">
				<select name="gametype" class="gametype form-control" onchange="seleChange();">
					<c:forEach var="gametype" items="${gameType}">
						<option value="${gametype }">${gametype.desc }</option>
					</c:forEach>
				</select>
				<!-- <input type="text" name="gametype" class="gametype form-control" required="required" />  -->
			</div>
		</div>
		<div class="playDiv form-group" style="display:none">
			<label class="col-md-2">玩法：</label>
			<div class="col-md-10">
				<select name="playtype" name="playtype" class="playtype form-control">
					
				</select>
				<!-- <input type="text" name="playtype" class="playtype form-control" required="required" />  -->
			</div>
		</div>
		<div class="form-group">
			<label class="col-md-2">最高奖金：</label>
			<div class="col-md-10">
				<input type="number" name="maxPrize" class="maxPrize form-control" required="required" /> 
			</div>
		</div>
		<div class="form-group">
			<label class="col-md-2">最低奖金：</label>
			<div class="col-md-10">
				<input type="number" name="minPrize" class="minPrize form-control" required="required" />
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-md-2">系统保留：</label>
			<div class="col-md-10">
				<input type="number" name="sysDeduct" class="sysDeduct form-control" required="required" />
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-md-2">模&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;式：</label>
			<div class="col-md-10">
				  <label class="radio-inline">浮动模式：<input type="radio" name='isRelocate' value="ture"/></label><label class="radio-inline">固定模式：<input type="radio" name='isRelocate' value="false"/></label>
			</div>
		</div>
		<div class="form-group">
			<label class="col-md-2">返&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;点：</label>
			<div class="col-md-10">
				<input type="number" name="rebate" class="rebate form-control"  style="display: inline" required="required"/>
			</div>
		</div>
		<div class="form-group">
			<label class="col-md-2">不定位返点：</label>
			<div class="col-md-10">
				<input type="number" name="ewsRebate" class="ewsRebate form-control"  style="display: inline" required="required"/>
			</div>
		</div>
		<div class="form-group">
			<div class="col-md-10">
				<input type="button" class="addBtn btn btn-success" style="display:none" value="添加"/>
			</div>
		</div>
	</form>
</body>
</html>

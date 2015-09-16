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
			<h1>提现请求</h1>
		</div>
		<form id="form"  action="${pageContext.request.contextPath }/system/business/txr/list" method="post">
		<div id="content-container">
		   <c:if test="${page!=null}">
			<jsp:include page="../common/pager.jsp"/>
			</c:if>
			<div class="row">
				<div class="col-md-12">
						<br/>
					</form>
					<table class="table table-bordered table-highlight media-table">
						<thead>
							<tr>
								<th>出现顺序</th>
								<th>用户名</th>
								<th>提现金额</th>
								<th>银行类型</th>
								<th>开户地点</th>
								<th>开户姓名</th>
								<th>银行账号</th>
								<th>申请时间</th>
								<th class="text-center">操作</th>
							</tr>
						</thead>
						<c:if test="${page!=null}">
							<tbody>
								<c:forEach var="item" items="${page.result}" varStatus="status">
									<tr>
										<td align="left">${status.index+1 }</td>
										<td align="left">${item.member}</td>										
										<td align="left">
									     ${item.money }
										</td>
										<td align="left">
                                       ${item.userBank.bankName }
                                         </td>
										<td align="left">
										   ${item.userBank.blankAdd }
									</td>
										<td align="left">
									   ${item.userBank.realName }	
											</td>
										<td align="center">
									 ${item.userBank.bankCode }	
										</td>
									<td align="center">
								<fmt:formatDate value="${item.datetime.time}" pattern="yyyy-MM-dd HH:mm:ss"/> 
										</td>
										<td align="center"> 
										 
										      <a class="btn btn-primary popup-file" onclick="modifyTzContent(${item.id},this)" href="javascript:;" >
											<i class="fa">处理</i></a>
										</td>
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
									<%-- <page:pager url="/gameConfig/index" pageSize="${page.pageSize}" totalRecord="${page.totalRecord}" curPage="${page.nowPage}" totalPage="${page.totalPage}" param="${params}"/> --%>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../common/foot.jsp"></jsp:include>
	
	<form id="upload_form" method="post" action="${pageContext.request.contextPath }/system/business/txr/modify"
		class="white-popup-block mfp-hide form-horizontal">
		<h3 class="heading">修改投注号码</h3>
		<input type="hidden" id="gameorderid" name="gameOrderID" />
		<div class="form-group">
			<label class="col-md-2">提现银行：</label>
			<div class="col-md-10">
				<input id="txBlank" type="text"  style="width:200px!important;"  name="drawMoney.userBlank.bankName" class="maxPrize form-control" required="required"/> 
			</div>
		</div>
		<div class="form-group">
			<label class="col-md-2">开户姓名：</label>
			<div class="col-md-10">
				<input id="txRealName" type="text"  style="width:200px!important;"  name="drawMoney.userBlank.realName" class="maxPrize form-control" required="required"/> 
			</div>
		</div>
		<div class="form-group">
			<label class="col-md-2">银行账号：</label>
			<div class="col-md-10">
				<input id="txBlankNo" type="text"  style="width:200px!important;"  name="drawMoney.userBlank.bankCode" class="maxPrize form-control" required="required"/> 
			</div>
		</div>
		<div class="form-group">
			<label class="col-md-2">提现金额：</label>
			<div class="col-md-10">
				<input id="txMoney" type="text"  style="width:200px!important;"  name="drawMoney.money" class="maxPrize form-control" required="required"/> 
			</div>
		</div>
		<div class="form-group">
			<label class="col-md-2">处理结果：</label>
			<div class="col-md-10">
				<div class="result-float">成功</div>  <div class="result-float">失败</div>
			</div>
		</div>
		<div class="form-group">
			<label class="col-md-2" id = "fialReason">失败原因：</label>
			<div class="col-md-10">
				<input id="modifyTzContent" type="text"  style="width:250px!important;"  name="betCode" class="maxPrize form-control" required="required"/> 
			</div>
		</div>
		<div class="form-group">
			<div class="col-md-10">
				<input type="button" id="submit_id"  class="addBtn btn btn-success" value="处理"/>
				<input type="button"   class="addBtn btn btn-success" value="取消"/>
			</div>
		</div>
	</form>
	
	
</body>
</html>
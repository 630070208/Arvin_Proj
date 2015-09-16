<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="/WEB-INF/tld/util-tags.tld"%>
<%@ taglib prefix="page" uri="/WEB-INF/tld/page-tags.tld"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<head>
<title>业务流水-充值记录</title>
<jsp:include page="../common/headResources.jsp"></jsp:include>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/business/cztx.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/common/ajax_request.js"></script>
<style type="text/css">
table{
	width:30em;
	table-layout:fixed;/* 只有定义了表格的布局算法为fixed，下面td的定义才能起作用。 */
}
td{
	width:100%;
	word-break:keep-all;/* 不换行 */
	white-space:nowrap;/* 不换行 */
	overflow:hidden;/* 内容超出宽度时隐藏超出部分的内容 */
	text-overflow:ellipsis;/* 当对象内文本溢出时显示省略标记(...) ；需与overflow:hidden;一起使用。*/
}
</style>
<script>
  $(function(){
       if('${nickname}' != null){
           $("#nickName").val("${nickname}");
       }  
       if('${walletDetail.type}' != null){
           $("#walletDetailType").val('${walletDetail.type}');
       }
       if("${startTime}" != null){
          $("#startTime").val("${startTime}");
       }
       if("${endTime}" != null){
         $("#endTime").val("${endTime}");
       }
  });
</script>


</head>
<body>
	<!-- 菜单 -->
	<jsp:include page="../common/head.jsp"></jsp:include>
	<div id="content">
		<div id="content-header">
			<h3>帐变明细</h3>
		</div>
		<form id="form" action="${pageContext.request.contextPath }/system/business/cztk/list" method="post">
		<input type="hidden" name="springMVC.token" value="${token1}">
			<div id="content-container">
				<div class="row">
					<div class="col-md-12">
						<div class="form-group">
							<div class="col-md-10">
								<div class="row">
									<div class="col_div">
										<div class="label_form">用户名:<input type="text" id="nickName" name="nickname" style="width:10em;" value='${paraMap["nickname"]}'class="form-control"></div>
										<div class="label_form">起始日期:<input type="text" id="startTime" name="startTime" style="width:10em;" class="form-control ui_timepicker"></div>
										<div class="label_form">结束日期:<input type="text" id="endTime" name="endTime" style="width:10em;" class="form-control ui_timepicker"></div>
										<div class="label_form">类型: <select class="gametype form-control" id="walletDetailType" name="type">
												<option value="">全部</option>
												<c:forEach var="type" items="${typys}">
													<option value="${type}">${type}</option>
												</c:forEach>
											</select>
										</div>
										<div class="btn_form"><input type="reset" onclick="resetCondition()" class="btn btn-success" value="重置条件"></input></div>
										<div class="btn_form"><input type="button" id="sreachByCondition" class="btn btn-success" value="查 询"></input></div>
									</div>
								</div>
							</div>
						</div>

						</form>
						<table class="table table-bordered table-highlight media-table">
							<thead>
								<tr>
									<th width="90px;">用户名</th>
									<th width="50px;">测试</th>
									<th width="80px;">变动金额</th>
									<th width="80px;">变动前</th>
									<th width="80px;">变动后</th>
									<th width="50px;">变动类型</th>
									<th>备注</th>
									<th width="150px;">时间</th>
									<th width="50px;" class="text-center">操作</th>
								</tr>
							</thead>
							<c:if test="${page!=null}">
								<tbody>
									<c:forEach var="item" items="${page.result}">
										<tr>
											<td align="left">${item.member.syscode}</td>
											<td align="left">
												<c:choose><c:when test="${item.member.istest}"> 是 </c:when>
													<c:otherwise>否</c:otherwise>
												</c:choose>
											</td>
											<td align="left">${item.amount }</td>
											<td align="left">${item.beforeBalance}</td>
											<td align="left">${item.beforeBalance+item.amount}</td>
											<td>${item.type }</td>
											<td align="left" title="${item.descr}">${item.descr}</td>
											<td align="left"><fmt:formatDate value="${item.time.time}" pattern="yyyy-MM-dd HH:mm:ss" />
											</td>
											<td align="center"><a class="btn btn-xs btn-secondary" onclick="delWalletWithID(${item.id})" href="javascript:;"><i class="fa fa-times"></i> </a></td>
										</tr>
									</c:forEach>
								</tbody>
							</c:if>
							<c:if test="${page==null}">
								<tr>
									<td colspan="9" style="color: #FF0000; font-size:15px;">暂时没有记录</td>
								</tr>
							</c:if>
						</table>
						<div class="row dt-rb">
							<div class="col-sm-6"></div>
							<div class="col-sm-6">
								<div class="dataTables_paginate paging_bootstrap">
									<c:if test="${page!=null}">
										<jsp:include page="../common/pager.jsp" />
									</c:if>
								</div>
							</div>
						</div>
	</div>
	<jsp:include page="../common/foot.jsp"></jsp:include>
	
	<!-- 删除流水的时候会提交这个form 避免暴露id -->
	<form id="delForm" action="${pageContext.request.contextPath }/system/business/cztk/del" method="post">
		<input type="hidden" name="springMVC.token" value="${token2}">
		<input type="hidden" name="walletDetailId" id="walletDetailId" />
	</form>
</body>
</html>
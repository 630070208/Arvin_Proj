<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="/WEB-INF/tld/util-tags.tld"%>
<%@ taglib prefix="page" uri="/WEB-INF/tld/page-tags.tld"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<head>
<title>会员管理-登录日志</title>
<jsp:include page="../common/headResources.jsp"></jsp:include>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/business/logindetail.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/common/ajax_request.js"></script>
<script>
  $(function(){
      if(null != '${startTime}')
        $("#startTime").val('${startTime}');
      if(null != '${endTime}')
        $("#endTime").val('${endTime}');
      if(null != '${nickname}')
        $("#nickname").val('${nickname}');
  });
</script>


</head>
<body>
	<!-- 菜单 -->
	<jsp:include page="../common/head.jsp"></jsp:include>
	<div id="content">
		<div id="content-header">
			<h3>登录日志</h3>
		</div>
		<form id="form"  action="${pageContext.request.contextPath }/system/memberlog/list" method="post">
		<input type="hidden" name="springMVC.token" value="${token1}">
		<div id="content-container">
			<div class="row">
				<div class="col-md-12">
						<div class="form-group">
							<div class="col-md-10">
								<div class="row">
									<div class="col_div" >
										
										<div class="label_form" style="height: 40px;height: 40px;">开始时间:
										<input type="text" id="startTime"  name="startTime" style="width:8em;" class="form-control ui_timepicker">
									    </div>
									    <div class="label_form" style="height: 40px;height: 40px;">结束时间：
											<input type="text" id="endTime"   name="endTime" style="width:8em;" class="form-control ui_timepicker">
									    </div>
									   
									   <div class="label_form" style="height: 40px;height: 40px;">昵称:
									   <input type="text" id="nickname"  style="width:8em;" name="nickname" style="width:15em;" class="form-control">
									   </div>
									    <div class="btn_form">
									       <input type="reset" onclick="resetCondition()" class="btn btn-success" value="重置条件"></input>
									    </div>		
									    <div class="btn_form">
									    <input type="button" id="sreachByCondition" class="btn btn-success" value="查 询"></input></div>
									   </div>
									</div>
								</div>
							</div><br/>
					</form>
					<table class="table table-bordered table-highlight media-table">
						<thead>
							<tr>
								<th>ID</th>
								<th>用户名</th>
								<th>IP</th>
								<th>参考地址</th>
								<th>浏览器</th>
								<th>登录时间</th>
								<th class="text-center">操作</th>
							</tr>
						</thead>
						<c:if test="${page!=null}">
							<tbody>
							<!-- 删除流水的时候会提交这个form 避免暴露id -->
							<form id="delForm" action="${pageContext.request.contextPath }/system/memberlog/del" method="post">
							   <input type="hidden" name="springMVC.token" value="${token2}">
							   <input type="hidden" name="id" id="memberlogid"  />
							 </form>
								<c:forEach var="item" items="${page.result}">
									<tr>
										<td align="left">${item.id}</td>
										<td align="left">${item.member}</td>
										
										<td align="left">${item.loginIp }</td>
										<td align="left">
											${item.districtIp}
										</td>
										<td align="left">
											${item.sourceUrl}
										</td>
										    <td align="center">
										    <fmt:formatDate value="${item.loginTime.time }" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
										<td align="center"> 
										<a class="btn btn-xs btn-secondary" onclick="findOnlyP(this);" href="javascript:;">
											<i class="fa">只看此人</i>
										</a>
										<a class="btn btn-xs btn-secondary" onclick="delMemberId(${item.id})" href="javascript:;">
											<i class="fa fa-times"></i>
										</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</c:if>
						<c:if test="${page==null}">
							<tr>
								<td colspan="15" style="color: #FF0000; font-size:15px;">暂时没有记录</td>
							</tr>
						</c:if>
					</table>
					<div class="row dt-rb">
						<div class="col-sm-6"></div>
						<div class="col-sm-6">
							<div class="dataTables_paginate paging_bootstrap">
								<c:if test="${page!=null}">
									<jsp:include page="../common/pager.jsp"/>
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
</body>
</html>
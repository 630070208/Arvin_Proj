<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="/WEB-INF/tld/util-tags.tld"%>
<%@ taglib prefix="page" uri="/WEB-INF/tld/page-tags.tld"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<head>
<title>消息列表</title>
<jsp:include page="../common/headResources.jsp"></jsp:include>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/business/cztx.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/common/ajax_request.js"></script>


</head>
<body>
	<!-- 菜单 -->
	<jsp:include page="../common/head.jsp"></jsp:include>
	<div id="content">
		<div id="content-header">
			<h3>消息列表</h3>
		</div>
		<form id="form"  action="${pageContext.request.contextPath }/system/sysmsg" method="post">
		<input type="hidden" name="springMVC.token" value="${token1}">
		<div id="content-container">
			<div class="row">
				<div class="col-md-12">
						<div class="form-group">
							<div class="col-md-10">
								<div class="row">
									<div class="col_div" >
										<div class="label_form">起始日期:<input type="text" id="startTime" name="startTime" style="width:15em;"  class="form-control ui_timepicker"></div>
										<div class="label_form">结束日期:<input type="text"  id="endTime" name="endTime" style="width:15em;" class="form-control ui_timepicker"></div>
									    <div class="btn_form"><input type="reset" onclick="resetCondition()" class="btn btn-success" value="重置条件"></input></div>		
									    <div class="btn_form"><input type="button" id="sreachByCondition" class="btn btn-success" value="查 询"></input></div>
									   </div>
									</div>
								</div>
							</div><br/>
					</form>
					<table class="table table-bordered table-highlight media-table">
						<thead>
							<tr>
								<th>发件人</th>
								<th>标题</th>
								<th>内容</th>
								<th>状态</th>
								<th>发送时间时间</th>
								
								<th class="text-center">操作</th>
							</tr>
						</thead>
						<c:if test="${page!=null}">
							<tbody>
	                           <td></td>
	                            <td></td>
	                             <td></td>
	                              <td></td>
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
	
	<form id="content_form" method="post" 
		class="white-popup-block mfp-hide form-horizontal">
		<input type="hidden" name="springMVC.token" value="${token3}">
		<h3 class="heading">消息内容</h3>
		<input type="hidden" id="gameorderid" name="gameOrderID" />
		<div class="form-group">
			<label class="col-md-2">内容：</label>
			<div class="col-md-10">
				<textarea rows="5" cols="35" id="contentmsg" readonly="readonly">
				</textarea>
			</div>
		</div>
		<div class="form-group">
			<div class="col-md-10">
				<input type="button" onclick="closeDialog();"  class="addBtn btn btn-success" value="关闭"/>
			</div>
		</div>
	</form>
	
	
	
	
	<form id="send_form" method="post"  
		class="white-popup-block mfp-hide form-horizontal">
		<input type="hidden" name="springMVC.token" value="${token3}">
		<h3 class="heading">发消息</h3>
		<input type="hidden" id="gameorderid"   name="gameOrderID" />
		<div class="form-group">
			<label class="col-md-2">收信人：</label>
			<div class="col-md-10">
				<input type="text" id="resivePerson" name="syscode" readonly="readonly" style="width:10em;" value='' class="form-control">
				<input type="hidden" name="id" value="" />
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-md-2">消息标题：</label>
			<div class="col-md-10">
				<input type="text" id="resiveTitle" name="title" style="width:10em;" value='' class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label class="col-md-2">消息内容：</label>
			<div class="col-md-10">
				<textarea rows="5" cols="35" name="content" id="resivecontent">
				</textarea>
			</div>
		</div>
		<div class="form-group">
			<div class="col-md-10">
				<input type="button" onclick="sendMsg();"  class="addBtn btn btn-success" value="发送"/>
			</div>
		</div>
	</form>
	
	
	
	
	
	<form id="send_public_form" method="post" 
		class="white-popup-block mfp-hide form-horizontal">
		<input type="hidden" name="springMVC.token" value="${token3}">
		<h3 class="heading">发消息</h3>
		<input type="hidden" id="gameorderid" name="gameOrderID" />
		<div class="form-group">
			<label class="col-md-2">收信人：</label>
			<div class="col-md-10">
				<input type="text"  id="public_syscode" name="syscode" style="width:10em;"  placeholder="空表示广播信息" value='' class="form-control">
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-md-2">消息标题：</label>
			<div class="col-md-10">
				<input type="text" id="publictitle"  name="title" style="width:10em;" value='' class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label class="col-md-2">消息内容：</label>
			<div class="col-md-10">
				<textarea rows="5" cols="35" id="publiccontent" name="content" >
				</textarea>
			</div>
		</div>
		<div class="form-group">
			<div class="col-md-10">
				<input type="button" onclick="sendMsgToPublic();"  class="addBtn btn btn-success" value="发送"/>
			</div>
		</div>
	</form>
	
</body>
</html>
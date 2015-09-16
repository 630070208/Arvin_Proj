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
<script>
  $(function(){
       if('${syscode}' != null){
           $("#syscode").val("${syscode}");
       }  
       if("${startTime}" != null){
          $("#startTime").val("${startTime}");
       }
       if("${endTime}" != null){
         $("#endTime").val("${endTime}");
       }
  });
  
  
  function reply(id,t){
	  //发送信息的人的id
	  
	  //根据发信人的id查发信人的账号
	  ajaxRequest("/member/findsyscode",{"id":id},"post",sucResult);
	  
	  t.href="#send_form";
	  $("#resivePerson").next().val(id);
  }
  
  function sucResult(data){
     //将返回回来的账号写到输入框中	  
     alert(data.re);
     $("#resivePerson").val(data.re);
  }
  
  var gId;
  function detail(id,t){
	  //id为每条记录的id   t为this
	  $("#contentmsg").val($(t).prev().val());
	  gId= id;
	  t.href="#content_form";
	 // ajaxRequest("/system/changeStatus",data,"post",resultHandler);
  }
  function  result(data){
	  if(data.code=="操作成功"){
		  window.location.reload();
	  }
  }
  
  function  closeDialog(){
	  var data={"id":gId};
	  ajaxRequest("/system/chgStatus",data,"post",result);
  }
  
  
  
  function sendMsg(){
	  
	  if($("#resiveTitle").val()=="" || $("#resiveTitle").val()==null ){
		  
		  alert("标题必填");
		  return ;
	  }
	  if($("#resivecontent").val()=="" || $("#resivecontent").val()==null) {
		  alert("内容必填");
		  return;
	  }
	   var data={"syscode":$("#resivePerson").val(),"title":$("#resiveTitle").val(),"content":$("#resivecontent").val()};
	   ajaxRequest("/system/saveSend",data,"post",sendResult);
  }
  
  function sendMsgToPublic(){
	  
	  if($("#publictitle").val()=="" || $("#publictitle").val()==null){
		  alert("标题必填");
		  return;
	  }
	  if($("#publiccontent").val()=="" || $("#publiccontent").val()==null) {
		  alert("内容必填");
		  return;
	  }
	  var data={"syscode":$("#public_syscode").val(),"title":$("#publictitle").val(),"content":$("#publiccontent").val()};
	  ajaxRequest("/system/saveSend",data,"post",sendResult);
  }
  
  function sendResult(data){
	  alert(data.code);
	  window.location.reload();
  }
  
  
  /*
    删除
  */
  
  function del(id){
	  alert(id);
	  if(confirm("您确认删除这条记录吗？")){
	     ajaxRequest("/system/del",{"id":id},"post",sendResult);
	  }
  }
  
  
  
</script>


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
										<div class="label_form">账号:<input type="text" id="syscode" name="syscode" style="width:10em;" value='${paraMap["nickname"]}' class="form-control"></div>
										<div class="label_form">起始日期:<input type="text" id="startTime" name="startTime" style="width:15em;"  class="form-control ui_timepicker"></div>
										<div class="label_form">结束日期:<input type="text"  id="endTime" name="endTime" style="width:15em;" class="form-control ui_timepicker"></div>
									    <div class="btn_form"><input type="reset" onclick="resetCondition()" class="btn btn-success" value="重置条件"></input></div>		
									    <div class="btn_form"><input type="button" id="sreachByCondition" class="btn btn-success" value="查 询"></input></div>
									    <div class="btn_form">
									   <a class="btn btn-xs btn-secondary popup-file"  href="#send_public_form" >
											<i class="fa">发消息</i>
										</a>
										
										 <a class="btn btn-xs btn-secondary"  href="#" >
											<i class="fa">历史消息记录</i>
										</a>
									    </div>
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
							<!-- 删除流水的时候会提交这个form 避免暴露id -->
							<form id="delForm" action="${pageContext.request.contextPath }/system/business/cztk/del" method="post">
							    <input type="hidden" name="springMVC.token" value="${token2}">
							     <input type="hidden" name="walletDetailId" id="walletDetailId"  />
							 </form>
								<c:forEach var="item" items="${page.result}">
									
									<tr>
										<td align="left">${item.sandName }</td>
										<td align="left">${item.title}</td>
										<td align="left">
										<c:set var="conStr" value="${item.content }"  />
											<c:choose>  
											    <c:when test="${fn:length(conStr) > 5}">  
											        <c:out value="${fn:substring(conStr, 0, 5)}......" />  
											    </c:when>  
											   <c:otherwise>  
											      <c:out value="${conStr}" />  
											    </c:otherwise>  
											</c:choose> 
											<input type="hidden" value="${item.content}" /> 
											<a class="btn btn-xs btn-success popup-file" onclick="detail('${item.id}',this)" href="javascript:;">
											     <i class="fa">查看</i>
										    </a> 
										</td>
										<td align="left">
										<c:choose>
										  <c:when test="${item.state=='0' }">未读</c:when>
										  <c:when test="${item.state=='1' }">已读</c:when>
										</c:choose>
										</td>
										<td align="left">
										<fmt:formatDate value="${item.time.time}" pattern="yyyy-MM-dd HH:mm:ss"/> 
										</td>
										<td align="center"> 
										<a class="btn btn-xs btn-secondary" onclick="del('${item.id}')" href="javascript:;">
											<i class="fa fa-times"></i>
										</a>
										
										<a class="btn btn-xs btn-secondary popup-file" onclick="reply('${item.sendId}',this)" href="javascript:;">
											<i class="fa">回复</i>
										</a>
										</td>
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
				<textarea rows="5" cols="35"  name="content" id="resivecontent"></textarea>
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
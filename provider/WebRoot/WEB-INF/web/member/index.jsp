<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="/WEB-INF/tld/util-tags.tld"%>
<%@ taglib prefix="page" uri="/WEB-INF/tld/page-tags.tld"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<head>
<title>会员管理-</title>
<jsp:include page="../common/headResources.jsp"></jsp:include>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/business/member.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/common/ajax_request.js"></script>
<script>
  $(function(){
      if(null != '${member.syscode}')
        $("#syscode").val('${member.syscode}');
      if(null != '${member.state}')
        $("#state").val('${member.state}');
      if(null != '${member.qq}')
        $("#qq").val('${member.qq}');
        
      if(null != '${member.nickname}')
        $("#nickname").val('${member.nickname}');
      if(null != '${member.loginIp}')
        $("#loginIp").val('${member.loginIp}');
      if(null != '${member.actDay}')
        $("#actDay").val('${member.actDay}');
      if(null != '${member.userType}')
        $("#userType").val('${member.userType}');
      if(null != '${startTime}')
        $("#startTime").val('${startTime}');
      if(null != '${endTime}')
        $("#endTime").val('${endTime}');
      if(null != '${isZDL}'){
          $("#isZDL").attr("checked", true);
      }  
  });
</script>


</head>
<body>
	<!-- 菜单 -->
	<jsp:include page="../common/head.jsp"></jsp:include>
	<div id="content">
		<div id="content-header">
			<h3>会员基本信息</h3>
		</div>
		<form id="form"  action="${pageContext.request.contextPath }/system/member/list" method="post">
		<input type="hidden" name="springMVC.token" value="${token1}">
		<input type="hidden" name="istest" value="${istest}">
		<div id="content-container">
			<div class="row">
				<div class="col-md-12">
						<div class="form-group">
							<div class="col-md-10">
								<div class="row">
									<div class="col_div" >
										<div class="label_form" style="height: 40px;height: 40px;">会员账号:<input type="text" id="syscode" name="syscode" style="width:10em;" class="form-control"></div>
										<div class="label_form" style="height: 40px;height: 40px;">状态:
										 <select class="gametype form-control" id="state" name="state">
										      <option value="">全部</option>
										      <option value="正常">正常</option>
										      <option value="锁定">锁定</option>
										      <option value="注销">注销</option>
									    </select>
										</div>
										<div class="label_form" style="height: 40px;height: 40px;">QQ号码:
										<input type="text" style="width:8em;" id="qq"  name="qq" style="width:15em;" class="form-control">
										</div>
										<div class="label_form" style="height: 40px;height: 40px;">开始时间:
										<input type="text" id="startTime"  name="startTime" style="width:8em;" class="form-control ui_timepicker">
									    </div>
									    <div class="label_form" style="height: 40px;height: 40px;">结束时间：
											<input type="text" id="endTime"   name="endTime" style="width:8em;" class="form-control ui_timepicker">
									    </div>
									    <div class="label_form" style="height: 40px;height: 40px;">会员组:
									    <select class="gametype form-control" id="userType" name="userType">
										      <option value="">全部</option>
										      <option value="会员"> 会员</option>
										      <option value="代理">代理</option>
										      <option value="总代理">总代理</option>
									    </select>
									   </div>
									   <div class="label_form" style="height: 40px;height: 40px;">昵称:
									   <input type="text" id="nickname"  style="width:8em;" name="nickname" style="width:15em;" class="form-control">
									   </div>
									   <div class="label_form" style="height: 40px;height: 40px;">登录IP:
									   <input type="text"  style="width:8em;" id="loginIp" name="loginIp" style="width:15em;" class="form-control">
									   </div>
									    <div class="label_form" style="height: 40px;height: 40px;">活跃天数:
									       <input type="text"  style="width:8em;" id="actDay"  name="actDay" style="width:15em;" class="form-control">
									   </div>
									    <div class="label_form" style="height: 40px;height: 40px;">
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
								<th>会员账号</th>
								<th>昵称</th>
								<th>是否是测试账号</th>
								<th>活跃天数</th>
								<th>所在组</th>
								<th>登录IP</th>
								<th>状态</th>
								<th>账户资金</th>
								<th>最后一次登录时间</th>
								<th class="text-center">操作</th>
							</tr>
						</thead>
						<c:if test="${page!=null}">
							<tbody>
							<!-- 删除流水的时候会提交这个form 避免暴露id -->
							<form id="delForm" action="${pageContext.request.contextPath }/system/member/del" method="post">
							  <input type="hidden" name="springMVC.token" value="${token2}">
							   <input type="hidden" name="id" id="memberId"  />
							 </form>
								<c:forEach var="item" items="${page.result}">
									<tr>
										<td align="left">${item.syscode}</td>
										<td align="left">${item.nickname}</td>
										<td align="left">
										<c:choose>
											 <c:when test="${item.istest}">
											   是
											 </c:when>
											  <c:otherwise>
											    否
											  </c:otherwise>
										</c:choose>
										</td>
										<td align="left">${item.actDay }</td>
										<td align="left">${item.userType}</td>
										<td align="left">${item.loginIp}</td>
											<td align="center">${item.state}</td>
											<td>${item.money}</td>
										<td align="center">
										   <fmt:formatDate value="${item.lastLogTime.time}" pattern="yyyy-MM-dd HH:mm:ss"/> 
										</td>
										     <td align="center"> 
										     <a class="btn btn-xs btn-secondary popup-file" onclick="modify(${item.id},'modify',this)" href="javascript:;">
											 <i class="fa">修改</i>
										     </a>
										      <a class="btn btn-xs btn-secondary popup-file" onclick="showFandian(${item.id},this);" href="javascript:;">
											     <i class="fa">查看返点</i>
										     </a>
										     <c:if test="${item.userType=='总代理'}">
											      <a class="btn btn-xs btn-secondary popup-file" onclick="showpe(this,${item.id})" href="javascript:;">
												 <i class="fa">查看配额</i>
											     </a>
										     </c:if>
										      <a class="btn btn-xs btn-secondary" onclick="zhmx('${item.nickname}');" href="javascript:;">
												 <i class="fa">账户明细</i>
											     </a>
										      <a class="btn btn-xs btn-secondary popup-file" onclick="modify(${item.id},'detail',this)" href="javascript:;">
												 <i class="fa">详情</i>
											   </a>
											    <a class="btn btn-xs btn-secondary" onclick="javascript:window.location.href='/system/member/banklist?memberId=${item.id}';" href="javascript:;">
												 <i class="fa">银行详情</i>
											   </a>
										      <a class="btn btn-xs btn-secondary" onclick="del(${item.id});" href="javascript:;">
											 <i class="fa fa-times"></i>
										     </a>
										 </td>
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
	
	
	<form id="upload_form" method="post" action="${pageContext.request.contextPath }/system/member/modify"
		class="white-popup-block mfp-hide form-horizontal">
		<input type="hidden" name="springMVC.token" value="${token3}">
		<h3 class="heading" id="titletext">修改资料</h3>
		<input type="hidden" id="memberid" name="id" />
		<div class="form-group flag">
			<label class="col-md-2">昵称：</label>
			<div class="col-md-10">
				<input id="dianickname" type="text" name="nickname" class="maxPrize form-control" required="required"/> 
			</div>
		</div>
		<div class="form-group flag">
			<label class="col-md-2">密码：</label>
			<div class="col-md-10">
				<input id="diasyspsw" type="text" name="syspsw" class="maxPrize form-control" required="required"/> 
			</div>
		</div>
		<div class="form-group flag">
			<label class="col-md-2">邮箱：</label>
			<div class="col-md-10">
				<input id="diaemail" type="text" name="email" class="maxPrize form-control" /> 
			</div>
		</div>
		<div class="form-group flag">
			<label class="col-md-2">是否测试：</label>
			<div class="col-md-10">
				<select id="diaistest" name="istest" class="form-control">
				   <option value="true">是</option>
				   <option value="false">否</option>
				</select>
			</div>
		</div>
		<div class="form-group flag">
			<label class="col-md-2">所在组：</label>
			<div class="col-md-10">
				<select id="diausertype" name="userType" class="form-control">
				    <option value="会员"> 会员</option>
				    <option value="代理">代理</option>
				    <option value="总代理"> 总代理</option>
				</select>
			</div>
		</div>
		
		<div class="form-group flag">
			<label class="col-md-2">状态：</label>
			<div class="col-md-10">
				<select id ="diastate" name="state" class="form-control">
				    <option value="正常">正常</option>
				    <option value="锁定">锁定</option>
				    <option value="注销">注销</option>
				</select>
			</div>
		</div>
		<!--  以 下字段在详情页面中显示在更改页面中不显示 -->
		<div class="form-group hid">
			<label class="col-md-2">注册时间：</label>
			<div class="col-md-10">
				<input id="diaregtime" disabled='disabled' type="text"  class="maxPrize form-control" required="required"/> 
			</div>
		</div>
		<div class="form-group hid">
			<label class="col-md-2">最后登录时间：</label>
			<div class="col-md-10">
				<input id="dialastlogtime" disabled='disabled' type="text"  class="maxPrize form-control" required="required"/> 
			</div>
		</div>
	
		<div class="form-group hid">
			<label class="col-md-2">是否在线：</label>
			<div class="col-md-10">
				<input id="diaisonline" disabled='disabled' type="text"  class="maxPrize form-control" required="required"/> 
			</div>
		</div>
		
		<div class="form-group hid">
			<label class="col-md-2">登录IP：</label>
			<div class="col-md-10">
				<input id="dialoginip" disabled='disabled' type="text"  class="maxPrize form-control" required="required"/> 
			</div>
		</div>
		
		<div class="form-group hid">
			<label class="col-md-2">活跃天数：</label>
			<div class="col-md-10">
				<input id="diaactday" type="text" class="maxPrize form-control" disabled='disabled' required="required"/> 
			</div>
		</div>
		<div class="form-group" id="modifysubmit">
			<div class="col-md-10">
				<input type="submit"  class="addBtn btn btn-success" value="修改"/>
			</div>
		</div>
	</form>
	
	
	
	<form id="fandian_form" method="post" class="white-popup-block mfp-hide form-horizontal">
	  <h3 class="heading">查看返点</h3>
	   <div class="form-group" style="margin-top:30px;">
	      彩种:<select id="fdgametype" class="form-control">
	        <option>时时彩</option>
	        <option>十一选五</option>
	      </select>
	   
	   </div>
		<table class="table table-bordered table-highlight media-table">
		<thead>
		<tr>
		 <th>
		   玩法
		 </th>
		  <th>
		  最大奖金
		 </th>
		  <th>
		   最小奖金
		 </th>
		  <th>
		   返点
		 </th>
		  <th>
		   是否浮动
		 </th>
		 </tr>
		</thead>
		<tbody id="fdplaytype">
		</tbody>
		</table>
	</form>

	<jsp:include page="../common/foot.jsp"></jsp:include>
	<!-- target="hidden_frame" -->
</body>
</html>
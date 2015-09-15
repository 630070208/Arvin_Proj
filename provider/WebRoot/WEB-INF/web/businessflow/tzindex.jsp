<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="/WEB-INF/tld/util-tags.tld"%>
<%@ taglib prefix="page" uri="/WEB-INF/tld/page-tags.tld"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<head>
<title>业务流水-普通投注</title>
<jsp:include page="../common/headResources.jsp"></jsp:include>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/business/tz.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/common/ajax_request.js"></script>
<script><!--
/*   控制查询条件在页面上显示*/
   $(function(){
       /*if('${gameOrder.serialNumber}' != null){
         $("#ordernnum").val('${gameOrder.serialNumber}');
       }*/
       if('${gameOrder.member}' != null){
           $("#nickName").val('${gameOrder.member}');
       }
       if('${startTime}' != null){
           $("#startTime").val('${startTime}');
       }
       if('${endTime}' != null){
           $("#endTime").val('${endTime}');
       }
       if('${gameOrder.gameType}' != null){
        $("#lotteryType").val('${gameOrder.gameType}');
       }
        if('${gameOrder.orderState}' != null){
         $("#status").val('${gameOrder.orderState}');
       }
        if('${gameOrder.prizeState}' != null){
         $("#prizeState").val('${gameOrder.prizeState}');
       }
   });
   $(function(){
      if('${msg}' != null && '${msg}' != ""){
          alert('${msg}');
      }
   });
   
   
--></script>

</head>
<body>
	<!-- 菜单 -->
	<jsp:include page="../common/head.jsp"></jsp:include>
	<div id="content">
		<div id="content-header">
			<h1>普通投注</h1>
		</div>
		<form id="form"  action="${pageContext.request.contextPath }/system/business/tz/list" method="post">
		<input type="hidden" name="springMVC.token" value="${token1}">
		<div id="content-container">
			<div class="row">
				<div class="col-md-12">
						<div class="form-group">
							<div class="col-md-10">
								<div class="row">
									<div class="col_div" >
									<div class="label_form">订单号:<input type="text" id="ordernnum" name="serialNumber" style="width:10em;"  class="form-control"></div>
									<div class="label_form">用户名:<input type="text" id="nickName" name="member" style="width:10em;" value='${paraMap["nickname"]}' class="form-control"></div>
									<div class="label_form">起始日期:<input type="text"  id="startTime" name="startTime" style="width:10em;" class="form-control ui_timepicker"></div>
									<div class="label_form">结束日期:<input type="text"  id="endTime" name="endTime" style="width:10em;" class="form-control ui_timepicker"></div>
									<div class="label_form">
									彩种:
									<select class="gametype form-control" id="lotteryType" name="gameType">
									       <option value="">全部</option>
									       <c:forEach var="gametype" items="${gametypes}">
												<option value="${gametype }">${gametype.desc }</option>
											</c:forEach>
									    </select>
									</div>
									<div class="label_form">
									状态：<select class="gametype form-control" id="status" name="orderState">
									       <option value="">全部</option>
									       <option value="进行中">进行中</option>
									       <option value="已完成">已完成</option>
									       <option value="已撤单">已撤单</option>
									    </select>
									</div>
									<div class="label_form">
									中奖状态：<select class="gametype form-control" id="prizeState" name="prizeState">
									       <option value="">全部</option>
									       <option value="未开奖">未开奖</option>
									       <option value="已中奖">已中奖</option>
									       <option value="未中奖">未中奖</option>
									    </select>
									</div>
									  <div style="clear:both;">
									    <div class="btn_form addcondition"><input type="reset" onclick="resetCondition()" class="btn btn-success" value="重置条件"></input></div>		
									    <div class="btn_form addcondition"><input type="submit"  class="btn btn-success" value="查 询"></input></div>
								    	<div class="btn_form addcondition"><input type="button" onclick="delAll();" class="btn btn-success" value="清空所有数据"></input></div>
									   </div>
									   </div>
									</div>
								</div>
							</div><br/>
					</form>
					<table class="table table-bordered table-highlight media-table">
						<thead>
							<tr>
								<th>用户名</th>
								<th>期号</th>
								<th>彩种</th>
								<th>玩法</th>
								<th>投注号码</th>
								<th>模式</th>
								<th>倍数</th>
								<th>投注金额</th>
								<th>状态</th>
								<th>中奖金额</th>
								<th align="center">日期</th>
								<th class="text-center">操作</th>
							</tr>
						</thead>
						<c:if test="${page!=null}">
							<tbody>
						<!-- 删除流水的时候会提交这个form 避免暴露id -->
						<form id="delForm" action="${pageContext.request.contextPath }/system/business/tz/del" method="post">
						   <input type="hidden" name="springMVC.token" value="${token2}">
						   <input type="hidden" name="gameOrderID" id="gameorderId"  />
						 </form>
								<c:forEach var="item" items="${page.result}">
									<tr>
										<td align="left">${item.member}</td>
										<td align="left">
										   <c:forEach var="it" items="${item.orderItem}" varStatus="status">
										   
										   ${it.issue }<br/>
									
										   </c:forEach>
										</td>
										<td align="left">${item.gameType.desc}</td>										
										<td align="left">
									<c:forEach var="it" items="${item.planItems}" varStatus="status">
										   ${it.pType.desc }<br/>
								
									</c:forEach>
										</td>
											<td align="center">
										 <span  id="tzContent"><c:forEach var="it" items="${item.planItems}" varStatus="status">
										   ${it.content }<br/>
										   </c:forEach>
										   </span>
										</td>
										<td align="center">
										<c:forEach var="it" items="${item.planItems}" varStatus="status">
										   ${it.mschema}<br/>
										   </c:forEach>
										</td>
										
										<td align="left">
										 <c:forEach var="it" items="${item.orderItem}" varStatus="status">
										   ${it.multiple }<br/>
										   </c:forEach>
											</td>
										<td>
											${item.amount}
										</td>
										<td id="status${item.id}">
											 ${item.orderState}
										</td>
										<td>
										<c:choose>
										    <c:when test='${item.prizeState eq "已中奖"}'>
										        ${item.prize}
										    </c:when>
										     <c:otherwise>
										        ${item.prizeState}
										     </c:otherwise>
										</c:choose>										
										</td>
										<td align="center">
                                        <fmt:formatDate value="${item.dateTime.time}" pattern="yyyy-MM-dd HH:mm:ss"/> 
                                         </td>
										<td align="center"> 
										   <a class="btn btn-xs btn-secondary" onclick="drawals(${item.id})" href="javascript:;">
										   <i class="fa">撤单</i></a>
										      <a class="btn btn-primary popup-file" onclick="modifyTzContent(${item.id},this)" href="javascript:;" >
											<i class="fa">修改号码</i></a>
											 <a class="btn btn-xs btn-secondary" onclick="delGameOrderID(${item.id})" href="javascript:;">
											     <i class="fa">删除</i>
									         </a>
									         
									         
									          <a class="btn btn-xs btn-secondary" onclick="alert('暂无此功能')" href="javascript:;">
											     <i class="fa">开奖</i>
									         </a>
										
										</td>
									</tr>
								</c:forEach>
								
							</tbody>
						</c:if>
						<c:if test="${page==null}">
							<tr>
								<td colspan="11" style="color: #FF0000; font-size:15px;">暂时没有记录</td>
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
	<form id="upload_form" method="post" action="${pageContext.request.contextPath }/system/business/tz/modify"
		class="white-popup-block mfp-hide form-horizontal">
		<input type="hidden" name="springMVC.token" value="${token3}">
		<h3 class="heading">修改投注号码</h3>
		<input type="hidden" id="gameorderid" name="gameOrderID" />
		<div class="form-group">
			<label class="col-md-2">投注内容：</label>
			<div class="col-md-10" id="modidyflag">
			</div>
		</div>
		<div class="form-group" >
			<div class="col-md-10">
				<input type="button"  class="addBtn btn btn-success"  onclick='modifyContent();'  value="修改"/>
			</div>
		</div>
	</form>
	
	
</body>
</html>
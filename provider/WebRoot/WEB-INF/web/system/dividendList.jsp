<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="/WEB-INF/tld/util-tags.tld"%>
<%@ taglib prefix="page" uri="/WEB-INF/tld/page-tags.tld"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<head>
<title>返点分红</title>
<jsp:include page="../common/headResources.jsp"></jsp:include>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/business/dividend.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/common/ajax_request.js"></script>
</head>
<body>
	<!-- 菜单 -->
	<jsp:include page="../common/head.jsp"></jsp:include>
	<div id="content">
		<div  id="content-header">
			<h3>系统分红</h3>
		</div>
		<div id="content-container">
			<div class="row"  style="text-align: center;">
						<div  style="float:left;font-size:16px;height:30px;line-height:30px;margin-right:60px;margin-left:300px">
						   是否开启总代分红:<input  type="checkbox" name="totalFH" />
						</div>
						<div style="float:left;">
						<div style="float:left; line-height:30px;font-size:16px;">时间:</div>
						<div style="float:left;">
						<select style="width:250px;" class="maxPrize form-control">
						   <option>每月2次(1号和16号下午2:00)</option>
						</select>
						</div>
					  </div>
								
						<div style="margin-left:60px;float:left;">
									<div style="float:left; height:30px;line-height: 35px;font-size:16px;"><span style="margin-top:5px;">固定分红分配比率:</span></div><input type="text" class="maxPrize form-control" style="width:80px; float:left;" name="totalFH" value="${betDividend.alloRatio}" />
						</div>
				</div>
				<hr/>
					 <div style="font-size:14px;margin-bottom:12px;">
					     <span> 浮点分配比例</span>
					</div>
					<table class="table table-bordered table-highlight media-table">
						<thead>
							<tr>
								<th>开始消费</th>
								<th>结束消费</th>
								<th>比例</th>
								<th class="text-center">操作</th>
							</tr>
						</thead>
						<c:if test="${map != null}">
							<tbody>
							<!-- 删除流水的时候会提交这个form 避免暴露id -->
							<form id="delForm" action="${pageContext.request.contextPath }/system/dividend/del" method="post">
							  <input type="hidden" name="springMVC.token" value="${token1}">
							   <input type="hidden" name="id" id="dividendId"  />
							 </form>
								<c:forEach var="it" items="${map}">
									<tr>
										<td align="left">${it.value.startMoney}</td>
										<td align="left">${it.value.termiMoney}</td>
										<td align="center">${it.value.ratio}</td>
									     <td align="center"> 
									     <a class="btn btn-xs btn-secondary popup-file" onclick="modify(${it.key},this);" href="javascript:;">
										 <i class="fa">修改</i>
									     </a>
									      <a class="btn btn-xs btn-secondary" onclick="del(${it.key});" href="javascript:;">
										 <i class="fa fa-times"></i>
									     </a>
									</td>
									</tr>
								</c:forEach>
							</tbody>
						</c:if>
						<c:if test="${map == null}">
							<tr>
								<td colspan="15" style="color: #FF0000; font-size:15px;">暂时没有记录</td>
							</tr>
						</c:if>
					</table>
					<div class="btn_form">
                        <a  class="popup-file" href="#peieadd_form"><input  class="btn btn-success" type="button" value="添加"></input></a>
                     </div>
				</div>
			</div>
		</div>
	</div>
	
	<form id="peie_form" method="post" action="${pageContext.request.contextPath }/system/dividend/modify"
		class="white-popup-block mfp-hide form-horizontal">
		<input type="hidden" name="springMVC.token" value="${token2}">
		<h3 class="heading" id="title">修改</h3>
		<input type="hidden" id="userquotaid" name="id" />
		<div class="form-group flag">
			<label class="col-md-2">开始消费</label>
			<div class="col-md-10">
				<input id="pestart" type="text" name="startMoney" style="width:100px;" class="maxPrize form-control" required="required"/> 
			</div>
		</div>
		<div class="form-group flag">
			<label class="col-md-2">结束消费</label>
			<div class="col-md-10">
				<input id="peend" type="text" name="termiMoney" style="width:100px;"  class="maxPrize form-control" required="required"/> 
			</div>
		</div>
		<div class="form-group flag">
			<label class="col-md-2">比例</label>
			<div class="col-md-10">
				<input id="pequota" type="text" name="ratio" style="width:100px;"  class="maxPrize form-control"  required="required"/> 
			</div>
		</div>
		<div class="form-group" id="modifysubmit">
			<div class="col-md-10" >
				<input type="button"  class="addBtn btn btn-success" onclick="checkAndSub();"  id="addSubmit"value="确认修改"/>
			</div>
		</div>
	</form>
	
	
	
	
	<form id="peieadd_form" method="get" action="${pageContext.request.contextPath }/system/dividend/add"
		class="white-popup-block mfp-hide form-horizontal">
		<input type="hidden" name="springMVC.token" value="${token3}">
		<h3 class="heading" >添加</h3>
		<div class="form-group flag">
			<label class="col-md-2">开始消费</label>
			<div class="col-md-10">
				<input  type="text" id="startMoney" name="startMoney" style="width:100px;" class="maxPrize form-control" required="required"/> 
			</div>
		</div>
		<div class="form-group flag">
			<label class="col-md-2">结束消费</label>
			<div class="col-md-10">
				<input  type="text" id="termiMoney" name="termiMoney" style="width:100px;"  class="maxPrize form-control" required="required"/> 
			</div>
		</div>
		<div class="form-group flag">
			<label class="col-md-2">比例</label>
			<div class="col-md-10">
				<input  type="text" id="ratio" name="ratio" style="width:100px;"  class="maxPrize form-control"  required="required"/> 
			</div>
		</div>
		<div class="form-group" >
			<div class="col-md-10" >
				<input type="button"  class="addBtn btn btn-success" onclick="checkAndAdd();"  value="确认添加"/>
			</div>
		</div>
	</form>
		
	
	
	
	
	<jsp:include page="../common/foot.jsp"></jsp:include>
	<!-- target="hidden_frame" -->
</body>
</html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="/WEB-INF/tld/util-tags.tld"%>
<%@ taglib prefix="page" uri="/WEB-INF/tld/page-tags.tld"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<head>
<title>会员管理-登录日志</title>
<jsp:include page="../common/headResources.jsp"></jsp:include>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/common/ajax_request.js"></script>
<script>
  $(function(){
      if(null != '${nickname}')
        $("#nickname").val('${nickname}');
  });
  
  function del(id){
     if(confirm("确定删除？")){
		$("#memberlogid").val(id);
		$("#delForm").submit();
	}
  }
  
  function findOnlyP(id,t){
      var data = {"id":id};
      t.href="#upload_form";
      ajaxRequest("/system/member/bankfindById",data,"post",resultHandler);
  }
  
  function resultHandler(data){
    $("#bankid").val(data.userbank.id);
     $("#bankname").val(data.userbank.bankName);
       $("#banknum").val(data.userbank.bankCode);
        $("#realadd").val(data.userbank.blankAdd);
         $("#realname").val(data.userbank.realName);
  }
  
  
</script>


</head>
<body>
	<!-- 菜单 -->
	<jsp:include page="../common/head.jsp"></jsp:include>
	<div id="content">
		<div id="content-header">
			<h3>银行信息</h3>
		</div>
		<form id="form"  action="${pageContext.request.contextPath }/system/member/banklist" method="post">
		<input type="hidden" name="springMVC.token" value="${token1}">
		<div id="content-container">
			<div class="row">
				<div class="col-md-12">
						<div class="form-group">
							<div class="col-md-10">
								<div class="row">
									<div class="col_div" >
									   <div class="label_form" style="height: 40px;height: 40px;">用户账号:
									   <input type="text" id="nickname"  style="width:8em;" name="realName" style="width:15em;" class="form-control">
									   </div>
									    <div class="btn_form">
									       <input type="reset" onclick="resetCondition()" class="btn btn-success" value="重置条件"></input>
									    </div>		
									    <div class="btn_form">
									    <input type="submit" id="sreachByCondition" class="btn btn-success" value="查 询"></input></div>
									   </div>
									</div>
								</div>
							</div><br/>
					</form>
					<table class="table table-bordered table-highlight media-table">
						<thead>
							<tr>
								<th>用户名</th>
								<th>真实名字</th>
								<th>银行卡号</th>
								<th>银行名字</th>
								<th>开户地址</th>
								<th class="text-center">操作</th>
							</tr>
						</thead>
						<c:if test="${page!=null}">
							<tbody>
							<!-- 删除流水的时候会提交这个form 避免暴露id -->
							<form id="delForm" action="${pageContext.request.contextPath }/system/member/bankdel" method="post">
							   <input type="hidden" name="springMVC.token" value="${token2}">
							   <input type="hidden" name="id" id="memberlogid"  />
							 </form>
								<c:forEach var="item" items="${page.result}">
									<tr>
									    <td align="left">${item.id}</td>
										<td align="left">${item.realName}</td>
										<td align="left">${item.bankCode}</td>
										<td align="left">${item.bankName }</td>
										<td align="left">${item.blankAdd }</td>
										<td align="center"> 
										<a class="btn btn-xs btn-secondary popup-file" onclick="findOnlyP(${item.id},this);" href="javascript:;">
											<i class="fa">修改</i>
										</a>
										<a class="btn btn-xs btn-secondary" onclick="del(${item.id})" href="javascript:;">
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
	
	<form id="upload_form" method="post" action="${pageContext.request.contextPath }/system/member/modifybank"
		class="white-popup-block mfp-hide form-horizontal">
		<input type="hidden" name="springMVC.token" value="${token3}">
		<h3 class="heading" id="titletext">修改银行信息</h3>
		<input type="hidden" id="bankid" name="id" />
		<div class="form-group hid">
			<label class="col-md-2">银行名字：</label>
			<div class="col-md-10">
				<input id="bankname" name="bankName"  type="text"  class="maxPrize form-control" required="required"/> 
			</div>
		</div>
		
		<div class="form-group hid">
			<label class="col-md-2">银行卡号：</label>
			<div class="col-md-10">
				<input id="banknum" name="bankCode" type="text" class="maxPrize form-control"  required="required"/> 
			</div>
		</div>
		
		<div class="form-group hid">
			<label class="col-md-2">真实名字：</label>
			<div class="col-md-10">
				<input id="realname" type="text" name="realName" class="maxPrize form-control"  required="required"/> 
			</div>
		</div>
		
		<div class="form-group hid">
			<label class="col-md-2">开户地址：</label>
			<div class="col-md-10">
				<input id="realadd" name="blankAdd" type="text" class="maxPrize form-control"  required="required"/> 
			</div>
		</div>
		
		<div class="form-group" id="modifysubmit">
			<div class="col-md-10">
				<input type="submit"  class="addBtn btn btn-success" value="修改"/>
			</div>
		</div>
	</form>
	
	
	
	<jsp:include page="../common/foot.jsp"></jsp:include>
	<!-- target="hidden_frame" -->
</body>
</html>
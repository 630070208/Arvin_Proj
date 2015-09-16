<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>系统管理--添加总代理</title>
<jsp:include page="../common/headResources.jsp"></jsp:include>
<script type="text/javascript">
	$(function(){
		$("#addProxy").on('click',function(){
			ajaxRequest("/system/member/addProxy", $("#addProxyFrom").serialize(), "POST", resultHandler, faultHander);
			function resultHandler(data){
				alert(data.msg);
			}
			function faultHander(data){
				alert(data.msg);
			}
		});
	})
</script>
</head>
<body>
	<!-- 菜单 -->
	<jsp:include page="../common/head.jsp"></jsp:include>
	<div id="content">
		<div id="content-header">
			<h1>添加总代理</h1>
		</div>
		<div id="content-container">
			<div class="row">
				<div class="col-md-12">
					<form action="${pageContext.request.contextPath}/system/member/addProxy" id="addProxyFrom"  class="form-horizontal">
						<div class="form-group">
							<div class="col-md-10">
								<div class="row">
								
								   <div class="col-md-8">
										<div class="form-group">
											<label class="col-md-3">是否是测试账户：</label>
											<div class="col-md-5">
											   <select name = 'istest' class="form-control">
											       <option value="true">是</option>
											       <option value="false">否</option>
											   </select>
											</div>
										</div>
									<div class="col-md-8">
										<div class="form-group">
											<label class="col-md-3">昵称：</label>
											<div class="col-md-5">
												<input type="text" name="nickName" class="form-control"/>
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-3">用户名：</label>
											<div class="col-md-5">
												<input type="text" name="syscode" class="form-control"/>
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-3">密码：</label>
											<div class="col-md-5">
												<input type="text" name="syspsw" class="form-control"/>
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-3">用户状态：</label>
											<div class="col-md-5">
												<select name="state"  class="gametype form-control">
													<option value="正常">正常</option>
													<option value="锁定">锁定</option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-3">用户类型：</label>
											<div class="col-md-5">
												<select name="userType"  class="gametype form-control">
													<option value="总代理">总代理</option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-3">返点：</label>
											<div class="col-md-5">
												<input type="text" name="rebate" class="form-control"/>
											</div>
										</div>
										<div class="form-group">
											<div class="col-md-3 col-md-push-3">
												<input type="button" id="addProxy" class="btn btn-primary" value="添加总代理"></input>
											</div>
											<div class="col-md-4 col-md-push-3">
												<input type="reset" class="btn" value="重置"></input>
											</div>
										</div>
									</div>
								</div>
							</div>
					  	</div>
					</form>
				</div>
			</div>
	</div>
	<jsp:include page="../common/foot.jsp"></jsp:include>
</body>
</html>

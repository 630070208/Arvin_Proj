<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>系统返点设置</title>
<jsp:include page="../common/headResources.jsp"></jsp:include>
<script type="text/javascript">
	$(function(){
		$("#subDraw").on('click',function(){
			ajaxRequest("/system/business/recharge", $("#from").serialize(), "POST", resultHandler, faultHander);
			function resultHandler(data){
				alert(data.msg);
				$("#from")[0].reset();
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
			<h1>系统充值</h1>
		</div>
		<div id="content-container">
			<div class="row">
				<div class="col-md-12">
					<form action="#" method="post" id="from" class="form-horizontal">
						<input name="springMVC.token" type="hidden" value="${token}"/>
						<div class="form-group">
							<label class="col-md-2">用户名：</label>
							<div class="col-md-5">
								<input type="text" name="syscode" class="form-control"  />
							</div>
						</div>

						<div class="form-group">
							<label class="col-md-2">充值金额：</label>
							<div class="col-md-5">
								<input type="text" name="money" class="form-control"/>
							</div>
						</div>

						<div class="form-group">
							<div class="col-md-7 col-md-push-3">
								<input type="button" id="subDraw" class="btn btn-primary" value="充 值"></input>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
</body>
</html>

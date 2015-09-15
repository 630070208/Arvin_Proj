<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>系统管理</title>
<jsp:include page="../common/headResources.jsp"></jsp:include>
<script type="text/javascript">
	$(function(){
		if(null =='${sysAlipay.id}' || ''=='${sysAlipay.id}'){
			$("#updateId").attr('checked', true);
			
		}else{
			$("#subDraw").attr('disabled', true);
			$("input[name='id']").attr('disabled', true);
			$("input[name='alipayName']").attr('disabled', true);
			$("input[name='alipayNumber']").attr('disabled', true);
		}
		
		$("#updateId").click(function() {
			if ($("#updateId").is(':checked')) {
				$("#subDraw").removeAttr("disabled");
				$("input[name='id']").removeAttr("disabled");
				$("input[name='alipayName']").removeAttr("disabled");
				$("input[name='alipayNumber']").removeAttr("disabled");
			} else {
				$("#subDraw").attr('disabled', true);
				$("input[name='id']").attr('disabled', true);
				$("input[name='alipayName']").attr('disabled', true);
				$("input[name='alipayNumber']").attr('disabled', true);
			}
		});
		$("#subDraw").click(function(){
			ajaxRequest("/system/game/modysAlipay", $("#from").serialize(), "POST", resultHandler, faultHander);
		});
		function resultHandler(data){
			if(data.flag == true){
				alert("操作成功");
				$("#id").val(data.id);
				$("#updateId").attr('checked', false);
				$("#subDraw").attr('disabled', true);
				$("input[name='id']").attr('disabled', true);
				$("input[name='alipayName']").attr('disabled', true);
				$("input[name='alipayNumber']").attr('disabled', true);
			}else{
				alert("操作失败")
			}
		}
		function faultHander(data){
			alert("操作失败");
		}
	});
</script>
</head>
<body>
	<!-- 菜单 -->
	<jsp:include page="../common/head.jsp"></jsp:include>
	<div id="content">
		<div id="content-header">
			<h1>支付宝账号管理</h1>
		</div>
		<div id="content-container">
			<div class="row">
				<div class="col-md-12">
					<div class="col-md-12">
						<form action="#" method="post" id="from" class="form-horizontal">
							<input name="springMVC.token" type="hidden" value="${token}"/>
							<div class="form-group">
								<div class="col-md-5">
									<input type="hidden" value="${sysAlipay.id}" name="id" id="id" class="form-control">
								</div>
							</div>
	
							<div class="form-group">
								<label class="col-md-2">支付宝户主名：</label>
								<div class="col-md-5">
									<input type="text" value="${sysAlipay.alipayName}" class="form-control" name="alipayName">
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-2">支付宝账号：</label>
								<div class="col-md-5">
									<input type="text" value="${sysAlipay.alipayNumber}" class="form-control" name="alipayNumber">
								</div>
							</div>
							<div class="form-group">
								<div class="col-md-4 col-md-push-2" style="display: disabled;">
									<input type="checkbox" id="updateId"/>勾选后修改
									<input type="button" id="subDraw" class="btn btn-primary" value="保存"></input>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../common/foot.jsp"></jsp:include>
</body>
</html>

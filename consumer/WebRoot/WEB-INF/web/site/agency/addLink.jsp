<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>添加推广链接</title>
<jsp:include page="../common/WerResources.jsp"></jsp:include>
<script src="/site/js/usercenter/RebateUtil.js"></script>
<script src="/site/js/usercenter/createSubUser.js"></script>
<script type="text/javascript">
	
	var type = "会员";
	function changePre(t){
	   if(t.value > 0){
	      var myRebate = parseFloat($("#parentRebate").val());
	      if(parseFloat(t.value)>=myRebate){
	         alert("设置给下级代理的返点应该小于自己的可用返点");
	         $("#saveLink").attr('disabled',true);
	      }else{
	    	  $("#saveLink").attr('disabled',false);
	      }
	   }else{
	     alert("填写的返点不是合法数字");
	     $("#saveLink").attr('disabled',true);
	   }
	   $("#saveLink").click(function(){
	   });
	}
	
	
	function changeType(t){
	    if(t.value === '会员'){
	    	type = "会员";
	    	$("#td_rebate").hide();
	    	$("#saveLink").attr('disabled',false);
	    }else if (t.value === '代理' ){
	    	type = "代理";
	    	$("#td_rebate").show();
	    }
	}
	
	
	$(function(){
		$("#td_rebate").hide();
		$("#saveLink").click(function(){
			var data = {};
			data.rebate = $("#rebate").val();
			data.radio_type =  type;
			ajaxRequest("/uc/agency/link/addAction", data, "post", sucResult);
		});
	});
	
	function sucResult(data){
		if(data.code == "1"){
			alert(data.msg);
		}else{
			alert("添加成功");
		}
	}
	
</script>
</head>
<body class="layout-two-column unibet custom-background">
	<div id="container">
		<jsp:include page="../common/WerHeader.jsp"></jsp:include>
		<div id="content">
			<div id="top">
				<div class="inner"></div>
			</div>

			<div id="main" role="main">
				<div class="main-container">
					<!--菜单-->
					<jsp:include page="AgencyMenu.jsp"></jsp:include>
					<!--菜单结束-->
					<div class="stack gutter-col size4of5">
						<div class="header-image">
							<h2 class="heading">添加推广链接</h2>
						</div>
						<article class="rich-text-element main-column">
							<article class="widget registration-form">
								<form action="" method="post" id="createUserForm"
									style="height:auto;">
									<input type="hidden" name="flag" value="insert" /> <input
										type="hidden" name="controller" value="user" /> <input
										type="hidden" name="action" value="adduser" />
									<div
										style="margin-left:12px;margin-right:12px;margin-top:12px;">
										<table class="formTable">
											<tbody>
												<tr>
													<td style="text-align: right;">代理账号：</td>
													<td colspan="2">
														<input type="text" id="userName" readonly="readonly" class="field invalid" style="width:260px"
														name="userName"  value="${member.syscode }"
														/> 
													</td>
												</tr>
												<tr>
													<td style="text-align: right;">会员类型：</td>
													<td colspan="2">
													<input type="radio" checked onclick = "changeType(this);" name="radio_type" value="会员"/>会员
														&nbsp;&nbsp;&nbsp;
														<input type="radio"  name="radio_type" onclick = "changeType(this);" value="代理"/>代理
													
														
													</td>
												</tr>
												
												<tr>
													<td style="text-align: right;">可用返点：</td>
													<td colspan="2">
													     <input id="parentRebate" readonly="readonly"  value="${member.rebate }" style="width:50px;"/>
													</td>
												</tr>
												<tr id="td_rebate">
													<td style="text-align: right;">设置返点：</td>
													<td colspan="2" >
													     <input id="rebate" name ="rebate"  value="" 
													     style="width:50px;" onblur="changePre(this);"/>
													</td>
												</tr>
												
												<tr class="lastTr">
													<td></td>
													<td><input id="saveLink" type="button" class="btn" value="确认添加"
														>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
								</form>
							</article>
					</div>
				</div>
				<!-- 右侧内容面板结束 -->
			</div>
		</div>
			<jsp:include page="../common/WerFooter.jsp"></jsp:include>
	</div>
</body>
</html>
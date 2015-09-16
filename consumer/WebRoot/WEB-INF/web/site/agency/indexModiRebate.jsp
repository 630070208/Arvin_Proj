<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="no-js ie ie67 ie678 ie6789" lang="en"><![endif]-->
<!--[if IE 7 ]><html class="no-js ie ie67 ie678 ie6789 ie7" lang="en"><![endif]-->
<!--[if IE 8 ]><html class="no-js ie ie678 ie6789 ie8" lang="en"><![endif]-->
<!--[if IE 9 ]><html class="no-js ie ie6789 ie9" lang="en"><![endif]-->
<!--[if !(IE)]><!-->
<html lang="en">
  <!--<![endif]-->
<head>
<title>返点编辑</title>
<jsp:include page="../common/WerResources.jsp"></jsp:include>
<script type="text/javascript">
	var maxRebate = '${maxRebate}';
	$(function(){
		$("#saveRebate").click(function(){
		var data = {};
			data.ur = $("#ur").val();
			data.id =  $("#id").val();;
			ajaxRequest("/uc/modilRebate", data, "post", sucResult);
		});
	});
	
	function sucResult(data){
		if(!data.flag){
			alert(data.msg);
		}else{
			alert("修改成功");
		}
	}
	function changePre(t){
	   if(t.value > 0){
	      var myRebate = parseFloat(maxRebate);
	      if(parseFloat(t.value)>=myRebate){
	         alert("设置给下级代理的返点应该小于自己的可用返点");
	         $("#saveRebate").attr('disabled',true);
	      }else{
	    	  $("#saveRebate").attr('disabled',false);
	      }
	   }else{
	     alert("填写的返点不是合法数字");
	     $("#saveRebate").attr('disabled',true);
	   }
	   $("#saveRebate").click(function(){
	   });
}

		
</script>
</head>
<body class="layout-two-column unibet custom-background">
	<div id="container">&nbsp; 
		<jsp:include page="../common/WerHeader.jsp"></jsp:include>
		<div id="content">
			<div id="top">
				<div class="inner"></div>
			</div>

			<div id="main" role="main">

				<div class="main-container">
			<!-- 左侧菜单开始 -->
			<jsp:include page="AgencyMenu.jsp"></jsp:include>
			<!--彩种类型-->
			<div id="column-primary" class="stack gutter-col size4of5">
						<div class="header-image">
							<h2 class="heading">会员编辑</h2>
						</div>
						<article class="rich-text-element main-column">
							<article class="widget bingo-game-chooser">
							<c:if test="${flag }">
								<form action="${pageContext.request.contextPath }/uc/modilRebate" id="form1" method="post" name="modilRebate">
									<div id="searchPanel">
									<table>
										<tr>
											<td><label>用户名</label></td>
											<td><input value="${name }"  readonly/></td>
										</tr>
										<tr>
											<td><label>用户等级</label></td>
											<td><input value="${type }"  readonly/></td>
										</tr>
										<tr>
											<td><label>设置返点</label></td>
											<td>
												<input id="ur" name="ur" onkeyup="changePre(this);" value="${reb }"/>
												<span style="color: red;">小于等于${maxRebate}</span>
											</td>
											<td></td>
										</tr>
										<tr>
											<td colspan="2"><input id="saveRebate" disabled type="button" class="btn" value="确认修改"/></td>
										</tr>
									</table>
									<input type="hidden" id="id" name="id" value="${id}"/>
								</form>
								</c:if>
								<c:if test="${!flag}">
									不存在的用户！
								</c:if>
							</article>
						</article>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="../common/WerFooter.jsp"></jsp:include>
	</div>
</body>
</html>
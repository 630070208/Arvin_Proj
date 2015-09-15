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
<title>会员管理</title>
<jsp:include page="../common/WerResources.jsp"></jsp:include>
<script type="text/javascript">
$(function() {
	$("#maxBalance").bind("input",onKeeppointChange);
	$("#minBalance").bind("input",onKeeppointChange);
});
function onKeeppointChange(){
	$(this).val(Number($(this).val().replace(/[^0-9]/g,"")));
}

$(function(){
  if('${username}' != null){
     $("#username").val('${username}');
  }
  if('${max}' != null){
    $("#maxBalance").val('${max}');
  }
  if('${min}' != null){
   $("#minBalance").val('${min}');
  }

})

function sendId(id){
	$("#sendId").val(id);
	document.sendFrom.action="/uc/indexModiRebate";
	document.sendFrom.submit();
}
function subUserName(name){
	$("#subName").val(name);
	document.subNameForm.action="/uc/proxyDownProxy";
	document.subNameForm.submit();
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
							<h2 class="heading">会员列表</h2>
						</div>

						<article class="rich-text-element main-column">
							<article class="widget bingo-game-chooser">
<form action="${pageContext.request.contextPath }/uc/memberManagementPage" id="form" method="post" name="search">
	<div id="searchPanel">
		<label>用户名：</label>
		<input type="text" name="username" id="username" value="">
		<label>用户余额：</label>
		<input id="maxBalance" name="maxBalance" type="text" size="10" />
		<label>至</label>
		<input id="minBalance" name="minBalance" type="text" size="10" />
		&nbsp;<input type="submit" value="查询" class="btn"/>
	</div>
	<div id="top">
										<div class="inner"></div>
									</div>
	<table id="userlistDL" class="bingo-game-chooser-table table-decoration-7 color-theme-4">
		<thead>
			<tr>
				<th><div class="title"><span>用户名</span></div></th>
				<th><div class="title"><span>用户类型</span></div></th>
				<th><div class="title"><span>返点</span></div></th>
				<th><div class="title"><span>状态</span></div></th>
				<th><div class="title"><span>用户余额</span></div></th>
				<th><div class="title"><span>注册时间</span></div></th>
				<th><div class="title"><span>操作</span></div></th>
				<!-- 
				<th><div class="title"><span>充值金额</span></div></th>
				<th><div class="title"><span>提现金额</span></div></th>
				<th><div class="title"><span>累计中奖</span></div></th>
				<th><div class="title"><span>总盈亏</span></div></th> -->
			</tr>
		</thead>
          <tbody>
	<c:if test="${not empty page.result}">
	<c:forEach var="item" items="${page.result}">
		<tr>
			<td><strong>${item.member.syscode}</strong></td>
			<td>${item.member.userType}</td>
			<td>${item.member.rebate}</td>
			<td>${item.member.state}</td>
			<td>${item.balance}</td>
			<td><fmt:formatDate value="${item.member.regTime.time }" pattern="yyyy-MM-dd" /></td>
			<td><a href="javascript:sendId('${ item.member.id}')">修改</a>&nbsp;&nbsp;
				<c:if test="${item.member.userType != '会员'}">
					<a href="javascript:subUserName('${item.member.syscode }')">查看下级</a>
				</c:if>
			</td>
			<%-- <td>${item.upToInpour }</td>
			<td>${item.upToDraw}</td>
			<td>${item.upToWin}</td>
			<td>${item.upToBuy - item.upToWin}</td> --%>
		</tr>
	</c:forEach>
	</c:if>

	<c:if test="${null ==page || page.result.size()==0}">
	    <tr class="lastTr">
	      <td colspan="7">
	                        没有记录！
	      </td>
	    </tr>
	 </c:if>
	  <c:if test="${page.result.size()>0}">
		<tr class="lastTr">
			<td colspan="7" height="20">
				<input type="hidden" id="pageNo" name="pageNo" value="1" />
				<jsp:include page="../../common/frontpager.jsp"/>
			</td>
		</tr>
	 </c:if>
		 </tbody>
	</table>
</form>
							</article>
						</article>
					</div>
					<!-- 右侧内容面板结束 -->
				</div>
			</div>
		</div>
		<form action="" id="subNameForm" method="post" name="subNameForm">
			<input type="hidden" value="" id="subName" name="proxyName"/>
		</form>
		<form action="" method="post" id="sendFrom" name="sendFrom">
			<input id="sendId" value="" name="id" type="hidden"/>
		</form>
		<jsp:include page="../common/WerFooter.jsp"></jsp:include>
	</div>
</body>
</html>
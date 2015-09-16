<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="no-js ie ie67 ie678 ie6789" lang="en"><![endif]-->
<!--[if IE 7 ]><html class="no-js ie ie67 ie678 ie6789 ie7" lang="en"><![endif]-->
<!--[if IE 8 ]><html class="no-js ie ie678 ie6789 ie8" lang="en"><![endif]-->
<!--[if IE 9 ]><html class="no-js ie ie6789 ie9" lang="en"><![endif]-->
<!--[if !(IE)]><!-->
<html lang="en">
  <!--<![endif]-->
<head>
<title>盈利报表</title>
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


function subUserName(name,dire){
	$("#subName").val(name);
	$("#dire").val(dire);
	document.sendFrom.action="/uc/proxyDownProxyUW";
	document.sendFrom.submit();
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
							<h2 class="heading">盈利报表</h2>
						</div>

						<article class="rich-text-element main-column">
							<article class="widget bingo-game-chooser">
<form action="${pageContext.request.contextPath }/uc/interestReports" id="form" method="post" name="search">
	<div id="searchPanel">
		<label>用户名：</label>
		<input type="text" name="username" id="username" value="">
		&nbsp;<input type="submit" value="查询" class="btn"/>
	</div>
	<div id="top">
										<div class="inner"></div>
									</div>
	<table id="userlistDL" class="bingo-game-chooser-table table-decoration-7 color-theme-4">
		<thead>
			<tr>
				<th><div class="title"><span>用户名</span></div></th>
				<th><div class="title"><span>充值金额</span></div></th>
				<th><div class="title"><span>提现金额</span></div></th>
				<th><div class="title"><span>购彩金额</span></div></th>
				<th><div class="title"><span>累计中奖</span></div></th>
				<th><div class="title"><span>总盈亏</span></div></th>
				<th><div class="title"><span>操作</span></div></th>
			</tr>
		</thead>
          <tbody>
          <c:if test="${!empty uw}">
	          <tr>
				<td><strong>${uw.member.syscode}</strong></td>
				<td>${uw.upToInpour}</td>
				<td>${uw.upToDraw}</td>
				<td>${uw.upToBuy}</td>
				<td>${uw.upToWin}</td>
				<td>${uw.upToWin - uw.upToBuy}</td>
				<td>
					<c:if test="${uw.member.userType != '会员'}">
						<a href="javascript:subUserName('${uw.member.syscode }','x')">查看1下级</a>
						&nbsp;&nbsp;&nbsp;
						<a href="javascript:subUserName('${uw.member.syscode }','s')">查看1上级</a>
					</c:if>
					<c:if test="${uw.member.userType == '会员'}">
						<a href="javascript:subUserName('${uw.member.syscode }','s')">查看1上级</a>
					</c:if>
				</td>
			</tr>
          </c:if>
	<c:if test="${not empty page.result}">
	<c:forEach var="item" items="${page.result}">
		   <tr>
				<td><strong>${item.member.syscode}</strong></td>
				<td>${item.upToInpour}</td>
				<td>${item.upToDraw}</td>
				<td>${item.upToBuy}</td>
				<td>${item.upToWin}</td>
				<td>${item.upToWin - uw.upToBuy}</td>
			<td>
				<c:if test="${item.member.userType != '会员'}">
					<a href="javascript:subUserName('${item.member.syscode }','x')">查看下级</a>
					&nbsp;&nbsp;&nbsp;
					<a href="javascript:subUserName('${item.member.syscode }','s')">查看上级</a>
				</c:if>
				<c:if test="${item.member.userType == '会员'}">
					<a href="javascript:subUserName('${item.member.syscode }','s')">查看上级</a>
				</c:if>
			</td>
		</tr>
	</c:forEach>
	</c:if>

	<c:if test="${(null == page || page.result.size()==0) && null == uw}">
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
		<form action="" method="post" id="sendFrom" name="sendFrom">
			<input id="subName" value="" name="proxyName" type="hidden"/>
			<input id="dire" type="hidden" value="" name="dire"/>
		</form>
		<jsp:include page="../common/WerFooter.jsp"></jsp:include>
	</div>
</body>
</html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>个人中心</title>
<jsp:include page="../common/resource.jsp"></jsp:include>
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

</script>
</head>
<jsp:include page="header.jsp"></jsp:include>
<!--彩种类型-->
<div class="Menubox_title">
	<ul id="gameType">
		<li value="wx" id="two1" class="hover"><span class="m">用户列表</span></li>

	</ul>
</div>
<form action="${pageContext.request.contextPath }/uc/userListPage" id="form" method="post" name="search">
	
	<table class="formTable">
		<tr>
			<td>用户名：</td>
			<td>
				<input type="text" name="username" id="username" value="">
			</td>
			<td>用户余额：</td>
			<td>
				<input id="maxBalance" name="maxBalance" type="text" size="10" /> 至 
				<input id="minBalance" name="minBalance" type="text" size="10" />
			</td>
		</tr>
		<tr>
			<td align="center" colspan="4"><input type="submit"	style="margin:0px" value="查询" class="formCheck" />
			</td>
		</tr>
	</table>


<div class="line10px"></div>
	<table class="grayTable" id="userlistDL">
		<tr>
			<th>用户名</th>
			<th>用户类型</th>
			<th>余额</th>
			<th>返点级别</th>
		</tr>


	<c:if test="${not empty page.result}">
		<c:forEach var="item" items="${page.result}">
			<tr>
				<td><strong>${item.member.syscode}</strong></td>
				<td>${item.member.userType}</td>
				<td>${item.balance }</td>
				<td>${item.member.userType}</td>
			</tr>
		</c:forEach>
	</c:if>
		  <c:if test="${page!=null}">
			<tr>
				<td colspan="6" height="20">
					<table border="0" width="100%" cellpadding="0" cellspacing="0">
						<tr>
							<td align="left">
							<input type="hidden" id="pageNo" name="pageNo" value="1" />
							<jsp:include page="../../common/frontpager.jsp"/>
							</td>
						</tr>
					</table></td>
			</tr>
		 </c:if>
		 <c:if test="${page == null}">
		    <tr>
		      <td colspan="4">
		                        没有记录！
		      </td>
		    </tr>
		 
		 </c:if>
		 
	</table>
</form>
<jsp:include page="../common/footer.jsp"></jsp:include>
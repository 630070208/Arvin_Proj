<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="/WEB-INF/tld/util-tags.tld"%>
<%@ taglib prefix="page" uri="/WEB-INF/tld/page-tags.tld"%>
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
<style type="text/css">

.parentDiv{
   margin-top: 10px;
}
 .floatcom{
  float:left; margin-left:20px;
}
.datastyle{
  text-align:center;
  width:70px;
  height:20px;
  color:#FDF5F7;
  background: #BD7421;
  line-height: 20px;
}
.pagenostyle{
   color:#FDF5F7;
   height:20px;
   text-align:center;
   background:#FF6600;
    width:90px;
   line-height: 20px;
}
.pagebody div{
   float:left;
   margin-left:20px;
 
}
.disabled{
  height:24px;
   color:#CECECE;
   background:#EFEFEF;
   margin-left:10px !important;
   border:1px solid #CECECE;
   line-height: 30px;
}
.activepage{
  height:24px;
  background:#EFEFEF;
   margin-left:10px !important;
   border:1px solid #CECECE;
}
.currentpage{
 text-align:center;
   height:24px;
    width:20px;
    color:#CECECE;
    background:#EFEFEF;
     margin-left:10px !important;
    border:1px solid #CECECE;
    line-height: 30px;
}
.label_form{
 float:left;
 margin-right:20px;
  margin-bottom: 16px;

}
.btn_form{
 float:left;
 margin-right:20px;
 padding-top: 23px;
  margin-bottom: 16px;
}
.addcondition{
 padding-top: 10px !important;
}
.result-float{
  width:70px;
  height:40px;
  border:solid  1px #A0BACD;
  float:left;
  background:#EFEFEF;
  color:#A49C9C;
  text-align:center;
  line-height:34px;
}
.resultCl{
	 background:#FFA1A1!important;
	 color:#990036!important;
}
</style>
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
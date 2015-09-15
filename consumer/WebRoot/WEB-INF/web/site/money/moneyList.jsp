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
  $(function(){
  
	  if('${startTime}' != null){
	     $("#startTime").val('${startTime}');
	  }
	   if('${endTime}' != null){
	     $("#endTime").val('${endTime}');
	  }
  
  
  })
  

</script>

</head>
<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="leftMenu.jsp"></jsp:include>
<!--彩种类型-->
<div class="Menubox_title">
	<ul id="gameType">
		<li value="wx" id="two1" class="hover"><span class="m">提现记录</span></li>
	</ul>
</div>
<form action="${pageContext.request.contextPath }/uc/moneyList" id="form" method="post" name="search">
	<table class="formTable">
		<tbody>
		<tr>
			<td>
			日期：
				<input id="startTime" name="startTime" type="text" onClick="WdatePicker()" />
				 至<input id="endTime" name="endTime" type="text"  onClick="WdatePicker()"/> 
				<input type="submit" value="查询" class="formCheck" style="margin: 0px 0px;" />
			<td>
		</tr>
		</tbody>
	</table>

<table class="grayTable">
          <tbody><tr>
            <th width="35px">序号</th>
            <th >金额</th>
            <th >余额</th>
            <th >时间</th>
            <th >说明</th>
            <th >状态</th>
          </tr>
          <c:if test="${page == null}">
	          <tr>
	            <td colspan="7">您暂时没有短消息</td>
	          </tr>
          </c:if>
          <c:if test="${page != null}">
          <c:forEach var="item" items="${page.result}">
              <tr>
	            <td>${item.id }</td>
	            <td>${item.amount }</td>
	            <td>	${item.beforeBalance+item.amount}</td> 
	            <td><fmt:formatDate value="${item.time.time}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
	             <td>${item.descr }</td>
	             <td>${item.type }</td>
	          </tr>
          </c:forEach>
           <tr>
               <td colspan="7">
                    <input type="hidden" id="pageNo" name="pageNo" value="1" />
					<jsp:include page="../../common/frontpager.jsp"/>
               </td>
             </tr>
          </c:if>
       	</tbody>
     </table>
   </form>  
<jsp:include page="../common/footer.jsp"></jsp:include>
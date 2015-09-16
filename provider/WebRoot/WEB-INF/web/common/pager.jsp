<%@page pageEncoding="UTF-8" contentType="text/html;charset=utf-8" errorPage="/error.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
function jumpPage(pageNo) {
    var reg = new RegExp("/^\d+$/");
    if(reg.test(pageNo)){
       alert("页数为整数");
       return;
    }
	$("#pageNo").val(pageNo);
	$("#form").submit();
}
$(function(){
 $("#goPageNo").keydown(function(e){
   if(e.keyCode>57&&e.keyCode<105){
     $("#goPageNo").val(1);
     return;
   }
   if(e.keyCode<49 || e.keyCode >105){
     $("#goPageNo").val(1);
     return;
   }
 });
})

</script>
<input type="hidden" name="pageNo" id="pageNo" value="1"/>
<div class="parentDiv">
<div class="floatcom datastyle">Data:<span>${page.totalCount}</span></div> &nbsp;&nbsp;
<div class="floatcom pagenostyle">Page: ${page.pageNo}/${page.totalPages}</div>
<div class="floatcom pagebody">

<c:set var="offset" value="2"/>
<c:set var="begin" value="${page.pageNo-offset}"/>
<c:set var="end" value="${page.pageNo+offset}"/>
<c:if test="${page.pageNo-offset<=0}">
<c:set var="end" value="${end+offset-page.pageNo+1}"/>
</c:if>
<c:if test="${end>=page.totalPages}">
<c:set var="beginOffset" value="${end-page.totalPages}"/>
<c:set var="begin" value="${begin-beginOffset}"/>
<c:set var="end" value="${page.totalPages}"/>
</c:if>
<c:if test="${begin<1}"><c:set var="begin" value="1"/></c:if>

<c:choose>
  <c:when test="${page.pageNo==1}">
    <div class="disabled">起始页</div> 
  </c:when>
   <c:otherwise>
      <div class="activepage"><a href="javascript:jumpPage(1)" class="pageNoborder">起始页</a></div>
   </c:otherwise>
</c:choose>
<c:forEach begin="${begin}" end="${end}" var="pno">
	<c:if test="${page.pageNo==pno}"><div class="currentpage">${pno}</div></c:if>
	<c:if test="${page.pageNo!=pno}"><div><a href="javascript:jumpPage(${pno})">${pno}</a></div> </c:if>
</c:forEach>
<c:choose>
   <c:when test="${page.pageNo==page.totalPages}">
   <div class="disabled">结束页</div>
   </c:when>
   <c:otherwise>
     <div class="activepage"><a href="javascript:jumpPage(${page.totalPages})" class="pageNoborder">结束页</a></div> 
   </c:otherwise>
</c:choose>
<div> 跳至<input type="text" style="width:2em;" id="goPageNo" value="1" >页
<input type="button" value="Go" onclick="javascript:jumpPage($('#goPageNo').val())"></div>
</div>
</div>
  
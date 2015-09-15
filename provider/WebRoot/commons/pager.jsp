<%@page pageEncoding="UTF-8" contentType="text/html;charset=utf-8" errorPage="/error.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
function jumpPage(pageNo) {
	$("#pageNo").val(pageNo);
	$("#form").submit();
}
</script>
<input type="hidden" name="pageNo" id="pageNo" value="1"/>
每页${page.pageSize}条 &nbsp;&nbsp;共${page.totalCount}条记录 &nbsp;&nbsp;
 第${page.pageNo}页/共${page.totalPages}页 
<span class="paging">
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
<s:if test="page.pageNo==1"><span class="disabled">第一页</span></s:if>
<s:else>
	<a href="javascript:jumpPage(1)" class="pageNoborder">第一页</a>
</s:else>
<c:forEach begin="${begin}" end="${end}" var="pno">
	<c:if test="${page.pageNo==pno}"><span class="current">${pno}</span></c:if>
	<c:if test="${page.pageNo!=pno}"><a href="javascript:jumpPage(${pno})">${pno}</a></c:if>
</c:forEach>
<s:if test="page.pageNo==page.totalPages"><span class="disabled">最后一页</span></s:if>
<s:else>
	<a href="javascript:jumpPage(${page.totalPages})" class="pageNoborder">最后一页</a>
</s:else>
</span>
 跳至<input type="text" style="width:2em;" id="goPageNo" onkeypress="if(event.keyCode<48||event.keyCode>57)event.keyCode=8">页
 <input type="button" value="确定" onclick="javascript:jumpPage($('#goPageNo').val())">
   	
  
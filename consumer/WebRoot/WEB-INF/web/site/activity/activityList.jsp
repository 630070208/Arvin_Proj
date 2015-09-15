<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="/WEB-INF/tld/util-tags.tld"%>
<%@ taglib prefix="page" uri="/WEB-INF/tld/page-tags.tld"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>个人中心</title>
<jsp:include page="../common/resource.jsp"></jsp:include>
<script type="text/javascript">
function onActiviClick(value){
	$("#frame").attr("src",value);
}
</script>
</head>
<jsp:include page="../common/header.jsp"></jsp:include>
<div class="bet_bg">
	<div class="bet_content">
		<!--彩种导航开始-->
		<div class="sidebar" id="sidebar">
			<div class="return_home">
				<a href="/index.php" class="btn"></a>
			</div>
			<!--<div class="hot_activity"><a href="#" class="btn"></a></div>-->
			<div class="nav">
				<dl>
					<dt class="gaoping"></dt>
					<dd class="on">
						<a href="#" class="on" onClick="onActiviClick('http://www.baidu.com/')">我是活动标题</a>
					</dd>
				</dl>
			</div>
		</div>
		<!--彩种导航结束-->
		<!-- 投注区开始-->
		<div class="bet_right">
			<!--彩种类型-->
			<div class="Menubox_title">
				<ul id="gameType">
					<li value="wx" id="two1" class="hover"><span class="m">活动详情</span>
					</li>
				</ul>
			</div>
			<div>
				<iframe id="frame" width="100%" height="640px"> </iframe>
			</div>
			<jsp:include page="../common/footer.jsp"></jsp:include>
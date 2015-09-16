<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<aside id="column-secondary-2">
	<article class="sub-navigation-element compact">
		<div id="elastic-list-860168" class="widget elastic-list">
			<h4 class="heading">个人中心</h4>
			<ul class="menu">
				<li
					class="visible <c:if test="${'userIndexPage'== pageId}"> active</c:if>">
					<a href="/uc/userIndexPage">账户总览</a></li>
				<li
					class="visible <c:if test="${'buyListPage'== pageId}"> active</c:if>">
					<a href="/uc/buyListPage">消费纪录</a></li>
				<li
					class="visible <c:if test="${'modifyUserInfoPage'== pageId}"> active</c:if>">
					<a href="/uc/modifyUserInfoPage">完善资料 </a></li>
<!-- 				<li -->
<!-- 					class="visible <c:if test="${'passwordSafePage'== pageId}"> active</c:if>"> -->
<!-- 					<a href="/uc/passwordSafePage">密保设定 </a></li> -->
				<li
					class="visible <c:if test="${'modifyPasswordPage'== pageId}"> active</c:if>">
					<a href="/uc/modifyPasswordPage">密码修改 </a></li>
				<li
					class="visible <c:if test="${'orderList'== pageId}"> active</c:if>">
					<a href="/uc/orderList">订单查询 </a></li>
				<li
					class="visible <c:if test="${'winningListPage'== pageId}"> active</c:if>">
					<a href="/uc/winningListPage">中奖查询 </a></li>
			</ul>
			<br>
		</div>
	</article>
</aside>
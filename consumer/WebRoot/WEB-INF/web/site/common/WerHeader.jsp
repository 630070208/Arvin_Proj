<%@page import="java.math.BigDecimal"%>
<%@page import="org.springframework.security.core.userdetails.UserDetails"%>
<%@page import="org.springframework.security.core.Authentication"%>
<%@page import="com.game.common.entity.uc.Member"%>
<%@page import="com.game.common.utils.StrUtil"%>
<%@page	import="org.springframework.security.core.context.SecurityContextImpl"%>
<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %> 
 <style>
 
 .spec_li li{
	margin-left:55px;
  }
 
 </style>
 
 
<header id="header">
	<div class="top-container">
		<div class="header-container">
			<!-- <h1 class="header-controls-heading"
				title="Sportsbook, Casino, Poker &amp; Bingo Games Online">
				福利彩票,高频彩票 &amp; 在线打彩</h1> -->
			<div class="header-controls">
				<ul class="header-menu">
					<li class="menu-item"><a href="javascript:()void"
						target="_blank">获取帮助</a></li>
					<li class="menu-item"><a href="javascript:()void">关于我们</a></li>
					<li class="menu-item"><a href="javascript:()void"
						onclick="addfavorite()">加入收藏</a></li>
				</ul>
			</div>
		</div>
	</div>

	<div id="drawer-top" class="drawer hidden">
		<div class="drawer-content"></div>
	</div>
	<div class="bottom-container">
		<div class="header-container">
			<!-- <div id="logo">
				<a href="/index">WerCai</a>
			</div> -->
			<div class="account-container">
				<div class="widget login" id="login-box-4276">
					<div class="login-content">
						<form method="post" action="/j_spring_security_check"
							id="login-form-4276">
							<fieldset>
								<ul class="header-list">
									<li style="font-size: 18px;text-shadow: 0px -1px 0px rgba(0, 0, 0, 0.6);">登录用户：${wer_member.nickname } &nbsp;&nbsp;
										余额：<font color="red" id="nowMoney"></font>
									</li>
								</ul>
							</fieldset>
						</form>
						<div class="register-button-container">
							<a href="/j_spring_security_logout" name="button-register"
								data-track-action="Click /start" data-track-category="Login Box"
								data-automated-function="clickTracker"
								data-track-label="Register"
								class="btn btn-cta automated link-track button-register">退出登录</a>
						</div>
					</div>
				
					<div id="request-credentials-658438"	class="widget request-credentials hidden"></div>
				</div>
			</div>
		</div>
	</div>

	<div id="drawer-bottom" class="drawer hidden">
		<div class="drawer-content"></div>
	</div>
</header>





<div id="navigation-484666" class="widget navigation">
	<div id="nav-main" class="main-navigation">
		<nav>
			<ul class="product-navigation spec_li">
				<li><a href="/game/cqssc/bet" class="has-icon-prefix link-item"><i
						class="icon-prefix icon icon-main-nav icon-main-nav-casino"></i><span
						class="text">购彩大厅</span> </a>
				</li>
				<li><a href="/uc/userIndexPage"
					class="has-icon-prefix link-item"><i
						class="icon-prefix icon icon-main-nav icon-main-nav-games"></i><span
						class="text">个人中心</span> </a>
				</li>
				<security:authorize ifAnyGranted="ROLE_ZDl">
					<li><a href="/uc/memberReportPage"
						class="has-icon-prefix link-item"><i
							class="icon-prefix icon icon-main-nav icon-main-nav-live-casino"></i><span
							class="text">代理信息</span> </a>
					</li>
				</security:authorize>
				<li><a href="/uc/rechargePage"
					class="has-icon-prefix link-item"><i
						class="icon-prefix icon icon-main-nav icon-main-nav-bingo"></i><span
						class="text">充值提现</span> </a>
				</li>
				<li><a href="/uc/inboxPage" class="has-icon-prefix link-item"><i
						class="icon-prefix icon icon-promotion"></i><span class="text">系统公告</span>
				</a>
			</ul>
		</nav>
	</div>
</div>





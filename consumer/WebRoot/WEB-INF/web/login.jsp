<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/wer/css/Login.css">
<script src="/site/jquery/jquery-1.9.1.min.js"></script>
<script src="/site/js/login.js"></script>
<title>登录系统</title>
</head>
<body onkeydown="keyLogin();">
	<div id="header" class="transparentDiv">
		<div class="header-block">
			<div class="header-container">
				<!-- Logo -->
				<h1 class="login-logo">
					<img src="/wer/imgs/logo.png">
				</h1>
				<!-- Buttons -->
				<div class="sign-btn-block ">
					<!-- <a href="javascript:()void;" onclick="onLoginBtnClick()"
						class="btn-blue">登录系统</a>
						 <a href="javascript:()void;"
						onclick="onRegBtnClick()" class="btn-orange">注册会员</a> -->
				</div>
			</div>
		</div>
	</div>
	<div class="shadow">&nbsp;</div>
	<div class="login-container">
		<div id="login" class="login">
			<h1 style="color: white;">会员登录</h1>
			<form id="login-form" action="/j_spring_security_check" class="form"
				method="post">
				<input type="hidden" value="" id="refUrl" name="refUrl" />
				<div class="ipt ipt-t user showPlaceholder" id="idInputLine">
					 <input	type="text" id="j_username" placeholder="登录账号" name="j_username">
				</div>

				<div class="ipt ipt-t user showPlaceholder" id="idInputLine">
					<input type="password" id="j_password" placeholder="登录密码" value="" name="j_password">
				</div>
				<div class="ipt ipt-t user showPlaceholder" id="idInputLine">
					<input type="text" id="randImgValue"  placeholder="验证码" name="randImgValue" style="width:180px; float:left">
					<img alt="验证码" id="randImg" src="/imageServlet" style="float:right; margin-top: 2px;">
				</div>

				
				<!-- <div class="form-group" style="text-align: center;">
					<button class="btn btn-default"
						onclick="javascript:window.location.href='/uc/findPW';">
						找回密码</button>
				</div> -->
			</form><div class="form-group">
					<button type="button" id="login-btn"
						class="btn btn-primary btn-block">登录系统</button>
				</div>
		</div>

		<div id="reg" class="login" style="display: none;">
			<h1 style="color: white;">注册新会员</h1>
			<form id="reg-form" class="form" method="post">
				<input type="hidden" value="" id="refUrl" name="refUrl" />
				<div class="ipt ipt-t user showPlaceholder" id="idInputLine">
					<input type="text" id="sysCode" name="sysCode"> <label
						id="sysCodeLabel" class="placeholder">登录账号</label>
				</div>

				<div class="ipt ipt-t user showPlaceholder" id="idInputLine">
					<input type="password" id="sysPwd" value="" name="sysPwd">
					<label id="sysPwdLabel" class="placeholder">登录密码</label>
				</div>
				<div class="ipt ipt-t user showPlaceholder" id="idInputLine">
					<input type="password" id="pass2" value="" name="pass2"> <label
						id="pass2Label" class="placeholder">重复密码</label>
				</div>
				<div class="form-group">
					<input type="button" onclick="doReg()" value="提交注册" class="btn btn-primary btn-block"> 
				</div>
			</form>
		</div>
		<div id="reg-success" class="login" style="display: none;float:inherit; width: auto;">
			<h1 style="color: white;">(＾▽＾)ｺ祝贺你注册成功</h1>
			<form class="form" method="post">
				<div class="form-group" style="text-align: center;">
					<a class="btn btn-success" href="/index" style="float:inherit;text-decoration: none;font-size: 16px">
						进入系统
					</a>
				</div>
			</form>
		</div>



	</div>
	
	<div id="footer"  style="display: none;">
		<div class="footer-block">
			<div class="footer-container">
				<nav class="footer-list">
					<ul>
						<li><a href="http://chrome.360.cn/"
							class="has-icon-prefix automated" target="_blank"> <i
								class="icon-prefix icon icon-none"></i> <span class="text"
								style="font-weight: bold;font-size: 16px;">支持的浏览器:</span> </a></li>
						<li><a href="http://www.google.com/chrome"
							class="has-icon-prefix automated" target="_blank"> <i
								class="icon-prefix icon icon-browser-chrome" title="谷歌浏览器"></i>
								<span class="text">谷歌Chrome</span> </a></li>
						<li><a href="http://chrome.360.cn/"
							class="has-icon-prefix automated" target="_blank"> <i
								class="icon-prefix icon icon-browser-360"></i> <span
								class="text">360极速</span> </a></li>
						<li><a
							href="http://windows.microsoft.com/zh-cn/internet-explorer/download-ie-MCM"
							class="has-icon-prefix automated" target="_blank"> <i
								class="icon-prefix icon icon-browser-ie"></i> <span class="text">微软IE10</span>
						</a></li>
						<li><a href="https://www.mozilla.org/zh-CN/firefox/new/"
							class="has-icon-prefix automated" target="_blank"> <i
								class="icon-prefix icon icon-browser-firefox"></i> <span
								class="text">火狐</span> </a></li>
						<li><a href="http://www.apple.com/cn/safari/"
							class="has-icon-prefix automated" target="_blank"> <i
								class="icon-prefix icon icon-browser-safari"></i> <span
								class="text">苹果Safari</span> </a></li>
					</ul>
				</nav>
				<a href="#" class="logo">cage</a> <span class="copy"><b>©</b>
					2013-2014 WERCAI.COM 版权所有</span>
			</div>
		</div>
	</div>
</body>
</html>

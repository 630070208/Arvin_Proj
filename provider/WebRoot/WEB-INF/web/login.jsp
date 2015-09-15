<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html dir="ltr">
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>管理员登录</title>
	<!--- CSS --->
	<link rel="stylesheet" href="/css/login.css" type="text/css" />
	<!--- Javascript libraries (jQuery and Selectivizr) used for the custom checkbox --->
	<!--[if (gte IE 6)&(lte IE 8)]>
		<script type="text/javascript" src="/web/js/jquery/jquery-1.7.2.js"></script>
		<script type="text/javascript" src="/web/js/jquery/selectivizr.js"></script>
		<noscript><link rel="stylesheet" href="fallback.css" /></noscript>
	<![endif]-->
	</head>
	<body>
		<div id="container">
			<form class="" action="/j_spring_security_check" method="post" name="form" id="from">
				<div class="login">管理员登陆</div>
				<div class="username-text">账号:</div>
				<div class="password-text">密码:</div>
				<div class="username-field">
					<input type="text" id="j_username" name="j_username"/>
				</div>
				<div class="password-field">
					<input type="password" id="j_password" name="j_password"/>
				</div>
				<input type="checkbox" name="remember-me" id="remember-me" /><label for="remember-me">自动登录</label>
				
				<div class="forgot-usr-pwd">玩儿出自己的精彩！</div>
				<input type="submit" name="submit" value="登录" />
			</form>
		</div>
		<div id="footer">
			玩儿出自己的精彩！Take a chance,live life!
		</div>
</body>

</html>
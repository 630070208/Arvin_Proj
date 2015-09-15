<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/wer/css/Login.css">
<script src="/site/jquery/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#sysCode").blur(function() {
			if ($(this).val().length > 0) {
				$("#sysCodeLabel").hide();
			} else {
				$("#sysCodeLabel").show();
			}
		});
		$("#sysPwd").blur(function() {
			if ($(this).val().length > 0) {
				$("#sysPwdLabel").hide();
			} else {
				$("#sysPwdLabel").show();
			}
		});
		$("#pass2").blur(function() {
			if ($(this).val().length > 0) {
				$("#pass2Label").hide();
			} else {
				$("#pass2Label").show();
			}
		});
		$("#sysCode").change(function() {
			if ($(this).val().length > 0) {
				$("#sysCodeLabel").hide();
			} else {
				$("#sysCodeLabel").show();
			}
		});
		$("#sysPwd").change(function() {
			if ($(this).val().length > 0) {
				$("#sysPwdLabel").hide();
			} else {
				$("#sysPwdLabel").show();
			}
		});
		$("#pass2").change(function() {
			if ($(this).val().length > 0) {
				$("#pass2Label").hide();
			} else {
				$("#pass2Label").show();
			}
		});
		//得到焦点
		$("#sysCode").focus(function() {
				$("#sysCodeLabel").hide();
		});
		$("#sysPwd").focus(function() {
				$("#sysPwdLabel").hide();
		});
		$("#pass2").focus(function() {
				$("#pass2Label").hide();
		});
		
		
		$("#userNameLabel").click(function() {
				$("#j_username").focus();
		});
		$("#userPassLabel").click(function() {
				$("#j_password").focus();
		});
		$("#sysCodeLabel").click(function() {
				$("#sysCode").focus();
		});
		$("#sysPwdLabel").click(function() {
				$("#sysPwd").focus();
		});
		$("#pass2Label").click(function() {
				$("#pass2").focus();
		});
		
		
	});
	function onLoginBtnClick() {
		window.location.href="/login";
	}
	function onRegBtnClick() {
		window.location.href="signup";
	}
	function doReg() {
		alert("0000");
		var uName = $.trim($("#sysCode").val());
		var pass = $("#sysPwd").val();
		var pass2 = $("#pass2").val();
		if (uName == "") {
			alert("请输入合法用户名.");
			return;
		}
		if (pass != pass2) {
			alert("俩次密码输入不一致.");
			return;
		}
		$.ajax({
		url : "/registered",
		data : {"sysCode":uName,"sysPwd":pass},
		type : "post",
		cache : false,
		dataType : "json",
		success : function(result) {
			if (result.success) {
				alert("注册成功");
				window.open("/index");
			} else {
				alert("注册失败:" + result.message);
			}
		},
		error : function(data){
			//alert("注册失败");
		}
	});
	}
</script>
<title>登录系统</title>
</head>
<body>
	<div id="header" class="transparentDiv">
		<div class="header-block">
			<div class="header-container">
				<!-- Logo -->
				<h1 class="login-logo">
					<img src="/wer/imgs/logo.png">
				</h1>
				<!-- Buttons -->
				<div class="sign-btn-block ">
					<a href="javascript:()void;" onclick="onLoginBtnClick()"
						class="btn-blue">登录系统</a>
				</div>
			</div>
		</div>
	</div>
	<div class="shadow">&nbsp;</div>
	<div class="login-container">
		<div id="reg" class="login">
			<h1 style="color: white;">注册新会员</h1>
			<form id="reg-form" class="form" method="post">
				<input type="hidden" value="" id="refUrl" name="refUrl" />
				<div class="ipt ipt-t user showPlaceholder" id="idInputLine">
					<input type="text" id="sysCode" name="sysCode"> 
					<label id="sysCodeLabel" class="placeholder">登录账号</label>
				</div>

				<div class="ipt ipt-t user showPlaceholder" id="idInputLine">
					<input type="password" id="sysPwd" value="" name="sysPwd">
					<label id="sysPwdLabel" class="placeholder">登录密码</label>
				</div>
				<div class="ipt ipt-t user showPlaceholder" id="idInputLine">
					<input type="password" id="pass2" value="" name="pass2"> 
					<label id="pass2Label" class="placeholder">重复密码</label>
				</div>
				<div class="form-group">
					<input type="button" onclick="doReg()" value="提交注册" class="btn btn-primary btn-block"> 
				</div>
			</form>
		</div>
		<div id="reg-success" class="login" style="display: none;">
			<h1 style="color: white;">注册成功</h1>
			<form id="login-form" action="/j_spring_security_check" class="form"
				method="post">
				<input type="hidden" value="" id="refUrl" name="refUrl" />
				<div class="ipt ipt-t user showPlaceholder" id="idInputLine">
					<label class="placeholder" style="width:270px">(＾▽＾)ｺ祝贺你,您的账号以成功注册</label>
				</div>

				<div class="form-group" style="text-align: center;">
					<a class="btn btn-primary" href="/index"
						style="float:inherit;text-decoration: none;font-size: 16px">
						进入系统</a>
				</div>
			</form>
		</div>
	</div>
	<div id="footer">
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
	<!-- /#login-container -->
	<script type="text/javascript">
		var Login = function() {
			"use strict";

			return {
				init : init
			};

			function init() {
				$.support.placeholder = false;
				var test = document.createElement('input');
				if ('placeholder' in test)
					$.support.placeholder = true;

				if (!$.support.placeholder) {
					$('#login-form').find('label').show();
				}
			}
		}();

		$(function() {

			Login.init();

		});
		var refUrl = document.referrer;
		document.getElementById("refUrl").value = refUrl;
	</script>

</body>
</html>

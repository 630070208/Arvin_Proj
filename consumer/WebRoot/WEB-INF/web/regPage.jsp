<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>注册新用户</title>
<link rel="stylesheet" type="text/css" href="/wer/css/wer.css">
<link rel="stylesheet" type="text/css" href="/wer/css/component.css">
<style type="text/css">
#regPanel{
	width: 50%;
	margin: 0 auto;
	background: #181d3a;
	padding:5px;
	line-height:22px;
}
#pageContent{
	text-align: center;
	margin: 0 auto;
}
#regPanel table tr td:first-child{
	color:#FFF;
}
#regPanel table tr{
	line-height: 49px;
}
</style>
</head>
<body>
	<div class="wrap">
		<div class="logo">
			<a> <img src="/wer/imgs/logo.png" style="width:150px"> </a>
		</div>
		<div class="clear"></div>
		<div id="pageContent" style="padding-top: 15px">
			<h2 style="text-align: center;color:#019dd0">欢迎注册新会员</h2>
			<div id="regPanel">
				<table>
					<tr>
						<td style="text-align: right;width: 150px">登录账号：</td>
						<td><input type="text" style="width: 250px"> </td>
					</tr>
					<tr>
						<td style="text-align: right;width: 150px">登录密码：</td>
						<td><input type="text" style="width: 250px"> </td>
					</tr>
				</table>
				
			</div>
		</div>
	</div>

</body>
</html>

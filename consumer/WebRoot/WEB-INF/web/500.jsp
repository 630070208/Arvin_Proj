<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<title>Error 500</title>
<jsp:include page="site/common/WerResources.jsp"></jsp:include>
<link rel="stylesheet"
	href="/wer/css/nivo-slider/themes/default/default.css" type="text/css"
	media="screen" />
<link rel="stylesheet" href="/wer/css/error.css" type="text/css"
	media="screen" />
<script type="text/javascript">

</script>
</head>
<body class="layout-two-column unibet custom-background">
	<div id="container">
		<jsp:include page="site/common/WerHeader.jsp"></jsp:include>
		<div id="content">
			<div id="top">
				<div class="inner">
					<div class="site-takeover text-align-center color-theme-1">
						<div class="wrapper">
							<h2 class="headline" style="color: red;">Error 500 系统错误</h2>
							<br>
							<p class="body">非常抱歉,当前无法访问此页面!</p>
							<p> <a href="/index" class="btn automated link-track">回到首页面</a>
								</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="site/common/WerFooter.jsp"></jsp:include>
	</div>
</body>
</html>

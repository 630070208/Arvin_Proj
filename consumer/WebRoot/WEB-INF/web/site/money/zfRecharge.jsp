<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="no-js ie ie67 ie678 ie6789" lang="en"><![endif]-->
<!--[if IE 7 ]><html class="no-js ie ie67 ie678 ie6789 ie7" lang="en"><![endif]-->
<!--[if IE 8 ]><html class="no-js ie ie678 ie6789 ie8" lang="en"><![endif]-->
<!--[if IE 9 ]><html class="no-js ie ie6789 ie9" lang="en"><![endif]-->
<!--[if !(IE)]><!-->
<html lang="en">
  <!--<![endif]-->
<head>
<title>${bank}充值跳转中。。。</title>
<jsp:include page="../common/WerResources.jsp"></jsp:include>

</head>
<body class="layout-two-column unibet custom-background">
	<div id="container">
		<jsp:include page="../common/WerHeader.jsp"></jsp:include>
		<div style="text-align: center; color: red;">
			<form method="post" name="subForm" id="subForm" action="https://pay.dinpay.com/gateway" target="_blank">
				<br>
				<input type="hidden" name="sign_type" value='${pay.sign_type}'/><br>
				<input type="hidden" name="service_type" value='${pay.service_type}'/><br>
				<input type="hidden" name="product_name" value='${pay.product_name}'/><br>
				<input type="hidden" name="input_charset" value='${pay.input_charset}'/><br>
				<input type="hidden" name="notify_url" value='${pay.notify_url}'/><br>
				<input type="hidden" name="bank_code" value='${pay.bank_code}'/><br>
				<input type="hidden" name="merchant_code" value='${pay.merchant_code}'/><br>
				<input type="hidden" name="order_no" value='${pay.order_no}'/><br>
				<input type="hidden" name="sign" value='${pay.sign}'/><br>
				<input type="hidden" name="order_amount" value='${pay.order_amount}'/><br>
				<input type="hidden" name="interface_version" value='${pay.interface_version}'/><br>
				<input type="hidden" name="product_num" value='${pay.product_num}'/><br>
				<input type="hidden" name="redo_flag" value='${pay.redo_flag}'/><br>
				<input type="hidden" name="order_time" value='${pay.order_time}'/><br>
			</form>
		</div>
		<jsp:include page="../common/WerFooter.jsp"></jsp:include>
	</div>
</body>
<script type="text/javascript">
	document.subForm.submit()
</script>
</html>
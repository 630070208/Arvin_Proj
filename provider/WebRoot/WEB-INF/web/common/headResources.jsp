<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css"
	href="/bootstrap/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/css/App.css">
<link rel="stylesheet" type="text/css" href="/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="/css/select2.css">
<link rel="stylesheet" href="/bootstrap/bootstrap-fileupload.css"
	type="text/css" />
<link rel="stylesheet" href="/css/magnific-popup.css" type="text/css" />
<link rel="stylesheet" href="/css/bootstrap-timepicker.css" type="text/css" />

<script src="/jquery/jquery-1.9.1.min.js"></script>
<script src="/jquery/jquery-ui-1.9.2.custom.min.js"></script>
	
<script src="/bootstrap/bootstrap.min.js"></script>
<script src="/bootstrap/bootstrap-fileupload.js"></script>
<!-- 日期插件 -->
<script src="/js/App.js"/>
<script src="/js/plugins/select2/select2.js"></script>
<script src="/js/plugins/icheck/jquery.icheck.min.js"> </script>
<script src="/js/plugins/magnific/jquery.textarea-counter.js"></script>
<script src="/js/jquery.magnific-popup.min.js"></script>
<script src="/js/plugins/bootstrap-datepicker.js"></script>
<script src="/js/plugins/bootstrap-timepicker.js"></script>
<script src="/js/common/ajax_request.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('.popup-file').magnificPopup({
			type : 'inline',
			preloader : false,
			focus : '#name',
			callbacks : {
				beforeOpen : function() {
					if ($(window).width() < 700) {
						this.st.focus = false;
					} else {
						this.st.focus = '#name';
					}
				}
			}
		});

		$('.image-pop').magnificPopup({
			type : 'image',
			closeOnContentClick : true,
			mainClass : 'mfp-img-mobile',
			image : {
				verticalFit : true
			}

		});
		
		//$('.date-input').datepicker ();
		
	});
	
	//操作成功提示
	var message = "${msg}";
	if(message!=""){ 
	   alert(message); 
	}
	
</script>

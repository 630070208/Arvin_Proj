<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="no-js ie ie67 ie678 ie6789" lang="en"><![endif]-->
<!--[if IE 7 ]><html class="no-js ie ie67 ie678 ie6789 ie7" lang="en"><![endif]-->
<!--[if IE 8 ]><html class="no-js ie ie678 ie6789 ie8" lang="en"><![endif]-->
<!--[if IE 9 ]><html class="no-js ie ie6789 ie9" lang="en"><![endif]-->
<!--[if !(IE)]><!-->
<html lang="en">
  <!--<![endif]-->
<head>
<title>${type.desc}历史开奖记录</title>
<jsp:include page="../common/WerBetResource.jsp"></jsp:include>

<script type="text/javascript">
	var tp ="${type}";
	$(function(){
		$("#"+tp.toLocaleLowerCase()).addClass("active");
		function ajx_history(num){
			var data = {"num":num};
			ajaxRequest("/history/searchs/"+tp.toLocaleLowerCase(),data,"POST",resultHandler,faultHander);
			function resultHandler(data){
				if(data.flag){
					var htm="";
					for(var i =0; i<data.issues.length;i++){
					   htm+="<tr><td style=' text-align:center; '>"+data.issues[i].issueCode+"</td>";
					   var open = data.issues[i].prizeResult;
					   var opens = open.split(",");
					   	htm+="<td style=' text-align:center; '>";
					   for(var j=0;j<opens.length;j++){
					   		htm+="<span>&nbsp;&nbsp;"+opens[j]+"&nbsp;&nbsp;</span>";
					   }
					   //htm+="<td>"+data.issues[i].prizeResult+"</td>";	
					   htm+="</td>";
					}
					$("#history").html(htm);
				}else{
					lottery.dialog("提示！",data.msg);
				}
			}
			function faultHander(data){
				lottery.dialog("提示！","查询异常!");
			}
		}
		ajx_history(50);
		$("#selectNum").change(function(){
			ajx_history($(this).val());
		});
	});

</script>
</head>
<body class="layout-two-column unibet custom-background">
	<div id="container">
		<jsp:include page="../common/WerHeader.jsp"></jsp:include>
		<!--头   结束-->
		<!--bet Start-->
		<div id="content">
			<div id="top">
				<div class="inner"></div>
			</div>
			<div id="main" role="main">
				<div class="main-container">
					<jsp:include page="../common/historyMenu.jsp"></jsp:include>
					<!--彩种导航结束-->
					<div class="stack gutter-col size4of5">
						<article class="rich-text-element main-column">
							<article class="widget registration-form">
								<div id="subContent_bet" class="operate box">
									<div class="Contentbox" id="lotteryDetail">
										<div>
											<div style="display: block; float: right;"><span>
												<select id="selectNum">
													<option value="50">50期</option>
													<option value="100">100期</option>
													<option value="150">150期</option>
													<option value="200">200期</option>
												</select>
											</span></div>
										</div>
										<div>
											<table class="bingo-game-chooser-table table-decoration-7 color-theme-4">
												<thead>
													<tr>
														<th style=' text-align:center; '><div class="title"><span>期数</span></div></th>
														<th style=' text-align:center; '><div class="title"><span>开奖号码</span></div></th>
													</tr>
												</thead>
												<tbody id="history">
													
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</article>
						</article>
					</div>
				</div>
			</div>
		</div>
		<!-- bet -->
		<div style="clear:both"></div>
		<jsp:include page="../common/WerFooter.jsp"></jsp:include>
	</div>
</body>
</html>

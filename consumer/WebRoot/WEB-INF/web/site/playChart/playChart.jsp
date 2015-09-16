<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="/WEB-INF/tld/util-tags.tld"%>
<%@ taglib prefix="page" uri="/WEB-INF/tld/page-tags.tld"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>">
<title>订单查询</title>
<link rel="stylesheet" type="text/css" href="/wer/css/menu.css">
<link rel="stylesheet" type="text/css" href="/wer/css/playChart.css">
<jsp:include page="../common/WerResources.jsp"></jsp:include>
<script>
	$(function() {
		$("#menu_chart").addClass("on");
		loadIssueConfig();
	});
	function loadIssueConfig(){
		ajaxRequest("/playChartOpen","","POST",resultHandler,faultHandler);
		function resultHandler(data){
			if(data.data.code==0){
				alert(data.current.msg);
				currentIssue="";
				return ;
			}else{
				initTbody(data.data.result);
			}
			
		}
		function faultHandler(data){
			App.alert("提示！","获取彩期失败，请刷新页面重试。");
		}
	}
	
	function initTbody(datas){
		var html="";
		for(var i=0;i<datas.length;i++){
			if(datas[i].lotteryNo!=undefined&&datas[i].lotteryNo!=""){
				html=html+initTr(datas[i]);
			}
		}
		$("#numTbody").html(html);
	}
	
	function initTr(data){
		var tr='<tr><td class="period no0">'+data.issueNumber+'</td>';
		tr=tr+'<td class="awardTd no0">'+data.lotteryNo.split(",").join(" ")+'</td>';
		tr=tr+getNoTd(data.lotteryNo)+"</tr>";		
		return tr;								
	}
	
	function getNoTd(lotteryNo){
		var td="";
		var nums=lotteryNo.split(",");
		for(var i=0;i<nums.length;i++){
			//nums[i]=Math.round(Math.random()*10);
			for(var n=0;n<10;n++){
				var cls="";
				if(n==0){
					cls="no0";
				}
				if(nums[i]==n){
					cls=cls+' numOn';
				}
				if(cls==""){
					td=td+'<td>'+n+'</td>';
				}else{
					td=td+'<td class="'+cls+'">'+n+'</td>';
				}
			}
		}
		return td;
	}
	
</script>
</head>
<body>
	<jsp:include page="../common/page_header.jsp"></jsp:include>
	<div id="container">
		<div id="content">
			<!--左侧菜单  开始-->
			<!-- 左侧菜单 结束 -->
			<!--  -->
			<div id="data_content">
				<div class="panel_box">
					<div class="panel_title">
						<h3 class="title">
							<span>开奖走势</span>
						</h3>
					</div>
					<div class="panel_con">
						<table class="winnerNum_table" id="numTable">
							<thead>
								<tr>
									<th class="period" rowspan="2">期号</th>
									<th class="openNo no0" rowspan="2">开奖号码</th>
									<th class="no0" colspan="10">万位走势</th>
									<th class="no0" colspan="10">千位走势</th>
									<th class="no0" colspan="10">百位走势</th>
									<th class="no0" colspan="10">十位走势</th>
									<th class="no0" colspan="10">个位走势</th>
								</tr>
								<tr class="ti_no_tr">
									<th class="no0">0</th>
									<th>1</th>
									<th>2</th>
									<th>3</th>
									<th>4</th>
									<th>5</th>
									<th>6</th>
									<th>7</th>
									<th>8</th>
									<th>9</th>
									<th class="no0">0</th>
									<th>1</th>
									<th>2</th>
									<th>3</th>
									<th>4</th>
									<th>5</th>
									<th>6</th>
									<th>7</th>
									<th>8</th>
									<th>9</th>
									<th class="no0">0</th>
									<th>1</th>
									<th>2</th>
									<th>3</th>
									<th>4</th>
									<th>5</th>
									<th>6</th>
									<th>7</th>
									<th>8</th>
									<th>9</th>
									<th class="no0">0</th>
									<th>1</th>
									<th>2</th>
									<th>3</th>
									<th>4</th>
									<th>5</th>
									<th>6</th>
									<th>7</th>
									<th>8</th>
									<th>9</th>

									<th class="no0">0</th>
									<th>1</th>
									<th>2</th>
									<th>3</th>
									<th>4</th>
									<th>5</th>
									<th>6</th>
									<th>7</th>
									<th>8</th>
									<th>9</th>
								</tr>
							</thead>
							<tbody id="numTbody">
											<tr>
												<td class="period no0">${item.issueNumber }</td>
												<td class="awardTd no0">99951</td>
												<td class="no0">0</td>
												<td class="numOn">1</td>
												<td>2</td>
												<td>3</td>
												<td>4</td>
												<td>5</td>
												<td>6</td>
												<td>7</td>
												<td>8</td>
												<td>9</td>

												<td class="no0">0</td>
												<td>1</td>
												<td>2</td>
												<td>3</td>
												<td>4</td>
												<td>5</td>
												<td>6</td>
												<td>7</td>
												<td>8</td>
												<td>9</td>

												<td class="no0">0</td>
												<td>1</td>
												<td>2</td>
												<td>3</td>
												<td>4</td>
												<td>5</td>
												<td>6</td>
												<td>7</td>
												<td>8</td>
												<td>9</td>

												<td class="no0">0</td>
												<td>1</td>
												<td>2</td>
												<td>3</td>
												<td>4</td>
												<td>5</td>
												<td>6</td>
												<td>7</td>
												<td>8</td>
												<td>9</td>

												<td class="no0">0</td>
												<td>1</td>
												<td>2</td>
												<td>3</td>
												<td>4</td>
												<td>5</td>
												<td>6</td>
												<td>7</td>
												<td>8</td>
												<td>9</td>
											</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>

		</div>
	</div>
	<jsp:include page="../common/page_footer.jsp"></jsp:include>
</body>
</html>
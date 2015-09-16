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
    <title>快乐十分</title>
   <jsp:include page="common/WerBetResource.jsp"></jsp:include>
   <script type="text/javascript">
   $(function(){
	   	isSale='${issuConf.isSale}';
	   	var issueHtm="<span class='current-stage'>";
	   	if(isSale =='true'){
	   		issueHtm+=" 当前第<font class='hs' id='current_issue'>${issue.issueCode}</font>期 <br>距离投注截止还剩：</font>";
	   	}else{
	   		issueHtm+="<br><br><font size='5' color='#BEBFC3'>${issuConf.gameType.desc}暂未开售</font>";
	   	}
	   	issueHtm+="</span>";
	   	$("#nowIssues").html(issueHtm);
		currentGame = '${gameType}';
		jsonGame = $.parseJSON('${jsonGame}');
		jsonRebate = $.parseJSON('${jsonRebate}');
	   });
	</script>
	<script src="${pageContext.request.contextPath }/site/js/datas/klsfData.js"></script>
	<script src="${pageContext.request.contextPath }/site/js/bets/klsf.js"></script>
  </head>
  
<body class="layout-two-column unibet custom-background">
	<div id="container">
		<!--头-->
		<jsp:include page="common/WerHeader.jsp"></jsp:include>
		<!--头   结束-->
		<!--bet Start-->
		<div id="content">
			<div id="top">
				<div class="inner"></div>
			</div>
			<div id="main" role="main">
				<div class="main-container">
					<!--彩种导航开始-->
					<jsp:include page="common/CZMenu.jsp"></jsp:include>
					<!--彩种导航结束-->
					<div class="stack gutter-col size4of5">
						<article class="rich-text-element main-column">
							<article class="widget registration-form">
								<!--顶部彩期&开奖信息 	End-->
								<div class="lottery">
									<div class="left_box">
										<div class="lo_title">
											<span class="lo_name">快乐十分</span> <span>第 <font
												class="no_old hs" style="left: -6px; right: 0px;">
													20140524015 </font> 期开奖结果 </span>
											<!--                                     <a href=" " target="_blank" class="analysis hs">漏号分析</a> -->
										</div>
                                <div class="num_open_k8">
			                        <ul>
				                        <li><span class="each"><span id="last_code_num0" class="">03</span></span></li>
				                        <li><span class="each"><span id="last_code_num1" class="">11</span></span></li>
				                        <li><span class="each"><span id="last_code_num2" class="">15</span></span></li>
				                        <li><span class="each"><span id="last_code_num3" class="">22</span></span></li>
				                        <li><span class="each"><span id="last_code_num4" class="">25</span></span></li>  
				                        <li><span class="each"><span id="last_code_num5" class="">27</span></span></li>
				                        <li><span class="each"><span id="last_code_num6" class="">40</span></span></li>
				                        <li><span class="each"><span id="last_code_num7" class="">41</span></span></li>
				                    </ul>
			                    </div>
			                    </div>
                                <div class="current_times">
										<div class="d_box">
											<input type="hidden" value="${issue.issueCode }" />
											<div id="nowIssues" style="height: 42px;margin-bottom: 5px;line-height: 1.5;">
												
											</div>
											<div class="timeBox">
												<span class="countdown">
													<font id="count_down">
														<div class="min"></div>
														<div class="sec"></div>
													</font>
												</span>
											</div>
										</div>
									</div>
                            <div class="history_open">
										<div
											style="text-align: center;height: 20px;background-color: #ddd">
											<div style="width: 50%;float: left;">期号</div>
											<div style="width: 50%;float: left;">号码</div>
										</div>
										<div id="lastFiveLotteryResult" style= 'width:230px;' class="cai_co"></div>
										
										<div id="searchResult" style="width:230px" class="cai_co">
										
										</div>
									</div>
                        </div>
                        <!--lottery End-->
                        <div id="subContent_bet" class="operate">
                            <!--投注页面头部可视代码结束-->
                             <div id="nav-sub">
										<nav>
											<ul id="lotteryTopType" class="color-theme-1">
                                    <li value="xy" id="two2" class="active">
                                        <span class="m">选一</span>
                                    </li>
                                    <li value="xe" id="two3">
                                        <span class="m">选二</span>
                                    </li>
                                    <li value="xs" id="two4">
                                        <span class="m">选三</span>
                                    </li>
                                    <li value="xsi" id="two4">
                                        <span class="m">选四</span>
                                    </li>
                                    <li value="xw" id="two4">
                                        <span class="m">选五</span>
                                    </li>
                                </ul>
                                </nav>
                            </div>
                            <div class="Contentbox" id="lotteryDetail">
                                <div class="minitype" id="lotterySubType">
                                    <div class="item">
                                        <h5>后三直选</h5>
                                        <label class="li_hover">
                                            <input style="display:none;" type="radio" id="smalllabel_0_0" name="smalllabel" value="0-0" checked="checked"><span class="subType">复式</span>
                                        </label>
                                        <label class="li">
                                            <input style="display:none;" type="radio" id="smalllabel_0_1" name="smalllabel" value="0-1" checked="checked"><span class="subType">单式</span>
                                        </label>
                                        <label class="li">
                                            <input style="display:none;" type="radio" id="smalllabel_0_2" name="smalllabel" value="0-2" checked="checked"><span>直选和值</span>
                                        </label>
                                    </div>
                                </div>
                                <div class="play-explain">
                                   	 玩法说明：<span id="lt_desc" class="help_con"></span>
                                    <span id="lt_help" class="help_help oanger">【?】帮助</span>
                                    <div id="lt_help_div" style="display:none;"></div>
                                </div>
                                <div class="gap-line">
                                </div>
                                <div id="lt_selector">
                                    <div class="grayContent" id="right_05">
                                        <div class="each clearfix">
                                        </div>
                                        <!--选号区结束 -->
                                    </div>
                                </div>
                                <form method="post" name="buyform" action="">
											<input type="hidden" name="lotteryid" id="lotteryid" value="1">
											<input type="hidden" name="curmid"	id="curmid" value="50">
											<input type="hidden" name="flag" id="flag" value="save">
											<div class="clearfix grayBet" style="clear:both;">
												<div class="fl">
													您选择了 <font class="hs" id="betNumsTxt">0</font> 注，共 
													<font class="hs" id="betMoneyTxt">0</font> 
													<span class="mType">元</span>
													&nbsp;&nbsp;&nbsp;&nbsp;模式：
                                            		<span class="moneyType curr" value="1">元</span>
                                            		<span class="moneyType" value="2">角</span>
                                            		<span class="moneyType" value="3">分</span>
												</div>
											</div>
											<div class="play-explain clearfix">
												<div style="width:80%;float:left">
													 奖金：<font id="jiangJin" class="hs">10倍</font>&nbsp;&nbsp;&nbsp;
													  <!-- 已选返点: -->
													 <span class="hs" style="display: none;" id="fudong">0.0%</span>
													 <br/>
													 <span class="help_con"><div class="slider-demo slider-success"></div></span>
												 </div>
												 <span class="fr" style="float:right">
													<input id="addBetTrBtn" type="button" value="选好了" class="formOk"/>
												</span>
											</div>
											<div class="lottery_list clearfix">
												<table width="100%" border="0" cellspacing="0" cellpadding="0">
													<tbody>
														<tr>
															<td style="max-width: 765px;width:765px">
																<div class="whiteDetail">
																	<table cellspacing="0" cellpadding="0"
																		id="betNumContentTable">

																	</table>
																</div> <br>
															</td>
															<td>
																<div id="lt_random_area"
																	style="display: block;">
																	<input type="button" class="jx_btn" onclick="machineChoice(1);" value="机选1注"> 
																	<input type="button" class="jx_btn" onclick="machineChoice(5);" value="机选5注">
																	<input type="button" class="jx_btn" onclick="machineChoice(10);" value="机选10注"> 
																	<input type="hidden" id="randomcos" value="3">
																	<input type="hidden" id="randomcosvalue" value="1|1|1">
																</div>
															</td>
															<td>
																<div class="tjBt_r">
																	<a href="#_" class="tjBt" id="lt_sendok"
																		onclick="betSubmit('CQSSC')">提交</a>
																</div>
															</td>
														</tr>
													</tbody>
												</table>
											</div>
											<div class="tjBox clearfix">
												已选择[ <span id="lt_cf_count" class="hs">0</span> ]单 总注数 <span
													class="hs" id="lt_cf_nums">0</span> 注，总金额 <span
													class="oanger" id="lt_cf_money">0</span> 元
												&nbsp;&nbsp;&nbsp;&nbsp; 请输入倍数：<input id="timesNum"
													type="text" class="num_input" value="1" border="0">
												倍 <span style="display:none;">， 起始期：<span
													id="lt_issues"> <select name="lt_issue_start"
														id="lt_issue_start">
															<option value="20140524-016">20140524016(当前期)</option>
															<option value="20140524-017">20140524017</option>
													</select> <input type="hidden" name="lt_total_nums"
														id="lt_total_nums" value="0"><input type="hidden"
														name="lt_total_money" id="lt_total_money" value="0">
												</span> </span><span class="zh_box"> <label> <input
														type="checkbox" name="lt_trace_if" id="lt_trace_if_button"
														value="no"> <font class="oanger">发起追号</font> </label> <!-- <label>
                                                <input name="lt_trace_stop" type="checkbox" value="yes" id="lt_trace_stop" disabled="disabled">中奖后停止追号
                                            </label> --> </span>
											</div>
											<!--我要追号-->
											<div id="lt_trace_box1" class="wyzhContent"
												style="display:none">
												<div class="box-wyzh">
													<span class="lo_name">追号</span> 追号期数： <select
														class="select3" id="lt_trace_qissueno">
														<option value="5">5期</option>
														<option value="10">10期</option>
														<option value="20">20期</option>
														<option value="30">30期</option>
														<option value="50">50期</option>
													</select> 总期数：<span class="hs" id="lt_trace_count">0</span>期 追号总金额：<span
														class="hs" id="lt_trace_hmoney">0.00</span>元
												</div>
												<div class="zhlist" id="lt_trace_issues">
													<table border="0" cellspacing="0" cellpadding="0"
														id="lt_trace_issues_today" class="formTable" width="100%">
														<tbody>
														</tbody>
													</table>
												</div>
											</div>
											<!-- 我要追号,结束 -->
										</form>
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
		<jsp:include page="common/WerFooter.jsp"></jsp:include>
	</div>
</body>
</html>
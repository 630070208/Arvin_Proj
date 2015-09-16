/**
 * 当前选定的玩法
 */
var currentGameData;
var currentPlayType="";
var currentMoneyType="1";
var tempTrIndex=1;
//限号限倍
var jsonGame = [];
//奖金返点
var jsonRebate;
//滑动变量
var maxPrzie = 100;
var minPrzie = 0;
var isRelocate = false; //是否浮动
var initValue = 0;//初始化精度条值
var grad = 0; //平均刻度
var fudong = 0;
var jiangjin = 0;

/**
 * 添加事件侦听
 */
$(function() {
	
	$("#lotteryTopType").children().bind("click",onTopPlayTypeClick);
	//$("#timesNum").bind("propertychange",onTimesNumChange);
	$("#timesNum").bind("input",onTimesNumChange);
	$(".playType").bind("click",onSubPlayTypeClick);
	$(".moneyType").bind("click",onMoneyTypeClick);
	$("#lt_help").bind("mouseover",showHelp);
	$("#lt_help").bind("mouseout",hideHelp);
	//是否追号
	$("#lt_trace_if_button").click(function(){
		if(document.getElementById("lt_trace_if_button").checked){
			$("#lt_trace_stop").attr("disabled",false);
			$("#lt_trace_box1").show();
			document.getElementById("lt_trace_stop").checked = true;
		}else{
			$("#lt_trace_stop").attr("checked",false); 
			$("#lt_trace_stop").attr("disabled",true);
			$("#lt_trace_box1").hide();
		}
	});
	//生成追号信息
	$("#lt_trace_ok").bind("click",addBet);
	$("#lt_trace_qissueno").bind("change",changeAddBetInput);
	var html=getLastFiveLotteryResult("20140524-015","1,2,3,4,5");
	html=html+getLastFiveLotteryResult("20140524-015","1,2,3,4,5");
	html=html+getLastFiveLotteryResult("20140524-015","1,2,3,4,5");
	html=html+getLastFiveLotteryResult("20140524-015","1,2,3,4,5");
	html=html+getLastFiveLotteryResult("20140524-015","1,2,3,4,5");
	$("#lastFiveLotteryResult").html(html);
	//startCountdown();
});

function menuChange(obj){
	if($(obj).next().hasClass("on")){
		$(obj).parent("dl").children("dd").each(function(index,element){
			$(element).removeClass("on");
		});
	}else{
		$(obj).parent("dl").children("dd").each(function(index,element){
			$(element).addClass("on");
		});
	}
}

function onTimesNumChange(){
	$(this).val(Number($(this).val().replace(/[^0-9]/g,"")));
     updateBetNum();
}
/**
 * 彩种玩法点击事件侦听
 */
function onMoneyTypeClick(){
	$(".moneyType").removeClass("curr");
	$(this).addClass("curr");
	currentMoneyType=$(this).attr("value");
}
/**
 * 彩种玩法点击事件侦听
 */
function onTopPlayTypeClick(){
	$("#lotteryTopType").children().removeClass("hover");
	$(this).addClass("hover");
	$("#betNumsTxt").text("0");//重置注数
	$("#betMoneyTxt").text("0");//重置金额
	var topType=$(this).attr("value");
	changePlayType(topType);
	$(".playType").bind("click",onSubPlayTypeClick);
}
/**
 * 彩种玩法点击事件侦听
 */
function onSubPlayTypeClick(){
	$(".playType").removeClass("li_hover");
	$(".playType").addClass("li");
	$(this).removeClass("li");
	$(this).addClass("li_hover");
	$("#betNumsTxt").text("0");//重置注数
	$("#betMoneyTxt").text("0");//重置金额
	currentPlayType=$(this).attr("value");
	updatePageByPlayType(currentPlayType);
}

//选号区功能按钮添加
function initSelectBallType(){
	var selectBallBtnList = "<ul class='btnList'><li name='all' class='selectType'>全</li>"+
                            "<li class='selectType' name='big'>大</li>"+
                            "<li class='selectType' name='small'>小</li>"+
                            "<li class='selectType' name='odd'>奇</li>"+
                            "<li class='selectType' name='even'>偶</li>"+
                            "<li class='selectType' name='clean'><font color='6d6d6d'>清</font></li></ul>";
	return selectBallBtnList;
}

/**
 * 添加到投注区
 */
function addSelectNumber(){
	var balls=[];
	balls=getSelectBalls();
	if(balls==null){
		alert("至少选择一注！");
		return;
	}
	var betNum=countBetNum(1,balls);
	$("#lt_sel_nums").text(betNum);
	var codes=balls.join("|");
	var tempCode = codes.split("|");//投注的号码
	var anwei = codes.indexOf("|")>=0?true:false; //是否按位投注  | 分隔
	
	if (jsonGame != 'undefined' && jsonGame != '') {
		for ( var i = 0; i < jsonGame.length; i++) {
			if (jsonGame[i].gameType == currentGame && jsonGame[i].playType == currentPlayType) {
				if (jsonGame[i].rstctNumber < betNum) {
					alert("投注注数过多！");
					return;
				}
				if (jsonGame[i].maxMulti < betNum) {
					alert("该投注倍数过高！");
					return;
				} 
				if (anwei) {
					var rstctCode = jsonGame[i].rstctCode.split("|");// 限制的号码
					var k = 0;
					for ( var j = 0; j < rstctCode.length; j++) {
						var tempCont = tempCode[j].split(",");
						for ( var m = 0; m < tempCont.length; m++) {
							if (rstctCode[j].indexOf(tempCont[m]) >= 0) {
								k++;
							}
						}
						if (k >= rstctCode.length) {
							alert("存在限号,请重新选择");
							return;
						}
					}

				} else {
					var rstctCode = jsonGame[i].rstctCode.split(",");// 限制的号码
					for ( var j = 0; j < rstctCode.length; j++) {
						var temp = tempCode[0].split(",");
						for ( var k = 0; k < temp.length; k++) {
							if (temp[0] == rstctCode[j]) {
								alert("存在限号,请重新选择");
								return;
							}
						}
					}
				}
			}
		}
	}
	choiceBallAddToOrderArea(codes,betNum)
}

/**
 * 机选添加到投注区
 * @param codeArray 所生成的随机数数组
 * @param selectNumber 最低选择号码数
 */
function addMachionSelectNumber(selectNumber,codeArray){
	var betNum=countBetNum(selectNumber,codeArray.length);
	var codes=codeArray.join("|");
	choiceBallAddToOrderArea(codes,betNum);
}

/**
 * 投注区添加号码
 */
function choiceBallAddToOrderArea(codes,betNum){
	//var desc="["+currentGameData.playTypetitle+"]"+codes.replaceAll(",","");//
	var desc="["+currentGameData.playTypetitle+"]"+codes;//
	var playType=currentGameData.playTypeCode;
	var moneyType=currentMoneyType;
	var timesNum=$("#timesNum").val();
	var money=timesNum*betNum*2;
	var html=getBetTr(codes,desc,playType,moneyType,betNum,timesNum,money,tempTrIndex);
	tempTrIndex=tempTrIndex+1;
	$("#betNumContentTable").append(html);
	
	clearSelectOption();//清除小球的选中状态
	getOrderNumAndBet();//更新底部信息
	updateBetNum();//重置选号区下方注数及金额信息
	
}

/**
 * 更新订单笔数以及注数、金额信息
 */
function getOrderNumAndBet(){
	var orderNum = 0;
	var betNum = 0;
	$(".table_line").each(function(index, element){
		betNum+=Number($($(element).children()[3]).children().text());
		orderNum++;
	});
	
	$("#lt_cf_count").html(orderNum);
	$("#lt_cf_nums").html(betNum);
	$("#lt_cf_money").html(betNum*2);
}

/**
 * 得到选定的号码数组
 * @param isCheck 是否执行校验(如果是提交那么需要提交)
 * @returns {Array}
 */
function getSelectBalls(isCheck){
	var balls=[];
	var uls=$(".numList");
	for(var i=0;i<uls.length;i++){
		var lis = $(".selected" , uls[i]);
		if(lis==undefined || lis.length==0){
			if(isCheck==true)alert($(uls[i]).attr("title")+"至少要选一个球");
			return null;
		}
		var row=[];
		for(var j=0;j<lis.length;j++){
			row.push($(lis[j]).text());
		}
		balls.push(row);
	}
	return balls;
}
/**
 * 显示帮助弹出层
 */
function showHelp(){
	$("#lt_help_div").css("display","block");
}
/**
 * 隐藏帮助弹出层
 */
function hideHelp(){
	$("#lt_help_div").css("display","none");
}

/**
 * 开始倒计时
 */
function IssueCountdown() {
	var miao = parseInt(timeNumber);// 秒
	var fen = 0;// 分
	var shi = 0;// 小时
	if (miao > 60) {
		fen = parseInt(miao / 60);
		miao = parseInt(miao % 60);
		if (fen > 60) {
			shi = parseInt(fen / 60);
			fen = parseInt(fen % 60);
		}
	}
	if (miao < 10) {
		if (miao > 0) {
			miao = "0" + miao;
		} else {
			miao = "00";
		}
	}
	if (fen < 10) {
		if (fen > 0) {
			fen = "0" + fen;
		} else {
			fen = "00";
		}
	}
	if (shi < 10) {
		if (shi > 0) {
			shi = "0" + shi;
		} else {
			shi = "00";
		}
	}
	timeNumber--;
	var timeStr = '<div class="hour">' + shi + ':</div><div class="min">' + fen
			+ ':</div><div class="sec">' + miao + '</div>';
	$("#count_down").html(timeStr);
	itime = setTimeout(startCountdown, 1000);
}

/**
 * 删除已经添加的投注行
 * @param trIndex
 */
function removeTr(trIndex){
	$("tr[id='betNumContentTr_"+trIndex+"']").remove();//删除当前行
	getOrderNumAndBet();
}

/**
 * 清除小球的选中状态
 */
function clearSelectOption(){
	$("li[class='ballItem selected']").removeClass("selected");
}

/**
 * 机选
 * @param choiceBetNum 机选注数
 * @param playType 玩法类型
 */
function machineChoice(choiceBetNum){
	choice(choiceBetNum,currentPlayType);
	//MathUtil.generateRandom(10,3,0);//随机生成一注
}

/**
 * 切换追号选项卡
 */
function addBetSwitch(element){
	var tabId = $(element).attr("id");
	if(tabId=="button12"){
		$("#button111").removeClass("current");
		$("#button13").removeClass("current");
		$("#lt_margin_html").hide();
		$("#lt_difftime_html").hide();
		$("#lt_sametime_html").show();
	}else if(tabId=="button111"){
		$("#button12").removeClass("current");
		$("#button13").removeClass("current");
		$("#lt_difftime_html").hide();
		$("#lt_sametime_html").hide();
		$("#lt_margin_html").show();
	}else if(tabId=="button13"){
		$("#button111").removeClass("current");
		$("#button12").removeClass("current");
		$("#lt_margin_html").hide();
		$("#lt_sametime_html").hide();
		$("#lt_difftime_html").show();
	}
	$(elemetn).addClass("current");
}

//改变追号期数input
function changeAddBetInput(){
	var betNum = $("#lt_trace_qissueno option:selected").val();//追期下拉框的值
	$("#lt_trace_count_input").val(betNum);
}

//追号生成
function addBet(){
	var betNum = $("#lt_trace_qissueno option:selected").val();//追期下拉框的值
	var initDoubleNum = $("#lt_trace_times_margin").val();//起始倍数
	var minRate = $("#lt_trace_margin").val();//最低收益率
	var totalMoney = $("#lt_cf_money").text();//总金额
	
	$("#lt_trace_count").text(betNum);
	$("#lt_trace_hmoney").text(betNum*initDoubleNum*totalMoney);
	
	for(var i=0;i<betNum;i++){
		var td = document.getElementById("lt_trace_issues_today").getElementsByTagName("tr")[i].getElementsByTagName("td");
		$(td[0]).children("input").attr("checked",true); 
		$(td[3]).children("input").val(initDoubleNum);
		$(td[4]).children("span").text(initDoubleNum*totalMoney+".00");
	}
}

/**
 * 投注(内容格式拼接)
 * @param gameType 彩种
 */
function betSubmit(gameType){
	var currentIssue = $("#current_issue").text();//当前期
	var amount = "";//总金额
	var issueInfo = "";//期数倍数描述 20140607001:1-20140607002:2
	var lastIssue = "";//追号最后一期期数
	var betCode = "";//投注内容拼接     子玩法：内容  : 注数   : 奖金返点- 子玩法：内容: 注数 : 奖金返点
	var mschema = "";//货币模式
	var betCount = $("#lt_cf_nums").text();//总注数
	var prize = "1800";//奖金
	var betRebate = "12.5";//返点
	var prizeInfo = "";//中奖描述     期号：奖金- 期号：奖金
	
	if(Number(betCount) < 1){
		alert("请至少选择一注！")
		return;
	}
	
	if(document.getElementById("lt_trace_if_button").checked){//追号
		amount = $("#lt_trace_hmoney").text();
		var addBetCount = $("#lt_trace_count").text();
		if(Number(addBetCount) < 1){
			alert("追期格式有误！");
			return;
		}
		
		for(var i=0;i<addBetCount;i++){
			var element = $("#lt_trace_issues_today tbody").children("tr")[i];
			issueInfo+=$($(element).children("td")[2]).text()+":"+$($(element).children("td")[3]).children("input").val()+"-";
			if(i==addBetCount-1){
				lastIssue = $($(element).children("td")[2]).text();
			}
		}
		issueInfo = issueInfo.substring(0, issueInfo.length-1);
	}else{//不追号
		amount = $("#lt_cf_money").text();
		issueInfo = currentIssue+":"+$("#timesNum").val();
		lastIssue = currentIssue;
	}
	
	$("#betNumContentTable tbody tr").each(function(index,element){
		var betContent = $($(element).children()[0]).text().split("]")[1];//投注内容
		var playType = $($(element).children()[1]).text().split(":")[1];//子玩法
		var moneyType = $($(element).children()[2]).text();//模式
		var tempBetCount = $($(element).children()[3]).children("span").text();//注数
		var prize_reba = prize+"|"+betRebate;//奖金返点
		betCode+=playType+":"+moneyType+":"+betContent+":"+tempBetCount+":"+prize_reba+"-";
	});
	
	betCode = betCode.substring(0, betCode.length-1);
	mschema = $("span[class='moneyType curr']").text();
	prizeInfo = currentIssue+":"+prize;
	alert("=="+gameType+"=="+amount+"=="+issueInfo+"=="+lastIssue+"=="+betCode+"=="+mschema+"=="+prize+"=="+betCount+"=="+betRebate+"=="+prizeInfo);
	
	/**
	 * submit
	 * @param url
	 * @param data
	 * @param reqType
	 */
	var url = ROOT_URL+"/bet";
	var data = {"gameType":gameType, "amount":amount, "issueInfo":issueInfo, "lastIssue":lastIssue, "betCode":betCode, "mschema":mschema, "prize":prize, "betCount":betCount, "betRebate":betRebate, "prizeInfo":prizeInfo};
	var reqType = "POST";
	ajaxRequest(url, data, reqType, resultHandler, faultHander);
	
	function resultHandler(data){
		var json = JSON.parse(data);
		alert("result=="+json)
	}
	
	function faultHander(data){
		
	}
}

function initSliderData(){
	//页面加载slider进度条
	if(jsonRebate != null && jsonRebate[currentGame][currentPlayType] !=null){
		maxPrzie = jsonRebate[currentGame][currentPlayType].maxPrzie;
		isRelocate = jsonRebate[currentGame][currentPlayType].isRelocate;
		if(isRelocate){ //浮动
			minPrzie = jsonRebate[currentGame][currentPlayType].minPrzie;
			initValue = jsonRebate[currentGame][currentPlayType].rebate;
			var subt = maxPrzie - minPrzie;
			grad = subt / initValue;
		}
		else{
			minPrzie = maxPrzie;
			initValue = 0;
		}
		$("#fudong").text(initValue+"%");
		$("#jiangJin").text(minPrzie);
	}else{
		minPrzie = 0;
		maxPrzie=0;
		initValue=0;
		$("#fudong").text(initValue+"%");
		$("#jiangJin").text(minPrzie);
	}
}

function initSlider(){
	$( ".slider-demo" ).each (function () {
		$(this).slider({
			value : grad,
			range : 'min', 
			min : minPrzie, 
			max : maxPrzie,
			step : 1,
			slide : function(event, ui ) {
			var sliderVlue = ui.value;
			fudong = toDecimal(initValue - (sliderVlue-minPrzie) /grad);
			$("#fudong").text(fudong+"%");
			jiangjin = toDecimal(sliderVlue);
			$( "#jiangJin" ).text (toDecimal(sliderVlue));
		}});
	});
}
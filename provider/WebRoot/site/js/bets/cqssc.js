/**
 * 开奖倒计时,秒单位
 */
var timeNumber = 0;
var currentGame = "CQSSC";
/**
 * 预加载数据
 */
$(function () {
	//初始化玩法
	changePlayType("hs");
	
	initSliderData();
	initSlider();
	
	$("#addBetTrBtn").bind("click",addSelectNumber);//添加号码按钮绑定点击事件
	getIssueInfo();//页面加载玩法彩期
});
//制保留2位小数，如：2，会在2后面补上00.即2.00    
function toDecimal(x) {    
    var f = parseFloat(x);    
    if (isNaN(f)) {    
        return false;    
    }    
    var f = Math.round(x*100)/100;    
    var s = f.toString();    
    var rs = s.indexOf('.');    
    if (rs < 0) {    
        rs = s.length;    
        s += '.';    
    }    
    while (s.length <= rs + 2) {    
        s += '0';    
    }    
    return s;    
}    

/**
 * 更新选球注数,同时更新投注金额
 */
function updateBetNum(){
	var balls=[];
	balls=getSelectBalls();
	var betNum=0;
	var baseBet = updateBetNumByPlayType();
	if(balls){
		if(currentPlayType=="dwd"){
			for(var i=0;i<balls.length;i++){
				betNum+=balls[i].length;
			}
		}else if(currentPlayType=="hszzhz" || currentPlayType=="qszzhz"){
			 var cc = {1:1,2:2,3:2,4:4,5:5,6:6,7:8,8:10,9:11,10:13,11:14,12:14,13:15,14:15,15:14,16:14,17:13,18:11,19:10,20:8,21:6,22:5,23:4,24:2,25:2,26:1};
             var max_place = parseInt(0,10);
            
             for( i=0; i<=max_place; i++ ){
                var s = balls[i].length;
                for( j=0; j<s; j++ ){
                    betNum+= cc[parseInt(balls[i][j],10)];
                }
             };
		}else if(currentPlayType=="qezuxhz" || currentPlayType=="hezuxhz"){
			var cc = {0:0,1:1,2:1,3:2,4:2,5:3,6:3,7:4,8:4,9:5,10:4,11:4,12:3,13:3,14:2,15:2,16:1,17:1,18:0};
			var max_place = parseInt(0,10);
			for( i=0; i<=max_place; i++ ){
                var s = balls[i].length;
                for( j=0; j<s; j++ ){
                    betNum+= cc[parseInt(balls[i][j],10)];
                }
             };
		}else if(currentPlayType=="wzx60"){//组选60
			if(balls[0].length>=1 && balls[1].length >= 3){
				var h=Array.intersect(balls[0],balls[1]).length;
                var tmp_nums=Combination(balls[0].length,1)*Combination(balls[1].length,3);
                if(h>0){
                	tmp_nums-=Combination(h,1)*Combination(balls[1].length-1,2);
                }
                betNum+=tmp_nums;
            }
		}else if(currentPlayType=="wzx30"){//组选30
			if(balls[0].length>=2 && balls[1].length >= 1){
				var h=Array.intersect(balls[0],balls[1]).length;
                var tmp_nums=Combination(balls[0].length,2)*Combination(balls[1].length,1);
                if(h>0){
                	tmp_nums-=Combination(h,2)*Combination(2,1);
                    if(balls[0].length-h>0){
                        tmp_nums-=Combination(h,1)*Combination(balls[0].length-h,1);
                    }
                }
                betNum+=tmp_nums;
            }
		}else if(currentPlayType=="wzx20"){//组选20
			if(balls[0].length>=1 && balls[1].length >= 2){
				var h=Array.intersect(balls[0],balls[1]).length;
                var tmp_nums=Combination(balls[0].length,1)*Combination(balls[1].length,2);
                if(h>0){
                	 tmp_nums-=Combination(h,1)*Combination(balls[1].length-1,1);
                }
                betNum+=tmp_nums;
            }
		}else if(currentPlayType=="wzx10"){//组选10
			if(balls[0].length>=1 && balls[1].length >= 1){
				var h=Array.intersect(balls[0],balls[1]).length;
                var tmp_nums=Combination(balls[0].length,1)*Combination(balls[1].length,1);
                if(h>0){
                	tmp_nums-=Combination(h,1);
                }
                betNum+=tmp_nums;
            }
		}else if(currentPlayType=="wzx5"){//组选5
			if(balls[0].length>=1 && balls[1].length >= 1){
				var h=Array.intersect(balls[0],balls[1]).length;
                var tmp_nums=Combination(balls[0].length,1)*Combination(balls[1].length,1);
                if(h>0){
                	tmp_nums-=Combination(h,1);
                }
                betNum+=tmp_nums;
            }
		}else if(currentPlayType=="szx12"){//四星组选12
			if(balls[0].length>=1&&balls[1].length>=2){
				var h=Array.intersect(balls[0],balls[1]).length;
				var tmp_nums=Combination(balls[0].length,1)*Combination(balls[1].length,2);
				if(h>0){
					tmp_nums-=Combination(h,1)*Combination(balls[1].length-1,1);
				}
				betNum+=tmp_nums;
			}
		}else if(currentPlayType=="szx6"){//四星组选6
			if(balls[0].length>=2){
				//c(n,2)
				betNum+=Combination(balls[0].length, 2);
			}
		}else if(currentPlayType=="szx4"){
			if(balls[0].length>=1&&balls[1].length>=1){
				var h=Array.intersect(balls[0],balls[1]).length;
				var tmp_nums=Combination(balls[0].length,1)*Combination(balls[1].length,1);
				if(h>0){
					tmp_nums-=Combination(h,1);
				}
				betNum+=tmp_nums;
			}
		}else if(currentPlayType=="hszxhz" || currentPlayType=="qszxhz"){//直选和值
			if (balls[0].length == 0) {
				return;
			}
			for ( var i = 0; i < 10; i++) {
				for ( var j = 0; j < 10; j++) {
					for ( var k = 0; k < 10; k++) {
						for ( var s = 0; s < balls[0].length; s++) {
							var sum = Number(balls[0][s]);
							if (i + j + k == sum) {
								betNum++;
							}
						}
					}
				}
			}
		}else if(currentPlayType=="hszsfs" || currentPlayType=="qszsfs"){//组三
			var max_place = parseInt(0,10);
			for( i=0; i<=max_place; i++ ){
                var s = balls[i].length;
                if( s > 1 ){//组三必须选两位或者以上
                    betNum+= s*(s-1);
                }
            }
		}else if(currentPlayType=="hszlfs" || currentPlayType=="qszlfs"){//组六
			var max_place = parseInt(0,10);
			for( i=0; i<=max_place; i++ ){
                var s = balls[i].length;
                if( s > 2 ){//组六必须选三位或者以上
                    betNum += s*(s-1)*(s-2)/6;
                }
            }
		}else if(currentPlayType=="hszzhz"){//组选和值
			var cc = {1:1,2:2,3:2,4:4,5:5,6:6,7:8,8:10,9:11,10:13,11:14,12:14,13:15,14:15,15:14,16:14,17:13,18:11,19:10,20:8,21:6,22:5,23:4,24:2,25:2,26:1};
            var max_place = parseInt(0,10);;
            
            for( i=0; i<=max_place; i++ ){
                var s = balls[i].length;
                for( j=0; j<s; j++){
                    betNum+= cc[parseInt(balls[i][j],10)];
                }
            };
		}else if(currentPlayType=="qezxhz" || currentPlayType=="hezxhz"){//二码直选和值
			if (balls[0].length == 0) {
				return;
			}
			for ( var i = 0; i < 10; i++) {
				for ( var j = 0; j < 10; j++) {
					for ( var s = 0; s < balls[0].length; s++) {
						var sum = Number(balls[0][s]);
						if (i + j == sum) {
							betNum++;
						}
					}
				}
			}
		}else{
			betNum=countBetNum(baseBet,balls);
		}
	}
	var timesNum=$("#timesNum").val();
	$("#betNumsTxt").text(betNum);
	$("#betMoneyTxt").text(betNum*2*timesNum);
}
/**
 * 计算组数
 * @param baseNum 最低选择号码数
 * @param balls  号码数组,
 */
function countBetNum(baseNum,balls){
	var betNum=1;
	for(var i=0;i<balls.length;i++){
		betNum=betNum*MathUtil.calculateGroup(baseNum,balls[i].length);
	}
	
	if(currentPlayType=="wwxzh"){//五星组合
		betNum = betNum*5;
	}else if(currentPlayType=="ssxzh"){//四星组合
		betNum = betNum*4;
	}
	return betNum;
}

/**
 * 更新玩儿法 , 重画界面
 * @param playType
 */
function changePlayType(playType){
	var subTypes=PlayType.cqssc[playType].subTypes;
	var html='<div class="item"><h5>玩法选择</h5>';
	for(var i=0;i<subTypes.length;i++){
		html=html+getPlayTypeBtnItemHtml(subTypes[i]);
	}
	html=html+"</div>";
	$("#lotterySubType").html(html);
	$("#lotterySubType label:first").removeClass("li");
	$("#lotterySubType label:first").addClass("li_hover");
	currentPlayType=$("#lotterySubType label:first").attr("value");
	updatePageByPlayType(currentPlayType);
	$(".playType").bind("click",onSubPlayTypeClick);
}


function updatePageByPlayType(){
	var data=LotteryData[currentPlayType];
	currentGameData=data;
	$("#lt_desc").text(data.methoddesc);
	$("#lt_help_div").text(data.methodhelp);
	updateBallDiv(data.ballLayout,data.playTypeCode);
}
/**
 * 更新选号球
 * @param ballLayout 数组ballLayout : [ {title : '百位',no : '0|1|2|3|4|5|6|7|8|9',place : 0,cols : 1}]
 */
function updateBallDiv(ballLayout,playTypeCode){
	var html='';
	for(var i=0;i<ballLayout.length;i++){
		var item=ballLayout[i];
		var ballRow='<div class="each clearfix">';
		if(item.title!=''){
			ballRow=ballRow+'<h3 class="name">'+item.title+'</h3>';
		}
		ballRow=ballRow+getBallNumber_UL(item.no,item.title);
		/*if(item.isCtr==1){
			ballRow=ballRow+getBallCtrl_UL();
		}*/
		if(playTypeCode.indexOf("hz")==-1){
			ballRow=ballRow+initSelectBallType()+"</div>";
		}else{
			ballRow=ballRow+"</div>";
		}
		html=html+ballRow;
	}
	html=html+"</div>";
	$("#right_05").html(html);
	addBallEvent();
}

/**
 * 机选子类玩法的具体实现
 * @param choiceBetNum  机选注数
 * @param playType  子玩法类型
 */
function choice(choiceBetNum,playType){
	if(playType=="wx"){//五星
		for(var i=0;i<choiceBetNum;i++){
			var codes = MathUtil.generateRandom(10,5,0);//随机生成一注
			addMachionSelectNumber(5,codes);
		}
	}else if(playType=="sx"){//四星
		
	}else if(playType=="hs"){//后三
		
	}else if(playType=="qs"){//前三
		
	}
}

function getIssueInfo(){
	ajaxRequest(ROOT_URL+"game/cqssc/issues","","POST",resultHandler,faultHandler);
	
	/*var index = 4;
	currentIssue(index);
	function currentIssue(index){
		if(index>=0) {
			$("#last_code_num"+index).removeClass("waiting");
	        $("#last_code_num"+index).text(index);
			index--;
			setTimeout("currentIssue(\""+index+"\")",500);
		}
	}*/
		
	function resultHandler(data){
		//var str = JSON.stringify(data);
		var currentIssue = data.currentissue;
		var addIssue = data.list;
		var historyIssue = data.his;
		
		var lastIssue = historyIssue[0];
		loadLastIssue(lastIssue);//加载上一期期号及开奖号码
		loadCurrentIssue(currentIssue);//加载当前期数据
		loadHistoryIssue(historyIssue);//最近5期彩期历史
		loadAddBetIssue(addIssue);//追号区彩期处理
	}

	function faultHandler(data){
		alert(data.message);
	};
}

/**
 * 处理上一期数据
 * @param lastIssueInfo
 */
function loadLastIssue(lastIssueInfo){
	$(".no_old").text(lastIssueInfo.issueCode);//上一期期号
	var lastNum = lastIssueInfo.prizeResult;//上一期开奖号码
	var newLastNum = [];
	for(var j=0;j<lastNum.length;j++){
		if(j%2==0){
			newLastNum.push(lastNum[j]);
		}
	}
	for(var i=4;i>=0;i--){
		$("#last_code_num"+i).removeClass("waiting");
        $("#last_code_num"+i).text(newLastNum[i]);
	}
}

/**
 * 处理当前期数据
 * @param currentIssue
 */
function loadCurrentIssue(currentIssue){
	$("#current_issue").text(currentIssue.issueCode);
	
	var endtime = new Date(currentIssue.stopTime).getTime();//结束日期(毫秒值)
    var starttime = new Date(currentIssue.startTime).getTime();//开始日期(毫秒值)
    timeNumber = (endtime-starttime)/1000;//间隔(毫秒值)
	
	startCountdown();//彩期倒计时
}

/**
 * 处理最近5期开奖结果
 * @param his
 */
function loadHistoryIssue(his){
	var content = "";
	for(var i=0;i<his.length;i++){
		content+="<ul><li class='stage'>"+his[i].issueCode+"</li><li class='haoma1'>";
		var result = his[i].prizeResult;
		for(var j=0;j<result.length;j++){
			if(j%2==0){
				content+="<span>"+result[j]+"</span>";
			}
		}
		content+="</li></ul>";
	}
	$("#lastFiveLotteryResult").html(content);
}

/**
 * 追号区彩期处理
 * @param list
 */
function loadAddBetIssue(list){
	var content = ""
	for(var i=0;i<list.length;i++){
		content+="<tr id='tr_trace_"+list[i].issueCode+"'>"+
	              "<td align='center'><input type='checkbox' name='lt_trace_issues[]' value='"+list[i].issueCode+"'></td>"+
	              "<td align='center'>"+i+"</td>"+
	              "<td align='center'>"+list[i].issueCode+"</td>"+
	              "<td align='center'><input style='width:100px' type='text' class='input03' value='0' disabled=''>倍</td>"+
	              "<td align='center'>￥<span id='lt_trace_money_"+list[i].issueCode+"'>0.00</span></td>"+
	              "<td align='center'><span style='display:none'>"+list[i].startTime+"</span><span>"+list[i].stopTime+"</span></td>"+
	              "</tr>";
	}
	$("#lt_trace_issues_today tbody").html(content);
}

/**
 * 子玩法计算注数最少选择多少个球
 * @returns {Number}
 */
function updateBetNumByPlayType(){
	var num = 1;
	switch (currentPlayType) {
	case "wzx120"://五星组选120
		num = 5;
		break;
	case "szx24"://四星组选24
		num = 4;
		break;
	case "qezuxfs":
		num = 2;//前二组选
		break;
	case "hezuxfs"://后二组选
		num = 2;
		break;
	default:
		num = 1;
		break;
	}
	return num;
}

/**
 * 开始倒计时
 */
function startCountdown() {
	if(timeNumber<0){
		//alert("倒计时结束");
		if(itime!=""){
			alert("清除itime");
            clearTimeout(itime);
        }
		
		var td = document.getElementById("lt_trace_issues_today").getElementsByTagName("tr")[0].getElementsByTagName("td");//追期第一期
		var issue = $(td[2]).text();
		var startTime = $(td[5]).children().html();
		var stopTime = $(td[5]).children().next().html();
		
		$("#current_issue").text(issue);
		var endtime = new Date(stopTime).getTime();//结束日期(毫秒值)
	    var starttime = new Date(startTime).getTime();//开始日期(毫秒值)
	    timeNumber = (endtime-starttime)/1000;//间隔(毫秒值)
		
		$(document.getElementById("lt_trace_issues_today").getElementsByTagName("tr")[0]).remove();
		
		//setTimeout(changeCurrentIssue, 180000);//请求结果
	}
	
	IssueCountdown();//倒计时公共方法
}

function changeCurrentIssue(){
	alert("开始请求！");
}

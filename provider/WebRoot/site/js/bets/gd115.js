var currentGame = "gd115";

/**
 * 预加载数据
 */
$(function () {
	//初始化玩法
	changePlayType("rxf");
	
	initSliderData();
	initSlider();
	//添加号码按钮绑定点击事件
	$("#addBetTrBtn").bind("click",addSelectNumber);
});
/**
 * 更新选球注数,同时更新投注金额
 */
function updateBetNum(){
	var balls=[];
	balls=getSelectBalls(false);
	var betNum=0;
	var baseBet = updateBetNumByPlayType();
	if(balls){
		if(currentPlayType=="dwd"){
			for(var i=0;i<balls.length;i++){
				betNum+=balls[i].length;
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
	return betNum;
}

/**
 * 更新玩儿法 , 重画界面
 * @param playType
 */
function changePlayType(playType){
	var subTypes=PlayType.gd115[playType].subTypes;
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
		if(item.isCtr==1){
			ballRow=ballRow+getBallCtrl_UL();
		}
		ballRow=ballRow+"</div>";
		html=html+ballRow;
	}
	html=html+"</div>";
	$("#right_05").html(html);
	addBallEvent();
}

function updateBetNumByPlayType(){
	var num = 1;
	switch (currentPlayType) {
	case "rxfeze":
		num = 2;
		break;
	case "rxfszs":
		num = 3;
		break;
	case "rxfizs":
		num = 4;
		break;
	case "rxfwzw":
		num = 5;
		break;
	case "rxfslzw":
		num = 6;
		break;
	case "rxfqzw":
		num = 7;
		break;
	case "rxfbzw":
		num = 8;
		break;
	case "smzufs"://三码，组选复式
		num = 3;
		break;
	case "emzufs"://二码，组选复式
		num = 2;
		break;
	default:
		num = 1;
		break;
	}
	return num;
}
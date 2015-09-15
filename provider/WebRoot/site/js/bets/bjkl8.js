var currentGame = "bjkl8";

/**
 * 预加载数据
 */
$(function () {
	//初始化玩法
	changePlayType("qw");
	
	//页面加载slider进度条

	initSliderData();
	initSlider();
	
	//添加号码按钮绑定点击事件
	$("#addBetTrBtn").bind("click",addSelectNumber);
	addBallEvent();
});

function addBallEvent(){
	$(".ballItem").bind("click",switchBall);
}


/**
 * 投注求开关，选中/未选中 开关。
 */
function switchBall(element){
	var flag = checkIsCanSwitch();
	if(flag){
		$(element.currentTarget).toggleClass("selected");
		updateBetNum();
	}
}

/**
 * 是否满足选球格式
 */
function checkIsCanSwitch(){
	var balls=[];
	balls=getSelectBalls(false);
	var betNum=0;
	var baseBet = updateBetNumByPlayType();
	if(balls){
		var selectBallNum = balls[0].length;
		if(currentPlayType=="rxe"){
			if(selectBallNum >= 8){
				alert("请选择2-8个球投注！");
				return false;
			}
		}else if(currentPlayType=="rxs"){
			if(selectBallNum >= 8){
				alert("请选择3-8个球投注！");
				return false;
			}
		}else if(currentPlayType=="rxsi"){
			if(selectBallNum >= 8){
				alert("请选择4-8个球投注！");
				return false;
			}
		}else if(currentPlayType=="rxw"){
			if(selectBallNum >= 8){
				alert("请选择5-8个球投注！");
				return false;
			}
		}else if(currentPlayType=="rxl"){
			if(selectBallNum >= 8){
				alert("请选择6-8个球投注！");
				return false;
			}
		}else if(currentPlayType=="rxq"){
			if(selectBallNum >= 8){
				alert("请选择7-8个球投注！");
				return false;
			}
		}else{
			return true;
		}
	}
	return true;
}

/**
 * 更新选球注数,同时更新投注金额
 */
function updateBetNum(){
	var balls=[];
	balls=getSelectBalls(false);
	var betNum=0;
	var baseBet = updateBetNumByPlayType();
	if(balls){
		betNum=countBetNum(baseBet,balls);
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
	var subTypes=PlayType.bjkl8[playType].subTypes;
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
	case "rxe":
		num = 2;
		break;
	case "rxs":
		num = 3;
		break;
	case "rxsi":
		num = 4;
		break;
	case "rxw":
		num = 5;
		break;
	case "rxl":
		num = 6;
		break;
	case "rxq":
		num = 7;
		break;
	default:
		num = 1;
		break;
	}
	return num;
}
var currentGame = "pl3";

/**
 * 预加载数据
 */
$(function () {
	//初始化玩法
	changePlayType("sm");
	
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
		if (currentPlayType == "dwd") {
			for ( var i = 0; i < balls.length; i++) {
				betNum += balls[i].length;
			}
		} else if (currentPlayType == "smzzhz") {
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
		} else if (currentPlayType == "smzxzs") {
			betNum = MathUtil.comb(balls[0].length, 2) * 2;
		} else if (currentPlayType == "smzxhz") {
			/*if (balls[0].length == 0) {
				return;
			}
			for ( var i = 0; i < balls[0].length; i++) {
				betNum+=combSmzxhz(balls[0][i])
			}*/
            cc = {1:1,2:2,3:2,4:4,5:5,6:6,7:8,8:10,9:11,10:13,11:14,12:14,13:15,14:15,15:14,16:14,17:13,18:11,19:10,20:8,21:6,22:5,23:4,24:2,25:2,26:1};
            var max_place = parseInt(0,10);;
            
            for( i=0; i<=max_place; i++ ){
                var s = balls[i].length;
                for( j=0; j<s; j++ ){
                    betNum+= cc[parseInt(balls[i][j],10)];
                }
            };
		} else {
			betNum = countBetNum(baseBet, balls);
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
	var subTypes=PlayType.pl3[playType].subTypes;
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

function updateBetNumByPlayType() {
	var num = 1;
	switch (currentPlayType) {
	case "smzxzs":
		num = 2;
		break;
	case "smzxzl":
		num = 3;
		break;
	case "hezuxfs":
		num = 2;
		break;
	case "qezuxfs":
		num = 2;
		break;
	default:
		num = 1;
		break;
	}
	return num;
}
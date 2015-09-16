$(function() {
	addBallEvent();
});

function addBallEvent(){
	$(".ballItem").bind("click",switchBall);
	$("[name='clean']").bind("click",clearBallSwitchStatus);
	$("[name='all']").bind("click",selectAll);
	$("[name='big']").bind("click",selectBig);
	$("[name='small']").bind("click",selectSmall);
	$("[name='odd']").bind("click",selectDdd);
	$("[name='even']").bind("click",selectEven);
}

/**
 * 投注求开关，选中/未选中 开关。
 */
function switchBall(element){
	$(element.currentTarget).toggleClass("selected");
	updateBetNum();
}

/**
 * 清除选中状态
 */
function clearBallSwitchStatus(){
	$(this).parent().prev().children().removeClass("selected");
	updateBetNum();
}
/**
 * 选中全部号码
 */
function selectAll(){
	$(this).parent().prev().children().addClass("selected");
	updateBetNum();
}
/**
 * 选中大号
 */
function selectBig(){
	var itemList=$(this).parent().prev().children();
	$(itemList).removeClass("selected");
	if(itemList.length<=11){
		for(var i=5;i<itemList.length;i++){
			$(itemList[i]).addClass("selected");
		}
	}else{
		for(var i=11;i<itemList.length;i++){
			$(itemList[i]).addClass("selected");
		}
	}
	updateBetNum();
}
/**
 * 选中小号
 */
function selectSmall(){
	var itemList=$(this).parent().prev().children();
	$(itemList).removeClass("selected");
	if(itemList.length<=11){
		for(var i=0;i<5;i++){
			$(itemList[i]).addClass("selected");
		}
	}else{
		for(var i=0;i<11;i++){
			$(itemList[i]).addClass("selected");
		}
	}
	updateBetNum();
}
/**
 * 选中奇号
 */
function selectDdd(){
	var itemList=$(this).parent().prev().children();
	$(itemList).removeClass("selected");
	if(currentGame.indexOf("115")!=-1 || currentGame=="klsf"){
		for(var i=0;i<itemList.length;i++){
			if(i%2==0){
				$(itemList[i]).addClass("selected");
			}
		}
	}else{
		for(var i=0;i<itemList.length;i++){
			if(i%2!=0){
				$(itemList[i]).addClass("selected");
			}
		}
	}
	
	updateBetNum();
}
/**
 * 选中偶号
 */
function selectEven(){
	var itemList=$(this).parent().prev().children();
	$(itemList).removeClass("selected");
	if(currentGame.indexOf("115")!=-1 || currentGame=="klsf"){
		for(var i=0;i<itemList.length;i++){
			if(i%2!=0){
				$(itemList[i]).addClass("selected");
			}
		}
	}else{
		for(var i=0;i<itemList.length;i++){
			if(i%2==0){
				$(itemList[i]).addClass("selected");
			}
		}
	}
	updateBetNum();
}
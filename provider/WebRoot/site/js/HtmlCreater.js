/**
 * 依据球号获取球号渲染项HTML
 * @param ballNumber
 * @returns {String}
 */
function getBallItem_LI(ballNumber){
	var html='<li name="lt_place_0" class="ballItem">'+ballNumber+'</li>';
	return html;
}
/**
 * 依据开始和结束球号获取选号区行
 * @param nos '0|1|2|3|4|5|6|7|8|9'
 * @param title
 */
function getBallNumber_UL(nos,title){
	var nums=nos.split("|");
	
	if(currentPlayType=="dds" || currentPlayType=="sthtx" || currentPlayType=="slhtx" || currentPlayType=="hzds"){
		var html='<ul class="numList floatL bigBt" title="'+title+'">';
	}else if(currentPlayType=="hzdx" || currentPlayType=="jop" || currentPlayType=="sxp" || currentPlayType=="hzdxds"){
		var html='<ul class="numList floatL bigBt" title="'+title+'">';
	}else{
		var html='<ul class="numList floatL" title="'+title+'">';
	}
	
	for(var i=0;i<nums.length;i++){
		html=html+getBallItem_LI(nums[i]);
	}
	html=html+"</ul>";
	return html;
}
/**
 * 获取 每一行球的控制按钮UL
 * @returns {String}
 */
function getBallCtrl_UL(){
	var html='<ul class="btnList"><li name="all" class="selectType">全</li><li class="selectType" name="big">大</li><li class="selectType" name="small">小</li><li class="selectType" name="odd">奇</li><li class="selectType" name="even">偶</li><li class="selectType" name="clean"><font color="6d6d6d">清</font></li></ul>';
	return html;
}

function getBallSelectorAreaHtml(){
	
}
/**
 * 获取玩法按钮 {"code" : "szxfs","name" : "直选复式"}
 * @param playTypeObject
 */
function getPlayTypeBtnItemHtml(playTypeObject){
	var html ='<label class="li playType" onclick="updateRebate(\''+playTypeObject.code+'\')"  value="'+playTypeObject.code+'"><span>'+playTypeObject.name+'</span></label>';
	return html;
}
/***
 * 更新不同子玩法的返点
 */
function updateRebate(code){
	currentPlayType = code;
	initSliderData();
	initSlider();
}
/**
 * 最后5期开奖结果
 * @param lotteryDate
 * @param lotteryNumStr
 * @returns
 */
function getLastFiveLotteryResult(lotteryDate,lotteryNumStr){
	var html='<ul><li class="stage">'+lotteryDate+'</li><li class="haoma1">';
	var nums=lotteryNumStr.split(",");
	for(var i=0;i<nums.length;i++){
		html=html+"<span>"+nums[i]+"</span>";
	}
	html=html+"</li></ul>";
	return html;
}
/**
 * 生成
 * @param codes 球号
 * @param desc 描述
 * @param playType 玩法代码
 * @param moneyType 货币单位 (元角分)
 * @param betNum 投注数量
 * @param timesNum 投注倍数
 * @param money 多少钱
 * @param money 行序号, 用于删除行
 */
function getBetTr(codes,desc,playType,moneyType,betNum,timesNum,money,trIndex){
	var html='<tr id="betNumContentTr_'+trIndex+'" class="table_line"><th width="50%" style="padding-left:10px;" class="">';
	html=html+desc;
	html=html+'</th>';
	html=html+'<td width="100" class="">模式:'+playType+'</td>';
	var moneyName="元";
	if(moneyType==2){
		moneyName="角";
	}else if(moneyType==3){
		moneyName="分";
	}
	html=html+'<td width="50" class="">'+moneyName+'</td>';
	html=html+'<td width="50" class=""><span>'+betNum+'</span>注</td>';
	html=html+'<td width="50" class="">'+timesNum+'倍</td>';
	html=html+'<td width="80" class="">'+money+'元</td>';
	html=html+'<td class="del" width="30"><span title="删除" style="cursor: pointer;">';
	html=html+'<img onclick="removeTr('+trIndex+')" src="../../site/css/images/btn_08.jpg"></span>';
	html=html+'<input type="hidden" name="betsHidden" value="';
	html=html+"{'playType':'"+playType+"','codes':'"+codes+"','timesNum':'"+timesNum+"','moneyType':'"+moneyType+"'," +
			"'betNum':'"+betNum+"','money':"+money+"}\"></td></tr>";
	return html;
}
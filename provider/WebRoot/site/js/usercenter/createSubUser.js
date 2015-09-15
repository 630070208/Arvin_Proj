var currentGameType="CQSSC";
$(function() {
	$("#gameType").children().bind("click",onGameTypeClick);
	$("#keeppoint").bind("input",onKeeppointChange);
});
function onKeeppointChange(){
	$(this).val(Number($(this).val().replace(/[^0-9]/g,"")));
	var sjbl = $("#keeppoint").val();
	onGameTypeChange(currentGameType,parseFloat(sjbl));
}

/**
 * 执行新增
 */
function saveUser(){
	var val =$('#userName').val();
	if(val==undefined||val==null||val==""){
		alert("用户名必填");
		return ;
	}
	val =$('#userpass').val();
	if(val==undefined||val==null||val==""){
		alert("密码必填");
		return ;
	}
	val =$('#nickname').val();
	if(val==undefined||val==null||val==""){
		alert("用户昵称必填");
		return ;
	}
	val =$('#keeppoint').val();
	if(val==undefined||val==null||val==""){
		alert("自身保留返点必填");
		return ;
	}
	val=parseFloat(val);
	if(isNaN(val)){
		alert("自身保留返点请填写数字");
		return ;
	}
	if(val<=1){
		alert("自身保留返点必须大等于:1");
		return ;
	}
	if(val>minRebate){
		alert("自身保留返点不得大于:"+minRebate);
		return ;
	}
	var data=$('#createUserForm').serialize();
	ajaxRequest("/uc/saveSubUser",data,"post",onSaveUserResult,onSaveUserFault);
}

function onSaveUserResult(data){
	alert(data.code);
}
function onSaveUserFault(error){
	alert(error);
}

/**
 * 彩种玩法点击事件侦听
 */
function onGameTypeClick(){
	$("#gameType").children().removeClass("hover");
	$(this).addClass("hover");
	try{
		currentGameType=$(this).attr("value");
		var sjbl = $("#keeppoint").val();
		onGameTypeChange(currentGameType,parseFloat(sjbl));
	}catch(error){
		onGameTypeChange(null);
	}
}

/**
 * 发送请求到后台,校验是否用户名已占用
 * @param value
 */
function checkUser(userName){
	ajaxRequest("checkUserName?userName="+userName,null,"get",onCheckUserResult);
}
/**
 * 校验用户名返回
 * @param data
 */
function onCheckUserResult(data){
	if(data.code==1){
		$('#userchk').html('用户名可用!');
	}else{
		$('#userchk').html('用户名已被占用!');
	}
}


function fanDianJiSuan(){
	var sjbl = $("#keeppoint").val();
	onGameTypeChange(currentGameType,parseFloat(sjbl));
}



function onGameTypeChange(gameType,sjfd) {
	if(sjfd>minRebate){
		alert("自身保留返点不得大于:"+minRebate);
	}
	
	var list =rebate[gameType].playTypes;
	var tableHtml='<table width="100%" border="0" cellspacing="0" cellpadding="0"	class="grayTable">';
	tableHtml=tableHtml+"<tr><th>玩儿法</th><th>最高</th><th>最低</th><th>返点</th><th>浮动</th></tr>";
	if(list!=null&&sjfd>0&&sjfd<=minRebate){
		for(var i=0;i<list.length;i++){
			var item=list[i];
			var m=(item.maxPrzie-item.minPrzie)/item.rebate;
			var b=(item.rebate-sjfd)*m;
			var tr="<tr><td>";
			tr=tr+item.playTypeName+"</td><td>";
			tr=tr+(item.minPrzie+b).toFixed(2)+"</td><td>";
			tr=tr+item.minPrzie+"</td><td>";
			tr=tr+(item.rebate-sjfd).toFixed(2)+"</td><td>";
			tr=tr+item.isRelocateName+"</td></tr>";
			tableHtml=tableHtml+tr;
		}
	}	
	
	tableHtml=tableHtml+"</table>";
	$("#allbackset").html(tableHtml);
}
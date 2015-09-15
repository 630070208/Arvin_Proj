
/**
 * 扩展js  string方法
 * 去字符串的空格
 * @return
 */
String.prototype.Trim = function()  
{  
  return this.replace(/\s/g, "");  
}  

$(function () {
	$(".ui_timepicker").datepicker({
  	  format: 'yyyy-mm-dd',
        weekStart: 1,
        autoclose: true,
        todayBtn: 'linked',
        language: 'zh-CN'
 });
    $("#lotteryType").change(function(){
    	seleChange();
    });
});

function seleChange(name){
	var name = $('#lotteryType option:selected').val();
	var data = {gametype: name};
	ajaxRequest("/system/rebate/chgtype",data,"post",resultHandler);
}
function resultHandler(data){
	var content = "";
	for ( var i = 0; i < data.length; i++) {
		content+="<option value='"+data[i]+"'>"+data[i]+"</option>";
	}
	$('#playtype').html(content);
}

function drawals(orderId){
	if(confirm("确定撤单？")){
		ajaxRequest("/system/business/tz/withDrawals",{"orderId":orderId},"post",drawalsSuccess);
	}
}

function drawalsSuccess(data){
	if(data.flag){
		$("#status"+data.id).html("已撤单");
		alert(data.msg);
	}else{
		alert(data.msg)
	}
}

/*
 * 删除一条投注记录
 * */

function delGameOrderID(id){
	if(confirm("确定删除？")){
		$("#gameorderId").val(id);
		$("#delForm").submit();
	}
}
//跳转到修改页面
function modifyTzContent(id,t){
	$("#gameorderid").val(id)
	ajaxRequest("/system/business/tz/findEntry",{"id":id},"post",sucHandler);
    t.href="#upload_form";	
}

function sucHandler(data){
	data = data.gameOrder;
	data = data.planItems;
	$("#modidyflag").empty();
	for(var i=0;i<data.length;i++){
		$("#modidyflag").append("<input type='text' class='maxPrize form-control flagclass' value='"+data[i].content+"' /> ");
	}	
}

function modifyContent(){
	
	var contentAry = [];
    $(".flagclass").each(function(){
    	contentAry.push(this.value);
    });
    var data={"gameOrderID":$("#gameorderid").val(),"betCode":contentAry.join("-")};
    ajaxRequest("/system/business/tz/modify",data,"post",modifyHandler);
}
function modifyHandler(data){
	 alert(data.msg);
	window.location.reload();
}




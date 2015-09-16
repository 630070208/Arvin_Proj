String.prototype.Trim = function()  
{  
  return this.replace(/\s/g, "");  
}  




//跳转到修改页面
function modifyTzContent(id,t){
  $("#txBlank").val($($(t).parent().parent().children()[3]).text().Trim());
  $("#txRealName").val($($(t).parent().parent().children()[5]).text().Trim());
  $("#txBlankNo").val($($(t).parent().parent().children()[6]).text().Trim());
  $("#txMoney").val($($(t).parent().parent().children()[2]).text().Trim());
  t.href="#upload_form";	
}


$(function(){
	$("#submit_id").click(function(){
		alert($("#tzBlankNo").val());
		var data ={
				"userBlank.bankName":$("#txBlank").val(),
				"drawMoney.userBlank.realName":$("#tzRealName").val(),
				"drawMoney.userBlank.bankCode":$("#tzBlankNo").val(),
				"money":$("#tzBlankNo").val()
		};
		ajaxRequest("http://localhost:8080/system/business/txr/modify",data,"post",resultHandler);
	});
})


function resultHandler(data){
	
	
}







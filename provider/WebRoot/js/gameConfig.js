$(document).ready(function(){
	seleChange();
});

function editRecord(element,index){
	var result = $(element).parent("td").parent("tr").html();
	var isZh = $('input[name="isZh'+index+'"]:checked').val();
	var isOpen = $('input[name="isOpen'+index+'"]:checked').val();
	var rstctCode = $("#rstctCode"+index).val();
	var rstctNumber = $("#rstctNumber"+index).val();
	var content = "<input type='text' name='isZh' value='"+isZh+"' /><input type='text' name='isOpen' value='"+isOpen+"' />"+
	"<input type='text' name='rstctCode' value='"+rstctCode+"' /><input type='number' name='rstctNumber' value='"+rstctNumber+"' />";
	result+=content;
	$("#tab"+index).html(result);
	$("#tab"+index).submit();
}

function seleChange(name){
	var name = $('.gametype option:selected').val();
	var data = {gametype: name};
	ajaxRequest("http://192.168.0.222:8044/system/rebate/chgtype",data,"post",resultHandler);
}

function resultHandler(data){
	var content = "";
	for ( var i = 0; i < data.length; i++) {
		content+="<option value='"+data[i]+"'>"+data[i].desc+"</option>";
	}
	$('.playtype').html(content);
}

function delItem(id){
	var flag = confirm("确认删除？");
	if(flag){
		window.location.href="/system/game/del?id="+id;
	}
}
function goStep2(){
	var reg = /(^[1-9]+(.[0-9]{1,2})?$)|(^[0-9](.[0-9]{1,2}){1}$)/;
	var val =$('#rechargeNum').val();
	if(val==undefined||val==null||val==""){
		alert("请输入充值金额!");
		return ;
	}else if(!reg.test(val)){
		alert("请输入正确的金额值");
		return;
	}else if(parseFloat(val) < 10 || parseFloat(val) > 50000){
		alert("至少充值10￥,最多充值50000￥");
		return;
	}
	val =$('#bankSelector').val();
	if(val==undefined||val==null||val==""){
		alert("请选择银行!");
		return ;
	}
	$('#step1').hide();
	$('#step2').show();
	//生成充值序列号
	var data=$('#rechargeForm').serialize();
	ajaxRequest("/uc/getRechargeSerialNumber",data,"post",onSerialNumberResult);
}

function onSerialNumberResult(data){
	$('#serial_number').text(data.serialNumber);
	$('#bank_name').text(data.bankName);
	$('#bank_holder').text(data.bankHolder);
	$('#e_mail').text(data.email);
}

$(function(){
	/**
	 * 请求银行信息
	 */
	ajaxRequest("/uc/getAllBank","","post",sucResult);
});

function sucResult(data){
	 $("#bankSelector").empty();
     var bankmsg = data.bank;
     for(key in bankmsg){
       $("#bankSelector").append("<option value='"+key+"'>"+bankmsg[key]+"</option>");
     }
}



function openBankPage(){
	
}
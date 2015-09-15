
    var realNameFlag = false;
    var branchFlag = false;
    var accountFlag = false;
    var accountAgin = false;



$(function(){
    $("#province").empty();
    $("#province").append("<option value='-1'>请选择开户省份 </option>");
    for(var i = 0 ; i < TGcitys.length ; i++){
       $("#province").append("<option  value='"+i+"'>"+TGcitys[i][0]+"</option>");
    }
    
    $("#province").change(function(){
         $("#city").empty();
         if(this.value == -1){
           $("#city").append("<option value='-1'>请选择 </option>");
         }else{
            for(var j = 1 ; j < TGcitys[this.value].length ; j++){
                $("#city").append("<option value='"+j+"'>"+TGcitys[this.value][j]+" </option>");
            }
         }
    });
    
    /*返回所有银行的code和名字
    */
    ajaxRequest(ajaxUrl+"/uc/getAllBank","","post",Result,Fault);
     
     function Result(data){
        
        $("#bank").empty();
        var bankmsg = data.bank;
        for(key in bankmsg){
          $("#bank").append("<option value='"+key+"'>"+bankmsg[key]+"</option>");
        }
        
     }
     function Fault(error){
       
       alert(error);
     
     }
 });

function subSaveBank(){

    var data = {"province":$("#province  option:selected").text()
          ,"city":$("#city  option:selected").text()
          ,"banknum":$("#bank").val()
          ,"realName":$("#account_name").val()
          ,"bankCode":$("#account_again").val()
          ,"branch":$("#branch").val()};
    if(realNameFlag&&branchFlag&&accountFlag&&accountAgin){
    	ajaxRequest(ajaxUrl+"/uc/saveBankCard",data,"get",saveResult,saveFault);
    }
   
}


function saveResult(data){

   alert(data.msg);
   window.location.reload();
   
}


function saveFault(error){
  
   alert(error);
  
}



//对页面form表单验证

$(function(){
    var regName = new RegExp("^[\\u4E00-\\u9FFF]+$");//验证用户名字是否是汉字
    var regBranch = /^[\u4e00-\u9fa5a-z]+$/gi;  //检查特殊字符  
    var regBankNum = new RegExp("^[0-9 -]+$");
    $("#account_name").blur(function(){
            
	          if(!regName.test($("#account_name").val())){
	             $("#account_name_msg").css("color","red");
	             $("#account_name_msg").text("真实名字必须全部为汉字");
	             realNameFlag = false;
	          }else if(this.value.length > 8){
	             $("#account_name_msg").css("color","red");
	             $("#account_name_msg").text("名字长度小于8个字符");
	             realNameFlag = false;
	          }else{
	             $("#account_name_msg").css("color","green");
	             $("#account_name_msg").text("开户名称格式正确");
	             realNameFlag = true;
	          }
    });
    $("#branch").blur(function(){
        
        if(!regBranch.test($("#branch").val())){
            $("#branch_msg").css("color","red");
	           $("#branch_msg").text("不能包含特殊字符");
	           branchFlag = false;
        }else if(this.value.length > 20 && this.value.length < 1 ){
            $("#branch_msg").css("color","red");
	           $("#branch_msg").text("输入字符在1到20个字符之间");
	           branchFlag = false;
        }else{
            $("#branch_msg").css("color","green");
	           $("#branch_msg").text("格式正确");
	           branchFlag = true;
        }
    });
		$("#account").blur(function(){
        
        if(!regBankNum.test($("#account").val())){
            $("#account_msg").css("color","red");
	           $("#account_msg").text('不能包含"-、空格"之外的特殊字符');
	           accountFlag = false;
        }else if($("#account").val().length>22 || $("#account").val().length<16){
        		$("#account_msg").css("color","red");
	           $("#account_msg").text('您输入的卡号长度错误！');
	           accountFlag = false;
        }else{
        	   $("#account_msg").css("color","green");
	           $("#account_msg").text("格式正确");
	           accountFlag = true;
        }
    });
    $("#account_again").blur(function(){
        
        if($("#account_again").val()!=$("#account").val()){
            $("#account_again_msg").css("color","red");
	           $("#account_again_msg").text('两次输入的卡号不一致');
	           accountAgin = false;
        }else{
        	   $("#account_again_msg").css("color","green");
	           $("#account_again_msg").text("格式正确");
	           accountAgin = true;
        }
    });
    
    
    
   
});
function checkForm(){

  var reg = new RegExp("^[\\u4E00-\\u9FFF]+$","g");
    if($("#province").val().indexOf("-1") != -1){
       alert("请选择省市");
       return false;
    }
    if($("#branch").val() != ""){
         alert("请输入支行名字");
         return false;
    }
    if(!reg.test($("#account_name").val())){
         alert("真实名字应该不包括英文字符");
         $("#account_name_msg").text("真实名字应该不包括英文字符");
         return false;
    }
}
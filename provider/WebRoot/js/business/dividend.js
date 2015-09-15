String.prototype.Trim = function()  
{  
  return this.replace(/\s/g, "");  
} 
function isNumber(oNum){
  if(!oNum) return false;
      var strP=/^\d+(\.\d+)?$/;
      if(!strP.test(oNum)) return false;
      try{
         if(parseFloat(oNum)!=oNum) return false;
        }
      catch(ex){
         return false;
       }
  return true;
 }


function del(id){
  
  if(confirm("确认删除？")){
    $("#dividendId").val(id);
    $("#delForm").submit(); 
  }
  
}

function modify(id,t){
   $("#userquotaid").val(id);
  // alert($($(t).parent().parent().children()[0]).text().Trim());
   $("#pestart").val($($(t).parent().parent().children()[0]).text().Trim());
   $("#peend").val($($(t).parent().parent().children()[1]).text().Trim());
   $("#pequota").val($($(t).parent().parent().children()[2]).text().Trim());
   t.href = "#peie_form";
 
}


function checkAndSub(){

  if(check("modify")){
     $("#peie_form").submit();
  }else{
     alert("请检查输入参数是否有字符");
  }
  
}

function checkAndAdd(){

  if(check("add")){
    $("#peieadd_form").submit();
  }else{
    alert("请检查输入参数是否有字符");
  }
  
}




function check(str){

  if(str=="add"){
	  if(isNumber($("#ratio").val()) && isNumber($("#startMoney").val()) && isNumber($("#termiMoney").val())){
	      return true;
	  }
  }else if(str == "modify"){
	  if(isNumber($("#pestart").val()) && isNumber($("#peend").val()) && isNumber($("#pequota").val())){
	      return true;
	  }
  }
  return false;
  
}
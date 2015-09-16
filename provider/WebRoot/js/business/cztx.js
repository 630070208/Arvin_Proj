//将字符串日期转成日期类型   
var stringToDate = function(dateStr,separator){  
	                            if(!separator){  
                                    separator="-";  
                                }  
                                var dateArr = dateStr.split(separator);  
                                var year = parseInt(dateArr[0]);  
                                var month;  
                             if(dateArr[1].indexOf("0") == 0){  
                                    month = parseInt(dateArr[1].substring(1));  
                                }else{  
                                     month = parseInt(dateArr[1]);  
                                }  
                                var day = parseInt(dateArr[2]);  
                                var date = new Date(year,month -1,day);  
                                return date;  
                            }  

function delWalletWithID(id){
	if(confirm("确定删除？")){
		$("#walletDetailId").val(id);
		$("#delForm").submit();
	}
}
/**
 * 清空所有数据
 * @return
 */
function delAll(){
	if(confirm("确定删除所有数据？？")){
		window.location.href="delAll";
	}
}




$(function () {
    $(".ui_timepicker").datepicker({
    	  format: 'yyyy-mm-dd',
          weekStart: 1,
          autoclose: true,
          todayBtn: 'linked',
          language: 'zh-CN'
   });
    
    
    $("#sreachByCondition").click(function(){
    	if($("#startTime").val() != null && $("#startTime").val() != "" && $("#endTime").val() != null && $("#endTime").val() != ""){
    		if(stringToDate($("#startTime").val())>stringToDate($("#endTime").val())){
        		alert("您输入的起始日期大于结束日期！");  
        		return;
        	}
    	}
    	$("#form").submit();
    });
})

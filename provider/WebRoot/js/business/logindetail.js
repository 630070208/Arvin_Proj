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

function delMemberId(id){
	if(confirm("确定删除？")){
		$("#memberlogid").val(id);
		$("#delForm").submit();
	}
}

/**
 * 查看此人
 */
function  findOnlyP(t){
	window.location.href="list?nickname="+$($(t).parent().parent().children()[1]).text()+"";
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
});





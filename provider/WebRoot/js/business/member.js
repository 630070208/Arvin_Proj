/**
 * 日期格式化函数
 * @param dateStr
 * @param separator
 * @return
 */

Date.prototype.format =function(format)
{
	var o = {
			"M+" : this.getMonth()+1, //month
			"d+" : this.getDate(), //day
			"h+" : this.getHours(), //hour
			"m+" : this.getMinutes(), //minute
			"s+" : this.getSeconds(), //second
			"q+" : Math.floor((this.getMonth()+3)/3), //quarter
			"S" : this.getMilliseconds() //millisecond
			}
			if(/(y+)/.test(format)) format=format.replace(RegExp.$1,
			(this.getFullYear()+"").substr(4- RegExp.$1.length));
			for(var k in o)if(new RegExp("("+ k +")").test(format))
			format = format.replace(RegExp.$1,
			RegExp.$1.length==1? o[k] :
			("00"+ o[k]).substr((""+ o[k]).length));
			return format;
	}


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

function del(id){
	if(confirm("确定删除？")){
		$("#memberId").val(id);
		$("#delForm").submit();
	}
}

/**
 * 修改 和详情
 * @param id
 * @return
 */
var type ;
function modify(id,typ,t){
	var data ={"id":id};
	$("#memberid").val(id);
	type = typ;
	t.href="#upload_form";	
	ajaxRequest("/system/member/findById",data,"post",resultHandler);
}
function changeIntToDate(mill){
	var date = new Date(parseInt(mill));
	var str = date.format("yyyy-MM-dd hh:mm:ss"); 
	return str;
}

function resultHandler(data){
	$("#dianickname").val(data.member.nickname);
	$("#diasyspsw").val(data.member.syspsw);
	$("#diaemail").val(data.member.mail);
	$("#diaemail").val(data.member.mail);
	if(data.member.istest)
	    $("#diaistest ").get(0).selectedIndex=0;
	else
		$("#diaistest ").get(0).selectedIndex=1;
	
	$("#diausertype").val(data.member.userType);
	$("#diastate").val(data.member.state);
	$("#diaregtime").val(changeIntToDate(data.member.regTime.time.time));
	$("#dialastlogtime").val(changeIntToDate(data.member.lastLogTime.time.time));
	if(data.member.online)
	   $("#diaisonline").val("是");
	else
		$("#diaisonline").val("否");
	$("#dialoginip").val(data.member.loginIp);
	$("#diaactday").val(data.member.actDay);
	if("modify".indexOf(type) != -1)
		
 	   {
		$("#titletext").text("修改资料");
		$(".hid").hide();
	    $(".flag").find(":input[type='text']").attr("disabled",false);
	    $("#modifysubmit").show();
 	   }
	else if("detail".indexOf(type) != -1)
	  {
		$("#titletext").text("详情");
        $(".hid").show();
		$(".flag").find(":input[type='text']").attr("disabled",true);
		$("#modifysubmit").hide();
	  }
}


/**
 * 点击查看返点的时候把所有数据全部请求回客户端  然后用js来填充数据
 * @param id
 * @param t
 * @return
 */
function showFandian(id,t){
	var data ={"id":id};
	t.href="#fandian_form";	
	ajaxRequest("/system/member/toFindFanDian",data,"post",resultHandler1);
}
var gameTypeDesc = new Array();//存放彩种和对应的描述的关联数组

var allFandian;  //存放该会员的所有的返点信息   当发生change事件的时候从此数组中取数据

function resultHandler1(d){
	var flag ;
	/**
	 * 将数据清空
	 */
	$("#fdplaytype").empty();
	flag = null;
	allFandian = null;
	$("#fdgametype").empty();
	
	
	if(d["re"] == undefined){
		$("#fdplaytype").append("<tr><td colspan=5>无数据</td></tr>");
		$("#fdgametype").append("<option>无数据</option>");
		return;
	}
	allFandian = d["re"];
	var data = d["re"];
	for(key in data){
		var descName = key.split("|");
		gameTypeDesc[descName[0]] = descName[1];
	}
	for(key in gameTypeDesc){
		$("#fdgametype").append("<option value='"+key+"'>"+gameTypeDesc[key]+"</option>");
	}
	
	for(key in gameTypeDesc){
		flag = key+"|"+gameTypeDesc[key];
		break;
	}
	for(key in allFandian){
		if(key == flag ){
			var tempd = allFandian[key];
			for(key1 in tempd){
				var descKey1 = key1.split("|");
				var isfloat;
				if(tempd[key1].isRelocate == 'false'){
					isfloat = '否';
				}else{
					isfloat = '是';
				}
				$("#fdplaytype").append("<tr><td>"+descKey1[1]+"</td><td>"+tempd[key1].maxPrzie+"</td><td>"+tempd[key1].minPrzie+"</td><td>"+tempd[key1].rebate+"</td><td>"+isfloat+"</td></tr>");
			}
		}
	}
}

$(function(){
	$("#fdgametype").change(function(){
		$("#fdplaytype").empty();
		for(key in allFandian){
			if(key.indexOf(this.value) != -1 ){
				var tempd = allFandian[key];
				for(key1 in tempd){
					var descKey1 = key1.split("|");
					var isfloat;
					if(tempd[key1].isRelocate == 'false'){
						isfloat = '否';
					}else{
						isfloat = '是';
					}
					$("#fdplaytype").append("<tr><td>"+descKey1[1]+"</td><td>"+tempd[key1].maxPrzie+"</td><td>"+tempd[key1].minPrzie+"</td><td>"+tempd[key1].rebate+"</td><td>"+isfloat+"</td></tr>");
				}
			}
		}
	});
});

function zhmx(name){
	window.location.href="/system/business/cztk/list?nickname="+name+"";
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

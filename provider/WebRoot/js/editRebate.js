$(document).ready(function(){
	$("input[name='isRelocate']").change(function() {     //id 为season行内radio值变化函数  
	    var season = $("input[name='isRelocate']:checked").val();   // 获取当前选中radio的值  
	    if (season == "true") {  //浮动模式
	        $("#is_rebate").css("display", "block");
	    }  
	    if (season == "false") {  //固定模式
	        $("#is_rebate").css("display", "none");  
	    }  
	  
	});
	seleChange();
});

//edit record
function editRecord(element,index){
	var result = $(element).parent("td").parent("tr").html();
	$("#tab"+index).html(result);
	$("#tab"+index).submit();
}

function submitClick(type){
	ajaxFormSubmit("edit","upload_form","POST",resultHandler,faultHandler);
	
	function resultHandler(data){
		if(type=="edit"){
			//var str = JSON.stringify(data);
	    	var curTr = $(".curTr").children("td");//要修改的数据所在第一个td
	    	curTr.eq(1).text(data.maxPrize);
	    	curTr.eq(2).text(data.minPrize);
	    	curTr.eq(3).text(data.sysDeduct);
	    	curTr.eq(4).text(data.rebate);
	    	curTr.removeClass("curTr");
		}else if(type=="add"){
			var content = "<tr><td>"+data.gametype+"-"+data.playtype+"</td><td>"+data.maxPrize+"</td>"+
							"<td>"+data.minPrize+"</td><td>"+data.sysDeduct+"</td><td>"+data.rebate+"</td>"+
							"<td align='center'><a class='btn btn-xs btn-primary popup-file' onclick='editRecord(this)' title='编辑' href='#upload_form'>"+
							"<i class='fa fa-pencil'></i></a><input type='hidden' value="+data.id+" />&nbsp;" +
							"<a class='btn btn-xs btn-secondary' title='删除' href='del?id="+data.id+"'><i class='fa fa-times'></i></a></td></tr>";
			$("#sysPrizeTab tbody").append(content);
		};
		$.magnificPopup.close();//关闭dialog
	}

	function faultHandler(data){
		alert(data.message);
	};
};

function delItem(id){
	var flag = confirm("确认删除？");
	if(flag){
		window.location.href="/system/rebate/del?id="+id;
	}
}

function seleChange(name){
	var name = $('.gametype option:selected').val();
	var data = {gametype: name};
	ajaxRequest("http://192.168.0.222:8044/system/rebate/chgtype",data,"post",resultHandler);
}

function resultHandler(data){
	var content = "";
	for ( var i = 0; i < data.length; i++) {
		content+="<option value='"+data[i]+"'>"+data[i]+"</option>";
	}
	$('.playtype').html(content);
}
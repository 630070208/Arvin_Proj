
	//显示省份列表
	function showprovince(){
		var date = new Date();
		var url="/provincelist?d="+date.getTime();
		$.ajax({
			url: url,
			type: "get",
			contentType: "application/json;charset=utf-8",
			async: false,
			cache:false,
			success: function(responseText){
				if(responseText == "") {return;}
	 			var data =   eval("("+responseText+")");
 		   		var	dataInfo = '<option value="">请选择省</option>';
 		   		var pHid = $("#provinceHid").val();
 		    	for(var i=0;i<data.length;i++){
 		    		if(pHid == data[i].province){
 		    			dataInfo +='<option data-id="'+data[i].provinceId+'" value="'+data[i].province+'" selected="selected" >'+data[i].province+'</option>';
 		    			showcity(data[i].provinceId);
 		    		}else{
						dataInfo +='<option data-id="'+data[i].provinceId+'" value="'+data[i].province+'" >'+data[i].province+'</option>';
					}
				}	
 		    	$("#province").html("").append(dataInfo);
	 		}
		});
	}
	//显示市列表
	function showcity(father){
		if(father == undefined){
			$("#city").html("").append("<option value=''>请选择市</option>");
			$("#area").html("").append("<option value=''>请选择区</option>");
		}
		var date = new Date();
		var url="/citylist/"+father+"?d="+date.getTime();
		$.ajax({
			url: url,
			type: "get",
			contentType: "application/json;charset=utf-8",
			async: false,
			cache:false,
			success: function(responseText){
				if(responseText == "") {return;}
	 			var data =   eval("("+responseText+")");
 		   		var	dataInfo = '<option value="">请选择市</option>';
 		   		var cHid = $("#cityHid").val();
 		    	for(var i=0;i<data.length;i++){
 		    		if(cHid == data[i].city){
 		    			dataInfo +='<option data-id="'+data[i].cityId+'" value="'+data[i].city+'" selected="selected">'+data[i].city+'</option>';
 		    			showarea(data[i].cityId);
 		    		}else{
						dataInfo +='<option data-id="'+data[i].cityId+'" value="'+data[i].city+'">'+data[i].city+'</option>';
					}
				}	
 		    	$("#city").html("").append(dataInfo);
	 		}
		});
	}
	//显示区列表
	function showarea(father){
		if(father == undefined){
			$("#area").html("").append("<option value=''>请选择区</option>");
		}
		var date = new Date();
		var url="/arealist/"+father+"?d="+date.getTime();
		$.ajax({
			url: url,
			type: "get",
			contentType: "application/json;charset=utf-8",
			async: false,
			cache:false,
			success: function(responseText){
				if(responseText == "") {return;}
	 			var data =   eval("("+responseText+")");
 		   		var	dataInfo = '<option value="">请选择区</option>';
 		   		var aHid = $("#areaHid").val();
 		    	for(var i=0;i<data.length;i++){
 		    		if(aHid == data[i].area){
 		    			dataInfo +='<option value="'+data[i].area+'" selected="selected">'+data[i].area+'</option>';
 		    		}else{
						dataInfo +='<option value="'+data[i].area+'">'+data[i].area+'</option>';
					}
				}	
 		    	$("#area").html("").append(dataInfo);
	 		}
		});
	}
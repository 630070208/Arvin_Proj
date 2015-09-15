var ROOT_URL = "http://192.168.0.222:8044/"

String.prototype.replaceAll = function(s1, s2) {      
    return this.replace(new RegExp(s1, "gm"), s2);
};

function ajaxRequest(url, data, reqType, resultHandler, faultHander) {
	$.ajaxSetup({ 
		async: false
	});
	if (typeof(faultHander) == 'undefined') {
		faultHander = function(data) {
			alert("error");
		};
	}
	$.ajax({
		url : url,
		data : data,
		type : reqType,
		cache : false,
		dataType : 'json',
		success : function(data) {
			//var json = JSON.parse(data);
			resultHandler(data);
		},
		error : function(data){
			faultHander(data);
		}
	});
}
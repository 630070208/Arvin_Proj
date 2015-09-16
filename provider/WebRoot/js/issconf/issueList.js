/**
 * 编辑彩期
 * @param rowId 编辑对象ID
 */
function editRecord(rowId) {
	var id = $("#row_id_" + rowId).val();
	var issueCode = $("#row_issueCode_" + rowId).val();
	var prizeResult = $("#row_prizeResult_" + rowId).val();
	var startTime = $("#row_startTime_" + rowId).val();
	var stopTime = $("#row_stopTime_" + rowId).val();
	var state = $("#row_state_" + rowId).val();
	var opTime = $("#row_opTime_" + rowId).val();
	$("#id").val(id);
	$("#issueCode").val(issueCode);
	$("#prizeResult").val(prizeResult);
	$("#startTime").val(startTime);
	$("#stopTime").val(stopTime);
	$("#editState").val(state);
	$("#opTime").val(opTime);
}
/**
 * 新增彩期
 */
function createNew() {
	$("#id").val("");
	$("#issueCode").val("");
	$("#prizeResult").val("");
	$("#startTime").val("");
	$("#stopTime").val("");
	$("#state").val("");
	$("#opTime").val("");
}

function kaiJiang(issId){
	var gameType=$("#gameType").val();
	ajaxRequest("/system/issue/openprize?issueCode="+issId+"&type="+gameType,null,"get",onKaiJiangResult);
}
function onKaiJiangResult(data){
	if(data.code==1){
		alert(data.message);
		window.location.reload();
	}else{
		alert(data.message);
	}
}

function submitEdit(gameType){
	var data = $("#add_issue").serialize();
	ajaxRequest("/system/issue/update?type="+gameType+"",data,"post",submitEditResult);
}
function submitEditResult(data){
	alert(data.msg);
	if(data.msg==="操作成功"){
		window.location.href=data.url;
	}
}
function delItem(id){
	if(confirm("您确认删除吗")){
	   ajaxRequest("/system/issue/del",{"id":id},"post",delResult);
    }
}
function delResult(data){
	alert(data.msg);
	if(data.msg ==="操作成功" ){
		window.location.reload();
	}
}

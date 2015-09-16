/**
 * 编辑彩期
 * @param rowId 编辑对象ID
 */
function editRecord(rowId) {
	var id = $("#row_id_" + rowId).val();
	var name = $("#row_name_" + rowId).val();
	var money = $("#row_money_" + rowId).val();
	var type = $("#row_type_" + rowId).val();
	
	var startTime = $("#row_startTime_" + rowId).val();
	var stopTime = $("#row_stopTime_" + rowId).val();
	var isEnabled = $("#row_isEnabled_" + rowId).val();
	var opTime = $("#row_opTime_" + rowId).val();
	$("#id").val(id);
	$("#name").val(name);
	$("#money").val(money);
	$("#type").val(type);
	$("#startTime").val(startTime);
	$("#stopTime").val(stopTime);
	$("#isEnabled").val(isEnabled);
	$("#opTime").val(opTime);
}
/**
 * 新增彩期
 */
function createNew() {
	$("#id").val("");
	$("#name").val("");
	$("#money").val("");
	$("#type").val("");
	$("#startTime").val("");
	$("#stopTime").val("");
	$("#isEnabled").val("");
	$("#opTime").val("");
}

function kaiJiang(issId){
	var gameType=$("#gameType").val();
	ajaxRequest("openprize?id="+issId+"&type="+gameType,null,"get",onKaiJiangResult);
}
function onKaiJiangResult(data){
	if(data.code==1){
		window.location.reload();
	}
}

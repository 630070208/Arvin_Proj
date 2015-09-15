/**
 * ajax请求路径
 */

var　ajaxUrl = "http://localhost:8080";

/**
 * ajax������ݵ������� post ��ʽ����
 * @param url �����ַ
 * @param data ��ݶ��� JSON
 * @param reqType ����ʽ GET | POST
 * @param resultHandler ����ɹ�ִ�еķ���
 * @param faultHander ����ʧ��ִ�еķ���
 * 
 * �÷�������Ajax����ʹ�ø÷���Ҫ����jQuery��
 */
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

/**
 * 
 * @param url ����·��
 * @param formId ���ύ�?��id
 * @param reqType �������� GET | POST
 * @param resultHandler ����ɹ��ص�����
 * @param faultHander ����ʧ�ܻص�����
 * 
 * �÷�������from�?��Ajax�ύ��ʹ�ø÷���Ҫ����jQuery��
 */
function ajaxFormSubmit(url,formId, reqType, resultHandler, faultHander){
	if (typeof(faultHander) == 'undefined') {
		faultHander = function(data) {
			alert("error");
		};
	}
	$.ajax({
		url : url,
		data : $('#'+formId).serialize(),//formid
        type : reqType,
        cache : false,
        async : false,
        success : function(data) {
        	//var str = JSON.stringify(data);
        	var json = JSON.parse(data);
        	resultHandler(json);
        },
        error : function(data) {
        	var json = JSON.parse(data);
        	faultHander(json);
        }
    });
}
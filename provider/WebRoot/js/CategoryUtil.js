function getSubCategory(topCategoryId){
	var url="/category/jsonList?parentCategoryId="+topCategoryId;
	$.ajax({
		url : url,
		type : "get",
		dataType: "json",
		contentType : "application/json;charset=utf-8",
		async : false,
		cache : false,
		success : function(result) {
			if (result == "") {
				return;
			}
			var categoryList=result.list;
			var htmlStr='<div id="cat_'+catRowIndex+'" class="input-group" style="padding-top: 5px;">';
			htmlStr=htmlStr+'<select id="otherCatId" name="otherCatId"';
			htmlStr=htmlStr+'class="form-control parsley-validated" data-required="true">';
			for(var i=0;i<categoryList.length;i++){
				htmlStr=htmlStr+'<option value="'+categoryList[i].categoryId+'">'+categoryList[i].categoryName+'</option>';
			}
			htmlStr=htmlStr+'</select> <span class="input-group-btn">';
			htmlStr=htmlStr+'<button title="删除此行扩展分类" class="btn btn-success" onclick="removeCatRowBtnClickHandler(\'cat_'+catRowIndex+'\')" type="button" name="addCatRowBtn" id="addCatRowBtn">';
			htmlStr=htmlStr+'<i class="fa fa-times"></i>';
			htmlStr=htmlStr+'</button> </span>';
			htmlStr=htmlStr+'</div>';
			$("#catDiv").append(htmlStr);
			catRowIndex=catRowIndex+1;
		}
	});
}
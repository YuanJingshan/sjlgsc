//JavaScript Document
/*************************************************************************
 * 文件名：courier.js
 * 功能：快递员
 * 作者：袁景山
 * 时间：2016-05-06
 *************************************************************************/

//加载页面
$(function() { 
	// 附上模版数据
	$("#tmplete-n").setTemplateElement("tmplete-m");
	// 分页
	setParam(10,"manage/bill/count","manage/bill/pageList","pageSize=10&pageNum=");
	getPageCount();
	getPageAndDisplay();
	
	// 刷新
	$("#refresh").click(function() {
		tableRefresh();
	});

	// 删除
	$("#delete").click(function() {
		batchDelete();
	});	
	
	// 全选
	$(".checkAll").click(function() {	
		var checkFlag = $(".checkAll").attr("checked");
		if (checkFlag == "checked") {
			selectAll();
		} else if (checkFlag == undefined){
			cacalSelAll();
		}
	});
});

/**
 * 批量删除
 */
function batchDelete() {
	if (getSelectId().idStr == '') {
		$(".errormsg").children("span").text("请选择要删除的对象！");
	} else {
		processAndReturnCode('manage/bill/batchDelete', "idStr=" + getSelectId().idStr);
	}
}

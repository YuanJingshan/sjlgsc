//JavaScript Document
/*************************************************************************
 * 文件名：user-list.js
 * 功能：用户列表显示、操作
 * 作者：袁景山
 * 时间：2014-05-06
 *************************************************************************/

//加载页面
$(function() { 
	// 附上模版数据
	$("#tmplete-n").setTemplateElement("tmplete-m");
	// 分页
	setParam(10,"manage/user/getCount.action","manage/user/pageList.action","pageSize=10&pageNum=");
	getPageCount();
	getPageAndDisplay();
	
	// 刷新
	$("#refresh").click(function() {
		tableRefresh();
	});

	// 删除
	$("#delete").click(function() {
		deleteUser();
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
 * 删除会员
 */
function batchDelete() {
	if (getSelectId().idStr == '') {
		alert("请选择要删除的对象！");
	} else {
		processAndReturnCode('manage/user/batchDelete', "idStr=" + getSelectId().idStr);
	}
}
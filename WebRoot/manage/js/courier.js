//JavaScript Document
/*************************************************************************
 * 文件名：courier.js
 * 功能：快递员
 * 作者：袁景山
 * 时间：2016-05-06
 *************************************************************************/

/**
 * 批量删除
 */
function batchDelete() {
	if (getSelectId().idStr == '') {
		alert("请选择要删除的对象！");
	} else {
		processAndReturnCode('manage/courier/batchDelete', "idStr=" + getSelectId().idStr);
	}
}

/**
 * 批量审核
 */
function batchCheck() {
	if (getSelectId().idStr == '') {
		alert("请选择要审核的对象！");
	} else {
		processAndReturnCode('manage/courier/batchCheck', "idStr=" + getSelectId().idStr);
	}
}

/**
 * 批量废弃
 */
function batchCancel() {
	if (getSelectId().idStr == '') {
		alert("请选择要废弃的对象！");
	} else {
		processAndReturnCode('manage/courier/batchCancel', "idStr=" + getSelectId().idStr);
	}
}

/**
 * 删除会员
 * @return
 */
function cancelCourier() {
	if (getSelectId().idStr == '') {
		alert("请选择要删除的会员！");
	} else {
		batchAndReturnCode(getSelectId().idStr);
	}
}

//加载页面
$(function() { 
	// 附上模版数据
	$("#tmplete-n").setTemplateElement("tmplete-m");
	// 分页
	setParam(10,"manage/courier/getCount","manage/courier/pageList","pageSize=10&pageNum=");
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
	
	// 审核
	$("#check").click(function() {
		batchCheck();
	})
	
	// 废弃
	$("#cancel").click(function() {
		batchCancel();
	})
	
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
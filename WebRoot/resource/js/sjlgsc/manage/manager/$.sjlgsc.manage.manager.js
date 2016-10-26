//JavaScript Document

/**
 * 删除管理员
 * @param id
 * @returns
 */
var deleteById = function(id, obj) {
	debugger;
	$target = $(obj);
	$target.smoothConfirm("确定要删除选择的记录？", {
		okVal : "删除",
		ok : function() {
			$.ajax({
				type: "post", 
				url: "manage/manager/delete?id=" + id,
				success: function(data){
					if (data.responseCode == '1') {
						toastr.success("删除成功！");
						tableRefresh();
					} else {
						toastr.error(data.responseMsg);
					}
				}
			});
		},
		cancel : function() {
			return false;
		}
	});
}

/**
 * 删除会员
 * @return
 */
function batchDelete() {
	debugger;
	var ids = getSelectId().array;
	if (ids.length > 0) {
		$.ajax({
			type: "post",
			url: "manage/manager/deletebatch",
			dataType: "json",
			data: JSON.stringify(ids),
			success: function(data){
				if (data.responseCode == '1') {
					toastr.success("删除成功！");
					tableRefresh();
				} else {
					toastr.error(data.responseMsg);
				}
			}
		});
	} else {
		alert("请选择要删除的对象！");
	}
}

var pwdReset = function(id, obj) {
	$target = $(obj);
	$target.smoothConfirm("确定要重置密码？", {
		okVal : "确认",
		ok : function() {
			$.ajax({
				type: "post", 
				url: "manage/manager/pwdreset?id=" + id,
				success: function(data){
					if (data.responseCode == '1') {
						toastr.success("重置密码成功！"); //warning\info\clear
						tableRefresh();
					} else {
						toastr.error(data.responseMsg);
					}
				}
			});
		},
		cancel : function() {
			return false;
		}
	});
}

//加载页面
$(function() { 
	// 附上模版数据
	$("#tmplete-n").setTemplateElement("tmplete-m");
	// 分页
	setParam(10, "manage/manager/count", "manage/manager/queryBypaging");
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




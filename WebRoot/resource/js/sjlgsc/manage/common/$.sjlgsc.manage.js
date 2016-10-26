// JavaScript Document
/*
 * 文件名：bpage.js
 * 功能：后台js
 * 作者：袁景山
 * 时间：2014-08-13
 */

/******************************后台账户begin********************************/
/**
 * 后台账户登录
 * @return
 */
function login() {
	$("#login-form").submit();
}
/******************************后台账户begin********************************/

/******************************会员信息begin********************************/
/**
 * 描述：根据条件查询
 */
function queryUserDiscountCardByCondition() {
	var condition = $("#query-condition").val();
	if ( condition == 0) {
		alert("请选择查询条件！");
	} else {
		if ($("#query-nei").val() == "null") {
			condition = "condition=" + condition + " is null";
		} else {
			condition = "condition=" + condition + " like 'mhcx" + $("#query-nei").val() + "mhcx'"; 
		}
		displayListDate("userAction_getUserDiscountCardCountByCondition.action", "userAction_gePagetUserDiscountCardDataByCondition.action", "userAction_deleteUserDiscountCard.action",condition, condition);
	}
}

/**
 * 分页显示列表数据
 * @return
 */
function displayListDate(countFun, dataFun, delFun, pSendCondition, pCountCondition) {
	// 查询分页显示
	pn =1;
	setParam(10, countFun, dataFun, delFun, pSendCondition + "&pageSize=10&pageNum=", pCountCondition);
	getPageCount();
	displayPage1();
}
/******************************会员信息end**********************************/

/******************************快递服务begin********************************/
/**
 * 描述：合作伙伴信息校验
 * @return
 */
function partnerVerify() {
	if ($("#name").val() == "" || $("#name").val().length > 21) {
		alert("公司名称不正确！");
		return 0;
	}
	if (!httpUrl.test($("#url").val())) {
		alert("公司连接地址不正确！");
		return 0;
	}
	return 1;
}

/**
 * 描述：添加合作伙伴
 * @return
 */
function addPartner(){
	if (infromVerify() == 1) {
		commonOper("partner-form", "expressAction_addPartner.action?picture=" + $("#picture").attr("src"), 1, "/sudi/bpage/page/express/partner-list.jsp?menuId=menu3");
	}
}

/**
 * 描述：修改合作伙伴
 * @return
 */
function modifyPartner(){
	if (infromVerify() == 1) {
		commonOper("partner-form", "expressAction_modifyPartner.action?picture=" + $("#picture").attr("src"), 2, "/sudi/bpage/page/express/partner-list.jsp?menuId=menu3");
	}
}
/******************************快递服务end**********************************/

/******************************通知消息begin********************************/
/**
 * 通知消息校验
 */
function infromVerify() {
	if ($("#content").val() == "" || $("#content").val().length > 51) {
		alert("消息内容不正确！");
		return 0;
	}
	return 1;
}
/**
 * 添加通知消息
 */
function addInfrom() {
	if (infromVerify() == 1) {
		commonOper("infrom-form", "infromAction_addInfrom.action", 1, "/sudi/bpage/page/other/infrom-list.jsp");
	}
}

/**
 * 修改通知消息
 */
function modifyInfrom() {
	if (infromVerify() == 1) {
		commonOper("infrom-form", "infromAction_modifyInfrom.action", 2, "/sudi/bpage/page/other/infrom-list.jsp");
	}
}
/******************************通知消息end**********************************/

/******************************通知消息begin********************************/
/**
 * 通知消息校验
 */
function infromVerify() {
	if (!httpUrl.test($("#url").val())) {
		alert("广告地址输入不正确！");
		return 0;
	}
	return 1;
}

/**
 * 添加通知消息
 */
function addAdvertise() {
	if (infromVerify() == 1) {
		commonOper("advertise-form", "advertiseAction_add.action?picture=" + $("#picture").attr("src"), 1, "/sudi/bpage/page/other/advertise-list.jsp");
	}
}

/**
 * 修改通知消息
 */
function modifyAdvertise() {
	if (infromVerify() == 1) {
		commonOper("advertise-form", "companyAction_modify.action?picture=" + $("#picture").attr("src"), 2, "/sudi/bpage/page/other/advertise-list.jsp");
	}
}
/******************************通知消息end**********************************/

/******************************公司信息begin********************************/
/**
 * 公司信息校验
 */
function companyVerify() {
	if ($("#name").val() == "" || $("#name").val().length > 101) {
		alert("公司名称输入不正确！");
		return 0;
	}
	if (!mobile.test($("#tel").val())) {
		if (!gntel.test($("#tel").val())) {
			alert("联系电话输入不正确！");
			return 0;
		}
	}
	if (!gntel.test($("#fax").val())) {
		alert("传真输入不正确！");
		return 0;
	}
	if (!email.test($("#mail").val())) {
		alert("邮箱地址输入不正确！");
		return 0;
	}
	if ($("#address").val() == "" || $("#address").val().length > 201) {
		alert("公司地址输入不正确！");
		return 0;
	}
	return 1;
}

/**
 * 描述：公司信息管理
 * @return
 */
function companyManage() {
	if (companyVerify() == 1) {
		commonOper("company-form", "companyAction_addOrModifyCompany.action?picture=" + $("#picture").attr("src"), 2, "/sudi/companyAction_displayCompany.action?menuId=menu6");
	}
}
/******************************公司信息end**********************************/

/******************************系统回复留言begin**********************************/
/**
 * 描述：系统回复
 */
function systemReply() {
	if ($("#content").val() == "") {
		alert("回复内容不能为空！");
		return;
	} else if ($("#content").val().length > 501) {
		alert("回复内容太长！");
		return;
	}
	
	$.ajax({
		type: "post",
		dataType: "json",
		url: "leaveAction_systemReply.action",
		data: $("#reply-form").serialize(),
		error: function(XMLHttpRequest, textStatus, errorThrown) {
			ajaxErrorMsg("systemReply", XMLHttpRequest, textStatus, errorThrown);
		},
		success: function(data){
           	if (data.reCode > 0) {
           		alert("回复成功！");
        	} else {
        		alert("回复失败！");
        	}
		}
	});
}

/******************************系统回复留言end************************************/


/**
 * 描述：打开分配取货商店以及状态改变弹出框
 */
function popDistributeFrame(billId) {
	$("#light").attr("style", "display:block");
	$("#billId").val(billId);
	// 设置所有商店信息
	setTempleteData('tmplete-shop', 'sel_shop', "shopAction_getAllShop.action");
}

/**
 * 描述：分配取货商店及改变订单状态
 */
function changBillStatus() {
	$("#light").attr("style", "display:none");
	
	if ($("#billId").val() == "" || $("#billId").val() == "undefined") {
		alert("失败！");
		return;
	} else {
		var sendData = "billId=" + $("#billId").val() + "&shopId=" + $("#sel_shop").val() + "&status=" + $("#status").val();
		
		$.ajax({
			type: "post",
			dataType: "json",
			url: "billAction_updateBillStatus.action",
			data: sendData,
			error: function(XMLHttpRequest, textStatus, errorThrown) {
				ajaxErrorMsg("changBillStatus", XMLHttpRequest, textStatus, errorThrown);
			},
			success: function(data){
	           	if (data.reCode > 0) {
	           		refresh();
	        	} else {
	        		alert("失败！");
	        	}
			}
		});
	}
	
}
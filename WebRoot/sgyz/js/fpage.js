// JavaScript Document
/*
 * 文件名：bpage.js
 * 功能：前端js
 * 作者：袁景山
 * 时间：2014-08-21
 */

/**
 * 用户信息校验
 */
function userInfoVerify() {
	if ($("#name").val() == "" || $("#name").val().length > 21) {
		alert("姓名不正确！");
		return 0;
	}
	if (!date.test($("#birthday").val())) {
		alert("生日输入不正确！");
		return 0;
	}
	if ($("#address").val() == "" || $("#address").val().length > 201) {
		alert('地址输入不正确！');
		return 0;
	}
	if (!mobile.test($("#tel").val())) {
		alert("联系号码输入不正确！");
		return 0;
	}
	return 1;
}

/**
 * 领取会员卡
 */
function getUserCard() {
	if (userInfoVerify() == 1) {
		$.ajax({
			type: "post",
			dataType: "json",
			url: "userAction_getUserCard.action",
			data: $("#user-form").serialize(),
			error: function(XMLHttpRequest, textStatus, errorThrown) {
				ajaxErrorMsg("commonOper", XMLHttpRequest, textStatus, errorThrown);
			},
			success: function(data){
	           	if (data.reCode > 0) {
	           		openPage("/yuanchao/fpage/index.jsp","_self");
	        	} else {
	        		alert("领取失败，稍后再试！");
	        	}
			}
		});
	}
}

/**
 * 获取所有商品信息
 * @param url
 */
function getAllGoods(url) {
	$.ajax({
		type: "post",
		dataType: "json",
        url: url,
        error: function(XMLHttpRequest, textStatus, errorThrown) {
        	ajaxErrorMsg("getAllGoods", XMLHttpRequest, textStatus, errorThrown);
        },
        success: function(data) {
        	$("#tmplete-n").processTemplate(data);
        }
    });
}


/**
 * 描述：根据商品id获取商品详细
 * @param goodsId
 */
function getGoodsDetail(goodsId) {
	openPage("goodsAction_getSaleGoosDetail.action?goodsId=" + goodsId,"_self");
}


/**
 * 获取所有的店铺信息
 */
function getAllShop() {
	$.ajax({
		type: "post",
		dataType: "json",
        url: "shopAction_getAllShop.action",
        error: function(XMLHttpRequest, textStatus, errorThrown) {
        	ajaxErrorMsg("getAllShop", XMLHttpRequest, textStatus, errorThrown);
        },
        success: function(data) {
        	$("#tmplete-n").processTemplate(data);
        }
    });
}

/**
 * 描述：首页搜索
 */
function firstPageSearchShop() {
	var shopNameStr = $("#condition").val();
	if (shopNameStr == "") {
		alert("请输入查询内容！");
		return;
	} else {
		openPage("/yuanchao/fpage/first_souso.jsp?condition="+shopNameStr,"_self");
	}
}

/**
 * 描述：搜索查询的店铺
 */
function searchShop() {
	var shopNameStr = $("#condition").val();
	$.ajax({
		type: "post",
		dataType: "json",
        url: "shopAction_getShopByCondition.action",
        data: "shopName=" + shopNameStr,
        error: function(XMLHttpRequest, textStatus, errorThrown) {
        	ajaxErrorMsg("searchShop", XMLHttpRequest, textStatus, errorThrown);
        },
        success: function(data) {
        	$("#tmplete-n").processTemplate(data);
        }
    });
}
 
/**
 * 描述：改变选择数量，如果传入的type=1表示增加数量，type=2表示减少数量
 * @param type
 */
function changNum(node,type) {
	var numNode = null;
	if (type == 1) {
		numNode = $(node).parent().next("td").children("#num");
		numNode.text(parseInt(numNode.text()) + 1);
		// $("#num").text(parseInt($("#num").text()) + 1);
	} else if (type == 2) {
		numNode = $(node).parent().prev("td").children("#num");
		if (numNode.text() != '0') {
			numNode.text(parseInt(numNode.text()) - 1);
		}
	}
}

/**
 * 描述：根据传入的商品id、商品数量，将商品加入购物。
 * @param node
 * @param goodsId
 */
function joinBill(node,goodsId,price) {
	// test code 
	// console.log($(node).parent().prev("table").find("#num").text());
	var numNode = $(node).parent().prev("table").find("#num");
	if (parseInt(numNode.text()) == 0) {
		alert("请选择数量！");
		return;
	}
	
	if (goodsId != "" && goodsId != null && goodsId != undefined && price != "" && price != null && price != undefined) {
		// 发送数据
		var data = "goodsId=" + goodsId + "&num=" + numNode.text() + "&price=" + price;
		// 添加成功跳转到购物车页面
		$.ajax({
			type: "post",
			dataType: "json",
	        url: "billAction_generateBill.action",
	        data: data,
	        error: function(XMLHttpRequest, textStatus, errorThrown) {
	        	ajaxErrorMsg("joinBill", XMLHttpRequest, textStatus, errorThrown);
	        },
	        success: function(data) {
	        	if (data.reCode > 0) {
	        		openPage('/yuanchao/fpage/page/dingdan.jsp','_self');
	        	} else {
	        		alert("预约失败！");
	        	}
	        }
	    });
	} else {
		alert("请选择你心仪的商品！");
		return;
	}
}


/**
 * 描述：获取会员所有的订单
 */
function getAllBills() {
	$.ajax({
		type: "post",
		dataType: "json",
        url: "billAction_getBillByUserId.action",
        error: function(XMLHttpRequest, textStatus, errorThrown) {
        	ajaxErrorMsg("getAllBills", XMLHttpRequest, textStatus, errorThrown);
        },
        success: function(data) {
        	$("#tmplete-n").processTemplate(data);
        }
    });
}

/**
 * 描述：根据订单号取消订单
 * @param billId
 */
function cancelBills(billId) {
	if (billId != "" && billId != null && billId != undefined) {
		$.ajax({
			type: "post",
			dataType: "json",
	        url: "billAction_cancelBill.action",
	        data: "billId=" + billId,
	        error: function(XMLHttpRequest, textStatus, errorThrown) {
	        	ajaxErrorMsg("cancelBills", XMLHttpRequest, textStatus, errorThrown);
	        },
	        success: function(data) {
	        	if (data.reCode > 0) {
	        		refresh();
	        	} else {
	        		alert("取消失败！");
	        	} 
	        }
	    });
	} else {
		alert("请选择订单！");
		return;
	}
}

/**
 * 描述：根据订单号删除订单
 * @param billId
 */
function deleteBills(billId) {
	if (billId != "" && billId != null && billId != undefined) {
		$.ajax({
			type: "post",
			dataType: "json",
	        url: "billAction_deleteBill.action",
	        data: "billId=" + billId,
	        error: function(XMLHttpRequest, textStatus, errorThrown) {
	        	ajaxErrorMsg("deleteBills", XMLHttpRequest, textStatus, errorThrown);
	        },
	        success: function(data) {
	        	if (data.reCode > 0) {
	        		refresh();
	        	} else {
	        		alert("删除失败！");
	        	} 
	        }
	    });
	} else {
		alert("请选择订单！");
		return;
	}
}


/**
 * 描述：用户留言
 */
function userLeave() {
	if ($("#content").val() == "") {
		alert("留言内容不能为空！");
		return;
	}
	$.ajax({
		type: "post",
		dataType: "json",
        url: "leaveAction_userLeave.action",
        data: "content=" + $("#content").val(),
        error: function(XMLHttpRequest, textStatus, errorThrown) {
        	ajaxErrorMsg("userLeave", XMLHttpRequest, textStatus, errorThrown);
        },
        success: function(data) {
        	if (data.reCode > 0) {
        		refresh();
        	} else {
        		alert("留言失败！");
        	} 
        }
    });
}

/**
 * 描述：获取用户的所有留言以及系统回复
 */
function getAllLeaveAndReply() {
	$.ajax({
		type: "post",
		dataType: "json",
        url: "leaveAction_getLeaveByUser.action",
        error: function(XMLHttpRequest, textStatus, errorThrown) {
        	ajaxErrorMsg("getAllLeaveAndReply", XMLHttpRequest, textStatus, errorThrown);
        },
        success: function(data) {
        	$("#tmplete-n").processTemplate(data);
        }
    });
}

/**
 * 描述：删除留言以及相关的系统回复
 */
function deleteLeave(leaveId) {
	if (leaveId != null && leaveId != "" && leaveId != "undefined") {
		$.ajax({
			type: "post",
			dataType: "json",
	        url: "leaveAction_delete.action",
	        data: "idStr=" + leaveId,
	        error: function(XMLHttpRequest, textStatus, errorThrown) {
	        	ajaxErrorMsg("deleteLeave", XMLHttpRequest, textStatus, errorThrown);
	        },
	        success: function(data) {
	        	if (data.reCode > 0) {
	        		refresh();
	        	} else {
	        		alert("删除失败");
	        	}
	        }
	    });
	}
}

/**
 * 描述：获取用户的所有打折卡
 */
function getUserAllDiscount() {
	$.ajax({
		type: "post",
		dataType: "json",
        url: "userAction_diplayUserDiscountCard.action",
        error: function(XMLHttpRequest, textStatus, errorThrown) {
        	ajaxErrorMsg("getUserAllDiscount", XMLHttpRequest, textStatus, errorThrown);
        },
        success: function(data) {
        	$("#tmplete-n").processTemplate(data);
        }
    });
}
// JavaScript Document
/*
 * 文件名：paging.js
 * 功能：jqery实现分页及页面操作，按页码来查选操作
 * 作者：YuanJingshan
 * 时间：2014-04-15
 */

/*******************jquery前端分页-begin**************************/	
var totalCount = 0; // 总记录数  
var pageTotal = 0; // 总页数 
var pn = 1; // 页码

/******************每次使用需要根据具体情况修改-begin********************/
var pageSize = 10; // 每页显示几条记录  
var countUrl; // 获取总数地址
var pageUrl; // 获取指定页面数据地址
var sendParam; // 获取指定页面数据参数
var countParam; // 获取总数参数
/******************每次使用需要根据具体情况修改-end**********************/

/**
 * 设置参数
 * @param pSize
 * @param pCountUrl
 * @param pDataUrl
 * @param pSendParam
 */
function setParam(pSize, pCountUrl, pDataUrl, pSendParam, pCountParam) {
	pageSize = pSize;
	countUrl = pCountUrl;
	pageUrl = pDataUrl;
	sendParam = pSendParam != undefined ? pSendParam : "";
	countParam = pCountParam != undefined ? pCountParam : "";
}
 
/**
 * 获取页面显示，控制跳转
 */
function getPageAndDisplay() {
	// 下一页
	$("#next").click(function() {  
		if (pn == pageTotal) {  
			alert("当前已是最后一页！");  
			pn = pageTotal;  
		} else {  
			pn = pn + 1;  
			gotoPageByNum(pn);  
		}  
	});  
	// 上一页
	$("#prev").click(function() {  
		if (pn == 1) {  
			alert("当前已是第一页！");  
			pn = 1;  
		} else {  
			pn = pn -1;  
			gotoPageByNum(pn);  
		}  
	});  
	// 首页
	$("#firstPage").click(function() {  
		pn = 1;  
		gotoPageByNum(pn);  
	});  
	// 尾页
	$("#lastPage").click(function() {  
		pn = pageTotal;  
		gotoPageByNum(pn);  
	});
	// 页面跳转
	$("#page-jump").click(function(){  
		if($(".page-num").val()  <= pageTotal && $(".page-num").val() != '') {
			pn = $(".page-num").val();  
			gotoPageByNum(pn);  
		}else{  
			alert("您输入的页码有误！");  
			$(".page-num").val('').focus();  
		}  
	}); 
	
	$("#firstPage").trigger("click");
};  

/**
 * 获取总页数、总记录数，设置相关值
 * @param url
 */
function getPageCount() {
	$.ajax({
		type: "post", 
		dataType: "json", 
		url: countUrl,
		data: countParam,
		complete: function (XMLHttpRequest, textStatus) {
			 var sessionstatus=XMLHttpRequest.getResponseHeader("sessionstatus"); 
	         if(sessionstatus == "timeout" || sessionstatus == "non"){ 
	        	 window.open("/sgyz/manage/login.jsp","_self");
	         }  
		},
		error: function(XMLHttpRequest, textStatus, errorThrown) { 
			pagingError('gotoPageByNum('+pn+')', XMLHttpRequest, textStatus, errorThrown);
		},
		success: function(data){
			totalCount = data.total;
			pageTotal = Math.ceil(totalCount / pageSize) == 0 ? 1:Math.ceil(totalCount / pageSize);  
			$(".page-count").text(pageTotal);  
			$(".others-record").text(data.othersRcord);
			$(".count-record").text(totalCount);
		}
	});
}

/**
 * 根据页号跳转到显示 pn：页号 url：地址
 * @param pn
 * @param url
 */
function gotoPageByNum(pn) {
	//计算start
	var start = (pn - 1) * pageSize;
	var postData = {};
	postData.page=pn;
	postData.start=(pn - 1) * pageSize;
	postData.length=pageSize;
	
	$.ajax({
		type: "post", 
		dataType: "json", 
		url: pageUrl,
		data: postData,
		complete: function (XMLHttpRequest, textStatus) {
			//通过XMLHttpRequest取得响应头，sessionstatus
			 var sessionstatus=XMLHttpRequest.getResponseHeader("sessionstatus"); 
	         if(sessionstatus == "timeout" || sessionstatus == "non"){ 
	        	 window.open("/sgyz/manage/login.jsp","_self");
	         }  
		},
		error: function(XMLHttpRequest, textStatus, errorThrown) { 
			pagingError('gotoPageByNum('+pn+')', XMLHttpRequest, textStatus, errorThrown);
		},
		success: function(data){
			$("#tmplete-n").processTemplate(data);
		}
	});
	
    $(".current-page").text(pn);  
}; 

/**
 * 显示第一页数据
 */
function displayPage1() {
	var postData = {};
	postData.page=1;
	postData.length=pageSize;
	postData.start=0;
	
	$.ajax({
		type: "post", 
		dataType: "json", 
		url: pageUrl,
		data: postData,
		complete: function (XMLHttpRequest, textStatus) {
			//通过XMLHttpRequest取得响应头，sessionstatus
			 var sessionstatus=XMLHttpRequest.getResponseHeader("sessionstatus"); 
	         if(sessionstatus == "timeout" || sessionstatus == "non"){ 
	        	 window.open("/sgyz/manage/login.jsp","_self");
	         }  
		},
		error: function(XMLHttpRequest, textStatus, errorThrown) { 
			pagingError('displayPage1()', XMLHttpRequest, textStatus, errorThrown);
		},
		success: function(data){
			$("#tmplete-n").processTemplate(data);
		}
	});
	
    $(".current-page").text(pn);  
}

/**
 * 分页提交出错提示
 * @param funcname
 * @param XMLHttpRequest
 * @param textStatus
 * @param errorThrown
 */
function pagingError(funcname, XMLHttpRequest, textStatus, errorThrown) {
	if (console) {
		console.log(funcname + "-error, " + XMLHttpRequest.readyState + " " + textStatus + " " + errorThrown);
	} else {
		alert(funcname + "-error, " + XMLHttpRequest.readyState + " " + textStatus + " " + errorThrown);
	}
}

/**
 * 全选
 */
function selectAll() {
	$(".checkAll").attr("checked", true);
	$(".checkItem").each(function() {
		$(this).attr("checked", true);
	});
}

/**
 * 取消全选
 */
function cacalSelAll() {
	$(".checkAll").attr("checked", false);
	$(".checkItem").each(function() {
		$(this).attr("checked", false);
	});
}

/**
 * 获取选择行的ID，ID：int型
 */
function getSelectId() {
//	var str = '';
//	var num = 0;
//	$(".checkItem").each(function() {
//		if ($(this).attr("checked") == "checked") {	
//			str = str + $(this).val() + ',';
//			num = num + 1;
//		}
//	});
//	str = str.substring(0, str.length-1);
//	return {
//		idStr:str,
//		number:num
//	};
	
	var idArray = new Array();
	var num = 0;
	$(".checkItem").each(function() {
		if ($(this).attr("checked") == "checked") {	
			idArray.push($(this).val());
			num = num + 1;
		}
	});
	return {
		array:idArray,
		number:num
	};
}

/**
 * 描述：获取选择行的ID，ID：string型
 */
function getSelectIdStr() {
	var str = "";
	var num = 0;
	$(".checkItem").each(function() {
		if ($(this).attr("checked") == "checked") {	
			if (num == 0) {
				str = "'" + $(this).val() + "','";
			} else {
				str = str + $(this).val() + "','";
			}
			num = num + 1;
		}
	});
	str = str.substring(0, str.length-2);
	return {
		idStr:str,
		number:num
	};
}

/**
 * table 刷新
 */
function tableRefresh() {
	$(".checkAll").attr("checked", false);
	getPageCount();
	getPageAndDisplay();
}
/*******************jquery前端分页-end****************************/
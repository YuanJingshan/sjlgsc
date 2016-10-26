// JavaScript Document
/*
 * 文件名：common.js
 * 功能：定义通用函数
 * 作者：袁景山
 * 时间：2014-05-06
 */

/**
 * 根据条件跳转到指定页面
 * @param url
 * @param param
 */
function openPage(url,param) {
	window.open(url,param);
}

/**
 * 刷新当前页面
 */
function refresh(){
	location.reload();
}

/**
 * 表单重置
 * @param formId
 */
function resetForm(formId) {
	$('#' + formId)[0].reset();
}

/**
 * 表单提交
 * @param fromId
 * @param url
 */
function submitForm(formId, url) {
	$("#" + formId).attr("action", url);
	$("#" + formId).submit();
}

/**
 * ajax异步上传文件
 * @return
 */
function ajaxFileUpload(url) {
    $.ajaxFileUpload ({
        url: url,
        secureuri: false,
        fileElementId: 'file',
        dataType: 'json',
        success: function (data, status) { //从服务器返回的json中取出message中的数据,其中message为在struts2中定义的成员变量
    		$("#picfile").text(data.file);
    		if (data.file.length > 0) {
    			alert("上传成功！");
    		} else {
    			alert("请选择上传文件！");
    		}
        },
        error: function (data, status, e) { //服务器响应失败处理函数
            alert("上传失败！");
        }
    });
}

/**
 * ajax异步图片文件
 * @return
 */
function ajaxPictureUpload(url, picId, picPath) {
    $.ajaxFileUpload ({
        url: url,
        secureuri: false,
        fileElementId: 'picture-file',
        dataType: 'json',
        success: function (data, status) {
    		$("#" + picId).attr("src", picPath + data.picture);
    		if (data.picture.length > 0) {
    			alert("上传成功！");
    		} else {
    			alert("请选择上传图片！");
    		}
        },
        error: function (data, status, e) {
            alert("上传失败！");
        }
    });
}

/**
 * ajax异步上传音乐文件
 * @return
 */
function ajaxMusicUpload(url, musicId) {
    $.ajaxFileUpload ({
        url: url,
        secureuri: false,
        fileElementId: 'music',
        dataType: 'json',
        success: function (data, status) {
    		$("#" + musicId).val("upload/business/" + data.music);
    		if (data.music.length > 0) {
    			alert("上传成功！");
    		} else {
    			alert("请选择上传背景音乐！");
    		}
        },
        error: function (data, status, e) {
            alert("上传失败！");
        }
    });
}

/**
 * 描述：给模版加载数据
 * @param url
 * @param data
 * @return
 */
function setTempleteData(templeteMode, templete, url, data) {
	data = typeof data == 'undefined' ? '' : data;
	$("#"+templete).setTemplateElement(templeteMode);
	$.ajax({
		type: "post", 
		dataType: "json", 
		url: url,
		data: data,
		error: function(XMLHttpRequest, textStatus, errorThrown) { 
			 console.log(XMLHttpRequest.readyState + " " + textStatus + " " + errorThrown);
		},
		success: function(data){
			$("#"+templete).processTemplate(data);
		}
	});
}

/**
 * 获取微信jsapi许可
 */
function getWxJsApiPermit(url) {
	// 通过后台获取js-api 使用许可
	$.ajax({
		type: "post", 
		dataType: "json", 
		url: "wxAction_getWxJsApi.action",
		data: "url=" + url,
		error: function(XMLHttpRequest, textStatus, errorThrown) {
			 console.log(XMLHttpRequest.readyState + " " + textStatus + "" + errorThrown);
		},
		success: function(data){
			WxConfig(data); 
		}
	});
}

/**
 * ajax提交错误消息函数
 * @param funcname
 * @param XMLHttpRequest
 * @param textStatus
 * @param errorThrown
 * @return
 */
function ajaxErrorMsg(funcname, XMLHttpRequest, textStatus, errorThrown) {
	if (console) {
		console.log(funcname + "-提交出错。 " + XMLHttpRequest.readyState + " " + textStatus + " " + errorThrown);
	} else {
		alert(funcname + "-提交出错。 " + XMLHttpRequest.readyState + " " + textStatus + " " + errorThrown);
	}
}

// added by yjs at 2015-08-19 begin
/**
 * 操作通用函数，用于页面增加、修改
 * @param formId
 * @param url
 * @param type
 * 	1：增加， 2：修改  
 * @param jumpPage
 */
function commonOper(formId, url, type, jumpPage) {
	$.ajax({
		type: "post",
		dataType: "json",
		url: url,
		data: $("#" + formId).serialize(),
		error: function(XMLHttpRequest, textStatus, errorThrown) {
			ajaxErrorMsg("commonOper", XMLHttpRequest, textStatus, errorThrown);
		},
		success: function(data){
           	if (data.reCode > 0) {
           		if (type == 1) {
           			alert("增加成功！");
           		} else {
           			alert("修改成功！");
           		}
           		openPage(jumpPage,"_self");
        	} else {
        		if (type == 1) {
        			alert("增加失败！");
        		} else {
        			alert("修改失败！");
        		}
        	}
		}
	});
}
//added by yjs at 2015-08-19 end

// added by yjs at 2016-05-05 begin
/**
 * 批量处理返回结果代码
 * @param data
 * @return
 */
function processAndReturnCode(url, data) {
	$.ajax({
		type: "post", 
		dataType: "json", 
		url: url,
		data: data, 
		error: function(XMLHttpRequest, textStatus, errorThrown) { 
			ajaxErrorMsg('processAndReturnCode(' + url + ',' + data + ')', XMLHttpRequest, textStatus, errorThrown);
		},
		success: function(data){
			$(".errormsg").children("span").text(data.msg);
			$(".checkAll").attr("checked", false);
			getPageCount();
			getPageAndDisplay();
		}
	});
}
//added by yjs at 2016-05-05 end
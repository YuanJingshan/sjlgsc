// JavaScript Document
/*
 * 文件名：verify.js
 * 功能：正则表达式校验
 * 作者：袁景山
 * 时间：2015-07-14
 */

// 管理员账户名
var manager_password = /^\w{6,20}$/;

/**
 * 管理员：前端校验
 */
function verify_manager() {
	if (!mobile.test($("#tel").val())) {
		$(".errormsg").children("span").text("手机号码：请输入正确格式的手机号码。");
		return false;
	}
	return true;
}

/**
 * 输入密码校验
 */
function verify_secret() {
	if ($("#oldPwd").val() == null || $("#oldPwd").val() == "") {
		$(".errormsg").children("span").text("原始密码：请输入正原始密码。");
		return false;
	}
	return true;
}
	
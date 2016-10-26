//JavaScript Document

//校验
var initModalFormValidate = function() {
	return $('#managerform').validate({
		errorElement : 'span', 
		errorClass : 'has-error',
		onfocusout : function(element) {$(element).valid();},
		rules : {
			name: {required:true},
			password: {required:true},
			role: {required:true},
			realName: {required:true},
			tel: {required:true},
			address: {required:true}
		},
		errorPlacement: function(error, element) {
			element.after(error);
		}
	});
}

var initModalElementDefaultValue = function() {
	$.ajax({
		type: "post", 
		url: "manage/manager/queryManagerById?id=" + id,
		success: function(data){
			if (data.responseCode == '1') {
				$("#name").val(data.datas.name);
				$("#password").val(data.datas.password);
				$("#role").val(data.datas.role);
				$("#realName").val(data.datas.realName);
				$("#tel").val(data.datas.tel);
				$("#address").val(data.datas.address);
				$("#insertDt").val(data.datas.insertDt);
				$("#password").prop("readonly","readonly");
			} else {
				alert(data.responseMsg);
			}
		}
	});
}

var getModelElementValue = function() {
	var postData = {};
	postData.id = id;
	postData.name = $("#name").val();
	postData.password = $("#password").val();
	postData.role = $("#role").val();
	postData.realName = $("#realName").val();
	postData.tel = $("#tel").val();
	postData.address = $("#address").val();
	postData.insertDt = $("#insertDt").val();
	return postData;
}


$(function(){
	//校验初始化
	initModalFormValidate();
	
	var url = location.href;
	var paraString = url.substring(url.indexOf("?")+1,url.length).split("&");      
	var paraObj = {}      
	for (i=0; j=paraString[i]; i++){      
		paraObj[j.substring(0,j.indexOf("=")).toLowerCase()] = j.substring(j.indexOf("=")+1,j.length);      
	}
	id = paraObj.id;
	type = paraObj.type;
	
	if (type == "edit") {//编辑
		$("#operName").html("编辑");
		$("#clear").hide();
		initModalElementDefaultValue();
	} else {
		$("#operName").html("添加");
	}
	
	//保存
	$("#save").click(function() {
		debugger;
		var url = null;
		
		if (type == "new") {
			url = "manage/manager/save"
		} else if (type == "edit") {
			url = "manage/manager/update"
		}
		if (initModalFormValidate().form()) {
			var postData = getModelElementValue();
			$.ajax({
				type: "post", 
				url: url,
				dataType: "json",
				data: postData,
				success: function(data){
					if (data.responseCode == '1') {
						window.open("view/manage/manager/list.jsp?menuId=menu1", "_self");
					} else {
						toastr.error(data.responseMsg);
					}
				}
			});
		}
	});
})
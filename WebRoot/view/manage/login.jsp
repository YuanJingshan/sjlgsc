<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html>
<head>
<base href="<%=basePath%>">

<!-- css+js -->
<jsp:include page="common.jsp"></jsp:include>

</head>

<body>
	<div class="login">
    	<div class="login_logo"><img src="manage/images/logo.png" /></div>
        
        <div class="login_content">
        	<form id="login-form" method="post" action="${pageContext.request.contextPath}/manage/manager/login">
        		<div class="errormsg"><span>${errorMsg}</span></div>
            	<div class="login_content_1">
                	<input id="name" name="name" type="text" value="请输入您的登录名" onfocus="if (value =='请输入您的登录名'){value =''}" onblur="if (value ==''){value='请输入您的登录名'}" />
                </div>
                <div class="login_content_2">
                	<input id="password" name="password" type="password" value="......" onfocus="if (value =='......'){value =''}" onblur="if (value ==''){value='......'}" />
                </div>
                <div class="login_content_3">
                	<a href="javascript:void(0);" onclick="login();">登　　录</a>
                </div>
                <p class="login_content_4">忘记了您的密码？<br /><span>别担心，点击 <a href="tencent://Message/?Uin=2762705263&websiteName=www.lanrentuku.com=&Menu=yes">这里</a> 找回您的密码。</span></p>
            </form>
        </div>
        
        <p class="login_copyright">2016 © 水果驿站. Admin Dashboard. </p>
    </div>	
</body>
</html>

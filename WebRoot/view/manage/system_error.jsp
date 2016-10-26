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
	<!-- top -->
	<jsp:include page="top.jsp"></jsp:include>
	
    <!-- left-menu -->
    <jsp:include page="left.jsp"></jsp:include>
    
    <div class="body_right">
    	<div class="body_right_1">
        	<p class="body_right_top"><a>系统错误</a></p>
            
            <div class="occupying_left"></div>
            
            <div class="occupying_right">
				<div class="errormsg"><span>服务器异常，请稍后再试。</span></div>
            </div>
            <div class="clear"></div>
        </div>
    </div>
    <div class="clear"></div>
</body>
</html>
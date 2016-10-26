<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html>
<head>
<base href="<%=basePath%>">
<jsp:include page="common.jsp"></jsp:include>
</head>

<body>
	<div class="wnav_1">
        <h3>公司介绍</h3>
        <div class="wnav_left"><a href="sgyz/index.jsp"><img src="sgyz/images/back.png" width="100%" /></a></div>
    </div>

	<div class="contactbanner">
    	<img src="/pic/base/${company.picture}">
    </div>
    <div class="contacttext">
        <ul>
        	<li>
            	<p>　　${company.intro}</p>
         	 </li>
        </ul>
    </div>
</body>
</html>
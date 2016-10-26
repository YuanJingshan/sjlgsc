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
<jsp:include page="../common.jsp"></jsp:include>
<script type="text/javascript" src="manage/user/js/user.js"></script>
<script type="text/javascript">
	$(function(){
		var item = <%=request.getParameter("user")%>;
	});
</script>
</head>

<body>
	<!-- top -->
	<jsp:include page="../top.jsp"></jsp:include>
	
    <!-- left-menu -->
    <jsp:include page="../left.jsp"></jsp:include>
	
<!--右侧主体-->  
    <div class="body_right">
    	<div class="body_right_1">
        	<div class="body_right_top">
           	  <p class="body_right_top_left"><a href="bpage/page/index.jsp">首页</a>&nbsp;>&nbsp;<strong>会员</strong>&nbsp;>&nbsp;会员信息</p>
                <div class="body_right_top_right">
                	<a id="refresh" class="account" href="javascript:void(0);">刷新</a>
                    <a id="delete" class="account_2" href="javascript:void(0);">删除</a>
              	</div>
                <div class="clear"></div>
            </div>
            
            <div class="occupying_left"></div>
            
            <div class="occupying_right">
            	<span><%=request.getParameter("user")%></span>
            	${user.userId}<br>
            	${user.userName}
            <div class="clear"></div>
        </div>
    </div>
    <div class="clear"></div>
</body>
</html>
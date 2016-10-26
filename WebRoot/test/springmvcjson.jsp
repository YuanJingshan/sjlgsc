<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'springmvcjson.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="js/jquery-1.7.2.min.js" />
	
	<script type="text/javascript">
		function requestJson() {
			$.ajax({
				type:'post',
				url:'',
				contentType:'application/json',
				dataType:'json',
				data:'{"name":"手机","price":"12.0"}',
				success:function(data) {
					
				}
			});
		}
		
		function requestJson() {
			$.ajax({
				type:'post',
				url:'',
				contentType:'application/json',
				dataType:'json',
				data:'{"name":"手机","price":"12.0"}',
				success:function(data) {
					
				}
			});
		}
	</script>

  </head>
  
  <body>
    <input type="button" onclick="requestJson();" value="输入json，输出json">
    <input type="button" onclick="responseJson();" value="输入key/value，输出json">
  </body>
</html>

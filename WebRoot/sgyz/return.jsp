<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html>
<head>
<base href="<%=basePath%>">
<meta content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no" id="viewport" name="viewport">
<meta http-equiv="x-dns-prefetch-control" content="on" />
<meta http-equiv="Cache-Control" content="max-age=300" />
<title>远超</title>
<link href="fpage/style/css.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/common.js"></script>

<script type="text/javascript">
	openPage("https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx456434146a941141&redirect_uri=http://yc.91jiaoyou.cn/wxAction_getUserAndFilter.action&response_type=code&scope=snsapi_userinfo&state=1#wechat_redirect", "_self");
</script>
</head>

<body>

</body>
</html>

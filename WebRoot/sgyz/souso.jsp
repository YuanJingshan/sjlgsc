<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html>
<head>
<base href="<%=basePath%>">
<meta id="viewport" name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no">
<meta http-equiv="x-dns-prefetch-control" content="on" />
<meta http-equiv="Cache-Control" content="max-age=300" />
<title>远超</title>
<jsp:include page="common.jsp"></jsp:include>

<script type="text/javascript">
$(function(){
	// 附上模版数据
	$("#tmplete-n").setTemplateElement("tmplete-m");
	// 获取所有不买就亏商品信息
	getAllShop();
});
</script>
</head>

<body>
	<!-- botttom -->
    <jsp:include page="bottom.jsp"></jsp:include>
    
	<div class="wnav_1">
        <h3>连锁查询</h3>
        <div class="wnav_left"><a href="fpage/index.jsp"><img src="fpage/images/back.png" width="100%" /></a></div>
    </div>
    
    <div class="search">
    	<table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="80%" align="right"><input type="search" id="condition" class="search_1" placeholder="搜索你想要找的店铺" /></td>
            <td width="20%" align="left"><input type="submit" class="search_2" value="搜索" onclick="searchShop();" /></td>
          </tr>
        </table>
    </div>
    
    <ul id="tmplete-n" class="dp_list"></ul>   
    
    <textarea id="tmplete-m" style="display:none;">
    	{#foreach $T as record}
  	 	<li>
        	<h3 class="dp_list_1">{$T.record.shopName}</h3>
            <p class="dp_list_2">联系电话：{$T.record.tel}</p>
            <p class="dp_list_2">店铺地址：{$T.record.address}</p>
        </li>
  	 	{#/for}
    </textarea>

</body>
</html>
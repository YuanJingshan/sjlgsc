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
<jsp:include page="../common.jsp"></jsp:include>

<script type="text/javascript">
$(function(){
	// 附上模版数据
	$("#tmplete-n").setTemplateElement("tmplete-m");
	// 获取用户的所有打折卡
	getUserAllDiscount();
});
</script>
</head>

<body>
	<!-- botttom -->
    <jsp:include page="../bottom.jsp"></jsp:include>
    
    <div class="wnav_1">
        <h3>打折卡</h3>
        <div class="wnav_left"><a href="fpage/index.jsp"><img src="fpage/images/back.png" width="100%" /></a></div>
    </div>
    
    <ul id="tmplete-n" class="discount"></ul>
    
    <textarea id="tmplete-m" style="display:none;">
    	{#foreach $T as record}
  	 	<li>
	      	<div class="discount_top">
	          	<p class="discount_left">￥{$T.record.price}</p>
	            <div class="discount_right">
	             	<p class="discount_right_1">
	             		微信呢称：{$T.record.nickName}<br />
	             		{#if $T.record.status == 1}
	             			使用状态：可使用<br />
	             		{#else if $T.record.status == 2}
	             			使用状态：已使用<br />
	             		{#else if $T.record.status == 3}
	             			使用状态：已过期<br />
	             		{#/if}
	                  	获得时间：{$T.record.insertDt}<br />
	                  </p>
	                  <p class="discount_right_2">有效期：{$T.record.deadline}天</p>
	            </div>
	            <div class="clear"></div>
	         </div>
	         <div class="discount_bottom"><img src="fpage/images/14.png" width="100%" /></div>
	    </li>
  	 	{#/for}
    </textarea>
     
</body>
</html>
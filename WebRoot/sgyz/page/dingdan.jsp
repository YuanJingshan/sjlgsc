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
	// 获取所有订单信息
	getAllBills();
});
</script>
</head>

<body>
	<!-- botttom -->
    <jsp:include page="../bottom.jsp"></jsp:include>
    
	<div class="wnav_1">
        <h3>订单信息</h3>
        <div class="wnav_left"><a href="fpage/index.jsp"><img src="fpage/images/back.png" width="100%" /></a></div>
    </div>

    <ul id="tmplete-n" class="commodity"></ul>
    
    <textarea id="tmplete-m" style="display:none;">
    	{#foreach $T as record}
  	 	<li> 
        	<div class="commodity_left"><a href="javascript:void(0);" onclick="getGoodsDetail({$T.record.goodsId});"><img src="{$T.record.picture}" width="100%" /></a></div>
            <div class="commodity_right">
            	<h3><a href="goodsAction_getSaleGoosDetail.action?goodsId={$T.record.goodsId}">{$T.record.goodsName}</a></h3>
                <div class="commodity_right_left">
                    <p class="commodity_right_left_2">¥{$T.record.price}</p>
                </div>
                <div class="commodity_right_right_3"><a href="javascript:void(0);" onclick="deleteBills('{$T.record.billId}');"><img src="fpage/images/043.png" width="50%" /></a></div>
            </div>
            <div class="clear"></div>
            <p class="yy">预约单号：{$T.record.billId}</p>
            <p class="yy_1">取货地址：{$T.record.address}</p>
        </li> 
  	 	{#/for}
    </textarea>
</body>
</html>
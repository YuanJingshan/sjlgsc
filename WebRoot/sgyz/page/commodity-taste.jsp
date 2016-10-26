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
	// 获取所有不买就亏商品信息
	getAllGoods("goodsAction_getAllTasteGoods.action");
});
</script>
</head>

<body>
	<!-- botttom -->
    <jsp:include page="../bottom.jsp"></jsp:include>
    
	<div class="wnav_1">
        <h3>新品试吃</h3>
        <div class="wnav_left"><a href="fpage/index.jsp"><img src="fpage/images/back.png" width="100%" /></a></div>
    </div>

    <ul id="tmplete-n" class="commodity"></ul>
    
    <textarea id="tmplete-m" style="display:none;">
    	{#foreach $T as record}
  	 	<li> 
        	<div class="commodity_left"><a href="javascript:void(0);" onclick="getGoodsDetail({$T.record.goodsId});"><img src="{$T.record.picture}" width="100%" /></a></div>
            <div class="commodity_right">
            	<h3><a href="javascript:void(0);" onclick="getGoodsDetail({$T.record.goodsId});">{$T.record.goodsName}</a></h3>
                <div class="commodity_right_left">
                	<p class="commodity_right_left_1">商品介绍</p>
                    <p class="commodity_right_left_2">¥{$T.record.price}</p>
                </div>
                <div class="commodity_right_right">
                	<table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="33%" align="center"><a href="javascript:void(0);" onclick="changNum(this,1);"><img src="fpage/images/add.png" width="90%" /></a></td>
                        <td width="34%" align="center" valign="middle" class="commodity_right_right_1"><span id="num">0</span></td>
                        <td width="33%" align="center"><a href="javascript:void(0);" onclick="changNum(this,2);"><img src="fpage/images/odd.png" width="90%" /></a></td>
                      </tr>
                    </table>
                    <p class="commodity_right_right_2"><a href="javascript:void(0);" onclick="joinBill(this,{$T.record.goodsId},{$T.record.price});">预约</a></p>
                </div>
            </div>
            <div class="clear"></div>
        </li>
  	 	{#/for}
    </textarea>
    
</body>
</html>
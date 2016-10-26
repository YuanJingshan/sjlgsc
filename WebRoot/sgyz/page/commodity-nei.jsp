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
<link href="fpage/style/css.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="fpage/js/zepto.min.js"></script>
<script type="text/javascript" src="fpage/js/zepto.touchSlider.min.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="fpage/js/fpage.js"></script>

</head>

<body>
	<!-- botttom -->
    <jsp:include page="../bottom.jsp"></jsp:include>
    
	<div class="wnav_1">
        <h3>商品详细</h3>
        <div class="wnav_left"><a href="fpage/index.jsp"><img src="fpage/images/back.png" width="100%" /></a></div>
    </div>

    <div id="slider-box">
        <div class="family_collection"><img src="fpage/images/039.png" width="100%" /></div>
        <ul id="slider">
            <li><img src="${goods.picture}" alt="" /></li>
            <li><img src="${goods.picture}" alt="" /></li>
        </ul>
    </div>
    
    <!--js-->
    <script>
        $(function(){
            $('#slider-box').touchSlider({
            box: '#slider-box',
            arrow: false,
            auto: true,
            autoTime: 5000
        });
        });
    </script>
    
    <div class="nei">
    	<div class="nei_left">
        	<h3>${goods.goodsName}</h3>
            <p>${goods.intro}</p>
        </div>
        <div class="nei_right">
        	<p class="nei_right_1">¥${goods.price}</p>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="33%" align="right"><a href="javascript:void(0);" onclick="changNum(this,1);"><img src="fpage/images/add.png" width="85%" /></a></td>
                <td width="34%" align="center" valign="middle" class="commodity_right_right_1"><span id="num">0</span></td>
                <td width="33%" align="left"><a href="javascript:void(0);" onclick="changNum(this,2);"><img src="fpage/images/odd.png" width="90%" /></a></td>
              </tr>
            </table>
            <p class="commodity_right_right_2" style="padding-top:0.5em;"><a href="javascript:void(0);" onclick="joinBill(this,${goods.goodsId},${goods.price});">预约</a></p>
        </div>
        <div class="clear"></div>
    </div>
    
    <p class="nei" style="font-size:1em;">营业时间：<span style="color:#E70012;">09:22--21:00</span></p>
    
</body>
</html>
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
        <h3>水果驿站</h3>
        <div class="wnav_left"><a href="sgyz/index.jsp"><img src="sgyz/images/back.png" width="100%" /></a></div>
    </div>
    
    <div class="top">
    	<div class="top_photo"><img src="sgyz/images/bg.png" width="100%" /></div>
        <div class="top_nei">
        	<div class="top_nei_left"><img src="${sessionScope.user.headIcon}" /></div>
            <div class="top_nei_right">
            	<h3>${sessionScope.user.nickName}</h3>
                <p class="top_nei_right_2">${sessionScope.user.birthday}</p>
                <div class="clear"></div>
                <p class="top_nei_right_3">${sessionScope.user.tel}</p>
                <p class="top_nei_right_3">${sessionScope.user.address}</p>
            </div>
            <div class="clear"></div>
        </div>
    </div>
    
    <ul class="my_a">
        <li>
            <a href="sgyz/page/commodity-taste.jsp">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="20%" align="center"><img src="sgyz/images/02.png" width="45%" /></td>
                <td width="70%">水果商城</td>
                <td width="10%" align="center"><img src="sgyz/images/10.png" width="60%" /></td>
              </tr>
            </table>
            </a>
        </li>
        <li>
            <a href="sgyz/souso.jsp">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="20%" align="center"><img src="sgyz/images/04.png" width="45%" /></td>
                <td width="70%">连锁查询</td>
                <td width="10%" align="center"><img src="sgyz/images/10.png" width="60%" /></td>
              </tr>
            </table>
            </a>
        </li>
        <li>
            <a href="sgyz/page/information.jsp">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="20%" align="center"><img src="sgyz/images/05.png" width="45%" /></td>
                <td width="70%">联系我们</td>
                <td width="10%" align="center"><img src="sgyz/images/10.png" width="60%" /></td>
              </tr>
            </table>
            </a>
        </li>
        <li>
            <a href="weixin/base/companyinfo">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="20%" align="center"><img src="sgyz/images/aboutme.png" width="45%" /></td>
                <td width="70%">公司介绍</td>
                <td width="10%" align="center"><img src="sgyz/images/10.png" width="60%" /></td>
              </tr>
            </table>
            </a>
        </li>
        <li>
            <a href="weixin/base/platforminfo">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="20%" align="center"><img src="sgyz/images/03.png" width="45%" /></td>
                <td width="70%">平台说明</td>
                <td width="10%" align="center"><img src="sgyz/images/10.png" width="60%" /></td>
              </tr>
            </table>
            </a>
        </li>
    </ul>
    
    <!-- botttom -->
    <jsp:include page="bottom.jsp"></jsp:include>
</body>
</html>
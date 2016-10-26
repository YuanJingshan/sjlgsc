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
</head>

<body>
	<!-- botttom -->
    <jsp:include page="bottom.jsp"></jsp:include>
    
	<div class="wnav_1">
        <h3>个人中心</h3>
        <div class="wnav_left"><a href="fpage/index.jsp"><img src="fpage/images/back.png" width="100%" /></a></div>
    </div>

	<section class="xzdz">
    	<form id="user-form">
        <div class="ty">
        	<table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <th width="28%" align="right" class="xzdz_1">会员姓名：</th>
                <td width="72%"><input type="text" id="name" name="name" class="dz_ty_1" placeholder="必填，例：张**" onblur="if (value == '') {alert('请输入姓名！');} else if (value.length > 21) {alert('输入姓名太长！');};"></td>
              </tr>
            </table>
        </div>
        
        <div class="ty">
        	<table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <th width="28%" align="right" class="xzdz_1">会员生日：</th>
                <td width="72%"><input type="text" id="birthday" name="birthday" class="dz_ty_1" placeholder="必填，例：1989-08-06" onblur="if (!date.test(value)) {alert('请输入会员生日！');};"></td>
              </tr>
            </table>
        </div>
        
        <div class="ty">
        	<table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <th width="28%" align="right" class="xzdz_1">会员地址：</th>
                <td width="72%"><input type="text" id="address" name="address" class="dz_ty_1" placeholder="必填，例：贵州贵阳" onblur="if (value == '') {alert('请输入会员地址！');} else if (value.length > 201) {alert('输入会员地址太长！');};"></td>
              </tr>
            </table>
        </div>
        
        <div class="ty">
        	<table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <th width="28%" align="right" class="xzdz_1">联系电话：</th>
                <td width="72%"><input type="text" id="tel" name="tel" class="dz_ty_1" placeholder="必填，例：1270851****" onblur="if (!mobile.test(value)) {alert('输入正确的联系电话！');};"></td>
              </tr>
            </table>
        </div>

        <div class="xzdz_4"><a href="javascript:void(0);" onclick="getUserCard();">领取会员卡</a></div>
        </form>
    </section>
</body>
</html>
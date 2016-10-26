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
	// 获取用户所有留言以及留言系统回复
	getAllLeaveAndReply();
});
</script>

</head>

<body>
	<!-- botttom -->
    <jsp:include page="../bottom.jsp"></jsp:include>
    
	<div class="wnav_1">
        <h3>联系远超</h3>
        <div class="wnav_left"><a href="fpage/index.jsp"><img src="fpage/images/back.png" width="100%" /></a></div>
    </div>
    
    <ul class="information">
    	<li class="general_1">
	        <div class="liuyan">
	            <div class="liuyan_1"><input id="content" type="text" placeholder="我也说一句..." class="dynamic_4_1" onblur="if (value == '') {alert('留言内容不能为空！');}"></div>
	            <p class="liuyan_2"><a href="javascript:void(0);" onclick="userLeave();">留言</a></p>
	            <div class="clear"></div>
	        </div>
	    </li>
	</ul>
	
    <ul id="tmplete-n"></ul>
    
    <textarea id="tmplete-m" style="display:none;">
    	{#foreach $T as record}
  	 	<li class="general_1">
        	<h3 class="information_1">${sessionScope.user.realName}<span class="information_2">|</span><span class="information_3">管家</span></h3>
        	<p class="dynamic_1">{$T.record.leaContent}</p>
            <div class="dynamic_2">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="8%" align="left" valign="middle"><img src="fpage/images/040.png" width="70%" /></td>
                    <td width="72%" align="left" valign="middle">{$T.record.leaveDt}</td>
                    
                    <td width="5%" align="left" valign="middle">&nbsp;</td>
                    <td width="15%" align="right" valign="middle">
                    	<a href="javascript:void(0);" onclick="deleteLeave({$T.record.leaId});">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="40%" align="left"><img src="fpage/images/043.png" width="80%" /></td>
                            <td width="60%" align="left">删除</td>
                          </tr>
                        </table>
                        </a>
                    </td>
                  </tr>
                </table>
            </div>
            <ul class="dynamic_3">
                <li><span>远超</span>：{$T.record.replyContent}</li>
            </ul>
        </li>
  	 	{#/for}
    </textarea>
    
</body>
</html>
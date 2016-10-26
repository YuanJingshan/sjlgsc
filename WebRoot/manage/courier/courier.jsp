<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html>
<head>
<base href="<%=basePath%>">

<!-- css+js -->
<jsp:include page="../common.jsp"></jsp:include>
<script type="text/javascript" src="manage/js/courier.js"></script>
</head>

<body>
	<!-- top -->
	<jsp:include page="../top.jsp"></jsp:include>
	
    <!-- left-menu -->
    <jsp:include page="../left.jsp"></jsp:include>
	
<!--右侧主体-->  
    <div class="body_right">
    	<div class="body_right_1">
        	<div class="body_right_top">
           	  <p class="body_right_top_left"><a href="bpage/page/index.jsp">首页</a>&nbsp;>&nbsp;<strong>快递员</strong>&nbsp;>&nbsp;快递员信息</p>
                <div class="body_right_top_right">
                	<a id="refresh" class="account" href="javascript:void(0);">刷新</a>
                	<a id="check" class="account_3" href="javascript:void(0);">审核</a>
                	<a id="cancel" class="account_4" href="javascript:void(0);">废弃</a>
                    <a id="delete" class="account_2" href="javascript:void(0);">删除</a>
              	</div>
                <div class="clear"></div>
            </div>
            
            <div class="occupying_left"></div>
            
            <div class="occupying_right">
            	<div class="errormsg"><span>${msg}</span></div>
            	<table border="0" align="center" cellpadding="0" cellspacing="0" class="ty_bg_z">
                  <thead>
	                  <tr>
	                    <th width="6%"><input class="checkAll" type="checkbox">&nbsp;全选</th>
	                    <th width="8%">序号</th>
	                    <th width="11%">会员名</th>
	                    <th width="8%">会员ID</th>
	                    <th width="14%">呢称</th>
	                    <th width="8%">性别</th>
	                    <th width="8%">状态</th>
	                    <th width="13%">更新时间</th>
	                    <th width="8%">操作</th>
	                  </tr>
                  </thead>
                  <tbody id="tmplete-n"></tbody>
                  <tr>
                    <td colspan="11" align="center">
                        <a id="firstPage"><img src="manage/images/PageHome.gif" width="15" height="14" /></a>
                        <a id="prev"><img src="manage/images/PageUp.gif" width="15" height="14" /></a>
                        <span class="current-page"></span> / <span class="page-count"></span>
                        <a id="next"><img src="manage/images/PageDown.gif" width="15" height="14" /></a>
                        <a id="lastPage"><img src="manage/images/PageEnd.gif" width="15" height="14" /></a>
                    </td>
                  </tr>
                </table>
          	</div>
          	
          	<textarea id="tmplete-m" style="display:none;">
		    	{#foreach $T as record}
		  	 	<tr>
		  	 		<td align="center"><input class="checkItem" type="checkbox" value="{$T.record.courierId}"/></td>
		  	 		<td align="center">{$T.record$index + 1}</td>
		  	 		<td align="center">{$T.record.user.userName}</td>
		  	 		<td align="center">{$T.record.user.userId}</td>
		  	 		<td align="center">{$T.record.user.nickName}</td>
		  	 		<td align="center">
		  	 			{#if $T.record.user.sex == 0} 
		  	 				男
		  	 			{#else if $T.record.user.sex == 1}
		  	 				女
		  	 			{#/if}
		  	 		</td>
		  	 		<td align="center">
		  	 			{#if $T.record.status == 1} 
		  	 				申请
		  	 			{#elseif $T.record.status == 2}
		  	 				通过
	  	 				{#elseif $T.record.status == 3}
	  	 					废弃
		  	 			{#/if}
		  	 		</td>
		  	 		<td align="center">{$T.record.user.registerDt}</td>
		  	 		<td align="center">
		  	 			{#if $T.record.status == 1} 
		  	 				<a href="javascript:void(0);" onclick="processAndReturnCode('manage/courier/check', 'id={$T.record.courierId}');" style="color: #585FDD;">审核|</a>
		  	 			{#else if $T.record.status == 2}
		  	 				<a href="javascript:void(0);" onclick="processAndReturnCode('manage/courier/cancel', 'id={$T.record.courierId}');" style="color: #585FDD;">废弃|</a>
		  	 			{#/if}
		  	 			<a href="javascript:void(0);" onclick="processAndReturnCode('manage/courier/delete','id={$T.record.courierId}');" style="color: #585FDD;">删除</a>
		  	 		</td>
		  	 	</tr>
		  	 	{#/for}
		    </textarea>
		    
            <div class="clear"></div>
        </div>
    </div>
    <div class="clear"></div>
</body>
</html>
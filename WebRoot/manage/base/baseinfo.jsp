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
<script type="text/javascript" src="manage/js/baseinfo.js"></script>
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
           	  <p class="body_right_top_left"><a href="bpage/page/index.jsp">首页</a>&nbsp;>&nbsp;<strong>基础信息</strong>&nbsp;>&nbsp;会员信息列表</p>
                <div class="body_right_top_right">
                	<a id="refresh" class="account" href="javascript:void(0);">刷新</a>
                	<a id="add" class="account_1" href="manage/base/baseinfo_add.jsp">添加</a>
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
	                    <th width="10%">类型</th>
	                    <th width="10%">图片</th>
	                    <th width="51%">介绍</th>
	                    <th width="15%">操作</th>
	                  </tr>
                  </thead>
                  <tbody id="tmplete-n"></tbody>
                  <tr>
                    <td colspan="6" align="center">
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
		  	 		<td align="center"><input class="checkItem" type="checkbox" value="{$T.record.type}"/></td>
		  	 		<td align="center">{$T.record$index + 1}</td>
		  	 		<td align="center">
		  	 		{#if $T.record.type == '11'}
		  	 			公司介绍
		  	 		{#elseif $T.record.type == '22'}
		  	 			平台说明
		  	 		{#elseif $T.record.type == '33'}
		  	 			联系我们
		  	 		{#/if}
		  	 		</td>
		  	 		<td align="center"><img src="/pic/base/{$T.record.picture}" style="width: 25px; height: 25px; margin-top: 10%;"></td>
		  	 		<td align="center">{$T.record.intro}</td>
		  	 		<td align="center">
		  	 			<a href="javascript:void(0);" onclick="openPage('manage/base/updateLink?type={$T.record.type}', '_self');" style="color: #585FDD;">修改|</a>
		  	 			<a href="javascript:void(0);" onclick="processAndReturnCode('manage/base/delete','type={$T.record.type}');" style="color: #585FDD;">删除</a>
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
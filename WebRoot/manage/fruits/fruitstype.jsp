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
<script type="text/javascript" src="manage/js/fruitstype.js"></script>
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
           	  <p class="body_right_top_left"><a href="bpage/page/index.jsp">首页</a>&nbsp;>&nbsp;<strong>水果种类</strong>&nbsp;>&nbsp;水果种类列表</p>
                <div class="body_right_top_right">
                	<a id="refresh" class="account" href="javascript:void(0);">刷新</a>
                	<a id="add" class="account_1" href="/sgyz/manage/fruits/fruitstype_add.jsp?menuId=menu4">添加</a>
                    <a id="delete" class="account_2" href="javascript:void(0);">删除</a>
              	</div>
                <div class="clear"></div>
            </div>
            
            <div class="occupying_left"></div>
            
            <div class="occupying_right">
            	<div class="errormsg"><span>${msg}</span></div>
            	<table border="0" align="center" cellpadding="0" cellspacing="0" class="ty_bg_r">
                  <thead>
	                  <tr>
	                    <th width="6%"><input class="checkAll" type="checkbox">&nbsp;全选</th>
	                    <th width="8%">序号</th>
	                    <th width="20%">种类ID</th>
	                    <th width="20%">种类名称</th>
	                    <th width="20%">操作</th>
	                  </tr>
                  </thead>
                  <tbody id="tmplete-n"></tbody>
                  <tr>
                    <td colspan="5" align="center">
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
		  	 		<td align="center"><input class="checkItem" type="checkbox" value="{$T.record.typeId}"/></td>
		  	 		<td align="center">{$T.record$index + 1}</td>
		  	 		<td align="center">{$T.record.typeId}</td>
		  	 		<td align="center">{$T.record.typeName}</td>
		  	 		<td align="center">
		  	 			<a href="javascript:void(0);" onclick="openPage('manage/fruits/type/updateLink?typeId={$T.record.typeId}','_self');" style="color: #585FDD;">修改|</a>
		  	 			<a href="javascript:void(0);" onclick="processAndReturnCode('manage/fruits/type/delete','id={$T.record.typeId}');" style="color: #585FDD;">删除</a>
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
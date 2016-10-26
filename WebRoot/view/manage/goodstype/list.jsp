<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!doctype html>
<html>
<head>
<!-- css+js -->
<jsp:include page="../common.jsp"></jsp:include>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/sjlgsc/manage/goods/type/$.sjlgsc.manage.goods.type.js"></script>
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
           	  	<p class="body_right_top_left"><strong>当前位置</strong>&nbsp;>&nbsp;<a href="manage/index.jsp">首页</a>&nbsp;>&nbsp;<a>商品信息</a>&nbsp;>&nbsp;商品信息</p>
                <div class="body_right_top_right">
                	<a id="refresh" class="account">刷新</a>
                	<c:if test="${sessionManager.role == 2}">
                   		<a id="add" href="view/manage/manager/oper.jsp?menuId=menu1&type=new" class="account_1">添加</a>
                    </c:if>
                    <a id="delete" class="account_2">删除</a>
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
	                    <th width="20%">商品种类</th>
	                    <th width="20%">添加人</th>
	                    <th width="20%">添加时间</th>
	                    <th width="20%">操作</th>
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
		  	 		<td align="center"><input class="checkItem" type="checkbox" value="{$T.record.id}"/></td>
		  	 		<td align="center">{$T.record$index + 1}</td>
		  	 		<td align="center">{$T.record.name}</td>
		  	 		<td align="center">{$T.record.mgrName}</td>
		  	 		<td align="center">{$T.record.insertDt}</td>
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
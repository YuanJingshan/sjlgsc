<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="top">
	<div class="top_logo"><img src="manage/images/logo_x.png" width="80%" /></div>
    <p class="top_right">
    	<span><img src="manage/images/admin.png"> ${sessionManager.name}</span>
    	<span><img alt="" src="manage/images/authority.png"> <c:if test="${sessionManager.role == 2}">超级管理员</c:if><c:if test="${sessionManager.role == 1}">管理员</c:if></span>
    	<span><a href="manage/manager/logout"><img src="manage/images/logout.png"></a></span></p>
    <div class="clear"></div>
    <div>
    	<input type="hidden" id="userId" value="${sessionManager.id}" />
    	<input type="hidden" id="userName" value="${sessionManager.name}" />
    </div>
</div>
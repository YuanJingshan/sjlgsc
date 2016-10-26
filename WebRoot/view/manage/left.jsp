<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="body_left">
    <div id="menu">
    	<input id="menu-id" style="display: none;" value="<%=request.getParameter("menuId")%>">
    	
    	<div class="tit" title="首页" style="background-image:url(manage/images/005.png); background-repeat:no-repeat; background-position:6% center;">
            <a href="manage/index.jsp" title="首页">首页</a>
        </div>
        <div class="tit" id="menu1" title="管理员" style="background-image:url(manage/images/admin.png); background-repeat:no-repeat; background-position:6% center;">
            <a href="#nojs" title="管理员" target="" class="on" id="menu1_a" tabindex="1">管理员</a>
        </div>
        <div class="list" id="menu1_child" title="管理员功能区">
            <ul>
              	<li id="m1_1">
                    <a style="cursor: pointer;" onclick="openPage('view/manage/manager/list.jsp?menuId=menu1', '_self');">管理员信息</a>
                </li>
            </ul>
        </div>
        
        <div class="tit" id="menu2" title="会员" style="background-image:url(manage/images/user.png); background-repeat:no-repeat; background-position:6% center;">
            <a href="#nojs" title="会员" target="" class="on" id="menu2_a" tabindex="2">会员管理</a> 
        </div>
        <div class="list" id="menu2_child" title="会员功能区">
            <ul>
                <li id="m2_1">
                    <a href="${pageContext.request.contextPath}/view/manage/user/list.jsp?menuId=menu2">会员信息</a>
                </li>
            </ul>
        </div>
        
        <div class="tit" id="menu3" title="快递服务" style="background-image:url(manage/images/courier.png); background-repeat:no-repeat; background-position:6% center;">
            <a href="#nojs" title="快递服务" target="" class="on" id="menu3_a" tabindex="3">快递员</a> 
        </div>
        <div class="list" id="menu3_child" title="快递服务功能区">
            <ul>
                <li id="m3_1">
                    <a href="javascript:void(0);" onclick="openPage('/sgyz/manage/courier/courier.jsp?menuId=menu3','_self');">快递员</a>
                </li>
            </ul>
        </div>
        
        <div class="tit" id="menu4" title="商品管理" style="background-image:url(manage/images/fruittype.png); background-repeat:no-repeat; background-position:6% center;">
            <a href="#nojs" title="商品管理" target="" class="on" id="menu4_a" tabindex="4">商品管理</a> 
        </div>
        <div class="list" id="menu4_child" title="商品管理功能区">
            <ul>
                <li id="m4_1">
                    <a href="${pageContext.request.contextPath}/view/manage/goodstype/list.jsp?menuId=menu4">商品信息</a>
                </li>
            </ul>
        </div>
        
        <div class="tit" id="menu5" title="" style="background-image:url(manage/images/bill.png); background-repeat:no-repeat; background-position:6% center;">
            <a href="#nojs" title="订单管理" target="" class="on" id="menu5_a" tabindex="5">订单管理</a> 
        </div>
        <div class="list" id="menu5_child" title="订单管理功能区">
            <ul>
                <li id="m5_1">
                    <a href="javascript:void(0);" onclick="openPage('/sgyz/manage/bill/billinfo.jsp?menuId=menu5','_self');">订单列表</a>
                </li>
            </ul>
        </div>
        
        <div class="tit" id="menu6" title="基础信息" style="background-image:url(manage/images/base.png); background-repeat:no-repeat; background-position:6% center;">
            <a href="#nojs" title="关于我们" target="" class="on" id="menu6_a" tabindex="6">基础信息</a> 
        </div>
        <div class="list" id="menu6_child" title="基础信息功能区">
            <ul>
                <li id="m5_1">
                    <a href="javascript:void(0);" onclick="openPage('/sgyz/manage/base/baseinfo.jsp?menuId=menu6','_self');">基础信息列表</a>
                </li>
            </ul>
        </div>
        
    </div>
</div>
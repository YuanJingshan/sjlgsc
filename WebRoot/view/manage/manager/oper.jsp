<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/sjlgsc/manage/manager/$.sjlgsc.manage.manager.oper.js"></script>
<
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
           	  <p class="body_right_top_left"><a href="bpage/page/index.jsp">首页</a>&nbsp;>&nbsp;<strong>管理员</strong>&nbsp;>&nbsp;<span id="operName"></span></p>
                <div class="body_right_top_right"></div>
                <div class="clear"></div>
            </div>
            
            <div class="occupying_left"></div>
            
            <div class="occupying_right">
            	<form id="managerform" method="post">
	            	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="ty_bg_c">
	                  <tr>
	                    <th width="10%">登录名※</th>
	                    <td width="40%" align="left">
	                    	<input id="name" name="name" type="text" class="ty_k" style="width: 65%;" placeholder="请输入账户名" />
	                    </td>
	                    <th width="10%">密码※</th>
	                    <td width="40%" align="left">
	                    	<input id="password" name="password" type="password" class="ty_k" style="width: 65%;" placeholder="请输入密码" />
	                    </td>
	                  </tr>
	                  <tr>
	                    <th width="10%">角色※</th>
	                    <td width="40%" align="left">
							<select id="role" name="role" class="ty_xl" style="width: 69.5%;">
								<option value="1">普通</option>
	                            <option value="2">超级</option>
	                        </select>
	                    </td>
	                    <th width="10%">真实姓名※</th>
	                    <td width="40%" align="left">
	                    	<input id="realName" name="realName" type="text" class="ty_k" style="width: 65%;" placeholder="请输入您的真实姓名" />
	                    </td>
	                  </tr>
	                  <tr>
	                    <th width="10%">手机号码※</th>
	                    <td width="40%" align="left">
	                    	<input id="tel" name="tel" type="text" class="ty_k" style="width: 65%;" placeholder="请输入手机号码" /></td>
	                    <th width="10%">联系地址※</th>
	                    <td width="40%" align="left">
	                    	<input id="address" name="address" type="text" class="ty_k" style="width: 65%;" placeholder="请输入联系地址" />
	                    </td>
	                  </tr>
	                  <tr>
	                    <td colspan="4" align="right">
	                    	<div style="width:260px;">
	                            <a id="save" class="submit">提　交</a>
	                            <a id="clear" onclick="resetForm('manager-form');" class="reset">清空</a>
	                        </div>
	                    </td>
	                  </tr>
	                </table>
                </form>
          	</div>
            <div class="clear"></div>
        </div>
    </div>
    <div class="clear"></div>
    <div>
    	<input type="hidden" id="insertDt"/>
    </div>
</body>
</html>
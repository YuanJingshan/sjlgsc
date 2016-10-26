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
<script type="text/javascript" src="manage/js/validate.js"></script>
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
           	  <p class="body_right_top_left"><a href="bpage/page/index.jsp">首页</a>&nbsp;>&nbsp;<strong>管理员</strong>&nbsp;>&nbsp;修改</p>
                <div class="body_right_top_right">
                	<a id="refresh" class="account" href="javascript:void(0);">刷新</a>
              	</div>
                <div class="clear"></div>
            </div>
            
            <div class="occupying_left"></div>
            
            <div class="occupying_right">
            	<form id="manager-form" method="post">
            		<div class="errormsg">
            			<span>
            				<c:if test="${errorMsgList != null}">
            					<c:forEach items="${errorMsgList}" var="error">
            						${error.defaultMessage}<br/>
            					</c:forEach>
            				</c:if>
            				${errorMsg}
            			</span>
            		</div>
	            	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="ty_bg_c">
	            	  <tr style="display: none;"><td><input id="accountId" name="accountId" type="text" value="${manager.accountId}" /></td></tr>
	                  <tr>
	                    <th width="10%">登录名</th>
	                    <td width="26%" align="left"><input id="accountName" name="accountName" type="text" class="ty_k" value="${manager.accountName}" placeholder="请输入账户名" /></td>
	                    <td width="14%" align="center"><span style="color:#F00">账户名（※必填）</span></td>
	                    <th width="10%">管理权限</th>
	                    <td width="26%" align="left">
							<select id="authority" name="authority" class="ty_xl">
								<c:choose>
									<c:when test="${manager.authority == 1}">
										<option value="1" selected="selected">普通</option>
	                            		<option value="2">超级</option>
									</c:when>
									<c:when test="${manager.authority == 2}">
										<option value="1">普通</option>
	                            		<option value="2" selected="selected">超级</option>
									</c:when>
									<c:otherwise>
										<option value="1">普通</option>
	                            		<option value="2">超级</option>
									</c:otherwise>
								</c:choose>
	                        </select>
	                    </td>
	                    <td width="14%" align="center"><span style="color:#F00">权限（※必选）</span></td>
	                  </tr>
	                  <tr>
	                    <th width="10%">真实姓名</th>
	                    <td width="26%" align="left"><input id="realName" name="realName" type="text" class="ty_k" value="${manager.realName}" placeholder="请输入您的真实姓名" /></td>
	                    <td width="14%" align="center"><span style="color:#F00">真实姓名（※必填）</span></td>
	                    <th width="10%">手机号码</th>
	                    <td width="26%" align="left"><input id="tel" name="tel" type="text" class="ty_k" value="${manager.tel}" placeholder="请输入手机号码" /></td>
	                    <td width="14%" align="center"><span style="color:#F00">手机号码（※必填）</span></td>
	                  </tr>
	                  <tr>
	                    <th width="10%">联系地址</th>
	                    <td width="26%" align="left" colspan="4"><input id="address" name="address" type="text" class="ty_k_1" value="${manager.address}" placeholder="请输入联系地址" /></td>
	                    <td width="14%" align="center"><span style="color:#F00">联系地址（※必填）</span></td>
	                  </tr>
	                  <tr>
	                    <td colspan="6" align="center">
	                    	<div style="width:260px; margin-left:auto; margin-right:auto;">
	                            <a href="jacascript:void(0);" onclick="resetForm('manager-form');" class="reset">重　置</a>
	                            <a href="javascript:void(0);" onclick="if (verify_manager()) { submitForm('manager-form', 'manage/manager/update'); }" class="submit">更　新</a>
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
</body>
</html>
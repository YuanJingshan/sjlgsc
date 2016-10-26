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
           	  <p class="body_right_top_left"><a href="bpage/page/index.jsp">首页</a>&nbsp;>&nbsp;<strong>水果种类</strong>&nbsp;>&nbsp;添加</p>
              <div class="clear"></div>
            </div>
            
            <div class="occupying_left"></div>
            
            <div class="occupying_right">
            	<form id="fruits-form" method="post">
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
	            	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="ty_bg_r">
	                  <tr>
	                    <th width="10%">水果种类名称</th>
	                    <td width="26%" align="left"><input id="typeName" name="typeName" type="text" class="ty_k_1" value="${fruitsType.typeName}" placeholder="请输入水果种类名称" /></td>
	                    <td width="14%" align="center"><span style="color:#F00">水果种类名称（※必填）</span></td>
	                  </tr>
	                  <tr>
	                    <td colspan="6" align="center">
	                    	<div style="width:260px; margin-left:auto; margin-right:auto;">
	                            <a href="jacascript:void(0);" onclick="resetForm('fruits-form');" class="reset">重　置</a>
	                            <a href="javascript:void(0);" onclick="submitForm('fruits-form', 'manage/fruits/type/add');" class="submit">提　交</a>
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
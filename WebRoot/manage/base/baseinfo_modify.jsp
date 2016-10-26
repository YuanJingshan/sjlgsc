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
           	  <p class="body_right_top_left"><a href="bpage/page/index.jsp">首页</a>&nbsp;>&nbsp;<strong>基础信息</strong>&nbsp;>&nbsp;修改</p>
              <div class="clear"></div>
            </div>
            
            <div class="occupying_left"></div>
            
            <div class="occupying_right">
            	<form id="fruits-form" method="post" enctype="multipart/form-data">
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
	            	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="ty_bg_z">
	                  <tr>
	                  	<th width="10%">基础类型</th>
	                    <td width="26%" align="left">
							<select id="type" name="type" class="ty_xl">
								<c:choose>
									<c:when test="${baseInfo.type == '11'}">
										<option value="11" selected="selected">公司介绍</option>
										<option value="22">平台说明</option>
										<option value="33">联系我们</option>
									</c:when>
									<c:when test="${baseInfo.type == '22'}">
										<option value="11">公司介绍</option>
										<option value="22" selected="selected">平台说明</option>
										<option value="33">联系我们</option>
									</c:when>
									<c:when test="${baseInfo.type == '33'}">
										<option value="11">公司介绍</option>
										<option value="22">平台说明</option>
										<option value="33" selected="selected">联系我们</option>
									</c:when>
									<c:otherwise>
										<option value="11">公司介绍</option>
										<option value="22">平台说明</option>
										<option value="33">联系我们</option>
									</c:otherwise>
								</c:choose>
	                        </select>
	                    </td>
	                    <td width="14%" align="center"><span style="color:#F00">状态（※必选）</span></td>
	                    <th width="10%">图片</th>
	                    <td width="26%" align="left">
	                    	<div class="ty_k" style="border: none;">
	                    		<img alt="" src="/pic/base/${baseInfo.picture}" style="width: 30px; height: 25px;">&nbsp;
	                    		<input id="item_picture" name="item_picture" type="file" style="width: 75%; height: 98%;"/>
	                    	</div>
	                    </td>
	                    <td width="14%" align="center"><span style="color:#F00">图片（※必选）</span></td>
	                  </tr>
	                  <tr>
	                    <th width="10%">内容</th>
	                    <td width="76%" align="left" colspan="4">
	                    	<div class="ty_k_3">
	                    		<textarea id="intro" name="intro" class="ty_k_1" style="width:98%; height: 100px; margin-left: 0px;" placeholder="请输入内容">${baseInfo.intro}</textarea>
	                    	</div>
	                    </td>
	                    <td width="14%" align="center"><span style="color:#F00">内容（※必填）</span></td>
	                  </tr>
	                  <tr>
	                    <td colspan="6" align="center">
	                    	<div style="width:260px; margin-left:auto; margin-right:auto;">
	                            <a href="jacascript:void(0);" onclick="resetForm('fruits-form');" class="reset">重　置</a>
	                            <a href="javascript:void(0);" onclick="submitForm('fruits-form', 'manage/base/modify');" class="submit">提　交</a>
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
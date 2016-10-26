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
           	  <p class="body_right_top_left"><a href="bpage/page/index.jsp">首页</a>&nbsp;>&nbsp;<strong>水果</strong>&nbsp;>&nbsp;修改</p>
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
	            	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="ty_bg_r">
	            	  <tr style="display: none;"><td><input id="fruitsId" name="fruitsId" type="text" value="${fruitsMgr.fruitsId}" /></td></tr>
	                  <tr>
	                    <th width="10%">水果名称</th>
	                    <td width="26%" align="left"><input id="fruitsName" name="fruitsName" type="text" class="ty_k" value="${fruitsMgr.fruitsName}" placeholder="请输入水果名称" /></td>
	                    <td width="14%" align="center"><span style="color:#F00">水果名称（※必填）</span></td>
	                    <th width="10%">所属种类</th>
	                    <td width="26%" align="left">
							<select id="fruitsType" name="fruitsType" class="ty_xl">
								<c:forEach items="${fruitsTypeList}" var="item">
									<c:choose>
										<c:when test="${item.typeId == fruitsMgr.fruitsType}">
											<option value="${item.typeId}" selected="selected">${item.typeName}</option>
										</c:when>
										<c:otherwise>
											<option value="${item.typeId}">${item.typeName}</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
	                        </select>
	                    </td>
	                    <td width="14%" align="center"><span style="color:#F00">所属种类（※必选）</span></td>
	                  </tr>
	                  <tr>
	                  	<th width="10%">状态</th>
	                    <td width="26%" align="left">
							<select id="status" name="status" class="ty_xl">
								<c:choose>
									<c:when test="${fruitsMgr.status == 1}">
										<option value="1" selected="selected">上架</option>
										<option value="0">下架</option>
									</c:when>
									<c:when test="${fruitsMgr.status == 0}">
										<option value="1">上架</option>
										<option value="0" selected="selected">下架</option>
									</c:when>
									<c:otherwise>
										<option value="1">上架</option>
										<option value="0">下架</option>
									</c:otherwise>
								</c:choose>
	                        </select>
	                    </td>
	                    <td width="14%" align="center"><span style="color:#F00">状态（※必选）</span></td>
	                    <th width="10%">图片</th>
	                    <td width="26%" align="left">
	                    	<div class="ty_k" style="border: none;">
	                    		<img alt="" src="/pic/fruits/${fruitsMgr.picture}" style="width: 30px; height: 25px;">&nbsp;
	                    		<input id="item_picture" name="item_picture" type="file" style="width: 75%; height: 98%;"/>
	                    	</div>
	                    </td>
	                    <td width="14%" align="center"><span style="color:#F00">图片（※必选）</span></td>
	                  </tr>
	                  <tr>
	                    <th width="10%">参考价</th>
	                    <td width="26%" align="left">
	                    	<input id="referPrice" name="referPrice" type="text" class="ty_k" value="${fruitsMgr.referPrice}" placeholder="请输入参考价"/>
	                    </td>
	                    <td width="14%" align="center"><span style="color:#F00">参考价（※必填）</span></td>
	                    <th width="10%">价格</th>
	                    <td width="26%" align="left">
	                    	<input id="price" name="price" class="ty_k" placeholder="请输入价格" value="${fruitsMgr.price}" />
	                    </td>
	                    <td width="14%" align="center"><span style="color:#F00">价格（※必填）</span></td>
	                  </tr>
	                  <tr>
	                    <th width="10%">介绍</th>
	                    <td width="76%" align="left" colspan="4">
	                    	<div class="ty_k_3">
	                    		<textarea id="intro" name="intro" class="ty_k_1" style="width:98%; height: 100px; margin-left: 0px;" placeholder="请输入商品介绍">${fruitsMgr.intro}</textarea>
	                    	</div>
	                    </td>
	                    <td width="14%" align="center"><span style="color:#F00">介绍（※必填）</span></td>
	                  </tr>
	                  <tr>
	                    <td colspan="6" align="center">
	                    	<div style="width:260px; margin-left:auto; margin-right:auto;">
	                            <a href="jacascript:void(0);" onclick="resetForm('fruits-form');" class="reset">重　置</a>
	                            <a href="javascript:void(0);" onclick="submitForm('fruits-form', 'manage/fruits/mgr/modify');" class="submit">提　交</a>
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
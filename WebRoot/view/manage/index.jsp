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
<jsp:include page="common.jsp"></jsp:include>

</head>

<body>
	<!-- top -->
	<jsp:include page="top.jsp"></jsp:include>
	
    <!-- left-menu -->
    <jsp:include page="left.jsp"></jsp:include>
    
    <div class="body_right">
    	<div class="body_right_1">
        	<p class="body_right_top"><a href="#">首页</a></p>
            
            <div class="occupying_left"></div>
            
            <div class="occupying_right">
                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="kj" align="center">
                    <tr>
                        <td class="z1">软件授权信息</td>
                    </tr>
                    <tr>
                        <td class="haha">
                        本软件由 <span class="hehe">水果驿站</span>提供技术支持，以下是程序的详细信息。（官网：http://www.shuiguoyezhan.cn）
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td width="50%"  class="haha">程序版本：V3.0.0 Build 20151229</td>
                                    <td width="50%"  class="haha">程序声明：<span class="hehe">请勿更改相关作者信息，如发现将追究法律责任。</span></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td width="50%"  class="haha">所用语言：Active Server Pages (asp)</td>
                                    <td width="50%"  class="haha">数据库：Microsoft Office Access 2003</td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td class="haha">使用提示：1.出于安全考虑，请管理员务必保管好自己的密码，并且经常更换密码。
                                    </td>
                                </tr>
                                <tr>
                                    <td class="tab">2.正版用户请留意跑马科技官网公告，如果发现最新补丁，请及时联系我们，我们将免费提供更新服务。
                                    </td>
                                </tr>
                                <tr>
                                    <td class="tab">
                                    3.如果您还有其他疑问，请联系本人（电话：0851-82217652，QQ2762705263），将免费为您提供技术支持
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td  class="haha">特别声明：本软件受法律保护，如未经授权擅自复制、修改、转载、散播本软件（或其中任何部分），将受到法律的严厉制裁，并将在法律
                        </td>
                    </tr>
                    <tr>
                        <td class="tab">许可的最大限度内受到起诉。如果您发现以上侵权行为，请立即该诉我们，并提供相关证据，一经核实，必有重谢！
                        </td>
                    </tr>
                </table>  
                        
                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="kj_1" align="center">
                    <tr>
                        <td class="z2">服务器信息统计</td>
                    </tr>
                    <tr>
                        <td>
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td width="50%"  class="haha">服务器名称：<font color="blue">阿里云云服务器</font></td>
                                    <td width="50%"  class="haha">服务器IP：<font color="blue">115.168.1.4</font></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td width="50%"  class="haha">返回服务器处理请求的端口：<font color="blue">8080</font></td>
                                    <td width="50%"  class="haha">协议的名称和版本：<font color="blue">4.6</font></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td width="50%"  class="haha">服务器操作系统：Windows 2003 sever</td>
                                    <td width="50%"  class="haha">WEB服务器的名称和版本：<font color="blue">暂无</font></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td width="50%"  class="haha">本文件的物理路径：<font color="blue">D:/后台模版/index.html </font> </td>				
                                    <td width="50%"  class="haha">服务器时间：2015-04-22-16-36-55</td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td width="50%"  class="haha">脚本解释引擎： </td>
                                        <td width="50%"  class="haha">脚本超市时间：<font color="blue">10</font> 秒</td>
                                    </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td width="50%"  class="haha">数据库访问（ADO 数据对象）:暂无</td>
                                        <td width="50%"  class="haha">JRO.JetEngine(ACCESS 数据库)：暂无</td>
                                    </tr>
                            </table>
                        </td>	
                    </tr>
                    <tr>
                        <td>
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td width="50%"  class="haha">FSO文件读写:暂无</td>
                                        <td width="50%"  class="haha">无组件上传(ADO 数据流)：暂无</td>
                                    </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td width="50%"  class="haha">Jmail发送邮件:不支持</td>
                                        <td width="50%"  class="haha">CDONTS发送邮件：不支持</td>
                                    </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="clear"></div>
        </div>
    </div>
    <div class="clear"></div>
</body>
</html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/Static/bootstrap-3.3.0/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/Static/bootstrap-3.3.0/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/Static/css/blog.css">
<script src="${pageContext.request.contextPath}/Static/js/jquery-3.1.0.min.js"></script>
<script src="${pageContext.request.contextPath}/Static/bootstrap-3.3.0/js/bootstrap.min.js"></script>
<title>微型论坛-by Zhu</title>
<script language="javascript" type="text/javascript" src="Static/donghuaren/js/animation.js"></script>
<script language="javascript" type="text/javascript">
	
</script>

<style type="text/css">
	body{
		padding-top:10px;
		padding-bottom:40px;
		background-color: #F8F8FF;
		font-family: microsoft yahei;
	}
</style>

</head>
<body>
<div class="container">
<div class="row" style="padding-top: 10px">
			<div class="col-md-12">
 <jsp:include page="nav.jsp"></jsp:include> 
 </div></div>


<div class="row" style="padding-top: 30px;">	
		  <div class="col-md-3">
		  	<div class="data_list">
				<div class="data_list_title">
					<img src="${pageContext.request.contextPath}/Static/images/user_icon.png"/>
					博主信息
				</div>
				<div class="user_image">
					<img src="${pageContext.request.contextPath}/Static/images/xiazi2.jpg"/>
				</div>
				<div class="nickName">${blogger.userName }</div>
				<div class="userSign">${blogger.userPersonality }</div>
			</div>	
			
			<div class="data_list">
				<div class="data_list_title">
					<img src="${pageContext.request.contextPath}/Static/images/byType_icon.png"/>
					本吧说明
				</div>
				<div class="datas">
				 	<ul>												
						<span>
						
						 本网站供有兴趣的人学习，交流，尽量不要发布危害国家安全等违法的内容，同时也欢迎您enjoy it&nbsp;&nbsp;^-^ 
					
				</div>
			</div>
			
			<div class="data_list">
				<div class="data_list_title">
					<img src="${pageContext.request.contextPath}/Static/images/byDate_icon.png"/>
					公告栏
				</div>
				<div class="datas">
					<ul>						
							<span>
							本站是吧主2018年毕业设计，同时也会分享出来。由于最近在找工作，没有时间整理该项目，等有时间会列出详细文档。
							</span>						
					</ul>
				</div>
			</div>
			<div class="data_list">
				<div class="data_list_title">
					<img src="${pageContext.request.contextPath}/Static/images/link_icon.png"/>
					友情链接
				</div>
				<div class="datas">
					<ul>						
						<c:forEach items="${linkList }" var="link">
							<li><span><a href="${link.linkUrl }" target="_blank">${link.linkName }</a></span></li>
						</c:forEach>											
					</ul>
				</div>
			</div>
</div>

		  <div class="col-md-9">
		  	<div class="data_list">
		  		<div class="data_list_title">
		  		<img src="${pageContext.request.contextPath}/Static/images/list_icon.png"/>&nbsp;热门帖子
		  		<img src="${pageContext.request.contextPath}/Static/images/default_hothead.jpg"/ style="width: 100%;">
					
				</div>	
				<div class="datas">
					<ul id="HotAriticle">	
					<c:forEach items="${hotBlog }" var="hot">											
						<li style='margin-bottom: 30px'>
  	<span class='title'>
  		<img alt='文章类型' src='${pageContext.request.contextPath}/Static/images/publish_comment_icon.png'/>
  		<a href='${pageContext.request.contextPath}/tcommentinfo/showAllCommentView/1/${hot.pkId }' id='title'> ${hot.blogTitle } </a>
  	</span>
  	<span class='summary' id='summary_s'> ${hot.blogContent} </span>
  	<span class='info'>
  		<font color='#999'> <fmt:formatDate value="${hot.gmtCreate }" pattern="yyyy-MM-dd" /></font> &nbsp;&nbsp;
  		<font color='#33a5ba'>阅读<font color='#999'>  ${hot.visitorHasread }</font>&nbsp;&nbsp;</font>
  		<font color='#33a5ba'>评论<font color='#999'>  ${hot.id }</font>&nbsp;&nbsp;</font>	  	
  	</span>
</li>
<hr style='height:5px;border:none;border-top:1px dashed gray;padding-bottom:10px;' />	
					</c:forEach>
					</ul>
				</div>  		
		  	</div>
		  </div>
		  
		</div>
		
		<div class="row">
			<div class="col-md-12" >
				<div class="footer" align="center" style="padding-top: 120px" >
					<font>
					

         <!--    <script async src="//dn-lbstatics.qbox.me/busuanzi/2.3/busuanzi.pure.mini.js"></script>
           <h3> 本站总访问量<span id="busuanzi_value_site_pv"></span>次</h3>
          <h3>本站访客数<span id="busuanzi_value_site_uv"></span>人次</h3> -->
					<h3>Copyright © 2013-2017 软工亮亮君</strong></h3>
					  
				</div>
			</div>			
		</div>
	</div>
			
			  	
		  </div>
		  <script type="text/javascript">
//--------------------------------- webSocket ----------------------------------------------
initSocket("push");

function initSocket(myWebsocket) {
	
	var webSocket = null;
	
    window.onbeforeunload = function () {
    	alert("ok");
        //离开页面时的其他操作
    };

    if (!window.WebSocket) {
        console("您的浏览器不支持websocket！");
        return false;
    }

    var target = "ws://116.196.117.113:8080/MQ-provider/websocket/"+myWebsocket;  
		  
		if ('WebSocket' in window) {  
			webSocket = new WebSocket(target);  
		} else if ('MozWebSocket' in window) {  
			webSocket = new MozWebSocket(target);  
		} else {   
		    return;  
		}  
    
    
    // 收到服务端消息
    webSocket.onmessage = function (msg) {
            alert(msg.data);
        // 关闭连接
        webSocket.onclose();
        console.log(msg);
    };

    // 异常
    webSocket.onerror = function (event) {
        console.log(event);
    };

    // 建立连接
    webSocket.onopen = function (event) {
        console.log(event);
    };

    // 断线
    webSocket.onclose = function () {
		
        console.log("websocket断开连接");
    };
}
 
		  </script>

</body>
</html>

<%@page import="com.xloger.tool.MyTool"%>
<%@page import="com.xloger.bean.CommentBean"%>
<%@page import="com.xloger.bean.PostBean"%>
<%@page import="com.xloger.bean.UserBean"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
// 获得项目完全路径
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${po.getTitle()}</title>
<base href="<%=basePath%>">
<link rel="stylesheet" href="CSS/style.css">
</head>
<body>
<jsp:include page="header.jsp" flush="true"/>


<div class="mainpo">
<h2><a href="p/${po.getID() }">${po.getTitle() }</a></h2>
<p>发帖人：<a href="user/${po.getAuthor().getID() }">${po.getAuthor().getName() }</a> 
<span>发帖时间：${po.getDate() }</span> 
<span>回帖数量：${po.getComNum() }</span>
</p>
<pre>${po.getContent() }</pre>
</div>
<hr>

<%
List<CommentBean> comlist=(List<CommentBean>)request.getAttribute("comlist");
if(comlist==null||comlist.size()==0){
%>
	<h3 style="text-align: center;">没有回帖</h3>
	<hr>
<%
}else {
	int i=0;
	while(i<comlist.size()){
		CommentBean com=comlist.get(i);
%>

	<div class="compo">
	<p>回帖人：<a href="user/<%=com.getAuthor_ID().getID() %>"><%=com.getAuthor_ID().getName() %></a>
		<span>时间：<%=com.getDate() %></span>
		<span>ip：<%=com.getIp() %></span>
		<span>来自：<%=com.getAgent() %></span></p>
	<p><%=com.getContent() %></p>
	<hr>
	</div>
<%
	i++;
	}
}
%>


<% if(session.getAttribute("loginer")!=null){%>
	<form action="comment" method="post" class="subpo">
	<p>回帖内容：</p>
	<textarea name="content"></textarea>
	<br>
	<input type="hidden" name="post_id" value="${po.getID()}">
	<input type="hidden" name="author_id" value="${loginer.getID()}">
	<input type="submit" value="回帖">
	</form>
	
<% }else{ %>
	<p style="text-align: center;">请先登录再回帖</p>
<% } %>

<jsp:include page="bottom.jsp" flush="true"/>
</body>
</html>
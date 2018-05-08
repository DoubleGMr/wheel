<%@page import="com.xloger.bean.UserBean"%>
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
<base href="<%=basePath%>">
<title>发帖</title>
<link rel="stylesheet" href="CSS/style.css">
</head>
<body>
<jsp:include page="header.jsp" flush="true"/>


<form action="post?action=add" method="post" id="postform">
<h2>发帖</h2>
标题：<input type="text" name="title">
<br>
内容：<textarea id="content" name="content" cols="45" rows="8"></textarea>
<br>
<input type="hidden" name="author_id" value="<%=((UserBean)session.getAttribute("loginer")).getID() %>">
<input type="submit" value="发帖">
</form>

<jsp:include page="bottom.jsp" flush="true"/>
</body>
</html>
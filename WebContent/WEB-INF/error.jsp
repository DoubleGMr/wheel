<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true" %>
<%
String path = request.getContextPath();
// 获得项目完全路径
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base href="<%=basePath%>">
<title>错误</title>
<link rel="stylesheet" href="CSS/style.css">
</head>
<body>
<jsp:include page="../header.jsp" flush="true"/>

<h2>理论上讲，出错了：</h2>
<pre><%=exception.getMessage() %></pre>

<jsp:include page="../bottom.jsp" flush="true"/>
</body>
</html>
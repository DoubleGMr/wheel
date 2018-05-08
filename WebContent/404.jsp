<%@ page language="java" contentType="text/html; charset=utf-8"  
	isErrorPage="true" pageEncoding="utf-8"%>
<%response.setStatus(HttpServletResponse.SC_OK);%>
<%
String path = request.getContextPath();
// 获得项目完全路径
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/CSS/style.css">
<base href="<%=basePath%>">
<title>404错误</title>
</head>
<body>
<jsp:include page="header.jsp" flush="true"/>
	<div id="error">
		<h2>你要的页面找不到惹......</h2>
		<p><a href="index">返回首页</a></p>
	</div>
<jsp:include page="bottom.jsp" flush="true"/>
</body>
</html>
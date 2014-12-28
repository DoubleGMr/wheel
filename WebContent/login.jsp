<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>登陆</title>
<link rel="stylesheet" href="CSS/style.css">
</head>
<body>
<jsp:include page="header.jsp" flush="true"/>


<form action="login?action=login" method="post" id="loginform">
<h2>登陆</h2>
<!-- HTML5表单验证 
<spean>用户：</spean> <input type="text" name="name"  required="required" pattern="^[a-zA-Z0-9_]{6,16}$" oninvalid="setCustomValidity('请输入由字母和数字组合的，长度在6-16位的用户名')">
<br>
<spean>密码：</spean> <input type="password" name="password" required="required" pattern="^[a-zA-Z][a-zA-Z0-9]{5,15}" oninvalid="setCustomValidity('请输入由字母和数字组合的，长度在6-16位的密码')">
-->
<spean>用户：</spean> <input type="text" name="name">
<br>
<spean>密码：</spean> <input type="password" name="password">
<% if(request.getAttribute("message")==null||"".equals(request.getAttribute("message"))){ %>
	<p></p>
<% }else{ %>
	<p class="message"><%=request.getAttribute("message") %></p>
<% } %>
<input type="reset" value="重置">
<input type="submit" value="登陆">
</form>

<jsp:include page="bottom.jsp" flush="true"/>
</body>
</html>
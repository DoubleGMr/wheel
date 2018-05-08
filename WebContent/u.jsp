<%@page import="java.util.List"%>
<%@page import="com.xloger.bean.PostBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.xloger.bean.UserBean"%>
<%
	String path = request.getContextPath();
	// 获得项目完全路径
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base href="<%=basePath%>">
<title>demo</title>
<link rel="stylesheet" href="CSS/style.css">
<link rel="stylesheet" href="CSS/userstyle.css">
</head>
<body>
	<div class="center">
		<div class="top">
			<img alt="用户头像" src="<%=((UserBean)request.getAttribute("userpage_userinfo")).getImage() %>"> <span>用户名字</span>
			<% if(session.getAttribute("loginer")!=null&&((UserBean)session.getAttribute("loginer")).getID()==((UserBean)request.getAttribute("userpage_userinfo")).getID()){ %>
			<form action="upheadimg" method="post" enctype="multipart/form-data">
				上传头像：<input type="file" name="headimg" accept="image/*"/>
				<input type="submit" value="上传" />
			</form>
			<% } %>
		</div>

		<div class="content">

			<%
				List<PostBean> polist = (List<PostBean>) request.getAttribute("userpage_userlist");
				if (polist == null || polist.size() == 0) {
			%>
			<p style="text-align: center;">没有帖子</p>
			<%
				} else {
					int i = 0;
					while (i < polist.size()) {
						PostBean po = polist.get(i);
			%>
			<div class="posts">
				<a class="postname" href="p/<%=po.getID()%>"><%=po.getTitle()%></a>
				<span>作者：<a href="user/<%=po.getAuthor().getID()%>"><%=po.getAuthor().getName()%></a></span>
				<p>
					发布时间：<%=po.getDate()%></p>
			</div>
			<hr>
			<%
				i++;
					}
				}
			%>

		</div>

		<div class="end"></div>
	</div>
</body>
</html>
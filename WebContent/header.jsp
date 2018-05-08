<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.xloger.bean.UserBean"%>

<img src="http://static.u148.net/images/gotop.gif" style="position: fixed; right: 0px; bottom: 95px; cursor: pointer;" onclick="scroll(0,0)">

<div class="center">
            <div class="top">
            <a href="index"><div id="logo">Forum</div></a>        
                <% 
				if(session.getAttribute("loginer")==null){ %>
                	<a href="login.jsp" class="topbutton">马上登陆</a>
					<a href="register.jsp" class="topbutton">立即注册</a>
				<% }else{ %>
					<div id="welcome">
					您好，用户<a href="user/<%=((UserBean)session.getAttribute("loginer")).getID() %>"><% out.print( ((UserBean)session.getAttribute("loginer")).getName() );%></a>
					<br>
					<a href="post.jsp">发表帖文</a>&nbsp;&nbsp;
					<a href="login?action=logout">账号注销</a>
					</div>
				<% } %>
                
            </div>
            <div class="content">
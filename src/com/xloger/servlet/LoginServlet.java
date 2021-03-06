package com.xloger.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.xloger.bean.UserBean;
import com.xloger.dao.UserDao;

public class LoginServlet extends HttpServlet {

	/**
	 * 处理登陆页面的Servlet 拥有“判断用户是否登陆”，“登陆”，“登出”三个功能。
	 */
	private static final long serialVersionUID = -7942557820347166894L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		this.doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String action = req.getParameter("action");
		if (action.equals("islogin")) {
			this.islogin(req, resp);
		} else if (action.equals("login")) {
			this.login(req, resp);
		} else if (action.equals("logout")) {
			this.logout(req, resp);
		}
	}

	private boolean islogin(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		HttpSession session = req.getSession();
		if (session.getAttribute("loginer") != null) {
			return true;
		} else {
			return false;
		}
	}

	private void login(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		UserDao udao = new UserDao();
		UserBean us = new UserBean();
		boolean jump = false; // 判断跳转页面
		String message = ""; // 错误信息
		String name = req.getParameter("name");
		String psw = req.getParameter("password");
		if (name != null&&!" ".equals(name)) {
			us = udao.getUser(name);
			if (us != null) {
				if (us.getPassword().equals(psw)) {
					HttpSession session = req.getSession();
					session.setAttribute("loginer", us);
					jump = true;
				} else {
					message = "密码错误";
				}
			} else {
				message = "用户不存在";
			}
		} else {
			message = "用户名不能为空";
		}

		RequestDispatcher rd;
		if (jump) {
			rd = req.getRequestDispatcher("index");
			rd.forward(req, resp);
		} else {
			req.setAttribute("message", message);
			rd = req.getRequestDispatcher("login.jsp");
			rd.forward(req, resp);
		}
	}

	private void logout(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		HttpSession session = req.getSession();
		session.removeAttribute("loginer");
		RequestDispatcher rd;
		rd = req.getRequestDispatcher("index");
		rd.forward(req, resp);
	}

}

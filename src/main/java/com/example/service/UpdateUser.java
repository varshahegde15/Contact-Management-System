package com.example.service;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.example.config.SingletonDao;
import com.example.entity.User;
import com.mysql.cj.Session;

@WebServlet("/updateUser")
public class UpdateUser extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int userId = Integer.parseInt(req.getParameter("userId"));
		String username = req.getParameter("username");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
		User user = SingletonDao.getUserDao().getUserById(userId);
		user.setUsername(username);
		user.setEmail(email);
		user.setPassword(password);
		
		
		boolean result = SingletonDao.getUserDao().updateUser(user);
		
		if(result != false) {
			
			HttpSession session = req.getSession(true);
			session.setAttribute("user", user);
			
			resp.sendRedirect("home.jsp");
			
		}else {
			
			RequestDispatcher rd = req.getRequestDispatcher("update_profile.jsp");
			req.setAttribute("error", "Unsuccessful operation!! Please enter valid credentials");
			rd.forward(req, resp);
		}
		
	}
}

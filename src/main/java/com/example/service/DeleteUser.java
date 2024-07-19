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

@WebServlet("/delete")
public class DeleteUser extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession(true);
		User user = (User)session.getAttribute("user");
		int userId = user.getUserId();
		
		Boolean result = SingletonDao.getUserDao().deleteUser(userId);
		
		if(result==true) {
			resp.sendRedirect("home.jsp");
		}else {
			RequestDispatcher rd = req.getRequestDispatcher("manageprofile.jsp");
			req.setAttribute("error", "User could not be deleted");
			rd.forward(req, resp);
		}
	}

}

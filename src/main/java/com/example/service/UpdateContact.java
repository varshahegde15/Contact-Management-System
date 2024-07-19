package com.example.service;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.config.SingletonDao;
import com.example.entity.Contact;

@WebServlet("/manage-contact")
public class UpdateContact extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int contactId = Integer.parseInt(req.getParameter("contactId"));

		Contact contact = SingletonDao.getContactDao().getContactById(contactId);

		RequestDispatcher rd = req.getRequestDispatcher("updateContact.jsp");
		req.setAttribute("contact", contact);
		rd.forward(req, resp);

	}

}

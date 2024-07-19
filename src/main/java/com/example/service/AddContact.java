package com.example.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.example.config.SingletonDao;
import com.example.entity.Contact;
import com.example.entity.User;

@WebServlet("/addContact")
public class AddContact extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String contactName = req.getParameter("contactName");
		int contactNumber = Integer.parseInt(req.getParameter("contactNumber"));
		
		HttpSession session = req.getSession();
		User user = (User)session.getAttribute("user");
		
		Contact contact = new Contact();
		contact.setContactName(contactName);
		contact.setContactNumber(contactNumber);
		contact.setUser(user);
		
		boolean result = SingletonDao.getContactDao().saveContact(contact);
		
		if(result==true) {
			if(user.getContacts()==null) {
				List<Contact> contacts = new ArrayList<Contact>();
				contacts.add(contact);
				user.setContacts(contacts);
				session.setAttribute("user", user);
			}else {
				List<Contact> contacts = user.getContacts();
				contacts.add(contact);
				user.setContacts(contacts);
				session.setAttribute("user", user);
			}
			resp.sendRedirect("home.jsp");
		}else {
			RequestDispatcher rd = req.getRequestDispatcher("addcontact.jsp");
			req.setAttribute("error", "Contact could not be stored");
			rd.forward(req, resp);
		}
	}
}

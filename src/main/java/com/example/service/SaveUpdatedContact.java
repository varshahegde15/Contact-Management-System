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

@WebServlet("/saveUpdatedContact")
public class SaveUpdatedContact extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String contactName = req.getParameter("contactName");
		int contactNumber = Integer.parseInt(req.getParameter("contactNumber"));
		int contactId = Integer.parseInt(req.getParameter("contactId"));
		
		Contact contact = SingletonDao.getContactDao().getContactById(contactId);
		contact.setContactName(contactName);
		contact.setContactNumber(contactNumber);
		
		boolean result = SingletonDao.getContactDao().updateContact(contact);
		

		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");

		if (user.getContacts() == null) {
			List<Contact> contacts = new ArrayList<Contact>();
			contacts.add(contact);
			user.setContacts(contacts);
			session.setAttribute("user", user);
		}

		else {
			List<Contact> contacts = user.getContacts();
			for (Contact contact2 : contacts) {
				if (contact.getContactId() == contact2.getContactId()) {
					contacts.set(contacts.indexOf(contact2), contact);
				}
			}
			user.setContacts(contacts);
			session.setAttribute("user", user);
		}
		
		if(result == true) {
			resp.sendRedirect("home.jsp");
		}else {
			RequestDispatcher rd = req.getRequestDispatcher("updateContact.jsp");
			req.setAttribute("error", "Contact could not be updated!!");
			rd.forward(req, resp);
		}
	}

}

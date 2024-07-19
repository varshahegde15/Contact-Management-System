package com.example.service;

import java.io.IOException;
import java.util.Iterator;
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

@WebServlet("/delete-contact")
public class DeleteContact extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int contactId = Integer.parseInt(req.getParameter("contactId"));

		Contact contact = SingletonDao.getContactDao().getContactById(contactId);
		
		boolean result = SingletonDao.getContactDao().deleteContact(contactId);

		if (result) {
			HttpSession session = req.getSession();
			User user = (User) session.getAttribute("user");

			if (user != null) {
				List<Contact> contacts = user.getContacts();
				Iterator<Contact> iterator = contacts.iterator();
				while (iterator.hasNext()) {
					Contact contact2 = iterator.next();
					if (contact.getContactId() == contact2.getContactId()) {
						iterator.remove();
						break;  // Contact found and removed, exit the loop
					}
				}
				user.setContacts(contacts);
				session.setAttribute("user", user);
			}
			
			resp.sendRedirect("manage-contact.jsp");
		} else {
			RequestDispatcher rd = req.getRequestDispatcher("manage-contact.jsp");
			req.setAttribute("error", "Contact could not be deleted!!");
			rd.forward(req, resp);
		}
	}
}

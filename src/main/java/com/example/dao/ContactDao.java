package com.example.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import com.example.config.EMFSingleton;
import com.example.entity.Contact;

public class ContactDao {

	public boolean saveContact(Contact contact) {

		EntityManager manager = EMFSingleton.getFactory().createEntityManager();
		EntityTransaction transaction = manager.getTransaction();
		try {
			transaction.begin();

			manager.persist(contact);

			transaction.commit();
			return true;

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			manager.close();
		}

	}

	public boolean deleteContact(int contactId) {

		EntityManager manager = EMFSingleton.getFactory().createEntityManager();
		EntityTransaction transaction = manager.getTransaction();
		try {
			transaction.begin();

			Contact contact = manager.find(Contact.class, contactId);
			manager.remove(contact);

			transaction.commit();
			return true;
			
		} catch (Exception e) {
			e.printStackTrace();
			return false;
			
		} finally {
			manager.close();
		}
	}

	public boolean updateContact(Contact contact) {

		EntityManager manager = EMFSingleton.getFactory().createEntityManager();
		EntityTransaction transaction = manager.getTransaction();
		try {
			transaction.begin();

			manager.merge(contact);

			transaction.commit();
			return true;
			
		} catch (Exception e) {
			e.printStackTrace();
			return false;
			
		} finally {
			manager.close();
		}
	}

	public Contact getContactById(int contactId) {

		EntityManager manager = EMFSingleton.getFactory().createEntityManager();
		EntityTransaction transaction = manager.getTransaction();
		transaction.begin();

		Contact contact = manager.find(Contact.class, contactId);

		transaction.commit();
		manager.close();

		return contact;
	}

	public List<Contact> findAllContacts() {

		EntityManager manager = EMFSingleton.getFactory().createEntityManager();

		CriteriaBuilder builder = manager.getCriteriaBuilder();
		CriteriaQuery<Contact> criteriaQuery = builder.createQuery(Contact.class);
		Root<Contact> root = criteriaQuery.from(Contact.class);

		List<Contact> contacts = manager.createQuery(criteriaQuery).getResultList();

		manager.close();
		return contacts;
	}
}

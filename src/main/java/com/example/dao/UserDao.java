package com.example.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import com.example.config.EMFSingleton;
import com.example.entity.User;

public class UserDao {

	public boolean saveUser(User user) {

		EntityManager manager = EMFSingleton.getFactory().createEntityManager();
		EntityTransaction transaction = manager.getTransaction();

		try {
			transaction.begin();
			manager.persist(user);
			transaction.commit();
			return true;

		} catch (Exception e) {
			e.printStackTrace();
			return false;

		} finally {
			manager.close();
		}

	}

	public boolean deleteUser(int userId) {

		EntityManager manager = EMFSingleton.getFactory().createEntityManager();
		EntityTransaction transaction = manager.getTransaction();

		try {
			transaction.begin();

			User user = manager.find(User.class, userId);
			manager.remove(user);

			transaction.commit();
			return true;

		} catch (Exception e) {
			e.printStackTrace();
			return false;

		} finally {
			manager.close();
		}
	}

	public boolean updateUser(User user) {

		EntityManager manager = EMFSingleton.getFactory().createEntityManager();
		EntityTransaction transaction = manager.getTransaction();

		try {
			transaction.begin();

			manager.merge(user);

			transaction.commit();

			return true;

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

		finally {
			manager.close();
		}
	}

	public User getUserById(int userId) {

		EntityManager manager = EMFSingleton.getFactory().createEntityManager();
		EntityTransaction transaction = manager.getTransaction();
		transaction.begin();

		User user = manager.find(User.class, userId);

		transaction.commit();
		manager.close();

		return user;
	}

	public User getUserByEmailAndPassword(String email, String password) {
		EntityManager manager = EMFSingleton.getFactory().createEntityManager();

		User user = null;
		try {
			TypedQuery<User> query = manager.createQuery("FROM User WHERE email= :email AND password=:password",User.class);
			query.setParameter("email", email);
			query.setParameter("password", password);
			
			user = query.getSingleResult();

		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			manager.close();
			return user;
		}
	}

//	public List<User> findAllUsers() {
//
//		EntityManager manager = EMFSingleton.getFactory().createEntityManager();
//
//		CriteriaBuilder builder = manager.getCriteriaBuilder();
//		CriteriaQuery<User> criteriaQuery = builder.createQuery(User.class);
//		Root<User> root = criteriaQuery.from(User.class);
//
//		List<User> users = manager.createQuery(criteriaQuery).getResultList();
//
//		manager.close();
//		return users;
//	}
}

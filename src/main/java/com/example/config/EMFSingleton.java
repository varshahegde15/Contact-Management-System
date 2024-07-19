package com.example.config;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class EMFSingleton {

	private static EntityManagerFactory factory;
	
	private EMFSingleton() {
//		private constructor to avoid instantiation;
	}
	
	public static synchronized EntityManagerFactory getFactory() {
		if(factory==null) {
			factory = Persistence.createEntityManagerFactory("abc");
		}
		return factory;
	}
	
}

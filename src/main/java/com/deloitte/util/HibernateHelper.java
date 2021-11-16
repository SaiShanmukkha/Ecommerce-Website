package com.deloitte.util;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateHelper {
	private static SessionFactory s;
	
	
	public static SessionFactory getInstance() {
		// one time activity
		// Reusable object
		// It is very expensive (from creation time perspective).
		if(s == null) {
		s = new Configuration()
				.configure("hibernate.cfg.xml")
				.buildSessionFactory();
		}
		return s;
	}
	
	
	
}

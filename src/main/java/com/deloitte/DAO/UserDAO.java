package com.deloitte.DAO;

import org.hibernate.Session;

import com.deloitte.entities.User;
import com.deloitte.util.HibernateHelper;

public class UserDAO {

	public User getUserByEmailAndPassword(String email, String password) {
		User u = null;
		Session s = HibernateHelper.getInstance().openSession();
		try {
			String qry = "from User where email =: e and password =: p";
			u = (User) s.createQuery(qry).setParameter("e", email).setParameter("p", password).uniqueResult();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			s.close();
		}
		return u;
	}

}

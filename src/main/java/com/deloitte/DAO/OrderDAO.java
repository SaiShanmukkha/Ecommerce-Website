package com.deloitte.DAO;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.deloitte.entities.Order;
import com.deloitte.entities.OrderedProducts;
import com.deloitte.util.HibernateHelper;

public class OrderDAO {
		private Session s;
		
		public OrderDAO() {
			s = HibernateHelper.getInstance().openSession();
		}
		
		public int saveOrder(Order o) {
			int orderId = 0;
			
			
			try {
				
				Transaction tx = s.beginTransaction();
				orderId = (int) s.save(o);								
				tx.commit();
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				s.close();
			}
			
			return orderId;
		}

		public int saveOrderedProducts(OrderedProducts op) {
			int opId = 0;
			try {
				Transaction tx = s.beginTransaction();
				opId = (int) s.save(op);
				tx.commit();
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				s.close();
			}
			
			return opId;
		}
}

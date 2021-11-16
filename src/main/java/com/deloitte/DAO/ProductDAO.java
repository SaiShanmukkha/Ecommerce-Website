package com.deloitte.DAO;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.deloitte.entities.Product;
import com.deloitte.util.HibernateHelper;

public class ProductDAO {
	private Session s;
public ProductDAO() {
	s = HibernateHelper.getInstance().openSession();
}
	public int saveProduct(Product p) {
		int pId = 0;
		
		try {
			Transaction tx = s.beginTransaction();
			pId = (int) s.save(p);
			tx.commit();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			s.close();
		}
		
		return pId;
	}
	
	
	public List<Product> fetchProducts(){
		List<Product> pl = null;
		try {
			// Writing HQL
			// Using Query
			// getResultList() - all the respective DB records for specific object.
			Query<Product> p = s.createQuery("from Product", Product.class);
			pl = p.getResultList();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			s.close();
		}
		
		return pl;
		
	}
	
	public List<Product> fetchProductsById(Integer catId){
		List<Product> pl = null;
		try {
			// Writing HQL
			// Using Query
			// getResultList() - all the respective DB records for specific object.
			Query<Product> p = s.createQuery("from Product as p where p.category.categoryId=:cid", Product.class);
			p.setParameter("cid", catId);
			pl = p.getResultList();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			s.close();
		}
		
		return pl;
	}
	
	public Product fetchProductsByPId(int pId) {
		Product p =null;
		
		try {
			p = s.get(Product.class, pId);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			s.close();
		}
		return p;
	}

}

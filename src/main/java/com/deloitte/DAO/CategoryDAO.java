package com.deloitte.DAO;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.deloitte.entities.Category;
import com.deloitte.util.HibernateHelper;

public class CategoryDAO {
	private Session s;
	public CategoryDAO() {
		this.s = HibernateHelper.getInstance().openSession();
	}
	
	
	public List<Category> fetchCategories(){
		List<Category> lst = null;
		try {
			// Getting Categories from Database
		Query<Category> q= this.s.createQuery("from Category", Category.class);
		lst = q.getResultList();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			s.close();
		}		
		return lst; 
	}
	
	public Category fetchCategoryById(int catId) {
		// Retrieve Category Object by Id from Database
		Category c = null;
		try {
		c = s.get(Category.class, catId);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			s.close();
		}
		return c;
		
	}
	
	public int saveCategory(Category c) {
		int catId = 0;
		try {
			
			Transaction tx = s.beginTransaction();
			catId = (int) s.save(c);
			tx.commit();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			s.close();
		}
		
		return catId;
	}
}

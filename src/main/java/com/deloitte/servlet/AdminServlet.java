package com.deloitte.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.deloitte.DAO.CategoryDAO;
import com.deloitte.DAO.ProductDAO;
import com.deloitte.entities.Category;
import com.deloitte.entities.Product;
@MultipartConfig
public class AdminServlet extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;


	public AdminServlet() {
		
	}
	
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html");
		HttpSession hs = request.getSession();

		CategoryDAO cDao = new CategoryDAO();
		ProductDAO pDao = new ProductDAO();
		
		try(PrintWriter out = response.getWriter()){
			
			String operation = request.getParameter("operation");
			
			
			if(operation != null && "addCategory".equals(operation)) {
				
				String catTitle = request.getParameter("catTitle");
				String catDescription = request.getParameter("catDescription");
				
				// Saving to DataBase
				Category c = new Category(catTitle,catDescription);
				int catId = cDao.saveCategory(c);
				
				hs.setAttribute("success", "Category Successfully added with id - "+catId);
				response.sendRedirect("admin.jsp");
				
			}else if(operation != null && "addProduct".equals(operation)) {
				
				String productName = request.getParameter("productName");
				String productDescription = request.getParameter("productDescription");
				int productPrice = Integer.parseInt(request.getParameter("productPrice"));
				int productDiscount = Integer.parseInt(request.getParameter("productDiscount"));
				int productQuantity =Integer.parseInt( request.getParameter("productQuantity"));
				
				// File Management in JSP
				
				Part part = request.getPart("productImage");
				String partHeader = part.getHeader("content-disposition");
				System.out.println("partHeader = "+ partHeader);
				
				
				String fileNameWithPath = null;
	        	for(String content:partHeader.split(";")) {
	        		if(content.trim().startsWith("filename"))
	        		{
	        			fileNameWithPath = content.substring(content.indexOf("=")+1).trim().replace("\"", "");
	        		}
	        	}
	        	Path pa = Paths.get(fileNameWithPath);
	        	Path fileName = pa.getFileName();
	        	
	        	//gets the context of the serlvet
	        	String imgPath = request.getServletContext()
	        			.getRealPath("images")
	        			+File.separator+"products"
	        			+File.separator+fileName;
	        	
	        	//IO Package which has classes that read/write data and read/write files
	        	//FileInputStream -> Read Files as Stream
	        	//FileOutputStream -> Write data
	        	try(InputStream is = part.getInputStream();
	        			FileOutputStream fos = new FileOutputStream(imgPath);)
	        	{
	        		//creating an empty byte array with <FileSize>
	        		byte [] data = new byte[is.available()];
	        		
	        		//Reading the data from is and putting it in byte array
	        		is.read(data);
	        		//writing the byte array to output stream specified.
	        		fos.write(data);
	        	}
	        	catch(Exception e)
	        	{
	        		e.printStackTrace();
	        	}
	        	finally
	        	{
	        		
	        	}
	        	
	        	
				// Fetch Category Object using Category ID
				int catID = Integer.parseInt(request.getParameter("catId"));
				Category c = cDao.fetchCategoryById(catID);
			
				Product p = new Product(productName,fileNameWithPath, productDescription,productPrice,productQuantity,productDiscount,c);
				
				int pId = pDao.saveProduct(p);
				if(pId>0) {
					hs.setAttribute("success", "Product Added Successfully with id - "+pId);
				}else {
					hs.setAttribute("warning", "Failed to add Product.");
				}
				
				response.sendRedirect("admin.jsp");
			}			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
}

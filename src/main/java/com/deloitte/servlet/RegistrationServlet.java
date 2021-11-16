package com.deloitte.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.deloitte.entities.User;
import com.deloitte.util.HibernateHelper;

/**
 * Servlet implementation class RegistrationServlet
 */
//@WebServlet(urlPatterns={"/RegistrationServlet"})
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		// IO Operator
		Session s = null;
		HttpSession httpSession = request.getSession();
		try (PrintWriter pw = response.getWriter()) {
			String userName = request.getParameter("userName");
			String emailId = request.getParameter("emailId");
			String password = request.getParameter("password");
			String phone = request.getParameter("phone");
			String address = request.getParameter("address");

			// Server Side Validation
			if (userName.isEmpty()) {
				pw.println("Name is Blank");
				return;
			}
				// pw.close(); // we need to close manually if we don't use resource in try()
				
			// Object to hold data Entity(hibernate)/POJO/DTO/MODEL
				User u = new User(userName, emailId, password, phone, "default.jpg", address, "enduser");
				
				// Create Hibernate Session from SessionFactory
				
				s = HibernateHelper.getInstance().openSession();
				Transaction tx = s.beginTransaction();  
				
				int uId = (int) s.save(u);
				
				tx.commit();
				
				
				
//				pw.println("<h2>User Successfully Registered</h2><br/>");
//				pw.println("Use ID generated - "+uId);
				
				String msg = "User Successfully Registered. UserId = " + uId;
				httpSession.setAttribute("success", msg);
				response.sendRedirect("registration.jsp");
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {

			s.close();
		}
	}
	}










package com.deloitte.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.deloitte.DAO.UserDAO;
import com.deloitte.entities.User;

/**
 * Servlet implementation class LoginServlet
 */
//@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession hs = request.getSession();
		response.setContentType("text/html");
		
		try(PrintWriter out = response.getWriter()){
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			// ServerSide Validation
			if(email.isEmpty()) {
				out.println("<h2>Email is Invalid</h2>");
				return;
			}
			
			
			// Authentication
			UserDAO userDAO = new UserDAO();
			User u = userDAO.getUserByEmailAndPassword(email,password);
			
			if(u==null) {
				// Warning
				hs.setAttribute("warning", "Invalid Credentials");
				response.sendRedirect("login.jsp");
				return;
			}else {
				// redirect to homePage or adminPage
				hs.setAttribute("current-user", u);
				// Role based Navigation
				if(u.getRole().equals("enduser")) {
					response.sendRedirect("homePage.jsp");
					return;
				}else if(u.getRole().equals("admin")) {
					response.sendRedirect("admin.jsp");
				}else {
					out.println("<h1>No role assigned for you. Please contact Administrator.</h1>");
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}

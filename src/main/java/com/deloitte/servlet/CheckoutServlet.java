package com.deloitte.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.Arrays;
import java.util.Random;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.deloitte.DAO.OrderDAO;
import com.deloitte.DAO.ProductDAO;
import com.deloitte.entities.Order;
import com.deloitte.entities.OrderedProducts;
import com.deloitte.entities.Product;
import com.deloitte.entities.User;

public class CheckoutServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/html");
		HttpSession hs = request.getSession();

		try (PrintWriter out = response.getWriter()) {

			// step 1: Randomly generate order number
			Random r = new Random();
			int upperBound = 123456;
			int randomnbr = r.nextInt(upperBound);

			// step 2: Generate an order object
			// 2a: Order - orderNbr, uId, ordDate
			String orderNbr = "ORD-" + randomnbr;
			User u = (User) hs.getAttribute("current-user");
			int uId = u.getId();
			Date ordDate = Date.valueOf("2021-11-08");
			// 2b: Create order object
			Order o = new Order(orderNbr, uId, ordDate);

			// Step 3: Save in database
			// 3a: Create orderDAO - saveOrder()
			OrderDAO oDao = new OrderDAO();
			int isSaved = oDao.saveOrder(o);

			System.out.println("Created and Saved Successfully with orderNbr: " + orderNbr + " with Id: " + isSaved);

			// outcome - order number that could be displayed for user
			hs.setAttribute("orderNbr", orderNbr);

			// *************persisting product details*******************
			// (pricePerUnit, qty, id) against created order

			// step1: need to get all the ordered product details from checkout page
			// request.getParameterValues()

			String[] valuesFromJSP = request.getParameterValues("productDetails");
			System.out.println("######:" + Arrays.toString(valuesFromJSP));

			// step2: Loop through
			for (String str : valuesFromJSP) {
				String[] productSplitValues = str.split("@");
				// step 2a: set the values(of each ordered product)

				// productSplitValuesl[0] -> id
				// productSplitValuesl[1] -> name
				// productSplitValuesl[2] -> discountedPrice
				// productSplitValuesl[3] -> Quantity
				// productSplitValuesl[4] -> totalPrice

				OrderedProducts op = new OrderedProducts();
				// step2b: set the values(of each ordered product)
				// product
				// method1: goto DB based on ID and get product Object
				Product p = new ProductDAO().fetchProductsByPId(Integer.parseInt(productSplitValues[0]));
				// method2: prepare product object using the order/checkout details.
				// Mostly use method 1.
				// Order [already created above]
				op.setOrder(o);

				op.setProduct(p);
				// PricePerUnit
				op.setDiscountedPrice(Integer.parseInt(productSplitValues[2]));
				// quantity
				op.setQuantity(Integer.parseInt(productSplitValues[3]));
				// step 3: use a DAO of product / order.
				OrderDAO od = new OrderDAO();
				int opId = od.saveOrderedProducts(op);
				System.out.println("Order Saved with ID: "+ opId);

			}

			response.sendRedirect("orderDetails.jsp");

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}

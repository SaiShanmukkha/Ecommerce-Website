<%@page import="com.deloitte.entities.Product"%>
<%@page import="com.deloitte.DAO.ProductDAO"%>
<%@page import="com.deloitte.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.deloitte.DAO.CategoryDAO"%>
<%@page import="com.deloitte.entities.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
User u = (User) session.getAttribute("current-user");
if (u == null) {
	session.setAttribute("warning", "You are not Logged in.");
	response.sendRedirect("login.jsp");
	return;
}
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>EcomApp | HomePage</title>
<%@ include file="components/common.jsp"%>
</head>




<body>
	<%@ include file="components/navbar.jsp"%>
	<!-- Adding Response Component -->
	<%@include file="components/response.jsp"%>


	<%
	String catId = request.getParameter("category");

	ProductDAO pDao = new ProductDAO();
	List<Product> pl = null;

	//Senario1: on Page Load after successful login
	//Senario2: After clicking All Products tab
	if ("" == catId || null == catId || catId.equals("All")) {
		pl = pDao.fetchProducts();
	} else {
		pl = pDao.fetchProductsById(Integer.parseInt(catId));
	}

	CategoryDAO cDao = new CategoryDAO();
	List<Category> c1 = cDao.fetchCategories();
	%>
	<div class="container-fluid">

		<div class="row mt-3 mx-2">
			<div class="col-md-2">
				<div class="list-group">

					<%
					String isAllProductsActive = "";
					if ("All".equals(catId) || "".equals(catId) || null == catId) {
						isAllProductsActive = "active";
					}
					%>

					<a href="homePage.jsp?category=All"
						class="list-group-item list-group-item-action <%=isAllProductsActive%>">All
						Products</a>
					<%
					String categoryActive = "";
					for (Category c : c1) {
						if (!isAllProductsActive.equals("active") && c.getCategoryId() == Integer.parseInt(catId)) {
							categoryActive = "active";
						} else {
							categoryActive = "";
						}
					%>
					<a href="homePage.jsp?category=<%=c.getCategoryId()%>"
						class="list-group-item list-group-item-action <%=categoryActive%>"><%=c.getTitle()%></a>
					<%
					}
					%>
				</div>
			</div>



			<div class="col-md-10">

				<div class="row">
					<div class="col-md-12">
						<div class="card-columns">
							<%
							if (null != pl && !pl.isEmpty()) {
								for (Product p : pl) {
							%>
							<div class="card product-card">
								<div class="card-body text-center">
								<div class="container">
									<img style="max-height:200px; max-width:100%;width:auto" class="img-fluid" src="images/products/<%=p.getProductImage()%>"
										alt="<%=p.getProductName()%>>">
									</div>
									<div class="container">
										<h5><%=p.getProductName().substring(0,45)%></h5>
										<p><%=p.getProductDescription()%></p>
									</div>
								</div>

								<div class="card-footer ">
									<button class="btn custom-bg text-white" onclick="add_to_cart(<%=p.getProductId() %>, '<%=p.getProductName() %>', <%=p.getDiscountedPrice()%>)">Add to Cart</button>
									<button class="btn btn-outline-success">
									&#8377;<%=p.getDiscountedPrice() %>
										<span style="text-decoration: line-through;" class="text-secondary original-price">&#8377;<%=p.getProductPrice()%></span>
										<span class="text-secondary"><%=p.getProductDiscount()%>%</span>
									</button>
								</div>
							</div>

							<%
							}
							} else {
							%>
							<div class="card-body">
								<h5 class="card-title" style="max-height: 125px">No
									products to display</h5>
							</div>
							<%
							}
							%>

						</div>


					</div>
				</div>

			</div><!-- Display products -->
		</div><!-- End of class row -->


	</div><!-- End of container -->
	
	<%@include file="components/common_modal.jsp" %>
	
</body>
</html>
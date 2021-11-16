<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
	<%@page import="com.deloitte.entities.User"%>
	<% User u1 = (User) session.getAttribute("current-user"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-light custom-bg" >
		<h2><a class="navbar-brand" href="index.jsp">EcomApp</a></h2>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link font-weight-bold" href="homePage.jsp">Home
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item active dropdown"><a
					class="nav-link dropdown-toggle font-weight-bold" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> Categories </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">Laptops</a> <a
							class="dropdown-item" href="#">Mobiles</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Headphones</a>
						<a class="dropdown-item" href="#">Watches</a>
					</div></li>
				<li class="nav-item active"><a class="nav-link font-weight-bold" href="#">About</a>
				</li>
			</ul>
			<ul class="navbar-nav ml-auto">
					<li class="nav-item active" style="font-size: 22px">
					<a class="nav-link"  href=""  data-toggle="modal" data-target="#cart"  onclick="updateCart();"><i class="fas fa-shopping-cart"></i>
					<span class="cart-items">(0)</span></a>
					</li>
					
					<% if(null==u1){ %>
					<li class="nav-item active font-weight-bold">
					<a class="nav-link"  href="login.jsp">Login</a>
					</li>
					<li class="nav-item active font-weight-bold">
					<a class="nav-link"  href="registration.jsp">Sign up</a>
					</li>
					<%}else { %>
					<li><li class="nav-item active">
					<a class="nav-link font-weight-bold" href=""<%=u1.getRole().equals("admin") ? "admin.jsp":"homePage.jsp"%>>welcome: <%=u1.getName() %></a>
					</li>
					<li class="nav-item active">
					<a class="nav-link font-weight-bold active"  href="LogoutServlet">Logout</a>
					</li>
					<% } %>
					
			</ul>
			
		</div>
	</nav>
</body>
</html>
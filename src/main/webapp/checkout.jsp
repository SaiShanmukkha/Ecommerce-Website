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
<title>Checkout Cart</title>
<%@ include file="components/common.jsp"%>
</head>
<body>
	<%@ include file="components/navbar.jsp"%>

	<div class="container-fluid">
	<form action="CheckoutServlet" method="Post" autocomplete="off">
		<div class="row mt-5">
			<div class="col md-9">
				<div class="card">
					<div class="card-title custom-bg text-white p-2">
						<h3>Your Cart items:</h3>
					</div>
					<div class="card-body">

						<div class="cart-body"></div>
					</div>

				</div>
			</div>
			
			
			<!-- Details Form -->

			<div class="col-md-3">
				<div class="card">
					<div class="card-title custom-bg text-white p-2">
						<h3>Checkout Details:</h3>
					</div>
					<div class="card-body">
					
						
							<div class="form-group">
								<label for="name">User Name</label> <input type="text"
									class="form-control" id="name" name="userName"
									placeholder="Enter  UserName..." value="<%=u.getName()%>"
									required>
							</div>
							<div class="form-group">
								<label for="emailId">Email address</label> <input type="email"
									class="form-control" id="emailId" name="emailId"
									placeholder="Enter Email..." value="<%=u.getEmail()%>"
									required>
							</div>
							<div class="form-group">
								<label for="phone">Phone Number</label> <input type="tel"
									class="form-control" id="phone" name="phone"
									value="<%=u.getPhone()%>" placeholder="Enter Phone Number..."
									required>
							</div>
							<div class="form-group">
								<label for="address">User Address</label>
								<textarea class="form-control" id="address" name="address"
									placeholder="Enter  Address..." required><%=u.getAddress() %></textarea>
							</div>
							<div class="container text-center">
								<button type="button" class="btn btn-outline-primary" onclick="gotoHomePage();" >shop more</button>
								<button type="submit" class="btn btn-outline-success">Order</button>
							</div>
						

					</div>
				</div>
			</div>
		</div>
		</form>
	</div>
</body>
</html>
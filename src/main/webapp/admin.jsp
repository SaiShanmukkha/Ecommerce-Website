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
} else if (u.getRole().equals("enduser")) {
	session.setAttribute("warning", "You are not administrator. You dont have access to this Page.");
	response.sendRedirect("homePage.jsp");
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>EcomApp | AdminPage</title>
<%@ include file="components/common.jsp"%>
</head>


<body>


	<%@ include file="components/navbar.jsp"%>
	<div class="mt-3">
		<%@ include file="components/response.jsp"%>
	</div>



	<div class="container admin">

		<!--  First Row -->
		<div class="row mt-3">

			<div class="col-md-4">
				<div class="card border-dark">
					<div class="card-body text-center">
						<div class="container">
							<img src="images/users.png" class="img-fluid rounded-circle"
								alt="Users_Logo" width="120px">
						</div>
						<h3 class="mt-2">12345</h3>
						<h2 class="text-uppercase text-muted">Users</h2>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card border-dark">
					<div class="card-body text-center">
						<div class="container">
							<img src="images/categories.png" class="img-fluid rounded-circle"
								alt="Users_Logo" width="120px">
						</div>
						<h3 class="mt-2">12345</h3>
						<h2 class="text-uppercase text-muted">CATEGORIES</h2>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card border-dark">
					<div class="card-body text-center">
						<div class="container">
							<img src="images/products.png" class="img-fluid rounded-circle"
								alt="Users_Logo" width="120px">
						</div>
						<h3 class="mt-2">12345</h3>
						<h2 class="text-uppercase text-muted">PRODUCTS</h2>
					</div>
				</div>
			</div>






		</div>

		<!-- Second Row -->
		<div class="row mt-3 offset-md-2">
			<div class="col-md-4">
				<div class="card border-dark" data-toggle="modal"
					data-target="#add_category_modal">
					<div class="card-body text-center">
						<div class="container">
							<img src="images/add_category.png"
								class="img-fluid rounded-circle" alt="Users_Logo" width="120px">
						</div>
						<h3 class="text-uppercase text-muted">ADD CATEGORY</h3>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card border-dark">
					<div class="card-body text-center" data-toggle="modal"
						data-target="#add_product_modal">
						<div class="container">
							<img src="images/add_product.png"
								class="img-fluid rounded-circle" alt="Users_Logo" width="120px">
						</div>
						<h3 class="text-uppercase text-muted">ADD PRODUCT</h3>
					</div>
				</div>
			</div>

		</div>

	</div>


	<!-- Add Category Modal -->
	<div class="modal fade" id="add_category_modal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header custom-bg text-white">
					<h5 class="modal-title" id="exampleModalLabel">Add Category</h5>
					<button type="button" class="close text-white" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<!-- Modal Body -->
				<div class="modal-body">
					<form action="AdminServlet" method="Post"  autocomplete="off">
						<input type="hidden" name="operation" value="addCategory">
						<div class="form-group">
							<label for="catTitle" class="font-weight-bold">Category
								Title</label> <input type="text" class="form-control" id="catTitle"
								name="catTitle" placeholder="Enter Category Title..." required>
						</div>
						<div class="form-group">
							<label for="catDescription" class="font-weight-bold">Category
								Description</label>
							<textarea class="form-control" id="catDescription"
								style="height: 150px" name="catDescription"
								placeholder="Enter  Category Details..." required></textarea>
						</div>
						<!-- Modal Footer -->
						<div class="modal-footer">
							<button type="button" class="btn btn-outline-secondary"
								data-dismiss="modal">Close</button>
							<button type="submit" class="btn btn-outline-success">Add</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- Add Product Modal -->
	<div class="modal fade" id="add_product_modal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header custom-bg text-white">
					<h5 class="modal-title" id="exampleModalLabel">Add Product</h5>
					<button type="button" class="close text-white" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<!-- Modal Body -->
				<div class="modal-body">
					<form action="AdminServlet" method="Post" autocomplete="off" enctype="multipart/form-data">
					
						<input type="hidden" name="operation" value="addProduct" >

						<div class="form-group">
							<label for="productName" class="font-weight-bold">Product
								Name</label> <input type="text" class="form-control" id="productName"
								name="productName" placeholder="Enter Product Name..." required>
						</div>

						<div class="form-group">
							<label for="productDescription" class="font-weight-bold">Product
								Description</label>
							<textarea class="form-control" id="productDescription"
								style="height: 100px" name="productDescription"
								placeholder="Enter  Product Details..." required></textarea>
						</div>

						<div class="form-group">
							<label for="productPrice" class="font-weight-bold">Product
								Price</label> <input type="number" class="form-control"
								id="productPrice" name="productPrice"
								placeholder="Enter Product Price..." required>
						</div>

						<div class="form-group">
							<label for="productDiscount" class="font-weight-bold">Product
								Discount</label> <input type="number" class="form-control"
								id="productDiscount" name="productDiscount"
								placeholder="Enter Product Discount..." required>
						</div>

						<div class="form-group">
							<label for="productQuantity" class="font-weight-bold">Product
								Quantity</label> <input type="number" class="form-control"
								id="productQuantity" name="productQuantity"
								placeholder="Enter Product Quantity..." required>
						</div>


						<%
						// First Fetching available Categories in DataBase
						CategoryDAO cDao = new CategoryDAO();
						List<Category> lst = cDao.fetchCategories();
						%>
						<div class="form-group">
							<label for="catId" class="font-weight-bold">Select
								Category</label> <select class="form-control" id="catId" name="catId">
								<%
								for (Category c : lst) {
								%>
								<option value="<%=c.getCategoryId()%>"><%=c.getTitle()%></option>
								<%
								}
								%>
							</select>
						</div>

						<div class="form-group">
							<label for="productImage" class="font-weight-bold">Upload
								Product Image</label> <input type="file" class="form-control"
								id="productImage" name="productImage"
								placeholder="Upload Product Image..." >
						</div>
						<!-- Modal Footer -->
						<div class="modal-footer">
							<button type="button" class="btn btn-outline-secondary"
								data-dismiss="modal">Close</button>
							<button type="submit" class="btn btn-outline-success">Add</button>
						</div>
					</form>
				</div>


			</div>

		</div>
	</div>

</body>
</html>



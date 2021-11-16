<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>EcomApp Registration Page</title>
<%@ include file="components/common.jsp"%>
<style>
.custom-bg {
	background-color: #f4511e !important;
}

</style>
</head>
<body>
	<div class="container-fluid">

		<div class="row mt-5">

			<div class="col-md-4 offset-md-4">
				<div class="card">
					<%@include file="components/response.jsp"%>


					<div class="card-header  custom-bg">
						<h2>Registration Form</h2>
					</div>
					<div class="card-body">
						<h4 class="text-center my-3">Please Fill Form Details</h4>


						<form action="RegistrationServlet" method="Post" autocomplete="off">
							<div class="form-group">
								<label for="name">User Name</label> <input type="text"
									class="form-control" id="name" name="userName"
									aria-describedby="nameHelp" placeholder="Enter  UserName..."
									required> <small id="nameHelp"
									class="form-text text-muted">UserName is mandatory for
									future Login</small>
							</div>
							<div class="form-group">
								<label for="emailId">Email address</label> <input type="email"
									class="form-control" id="emailId" name="emailId"
									aria-describedby="emailHelp" placeholder="Enter Email..."
									required> <small id="emailHelp"
									class="form-text text-muted">Enter Email Id for further
									communications.</small>
							</div>
							<div class="form-group">
								<label for="password">User Password</label> <input
									type="password" class="form-control" id="password"
									name="password" aria-describedby="passwordHelp"
									placeholder="Enter Password..." required> <small
									id="passwordHelp" class="form-text text-muted">Please
									remember your password.</small>
							</div>
							<div class="form-group">
								<label for="phone">Phone Number</label> <input type="tel"
									class="form-control" id="phone" name="phone"
									aria-describedby="phoneHelp"
									placeholder="Enter Phone Number..." required> <small
									id="phoneHelp" class="form-text text-muted">Please
									provide your contact number.</small>
							</div>
							<div class="form-group">
								<label for="address">User Address</label>
								<textarea class="form-control" id="address" name="address"
									aria-describedby="addressHelp" placeholder="Enter  Address..."
									required></textarea>
								<small id="addressHelp" class="form-text text-muted">Enter
									precise address for delivery</small>
							</div>

							<div class="container text-center">
								<button type="submit" class="btn btn-outline-success">Register</button>
								<button type="reset" class="btn btn-outline-warning">Reset</button>
							</div>
						</form>
					</div>

				</div>
			</div>

		</div>



	</div>
</body>
</html>
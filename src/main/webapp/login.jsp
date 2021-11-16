<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>EcomApp Login Page</title>
<style>
.custom-bg {
	background-color: #f4511e !important;
}

</style>
</head>
<body>

	<%@ include file="components/common.jsp"%>
	<div class="container">
		<div class="row mt-5">
			<div class="col-md-6 offset-md-3">
				<div class="card">
				<%@include file="components/response.jsp"%>
					<div class="card-header custom-bg"><h2>Login Form</h2></div>
					<div class="card-body">
						<form action="LoginServlet" method="Post" autocomplete="off">
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1" name="email"
									aria-describedby="emailHelp" placeholder="Enter email" required>
								<small id="emailHelp" class="form-text text-muted">We'll
									never share your email with anyone else.</small>
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1" name="password"
									placeholder="Password" required>
							</div>
							<div class="form-group text-center">
								<span>Don't have an account?&nbsp;</span><a href="registration.jsp">Click here</a>									
							</div >
							<div class="text-center">
							<button type="submit" class="btn btn-primary">Submit</button>
							<button type="reset" class="btn btn-danger">Reset</button>
						</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
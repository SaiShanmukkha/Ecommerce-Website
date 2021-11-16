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
<title>EcomApp | OrderDetails</title>
<%@ include file="components/common.jsp"%>
</head>
<body>
<%@ include file="components/navbar.jsp"%>
<h1>DATA SUCCESS</h1>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>JSP Fundamentals</title>
</head>
<body>
<p><%!
double getInterest(double amount) {
	return amount * 0.05;
}
%></p>

<p>The interest of 5000 is: <%= getInterest(5000) %></p>
</body>
</html>
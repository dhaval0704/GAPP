<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Users</title>
</head>
<body>
	<table border="1" style="text-align: center" cellpadding="5"
		cellspacing="0">
		<tr>
			<th>ID</th>
			<th>First Name</th>
			<th>Last Name</th>
			<th>Email ID</th>
			<th>User Type</th>
		</tr>
		<c:forEach items="${users}" var="user">
			<tr>
				<td>${user.userId}</td>
				<td>${user.userfirstName}</td>
				<td>${user.userlastName}</td>
				<td>${user.email}</td>
				<td>${user.userType}</td>

			</tr>
		</c:forEach>
	</table>
</body>
</html>

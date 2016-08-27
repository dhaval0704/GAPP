<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Students</title>
</head>
<body>
	<table border="1" style="text-align: center" cellpadding="5"
		cellspacing="0">
		<tr>
			<th>ID</th>
			<th>Email ID</th>
			<th>CIN</th>
			<th>Phone Number</th>
			<th>Gender</th>
			<th>Date Of Birth</th>
		</tr>
		<c:forEach items="${students}" var="student">
			<tr>
				<td>${student.studentId}</td>
				<td>${student.user.email }</td>
				<td>${student.cin}</td>
				<td>${student.phoneNumber}</td>
				<td>${student.gender}</td>
				<td>${student.dateOfBirth}</td>

			</tr>
		</c:forEach>
	</table>

</body>
</html>
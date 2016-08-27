<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Applications</title>
</head>
<body>
	<table border="1" style="text-align: center;" cellpadding="5"
		cellspacing="0">
		<tr>
			<th>ID</th>
			<th>Term</th>
			<th>Program Name</th>
			<th>Student Name</th>
		</tr>
		<c:forEach items="${applications}" var="application">
			<tr>
				<td>${application.applicationId}</td>
				<td>${application.term}</td>
				<td>${application.prg.programName}</td>
				<td>${application.stu.user.userfirstName}</td>
			</tr>
		</c:forEach>
	</table>


</body>
</html>
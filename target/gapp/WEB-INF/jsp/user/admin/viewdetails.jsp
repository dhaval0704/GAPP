<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Details of Department</title>
<link rel="stylesheet" href="../../css/bootstrap1.min.css">
<script src="../../js/bootstrap.min.js"></script>

</head>
<body>

	<h4>
		<a style="color:#2187A0;font-weight: bold" href="<c:url value='/user/admin/managedepartments.html'/>">Back
			to Manage Departments</a>
	</h4>
	<div style="text-align: right; padding-right: 50px; font-size: 20px;">
		${sessionScope.userName} <a style="color:#2187A0;font-weight: bold" href="/gapp/user/admin/logout.html"> Logout</a>

	</div>


	<div class="panel panel-primary" style="width:95%;margin-left: 20px;">
		<div class="panel-heading">
			<h3 class="panel-title">Department List With All Details</h3>
		</div>


		<table cellpadding="5" cellspacing="0" class="table" style="width:97%; align: left; margin-left: 10px; margin-top: 30px">
			<tr>
				<th>ID</th>
				<th>Department Name</th>
				<th>Programs</th>
				<th>Additional Requirements</th>
				<th>Additional Requirement Field Type</th>
				<th>Is required</th>
			</tr>

			<tr>
				<td>${departmentdetails.departmentId}</td>
				<td>${departmentdetails.departmentName}</td>
				<td><c:forEach items="${programdetails}" var="program">
						<br>
			${program.programName}
			
			<br>
					</c:forEach></td>
				<td><c:forEach items="${additionaldetails}"
						var="additionalfield">
						<br>
			${additionalfield.fieldName}
			
			<br>
					</c:forEach></td>
				<td><c:forEach items="${additionaldetails}"
						var="additionalfield">
						<br>
			${additionalfield.fieldType}
			
			<br>
					</c:forEach></td>
				<td><c:forEach items="${additionaldetails}"
						var="additionalfield">
						<br>
			${additionalfield.required}
			
			<br>
					</c:forEach></td>
			</tr>
		</table>

	</div>


</body>
</html>
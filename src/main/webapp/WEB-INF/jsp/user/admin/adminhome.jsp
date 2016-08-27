<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="../../css/bootstrap.min.css">
<script src="../../js/bootstrap.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Home Page</title>


</head>
<body>


	<div>
		<div style="text-align: center;">
			<h2 class="text-primary">Welcome To Admin Home Page</h2>
		</div>
		<div style="text-align: right; padding-right: 30px; font-size: 22px;">
			${sessionScope.userName} <a href="/gapp/user/login.html">
				Logout</a>

		</div>

	</div>
	<ul class="nav nav-pills nav-stacked">
		<li class="active"><a href="#">Home</a></li>
		<li><a href="<c:url value='/user/admin/managedepartments.html'/>">Manage
				Departments</a></li>
		<li><a href="#">Manage Users</a></li>

	</ul>

</body>
</html>
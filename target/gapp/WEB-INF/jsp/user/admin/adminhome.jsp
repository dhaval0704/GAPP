<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="../../css/bootstrap1.min.css">
<script src="../../js/bootstrap.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Home Page</title>


</head>
<body>


	<div style="width:95%;margin-left: 30px;" >
		<div style="text-align: center;">
			<h2 class="text-primary">Welcome To Admin Home Page</h2>
		</div>
		<div style="text-align: right; padding-right: 30px; font-size: 22px;">
			${sessionScope.userName} <a style="color:#2187A0;font-weight: bold" href="/gapp/user/admin/logout.html">
				Logout</a>

		</div>

	</div>
	<ul class="nav nav-pills nav-stacked" style="width:95%;margin-left: 30px;margin-top:20px">
		<li class="active"><a href="#">Home</a></li>
		<li><a style="color:#2187A0;font-weight: bold" href="<c:url value='/user/admin/managedepartments.html'/>">Manage
				Departments</a></li>
		<li><a style="color:#2187A0;font-weight: bold" href="#">Manage Users</a></li>

	</ul>

</body>
</html>
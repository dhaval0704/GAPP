<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Manage Departments</title>
<link rel="stylesheet" href="../../css/bootstrap.min.css">
<script src="../../js/bootstrap.min.js"></script>

</head>
<body>
	<div>
		<div style="text-align: center">
			<h2 class="text-primary">Manage Departments</h2>
		</div>
		
	</div>

	<div style="height: 30px"></div>
	<div style="padding-left: 20px 20px 20px 20px">
		<div>
		
		<div style="text-align: right; font-size: 20px; padding-right: 20px;">
				${sessionScope.userName} <a href="/gapp/user/login.html">
					Logout</a>

			</div>
		
			<div style="padding-left: 15px">
				<h4>
					<a href="<c:url value='/user/admin/addnewdepartment.html'/>">Add
						New Department</a> | <a
						href="<c:url value='/user/admin/addnewprogram.html'/>">Add New
						Program</a> | <a
						href="<c:url value='/user/admin/addnewadditionaldetail.html'/>">Add
						New Additional Detail</a>
				</h4>
			</div>
					</div>
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title">Department List</h3>
			</div>

			<table style="text-align: center" cellpadding="5" class="table"
				cellspacing="0">
				<tr>
					<th style="text-align: center">ID</th>
					<th style="text-align: center">Department Name</th>
					<th style="text-align: center">Number of Programs Offered</th>
					<th></th>
					<th></th>
					<th></th>
				</tr>
				<c:forEach items="${departments}" var="dept" varStatus="i">
					<tr>
						<td>${dept.departmentId}</td>
						<td>${dept.departmentName}</td>
						<c:forEach items="${prgcountbydepartment}" var="prgcount">
							<c:if test="${dept.departmentId==prgcount.prgDeptId}">
								<td>${prgcount.count}</td>
							</c:if>
						</c:forEach>
						<td><a href="viewdetails.html?id=${dept.departmentId}">
								View Details</a></td>
						<td><a href="editdepartment.html?id=${dept.departmentId}">
								Edit Department </a></td>
						<td><a href="editprogram.html?id=${dept.departmentId}">
								Edit Program </a></td>
						<td><a
							href="editadditionaldetail.html?id=${dept.departmentId}">
								Edit Additional Detail </a></td>
					</tr>
				</c:forEach>
			</table>
		</div>



	</div>



</body>
</html>
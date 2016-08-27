<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Program</title>

<link rel="stylesheet" href="../../css/bootstrap.min.css">
<script src="../../js/bootstrap.min.js"></script>

</head>
<body>
	<form:form modelAttribute="department">
		<div class="container">
			<div style="text-align: right; padding-right: 30px; font-size: 22px;">
				${sessionScope.userName} <a href="/gapp/user/login.html">
					Logout</a>

			</div>

			<div style="text-align: left;">
				<h2 class="text-primary">Add/Remove Program</h2>
			</div>

			<table cellspacing="5px" cellpadding="5px"
				class="table table-bordered"
				style="width: 300px; align: center; margin-left: 30px; margin-top: 30px">
				<tr>
					<td>
						<div class="form-group">
							<label for="departmentName">Department Name : </label> <select
								name="ddldepartment" class="form-control">

								<option value="${department.departmentId}">${department.departmentName}</option>
							</select>

						</div>
					</td>
				</tr>

				<tr>
					<td>
						<div class="form-group">
							<label for="programName">Program Name : </label> <input
								type="text" name="programName" class="form-control"
								required="required"></input>
						</div>
					</td>
				</tr>

				<tr>
					<td><input type="submit" class="btn btn-primary btn-lg"
						name="addprogram" value="Add Program" /></td>
				</tr>
			</table>
		</div>
	</form:form>

	<div>


		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title">Program List For
					${department.departmentName}</h3>
			</div>

			<table style="text-align: center !important" cellpadding="5"
				class="table" cellspacing="0">
				<tr>
					<td><strong>ID</strong></td>
					<td><strong>Program Name</strong></td>
					<td></td>
				</tr>
				<c:forEach items="${programlist}" var="prg" varStatus="i">
					<tr>
						<td>${prg.programId}</td>
						<td>${prg.programName}</td>
						<td><a
							href="removeprogram.html?id=${prg.programId}&deptId=${department.departmentId}">
								Remove Program</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>
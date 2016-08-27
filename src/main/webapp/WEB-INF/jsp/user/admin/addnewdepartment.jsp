<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add New Department</title>
<link rel="stylesheet" href="../../css/bootstrap.min.css">
<script src="../../js/bootstrap.min.js"></script>
</head>
<body>
	<div style="float: left; width: 500px">
		<form:form modelAttribute="department">
			<div class="container">
			<h4>
					<a href="<c:url value='/user/admin/managedepartments.html'/>">Back
						to Manage Departments</a>
				</h4>
			
			<div
					style="text-align: right; padding-right: 30px; font-size: 22px;">
					${sessionScope.userName} <a href="/gapp/user/login.html">
						Logout</a>

				</div>
			
				<div style="text-align: left;">
					<h2 class="text-primary">Add New Department</h2>
				</div>
				
				<table cellspacing="5px" cellpadding="5px"
					class="table table-bordered"
					style="width: 300px; align: center; margin-left: 30px; margin-top: 30px">
					<tr>
						<td>
							<div class="form-group">
								<label for="departmentName">Department Name : </label>
								<form:input path="departmentName" class="form-control"
									id="txtdepartmentame" placeholder="Department Name" required="required"></form:input>
							</div>
						</td>
					</tr>
					<tr>
						<td><input type="submit" class="btn btn-primary btn-lg"
							name="adddepartment" value="Add Department" /></td>
					</tr>
				</table>
			</div>
		</form:form>
	</div>
	</body>
</html>
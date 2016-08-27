<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="../../css/bootstrap1.min.css">
<script src="../../js/bootstrap.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Department</title>
</head>
<body>
	<div style="float: left; width: 500px">
		<form:form modelAttribute="department">
			<div class="container">
				<div
					style="text-align: right; padding-right: 30px; font-size: 22px;">
					${sessionScope.userName} <a style="color:#2187A0;font-weight: bold" href="/gapp/user/admin/logout.html">
						Logout</a>

				</div>

				<div style="text-align: left;">
					<h2 class="text-primary">Edit Department</h2>
				</div>

				<table cellspacing="5px" cellpadding="5px"
					class="table table-bordered"
					style="width: 300px; align: center; margin-left: 30px; margin-top: 30px">
					<tr>
						<td>
							<div class="form-group">
								<label for="departmentName">Department Name : </label>
								<form:input path="departmentName" class="form-control"
									placeholder="Department Name" required="required"></form:input>
							</div>
						</td>
					</tr>
					<tr>
						<td><input type="submit" class="btn btn-primary btn-lg"
							name="editdepartment" value="Update" /></td>
					</tr>
				</table>
			</div>
		</form:form>
	</div>
</body>
</html>
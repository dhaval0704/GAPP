<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add New Program</title>
<link rel="stylesheet" href="../../css/bootstrap.min.css">
<script src="../../js/bootstrap.min.js"></script>

</head>
<body>
	<div>
		<form:form modelAttribute="program" action="addnewprogram.html">


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
					<h2 class="text-primary">Add New Program</h2>
				</div>

				
				<table cellspacing="5px" cellpadding="5px"
					class="table table-bordered"
					style="width: 300px; align: center; margin-left: 30px; margin-top: 30px">

					<tr>

						<td><label for="ddldepartmentName">Department Name :
						</label> <select name="ddldepartment" class="form-control">
								<c:forEach var="departments" items="${departments}">
									<option value="${departments.departmentId}">${departments.departmentName}</option>
								</c:forEach>
						</select></td>
					</tr>
					<tr>
						<td><div class="form-group">
								<label for="programName">Program Name : </label>
								<form:input path="programName" class="form-control"
									id="txtprogramName" placeholder="Program Name"
									required="required"></form:input>
							</div></td>
					</tr>
					<tr>

						<td><input type="submit" class="btn btn-primary btn-lg"
							name="addnewprogram" value="Add Program" /></td>
					</tr>
				</table>
			</div>
		</form:form>
	</div>

</body>
</html>
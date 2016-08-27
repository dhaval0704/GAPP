<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Additional Detail</title>
<link rel="stylesheet" href="../../css/bootstrap.min.css">
<script src="../../js/bootstrap.min.js"></script>

</head>
<body>
	<form:form modelAttribute="additionalfield">
		<div class="container">

			<div style="text-align: right; padding-right: 30px; font-size: 22px;">
				${sessionScope.userName} <a href="/gapp/user/login.html">
					Logout</a>

			</div>

			<div style="text-align: left;">
				<h2 class="text-primary">Add/Remove Additional Detail</h2>
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
							<label for="fieldName">Additional Requirement Name : </label> <input
								type="text" name="fieldName" class="form-control"
								required="required"></input>
						</div>
					</td>
				</tr>
				<tr>
					<td><label for="ddlTypeName">Field Type: </label> <select
						name="ddlTypeName" class="form-control">

							<option value="NUMBER">NUMBER</option>
							<option value="TEXT">TEXT</option>
							<option value="FILE">FILE</option>

					</select></td>
				</tr>
				<tr>
					<td><label for="ddlRequired"> Required Type: </label> <select
						name="ddlRequired" class="form-control">

							<option value="Mandatory">Mandatory</option>
							<option value="Optional">Optional</option>


					</select></td>
				</tr>

				<tr>
					<td><input type="submit" class="btn btn-primary btn-lg"
						name="addadditionaldetail" value="Add Additional Requirement" /></td>
				</tr>
			</table>
		</div>
	</form:form>

	<div>


		<form:form modelAttribute="additionalfield">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title">Additional Detail List For
						${department.departmentName}</h3>
				</div>

				<table style="text-align: center !important" cellpadding="5"
					class="table" cellspacing="0">
					<tr>
						<td><strong>ID</strong></td>
						<td><strong>Additional Requirement Name</strong></td>
						<td><strong>Additional Field Type</strong></td>
						<td><strong>Is Required</strong></td>
						<td></td>
					</tr>
					<c:forEach items="${reqlist}" var="req" varStatus="i">
						<tr>
							<td>${req.additionalFieldId}</td>
							<td>${req.fieldName}</td>
							<td>${req.fieldType}</td>
							<td><c:choose>
									<c:when test="${req.required==true}">Mandatory</c:when>
									<c:otherwise>
							Optional
							</c:otherwise>
								</c:choose></td>
							<td><a
								href="removeadditionaldetail.html?id=${req.additionalFieldId}&deptId=${department.departmentId}">
									Remove Additional Requirement</a></td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</form:form>
	</div>

</body>
</html>
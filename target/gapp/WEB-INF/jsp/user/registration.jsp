<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet" href="../css/bootstrap1.min.css">
<script src="../js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration</title>
<style type="text/css">
.alignright {
	text-align: right;
}
</style>
</head>
<body class="jumbotron">

	<form:form modelAttribute="user">
		<div class="container">
		<div style="padding: 10px 10px 10px 10px"> <a style="color:#2187A0;font-weight: bold" href="login.html"><h3>Back to Login</h3></a></div>
			<div style="text-align: center;">
				<h2 class="text-primary">GAPP Registration</h2>
				<h4 style="color: red">${sessionScope.error}</h4>
			</div>
			<table cellspacing="5px" cellpadding="5px"
				class="table table-bordered"
				style="width: 600px; align: center; margin: 0px auto; margin-top: 30px">

				<tr>
					<td>

						<div class="form-group">
							<label class="text-primary" style="font-size: 17px"
								for="firstname">First Name : </label>
							<form:input path="userfirstName" class="form-control"
								id="txtfirstname" placeholder="First Name" required="required"></form:input>
						</div>
					</td>


				</tr>
				<tr>
					<td>

						<div class="form-group">
							<label class="text-primary" style="font-size: 17px"
								for="lastname">Last Name : </label>
							<form:input path="userlastName" class="form-control"
								id="txtlastname" placeholder="Last Name" required="required"></form:input>
						</div>
					</td>


				</tr>
				<tr>
					<td>

						<div class="form-group">
							<label class="text-primary" style="font-size: 17px" for="email">Email
								: </label>
							<form:input path="email" class="form-control" id="txtemail"
								placeholder="Email" required="required"></form:input>
						</div>
					</td>


				</tr>

				<tr>
					<td>

						<div class="form-group">
							<label class="text-primary" style="font-size: 17px"
								for="password">Password : </label>
							<form:input path="password" type="password" class="form-control" id="txtpassword"
								placeholder="Password" required="required"></form:input>
						</div>
					</td>


				</tr>
				<tr>

					<td style="text-align: center"><input type="submit"
						name="register" class="btn btn-primary btn-lg" value="Register" /></td>
				</tr>
			</table>
		</div>
	</form:form>
</body>
</html>

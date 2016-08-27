<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

<link rel="stylesheet" href="../css/bootstrap1.min.css">
<script src="../js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Login</title>
<style type="text/css">
.alignright {
	text-align: right;
}
</style>
</head>
<body class="jumbotron">
	<div class="jumbotron">
		<form:form modelAttribute="user">
			<div class="container">
				<div style="text-align: center;" >
					
					<h2 class="text-primary">GAPP  Login</h2>
					<h4 style="color: red">${sessionScope.error}</h4>
				</div>
				<table cellspacing="5px" cellpadding="8"
					class="table table-bordered"
					style="width: 480px; align: center; margin: 0px auto; margin-top: 30px">

					<tr>
						<td>

							<div class="form-group">
								<label class="text-primary" style="font-size: 17px"
									for="username">User Name : </label>
								<form:input path="email" class="form-control" id="txtusername"
									placeholder="User Name" 
									required="required"></form:input>
							</div>
						</td>


					</tr>
					<tr>
						<td>

							<div class="form-group">
								<label class="text-primary" style="font-size: 17px"
									for="password">Password : </label>
								<form:input path="password" type="password" class="form-control"
									id="txtpassword"  placeholder="Password"
									required="required"></form:input>
							</div>
						</td>


					</tr>
					<tr>

						<td style="text-align: center"><input type="submit"
							class="btn btn-primary btn-lg" name="login" value="Login"
							style="width: 250px" /></td>
					</tr>

					<tr>

						<td
							style="text-align: center; font-weight: bold; font-size: 22px;"><a
						style="color:#2187A0;font-weight: bold"	href="registration.html"> Register </a></td>
					</tr>

				</table>
			</div>
			
		
		</form:form>
	</div>
	
	
</body>
</html>
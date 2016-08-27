<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="../../css/bootstrap.min.css">
<script src="../../js/bootstrap.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Staff Home Page</title>
</head>
<body>
<div style="text-align: center;">
			<h2 class="text-primary">Welcome To Staff Home Page</h2>
		</div>
		<div style="text-align: right; padding-right: 30px; font-size: 22px;">
				${sessionScope.userName} <a href="/springmvc/user/login.html">
					Logout</a>

			</div>
		
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<html>
<head>
<link rel="stylesheet" href="../../css/bootstrap1.min.css">
<script src="../../js/bootstrap.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student Home Page</title>
</head>
<body class="jumbotron">

	<div style="margin-top: -30px; margin-left: 20px; margin-right: 20px;">
		<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">GAPP</a>
			</div>

			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li class="active"><a
						href="/gapp/user/student/studenthome.html">Home <span
							class="sr-only">(current)</span></a></li>
					<li><a href="/gapp/user/student/createapplication.html">Create
							New Application</a></li>

				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a> Welcome, ${sessionScope.userName}</a></li>
					<li><a href="/gapp/user/student/logout.html"> Logout </a></li>
				</ul>
			</div>
		</div>
		</nav>
	</div>



	<div style="text-align: center; padding-top: 20px;">
		<h2 class="text-primary">Welcome to Student Home Page</h2>
	</div>



	<div class="panel panel-primary" style="margin: 20px 20px 20px 20px">
		<div class="panel-heading">
			<h3 class="panel-title">Application List</h3>
		</div>

		<table style="text-align: center;" cellpadding="5" class="table"
			cellspacing="0">
			<tr>
				<th style="text-align: center;color:#0D4F43;font-size: 18px;">Department</th>
				<th style="text-align: center;color:#0D4F43;font-size: 18px;">Program</th>
				<th style="text-align: center;color:#0D4F43;font-size: 18px;">Term</th>
				<th style="text-align: center;color:#0D4F43;font-size: 18px;">Current Status</th>
				<th style="text-align: center;color:#0D4F43;font-size: 18px;">Submitted DateTime</th>
				<th></th>
			</tr>
			<c:forEach items="${applications}" var="app">
				<tr>
					<td style="color:#413328;">${app.prg.dept.departmentName}</td>
					<td style="color:#413328;">${app.prg.programName}</td>
					<td style="color:#413328;">${app.term}</td>
					<td style="color:#413328;">${app.currentApplicationStatus}</td>

					<td style="color:#413328"><fmt:formatDate value="${app.submittedDateTime}"
							pattern="MM/dd/yyyy HH:mm:ss" /></td>
					<td style="width: 100px"><a style="color:#2187A0;font-weight: bold"
						href="viewapplicationdetails.html?id=${app.applicationId}">
							View </a></td>
					<td style="width: 100px"><c:choose>
							<c:when test="${app.currentApplicationStatus=='Not Submitted'}">
								<a style="color:#2187A0;font-weight: bold" href="editapplication.html?id=${app.applicationId}"> Edit
								</a>
							</c:when>
							<c:otherwise>
							</c:otherwise>
						</c:choose></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div style="margin-top: 20px; text-align: center">
		<h3 class="text-primary">
			<a style="color:#2187A0" href="<c:url value='/user/student/createapplication.html'/>">
			Create New Application</a>
		</h3>
	</div>

</body>
</html>
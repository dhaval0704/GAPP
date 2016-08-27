<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<html>
<head>
<link rel="stylesheet" href="../../css/bootstrap1.min.css">
<script src="../../js/bootstrap.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Application Details</title>
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
				<a class="navbar-brand">GAPP</a>
			</div>

			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="/gapp/user/student/studenthome.html">Home <span
							class="sr-only">(current)</span></a></li>
					<li><a href="/gapp/user/student/createapplication.html">Create
							New Application</a></li>

				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a> Welcome, ${sessionScope.userName}</a></li>
					<li><a href="/gapp/user/login.html"> Logout </a></li>
				</ul>
			</div>
		</div>
		</nav>
	</div>
	<div style="height: 15px"></div>

	<div style="width: 100%; text-align: center">
		<h2 class="text-primary">View Application Details</h2>
	</div>
	
	<div class="panel panel-primary"
		style="width: 97%; margin: 20px 20px 20px 20px">
		<div class="panel-heading">
			<h3 class="panel-title">Application Details</h3>
		</div>

		<table style="text-align: center" cellpadding="5" class="table"
			cellspacing="0">
			<tr>
				<th style="text-align: center">Application ID</th>

				<th style="text-align: center">Department</th>
				<th style="text-align: center">Program</th>
				<th style="text-align: center">Term</th>
				<th style="text-align: center">Current Status</th>
				<th style="text-align: center"> Submitted Date</th>
			</tr>

			<tr>
				<td>${applicationdetails.applicationId}</td>

				<td>${applicationdetails.prg.dept.departmentName}</td>
				<td>${applicationdetails.prg.programName}</td>
				<td>${applicationdetails.term}</td>
				<td>${applicationdetails.currentApplicationStatus}</td>
				<td>${applicationdetails.submittedDateTime}</td>
			</tr>

		</table>
	</div>
	<div class="panel panel-primary"
		style="width: 97%; margin: 20px 20px 20px 20px">
		<div class="panel-heading">
			<h3 class="panel-title">Personal Information</h3>
		</div>

		<table style="text-align: center" cellpadding="5" class="table"
			cellspacing="0">
			<tr>
				<th style="text-align: center">First Name</th>
				<th style="text-align: center">Last Name</th>
				<th style="text-align: center">CIN</th>
				<th style="text-align: center">Phone Number</th>
				<th style="text-align: center">Email</th>
				<th style="text-align: center">Gender</th>
				<th style="text-align: center">Date Of Birth</th>
				<th style="text-align: center">citizenship</th>

			</tr>

			<tr>
				<td>${applicationdetails.firstName}</td>

				<td>${applicationdetails.lastName}</td>
				<td>${applicationdetails.cin}</td>
				<td>${applicationdetails.phoneNumber}</td>
				<td>${applicationdetails.email}</td>
				<td>${applicationdetails.gender}</td>
				<td>${applicationdetails.dateOfBirth}</td>
				<td>${applicationdetails.citizenship}</td>

			</tr>

		</table>
	</div>

	<div class="panel panel-primary"
		style="width: 97%; margin: 20px 20px 20px 20px">
		<div class="panel-heading">
			<h3 class="panel-title">Educational Background </h3>
		</div>

		<table style="text-align: center" cellpadding="5" class="table"
			cellspacing="0">
			<tr>
				<th style="text-align: center">College ID</th>

				<th style="text-align: center">College Name</th>
				<th style="text-align: center">Attended Time Period</th>
				<th style="text-align: center">Degree Earned</th>
				<th style="text-align: center">Degree Field</th>
				<th></th>
			</tr>
			<c:forEach items="${collegedegreeinfo}" var="clg">
				<tr>
					<td>${clg.collegeId}</td>
					<td>${clg.collegeName}</td>
					<td>${clg.attendedTimePeriod}</td>
					<td>${clg.degreeEarned}</td>
					<td>${clg.degreeField}</td>

				</tr>
			</c:forEach>
		</table>
	</div>

	<div class="panel panel-primary"
		style="width: 97%; margin: 20px 20px 20px 20px">
		<div class="panel-heading">
			<h3 class="panel-title">Academic Records </h3>
		</div>

		<table style="text-align: center" cellpadding="5" class="table"
			cellspacing="0">
			<tr>
				<th style="text-align: center">Is International Student</th>
				<th style="text-align: center">TOEFL Score</th>

				<th style="text-align: center">GPA</th>
				<th style="text-align: center">Transcript</th>

			</tr>

			<tr>
				<td>${applicationdetails.isInternationalStudent}</td>
				<td>${applicationdetails.toeflScore}</td>


				<td>${applicationdetails.gpa}</td>
				<td><a
					href="download.html?fileName=${applicationdetails.transcript}">${applicationdetails.transcript}</a></td>

			</tr>

		</table>
	</div>

	<div class="panel panel-primary"
		style="width: 97%; margin: 20px 20px 20px 20px">
		<div class="panel-heading">
			<h3 class="panel-title">Additional Field Information</h3>
		</div>

		<table style="text-align: center" cellpadding="5" class="table"
			cellspacing="0">
			<tr>
				<c:forEach items="${additionalfield}" var="additionalfield">
					<th style="text-align: center">${additionalfield.fieldName}</th>
				</c:forEach>
			</tr>

			<tr>
				<c:forEach items="${additionalfieldvalueinfo}" var="additionalValue">
					<td>${additionalValue.additionalFieldValue}</td>

				</c:forEach>
			</tr>

		</table>
	</div>



</body>
</html>
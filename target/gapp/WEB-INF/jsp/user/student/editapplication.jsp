<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Application Details</title>
<link rel="stylesheet" href="../../css/bootstrap1.min.css">
<script src="../../js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css" />

<script src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		BindProgramByDepartment();
		AddAdditionalFieldByDepartment();
		showhidetextbox();
	});
	var filecounter = 0;

	$(function() {
		$("#datepicker").datepicker();
	});

	function showhidetextbox() {

		if ($("#ddlInternational").val() == "No") {
			$("#txtTOEFL").hide();
			$("#lbltoefl").hide();
		} else {
			$("#txtTOEFL").show();
			$("#lbltoefl").show();
		}

	}

	function BindProgramByDepartment() {
		var deptName = $("#ddldepartment").val();

		$
				.ajax({
					type : 'GET',
					url : 'getprograms.html',
					dataType : 'json',
					data : {
						deptId : deptName
					},
					success : function(response) {
						var deptPrograms = "";
						for (var i = 0; i < response.length; i++) {
							deptPrograms += "<option value='" + response[i]["programId"]+ "'>"
									+ response[i]["programName"] + "</option>";
						}
						$("#ddlProgram").html(deptPrograms);
					},
					error : function(xmlHttpRequest, textStatus, errorThrown) {
						if (xmlHttpRequest.readyState = 0 || xmlHttpRequest.status == 0)
							return;
					}
				});
	}

	function AddAdditionalFieldValuesByApplication() {
		var deptName = $("#ddldepartment").val();
		var appId = getParameterByName("id");

		$
				.ajax({
					type : 'GET',
					url : 'getadditionalfieldvalues.html',
					dataType : 'json',
					data : {
						appId : appId
					},
					success : function(response) {

						$("#divAdditionalInfo").empty();
						var deptAdditionalFields = "";
						for (var i = 0; i < response.length; i++) {

							var newTextBoxDiv = $(document.createElement('div'))
									.attr("id", 'TextBoxDiv' + i);

							if (response[i]["additionalFieldType"] == "TEXT"
									|| response[i]["additionalFieldType"] == "NUMBER") {
								newTextBoxDiv
										.after()
										.html(
												'<label> '
														+ response[i]["additionalFieldName"]
														+ ' : </label>'
														+ '<input type="text" style="width:400px" class="form-control" name="textbox' + i + 
						      '" id="textbox' + i + '" value="'+response[i]["additionalFieldValue"]+'" >');
							} else {
								newTextBoxDiv
										.after()
										.html(
												'<label> '
														+ response[i]["additionalFieldName"]
														+ ' : </label>'
														+ '<input type="file" style="width:400px" class="form-control" name="files[' + filecounter + 
													      ']" id="textbox' + i + '" value="" ><label ><a   href="download.html?fileName='
														+ response[i]["additionalFieldValue"]
														+ '">'
														+ response[i]["additionalFieldValue"]
														+ '</a></label>'

										);
								filecounter++;
							}

							newTextBoxDiv.appendTo("#divAdditionalInfo");
							$("#TextBoxDiv" + i).attr("style",
									"padding:10px 10px 10px 10px");
						}

					},
					error : function(xmlHttpRequest, textStatus, errorThrown) {
						if (xmlHttpRequest.readyState = 0 || xmlHttpRequest.status == 0)
							return;
					}
				});
	}

	function AddAdditionalFieldByDepartment() {
		var deptName = $("#ddldepartment").val();

		$
				.ajax({
					type : 'GET',
					url : 'getadditionalfields.html',
					dataType : 'json',
					data : {
						deptId : deptName
					},
					success : function(response) {

						$("#divAdditionalInfo").empty();
						var deptAdditionalFields = "";
						for (var i = 0; i < response.length; i++) {

							var newTextBoxDiv = $(document.createElement('div'))
									.attr("id", 'TextBoxDiv' + i);

							if (response[i]["fieldType"] == "TEXT"
									|| response[i]["fieldType"] == "NUMBER") {
								if (response[i]["required"] == true) {
									newTextBoxDiv
											.after()
											.html(
													'<label class="text-primary">'
															+ response[i]["fieldName"]
															+ ' : </label>'
															+ '<input type="text" style="width:400px" class="form-control" name="textbox' + i + 
						      '" id="textbox' + i + '" value="" />');
								} else {
									newTextBoxDiv
											.after()
											.html(
													'<label class="text-primary">'
															+ response[i]["fieldName"]
															+ ' : </label>'
															+ '<input type="text" style="width:400px" class="form-control" name="textbox' + i + 
					      '" id="textbox' + i + '" value=""  />');

								}
							} else {
								if (response[i]["required"] == true) {
									newTextBoxDiv
											.after()
											.html(
													'<label class="text-primary"> '
															+ response[i]["fieldName"]
															+ ' : </label>'
															+ '<input type="file"  name="files[' + filecounter + ']" id="textbox' + i + '" value=""  />');
								} else {

									newTextBoxDiv
											.after()
											.html(
													'<label class="text-primary"> '
															+ response[i]["fieldName"]
															+ ' : </label>'
															+ '<input type="file"  name="files[' + filecounter + ']" id="textbox' + i + '" value="" />');

								}
								filecounter++;

							}

							newTextBoxDiv.appendTo("#divAdditionalInfo");
							$("#TextBoxDiv" + i).attr("style",
									"padding:10px 10px 10px 10px");
						}

					},
					error : function(xmlHttpRequest, textStatus, errorThrown) {
						if (xmlHttpRequest.readyState = 0 || xmlHttpRequest.status == 0)
							return;
					}
				});
	}

	function getParameterByName(name, url) {
		if (!url)
			url = window.location.href;
		name = name.replace(/[\[\]]/g, "\\$&");
		var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"), results = regex
				.exec(url);
		if (!results)
			return null;
		if (!results[2])
			return '';
		return decodeURIComponent(results[2].replace(/\+/g, " "));
	}
</script>


<style type="text/css">
table tr td {
	padding-bottom: 10px;
	font-size: 18px;
	font-weight: bold;
}

form:select {
	width: 200px;
}
</style>
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
					<li><a href="/gapp/user/student/studenthome.html">Home <span
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
	<div style="height: 20px"></div>
	<form:form modelAttribute="application" method="POST"
		enctype="multipart/form-data">
		<div style="width: 100%; text-align: center">
			<h2 class="text-primary">Edit Application</h2>
		</div>
		<div style="height: 30px"></div>
		<div style="width: 97%; margin-left: 25px;">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title">Department and Program Info</h3>
				</div>

				<table cellspacing="5px" cellpadding="5px"
					style="width: 500px; align: center; margin-left: 30px; margin-top: 30px">

					<tr>
						<td><label for="ddldepartmentName" class="text-primary">Department
								Name : </label></td>

						<td><select name="ddldepartment" id="ddldepartment"
							class="form-control">

								<option value="${selectedDepartment.departmentId}">${selectedDepartment.departmentName}</option>

						</select></td>
					</tr>
					<tr>
						<td><label for="ddldepartmentName" class="text-primary">Program
								Name : </label></td>
						<td><select name="ddlProgram" id="ddlProgram"
							class="form-control">
								<c:forEach var="Programs" items="${Programs}">
									<c:choose>

										<c:when
											test="${Programs.programId==selectedProgram.programId}">
											<option value="${Programs.programId}" selected>${Programs.programName}</option>
										</c:when>
										<c:otherwise>
											<option value="${Programs.programId}">${Programs.programName}</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
						</select></td>
					</tr>
					<tr>
						<td><label for="ddlterm" class="text-primary">Term :
						</label></td>
						<td><form:select path="term" name="ddlterm" id="ddlterm"
								class="form-control">
								<c:choose>
									<c:when test="${application.term=='Fall 2016'}">
										<option value="Fall 2016" selected>Fall 2016</option>
									</c:when>
									<c:otherwise>
										<option value="Fall 2016">Fall 2016</option>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${application.term=='Winter 2016'}">

										<option value="Winter 2016" selected>Winter 2016</option>

									</c:when>
									<c:otherwise>

										<option value="Winter 2016">Winter 2016</option>

									</c:otherwise>
								</c:choose>

								<c:choose>
									<c:when test="${application.term=='Spring 2016'}">

										<option value="Spring 2016" selected>Spring 2016</option>

									</c:when>
									<c:otherwise>

										<option value="Spring 2016">Spring 2016</option>

									</c:otherwise>
								</c:choose>
							</form:select></td>
					</tr>

					<tr>

						<td></td>
					</tr>
				</table>

			</div>
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title">Personal Information</h3>
				</div>
				<table cellspacing="5px" cellpadding="5px"
					style="width: 500px; align: center; margin-left: 30px; margin-top: 30px">
					<tr>
						<td class="text-primary">First Name :</td>
						<td><form:input path="firstName" class="form-control"
								id="txtFirstName" placeholder="First Name" required="required"></form:input></td>
					</tr>
					<tr>
						<td class="text-primary">Last Name :</td>
						<td><form:input path="lastName" class="form-control"
								id="txtLastName" placeholder="Last Name" required="required"></form:input></td>
					</tr>
					<tr>
						<td class="text-primary">CIN :</td>
						<td><form:input path="cin" class="form-control" id="txtcin"
								placeholder="CIN"></form:input></td>
					</tr>
					<tr>
						<td class="text-primary">Phone Number :</td>
						<td><form:input path="phoneNumber" class="form-control"
								id="txtPhoneNumber" placeholder="Phone Number"></form:input></td>
					</tr>
					<tr>
						<td class="text-primary">Email Address :</td>
						<td><form:input path="email" class="form-control"
								id="txtEmail" placeholder="Email Address" required="required"></form:input></td>
					</tr>
					<tr>
						<td class="text-primary">Gender :</td>
						<td><form:select path="gender" class="form-control">
								<form:option value="Male">Male</form:option>
								<form:option value="Female">Female</form:option>
							</form:select></td>
					</tr>
					<tr>
						<td class="text-primary">Date of Birth :</td>
						<td><form:input path="dateOfBirth" class="form-control"
								id="datepicker" placeholder="Date of Birth"></form:input></td>
					</tr>
					<tr>
						<td class="text-primary">Citizenship :</td>
						<td><form:input path="citizenship" class="form-control"
								id="txtcitizenship" placeholder="citizenship"></form:input></td>
					</tr>
				</table>
			</div>

			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title">Education Background</h3>
				</div>


				<table cellspacing="15px" cellpadding="7px"
					style="width: 97%; align: left; margin-left: 10px; margin-top: 30px">
					<tr>
						<td class="text-primary">No.</td>
						<td class="text-primary">Name of College/University</td>
						<td class="text-primary">Time Period Attended</td>

						<td class="text-primary">Degree Earned</td>

						<td class="text-primary">Major/Field of Degree</td>

					</tr>

					<c:if test="${clgdegrees.size() == 5}">
						<c:forEach items="${clgdegrees}" var="clgdegrees"
							varStatus="loopCounter" begin="0" end="4">


							<tr>
								<td>${loopCounter.count}</td>
								<td><input class="form-control"
									name="txtCollegeName${loopCounter.count}"
									placeholder="College/University Name"
									value="${clgdegrees.collegeName}"></input></td>
								<td><input class="form-control"
									name="txtTimeperiodAttended${loopCounter.count}"
									placeholder="From Year - To Year"
									value="${clgdegrees.attendedTimePeriod}"></input></td>
								<td><input class="form-control"
									name="txtDegreeEarned${loopCounter.count}"
									placeholder="Degree Earned" value="${clgdegrees.degreeEarned}"></input></td>
								<td><input class="form-control"
									name="txtMajorField${loopCounter.count}"
									placeholder="Major Field" value="${clgdegrees.degreeField}"></input></td>
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${clgdegrees.size() < 5}">

						<c:forEach items="${clgdegrees}" var="clgdegrees"
							varStatus="loopCounter" begin="0" end="${clgdegrees.size()}">


							<tr>
								<td>${loopCounter.count}</td>
								<td><input class="form-control"
									name="txtCollegeName${loopCounter.count}"
									placeholder="College/University Name"
									value="${clgdegrees.collegeName}"></input></td>
								<td><input class="form-control"
									name="txtTimeperiodAttended${loopCounter.count}"
									placeholder="From Year - To Year"
									value="${clgdegrees.attendedTimePeriod}"></input></td>
								<td><input class="form-control"
									name="txtDegreeEarned${loopCounter.count}"
									placeholder="Degree Earned" value="${clgdegrees.degreeEarned}"></input></td>
								<td><input class="form-control"
									name="txtMajorField${loopCounter.count}"
									placeholder="Major Field" value="${clgdegrees.degreeField}"></input></td>
							</tr>
						</c:forEach>
						<c:forEach var="i" varStatus="loopCounter"
							begin="${clgdegrees.size()+1}" end="5">
							<tr>
								<td>${loopCounter.index}</td>
								<td><input class="form-control"
									name="txtCollegeName${loopCounter.index}"
									placeholder="College/University Name"></input></td>
								<td><input class="form-control"
									name="txtTimeperiodAttended${loopCounter.index}"
									placeholder="From Year - To Year"></input></td>
								<td><input class="form-control"
									name="txtDegreeEarned${loopCounter.index}"
									placeholder="Degree Earned"></input></td>
								<td><input class="form-control"
									name="txtMajorField${loopCounter.index}"
									placeholder="Major Field"></input></td>
							</tr>
						</c:forEach>
					</c:if>


				</table>

			</div>

			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title">Academic Background</h3>
				</div>
				<table cellspacing="5px" cellpadding="7px"
					style="width: 700px; align: left; margin-left: 10px; margin-top: 30px">
					<tr>
						<td class="text-primary">Are you a international student? :</td>
						<td><form:select class="form-control" id="ddlInternational"
								path="isInternationalStudent" onchange="showhidetextbox();">

								<form:option value="Yes">Yes</form:option>
								<form:option value="No">No</form:option>

							</form:select></td>
					</tr>
					<tr>
						<td class="text-primary" id="lbltoefl">TOEFL Score :</td>
						<td><form:input path="toeflScore" class="form-control"
								id="txtTOEFL" placeholder="TOEFL Score"></form:input></td>
					</tr>
					<tr>
						<td class="text-primary">GPA :</td>
						<td><form:input path="gpa" class="form-control" id="txtGpa"
								placeholder="GPA"></form:input></td>

					</tr>

					<tr>
						<td class="text-primary">Transcript :</td>
						<td><input type="file" name="file" /><a style="color:#2187A0"
							href="download.html?fileName=${application.transcript}">${application.transcript}</a></td>

					</tr>

				</table>

			</div>
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title">Additional Information ( For Extra
						Credit )</h3>
				</div>
				<div id="divAdditionalInfo" style="padding: 10px 10px 10px 10px"></div>


			</div>
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title">Added Additional Information</h3>
				</div>

				<table style="text-align: center !important" cellpadding="5"
					class="table" cellspacing="0">
					<tr>
						<td class="text-primary">Additional Requirement Name</td>
						<td class="text-primary">Additional Field Type</td>
						<td class="text-primary">Additional Field Value</td>
						<td></td>
					</tr>
					<c:forEach items="${additionalfieldentries}" var="req">
						<tr>

							<td style="color:#594636">${req.additionalFieldName}</td>
							<td style="color:#594636">${req.additionalFieldType}</td>

							<td><c:choose>

									<c:when test='${req.additionalFieldType=="FILE"}'>
										<a style="color:#2187A0" href="download.html?fileName=${req.additionalFieldValue}">${req.additionalFieldValue}</a>
									</c:when>
									<c:otherwise>${req.additionalFieldValue}</c:otherwise>
								</c:choose></td>
							<td><a style="color:#594636"
								href="removeadditionalinfo.html?id=${req.additionalFieldEntryId}&appId=${application.applicationId}">
									Remove Additional Info</a></td>
						</tr>
					</c:forEach>
				</table>
			</div>


			<div style="width: 100%; text-align: center">
				<div
					style="width: 45%; text-align: right; float: left; margin-right: 15px;">
					<input type="submit" value="Save" name="add" style="width: 100px"
						class="btn btn-large btn-primary" />
				</div>
				<div
					style="width: 45%; text-align: left; float: right; margin-left: 1px;">
					<input type="submit" value="Submit" name="add" style="width: 100px"
						class="btn btn-large btn-primary" />
				</div>


			</div>
		</div>
	</form:form>

</body>
</html>
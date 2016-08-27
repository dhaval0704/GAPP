<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<html>
<head>
<link rel="stylesheet" href="../../css/bootstrap1.min.css">
<script src="../../js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		BindProgramByDepartment();
		AddAdditionalFieldByDepartment();

	});

	var filecounter=0;
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
								newTextBoxDiv
										.after()
										.html(
												'<label> '
														+ response[i]["fieldName"]
														+ ' : </label>'
														+ '<input type="text" style="width:400px" class="form-control" name="textbox' + i + 
						      '" id="textbox' + i + '" value="" >');
							} else {
								
								newTextBoxDiv
										.after()
										.html(
												'<label> '
														+ response[i]["fieldName"]
														+ ' : </label>'
														+ '<input type="file" style="width:400px" class="form-control" name="files[' + filecounter + 
									      ']" id="textbox' + i + '" value="" >');
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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create Application</title>
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
					<li class="active"><a
						href="/gapp/user/student/createapplication.html">Create New
							Application</a></li>

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

	<form:form modelAttribute="application"  enctype="multipart/form-data">
		<div style="width: 100%; text-align: center">
			<h2 class="text-primary">Create New Application</h2>
		</div>
		<div style="height: 10px"></div>
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
							onchange="BindProgramByDepartment();AddAdditionalFieldByDepartment();"
							class="form-control">

								<c:forEach var="departments" items="${departments}">
									<option value="${departments.departmentId}">${departments.departmentName}</option>
								</c:forEach>
						</select></td>
					</tr>
					<tr>
						<td><label for="ddldepartmentName" class="text-primary">Program
								Name : </label></td>
						<td><select name="ddlProgram" id="ddlProgram"
							class="form-control">
						</select></td>
					</tr>
					<tr>
						<td><label for="ddlterm" class="text-primary">Term :
						</label></td>
						<td><form:select path="term" name="ddlterm" id="ddlterm"
								class="form-control">
								<form:option value="Fall 2016">Fall 2016</form:option>
								<form:option value="Winter 2016">Winter 2016</form:option>
								<form:option value="Spring 2016">Spring 2016</form:option>
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
								id="txtDOB" placeholder="Date of Birth"></form:input></td>
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

				<table cellspacing="15" cellpadding="7"
					style="width: 97%; align: left; margin-left: 10px; margin-top: 30px">
					<tr>
						<td class="text-primary">No.</td>
						<td class="text-primary">Name of College/University</td>
						<td class="text-primary">Time Period Attended</td>

						<td class="text-primary">Degree Earned</td>

						<td class="text-primary">Major/Field of Degree</td>

					</tr>
					<tr>
						<td>1)</td>
						<td><input class="form-control" name="txtCollegeName1"
							placeholder="College/University Name" ></input></td>
						<td><input class="form-control" name="txtTimeperiodAttended1"
							placeholder="From Year - To Year" ></input></td>
						<td><input class="form-control" name="txtDegreeEarned1"
							placeholder="Degree Earned" ></input></td>
						<td><input class="form-control" name="txtMajorField1"
							placeholder="Major Field" ></input></td>


					</tr>
					<tr>
						<td>2)</td>
						<td><input class="form-control" name="txtCollegeName2"
							placeholder="College/University Name"></input></td>
						<td><input class="form-control" name="txtTimeperiodAttended2"
							placeholder="From Year - To Year"></input></td>
						<td><input class="form-control" name="txtDegreeEarned2"
							placeholder="Degree Earned"></input></td>
						<td><input class="form-control" name="txtMajorField2"
							placeholder="Major Field"></input></td>


					</tr>
					<tr>
						<td>3)</td>
						<td><input class="form-control" name="txtCollegeName3"
							placeholder="College/University Name"></input></td>
						<td><input class="form-control" name="txtTimeperiodAttended3"
							placeholder="From Year - To Year"></input></td>
						<td><input class="form-control" name="txtDegreeEarned3"
							placeholder="Degree Earned"></input></td>
						<td><input class="form-control" name="txtMajorField3"
							placeholder="Major Field"></input></td>


					</tr>
					<tr>
						<td>4)</td>
						<td><input class="form-control" name="txtCollegeName4"
							placeholder="College/University Name"></input></td>
						<td><input class="form-control" name="txtTimeperiodAttended4"
							placeholder="From Year - To Year"></input></td>
						<td><input class="form-control" name="txtDegreeEarned4"
							placeholder="Degree Earned"></input></td>
						<td><input class="form-control" name="txtMajorField4"
							placeholder="Major Field"></input></td>


					</tr>
					<tr>
						<td>5)</td>
						<td><input class="form-control" name="txtCollegeName5"
							placeholder="College/University Name"></input></td>
						<td><input path="clgDegrees[4].attendedTimePeriod"
							class="form-control" name="txtTimeperiodAttended5"
							placeholder="From Year - To Year"></input></td>
						<td><input class="form-control" name="txtDegreeEarned5"
							placeholder="Degree Earned"></input></td>
						<td><input class="form-control" name="txtMajorField5"
							placeholder="Major Field"></input></td>


					</tr>

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
						<td class="text-primary"><label id="lbltoefl">TOEFL
								Score :</label></td>
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
						<td><input type="file" name="file" /></td>

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
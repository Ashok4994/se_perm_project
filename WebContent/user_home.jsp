<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.Blob"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="com.controller.User"%>
<%@ page import="com.admin.Connect_db"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title></title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<!-- Normalize CSS -->
<link rel="stylesheet" href="css/normalize.css">

<!-- Main CSS -->
<link rel="stylesheet" href="css/main.css">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">

<!-- Animate CSS -->
<link rel="stylesheet" href="css/animate.min.css">

<!-- Font-awesome CSS-->
<link rel="stylesheet" href="css/font-awesome.min.css">

<!-- Switch Style CSS -->
<link rel="stylesheet" href="css/switch-style.css">

<!-- Custom CSS -->
<link rel="stylesheet" href="css/style.css">

<!-- Home page CSS -->
<link rel="stylesheet" href="css/admin.css">

<!-- People page styles CSS -->
<link rel="stylesheet" href="css/people.css">
</head>
<body background="http://localhost:8080/Sampletp/img/hdwallpaper.jpg">

	<link
		href="http://fontawesome.io/assets/font-awesome/css/font-awesome.css"
		rel="stylesheet" media="screen">
	<!-- Header Area Start Here -->
	<header>
	<div class="header2-area">
		<div class="header-bottom-area" id="sticker">
			<div class="container">
				<div class="row">
					<div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">
						<div class="logo-area">
							<span><h3>EMS</h3></span>
						</div>
					</div>
					<div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
						<div class="main-menu-area">
							<nav>
							<ul>
								<!--<li><a href="<%=request.getContextPath()%>/controller?actionCode=getItemsOfCart&page=home" class="col-xs-24">Home</a></li>-->
								<!--<li><a href="#" class="col-xs-24">About</a></li>-->
								<!--<li><a href="cafeterialdetail?action=viewtable" class="col-xs-24">Cafeteria Details</a></li>-->

								<!--<li><a href="Addfooditem.jsp" class="col-xs-24"> Menu Management</a></li>-->

								<li><a
									href="<%=request.getContextPath()%>/update_profile.jsp"
									class="col-xs-24">Update Profile</a></li>

								<li><a href="<%=request.getContextPath()%>/Logout"
									class="col-xs-24">Log-Out</a></li>

							</ul>
							</nav>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	</header>
	<br>
	<br>
	<br>
	<br>
	<center>
		<a href="leave_request.jsp"><input type="button"
			value="Request a leave"> </a>
	</center>
	<br>

	<div class="container">
		<div id="create-user" class="row">
			<div class="widget widget-gray">
				<!-- TYPE PANEL -->
				<div class="widget-head">
					<!-- HEAD PANEL -->
					<h4 class="heading">
						<i class="fa fa-briefcase"> </i> Request Leave
					</h4>
				</div>
				<!-- /HEAD PANEL -->

				<div class="widget-body" id="widget-body1">
					<!-- CONTENT PANEL -->
					<form class="form-horizontal" method="post" action="Leave">
						<fieldset>
							<!-- Form Name -->
							<legend>Leave Request form</legend>

							<!-- Text input-->
							<div class="form-group">
								<label class="col-md-4 control-label" for="gender">Start
									Date</label>
								<div class="col-md-4">
									<input id="name" name="sdate" placeholder=""
										class="form-control input-md" required="true" type="date">
								</div>
							</div>

							<!-- Text input-->
							<div class="form-group">
								<label class="col-md-4 control-label" for="gender">End
									Date</label>
								<div class="col-md-4">
									<input id="gender" name="enddate" placeholder=""
										class="form-control input-md" required="true" type="date">
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-4 control-label" for="phone">Reason</label>
								<div class="col-md-4">
									<input id="phone" name="reason" placeholder=""
										class="form-control input-md" required="true" type="text">
								</div>
							</div>






							<!-- Button (Double) -->
							<div class="form-group">
								<label class="col-md-4 control-label" for="button1id"></label>
								<div class="col-md-8">
									<button id="button1id" name="button1id" class="btn btn-success">Submit</button>
								</div>
							</div>

						</fieldset>
					</form>

				</div>
				<!-- /CONTENT PANEL -->

				<div class="widget-footer">
					<!-- FOOTER PANEL-->
					<!--<a href="#" class="fa fa-minus-circle fa-1x" data-toggle="tooltip" data-placement="right" title="" data-original-title="FA-MINUS-CIRCLE"><i></i></a>-->
					<!--<a href="#" class="fa fa-pencil fa-1x" data-toggle="tooltip" data-placement="right" title="" data-original-title="FA-PENCIL"><i></i></a>-->
					<!--<a href="#" class="fa fa-search fa-1x" data-toggle="tooltip" data-placement="right" title="" data-original-title="FA-SEARCH"><i></i></a>-->
					<!--<a href="#" class="fa fa-plus-circle fa-1x" data-toggle="tooltip" data-placement="right" title="" data-original-title="FA-PLUS-CIRCLE"><i></i></a>-->
					<a href="#" id="toggle1" class="fa fa-chevron-down fa-1x"
						data-toggle="tooltip" data-placement="right" title=""
						data-original-title="FA-PLUS-CIRCLE"><i></i></a>
				</div>
				<!-- /FOOTER PANEL-->

			</div>
			<!-- /TYPE PANEL -->
		</div>

	</div>
	<hr>
	<br>
	<br>

	<div class="container">
		<form method="post" action="Upload" enctype="multipart/form-data">
			<center>
				<table border="1" width="25%" cellpadding="5">
					<thead>
						<th colspan="3">Upload File</th>
					</thead>
					<tbody>
						<tr>
							<td>Description :</td>
							<td><input type="text" name="title" size="30"></td>
						</tr>
						<tr>
							<td>Choose File :</td>
							<td><input type="file" name="file_uploaded" /></td>
						</tr>
						<tr>
							<td colspan="3"><input type="submit" value="Upload"></td>
						</tr>
					</tbody>
				</table>
			</center>
		</form>
	</div>
	<%
		HttpSession session1 = request.getSession();
		Integer id = (Integer) session1.getAttribute("user_id");
		User u = new User(id);
		int m_id = (Integer) u.getMid();
		String role = u.getRole();
		if (role.equalsIgnoreCase("manager")) {
	%>
	<br>
	<br>

	<h2>Leave Requests</h2>
	<div class="container">
		<table class='table table-striped'>
			<thead>
				<tr>
					<th>Start Date</th>
					<th>End Date</th>
					<th>Reason</th>
					<th>Employee ID</th>
					<th>Status</th>
				</tr>
			</thead>
			<tbody>

				<%
					try {
							Statement stmt = Connect_db.getConnection().createStatement();
							String sqlString = "SELECT * FROM leave2 where man_id=+" + id + "";
							//String sqlString = "SELECT * FROM leave2";
							ResultSet rs = stmt.executeQuery(sqlString);

							if (!rs.isBeforeFirst()) {
				%>
				<tr>
					<td colspan="3"><center>
							<%
								out.print("No leave requests!");
							%>
						</center></td>
				</tr>
				<%
					}

							while (rs.next()) {
				%>

				<tr>
					<td>
						<%
							out.print(rs.getString("startdate"));
						%>
					</td>
					<td>
						<%
							out.print(rs.getString("enddate"));
						%>
					</td>
					<td>
						<%
							out.print(rs.getString("reason"));
						%>
					</td>
					<td>
						<%
							out.print(rs.getInt("emp_id"));
						%>
					</td>
					<td>
						<%
							out.print(rs.getString("status"));
						%>
					</td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
		<%
			} catch (Exception e) {
					System.err.println(e);
				}
			}
		%>

		</tbody>
		</table>

	</div>







	<!-- jquery-->
	<script src="js/jquery-2.2.4.min.js" type="text/javascript"></script>

	<!-- Plugins js -->
	<!--<script src="js/plugins.js" type="text/javascript"></script>-->

	<!-- Bootstrap js -->
	<script src="js/bootstrap.min.js" type="text/javascript"></script>

	<!-- WOW JS -->
	<script src="js/wow.min.js"></script>

	<!-- Meanmenu Js -->
	<script src="js/jquery.meanmenu.min.js" type="text/javascript"></script>

	<!-- Srollup js -->
	<script src="js/jquery.scrollUp.min.js" type="text/javascript"></script>

	<!-- Custom Js -->
	<script src="js/main.js" type="text/javascript"></script>

	<!-- people Js -->
	<script src="js/people.js" type="text/javascript"></script>

</body>
</html>
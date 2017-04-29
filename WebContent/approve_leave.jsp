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

</head>
<body>

<h2>Leave Requests</h2>
	<div class="container">
<div class="panel panel-info">
<div class="panel-heading">Approve Leave</div>
 <div class="panel-body">
  <table class="table table-striped">
			<thead>
				<tr>
					<th>Start Date</th>
					<th>End Date</th>
					<th>Reason</th>
					<th>Employee ID</th>
					<th>Status</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>

				<%
					try {
						HttpSession session1 = request.getSession();
						Integer id = (Integer) session1.getAttribute("user_id");
					
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
						
					
							<!--  <%out.print(rs.getString("status"));%>-->
					<form method="POST" action="ApproveLeave">
					<div class="form-group">
   
      <select id="disabledSelect" class="form-control" name="perm">
        <option>pending</option>
        <option>approve</option>
        <option>decline</option>
      </select>
       </div>	
					
					</td>
					<td>
					 <button type="submit" class="btn btn-info">Submit</button>
					</td>
				</tr>
				
				 <input type="hidden" name="empid"
				value="<%=rs.getInt("emp_id")%>">
				</form> 
				<%
					}
				%>
			</tbody>
		</table>
		</div>
		</div>
	
		<%
			} catch (Exception e) {
					System.err.println(e);
				}
			
		%>

	

	</div>


</body>
</html>
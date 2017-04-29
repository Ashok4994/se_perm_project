<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import ="javax.sql.*" %>
<%@page import ="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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

</head>
<body>
<br>
<br>
<div class="container">
<div class="panel panel-success">
<div class="panel-heading">Employee Hierarchy</div>
 <div class="panel-body">
  <table class="table table-striped">
            <thead> 
               <th colspan="3">Employees List</th>        
            </thead>
                <tbody>
                    <tr>
                        <td><center><b>FirstName</b></center></td>
                        <td><center><b>Email</b></center></td>
                        <td><center><b>UserID</b></center></td>
                         <td><center><b>Manager ID</b></center></td>
                         <td><center><b>Role</b></center></td>
                         <td><center><b>Level ID</b></center></td>
                         <td><center><b>Hierarchy</b></center></td>
                    </tr>

<%
                        try
                        {
                        	
                        	HttpSession session1 = request.getSession();
                    		int m_id=0;
                    		int level_id=0;
                    		Integer id = (Integer) session1.getAttribute("user_id");
                                //Db_Connection dbconn=new Db_Connection();
                                Class.forName("com.mysql.jdbc.Driver");
                                 String TechWorld3g_2 = "jdbc:mysql://localhost:3306/termproject";
                                Connection myConnection = DriverManager.getConnection(TechWorld3g_2,"root","root");
                                Statement stmt=myConnection.createStatement();
                                ResultSet rs1 = stmt.executeQuery("SELECT mid,levelid from employee where userid=" + id + "");

                				if (rs1.next()) {
                					m_id = rs1.getInt("mid");
                					level_id=rs1.getInt("levelid");

                				}
                               // Connection myconnection= dbconn.Connection();

                                //String sqlString = "select * from termproject.files where dir_id in (select d.dir_id from  termproject.employee as e,termproject.directory as d where  e.mid="+id+" and e.userid=d.manager_id);";
                                	
                               // String sqlString="SELECT distinct e.levelid,dir_id,d.directory_name,d.permission,d.manager_id from  termproject.employee e,termproject.directory d where e.levelid<"+level_id+" and e.userid=d.manager_id and d.permission='public';";
                                String sqlString="SELECT firstname,email,userid,mid,role,levelid,hierarchy FROM termproject.employee where levelid<"+level_id+" order by levelid;";
                                ResultSet rs2=stmt.executeQuery(sqlString);
                                
                               
                                
                                if(!rs2.isBeforeFirst())
                                {
                                    %>
                                        <tr>
                                        <td colspan="3"><center><%out.print("No Files!"); %></center></td>
                                        </tr>
                                    <%
                                }    
                                
                                while(rs2.next())
                                {   
                            %>
                                    <tr>
                                        <td><center><%out.print(rs2.getString("firstname")); %></center></td>
                                        <td><center><%out.print(rs2.getString("email")); %></center></td>
                                        <td><center><%out.print(rs2.getInt("userid")); %></center></td>
                                        <td><center><%out.print(rs2.getInt("mid")); %></center></td>
                                     <td><center><%out.print(rs2.getString("role")); %></center></td>
                                     <td><center><%out.print(rs2.getInt("levelid")); %></center></td>
                                     <td><center><%out.print(rs2.getString("hierarchy")); %></center></td>
                                    </tr>
                            <%
                                }
                            %>
                            
                </tbody> 
        </table>
        </div>
        </div>
                            </div>
                            <%
                                rs2.close();
                                stmt.close();
                                myConnection.close();
                        }catch(Exception e){e.printStackTrace();}    
                        
                    %>
 
</body>
</html>
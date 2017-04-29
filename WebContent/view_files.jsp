<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import ="javax.sql.*" %>
<%@page import ="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

  <table border="1" width="25%" cellpadding="5">
            <thead> 
               <th colspan="3">Uploaded Files</th>        
            </thead>
                <tbody>
                    <tr>
                        <td><center><b>LevelID</b></center></td>
                        <td><center><b>Directory ID</b></center></td>
                        <td><center><b>permission</b></center></td>
                         <td><center><b>Manager ID</b></center></td>
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
                                	
                                String sqlString="SELECT distinct e.levelid,dir_id,d.directory_name,d.permission,d.manager_id from  termproject.employee e,termproject.directory d where e.levelid<"+level_id+" and e.userid=d.manager_id and d.permission='public';";
                                
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
                                        <td><center><%out.print(rs2.getInt("levelid")); %></center></td>
                                        <td><center><%out.print(rs2.getInt("dir_id")); %></center></td>
                                        <td><center><%out.print(rs2.getString("permission")); %></center></td>
                                        <td><center><%out.print(rs2.getInt("manager_id")); %></center></td>
                                    </tr>
                            <%
                                }
                            %>
                            
                </tbody> 
        </table>
                            
                            <%
                                rs2.close();
                                stmt.close();
                                myConnection.close();
                        }catch(Exception e){e.printStackTrace();}    
                        
                    %>

</body>
</html>
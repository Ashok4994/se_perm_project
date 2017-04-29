<%@page import="com.admin.Connect_db"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.controller.User"%>

<%
    //check for valid session
    Integer user_id = (Integer) session.getAttribute("user_id");
    if (user_id == null) {
        //request.setAttribute("errormsg", "Session has ended. Please login.");
        response.sendRedirect(request.getContextPath() + "/login.jsp");
    }
%>
<%
    ArrayList<User> userList = new ArrayList<User>(); //holds user objects

    PrintWriter writer = response.getWriter();

    try {
        Statement stmt = Connect_db.getConnection().createStatement();
        
        ResultSet rs = stmt.executeQuery("SELECT * FROM employee where status='active';");

        writer.print("<table class='table table-bordered'>"
                + "<thead>"
                + "<tr>"
                + "<th>#</th>"
                + "<th>FirstName</th>"
                + "<th>LastName</th>"
                + "<th>Address</th>"
                + "<th>Phone</th>"
                + "<th>Email-ID</th>"
                + "<th>Userid</th>"
                + "<th>Role</th>"
                + "<th>Status</th>"
                + "</tr>"
                + "</thead>"
                + "<tbody>");

        while (rs.next()) {

            writer.print("<tr><th scope='row'>" + rs.getRow()
                    + "</th><td>" + rs.getString("firstname")
                    + "</td><td>" + rs.getString("lastname")
                    + "</td><td>" + rs.getString("address")
                    + "</td><td>" + rs.getString("phone")
                    + "</td><td>" + rs.getString("email")
                    + "</td><td>" + rs.getString("userid")
                    + "</td><td>" + rs.getString("role")
                    + "</td><td>" + rs.getString("status")
            );
        }

        writer.println("</tbody></table>");

        //rs.last();
        //int reccount = (int) rs.getRow();
        //con.close();
        //writer.println(reccount); //remove later

    } catch (Exception e) {
        System.err.println(e);
    }
%>

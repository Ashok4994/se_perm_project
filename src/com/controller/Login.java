package com.controller;

import com.admin.Connect_db;
import com.mysql.jdbc.jdbc2.optional.MysqlDataSource;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/Login")
public class Login extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        String uid = request.getParameter("uid").trim();
        String pass = request.getParameter("passwd").trim();

        String pswd = null;
        String fname = null;
        String lname = null;
        String userRole = null;
        String mobile=null;
        String email=null;
       
        PrintWriter out = response.getWriter();

        HttpSession userSession = null;

        try {
            Integer a = Integer.parseInt(uid);
            Statement stmt = Connect_db.getConnection().createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * from employee where userid=" + a + "");

            if (rs.next()) {
                pswd = rs.getString("password");
                fname=rs.getString("firstname");
                lname=rs.getString("lastname");
                mobile=rs.getString("phone");
                email=rs.getString("email");
                userRole=rs.getString("role");
            }

            //userRole = getUserRole(a); //get user role from database

            if (pass.equals(pswd)) {
            	
                userSession = request.getSession();
                userSession.setAttribute("user_id", a);
                userSession.setAttribute("fname", fname); 
                userSession.setAttribute("lname", lname);
                userSession.setAttribute("em", email);
                userSession.setAttribute("phone", mobile);
                switch (userRole) { //check user role and redirect
                    case "employee":
                        response.sendRedirect(request.getContextPath() + "/user_home.jsp");

                        break;
                    case "admin":
                        response.sendRedirect(request.getContextPath() + "/admin_home.jsp");
                        break;
                    case "manager":
                        response.sendRedirect(request.getContextPath() + "/manager_home.jsp");
                        break;
                    default:
                        request.setAttribute("errormsg", "Invalid Credentials");
                        request.getRequestDispatcher("login.jsp").forward(request, response);
                        break;
                }
            } else {
                request.setAttribute("errormsg", "Invalid Credentials");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            out.println("SQLException: " + e.getMessage());
        } catch (Exception e) {
            request.setAttribute("errormsg", "Invalid Credentials");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

   
}

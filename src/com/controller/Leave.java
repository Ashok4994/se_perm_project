package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.admin.Connect_db;

/**
 * Servlet implementation class Leave
 */
@WebServlet("/Leave")
public class Leave extends HttpServlet {
	private static final long serialVersionUID = 1L;
       


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		  String start_date = request.getParameter("sdate").toString();
	        String end_date = request.getParameter("enddate").toString();
	        String reason=request.getParameter("reason");
	        PrintWriter out=response.getWriter();
	       
	        
	        SimpleDateFormat sdf = new SimpleDateFormat("MM-dd-yyyy");
	        Date startDate = null;
	        Date endDate=null;
			try {
				out.print("inside date try block");
				startDate = sdf.parse(start_date);
			    endDate=sdf.parse(end_date);
			} catch (ParseException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
	        
			java.sql.Date s_Date = new java.sql.Date(startDate.getTime());
			java.sql.Date e_Date = new java.sql.Date(endDate.getTime());
			
	       out.println("outside data try block");
	        HttpSession session=request.getSession(); 
	        int m_id=0;
	        Integer id=(Integer) session.getAttribute("user_id");
	        
	        try 
	        {
	            //Db_Connection dbconn=new Db_Connection();
	            //Connection conn= dbconn.Connection();
	        	Class.forName("com.mysql.jdbc.Driver");
	        	//out.println("Connecting to database");
	            String TechWorld3g_2 = "jdbc:mysql://localhost:3306/termproject";
	            Statement stmt = Connect_db.getConnection().createStatement(); 
	            Connection conn = DriverManager.getConnection(TechWorld3g_2,"root","root");
	            //out.println("Connection made");
				 ResultSet rs1 = stmt.executeQuery("SELECT mid from employee where userid=" + id + "");
				   
				    if (rs1.next()) {
                m_id = rs1.getInt("mid");
                
            }
				   out.println(m_id);
				   /*
				    String sql = "INSERT INTO leave values (?,?,?,?,?,?)";
		            PreparedStatement statement = conn.prepareStatement(sql);
		          
		           // statement.setDate(1, new java.sql.Date(startDate.getTime()));  
		           // statement.setDate(2, new java.sql.Date(endDate.getTime()) ); 
		            statement.setDate(1, s_Date);
		            statement.setDate(2, e_Date);
		            statement.setInt(3, id);
		            out.println("after id");
		            statement.setString(4, reason);
		            statement.setInt(5, m_id);
		          
		            statement.setString(6, "pending");
		            out.println("before execute update"); 
		             */ 
				   String sql = "INSERT INTO leave2 values (?,?)";
		            PreparedStatement statement = conn.prepareStatement(sql);
				   
		          
		            statement.setDate(1, s_Date);
		            statement.setDate(2, e_Date);
		            int row = statement.executeUpdate();
			           out.println("row number"+row);
			            if (row > 0) 
			            {
			                //out.println("File uploaded!!!");
			                
			                conn.close();
			                
			                RequestDispatcher rs = request.getRequestDispatcher("user_home.jsp");
			                rs.include(request, response);
			            
			            }
			            else
			            {
			                out.println("Couldn't upload your file!!!");
			                
			                conn.close();
			                
			                RequestDispatcher rs = request.getRequestDispatcher("lsuccess.jsp");
			                rs.include(request, response);
			            }    
		            
		            
	        }catch(Exception e){e.printStackTrace();}  
		
	
	}

}

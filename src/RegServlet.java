

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.*;

/**
 * Servlet implementation class RegServlet
 */
@WebServlet("/RegServlet")
public class RegServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
   

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		try {
	 		String fname=request.getParameter("fname");
			String lname=request.getParameter("lname");
			 String address=request.getParameter("address");
	                String mobile=request.getParameter("mobile");
	                String email=request.getParameter("emailid");
	                String uid=request.getParameter("userid");
	                String passwd=request.getParameter("pswd");
	                String cpassword=request.getParameter("cpass");
	                
	           PrintWriter out=response.getWriter();
	                 out.println("hello dudes");        
	       		 Integer a=Integer.parseInt(uid);
	       		HttpSession userSession = null;
		
	         Class.forName("com.mysql.jdbc.Driver");
				Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/termproject","root","root");
			      out.print("got connection");
			    String insert="insert into employee values"+"(?,?,?,?,?,?,?,?,?,?,?)";
			    out.println("Inserting into db");
			    PreparedStatement pstm=connection.prepareStatement(insert);
			              pstm.setString(1,fname );
			              pstm.setString(2,lname);
	                      pstm.setString(3,address);
	                      pstm.setString(4,mobile);
	                      pstm.setString(5,email);
	                      pstm.setInt(6,a);
			              pstm.setString(7, passwd);
	                      pstm.setString(8,cpassword );
	                      pstm.setString(9,"employee");
	                      out.println("9 over");
	                      pstm.setString(10,null);
	                      pstm.setString(11,null);
			      pstm.executeUpdate();
			      out.println("updated database");
			        request.setAttribute("msg", "You are successfully registered");
				
			        
			} catch (Exception e) {
				// TODO Auto-generated catch block
	                        System.err.print(e);
			}
				
				
			}  
			 }
		
	
	
	



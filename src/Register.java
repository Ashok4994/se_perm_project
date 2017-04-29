
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class RegServlet
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		try {
			String fname = request.getParameter("fnm");
			String lname = request.getParameter("lnm");
			String address = request.getParameter("address");
			String mobile = request.getParameter("mobile");
			String email = request.getParameter("emailid");

			String uid = request.getParameter("userid");
			String passwd = request.getParameter("pswd");
			String cpassword = request.getParameter("cpass");

			PrintWriter out = response.getWriter();

			Integer a = Integer.parseInt(uid);

			Integer level_id = a % 10;
			HttpSession userSession = null;

			Class.forName("com.mysql.jdbc.Driver");
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/termproject", "root",
					"root");

			String insert = "insert into employee values" + "(?,?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement pstm = connection.prepareStatement(insert);
			pstm.setString(1, fname);
			pstm.setString(2, lname);
			pstm.setString(3, address);
			pstm.setString(4, mobile);
			pstm.setString(5, email);
			pstm.setInt(6, a);
			pstm.setString(7, passwd);
			pstm.setString(8, cpassword);
			pstm.setString(9, "employee");
			pstm.setString(10, null);
			pstm.setString(11, null);
			pstm.setInt(12, level_id);
			pstm.setInt(13, 0);
			pstm.executeUpdate();

			out.println("Successfully registered");

			request.setAttribute("msg", "You are successfully registered");
			request.getRequestDispatcher("login.jsp").forward(request, response);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.err.print(e);
			request.setAttribute("error", "Invalid credentials");
			request.getRequestDispatcher("register.jsp").forward(request, response);

		}
	}

}

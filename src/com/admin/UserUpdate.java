package com.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
/**
 * Servlet implementation class AdminUpdate
 */
@WebServlet("/UserUpdate")
public class UserUpdate extends HttpServlet {

	/**
	 * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
	 * methods.
	 *
	 * @param request
	 *            servlet request
	 * @param response
	 *            servlet response
	 * @throws ServletException
	 *             if a servlet-specific error occurs
	 * @throws IOException
	 *             if an I/O error occurs
	 */
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			/* TODO output your page here. You may use following sample code. */
			out.println("<!DOCTYPE html>");
			out.println("<html>");
			out.println("<head>");
			out.println("<title>Servlet AdminActions</title>");
			out.println("</head>");
			out.println("<body>");
			out.println("<h1>Servlet AdminActions at " + request.getContextPath() + "</h1>");
			out.println("</body>");
			out.println("</html>");
		}
	}

	// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on
	// the + sign on the left to edit the code.">
	/**
	 * Handles the HTTP <code>GET</code> method.
	 *
	 * @param request
	 *            servlet request
	 * @param response
	 *            servlet response
	 * @throws ServletException
	 *             if a servlet-specific error occurs
	 * @throws IOException
	 *             if an I/O error occurs
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// processRequest(request, response);
	}

	/**
	 * Handles the HTTP <code>POST</code> method.
	 *
	 * @param request
	 *            servlet request
	 * @param response
	 *            servlet response
	 * @throws ServletException
	 *             if a servlet-specific error occurs
	 * @throws IOException
	 *             if an I/O error occurs
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// processRequest(request, response);
		// string.replace('', '');
		PrintWriter out = response.getWriter();

		try {
			out.println(request.getParameter("fname").trim());

			out.println(request.getParameter("userid").trim());
			// out.println(request.getParameter("email-id").trim());
			// out.println(request.getParameter("userid").trim());
			// out.println(request.getParameter("gender").trim());
			// out.println(request.getParameter("role").trim());

			Statement stmt = Connect_db.getConnection().createStatement();
			out.print("Before sql");
			String sql = "update employee " + "set firstname= '" + request.getParameter("fname").trim() + "',"
					+ "lastname= '" + request.getParameter("lname") + "'," + "address= '"
					+ request.getParameter("address").trim() + "', " + "phone='"
					+ request.getParameter("mobile_number").trim() + "', " + "email='"
					+ request.getParameter("email_id").trim() + "'" + "where userid= "
					+ request.getParameter("userid").trim();
			out.print("before execute");
			int count = stmt.executeUpdate(sql);
			if (count > 0) {
				RequestDispatcher rd = request.getRequestDispatcher("user_home.jsp");
				rd.forward(request, response);
			}
			/**
			 * switch (count) { case 1: out.println("case 1: " + count);
			 * HttpSession session = request.getSession();
			 * session.setAttribute("successmsg", "Successfully updated profile
			 * for userid: " + request.getParameter("userid"));
			 * request.setAttribute("successmsg", "Successfully updated profile
			 * for userid: " + request.getParameter("userid"));
			 * 
			 * String referer = request.getHeader("Referer");
			 * 
			 * if (referer.toLowerCase().contains("my-profile.jsp")) { //
			 * redirect // to // food // menu //
			 * response.sendRedirect(request.getContextPath() + //
			 * "/controller?actionCode=doGetListofItems"); RequestDispatcher rd
			 * = getServletContext().getRequestDispatcher("user_home.jsp");
			 * rd.forward(request, response); } else {
			 * response.sendRedirect(request.getContextPath() +
			 * "/admin/people.jsp#user-list"); // else // assuming // form //
			 * was // submitted // from // admin // page // RequestDispatcher rd
			 * = //
			 * getServletContext().getRequestDispatcher("/admin/people.jsp#user-list");
			 * // rd.forward(request, response); } break; default:
			 * out.println("Error case 0"); break; }
			 * 
			 */
		} catch (Exception e) {
			System.err.println(e);
		}
	}

}

package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.admin.Connect_db;

/**
 * Servlet implementation class ApproveLeave
 */
@WebServlet("/ApproveLeave")
public class ApproveLeave extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		String perm = request.getParameter("perm");
		Integer uid = Integer.parseInt(request.getParameter("empid"));
		PrintWriter out = response.getWriter();
		// out.println(perm);
		// out.println(uid);
		try {

			Statement stmt = Connect_db.getConnection().createStatement();
			// out.print("Before sql");

			String sql = "update leave2 " + "set status= '" + perm + "'" + "where emp_id= " + uid;

			// out.print("before execute");
			int count = stmt.executeUpdate(sql);
			out.print(count);
			if (count > 0) {
				RequestDispatcher rd = request.getRequestDispatcher("user_home.jsp");
				rd.forward(request, response);
			}

		} catch (Exception e) {
			System.err.println(e);
		}
	}

}

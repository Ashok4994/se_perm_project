package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.admin.Connect_db;

/**
 * Servlet implementation class CreatDirectory
 */
@WebServlet("/CreatDirectory")
public class CreatDirectory extends HttpServlet {

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		String dir_name = request.getParameter("name");
		String dir_id = request.getParameter("id");
		String perm = request.getParameter("perm");
		Integer dirid = Integer.parseInt(dir_id);

		HttpSession session = request.getSession();
		int m_id = 0;
		Integer id = (Integer) session.getAttribute("user_id");

		try {

			Class.forName("com.mysql.jdbc.Driver");

			String TechWorld3g_2 = "jdbc:mysql://localhost:3306/termproject";
			Statement stmt = Connect_db.getConnection().createStatement();
			Connection conn = DriverManager.getConnection(TechWorld3g_2, "root", "root");
			String sql = "INSERT INTO directory values (?,?,?,?)";
			PreparedStatement pstm = conn.prepareStatement(sql);
			pstm.setInt(1, id);
			pstm.setString(2, dir_name);
			pstm.setInt(3, dirid);
			pstm.setString(4, perm);
			int row = pstm.executeUpdate();
			if (row > 0) {
				// out.println("File uploaded!!!");

				conn.close();

				RequestDispatcher rs = request.getRequestDispatcher("user_home.jsp");
				rs.include(request, response);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
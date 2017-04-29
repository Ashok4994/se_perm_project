package com.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.admin.Connect_db;

/**
 * Servlet implementation class Upload
 */

@WebServlet("/Upload")
@MultipartConfig(maxFileSize = 16177215)
public class Upload extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		String title = request.getParameter("title");
		Part filePart = request.getPart("file_uploaded");
		PrintWriter out = response.getWriter();
		InputStream inputStream = null;
		Random rand = new Random();
		int n = rand.nextInt(9999) + 1;
		String idTemp = (String.valueOf(n));
		String type_file = null;
		HttpSession session = request.getSession();
		int m_id = 0, dir_id = 0;
		Integer id = (Integer) session.getAttribute("user_id");
		if (session != null) {
			if (filePart != null) {
				// out.println(filePart.getName());
				// out.println(filePart.getSize());
				type_file = filePart.getContentType();

				inputStream = filePart.getInputStream();

			} else {
				out.println("File part is null");
			}

			try {
				// Db_Connection dbconn=new Db_Connection();
				// Connection conn= dbconn.Connection();
				Class.forName("com.mysql.jdbc.Driver");
				// out.println("Connecting to database");
				String TechWorld3g_2 = "jdbc:mysql://localhost:3306/termproject";
				Statement stmt = Connect_db.getConnection().createStatement();
				Connection conn = DriverManager.getConnection(TechWorld3g_2, "root", "root");
				// out.println("Connection made");

				/*
				 * ResultSet rs1 =
				 * stmt.executeQuery("SELECT mid from employee where userid=" +
				 * id + "");
				 * 
				 * if (rs1.next()) { m_id = rs1.getInt("mid");
				 * 
				 * } // out.print(m_id);
				 * 
				 * ResultSet rs2 =
				 * stmt.executeQuery("SELECT * from directory where manager_id="
				 * + m_id + ""); // out.println("after rs2");
				 */

				String sql22 = "SELECT d.manager_id,d.dir_id FROM termproject.employee e, termproject.directory d where e.userid="
						+ id + " and e.mid=d.manager_id;";
				ResultSet rs2 = stmt.executeQuery(sql22);
				if (rs2.next()) {
					dir_id = rs2.getInt("dir_id");

				}

				// out.println("dir_id"+dir_id);
				String sql = "INSERT INTO files values (?,?,?,?,?)";
				PreparedStatement statement = conn.prepareStatement(sql);
				statement.setInt(1, dir_id);

				statement.setString(3, title);

				// statement.setInt(4,id);

				statement.setString(4, type_file);

				statement.setInt(5, id);

				// out.println(type_file);
				if (inputStream != null) {
					statement.setBinaryStream(2, inputStream, (int) filePart.getSize());
					// statement.setBlob(3,inputStream);
					// out.println("xls inserted");
				}

				// out.println("before execute update");
				int row = statement.executeUpdate();
				// out.println("row number"+row);
				if (row > 0) {
					// out.println("File uploaded!!!");

					conn.close();

					RequestDispatcher rs = request.getRequestDispatcher("user_home.jsp");
					rs.include(request, response);

				} else {
					out.println("Couldn't upload your file!!!");

					conn.close();

					RequestDispatcher rs = request.getRequestDispatcher("lsuccess.jsp");
					rs.include(request, response);
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			response.sendRedirect("signin.jsp");
		}

	}

}

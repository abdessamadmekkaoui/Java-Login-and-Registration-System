package com.registration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Base64;


@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uemail = request.getParameter("username");
		String upwd = request.getParameter("password");
		HttpSession session = request.getSession();
		RequestDispatcher dispatcher = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/first_test_project?useSSL=false","root","123");
			PreparedStatement pst = con.prepareStatement("select * from users where uemail = ? and upassword = ?");
			pst.setString(1,uemail);
			pst.setString(2, upwd);
			ResultSet rs = pst.executeQuery();
			if(rs.next()) {
			    session.setAttribute("name", rs.getString("uname"));
			    session.setAttribute("email", rs.getString("uemail"));
			    session.setAttribute("password", rs.getString("upassword"));
			    session.setAttribute("phone", rs.getString("uphone"));
			    session.setAttribute("naissance", rs.getString("dateN"));
			    dispatcher = request.getRequestDispatcher("index.jsp");
	            if (rs.getBlob("imag") != null) {
                    byte[] imageBytes = rs.getBlob("imag").getBytes(1, (int) rs.getBlob("imag").length());
                    String base64Image = Base64.getEncoder().encodeToString(imageBytes);
                    session.setAttribute("profile_image", base64Image);
                } else {
                    session.setAttribute("profile_image", null);
                }
                dispatcher = request.getRequestDispatcher("index.jsp");


			}else {
				request.setAttribute("status", "failed");
				dispatcher = request.getRequestDispatcher("login.jsp");
			}
			dispatcher.forward(request,response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}

package com.registration;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

@WebServlet("/register")
@MultipartConfig(maxFileSize = 1024*1024*10) // 10MB max file size

public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	String uname = request.getParameter("name");
	String uemail = request.getParameter("email");
	String upwd = request.getParameter("pass");
	String uphone = request.getParameter("contact");
	String udate = request.getParameter("naissance");
	Part filePart = request.getPart("profile_image");
	RequestDispatcher dispatcher = null;
	Connection con = null;
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/first_test_project?useSSL=false","root","123");
		PreparedStatement pst = con.prepareStatement("insert into users (uname,uemail,upassword,uphone,imag, dateN) values (?,?,?,?,?,?)");
		pst.setString(1, uname);
		pst.setString(2, uemail);
		pst.setString(3, upwd);
		pst.setString(4, uphone);
		pst.setString(6, udate);
		 if (filePart != null) {
             InputStream inputStream = filePart.getInputStream();
             pst.setBlob(5, inputStream);
         } else {
             pst.setNull(5, Types.BLOB); // If no image is uploaded, set the profile image column to null
         }
		
		int rowCount = pst.executeUpdate();
		dispatcher = request.getRequestDispatcher("registration.jsp");
		if (rowCount>0) {
			request.setAttribute("status", "success");
		}else {
			request.setAttribute("status", "failed");
		}
		dispatcher.forward(request, response);

	}catch (Exception e) {
		e.printStackTrace();
	}finally {
		try {
			if (con != null) {
                con.close();
            }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	}

}

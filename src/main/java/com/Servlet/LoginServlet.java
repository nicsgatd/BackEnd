package com.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
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

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/Login")
public class LoginServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String url="jdbc:mysql://localhost:3306/admin_management";
		String dbUsername= "root";
		String dbPassword= "root";
		PrintWriter out= response.getWriter();
	
		try {
			//declaring Driver Class and connecting to database
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connection=DriverManager.getConnection(url,dbUsername,dbPassword);
			
			//calling parameters from html table
			String username= request.getParameter("username");
			String password= request.getParameter("password");
			if(connection!=null) {
			PreparedStatement preparedStatement=connection.prepareStatement
					("select username from login where username=? and password=?");
			preparedStatement.setString(1, username);
			preparedStatement.setString(2, password);
			ResultSet rs=preparedStatement.executeQuery();
			out.print("Running at servlet");
			
			if(rs.next()) {
				RequestDispatcher rd=request.getRequestDispatcher("dashboard.jsp");
				rd.forward(request, response);
				out.print("Redirecting done");
				System.out.println("Redirecting to Dashboard");
				

			
				
			}else {
				System.out.println("Try Again");
				RequestDispatcher rd=request.getRequestDispatcher("index.html");
				rd.forward(request, response);
				out.print("Redirecting error");	
			
				 
				//System.out.println(student.getId());
			
			}
			 HttpSession session = request.getSession();
			    session.setAttribute("username", request.getParameter("password"));
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	

	}
}

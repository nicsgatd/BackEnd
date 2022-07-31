package com.Servlet;

import java.io.IOException;
import java.net.http.HttpClient.Redirect;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.model.naming.CamelCaseToUnderscoresNamingStrategy;

import Entities.Classes;
import Entities.Student;
import Entities.Subject;
import Entities.Teachers;
import Hibernate.HibernateUtil;
import jakarta.transaction.RollbackException;

/**
 * Servlet implementation class Operations
 */
@WebServlet("/Operations")
public class Operations extends HttpServlet {

	private Session session;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			SessionFactory sessionFactory= HibernateUtil.getSessinFactory();
			session=sessionFactory.openSession();
			Transaction tx= session.beginTransaction();
			
			System.out.println("coming");
			
			String className= request.getParameter("classesName");
			String subName= request.getParameter("subjectName");
			String teachersName= request.getParameter("teachersName");

			
		//	int subjectId=Integer.parseInt(request.getParameter("id").trim());
			System.out.println("coming");
			
				if (subName!=null) {
					Subject subject= new Subject(subName);
					
					session.save(subject);
					tx.commit();
					session.close();
					response.sendRedirect("list.jsp");
					tx.rollback();
					
				}else if (className!=null) {
					Classes classes = new Classes(className);
					
					session.save(classes);
					tx.commit();
					session.close();
					response.sendRedirect("classlist.jsp");
					tx.rollback();
					
					
				}else if (teachersName!=null) {
					Teachers teachers=new Teachers(teachersName);
					session.save(teachers);
					tx.commit();
					session.close();
					response.sendRedirect("teacherslist.jsp");
					tx.rollback();
				}	
				else {
					RequestDispatcher rd=request.getRequestDispatcher("dashboard.jsp");
					rd.forward(request, response);
					tx.rollback();
				}
		
				
				
				
				
				
				
				
				
		
		
					
			

			
		} catch (Exception e) {
				e.printStackTrace();
			
		}		
	}
}




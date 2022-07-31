package com.Servlet;

import java.io.IOException;

import javax.management.loading.PrivateClassLoader;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import Entities.Classes;
import Entities.Student;
import Hibernate.HibernateUtil;

/**
 * Servlet implementation class StudentDelete
 */
@WebServlet("/StudentDelete")
public class StudentDelete extends HttpServlet {

	private Session session;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int studentId=Integer.parseInt(request.getParameter("student_id"));

			SessionFactory sessionFactory= HibernateUtil.getSessinFactory();
			session=sessionFactory.openSession();
			Transaction transaction=session.beginTransaction();
			
	
			Student student= session.get(Student.class,studentId);
			session.delete(student);
			transaction.commit();
			session.close();
			response.sendRedirect("studentlist.jsp");
			
		
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	

}

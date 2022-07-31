package com.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import Entities.Classes;
import Entities.Subject;
import Hibernate.HibernateUtil;

/**
 * Servlet implementation class ClassDelete
 */
@WebServlet("/ClassDelete")
public class ClassDelete extends HttpServlet {
	private Session session;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			int subjectId=Integer.parseInt(request.getParameter("classes_id"));

			SessionFactory sessionFactory= HibernateUtil.getSessinFactory();
			session=sessionFactory.openSession();
			Transaction transaction=session.beginTransaction();
			
	
			Classes classes= session.get(Classes.class,subjectId);
			session.delete(classes);
			transaction.commit();
			session.close();
			response.sendRedirect("classlist.jsp");
			
		
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	
}

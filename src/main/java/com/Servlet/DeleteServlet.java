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

import Entities.Subject;
import Hibernate.HibernateUtil;

/**
 * Servlet implementation class DeleteServlet
 */
@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
	
	private Session session;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			int subjectId=Integer.parseInt(request.getParameter("subject_id").trim());

			SessionFactory sessionFactory= HibernateUtil.getSessinFactory();
			session=sessionFactory.openSession();
			Transaction transaction=session.beginTransaction();
			
		if(subjectId>0) {
			Subject subject= session.get(Subject.class,subjectId);
			session.delete(subject);
			transaction.commit();
			session.close();
			response.sendRedirect("list.jsp");
			
		}
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}

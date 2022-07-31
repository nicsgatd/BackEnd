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
 * Servlet implementation class UpdateServlet
 */
@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {

	private Session session;
    public UpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	try {
		System.out.println("Update");

		int subjectId=Integer.parseInt(request.getParameter("id").trim());
		String subjectName=request.getParameter("subjectName").trim();
		
		SessionFactory sessionFactory= HibernateUtil.getSessinFactory();
		session=sessionFactory.openSession();
		Transaction transaction=session.beginTransaction();
		
		Subject subject= session.get(Subject.class,subjectId);
		
		subject.setSubjectName(subjectName);
		
		transaction.commit();
		session.close();
		response.sendRedirect("list.jsp");
		
	} catch (Exception e) {
		// TODO: handle exception
	}
	}

}

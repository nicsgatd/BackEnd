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
import Entities.Student;
import Hibernate.HibernateUtil;

/**
 * Servlet implementation class AddStudent
 */
@WebServlet("/AddStudent")
public class AddStudent extends HttpServlet {

	private Session session;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
		SessionFactory sessionFactory= HibernateUtil.getSessinFactory();
		session=sessionFactory.openSession();
		Transaction tx= session.beginTransaction();
		
		
		String fName= request.getParameter("fName");
		String lName= request.getParameter("lName");
		String gender= request.getParameter("gender");
		int studentClass= Integer.parseInt(request.getParameter("studentClassID"));
		
			Classes classes=new Classes();
			classes.setId(studentClass);
			Student student= new Student(fName, lName,gender,classes);
			
			session.save(student);
			tx.commit();
			session.close();
			response.sendRedirect("studentlist.jsp");
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}

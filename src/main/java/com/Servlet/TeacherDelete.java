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
import Entities.Teachers;
import Hibernate.HibernateUtil;

/**
 * Servlet implementation class TeacherDelete
 */
@WebServlet("/TeacherDelete")
public class TeacherDelete extends HttpServlet {
	private Session session;
    

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			int teacherId=Integer.parseInt(request.getParameter("teachers_id").trim());

			SessionFactory sessionFactory= HibernateUtil.getSessinFactory();
			session=sessionFactory.openSession();
			Transaction transaction=session.beginTransaction();
			
	
			Teachers teachers= session.get(Teachers.class,teacherId);
			session.delete(teachers);
			transaction.commit();
			session.close();
			response.sendRedirect("teacherslist.jsp");
			
		
		} catch (Exception e) {
			// TODO: handle exception
		}
	}


}

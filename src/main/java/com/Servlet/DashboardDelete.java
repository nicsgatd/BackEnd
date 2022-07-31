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
import Entities.Main_Dashboard;
import Hibernate.HibernateUtil;

/**
 * Servlet implementation class DashboardDelete
 */
@WebServlet("/DashboardDelete")
public class DashboardDelete extends HttpServlet {

	private Session session;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int dbId=Integer.parseInt(request.getParameter("DB_id"));

			SessionFactory sessionFactory= HibernateUtil.getSessinFactory();
			session=sessionFactory.openSession();
			Transaction transaction=session.beginTransaction();
			
	
			Main_Dashboard main_Dashboard= session.get(Main_Dashboard.class,dbId);
			session.delete(main_Dashboard);
			transaction.commit();
			session.close();
			response.sendRedirect("dashboard.jsp");
			
		
		} catch (Exception e) {
			// TODO: handle exception
		}
	}


}

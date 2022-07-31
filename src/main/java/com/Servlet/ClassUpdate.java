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
 * Servlet implementation class ClassUpdate
 */
@WebServlet("/ClassUpdate")
public class ClassUpdate extends HttpServlet {

	private Session session;
    public ClassUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			System.out.println("Update");

			int classesId=Integer.parseInt(request.getParameter("id").trim());
			String classesName=request.getParameter("classesName").trim();
			
			SessionFactory sessionFactory= HibernateUtil.getSessinFactory();
			session=sessionFactory.openSession();
			Transaction transaction=session.beginTransaction();
			
			Classes classes= session.get(Classes.class,classesId);
			
			classes.setClassName(classesName);
			
			transaction.commit();
			session.close();
			response.sendRedirect("classlist.jsp");
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		}
	}



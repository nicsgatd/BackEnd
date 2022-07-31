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
 * Servlet implementation class TeacherUpdate
 */
@WebServlet("/TeacherUpdate")
public class TeacherUpdate extends HttpServlet {
	private Session session;
    public TeacherUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			System.out.println("Update");

			int teachersId=Integer.parseInt(request.getParameter("id").trim());
			String teachersName=request.getParameter("teachersName").trim();
			
			SessionFactory sessionFactory= HibernateUtil.getSessinFactory();
			session=sessionFactory.openSession();
			Transaction transaction=session.beginTransaction();
			
			Teachers teachers= session.get(Teachers.class,teachersId);
			
			teachers.setTeachersName(teachersName);
			
			transaction.commit();
			session.close();
			response.sendRedirect("teacherslist.jsp");
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		}
	}



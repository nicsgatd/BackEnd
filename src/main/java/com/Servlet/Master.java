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
import Entities.Subject;
import Entities.Teachers;
import Hibernate.HibernateUtil;

/**
 * Servlet implementation class Master
 */
@WebServlet("/Master")
public class Master extends HttpServlet {
	private Session session;
    public Master() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			SessionFactory sessionFactory= HibernateUtil.getSessinFactory();
			session=sessionFactory.openSession();
			Transaction tx= session.beginTransaction();
			System.out.println("dashboard in");
			int classId=Integer.parseInt(request.getParameter("masterClass"));
			int subjectId=Integer.parseInt(request.getParameter("masterSubject"));
			int teacherId=Integer.parseInt(request.getParameter("masterTeacher"));
			
			//String className= request.getParameter("masterClass");
			//String subName= request.getParameter("masterSubject");
			//String teachersName= request.getParameter("masterTeacher");
			
			Classes classes=new Classes();
			classes.setId(classId);
			
			Subject subject=new Subject();
			subject.setId(subjectId);
			
			Teachers teachers=new Teachers();
			teachers.setId(teacherId);
			
		
			
			Main_Dashboard main_Dashboard= new Main_Dashboard(classes, subject,teachers);
	
			
			session.save(main_Dashboard);
			tx.commit();
			session.close();
			response.sendRedirect("dashboard.jsp");
			tx.rollback();
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

}

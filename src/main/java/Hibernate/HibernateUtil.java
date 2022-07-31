package Hibernate;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import Entities.Classes;
import Entities.Main_Dashboard;
import Entities.Student;
import Entities.Subject;
import Entities.Teachers;



public class HibernateUtil {
	
private static SessionFactory sessionFactory;
	
	public static SessionFactory getSessinFactory() {
		if(sessionFactory==null) {
			
			sessionFactory= new Configuration().configure("hibernate.cfg.xml")
					.addAnnotatedClass(Classes.class).addAnnotatedClass(Student.class)
					.addAnnotatedClass(Subject.class).addAnnotatedClass(Teachers.class)
					.addAnnotatedClass(Main_Dashboard.class)
					.buildSessionFactory();
			
	}
		return sessionFactory;
}
}
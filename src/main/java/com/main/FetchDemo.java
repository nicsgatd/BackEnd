package com.main;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import Entities.Subject;
import jakarta.persistence.TypedQuery;

public class FetchDemo {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Configuration cfg= new Configuration().addAnnotatedClass(Subject.class);
		cfg.configure();
		SessionFactory factory= cfg.buildSessionFactory();
		Session session=factory.openSession();
		Transaction transaction= session.beginTransaction();
		
		String hql="from Subject";
		Query query=session.createQuery(hql);
		List<Subject> results=query.list();
		
		for(Subject subject:results) {
			System.out.println(subject.getSubjectName());
		}
		
		transaction.commit();
		session.close();
		
		
		
		
		
		
		
		
		
	//	Subject sub= new Subject("History");
		
		//session.save(sub);
	//	Subject subject=session.get(Subject.class,1);
		//view data
//		System.out.println(subject.getSubjectName());
		//update data
	//	subject.setSubjectName("Maths");
		//delete data
	//	session.delete(subject);
		
		
	}

}

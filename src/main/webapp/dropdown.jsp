<%@page import="Entities.Teachers"%>
<%@page import="Entities.Subject"%>
<%@page import="Entities.Classes"%>

<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="Hibernate.HibernateUtil"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>

<%@page import="java.util.List"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="Hibernate.HibernateUtil"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <link rel="stylesheet" href="css/student.css">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="bar.jsp" />
<div class="center">
<h3>Classes</h3>
<%

Configuration cfg= new Configuration().addAnnotatedClass(Classes.class).addAnnotatedClass(Subject.class)
.addAnnotatedClass(Teachers.class);
cfg.configure();
SessionFactory factory= cfg.buildSessionFactory();
Session s1=factory.openSession();
Transaction transaction= s1.beginTransaction();

String hql="from Classes";
String hql1="from Subject";
String hql2="from Teachers";
Query query=s1.createQuery(hql);
Query query1=s1.createQuery(hql1);
Query query2=s1.createQuery(hql2);

List<Classes> results=query.list();
List<Subject> results1=query1.list();
List<Teachers> results2=query2.list();
%>
<form action="Master" method="post">
 <div class="form-group">
   <label for="exampleFormControlSelect2">Select Class Name</label>
    <select name="masterClass" class="form-control" id="exampleFormControlSelect1">  
  <% for(Classes classes:results) {%>
   <option value="<%= classes.getId()%>"><% System.out.println(classes.getClassName());
				out.println(classes.getClassName());%></option>
  <%} %>
  </select>		
  <br>
  <div class="form-group">
   <label for="exampleFormControlSelect2">Select Subject Name</label>
    <select name="masterSubject" class="form-control" id="exampleFormControlSelect1"> 
  <% for(Subject subject:results1) {%>
   <option value="<%= subject.getId()%>"><% System.out.println(subject.getSubjectName());
				out.println(subject.getSubjectName());%></option>
  <%} %>
  </select>	
  <br>
    <div class="form-group">
   <label for="exampleFormControlSelect2">Select Teacher Name</label>
    <select name="masterTeacher" class="form-control" id="exampleFormControlSelect1"> 
  <% for(Teachers teachers:results2) {%>
   <option value="<%= teachers.getId()%>"><% System.out.println(teachers.getTeachersName());
				out.println(teachers.getTeachersName());%></option>
  <%} %>
  </select>	
  <br>
  <input type="submit" value="submit">
</form>









		
				
<%transaction.commit();
s1.close();
 %>
  

</div>
</body>
</html>
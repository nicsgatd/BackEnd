<%@page import="Entities.Student"%>
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
<title>Add Student</title>
</head>
<body>
<jsp:include page="bar.jsp" />
<div class="center">
<h3 >Student</h3>
<%

Configuration cfg= new Configuration().addAnnotatedClass(Student.class).addAnnotatedClass(Classes.class);
cfg.configure();
SessionFactory factory= cfg.buildSessionFactory();
Session s1=factory.openSession();
Transaction transaction= s1.beginTransaction();

String hql="from Student";
String hql1="from Classes";
Query query=s1.createQuery(hql);
Query query1=s1.createQuery(hql1);
List<Student> results=query.list();
List<Classes> results1=query1.list();
%>
<br>

<form action="AddStudent" method="post">
  <div class="form-group">
  <input type="text" name="fName"  class="form-control" id="exampleFormControlInput1" placeholder="First Name">
  </div>
   <div class="form-group">
   <input type="text" name="lName" class="form-control" id="exampleFormControlInput1" placeholder="Last Name">
  </div>
    <div class="form-group">
    <label for="exampleFormControlSelect2">Select Gender</label>
    <select name="gender" class="form-control" id="exampleFormControlSelect1">  
     <option></option>
     <option>Male</option>
      <option>Female</option>
       <option>Others</option>
    </select>
  </div>
  <div class="form-group">
    <label for="exampleFormControlSelect2">Select Student Class</label>
    <select name="studentClassID" class="form-control" id="exampleFormControlSelect1"> 
    
<% for(Classes classes:results1) {%>     
<option value="<%= classes.getId()%>"><% System.out.println(classes.getClassName());
				out.println(classes.getClassName());%></option>
       <%} %>
    </select>
  </div>


  	<input type="submit" Value="Submit">
  
</form>





</form>
<% 
transaction.commit();
s1.close();
 %>
  

</div>
</body>
</html>
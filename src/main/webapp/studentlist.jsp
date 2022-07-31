<%@page import="Entities.Student"%>
<%@page import="Entities.Classes"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Entities.Subject"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="Hibernate.HibernateUtil"%>
<%@page import="org.hibernate.SessionFactory"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/New.css">
<meta charset="ISO-8859-1">
<title>Students List</title>
</head>
<body>
<jsp:include page="bar.jsp" />
 <div class="center">
 <h3>Students List</h3>
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
<div align="center">

<h4 margin-top="5px"><a href="addStudent.jsp"><img src="img/4.jpg" width="25" height="20"></a></h4>
</div>


 <div style="padding-left:10%; padding-right:10%">
<table class="table table-striped">
  <tr>
      <th nowrap>First Name</th>     
      <th nowrap>Last Name</th>
      <th nowrap>Gender</th>
      <th nowrap>Class Name</th>
      
      <th nowrap>Delete</th>
      
    </tr>
 	 <% for(Student student:results) {%>
  
 	<tr>
         <td><% System.out.println(student.getfName());
				out.println(student.getfName());%></td>
				 <td><% System.out.println(student.getlName());
				out.println(student.getlName());%></td>
				   <td><% System.out.println(student.getGender());
				out.println(student.getGender());%></td>
				 <td><% System.out.println(student.getClasses().getClassName());
				out.println(student.getClasses().getClassName());%></td>
				  				  
				<%int Id = student.getId();  %>
				
		
			<td ><a href="StudentDelete?student_id=<%= student.getId()%>"><img src="img/1.png" width="40" height="20"></a></td>
    	 </tr>
    	
    	 
	<%} %>  
	    
<% 
transaction.commit();
s1.close();
 %>
</table>    
	</div> 
  <br>

 </div>
</body>
</html>
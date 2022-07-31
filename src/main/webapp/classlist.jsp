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
<title>Class List</title>
</head>
<body>
<jsp:include page="bar.jsp" />
 <div class="center" >
 <h3 align="center" style="padding: 20px !important;">Classes List</h3>
<%

Configuration cfg= new Configuration().addAnnotatedClass(Classes.class);
cfg.configure();
SessionFactory factory= cfg.buildSessionFactory();
Session s1=factory.openSession();
Transaction transaction= s1.beginTransaction();

String hql="from Classes";
Query query=s1.createQuery(hql);
List<Classes> results=query.list();
%>


<div align="center"  > 

<h4 margin-top="5px"><a href="addClasses.jsp"><img src="img/4.jpg" width="25" height="20"></a></h4></div>

 
<div style="padding-left:10%; padding-right:10%">
  <table class="table table-striped">

      <tr>
      <th class="th-sm" nowrap>Class Name</th>     
      <th class="th-sm"nowrap>Edit</th>
      <th class="th-sm"nowrap>Delete</th>
      </tr>
 	  <% for(Classes classes:results) {%>
   	  <tr>
      <td><% System.out.println(classes.getClassName());
				out.println(classes.getClassName());%></td>
				  
	   <%int Id = classes.getId();  %>
				
	  <td width=20%><a href="classedit.jsp?classes_id=<%= classes.getId()%>"><img src="img/2.jpg" width="25" height="20"></a></td>
	  <td width=20%><a href="ClassDelete?classes_id=<%= classes.getId()%>"><img src="img/1.png" width="40" height="20"></a></td>
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
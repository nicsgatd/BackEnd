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
 <link rel="stylesheet" href="css/New1.css">
<title>Add Classes</title>
</head>
<body>
<jsp:include page="bar.jsp" />
<div class="center">
<h3>Classes</h3>
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
<form action="Operations" method="post">
<br>  <div class="txt_field">
	<input type="text"name="classesName" required>
	<span></span>
	</div>
	<input type="submit" Value="Submit">


</form>
<% 
transaction.commit();
s1.close();
 %>
  

</div>
</body>
</html>
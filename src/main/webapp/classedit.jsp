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
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %><%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
 <link rel="stylesheet" href="css/New1.css">
<meta charset="ISO-8859-1">
<title>Update Classes</title>
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

<%int classesId=Integer.parseInt(request.getParameter("classes_id").trim());
Classes classes= s1.get(Classes.class,classesId);
%>
<form action="ClassUpdate" method="post"  >
<br>  <div class="txt_field">
	<input type="hidden" name="id" value="<%=classes.getId()%>">
	<input type="text"name="classesName" value="<%=classes.getClassName()%>" required>
	<span></span>
	</div>
	<input type="submit" Value="Submit">


</form>
</div>
</body>
</html>
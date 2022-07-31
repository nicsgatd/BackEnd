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
<title>Edit Subject</title>
</head>
<body>
<jsp:include page="bar.jsp" />
<div class="center">
<h3>Subject</h3>
<%

Configuration cfg= new Configuration().addAnnotatedClass(Subject.class);
cfg.configure();
SessionFactory factory= cfg.buildSessionFactory();
Session s1=factory.openSession();
Transaction transaction= s1.beginTransaction();

String hql="from Subject";
Query query=s1.createQuery(hql);
List<Subject> results=query.list();
%>

<%int subjectId=Integer.parseInt(request.getParameter("subject_id").trim());
Subject subject= s1.get(Subject.class,subjectId);
%>
<form action="UpdateServlet" method="post"  >
<br>  <div class="txt_field">
	<input type="hidden" name="id" value="<%=subject.getId()%>">
	<input type="text"name="subjectName" value="<%=subject.getSubjectName()%>" required>
	<span></span>
	</div>
	<input type="submit" Value="Submit">


</form>
</div>
</body>
</html>
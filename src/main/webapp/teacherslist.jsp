<%@page import="Entities.Classes"%>
<%@page import="Entities.Teachers"%>
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
<title>Insert title here</title>
</head>
<body>
<jsp:include page="bar.jsp" />
 <div class="center">
 <h3>Teachers List</h3>
<%

Configuration cfg= new Configuration().addAnnotatedClass(Teachers.class);
cfg.configure();
SessionFactory factory= cfg.buildSessionFactory();
Session s1=factory.openSession();
Transaction transaction= s1.beginTransaction();

String hql="from Teachers";
Query query=s1.createQuery(hql);
List<Teachers> results=query.list();
%>
<div align="center">


<h4><a href="addTeachers.jsp"><img src="img/4.jpg" width="25" height="20"></a></h4>

</div>



<div style="padding-left:10%; padding-right:10%">
 <table class="table table-striped">
   <tr>
      <th nowrap>Teacher Name</th>     
      <th nowrap>Edit</th>
      <th nowrap>Delete</th>
    </tr>
 	 <% for(Teachers teachers:results) {%>
   
 	<tr>
         <td><% System.out.println(teachers.getTeachersName());
				out.println(teachers.getTeachersName());%></td>
				  
				<%int Id = teachers.getId(); %>
				
			<td width="20%"><a href="teacheredit.jsp?teachers_id=<%= teachers.getId()%>"><img src="img/2.jpg" width="25" height="20"></a></td>
			<td width="20%"><a href="TeacherDelete?teachers_id=<%= teachers.getId()%>"><img src="img/1.png" width="40" height="20"></a></td>
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
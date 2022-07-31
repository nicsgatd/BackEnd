<%@page import="Entities.Teachers"%>
<%@page import="Entities.Subject"%>
<%@page import="Entities.Main_Dashboard"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="Entities.Classes"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/New.css">

<title>Dashboard</title>
</head>
<body>


<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="dashboard.jsp">Admin Management</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
       </li>
          <li class="nav-item">
        <a class="nav-link" href="dropdown.jsp">Dashboard Master</a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="classlist.jsp">Classes </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="list.jsp">Subjects</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="teacherslist.jsp">Teachers</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="studentlist.jsp">Students</a>
     
            <li class="nav-item">
        <a class="nav-link" href="index.html">Logout</a>
      </li>
      


     
    </ul>
  
  </div>
</nav>
<div class="center" style="width: 80% !important;">
<h3 align="center" style="padding: 20px !important;">Welcome to Dashboard</h3>

<%

Configuration cfg= new Configuration().addAnnotatedClass(Main_Dashboard.class).addAnnotatedClass(Classes.class)
.addAnnotatedClass(Subject.class).addAnnotatedClass(Teachers.class);
cfg.configure();
SessionFactory factory= cfg.buildSessionFactory();
Session s1=factory.openSession();
Transaction transaction= s1.beginTransaction();

String hql="from Main_Dashboard";
String hq2="from Classes";
String hq3="from Subject";
String hq4="from Teachers";

Query query=s1.createQuery(hql);
Query query1=s1.createQuery(hq2);
Query query2=s1.createQuery(hq3);
Query query3=s1.createQuery(hq4);

List<Main_Dashboard> results=query.list();
List<Classes> results1=query1.list();
List<Subject> results2=query2.list();
List<Teachers> results3=query3.list();

%>
 <div class="txt_field">


 	 
    <div aligin="center" style="padding:30px;  border:1px" >
    <table class="table table-bordered" style="border-color:black">
    <tr>
      <th nowrap>Class Name</th>
      <th nowrap>Subject Name</th>
      <th nowrap>Teacher Name</th>
      <th nowrap>Actions</th>
    </tr>
    <% for(Main_Dashboard main_Dashboard:results) {%>
 	<tr > 
 	
         <td><% System.out.println(main_Dashboard.getClasses().getClassName());
				out.println(main_Dashboard.getClasses().getClassName());%></td>
				
				    <td><% System.out.println(main_Dashboard.getSubject().getSubjectName());
				out.println(main_Dashboard.getSubject().getSubjectName());%></td>
				
				    <td><% System.out.println(main_Dashboard.getTeachers().getTeachersName());
				out.println(main_Dashboard.getTeachers().getTeachersName());%></td>
				
				
				  
				<%int Id = main_Dashboard.getId();  %>
				
		
			<td width=20%><a href="DashboardDelete?DB_id=<%= main_Dashboard.getId()%>"><img src="img/1.png" width="40" height="20"></a></td>
    		
    	 </tr>
    	 <%} %>
    	</table>
    	<br>
    	 </div>
           
<% 
transaction.commit();
s1.close();
 %>


<!--<form action="classlist.jsp" method="post">
<br>

	<input type="submit" name="classlist.jsp" Value="Class">
</form><form action="list.jsp">
	<input type="submit"name="SubjectOperations" Value="Subject">
	</form>
	<form action="teacherslist.jsp">
	<input type="submit"name="TecherOperation" Value="Teachers">
</form>
<form action="studentlist.jsp">
	<input type="submit"name="StudentOperation" Value="Students">
</form>
-->
</div>
</body>
</html>
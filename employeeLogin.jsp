<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.project.DB.MainCon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>TL Login</title>
    <!-- Bootstrap -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
    <link href="assets/styles.css" rel="stylesheet" media="screen">
     <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <script src="js/vendor/modernizr-2.6.2-respond-1.1.0.min.js"></script>
  </head>
  <body id="login">
  <nav class="navbar navbar-inverse">
  			<div class="container-fluid" >
    			<div class="navbar-header">
      				<a class="navbar-brand" >Login Type</a>
    			</div>
    			<ul class="nav navbar-nav">
      				<li ><a href="managerLogin.jsp">Project Manager</a></li>
      				<li ><a href="TL_Login.jsp">Team Leader</a></li>
     				 <li class="active"><a href="employeeLogin.jsp">Employee</a></li> 
     				<!--  <li><a href="customerLogin.jsp">Customer</a></li> -->
    			</ul>
    
  			</div>
		</nav> 
    <div class="container">
					<%
					Connection con=MainCon.getConnection();
					Statement smt=con.createStatement();
					ResultSet rs=smt.executeQuery("select team_name from team");
					
					%>
      <form class="form-signin" action="LoginServlet" method="post">
        <h2 class="form-signin-heading">Please sign in</h2>
        <input type="text" name="tmusername" class="input-block-level" placeholder="Username">
        <input type="password" name="tmpassword" class="input-block-level" placeholder="Password">
         <select name="team_name" class="input-block-level">
         <%while(rs.next()) 
         {
         %>
            <option><%=rs.getString(1) %></option>
        <%} %>                                      
        </select>
           
       <input type="hidden" name="action" value="TeamMemberLogin">
        <button class="btn btn-large btn-primary" type="submit" >Sign in</button>
      </form>

    </div> <!-- /container -->
    <script src="vendors/jquery-1.9.1.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
  </body>
</html>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.project.DB.MainCon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete project member</title>
</head>
<body>
<%
	String id=request.getParameter("id");
	Connection con=MainCon.getConnection();
	
	Statement smt1=con.createStatement();
	ResultSet rs=smt1.executeQuery("select member_name from team_members where member_id='"+id+"'");
	String empname=null;
	while(rs.next())
	{
		empname=rs.getString(1);
	}
	
	Statement smt=con.createStatement();
	int result=smt.executeUpdate("delete from team_members where member_id='"+id+"'");

	Statement smt2=con.createStatement();
	int index=smt2.executeUpdate("update employee set status='Bench' where empname='"+empname+"'");
	response.sendRedirect("createTeam.jsp");

%>
</body>
</html>
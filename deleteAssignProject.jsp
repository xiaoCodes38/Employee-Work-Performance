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
<title>Delete assign project</title>
</head>
<body>
<%
	String id=request.getParameter("id");
	Connection con=MainCon.getConnection();
	
	Statement smt1=con.createStatement();
	ResultSet rs=smt1.executeQuery("select team_name,project_name from assignproject where id='"+id+"'");
	String team_name=null,project_name=null;
	while(rs.next())
	{
		team_name=rs.getString(1);
		project_name=rs.getString(2);
	}
	
	Statement smt=con.createStatement();
	int result=smt.executeUpdate("delete from assignproject where id='"+id+"'");
	if(result>0)
	{
		Statement smt2=con.createStatement();
		int index=smt2.executeUpdate("update team set status='Free' where team_name='"+team_name+"'");
		if(index>0)
		{
			Statement smt3=con.createStatement();
			int index1=smt3.executeUpdate("update project set assign='No' where project_name='"+project_name+"'");
			response.sendRedirect("assignProject.jsp");
		}
	}
	
	
	

%>
</body>
</html>
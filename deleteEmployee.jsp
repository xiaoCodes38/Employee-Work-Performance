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
	ResultSet rs=smt1.executeQuery("select status from employee where empid='"+id+"'");
	String status=null;
	while(rs.next())
	{
		status=rs.getString(1);
	}
	if(status.equalsIgnoreCase("allocated"))
	{
		response.setContentType("text/html");  
		out.println("<script type=\"text/javascript\">");  
		out.println("alert('Please first remove employee from team...');");
		out.println("location='addNewEmployee.jsp';");
		out.println("</script>");
		
	}
	else if(status.equalsIgnoreCase("Bench"))
	{
			Statement smt3=con.createStatement();
			int index=smt3.executeUpdate("delete from employee where empid='"+id+"'");
			if(index > 0)
			{
				response.sendRedirect("addNewEmployee.jsp");
			}
			
	}
	
	
	
	

%>
</body>
</html>
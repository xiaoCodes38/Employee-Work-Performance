<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.project.DB.MainCon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String id=request.getParameter("id");
String member_name=request.getParameter("membername");
Connection con=MainCon.getConnection();
Statement smt=con.createStatement();
int index=smt.executeUpdate("delete from task where id='"+id+"'");
if(index > 0)
{
	PreparedStatement ps=con.prepareStatement("update team_members set task_status='Not Assign' where member_name='"+member_name+"'");
	int tmp=ps.executeUpdate();
	if(tmp>0)
	{
		response.sendRedirect("TL_AssignTask.jsp");
	}
	
}


%>
</body>
</html>
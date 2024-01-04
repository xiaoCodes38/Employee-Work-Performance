

<%@page import="com.project.DB.MainCon"%>
<%@page import="java.sql.*,java.io.*,java.util.*" %> 
<%@page trimDirectiveWhitespaces="true" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.InputStream" %>
<%@page import="java.sql.Blob" %>
<%@page import="java.io.*" %>

<%
		ResultSet rs=null;
		PreparedStatement ps=null;
        Connection con = null;


		int id = Integer.parseInt(request.getParameter("id"));
		out.print(id);
		
		String sql = "SELECT * FROM task where id=?";
		
		con=MainCon.getConnection();
		ps=con.prepareStatement(sql);
		
		
		ps.setInt(1, id);
		rs = ps.executeQuery();
		if(rs.next()){
			InputStream is = rs.getBinaryStream(10);
			byte[] profilePic = null;
		   	byte[] buffer = new byte[1024*1024*50];
			int bytesRead;		
			if(is!=null){
				while ((bytesRead =is.read(buffer)) != -1)
				{
				   	response.reset();
					response.setContentType("image/jpg");
					response.setHeader("Content-disposition","attachment; filename=" );
			    	response.getOutputStream().write(buffer, 0, bytesRead);
			    	response.getOutputStream().flush(); 
			 	}
			}		
	
		}		
		
%>
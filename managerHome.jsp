<!DOCTYPE html>
<%@page import="java.util.Date"%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.project.DB.MainCon"%>
<%@page import="java.sql.Connection"%>
<html class="no-js">
    
    <head>
        <title>Manager Home Page</title>
        <!-- Bootstrap -->
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
        <link href="vendors/easypiechart/jquery.easy-pie-chart.css" rel="stylesheet" media="screen">
        <link href="assets/styles.css" rel="stylesheet" media="screen">
        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
        <script src="vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
        <script type="text/javascript">
   	  var pname;
      function deadLineAlert(pname)
      {
         alert(pname+" Cross the deadline please check the dead line and Project Status...");
      }
   
	</script>
    </head>
     <%
     String mgrUsername=(String)session.getAttribute("mgrUsername");
     if(mgrUsername!=null)
     {
    	 session.setAttribute("logoutuser", mgrUsername);
     %>
    <body>
    
        <div class="navbar navbar-fixed-top">
            <div class="navbar-inner">
                <div class="container-fluid" >
                    <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"> <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                    </a>
                    <a class="brand" href="#" style="color: blue">Project Manager</a>
                    <div class="nav-collapse collapse">
                        <ul class="nav pull-right">
                            <li class="dropdown">
                                <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown" > <i class="icon-user"></i>  <i class="caret"></i>

                                </a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a tabindex="-1" href="mgrChangePassword.jsp">Change Password</a>
                                    </li>
                                    <li class="divider"></li>
                                    <li>
                                        <a tabindex="-1" href="LogoutServlet">Logout</a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                       
                    </div>
                    <!--/.nav-collapse -->
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row-fluid">
                <div class="span3" id="sidebar">
                    <ul class="nav nav-list bs-docs-sidenav nav-collapse collapse">
                        <li class="active">
                            <a href="managerHome.jsp"><i class="icon-chevron-right"></i> Dashboard</a>
                        </li>
                        <li>
                            <a href="addNewEmployee.jsp"><i class="icon-chevron-right"></i> Add New Employee</a>
                        </li>
                        <li>
                            <a href="addNewProject.jsp"><i class="icon-chevron-right"></i> Add New Project</a>
                        </li>
                        <li>
                            <a href="createTeam.jsp"><i class="icon-chevron-right"></i> Create Team</a>
                        </li>
                        <li>
                            <a href="assignProject.jsp"><i class="icon-chevron-right"></i> Assign Project</a>
                        </li>
                        
      					<li>
      						<a href="empAttendance.jsp"><i class="icon-chevron-right"></i>Employee Attendance</a>
      					</li> 
      					<li>
      						<a href="deleteAttendance.jsp"><i class="icon-chevron-right"></i>Delete Attendance</a>
      					</li>
      					 <li>
      						<a href="workingDetails.jsp"><i class="icon-chevron-right"></i>Working Details</a>
      					</li>                                             
                   </ul>
                </div>

                <!--/span-->
                <div class="span9" id="content">
                    <div class="row-fluid">
                        	<div class="navbar">
                            	
                        	</div>
                    	</div>
                    <div class="row-fluid">
                        <!-- block -->
                        <div class="block">
                            <div class="navbar navbar-inner block-header">
                                <div class="muted pull-left">Statistics</div>
                             </div>
                             <div class="block-content collapse in">
                             <%
                             Connection con=MainCon.getConnection();
                             Statement smt=con.createStatement();
                             Statement sm=con.createStatement();
                             ResultSet rs=smt.executeQuery("SELECT team_name,project_name,avg(status) from task group by project_name");
                             while(rs.next())
                             {
                            	 %>
                            	
                                <div class="span3">
                                    <div class="chart" data-percent="<%=rs.getFloat(3)%>"><%=rs.getFloat(3)%>%</div>
                                    <div class="chart-bottom-heading"><span class="label label-info"><%=rs.getString(2)%></span>

                                    </div>
                                </div>
                               
                            
                            	 <%
                            	 System.out.println(rs.getFloat(3));
                            	 System.out.println(rs.getString(2));
                            	sm.executeUpdate("update assignproject set complition='"+rs.getFloat(3)+"' where project_name='"+rs.getString(2)+"'");
                            	 
                             }
                             
                             java.util.Date today=new Date();
                             java.sql.Date date=new java.sql.Date(today.getTime()); //your SQL date object
                             SimpleDateFormat simpDate = new SimpleDateFormat("yyyy-MM-dd");
                             String currDate=simpDate.format(date);
                     	 	                 
                     	 	 String projectName=null;
                             Statement s=con.createStatement();
                             System.out.println(currDate);
                             
                             ResultSet r=s.executeQuery("select project_name from assignproject where deadline_date<'"+currDate+"' and complition<>100");
                             while(r.next())
                             {
                            	projectName=r.getString(1);
                            	out.println("<script type=\"text/javascript\">");
                            	out.println("alert('Project Cross the deadline please check the dead line and Project Status...');");
                 				//out.println("location='managerHome.jsp';");
                 				out.println("</script>");
                 				System.out.println(r.getString(1));
                             }
                             %>
   
                         </div>   
                        </div>
                        <!-- /block -->
                    </div>
                    
                    
                    <div class="row-fluid">
                        <!-- block -->
                        <div class="block">
                            <div class="navbar navbar-inner block-header">
                                <div class="muted pull-left">Photo Gallery</div>
                                </div>
                            </div>
                            <div class="block-content collapse in">
                               <div class="span3">
                                      <a href="#" class="thumbnail">
                                        <img data-src="holder.js/260x180" alt="260x180" style="width: 260px; height: 180px;" src="images\img1.jpg">
                                      </a>
                                  </div>
                                  <div class="span3">
                                      <a href="#" class="thumbnail">
                                        <img data-src="holder.js/260x180" alt="260x180" style="width: 260px; height: 180px;" src="images\img2.jpg">
                                      </a>
                                  </div>
                                 <div class="span3">
                                      <a href="#" class="thumbnail">
                                        <img data-src="holder.js/260x180" alt="260x180" style="width: 260px; height: 180px;" src="images\img3.jpeg">
                                      </a>
                                  </div>
                                  <div class="span3">
                                      <a href="#" class="thumbnail">
                                        <img data-src="holder.js/260x180" alt="260x180" style="width: 260px; height: 180px;" src="images\img4.jpg">
                                      </a>
                                  </div>
                                </div>

                                <div class="row-fluid padd-bottom">
                                  <div class="span3">
                                      <a href="#" class="thumbnail">
                                        <img data-src="holder.js/260x180" alt="260x180" style="width: 260px; height: 180px;" src="images\img5.png">
                                      </a>
                                  </div>
                                  <div class="span3">
                                      <a href="#" class="thumbnail">
                                        <img data-src="holder.js/260x180" alt="260x180" style="width: 260px; height: 180px;" src="images\img6.png">
                                      </a>
                                  </div>
                                  <div class="span3">
                                      <a href="#" class="thumbnail">
                                        <img data-src="holder.js/260x180" alt="260x180" style="width: 260px; height: 180px;" src="images\img7.jpg">
                                      </a>
                                  </div>
                                  <div class="span3">
                                      <a href="#" class="thumbnail">
                                        <img data-src="holder.js/260x180" alt="260x180" style="width: 260px; height: 180px;" src="images\img8.jpg">
                                      </a>
                                  </div>
                                </div>

                                <div class="row-fluid padd-bottom">
                                  <div class="span3">
                                      <a href="#" class="thumbnail">
                                        <img data-src="holder.js/260x180" alt="260x180" style="width: 260px; height: 180px;" src="images\img9.jpg">
                                      </a>
                                  </div>
                                  <div class="span3">
                                      <a href="#" class="thumbnail">
                                        <img data-src="holder.js/260x180" alt="260x180" style="width: 260px; height: 180px;" src="images\img10.jpg">
                                      </a>
                                  </div>
                                  <div class="span3">
                                      <a href="#" class="thumbnail">
                                        <img data-src="holder.js/260x180" alt="260x180" style="width: 260px; height: 180px;" src="images\img11.jpg">
                                      </a>
                                  </div>
                                  <div class="span3">
                                      <a href="#" class="thumbnail">
                                        <img data-src="holder.js/260x180" alt="260x180" style="width: 260px; height: 180px;" src="images\img12.jpg">
                                      </a>
                                  </div>
                                </div>
                            </div>
                        </div>
                        <!-- /block -->
                    </div>
                </div>
            </div>
            <hr>
        </div>
        <!--/.fluid-container-->
        <script src="vendors/jquery-1.9.1.min.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <script src="vendors/easypiechart/jquery.easy-pie-chart.js"></script>
        <script src="assets/scripts.js"></script>
        <script>
        $(function() {
            // Easy pie charts
            $('.chart').easyPieChart({animate: 1000});
        });
        </script>
    </body>
<%
     }
     else
     {
    	 response.sendRedirect("managerLogin.jsp");
     }
%>
		
</html>
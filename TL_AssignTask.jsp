<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.project.DB.MainCon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html class="no-js">
    
    <head>
        <title>Assign task</title>
        <!-- Bootstrap -->
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
        <link href="vendors/easypiechart/jquery.easy-pie-chart.css" rel="stylesheet" media="screen">
        <link href="assets/styles.css" rel="stylesheet" media="screen">
        <link href="assets/DT_bootstrap.css" rel="stylesheet" media="screen">
        <script src="vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
    </head>
<%
 String TLname=(String)session.getAttribute("tlname");
 if(TLname!=null)
 {
	 session.setAttribute("logoutuser", TLname);
 %> 				
    <body >
    <%
                String team_name=(String)session.getAttribute("team_name");
                
                %>
        <div class="navbar navbar-fixed-top">
            <div class="navbar-inner">
                <div class="container-fluid">
                    <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"> <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                    </a>
                    <a class="brand" href="#">Team Leader</a>
                    <div class="nav-collapse collapse">
                        <ul class="nav pull-right">
                            <li class="dropdown">
                                <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown"> <i class="icon-user"></i>  <i class="caret"></i>

                                </a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a tabindex="-1" href="#">Change Password</a>
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
                        <li >
                            <a href="TL_Home.jsp"><i class="icon-chevron-right"></i> Dashboard</a>
                        </li>
                        <li>
                            <a href="viewTeamMembers.jsp"><i class="icon-chevron-right"></i>View Team Members</a>
                        </li>
                        <li class="active">
                            <a href="TL_AssignTask.jsp"><i class="icon-chevron-right"></i>Assign Task</a>
                        </li>
                        <li>
                            <a href="viewTaskStatus.jsp"><i class="icon-chevron-right"></i>View Status</a>
                        </li>
                       <li >
                            <a href="TLnotification.jsp"><i class="icon-chevron-right"></i>Cross DeadLine</a>
                        </li>
                        <br><br>
                        <h4>Grade of Employees</h4>
                                           <%
					Connection con4=MainCon.getConnection();
					Statement smt4=con4.createStatement();
					ResultSet rs4=smt4.executeQuery("select * from cluster where Team_Name='"+team_name+"'");
					
					while(rs4.next())
					{
					%>
               
                        <li >
                            <a href="#"><i class="icon-chevron-right"></i><%=rs4.getString(5)%>=><%=rs4.getString(7)%></a>
                        </li>
                     
                <%} %>      
              
                                                                        
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
                            <div class="row-fluid">
                         <!-- block -->
                        <div class="block">
                            <div class="navbar navbar-inner block-header">
                                <div class="muted pull-left"><font size="5" color="black">Assign Task</font></div>
                            </div>
                            <div class="block-content collapse in">
                                <div class="span12">
                                
                                
					<!-- BEGIN FORM-->
					<%
					Connection con=MainCon.getConnection();
					Statement smt=con.createStatement();
					ResultSet rs=smt.executeQuery("select team_name from team where team_name='"+team_name+"'");
					
					%>
					
					<form action="ProcessServlet" method="post" class="form-horizontal" autocomplete="off"  >
								
							 <div class="control-group" style="margin-top: 30px">
                                          <label class="control-label" for="select01">Team Name<span class="required">*</span></label>
                                          <div class="controls">
                                            <select name="team_name" class="span4 m-wrap" >
                                            <%while(rs.next()) 
                                            {
                                            %>
                                                    <option><%=rs.getString(1) %></option>
                                             <%} %>                                      
                                            </select>
                                          </div>
                                        </div>
                                      
                    <%
					
					Statement smt1=con.createStatement();
					ResultSet rs1=smt1.executeQuery("select project_name from assignproject where team_name='"+team_name+"' and complition<100");
					
					%> 
                             <div class="control-group" style="margin-top: 30px">
                                          <label class="control-label" for="select01">Project Name<span class="required">*</span></label>
                                          <div class="controls">
                                            <select name="project_name" class="span4 m-wrap" >
                                             <%while(rs1.next()) 
                                            {
                                            %>
                                                    <option><%=rs1.getString(1) %></option>
                                             <%} %> 
                                                                                          
                                            </select>
                                          </div>
                                        </div>       
                      <%
					
					Statement smt2=con.createStatement();
					ResultSet rs2=smt2.executeQuery("select member_name from team_members where team_name='"+team_name+"'");
					
					%> 
                             <div class="control-group" style="margin-top: 30px">
                                          <label class="control-label" for="select01">Member Name<span class="required">*</span></label>
                                          <div class="controls">
                                            <select name="member_name" class="span4 m-wrap" >
                                             <%while(rs2.next()) 
                                            {
                                            %>
                                                    <option><%=rs2.getString(1) %></option>
                                             <%} %> 
                                                                                          
                                            </select>
                                          </div>
                                        </div>          
                           	<div class="control-group" style="margin-top: 30px">
                                          <label class="control-label" for="select01">Task Name<span class="required">*</span></label>
                                          <div class="controls">
                                            <select name="task_name" class="span4 m-wrap" >
                                                  <option>Designing</option>
                                                  <option>Development</option>  
                                                  <option>Testing</option>  
                                                  <option>Implementation</option>                 
                                            </select>
                                          </div>
                                        </div>  						
  							<div class="control-group">
                                          <label class="control-label" for="date01">Assign Date <span class="required">*</span></label>
                                          <div class="controls" class="span4 m-wrap">
                                            <input type="date" name="assign_date"  pattern="(0[1-9]|1[0-9]|2[0-9]|3[01]).(0[1-9]|1[012]).[0-9]{4}" required="required" id="date01" >
                                </div>
                                        </div>
                                <div class="control-group">
                                          <label class="control-label" for="date01">Deadline Date <span class="required">*</span></label>
                                          <div class="controls" class="span4 m-wrap">
                                            <input type="date" name="deadline_date"  pattern="(0[1-9]|1[0-9]|2[0-9]|3[01]).(0[1-9]|1[012]).[0-9]{4}" required="required" id="date01" >
                                </div>
                                        </div>
                                <input type="hidden" name="action" value="assignTask">
  								<div class="form-actions ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  										<button type="submit" class="btn btn-primary"><i class="icon-thumbs-up"></i>  Assign </button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  										<button type="reset" class="btn btn-primary"><i class="icon-repeat"></i> Reset</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  										
  								</div>
  					</form>
  					
					<!-- END FORM-->
				</div>
			   
			</div>
                     	<!-- /block -->
		    </div>
		    <%
		    						int count=1; 
                                    Connection connection=MainCon.getConnection();
                                    Statement smt3=connection.createStatement();
                                    ResultSet rs3=smt3.executeQuery("select id,team_name,project_name,member_name,task_name,assign_date,deadline_date,status from task where team_name='"+team_name+"'");
                                                  
                                    
                  %>                    
                    <div class="row-fluid">
                        <!-- block -->
                        <div class="row-fluid">
                        <!-- block -->
                        <div class="block">
                            <div class="navbar navbar-inner block-header">
                                <div class="muted pull-left"><font color="black">Assigned Task Details</font></div>
                            </div>
                            <div class="block-content collapse in">
                                <div class="span12">
                                   <div class="table-toolbar">
                                      
                                      <div class="btn-group pull-right">
                                         <button data-toggle="dropdown" class="btn dropdown-toggle">Tools <span class="caret"></span></button>
                                         <ul class="dropdown-menu">
                                            <li><a href="#">Print</a></li>
                                            <li><a href="#">Save as PDF</a></li>
                                            <li><a href="#">Export to Excel</a></li>
                                         </ul>
                                      </div>
                                   </div>
                                    
                                    <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example2" >
                                        <thead>
                                            <tr>
                                            	<th>Sr. No</th>
                                                <th>Team Name</th>
                                                <th>Project Name</th>
                                                <th>Member Name</th>
                                                <th>Task Name</th>
                                                <th>Deal Date</th>
                                                <th>Deadline</th>
                                                <th>Complition</th>
                                                <th>Delete</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <%
                                        while(rs3.next())
                                        {
                                        %>
                						<tr class="odd gradeX">
                							<td><%=count %></td>
                							<td><%=rs3.getString(2) %></td>
                    						<td><%=rs3.getString(3) %></td>
                    						<td><%=rs3.getString(4) %></td>
                    						<td><%=rs3.getString(5) %></td>
                    						<td><%=rs3.getDate(6) %></td>
                    						<td><%=rs3.getDate(7) %></td>
                    						<td><%=rs3.getString(8)+" %" %></td>
                    						<td><a href="deleteTask.jsp?id=<%=rs3.getString(1)%>&membername=<%=rs3.getString(4)%>">Delete</a></td>
                						</tr>
            							<%
            							count++;
                                        }
            							%>
                                            
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <!-- /block -->
                    </div>
                
                        </div>
                            
                        </div>
                        <!-- /block -->
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
        <script src="vendors/datatables/js/jquery.dataTables.min.js"></script>
        <script src="assets/DT_bootstrap.js"></script>
        <script src="vendors/bootstrap-datepicker.js"></script>
        
        <script src="vendors/jquery.uniform.min.js"></script>
        <script src="vendors/chosen.jquery.min.js"></script>
        <script src="vendors/bootstrap-datepicker.js"></script>

        <script src="vendors/wysiwyg/wysihtml5-0.3.0.js"></script>
        <script src="vendors/wysiwyg/bootstrap-wysihtml5.js"></script>

        <script src="vendors/wizard/jquery.bootstrap.wizard.min.js"></script>

	<script type="text/javascript" src="vendors/jquery-validation/dist/jquery.validate.min.js"></script>
	<script src="assets/form-validation.js"></script>
        
	<script src="assets/scripts.js"></script>
        <script>
       
        jQuery(document).ready(function() {   
     	   FormValidation.init();
     	});
     	

             $(function() {
            	 $('.chart').easyPieChart({animate: 1000});
                 $(".datepicker").datepicker();
                 $(".uniform_on").uniform();
                 $(".chzn-select").chosen();
                 $('.textarea').wysihtml5();

                 $('#rootwizard').bootstrapWizard({onTabShow: function(tab, navigation, index) {
                     var $total = navigation.find('li').length;
                     var $current = index+1;
                     var $percent = ($current/$total) * 100;
                     $('#rootwizard').find('.bar').css({width:$percent+'%'});
                     // If it's the last tab then hide the last button and show the finish instead
                     if($current >= $total) {
                         $('#rootwizard').find('.pager .next').hide();
                         $('#rootwizard').find('.pager .finish').show();
                         $('#rootwizard').find('.pager .finish').removeClass('disabled');
                     } else {
                         $('#rootwizard').find('.pager .next').show();
                         $('#rootwizard').find('.pager .finish').hide();
                     }
                 }});
                 $('#rootwizard .finish').click(function() {
                     alert('Finished!, Starting over!');
                     $('#rootwizard').find("a[href*='tab1']").trigger('click');
                 });
             });
        </script>
    </body>
	<%
 }
 else
 {
	 response.sendRedirect("TL_Login.jsp");
 }
%>
</html>
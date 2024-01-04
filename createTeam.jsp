<%@page import="com.project.DB.MainCon"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html class="no-js">
    
    <head>
        <title>Create Team</title>
        <!-- Bootstrap -->
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
        <link href="vendors/easypiechart/jquery.easy-pie-chart.css" rel="stylesheet" media="screen">
        <link href="assets/styles.css" rel="stylesheet" media="screen">
        <link href="assets/DT_bootstrap.css" rel="stylesheet" media="screen">
        <script src="vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
    </head>
<%
     String mgrUsername=(String)session.getAttribute("mgrUsername");
     if(mgrUsername!=null)
     {
    	 session.setAttribute("logoutuser", mgrUsername);
     %>
    <body >
    
        <div class="navbar navbar-fixed-top">
            <div class="navbar-inner">
                <div class="container-fluid">
                    <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"> <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                    </a>
                    <a class="brand" href="#">Manager</a>
                    <div class="nav-collapse collapse">
                        <ul class="nav pull-right">
                            <li class="dropdown">
                                <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown"> <i class="icon-user"></i>  <i class="caret"></i>

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
                                <div class="muted pull-left"><font size="5" color="black">Add New Team</font></div>
                            </div>
                            <div class="block-content collapse in">
                                <div class="span12">
					<!-- BEGIN FORM-->
					<form action="ProcessServlet" method="post" class="form-horizontal" autocomplete="off"  >
								
							 
							 <div class="control-group" style="margin-top: 30px">
  								<label class="control-label">Team Name<span class="required">*</span></label>
  								<div class="controls">
  									<input type="text" name="teamName" data-required="1" required="required" class="span6 m-wrap"/>
  								</div>
  							</div>
  							                      		
  							
                                <input type="hidden" name="action" value="createTeam">
  								<div class="form-actions ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  										<button type="submit" class="btn btn-primary"><i class="icon-thumbs-up"></i>  Add </button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  										<button type="reset" class="btn btn-primary"><i class="icon-repeat"></i> Reset</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  										
  								</div>
  					</form>
  					
					<!-- END FORM-->
				</div>
			   
			</div>
                     	<!-- /block -->
		    </div>
		    <div class="block">
                            <div class="navbar navbar-inner block-header">
                                <div class="muted pull-left"><font size="5" color="black">Add Team Member</font></div>
                            </div>
                            <div class="block-content collapse in">
                                <div class="span12">
					<!-- BEGIN FORM-->
					<%
					Connection con=MainCon.getConnection();
                    Statement smt=con.createStatement();
                    ResultSet rs=smt.executeQuery("select team_name from team");
					
                    Statement smt2=con.createStatement();
					ResultSet rs2=smt2.executeQuery("select empname from employee where designation='Engineer'");
					%>
					<form action="ProcessServlet" method="post" class="form-horizontal" autocomplete="off"  >
								
							 
							 <div class="control-group" style="margin-top: 30px">
                                          <label class="control-label" for="select01">Select Team<span class="required">*</span></label>
                                          <div class="controls">
                                            <select name="teamName" class="span6 m-wrap" >
                                            <%while(rs.next())
                                            {
                                            %>
                                              <option><%=rs.getString(1) %></option>
                                            <%} %>                                               
                                            </select>
                                          </div>
                                        </div>
                           <div class="control-group" >
                                          <label class="control-label" for="select01">Select Member<span class="required">*</span></label>
                                          <div class="controls">
                                            <select name="empName" class="span6 m-wrap" >
                                            <%while(rs2.next())
                                            {
                                            %>
                                              <option><%=rs2.getString(1) %></option>
                                            <%} %>
                                                                                           
                                            </select>
                                          </div>
                                        </div>
  							<div class="control-group">
  								<label class="control-label">Role <span class="required">*</span></label>
  								<div class="controls">
									<input type="radio" name="role" value="Team Leader">TL<br>
  									<input type="radio" name="role" value="Team Member"> TM  								</div>
  							</div>
  							                        		
  							
                                <input type="hidden" name="action" value="addTeamMember">
  								<div class="form-actions ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  										<button type="submit" class="btn btn-primary"><i class="icon-thumbs-up"></i>  Add </button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  										<button type="reset" class="btn btn-primary"><i class="icon-repeat"></i> Reset</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  										
  								</div>
  					</form>
  					
					<!-- END FORM-->
				</div>
			   
			</div>
                     	<!-- /block -->
		    </div>
		    <%
                                   
                                    Statement st=con.createStatement();
                                    ResultSet rst=st.executeQuery("select member_id,member_name,team_name,role from team_members");
                                                  
                                    
                  %>                    
                    <div class="row-fluid">
                        <!-- block -->
                        <div class="row-fluid">
                        <!-- block -->
                        <div class="block">
                            <div class="navbar navbar-inner block-header">
                                <div class="muted pull-left"><font color="black">Project Details</font></div>
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
                                            	<th>ID</th>
                                                <th>Member Name</th>
                                                <th>Team Name</th>
                                                <th>Role</th>
                                                <th>Delete</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <%
                                        while(rst.next())
                                        {
                                        %>
                						<tr class="odd gradeX">
                							<td><%=rst.getString(1) %></td>
                							<td><%=rst.getString(2) %></td>
                    						<td><%=rst.getString(3) %></td>
                    						<td><%=rst.getString(4) %></td>
                    						<td><a href="deleteProjectmember.jsp?id=<%=rst.getString(1)%>">Delete</a></td>
                						</tr>
            							<%
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
    	 response.sendRedirect("managerLogin.jsp");
     }
%>	
</html>
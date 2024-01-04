<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.project.DB.MainCon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html class="no-js">
    
    <head>
        <title>Add New Project</title>
        <!-- Bootstrap -->
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
        <link href="vendors/easypiechart/jquery.easy-pie-chart.css" rel="stylesheet" media="screen">
        <link href="assets/styles.css" rel="stylesheet" media="screen">
        <link href="assets/DT_bootstrap.css" rel="stylesheet" media="screen">
        <script src="vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>  
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	
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
      					<li >
      						<a href="viewCustomer.jsp"><i class="icon-chevron-right"></i>View Customer</a>
      					</li>
                        <li>
      						<a href="issueReply.jsp"><i class="icon-chevron-right"></i>View Issues</a>
      					</li> 
      					<li>
      						<a href="issueAndReply.jsp"><i class="icon-chevron-right"></i>Issues and Reply</a>
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
                                <div class="muted pull-left"><font size="5" color="black">Add New Project</font></div>
                            </div>
                            <div class="block-content collapse in">
                                <div class="span12">
					<!-- BEGIN FORM-->
					<%
					String projectid=request.getParameter("id");
					Connection con=MainCon.getConnection();
					Statement smt=con.createStatement();
					ResultSet rs=smt.executeQuery("select project_name,client_name,client_mob,deal_date,deadline_date from project where project_id='"+projectid+"'");
					String project_name=null,client_name=null,client_mob=null;
					Date deal_date=null,deadline_date=null;
					while(rs.next())
					{
						project_name=rs.getString(1);
						client_name=rs.getString(2);
						client_mob=rs.getString(3);
						deal_date=rs.getDate(4);
						deadline_date=rs.getDate(5);
					}
					%>
					
					<form action="ProcessServlet" method="post" class="form-horizontal" autocomplete="off">
								
  							<div class="control-group" style="margin-top: 30px">
  								<label class="control-label">Project Name<span class="required">*</span></label>
  								<div class="controls">
  									<input type="text" name="projectName" value="<%=project_name %>" data-required="1" required="required" class="span6 m-wrap"/>
  								</div>
  							</div>
  							    <div class="control-group">
  								<label class="control-label">Client Name<span class="required">*</span></label>
  								<div class="controls">
  									<input type="text" name="clientName" value="<%=client_name %>" data-required="1" required="required" class="span6 m-wrap"/>
  								</div>
  							</div>
  							<div class="control-group">
  								<label class="control-label">Mob Number<span class="required">*</span></label>
  								<div class="controls">
  									<input name="clientMob" type="text" value="<%=client_mob %>" required="required" pattern="[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]" title="Please enter 10 digit number only" class="span6 m-wrap"/>
  								</div>
  							</div>
  							<div class="control-group">
                                          <label class="control-label" for="date01">Deal Date <span class="required">*</span></label>
                                          <div class="controls" class="span6 m-wrap">
                                            <input type="date" name="dealDate" value="<%=deal_date %>"  pattern="(0[1-9]|1[0-9]|2[0-9]|3[01]).(0[1-9]|1[012]).[0-9]{4}" required="required" id="date01" >
                                </div>
                                        </div>
                             <div class="control-group">
                                          <label class="control-label" for="date01">Deadline Date <span class="required">*</span></label>
                                          <div class="controls" class="span6 m-wrap">
                                            <input type="date" name="deadlineDate" value="<%=deadline_date %>" pattern="(0[1-9]|1[0-9]|2[0-9]|3[01]).(0[1-9]|1[012]).[0-9]{4}" required="required" id="date01" >
                                </div>
                                        </div>                        
  							
  									<input type="hidden" name="project_id" value="<%=projectid%>">	               			
            						<input type="hidden" name="action" value="updateProject">
  								<div class="form-actions ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  										<button type="submit" class="btn btn-primary"><i class="icon-file"></i>  Update </button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  										<button type="reset" class="btn btn-primary"><i class="icon-repeat"></i> Reset</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  								</div>
				
					</form>
					
					</div>
					<!-- END FORM-->
				</div>
			   
			</div>
                     	<!-- /block -->
		    </div>
                            
                        </div>
                        <!-- /block -->
                    </div>
                    
                                    
                        
                       
                        <!-- /block -->
                    </div>
                </div>
            </div>
            <hr>
        
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
     	

             $(function() 
            {
            	
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
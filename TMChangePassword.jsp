<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.project.DB.MainCon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html class="no-js">
    
    <head>
        <title>Change Password</title>
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
   String tmUsername=(String)session.getAttribute("tmusername");
   if(tmUsername!=null)
   {
	   session.setAttribute("logoutuser", tmUsername);
   %> 
 <body >
        <div class="navbar navbar-fixed-top">
            <div class="navbar-inner">
                <div class="container-fluid">
                    <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"> <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                    </a>
                    <a class="brand" href="#">Employee</a>
                    <div class="nav-collapse collapse">
                        <ul class="nav pull-right">
                            <li class="dropdown">
                                <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown"> <i class="icon-user"></i>  <i class="caret"></i>

                                </a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a tabindex="-1" href="TMChangePassword.jsp">Change Password</a>
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
                            <a href="employeeHome.jsp"><i class="icon-chevron-right"></i> Home</a>
                        </li>
                        <li>
                            <a href="TM_viewTask.jsp"><i class="icon-chevron-right"></i>View Assign Task</a>
                        </li>
                       <li>
                            <a href="TM_viewOtherStatus.jsp"><i class="icon-chevron-right"></i>Other Employee Status</a>
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
                                <div class="muted pull-left"><font size="5" color="black">Change Password</font></div>
                            </div>
                            <div class="block-content collapse in">
                                <div class="span12">
					<!-- BEGIN FORM-->
					<form action="ChangePassServlet" method="post" class="form-horizontal" autocomplete="off">
								
  															 								
  							    <div class="control-group">
  								<label class="control-label">Old Password<span class="required">*</span></label>
  								<div class="controls">
  									<input type="text" name="oldPass" data-required="1" required="required" class="span6 m-wrap"/>
  								</div>
  							</div>
  							     <div class="control-group">
  								<label class="control-label">New Password<span class="required">*</span></label>
  								<div class="controls">
  									<input type="text" name="newPass" data-required="1" required="required" class="span6 m-wrap"/>
  								</div>
  							</div>              
  							
  											               			
            						<input type="hidden" name="action" value="TMChangePassword">
  								<div class="form-actions ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  										<button type="submit" class="btn btn-primary"><i class="icon-file"></i>  Change Password </button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
	   response.sendRedirect("employeeLogin.jsp");
   }
%>

</html>
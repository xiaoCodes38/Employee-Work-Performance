<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html class="no-js">
    
    <head>
        <title>Success Page</title>
        <!-- Bootstrap -->
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
        <link href="vendors/easypiechart/jquery.easy-pie-chart.css" rel="stylesheet" media="screen">
        <link href="assets/styles.css" rel="stylesheet" media="screen">
        <link href="assets/DT_bootstrap.css" rel="stylesheet" media="screen">
        <script src="vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
    </head>
    
    <body>
        <div class="navbar navbar-fixed-top">
            <div class="navbar-inner">
                <div class="container-fluid">
                    <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"> <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                    </a>
                    <a class="brand" href="#">Admin</a>
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
                                        <a tabindex="-1" href="login.jsp">Logout</a>
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
                        <li>
                            <a href="adminHome.jsp"><i class="icon-chevron-right"></i> Dashboard</a>
                        </li>
                        <li >
                            <a href="addAdmin.jsp"><i class="icon-chevron-right"></i> Add New Admin</a>
                        </li>
                        <li>
                            <a href="addManager.jsp"><i class="icon-chevron-right"></i> Add New Manager</a>
                        </li>
                        <li>
                            <a href="adm_clientEnquiry.jsp"><i class="icon-chevron-right"></i> Client Enquiry</a>
                        </li>
                        <li>
                            <a href="adm_clientRegistration.jsp"><i class="icon-chevron-right"></i> Client Registration</a>
                        </li>
                        <li>
                            <a href="adm_addDeveloper.jsp"><i class="icon-chevron-right"></i> Add New Developer</a>
                        </li>
                        <li >
                            <a href="adm_assignProject.jsp"><i class="icon-chevron-right"></i> Assign New Project</a>
                        </li>
                         <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown">View Reports <i class="icon-chevron-down"></i></a>
                            <ul class="dropdown-menu">
      						<li ><a href="adm_viewManager.jsp"><i class="icon-chevron-right"></i>View Managers</a></li>
      						<li ><a href="adm_viewDeveloper.jsp"><i class="icon-chevron-right"></i>View Developers</a></li>
      						
      						<li ><a href="adm_viewDeveloper&Projects.jsp"><i class="icon-chevron-right"></i>View Assigned Project</a></li>
      						<li ><a href="adm_viewClientEnquiries.jsp"><i class="icon-chevron-right"></i>View Client Enquires</a></li>
      						<li ><a href="adm_viewRegisteredClient.jsp"><i class="icon-chevron-right"></i>View Client Registration</a></li> 
    					</ul>
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
                            <div class="block-content collapse in">
                                <div class="span12">
					<!-- BEGIN FORM-->
					<form action="#" id="form_sample_1" method="post" class="form-horizontal">
					<fieldset>
					
						<p style="margin-top: 30px"><font size="10" color="maroon" >Record Insert/Update Successfully....</font></p>
  					</fieldset>
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

</html>
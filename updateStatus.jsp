<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>

<%@page import="com.project.DB.MainCon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html class="no-js">
    
    <head>
        <title>Update Status </title>
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
                    <a class="brand" href="#">Team Member</a>
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
                <%
                String team_name=(String)session.getAttribute("team_name");
                String memberName=(String)session.getAttribute("memberName");
                int count=1;
                %>
                <!--/span-->
                <div class="span9" id="content">
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
					Connection c=MainCon.getConnection();
					Statement s=c.createStatement();
					ResultSet r=s.executeQuery("select status from task where id='"+request.getParameter("id")+"'");
					String status=null;
					while(r.next())
					{
						status=r.getString(1);
					}
					%>
					
					<form action="ProcessServlet" method="post" class="form-horizontal" autocomplete="off" enctype="multipart/form-data" >
								
							 <div class="control-group" style="margin-top: 30px">
                                          <label class="control-label" for="select01">Updated Task Status<span class="required">*</span></label>
                                          <div class="controls">
                                           <input type="number" name="status" class="span4 m-wrap" value="<%=status%>" min="0" max="100"> 
                                           <input type="file" name="statusfile" class="span4 m-wrap" value="Beowse"> 
                                          </div>
                                        </div>
                    
                                <input type="hidden" name="action" value="UpdateTaskStatus">
                                <input type="hidden" name="id" value="<%=request.getParameter("id")%>">
  								<div class="form-actions ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  										<button type="submit" class="btn btn-primary"><i class="icon-thumbs-up"></i>  Update </button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  										<button type="reset" class="btn btn-primary"><i class="icon-repeat"></i> Reset</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  										
  								</div>
  					</form>
  					
					<!-- END FORM-->
				</div>
			   
			</div>
                     	<!-- /block -->
		    </div>                                    
                    <div class="row-fluid">
                        <!-- block -->
                        <div class="row-fluid">
                        <!-- block -->
                        <div class="block">
                            <div class="navbar navbar-inner block-header">
                                <div class="muted pull-left"><font color="black">Task Details</font></div>
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
                                    <%
                                    Connection con=MainCon.getConnection();
                                    Statement smt=con.createStatement();
                                    ResultSet rs=smt.executeQuery("select team_name,member_name,task_name,assign_date,deadline_date,status from task where team_name='"+team_name+"' and member_name='"+memberName+"'");
                                                  
                                    
                                    %>
                                    <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example2" >
                                        <thead>
                                            <tr>
                                            	<th>Sr No</th>
                                                <th>Team Name</th>
                                                <th>Member Name</th>
                                                <th>Task Name</th>
                                                <th>Assign Date</th>
                                                <th>Deadline</th>
                                                <th>Complition</th>
                                                <th>Update<br>Status</th>
                                           </tr>
                                        </thead>
                                        <tbody>
                                        <%while(rs.next())
                                        {
                                        %>
                						<tr class="odd gradeX">
                							<td><%=count %></td>
                							<td><%=rs.getString(1) %></td>
                							<td><%=rs.getString(2) %></td>
                    						<td><%=rs.getString(3) %></td>
                    						<td><%=rs.getDate(4) %></td>
                							<td><%=rs.getDate(5) %></td>
                    						<td><%=rs.getString(6) +" %"%></td>
                    						<td><a href="updateStatus.jsp?id=<%=rs.getString(1)%>">Update</a></td>
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
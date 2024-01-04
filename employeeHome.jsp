<!DOCTYPE html>
<%@page import="javax.mail.MessagingException"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.PasswordAuthentication"%>
<%@page import="javax.mail.Session"%>
<%@page import="java.util.Properties"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.project.DB.MainCon"%>
<%@page import="java.sql.Connection"%>
<html class="no-js">
    
    <head>
        <title>Employee Home Page</title>
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
    </head>
   <%
   String empName=(String)session.getAttribute("empName");
   String tmUsername=(String)session.getAttribute("tmusername");
   if(tmUsername!=null)
   {
	   session.setAttribute("logoutuser", tmUsername);
   %>  
    <body>
     <%
     
     
     Connection con=MainCon.getConnection();
     Statement s=con.createStatement();
    
     DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	 Calendar cal = Calendar.getInstance();

	 DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	 Date dateobj = new Date();
	 String currDate=df.format(dateobj);
	 
	 //Substract one day to current date.
	 cal = Calendar.getInstance();
	 cal.add(Calendar.DATE, 3);
	 String threeDayAfter=dateFormat.format(cal.getTime());
     
     ResultSet r=s.executeQuery("select project_name from task where  status<>100 and member_name='"+empName+"' and deadline_date between '"+currDate+"' and  '"+threeDayAfter+"'");
     while(r.next())
     {
    	 String msg="Your project deadline is so closed, Please complete your task as early as possible";
 	    //msg=msg.replaceAll("%20", " ");
         String subject;
         subject="Deadline Warning Message";
 		  
 		  //Get the session object  
 		  Properties props = new Properties();  
 		  props.put("mail.smtp.host", "smtp.gmail.com");  
 		  props.put("mail.smtp.socketFactory.port", "465");  
 		  props.put("mail.smtp.socketFactory.class",  
 		            "javax.net.ssl.SSLSocketFactory");  
 		  props.put("mail.smtp.auth", "true");  
 		  props.put("mail.smtp.port", "465");  
 		   
 		  Session ses = Session.getInstance(props,  
 		   new javax.mail.Authenticator() 
 		  {  
 		   protected PasswordAuthentication getPasswordAuthentication() 
 		   {  
 		   	return new PasswordAuthentication("facetsproject@gmail.com","projectguru");//change accordingly  
 		   }  
 		  });  
 		   
 		  //compose message  
 		  try 
 		  {  
 		   MimeMessage message = new MimeMessage(ses);  
 		   message.setFrom(new InternetAddress());//change accordingly  
 		   message.addRecipient(Message.RecipientType.TO,new InternetAddress(tmUsername));  
 		   message.setSubject(subject);  
 		   //message.setText(addtext); 
 		   
 		     
 		   message.setText(msg);
 		   //send message  
 		   Transport.send(message);  
 		  
 		   System.out.println("message sent successfully");  
 		   

 		  }
 		  catch (MessagingException e) 
 		  {
 			e.printStackTrace();
 		}
    	/*out.println("<script type=\"text/javascript\">");
    	out.println("alert('Your assigned task deadline is so closed..Please complete your task as Early as Possible.');");
		//out.println("location='managerHome.jsp';");
		out.println("</script>");*/
			
     }
     
     
     
     %>
        <div class="navbar navbar-fixed-top">
            <div class="navbar-inner">
                <div class="container-fluid" >
                    <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"> <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                    </a>
                    <a class="brand" href="#" style="color: blue">Team Member</a>
                    <div class="nav-collapse collapse">
                        <ul class="nav pull-right">
                            <li class="dropdown">
                                <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown" > <i class="icon-user"></i>  <i class="caret"></i>

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
	   response.sendRedirect("employeeLogin.jsp");
   }
%>
		
</html>
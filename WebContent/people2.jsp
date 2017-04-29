<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.Blob"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
  
 

<html class="no-js" lang="">
    <!-- Added by HTTrack -->
    <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
    <!-- /Added by HTTrack -->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
       
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="css/bootstrap.min.css">

        <!-- Custom CSS -->
   
        <link rel="stylesheet" href="css/style.css">

        <!-- Home page CSS -->
        <link rel="stylesheet" href="css/admin.css">

        <!-- People page styles CSS -->
        <link rel="stylesheet" href="css/people.css">
    </head>
    <body>
       
       <jsp:include page="navigation.jsp" />
        <!-- Add your site or application content here -->
        <div class="wrapper">

     

            <div class="single-menu-area">

                <link href="http://fontawesome.io/assets/font-awesome/css/font-awesome.css" rel="stylesheet" media="screen">	
                <div class="messages" style="text-align:center; color:red;">
                    <% if (session.getAttribute("errormsg") != null) {%>
                    <%= session.getAttribute("errormsg")%>   
                    <% }%>
                </div>
                <div class="messages" style="text-align:center; color:red;">
                    <% if (session.getAttribute("successmsg") != null) {%>
                    <%= session.getAttribute("successmsg")%>   
                    <% }%>
                </div>
                <div class="messages" style="text-align:center; color:red;">
                    <% if (request.getAttribute("successmsg") != null) {%>
                    <%= request.getAttribute("successmsg")%>   
                    <% }%>
                </div>
                <div class="container">

                    <div id="user-list" class="row">
                        <div class="widget widget-gray"> <!-- TYPE PANEL -->
                            <div class="widget-head"> <!-- HEAD PANEL -->
                                <h4 class="heading"><i class="fa fa-briefcase"></i> Active Employees</h4>
                            </div><!-- /HEAD PANEL -->

                            <div class="widget-body" id="widget-body2"> <!-- CONTENT PANEL -->
                                <legend>Active Employees List</legend>
                                
                                
                               <!-- Include Users List -->
                                <jsp:include page="/active_emp.jsp" />
                            </div><!-- /CONTENT PANEL -->

                            <div class="widget-footer"><!-- FOOTER PANEL--> 
                                <!--<a href="#" class="fa fa-minus-circle fa-1x" data-toggle="tooltip" data-placement="right" title="" data-original-title="FA-MINUS-CIRCLE"><i></i></a>-->
                                <!--<a href="#" class="fa fa-pencil fa-1x" data-toggle="tooltip" data-placement="right" title="" data-original-title="FA-PENCIL"><i></i></a>-->
                                <!--<a href="#" class="fa fa-search fa-1x" data-toggle="tooltip" data-placement="right" title="" data-original-title="FA-SEARCH"><i></i></a>-->
                                <!--<a href="#" class="fa fa-plus-circle fa-1x" data-toggle="tooltip" data-placement="right" title="" data-original-title="FA-PLUS-CIRCLE"><i></i></a>-->
                                <a href="#" id="toggle2" class="fa fa-chevron-up fa-1x" data-toggle="tooltip" data-placement="right" title="" data-original-title="FA-PLUS-CIRCLE"><i></i></a>
                            </div><!-- /FOOTER PANEL--> 

                        </div> <!-- /TYPE PANEL -->
                    </div>

                    
                </div>
            </div>
        </div>

        <!-- jquery-->
        <script src="../js/jquery-2.2.4.min.js" type="text/javascript"></script>

        <!-- Plugins js -->
        <!--<script src="js/plugins.js" type="text/javascript"></script>-->

        <!-- Bootstrap js -->
        <script src="../js/bootstrap.min.js" type="text/javascript"></script>

        <!-- WOW JS -->
        <script src="../js/wow.min.js"></script>

        <!-- Meanmenu Js -->
        <script src="../js/jquery.meanmenu.min.js" type="text/javascript"></script>

        <!-- Srollup js -->
        <script src="../js/jquery.scrollUp.min.js" type="text/javascript"></script>

        <!-- Custom Js -->
        <script src="../js/main.js" type="text/javascript"></script>

        <!-- people Js -->
        <script src="../js/people.js" type="text/javascript"></script>

    </body>
</html>

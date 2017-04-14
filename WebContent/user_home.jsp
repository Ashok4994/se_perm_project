<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
 <!-- Normalize CSS --> 
        <link rel="stylesheet" href="css/normalize.css">

        <!-- Main CSS -->         
        <link rel="stylesheet" href="css/main.css">

        <!-- Bootstrap CSS --> 
        <link rel="stylesheet" href="css/bootstrap.min.css">

        <!-- Animate CSS --> 
        <link rel="stylesheet" href="css/animate.min.css">

        <!-- Font-awesome CSS-->
        <link rel="stylesheet" href="css/font-awesome.min.css">
 <!-- Switch Style CSS -->
        <link rel="stylesheet" href="css/switch-style.css">

        <!-- Custom CSS -->
        <link rel="stylesheet" href="css/style.css">
</head>
<body>


 <!-- Header Area Start Here -->
  <header>              
   <div class="header2-area">
  <div class="header-bottom-area" id="sticker">
   <div class="container">
    <div class="row">                         
    <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">
     <div class="logo-area">
      <span><h3>EMS</h3></span>
       </div>
       </div>  
   <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
   <div class="main-menu-area">
   <nav>
   <ul>
  <!--<li><a href="<%=request.getContextPath()%>/controller?actionCode=getItemsOfCart&page=home" class="col-xs-24">Home</a></li>-->
  <!--<li><a href="#" class="col-xs-24">About</a></li>-->
  <!--<li><a href="cafeterialdetail?action=viewtable" class="col-xs-24">Cafeteria Details</a></li>-->

 <!--<li><a href="Addfooditem.jsp" class="col-xs-24"> Menu Management</a></li>-->

 <li><a href="<%=request.getContextPath()%>/my-profile.jsp" class="col-xs-24">Update Profile</a></li>

      <li><a href="<%=request.getContextPath()%>/Logout" class="col-xs-24">Log-Out</a></li>

      </ul>
      </nav>
   </div>
   </div>   
  </div>
  </div>                          
</div> 
                    </div>
                </div>
            </header>
            <hr>
            
          <center><a href="leave_request.jsp"><input type="button" value="Request a leave" > </a> </center><br>
             <hr>
           <form method="post" action="Upload" enctype="multipart/form-data">
            <center>
                <table border="1" width="25%" cellpadding="5">
                    <thead> 
                            <th colspan="3">Upload File</th>        
                    </thead>
                    <tbody>
                        <tr>    
                            <td>Description : </td>
                            <td><input type="text" name="title" size="30"></td>
                        </tr>
                        <tr>
                            <td>Choose File : </td>
                            <td><input type="file" name="file_uploaded" /></td>
                        </tr>
                        <tr>
                            <td colspan="3"><input type="submit" value="Upload"></td>
                        </tr>
                    </tbody>             
                </table>
            </center>
        </form>
        
            
</body>
</html>
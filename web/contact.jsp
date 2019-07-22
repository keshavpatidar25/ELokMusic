<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    response.setHeader("Cache-Control", "no-cache");    //Doesnot allow to store in cache memory.
    response.setHeader("Cache-Control", "no-storage");  //Doesonot allow to store in Temp folder.
%>
<!doctype html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Contact Us</title>
		<link rel="stylesheet" href="TEMP/styles/layout.css" type="text/css" />
                
	</head>
	<body>
    <div class="backcolor">
    
		<div class="wrapper row1">
  			<div id="header" class="clear">
    			<div class="fl_left">
      				<h1><a href="home.jsp">E-Lok Geet</a></h1>
          		</div>
			</div>
		</div>

		<div class="wrapper row2">
  			<div id="topnav">
    			<div  class="clear">
    				<ul>
     	 				<li><a href="home.jsp">Home</a></li>
                                        <li><a href="about.jsp">About Us</a></li>
    	  				<li class="active"><a href="contact.jsp">Contact Us</a></li>
      					<li><a href="feedback.jsp">Feedback</a></li>
      					<li><a href="gallery.jsp">Gallery</a></li>
      					<li class="last"><a href="login.jsp">Login</a></li>
    				</ul>
    		  	</div>
  			</div>
		</div>

		<div class="wrapper row3" >
  			<div id="featured_slide" style="padding-top:10px;height:200px;width:1000px;">
    			<marquee height="180px" behavior="alternate" direction="left" scrolldelay="100" onmouseover="this.stop()" onmouseout="this.start()">

					<%@include file="WEB-INF/jspf/picsinclude.jspf" %>
    			</marquee>
  			</div>
		</div>

		<div class="wrapper row4">
                    <div id="container" class="clear">
    			<div id="homepage" style="font-size: 14px;">
                            <p style="font-weight: bolder;">For Complaints</p>
                            <ul>
                                <li>0731-4040401</li>
                                <li>0731-4040402</li>
                                <li>0731-4040403</li>
                            </ul>
                            <p style="font-weight: bolder;">For Queries</p>
                            <ul>
                                <li>0731-4040404</li>
                            </ul>
                            <p style="font-weight: bolder;">For Suggestions</p>
                            <ul>
                                <li>0731-4040405</li>
                            </ul>
                            <p style="font-weight: bolder;">E-Mail Address</p>
                            <ul>
                                <li>support@e-lokgeet.com</li>
                                <li>md@e-lokgeet.com</li>
                            </ul>   
                            <p style="font-weight: bolder;">Address</p>
                            <ul>
                                <li>E-Lok Geet Pvt. Ltd., Opposite Treasure Island Mall, M.G.Road, Indore - 452001, Madhya Pradesh</li>
                            </ul>        

    			</div>
                    </div>
		</div>

		<div class="wrapper">
  			<div id="copyright" class="clear">
    			<p class="fl_left">Copyright &copy; 2014 - All Rights Reserved - </p>
    			<p class="fl_right">Developed & Designed by Ashwini, Keshav and Prathmesh</p>
  			</div>
		</div>
        
    </div>
	</body>
</html>
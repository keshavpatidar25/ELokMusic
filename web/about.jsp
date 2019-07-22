<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    response.setHeader("Cache-Control", "no-cache");    //Doesnot allow to store in cache memory.
    response.setHeader("Cache-Control", "no-storage");  //Doesonot allow to store in Temp folder.
%>
<!doctype html>
<html>
	<head>
		<meta charset="utf-8">
		<title>About Us</title>
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
                                        <li class="active"><a href="about.jsp">About Us</a></li>
    	  				<li><a href="contact.jsp">Contact Us</a></li>
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
                            <p>
                            E-Lok Geet is one of the Internet's largest and most established Lok (Folk) songs uploading and downloading website.
                            It has friendly and secure environment.
                            </p>
                            <p>
                            With a depository of nearly 2,000 songs, which enables E-Lok Geet to provide large amount of variety.
                            E-Lok Geet offers the most high-quality soundtracks.
                            </p>
                            <p>
                            E-Lok Geet is founded by three students of International Institute of Professional Studies, DAVV.
                            They are :
                            </p>
                            <ul>
                                <li>Ashwini Varma</li>
                                <li>Keshav Patidar</li>
                                <li>Prathmesh Dubey</li>
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
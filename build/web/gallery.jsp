<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    response.setHeader("Cache-Control", "no-cache");    //Doesnot allow to store in cache memory.
    response.setHeader("Cache-Control", "no-storage");  //Doesonot allow to store in Temp folder.
%>
<!doctype html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Gallery</title>
		<link rel="stylesheet" href="TEMP/styles/layout.css" type="text/css" />
                <link href="TEMP/styles/js-image-slider.css" rel="stylesheet" type="text/css" />
                <link href="TEMP/styles/generic.css" rel="stylesheet" type="text/css" />
                <script src="TEMP/scripts/js-image-slider.js" type="text/javascript"></script>
    
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
    	  				<li><a href="contact.jsp">Contact Us</a></li>
      					<li><a href="feedback.jsp">Feedback</a></li>
      					<li class="active"><a href="gallery.jsp">Gallery</a></li>
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
    			<div id="homepage">
                            <div id="sliderFrame">
                                <div id="slider">
                                    <img src="Images/b2.jpg" />
                                    <img src="Images/b3.jpg" />
                                    <img src="Images/b4.jpg" />
                                    <img src="Images/b5.jpg" />
                                    <img src="Images/b7.jpg" />
                                </div>
                                <div id="htmlcaption" style="display: none;">
                                </div>
                                <br /><br /><br />
                        </div>
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
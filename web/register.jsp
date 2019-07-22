<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    response.setHeader("Cache-Control", "no-cache");    //Doesnot allow to store in cache memory.
    response.setHeader("Cache-Control", "no-storage");  //Doesonot allow to store in Temp folder.
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Register</title>
		<link rel="stylesheet" href="TEMP/styles/layout.css" type="text/css" />
                <script type="text/javascript">
                    function checkFill()
                    {
                        var uName = document.getElementById("userName").value;
                        var uPass = document.getElementById("pass").value;
                        var uPass1 = document.getElementById("confirmPass").value;
                        var name1 = document.getElementById("name").value;
                        var secretAns1 = document.getElementById("secretAns").value;
                        
                        if(uName == null || uPass == null || name1 == null || secretAns1 == null || uName == "" || uPass == "" || name1 == "" || secretAns1 == "")
                        {
                            document.getElementById("msg").innerHTML="Details Not Inserted";
                            return false;
                        }
                        if(uPass !== uPass1)
                        {
                            document.getElementById("msg").innerHTML="Passwords Donot Match";
                            return false;
                        }
                        return true;
                    }
                </script>
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
      					<li><a href="gallery.jsp">Gallery</a></li>
      					<li class="last active"><a href="login.jsp">Login</a></li>
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
                <p style="color: red; font-weight: bold; font-size: 14px;" id="msg">
                    <%
                    if(request.getAttribute("msg")!=null)
                    {
                        %>
                        <%=request.getAttribute("msg")%>
                        <%
                        request.setAttribute("msg", null);
                    }
                    %>
                </p>
                         
                <div id="homepage">
                    <form name="registerForm" action="signup.jsp" onsubmit="return checkFill();" method="post">
                    <table border="0" cellpadding="10px" style="margin-left:auto; margin-right:auto;">
                    <thead>
                        <tr>
                            <th colspan="2">Register</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>UserName</td>
                            <td><input type="text" name="userName" id="userName" value="" size="30" /></td>
                        </tr>
                        <tr>
                            <td>Password</td>
                            <td><input type="password" name="pass" id="pass" value="" size="30" /></td>
                        </tr>
                        <tr>
                            <td>Confirm Password</td>
                            <td><input type="password" name="confirmPass" id="confirmPass" value="" size="30" /></td>
                        </tr>
                        <tr>
                            <td>Name</td>
                            <td><input type="text" name="name" id="name" value="" size="30" /></td>
                        </tr>
                        <tr>
                            <td>Secret Question</td>
                            <td><select name="secretQues">
                                    <option selected="selected" value="WHAT IS YOUR FIRST PET NAME?">WHAT IS YOUR FIRST PET NAME?</option>
                                    <option value="WHAT IS YOUR FIRST SCHOOL NAME?">WHAT IS YOUR FIRST SCHOOL NAME?</option>
                                    <option value="WHAT IS YOUR MOTHER'S MAIDEN NAME?">WHAT IS YOUR MOTHER'S MAIDEN NAME?</option>
                                    <option value="WHAT IS YOUR FAVOURITE COLOUR?">WHAT IS YOUR FAVOURITE COLOUR?</option>
                                    <option value="WHAT IS YOUR FAVOURITE SONG?">WHAT IS YOUR FAVOURITE SONG?</option>
                                </select></td>
                        </tr>
                        <tr>
                            <td>Secret Answer</td>
                            <td><input type="password" name="secretAns" id="secretAns" value="" size="30" /></td>
                        </tr>
                        <tr>
                            <td colspan="2" style="text-align:center;">
                                <input name="register" type="submit" value="Register">&nbsp;&nbsp;&nbsp;
                        	<input name="reset" type="reset" value="Reset">
                            </td>
                        </tr>
                    </tbody>
                    </table>
                    </form>
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
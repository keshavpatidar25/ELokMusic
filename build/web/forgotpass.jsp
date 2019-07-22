<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    response.setHeader("Cache-Control", "no-cache");    //Doesnot allow to store in cache memory.
    response.setHeader("Cache-Control", "no-storage");  //Doesonot allow to store in Temp folder.
    session.removeAttribute("user");
%>
<jsp:useBean id="user1" class="oms.dto.User" scope="session"></jsp:useBean>
<!doctype html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Forgot Password</title>
		<link rel="stylesheet" href="TEMP/styles/layout.css" type="text/css" />
                <script type="text/javascript">
                    function checkFill()
                    {
                        var uName = document.getElementById("userName").value;
                        if(uName == null || uName == "")
                        {
                            document.getElementById("msg").innerHTML="Username Not Inserted";
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
                            <p style="color: red; font-size: 14px; font-weight: bold;" id="msg">
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
                            <form action="resetpass.jsp" method="post" onsubmit="return checkFill();">
    			<div id="homepage">
                  <table border="0" cellpadding="10px" style="margin-left:auto; margin-right:auto;">
                  	<thead>
                            <tr>
                                <th colspan="2">Forgot Password</th>
                            </tr>
                    </thead>
                    <tbody>
                    <%
                    if(session.getAttribute("user1")==null || user1.getSecretQues()==null) { %>
                      <tr>
                      	<td>Username</td>
                      	<td><input name="userName" id="userName" type="text" size="30"></td>
                      </tr>
                      <tr>
                      	<td colspan="2" style="text-align:center;">
                            <input name="forgotpassBt" type="submit" value="Submit">&nbsp;&nbsp;&nbsp;
                        	<input name="reset" type="reset" value="Reset">
                      	</td>
                      </tr>
                    <%
                    }
                    else {
                    %>
                      <tr>
                      	<td>Username</td>
                        <td><input name="userName" id="userName" type="text" readonly="readonly" value="<%=user1.getUserName()%>" size="30"></td>
                      </tr>
                      <tr>
                      	<td>Secret Question</td>
                        <td><input name="secretQues" type="text" readonly="readonly" value="<%= user1.getSecretQues() %>" size="60"></td>
                      </tr>
                      <tr>
                      	<td>Secret Answer</td>
                        <td><input name="secretAns" type="password" size="30"></td>
                      </tr>
                      <tr>
                        <td>New Password</td>
                        <td><input name="pass" type="password" size="30"></td>  
                      </tr>
                      <tr>
                      	<td colspan="2" style="text-align:center;">
                            <input name="resetpassBt" type="submit" value="Submit">&nbsp;&nbsp;&nbsp;
                            <input name="reset" type="reset" value="Reset">
                      	</td>
                      </tr>
                    <%
                    }
                    %>    
                    </tbody>
                  </table>

    			</div>
    			</form>
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
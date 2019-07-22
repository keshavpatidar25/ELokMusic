<%@page import="oms.dao.FeedbackDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    response.setHeader("Cache-Control", "no-cache");    //Doesnot allow to store in cache memory.
    response.setHeader("Cache-Control", "no-storage");  //Doesonot allow to store in Temp folder.
    String bt = request.getParameter("submit");
    if(bt!=null && bt.equals("Submit")) {
        %>
        <jsp:useBean id="fb" class="oms.dto.Feedback"></jsp:useBean>
        <jsp:setProperty name="fb" property="*"></jsp:setProperty>
        <%
        new FeedbackDao().insertFeedback(fb);
        try{
            new FeedbackDao().emailmsg(fb,"Dear "+fb.getFrom()+",\n\nThank You for your feedback.");
        }
        catch (Exception ex) {
            ex.printStackTrace();
        }
        request.setAttribute("msg", "Feedback Submitted Successfully.");
    }
%>
<jsp:useBean id="user" class="oms.dto.User" scope="session"></jsp:useBean>
<!doctype html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Feedback</title>
		<link rel="stylesheet" href="TEMP/styles/layout.css" type="text/css" />
                <script type="text/javascript">
                    function checkFill()
                    {
                        var fbFrom = document.getElementById("from").value;
                        var fbEmail = document.getElementById("email").value;
                        var fbPhone = document.getElementById("phone").value;
                        var fbSubject = document.getElementById("subject").value;
                        var fbMessage = document.getElementById("message").value.trim();
                        if(fbFrom == null || fbEmail == null || fbPhone == null || fbSubject == null || fbMessage == null || fbFrom == "" || fbEmail == "" || fbPhone == "" || fbSubject == "" || fbMessage == "" || (fbMessage.length < 1))
                        {
                            document.getElementById("msg").innerHTML="Details not entered.";
                            return false;
                        }
                        if(isNaN(fbPhone) || fbPhone.length != 10)
                        {
                            document.getElementById("msg").innerHTML="Phone Number Is Not Valid.";
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
                                    <% 
                                    if(session.getAttribute("user")!=null && user.getRole()!=null && user.getRole().equalsIgnoreCase("User")) { 
                                    %> 
                                        <li><a href="home.jsp">Home</a></li>
                                        <li><a href="usersongs.jsp">Songs</a></li>
                                        <li><a href="userdelete.jsp">Delete</a></li>
                                        <li class="active"><a href="feedback.jsp">Feedback</a></li>
                                        <li><a href="account.jsp">My Account</a></li>
                                        <li class="last"><a href="logout1.jsp">Logout</a></li>
                                    <%
                                    } else {
                                    %>
                                        <li><a href="home.jsp">Home</a></li>
                                        <li><a href="about.jsp">About Us</a></li>
    	  				<li><a href="contact.jsp">Contact Us</a></li>
      					<li class="active"><a href="feedback.jsp">Feedback</a></li>
      					<li><a href="gallery.jsp">Gallery</a></li>
      					<li class="last"><a href="login.jsp">Login</a></li>
                                    <%
                                    }
                                    %>
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
    			<div id="homepage" style="font-size: 14px;">
                            <form action="feedback.jsp" onsubmit="return checkFill();" method="POST">
                                <table border="0" cellpadding="10px" style="margin-left:auto; margin-right:auto;">
                    <thead>
                        <tr>
                            <th colspan="2">Feedback</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>From</td>
                            <td><input type="text" name="from" id="from" value="" size="30" /></td>
                        </tr>
                        <tr>
                            <td>Email</td>
                            <td><input type="email" name="email" id="email" value="" size="30" /></td>
                        </tr>
                        <tr>
                            <td>Phone</td>
                            <td><input type="number" name="phone" id="phone" value="" size="30" /></td>
                        </tr>
                        <tr>
                            <td>Subject</td>
                            <td><input type="text" name="subject" id="subject" value="" size="30" /></td>
                        </tr>
                        <tr>
                            <td>Message</td>
                            <td><textarea name="message" id="message" rows="5" cols="20" maxlength="200"></textarea></td>
                        </tr>
                        <tr>
                            <td colspan="2" style="text-align:center;">
                                <input name="submit" type="submit" value="Submit">&nbsp;&nbsp;&nbsp;
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
    <% 
    if(session.getAttribute("user")!=null && user.getRole()!=null && user.getRole().equalsIgnoreCase("User")) { 
    %>                    
    <script type="text/javascript">
        document.getElementById("from").value = "<%=user.getName()%>";
        document.getElementById("email").value= "<%=user.getUserName()+"@"%>";
        document.getElementById("from").readOnly = true;
    </script>
    <%
    } else if(session.getAttribute("user")!=null && user.getRole()!=null && user.getRole().equalsIgnoreCase("Admin")) {
        response.sendRedirect("adminfeedback.jsp");
    }
    %>
</body>
</html>
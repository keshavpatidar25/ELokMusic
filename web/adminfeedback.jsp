<%@page import="oms.dao.FeedbackDao"%>
<%@page import="oms.dto.Feedback"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    response.setHeader("Cache-Control", "no-cache");    //Doesnot allow to store in cache memory.
    response.setHeader("Cache-Control", "no-storage");  //Doesonot allow to store in Temp folder.
%>
<jsp:useBean id="user" class="oms.dto.User" scope="session"></jsp:useBean>
<% 
    if(session.getAttribute("user")!=null && user.getRole()!=null && user.getRole().equalsIgnoreCase("Admin")) { 

        String bt = request.getParameter("mailBt");
        if(bt!=null && bt.equals("Mail")) {
            request.setAttribute("msg", "Mail Sent Successfully.");
            String mailTo[] = request.getParameterValues("chkMailTo");
            String message = request.getParameter("mailMsg");
            for(String email : mailTo) {
                Feedback fb = new Feedback();
                fb.setEmail(email);
                try{
                    new FeedbackDao().emailmsg(fb,"Dear Customer,\n\n"+message);
                }
                catch (Exception ex) {
                    request.setAttribute("msg", "Mail not sent.");
                    ex.printStackTrace();
                }
            }
            
        }
%>

<!doctype html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Feedback</title>
		<link rel="stylesheet" href="TEMP/styles/layout.css" type="text/css" />
                <script type="text/javascript">
                    function checkFill()
                    {
                        var mailMsg = document.getElementsByName("mailMsg")[0].value.trim();
                        var mailTo = false;
                        var chkMailTo = document.getElementsByName("chkMailTo");
                        for(var x=0;x<chkMailTo.length;x++)
                        {
                            if(chkMailTo[x].checked == true)
                            {
                                mailTo = true;
                                break;
                            }
                        }
                        if (mailMsg == null || mailMsg == "" || mailTo == false)
                        {
                            document.getElementById("msg").innerHTML = "Required Details not defined.";
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
                                        <li><a href="adminupload.jsp">Upload</a></li>
    	  				<li><a href="admindelete.jsp">Delete</a></li>
      					<li class="active"><a href="adminfeedback.jsp">Feedback</a></li>
      					<li><a href="account.jsp">My Account</a></li>
      					<li class="last"><a href="logout1.jsp">Logout</a></li>
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
                            <form onsubmit="return checkFill();" method="POST" action="adminfeedback.jsp">
                            <table style="margin-left: auto; margin-right: auto; font-size: 14px;">
                                     <thead>
                                     <tr>
                                         <th>DATE</th>
                                         <th>FROM</th>
                                         <th>EMAIL</th>
                                         <th>PHONE</th>
                                         <th>SUBJECT</th>
                                         <th>MESSAGE</th>
                                         <th>MAIL</th>
                                     </tr>
                                     </thead>
                                     <tbody>
                                     <%
                                        int i=1;
                                        ArrayList<Feedback> al = new FeedbackDao().getAllFeedbacks();
                                        for(Feedback f : al) {
                                            if(i%2==0) {
                                            %>
                                     <tr style="background-color: white">
                                             <%
                                             } else {
                                             %>  
                                     <tr>
                                             <%
                                             }
                                             i++;
                                             %>
                                         <td style="text-align: left;"> <%= f.getDate() %> </td>
                                         <td style="text-align: left;"> <%= f.getFrom() %> </td>
                                         <td style="text-align: left;"> <%= f.getEmail() %> </td>
                                         <td> <%= f.getPhone() %> </td>
                                         <td style="text-align: left;"> <%= f.getSubject() %> </td>
                                         <td style="text-align: left;"> <%= f.getMessage() %> </td>
                                         <td><input type="checkbox" name="chkMailTo" value="<%= f.getEmail() %>" /></td>

                                         
                                     </tr>
                                     <%
                                     }
                                     %>
                                     
                                     </tbody>
                                 </table>
                                 <p style="text-align: center;">
                                     <textarea style="width: 500px; height: 200px; font-size: 18px; " name="mailMsg">Thank You for your feedback.</textarea>
                                     <br/><br/><input type="submit" name="mailBt" value="Mail" style="font-size: 20px;" />
                                 </p>
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
<%
    } else {
        response.sendRedirect("logout1.jsp");
    }
%>
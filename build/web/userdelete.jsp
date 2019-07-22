<%@page import="oms.dto.SongUser"%>
<%@page import="oms.dao.SongUserDao"%>
<%@page import="oms.dto.Song"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    response.setHeader("Cache-Control", "no-cache");    //Doesnot allow to store in cache memory.
    response.setHeader("Cache-Control", "no-storage");  //Doesonot allow to store in Temp folder.
%>
<jsp:useBean id="user" class="oms.dto.User" scope="session"></jsp:useBean>
<% 
    if(session.getAttribute("user")!=null && user.getRole()!=null && user.getRole().equalsIgnoreCase("User")) { 
%>
<!doctype html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Delete</title>
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
                                        <li><a href="usersongs.jsp">Songs</a></li>
                                        <li class="active"><a href="userdelete.jsp">Delete</a></li>
                                        <li><a href="feedback.jsp">Feedback</a></li>
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
    			<div id="homepage" style="font-size: 14px;">
                            <%
                                SongUser songuser = new SongUser();
                                songuser.setUser(user);
                                ArrayList<Song> al = new SongUserDao().getUserSongs(songuser);
                            %>
                            <h3 style="text-align: center; color: #002E5D">
                                User : <%= user.getName().toUpperCase() %>
                            </h3>
                            <table style = "margin-left: auto; margin-right: auto;">
                                    <thead>
                                        <tr>
                                            <th>Song Name</th>
                                            <th>Movie</th>
                                            <th>Play</th>
                                            <th>Unlink</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <% for(Song s : al) {
                                    %>
                                        <tr>
                                        <td><%= s.getSongName() %></td>
                                        <td><%= s.getSongMovie() %></td>
                                        <td>
                                            <audio controls>
                                              <source src="<%= s.getSongLocation()+'/'+s.getSongName() %>" type="audio/mpeg">
                                            </audio> 
                                        </td>
                                        <td>
                                            <a href="userunlink.jsp?songId=<%=s.getSongId()%>">Unlink</a>
                                        </td>
                                        </tr>
                                    <%
                                    }
                                    %>
                                    </tbody>
                            </table>
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
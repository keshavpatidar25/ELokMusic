<%@page import="oms.dao.SongDao"%>
<%@page import="oms.dto.Song"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    response.setHeader("Cache-Control", "no-cache");    //Doesnot allow to store in cache memory.
    response.setHeader("Cache-Control", "no-storage");  //Doesonot allow to store in Temp folder.
%>
<jsp:useBean id="user" class="oms.dto.User" scope="session"></jsp:useBean>
<!doctype html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Movie Songs</title>
		<link rel="stylesheet" href="TEMP/styles/layout.css" type="text/css" />
                
	</head>
	<body>
    <div class="backcolor">
    
		<div class="wrapper row1">
  			<div id="header" class="clear">
    			<div class="fl_left">
      				<h1><a href="Temp/index.html">E-Lok Geet</a></h1>
          		</div>
			</div>
		</div>

		<div class="wrapper row2">
  			<div id="topnav">
    			<div  class="clear">
    				<ul>
     	 				<jsp:include page="WEB-INF/jspf/navipart.jsp"></jsp:include>
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
    			<div id="homepage" style="font-size: 14px;">
                            <%
                                if(request.getParameter("movieId")==null) {
                                    response.sendRedirect("home.jsp");
                                } else {
                                int movieId = Integer.parseInt(request.getParameter("movieId"));
                                ArrayList<Song> al = new SongDao().getMovieSongs(movieId);
                                %>
                                <h3 style="text-align: center; color: #002E5D">
                                    Movie : <%= new SongDao().getMovieName(movieId) %>
                                </h3>
                                <table style = "margin-left: auto; margin-right: auto;">
                                    <thead>
                                        <tr>
                                            <th>Song Name</th>
                                            <th>Play</th>
                                            <th>Download</th>
                                             <% 
                                             if(session.getAttribute("user")!=null && user.getRole()!=null && user.getRole().equalsIgnoreCase("User")) { 
                                             %>
                                            <th>Link</th>
                                            <%
                                             }
                                             %>
                                        </tr>
                                    </thead>
                                <%
                                for(Song s : al) {
                                %>
                                <tr>
                                    <td><%= s.getSongName() %></td>
                                    <td>
                                        <audio controls>
                                          <source src="<%= s.getSongLocation()+'/'+s.getSongName() %>" type="audio/mpeg">
                                        </audio> 
                                    </td>
                                    <td>
                                        <a href="<%= s.getSongLocation()+'/'+s.getSongName() %>">Download</a>
                                    </td>
                                    <% 
                                    if(session.getAttribute("user")!=null && user.getRole()!=null && user.getRole().equalsIgnoreCase("User")) { 
                                    %>
                                    <td><a href="userlink.jsp?songId=<%=s.getSongId()%>">Link</a></td>
                                    <%
                                    }
                                    %>
                                </tr>  
                                <%
                                }
                            %>
                                </table> <% } %>
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
<%@page import="oms.dto.Song"%>
<%@page import="oms.dao.SongDao"%>
<%@page import="oms.dto.Movie"%>
<%@page import="java.util.ArrayList"%>
<%@page import="oms.dao.MovieDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    response.setHeader("Cache-Control", "no-cache");    //Doesnot allow to store in cache memory.
    response.setHeader("Cache-Control", "no-storage");  //Doesonot allow to store in Temp folder.
%>
<jsp:useBean id="user" class="oms.dto.User" scope="session"></jsp:useBean>
<% 
    if(session.getAttribute("user")!=null && user.getRole()!=null && user.getRole().equalsIgnoreCase("Admin")) { 
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
                                        <li><a href="adminupload.jsp">Upload</a></li>
    	  				<li class="active"><a href="admindelete.jsp">Delete</a></li>
      					<li><a href="adminfeedback.jsp">Feedback</a></li>
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
                        <div id="homepage" style="text-align: center; font-size: 20px;">
                            <form name="selOpt"action="admindelete.jsp" method="POST">
                                <input type="radio" name="deleteOpt" value="delMovie" onchange="document.getElementsByName('selOpt')[0].submit();" /> Delete Movie &emsp;&emsp;&emsp;
                                <input type="radio" name="deleteOpt" value="delSong" onchange="document.getElementsByName('selOpt')[0].submit();" /> Delete Song
                            </form>
                            <%!
                                String deleteOpt;
                                ArrayList<Movie> al;
                                ArrayList<Song> al1;
                            %>
                            <%
                            deleteOpt = request.getParameter("deleteOpt");
                            if(deleteOpt != null && deleteOpt.equals("delMovie")) {
                                 %>
                                 <br />
                                 <table style="margin-left: auto; margin-right: auto; font-size: 14px;">
                                     <thead>
                                     <tr>
                                         <th>MOVIE NAME</th>
                                         <th>YEAR</th>
                                         <th>DELETE</th>
                                     </tr>
                                     </thead>
                                     <tbody>
                                 <%
                                 al = new MovieDao().getAllMovies();
                                 for(Movie m : al) {
                                     %>
                                     <tr>
                                         <td style="text-align: left;"> <%= m.getMovieName() %> </td>
                                         <td> <%= m.getMovieYear() %> </td>
                                         <td> <a href="admindeletemovie.jsp?movieId=<%=m.getMovieId()%>">Delete</a></td>
                                     </tr>
                                     <%
                                 }
                                 %>
                                     </tbody>
                                 </table>
                                 <script type="text/javascript">
                                     document.getElementsByName("deleteOpt")[0].checked = true;
                                 </script>
                                 <%
                            } else if(deleteOpt != null && deleteOpt.equals("delSong")) {
                                %>
                                 <br />
                                 <table style="margin-left: auto; margin-right: auto; font-size: 14px;">
                                     <thead>
                                     <tr>
                                         <th>SONG NAME</th>
                                         <th>MOVIE NAME</th>
                                         <th>DELETE</th>
                                     </tr>
                                     </thead>
                                     <tbody>
                                 <%
                                 al1 = new SongDao().getAllSongs();
                                 for(Song s : al1) {
                                     %>
                                     <tr>
                                         <td style="text-align: left;"> <%= s.getSongName() %> </td>
                                         <td style="text-align: left;"> <%= s.getSongMovie() %> </td>
                                         <td> <a href="admindeletesong.jsp?songId=<%=s.getSongId()%>">Delete</a></td>
                                     </tr>
                                     <%
                                 }
                                 %>
                                     </tbody>
                                 </table>
                                 <script type="text/javascript">
                                     document.getElementsByName("deleteOpt")[1].checked = true;
                                 </script>
                                 <%
                            } else if(deleteOpt != null) {
                                response.sendRedirect("admindelete.jsp");
                            }
                            %>
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
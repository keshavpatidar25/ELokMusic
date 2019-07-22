
<%@page import="java.util.List"%>
<%@page import="java.io.File"%>
<%@page import="oms.dao.MovieDao"%>
<%@page import="oms.dto.Movie"%>
<%@page import="java.util.ArrayList"%>

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
		<title>Upload</title>
		<link rel="stylesheet" href="TEMP/styles/layout.css" type="text/css" />
                <script type="text/javascript">
                    function changeRadioBt() {
                        var opt = document.getElementById("existMovie").checked;
                        if(opt) {
                            document.getElementsByName("songMovieId")[0].disabled = false;
                            document.getElementsByName("songFile")[0].disabled = false;
                            document.getElementsByName("uploadBt")[0].disabled = false;
                            document.getElementsByName("movieName")[0].disabled = true;
                            document.getElementsByName("movieYear")[0].disabled = true;
                            document.getElementsByName("addMovieBt")[0].disabled = true;
                            document.getElementsByName("movieLang") [0].disabled = true;
                            document.getElementById("frm").action = "adminuploadsong.jsp";
                        } else {
                            document.getElementsByName("songMovieId")[0].disabled = true;
                            document.getElementsByName("songFile")[0].disabled = true;
                            document.getElementsByName("uploadBt")[0].disabled = true;
                            document.getElementsByName("movieName")[0].disabled = false;
                            document.getElementsByName("movieYear")[0].disabled = false;
                            document.getElementsByName("addMovieBt")[0].disabled = false;
                            document.getElementsByName("movieLang") [0].disabled = false;
                            document.getElementById("frm").action = "adminuploadmovie.jsp";
                        }
                } 
                </script>
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
     	 				<li><a href="home.jsp">Home</a></li>
                                        <li class="active"><a href="adminupload.jsp">Upload</a></li>
    	  				<li><a href="admindelete.jsp">Delete</a></li>
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
                        <p style="color: red; font-size: 14px" id="msg">
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
                            <form id="frm" action="adminuploadsong.jsp" method="POST" enctype="multipart/form-data">
                            <table style="margin-left: auto; margin-right: auto;">
                                <tr>
                                    <td><input type="radio" name="radioMovie" id="existMovie" value="Existing Movie" checked="checked" onchange="changeRadioBt()" />Existing Movie/Album </td>
                                    <td><input type="radio" name="radioMovie" id="newMovie" value="New Movie" onchange="changeRadioBt()" />New Movie/Album</td>
                                </tr>
                                
                                <tr>
                                    <td>Movie/Album Name : <select name="songMovieId" id="songMovie">
                                        </select>
                                    </td>
                                    <td>
                                        Movie/Album Name : <input type="text" name="movieName" value="" size="30" disabled="disabled" />
                                    </td>
                                </tr>
                                <tr>
                                    <td rowspan="2"><input type="file" name="songFile" value="" accept=".mp3"/></td>
                                    <td>Year : <input type="number" name="movieYear" value="" size="4" disabled="disabled" /></td>
                                </tr>
                                <tr>
                                    <td>
                                        Language : <select name="movieLang" disabled="disabled">
                                            <option selected="selected">Gujrati</option>
                                            <option>Haryanvi</option>
                                            <option>Marathi</option>
                                            <option>Malwi</option>
                                            <option>Punjabi</option>
                                            <option>Rajasthani</option>
                                            <option>Others</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: center;"><input type="submit" name="uploadBt" value="Upload"/></td>
                                    <td style="text-align: center;"><input type="submit" value="Add Movie" name="addMovieBt" disabled="disabled"/></td>
                                </tr>
                                   
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
            ArrayList<Movie> al = new MovieDao().getAllMovies();
            %>
            
            <script type="text/javascript">
            <%!
                String yr;
            %>
            <%
            for(Movie m : al) {
                if (m.getMovieYear()==0) {
                    yr = "";
                } else {
                    yr = " ("+m.getMovieYear()+")";
                }
                %>    
                    document.getElementById("songMovie").innerHTML = document.getElementById("songMovie").innerHTML + "<option value='<%= m.getMovieId() %>'> <%= m.getMovieName() %><%=yr%> </option>";
            <%
            }
        %>
        </script>
        
    </body>
</html>
<%
    } else {
        response.sendRedirect("logout1.jsp");
    }
%>
<%@page import="oms.dao.MovieDao"%>
<%@page import="oms.dto.Movie"%>
<%
    response.setHeader("Cache-Control", "no-cache");    //Doesnot allow to store in cache memory.
    response.setHeader("Cache-Control", "no-storage");  //Doesonot allow to store in Temp folder.
%>
<jsp:useBean id="user" class="oms.dto.User" scope="session"></jsp:useBean>
<% 
    if(session.getAttribute("user")!=null && user.getRole()!=null && user.getRole().equalsIgnoreCase("Admin")) { 
        String movieId = request.getParameter("movieId");
        if(movieId!=null) {
            Movie movie = new Movie();
            movie.setMovieId(Integer.parseInt(movieId));
            new MovieDao().getMovieDetails(movie);
            new MovieDao().deleteMovie(movie);
        }
        response.sendRedirect("admindelete.jsp?deleteOpt=delMovie");
    } else {
        response.sendRedirect("logout1.jsp");
    }
%>
<%@page import="oms.dao.MovieDao"%>
<%@page import="oms.dto.Movie"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.*"%>
<%@page import="org.apache.commons.io.*" %>
<%
    response.setHeader("Cache-Control", "no-cache");    //Doesnot allow to store in cache memory.
    response.setHeader("Cache-Control", "no-storage");  //Doesonot allow to store in Temp folder.
%>
<jsp:useBean id="user" class="oms.dto.User" scope="session"></jsp:useBean>
<% 
    if(session.getAttribute("user")!=null && user.getRole()!=null && user.getRole().equalsIgnoreCase("Admin")) { 
%>
<%!
    String msg, fieldValue, fieldName;
    RequestDispatcher rd;
%>
<%
    try{
    Movie movie = new Movie();
    FileItemFactory factory = new DiskFileItemFactory();
    ServletFileUpload upload = new ServletFileUpload(factory);
    Iterator<FileItem> iterator = upload.parseRequest(request).iterator();
    while (iterator.hasNext()) {
       FileItem item = iterator.next();
       fieldName = item.getFieldName();
       fieldValue = item.getString();
       if(fieldName.equals("addMovieBt")){
           if(!fieldValue.equals("Add Movie")) {
               response.sendRedirect("adminupload.jsp");
               throw new Exception();
           }
       }
       if(fieldName.equals("movieName")) {
           movie.setMovieName(fieldValue);
       }
       else if (fieldName.equals("movieLang")) {
           movie.setMovieName(movie.getMovieName()+" ("+fieldValue+")");
       }
       else if (fieldName.equals("movieYear")) {
           if(fieldValue.equals("") || fieldValue==null) {
               movie.setMovieYear(0);
           } else {
               movie.setMovieYear(Integer.parseInt(fieldValue));
           }
       }      
    }
    new MovieDao().insertMovie(movie);         
    msg="Movie Inserted Successfully.";
    } catch(Exception ex) {
       msg="Invalid Details.";
    }
    rd = request.getRequestDispatcher("adminupload.jsp");
    request.setAttribute("msg", msg);
    rd.forward(request, response);
%>
<%
    } else {
        response.sendRedirect("logout1.jsp");
    }
%>
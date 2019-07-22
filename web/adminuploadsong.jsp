<%@page import="oms.dao.SongDao"%>
<%@page import="oms.dto.Song"%>
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
    String msg, fieldName, fieldValue;
    File uploadedFile;
    RequestDispatcher rd;
    String dirPath="";
    Movie movie = new Movie();
    Song song = new Song();
    FileItem item, item1;
%>
<%
    try{
        
    FileItemFactory factory = new DiskFileItemFactory();
    ServletFileUpload upload = new ServletFileUpload(factory);
    Iterator<FileItem> iterator = upload.parseRequest(request).iterator();
    while (iterator.hasNext()) {
       item = iterator.next();
       fieldName = item.getFieldName();
       fieldValue = item.getString();
       if(fieldName.equals("uploadBt")){
           if(!fieldValue.equals("Upload")) {
               response.sendRedirect("adminupload.jsp");
               throw new Exception();
           }
       }
       if(fieldName.equals("songMovieId")) {
          movie.setMovieId(Integer.parseInt(fieldValue));
          new MovieDao().getMovieDetails(movie);
          song.setSongMovieId(movie.getMovieId());
          song.setSongMovie(movie.getMovieName());
       }
       else if(fieldName.equals("songFile") && !item.isFormField()) {
           item1=item;
       }
    }
    new SongDao().uploadSong(song, item1);
    msg="Song Uploaded Successfully.";
    } catch(Exception ex) {
       msg="Invalid Details.";
       ex.printStackTrace();
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
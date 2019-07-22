<%@page import="oms.dao.SongDao"%>
<%@page import="oms.dto.Song"%>
<%
    response.setHeader("Cache-Control", "no-cache");    //Doesnot allow to store in cache memory.
    response.setHeader("Cache-Control", "no-storage");  //Doesonot allow to store in Temp folder.
%>
<jsp:useBean id="user" class="oms.dto.User" scope="session"></jsp:useBean>
<% 
    if(session.getAttribute("user")!=null && user.getRole()!=null && user.getRole().equalsIgnoreCase("Admin")) { 
        String songId = request.getParameter("songId");
        if(songId!=null) {
            Song song = new Song();
            song.setSongId(Integer.parseInt(songId));
            new SongDao().getSongDetails(song);
            new SongDao().deleteSong(song);
        }
        response.sendRedirect("admindelete.jsp?deleteOpt=delSong");
    } else {
        response.sendRedirect("logout1.jsp");
    }
%>
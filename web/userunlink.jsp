<%@page import="oms.dao.SongDao"%>
<%@page import="oms.dao.SongUserDao"%>
<%@page import="oms.dto.SongUser"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    response.setHeader("Cache-Control", "no-cache");    //Doesnot allow to store in cache memory.
    response.setHeader("Cache-Control", "no-storage");  //Doesonot allow to store in Temp folder.
%>
<jsp:useBean id="user" class="oms.dto.User" scope="session"></jsp:useBean>
<% 
    if(session.getAttribute("user")!=null && user.getRole()!=null && user.getRole().equalsIgnoreCase("User")) { 
        if(request.getParameter("songId")!=null) {
            %>
            <jsp:useBean id="song" class="oms.dto.Song"></jsp:useBean>
            <jsp:setProperty name="song" property="songId"></jsp:setProperty>
            <%
            SongUser songuser = new SongUser();
            songuser.setSong(song);
            songuser.setUser(user);
            new SongDao().getSongDetails(song);
            new SongUserDao().deleteSongUser(songuser);    
            response.sendRedirect("userdelete.jsp");
            return;
        }
    }
    response.sendRedirect("home.jsp");
%>

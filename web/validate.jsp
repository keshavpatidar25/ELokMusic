<%@page import="oms.dao.UserDao"%>
<%@page import="oms.dto.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    response.setHeader("Cache-Control", "no-cache");    //Doesnot allow to store in cache memory.
    response.setHeader("Cache-Control", "no-storage");  //Doesonot allow to store in Temp folder.
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Validate</title>
    </head>
</html>

<jsp:useBean id="user" class="oms.dto.User" scope="session"></jsp:useBean>
<jsp:setProperty name="user" property="*"></jsp:setProperty>

<%
    boolean b = new UserDao().login(user);
    if(b)
    {
        response.sendRedirect("home.jsp");
    }
    else
    {
        %>
        <%@include file="logout.jsp" %>
        <%
        RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
        request.setAttribute("msg", "Invalid Username or Password");
        rd.forward(request, response);
    }
%>
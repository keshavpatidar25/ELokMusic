<%@page import="oms.dto.User"%>
<%@page import="oms.dao.UserDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    response.setHeader("Cache-Control", "no-cache");    //Doesnot allow to store in cache memory.
    response.setHeader("Cache-Control", "no-storage");  //Doesonot allow to store in Temp folder.
%>
<jsp:useBean id="user" class="oms.dto.User" scope="session"></jsp:useBean>
<%
    String updateRoleBt = request.getParameter("updateRoleBt");
    if(session.getAttribute("user")!=null && user.getRole()!=null && user.getRole().equalsIgnoreCase("Admin") && updateRoleBt != null && updateRoleBt.equals("Update")) { 
%>
<jsp:useBean id="user2" class="oms.dto.User"></jsp:useBean>
<jsp:setProperty name="user2" property="*"></jsp:setProperty>
<% 
    new UserDao().updateRole(user2);
    if(user.getUserName().equalsIgnoreCase(user2.getUserName())) {
        user.setRole(user2.getRole());
    }
    request.setAttribute("msg", "Role Updated Successful."); 
    user2=null;
%>
<jsp:forward page="account.jsp"></jsp:forward>
<%
    } else {
        response.sendRedirect("account.jsp");
    }
%>
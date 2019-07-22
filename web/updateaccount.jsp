<%@page import="oms.dto.User"%>
<%@page import="oms.dao.UserDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    response.setHeader("Cache-Control", "no-cache");    //Doesnot allow to store in cache memory.
    response.setHeader("Cache-Control", "no-storage");  //Doesonot allow to store in Temp folder.
%>
<jsp:useBean id="user" class="oms.dto.User" scope="session"></jsp:useBean>
<%
    String updateBt = request.getParameter("updateBt");
    if(session.getAttribute("user")!=null && user.getUserName()!=null && updateBt != null && updateBt.equals("Update")) { 
%>
<jsp:useBean id="user2" class="oms.dto.User"></jsp:useBean>
<jsp:setProperty name="user2" property="*"></jsp:setProperty>
<% 
    User user1 = new User();
    user1.setUserName(user.getUserName());
    user1.setPass(request.getParameter("oldPass"));
    boolean b = new UserDao().login(user1);
    if(b) {
        new UserDao().updateDetails(user2);
        user.setName(user2.getName());
        user.setSecretQues(user2.getSecretQues());
        user.setSecretAns(user2.getSecretAns());
        request.setAttribute("msg", "Details Updated Successful.");
    }
    else {
        request.setAttribute("msg", "Old Password is wrong. Details not Updated");
    }
    user1=null; 
    user2=null;
%>
<jsp:forward page="account.jsp"></jsp:forward>
<%
    } else {
        response.sendRedirect("account.jsp");
    }
%>
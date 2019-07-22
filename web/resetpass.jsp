<%@page import="oms.dao.UserDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    response.setHeader("Cache-Control", "no-cache");    //Doesnot allow to store in cache memory.
    response.setHeader("Cache-Control", "no-storage");  //Doesonot allow to store in Temp folder.
    session.removeAttribute("user");
%>

<jsp:useBean id="user1" class="oms.dto.User" scope="session"></jsp:useBean>
<jsp:setProperty name="user1" property="userName"></jsp:setProperty>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forgot Password</title>
    </head>
</html>

<%
    String bt = request.getParameter("forgotpassBt");
    String bt1 =request.getParameter("resetpassBt");
    if(bt!=null && bt.equals("Submit")) {
        boolean b = new UserDao().verifyUserName(user1);
        if(!b)
        {
            request.setAttribute("msg", "Username doesnot exist.");
        }
        else
        {
            request.setAttribute("msg", null);
        }
    }
    else if(bt1 != null && bt1.equals("Submit")) {
        if(request.getParameter("secretAns").equals(user1.getSecretAns()))
        {
            String pass = request.getParameter("pass");
            user1.setPass(pass);
            new UserDao().updatePassword(user1);
            request.setAttribute("msg", "Password Changed Successfully.");
            %>
            <%@include file="logout.jsp" %>
            <jsp:forward page="login.jsp"></jsp:forward>
            <%
        }
        else {
            request.setAttribute("msg", "Password Cannot Be Changed. Secret Answer Wrong.");
        }
    }
%>
<jsp:forward page="forgotpass.jsp"></jsp:forward>
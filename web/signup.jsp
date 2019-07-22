<%@page import="oms.dao.UserDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    response.setHeader("Cache-Control", "no-cache");    //Doesnot allow to store in cache memory.
    response.setHeader("Cache-Control", "no-storage");  //Doesonot allow to store in Temp folder.
%>
<!doctype html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Sign Up</title>
	</head>
</html>
<jsp:useBean id="user" class="oms.dto.User"></jsp:useBean>
<jsp:setProperty name="user" property="*"></jsp:setProperty>
<%
    user.setRole("USER");
    boolean b = new UserDao().verifyUserName(user);
    if(b)
    {
        request.setAttribute("msg", "Cannot Register. Username already exist.");
    }
    else
    {
        new UserDao().insertData(user);
        request.setAttribute("msg", "Registration Successful.");
    }
%>
<jsp:forward page="register.jsp"></jsp:forward>
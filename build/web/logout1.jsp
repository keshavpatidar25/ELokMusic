<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout</title>
    </head>
</html>
<jsp:include page="logout.jsp"></jsp:include>
<% response.sendRedirect("login.jsp"); %>
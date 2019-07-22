<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  session.removeAttribute("user"); //Clears the content of Session.
    session.removeAttribute("user1");
    session.invalidate(); //Destroys Session.
%>
<jsp:useBean id="user" class="oms.dto.User" scope="session"></jsp:useBean>
<%
    if(session.getAttribute("user")!=null && user.getRole()!=null && user.getRole().equalsIgnoreCase("Admin")) { 
%>

        <li class="active"><a href="home.jsp">Home</a></li>
        <li><a href="adminupload.jsp">Upload</a></li>
        <li><a href="admindelete.jsp">Delete</a></li>
        <li><a href="adminfeedback.jsp">Feedback</a></li>
        <li><a href="account.jsp">My Account</a></li>
        <li class="last"><a href="logout1.jsp">Logout</a></li>
<%
    } else if(session.getAttribute("user")!=null && user.getRole()!=null && user.getRole().equalsIgnoreCase("User")) {
%>
        <li class="active"><a href="home.jsp">Home</a></li>
        <li><a href="usersongs.jsp">Songs</a></li>
        <li><a href="userdelete.jsp">Delete</a></li>
        <li><a href="feedback.jsp">Feedback</a></li>
        <li><a href="account.jsp">My Account</a></li>
        <li class="last"><a href="logout1.jsp">Logout</a></li>
<%
    } else {
%>
    <li class="active"><a href="home.jsp">Home</a></li>
    <li><a href="about.jsp">About Us</a></li>
    <li><a href="contact.jsp">Contact Us</a></li>
    <li><a href="feedback.jsp">Feedback</a></li>
    <li><a href="gallery.jsp">Gallery</a></li>
    <li class="last"><a href="login.jsp">Login</a></li>
<%
    }
%>

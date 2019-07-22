package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import oms.dao.FeedbackDao;

public final class feedback_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(1);
    _jspx_dependants.add("/WEB-INF/jspf/picsinclude.jspf");
  }

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write('\n');
      out.write('\n');

    response.setHeader("Cache-Control", "no-cache");    //Doesnot allow to store in cache memory.
    response.setHeader("Cache-Control", "no-storage");  //Doesonot allow to store in Temp folder.
    String bt = request.getParameter("submit");
    if(bt!=null && bt.equals("Submit")) {
        
      out.write("\n");
      out.write("        ");
      oms.dto.Feedback fb = null;
      synchronized (_jspx_page_context) {
        fb = (oms.dto.Feedback) _jspx_page_context.getAttribute("fb", PageContext.PAGE_SCOPE);
        if (fb == null){
          fb = new oms.dto.Feedback();
          _jspx_page_context.setAttribute("fb", fb, PageContext.PAGE_SCOPE);
        }
      }
      out.write("\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.introspect(_jspx_page_context.findAttribute("fb"), request);
      out.write("\n");
      out.write("        ");

        new FeedbackDao().insertFeedback(fb);
        try{
            new FeedbackDao().emailmsg(fb);
        }
        catch (Exception ex) {
            ex.printStackTrace();
        }
        request.setAttribute("msg", "Feedback Submitted Successfully.");
    }

      out.write('\n');
      oms.dto.User user = null;
      synchronized (session) {
        user = (oms.dto.User) _jspx_page_context.getAttribute("user", PageContext.SESSION_SCOPE);
        if (user == null){
          user = new oms.dto.User();
          _jspx_page_context.setAttribute("user", user, PageContext.SESSION_SCOPE);
        }
      }
      out.write("\n");
      out.write("<!doctype html>\n");
      out.write("<html>\n");
      out.write("\t<head>\n");
      out.write("\t\t<meta charset=\"utf-8\">\n");
      out.write("\t\t<title>Feedback</title>\n");
      out.write("\t\t<link rel=\"stylesheet\" href=\"TEMP/styles/layout.css\" type=\"text/css\" />\n");
      out.write("                <script type=\"text/javascript\">\n");
      out.write("                    function checkFill()\n");
      out.write("                    {\n");
      out.write("                        var fbFrom = document.getElementById(\"from\").value;\n");
      out.write("                        var fbEmail = document.getElementById(\"email\").value;\n");
      out.write("                        var fbPhone = document.getElementById(\"phone\").value;\n");
      out.write("                        var fbSubject = document.getElementById(\"subject\").value;\n");
      out.write("                        var fbMessage = document.getElementById(\"message\").value.trim();\n");
      out.write("                        if(fbFrom == null || fbEmail == null || fbPhone == null || fbSubject == null || fbMessage == null || fbFrom == \"\" || fbEmail == \"\" || fbPhone == \"\" || fbSubject == \"\" || fbMessage == \"\" || (fbMessage.length < 1))\n");
      out.write("                        {\n");
      out.write("                            document.getElementById(\"msg\").innerHTML=\"Details not entered.\";\n");
      out.write("                            return false;\n");
      out.write("                        }\n");
      out.write("                        if(isNaN(fbPhone) || fbPhone.length != 10)\n");
      out.write("                        {\n");
      out.write("                            document.getElementById(\"msg\").innerHTML=\"Phone Number Is Not Valid.\";\n");
      out.write("                            return false;\n");
      out.write("                        }\n");
      out.write("                        return true;\n");
      out.write("                    }\n");
      out.write("                </script>\n");
      out.write("\t</head>\n");
      out.write("\t<body>\n");
      out.write("    <div class=\"backcolor\">\n");
      out.write("    \n");
      out.write("\t\t<div class=\"wrapper row1\">\n");
      out.write("  \t\t\t<div id=\"header\" class=\"clear\">\n");
      out.write("    \t\t\t<div class=\"fl_left\">\n");
      out.write("      \t\t\t\t<h1><a href=\"home.jsp\">E-Lok Geet</a></h1>\n");
      out.write("          \t\t</div>\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t</div>\n");
      out.write("\n");
      out.write("\t\t<div class=\"wrapper row2\">\n");
      out.write("  \t\t\t<div id=\"topnav\">\n");
      out.write("    \t\t\t<div  class=\"clear\">\n");
      out.write("    \t\t\t\t<ul>\n");
      out.write("                                    ");
 
                                    if(session.getAttribute("user")!=null && user.getRole()!=null && user.getRole().equalsIgnoreCase("User")) { 
                                    
      out.write(" \n");
      out.write("                                        <li><a href=\"home.jsp\">Home</a></li>\n");
      out.write("                                        <li><a href=\"usersongs.jsp\">Songs</a></li>\n");
      out.write("                                        <li><a href=\"userdelete.jsp\">Delete</a></li>\n");
      out.write("                                        <li class=\"active\"><a href=\"feedback.jsp\">Feedback</a></li>\n");
      out.write("                                        <li><a href=\"account.jsp\">My Account</a></li>\n");
      out.write("                                        <li class=\"last\"><a href=\"logout1.jsp\">Logout</a></li>\n");
      out.write("                                    ");

                                    } else {
                                    
      out.write("\n");
      out.write("                                        <li><a href=\"home.jsp\">Home</a></li>\n");
      out.write("                                        <li><a href=\"about.jsp\">About Us</a></li>\n");
      out.write("    \t  \t\t\t\t<li><a href=\"contact.jsp\">Contact Us</a></li>\n");
      out.write("      \t\t\t\t\t<li class=\"active\"><a href=\"feedback.jsp\">Feedback</a></li>\n");
      out.write("      \t\t\t\t\t<li><a href=\"gallery.jsp\">Gallery</a></li>\n");
      out.write("      \t\t\t\t\t<li class=\"last\"><a href=\"login.jsp\">Login</a></li>\n");
      out.write("                                    ");

                                    }
                                    
      out.write("\n");
      out.write("    \t\t\t\t</ul>\n");
      out.write("    \t\t  \t</div>\n");
      out.write("  \t\t\t</div>\n");
      out.write("\t\t</div>\n");
      out.write("\n");
      out.write("\t\t<div class=\"wrapper row3\" >\n");
      out.write("  \t\t\t<div id=\"featured_slide\" style=\"padding-top:10px;height:200px;width:1000px;\">\n");
      out.write("    \t\t\t<marquee height=\"180px\" behavior=\"alternate\" direction=\"left\" scrolldelay=\"100\" onmouseover=\"this.stop()\" onmouseout=\"this.start()\">\n");
      out.write("\n");
      out.write("\t\t\t\t\t");
      out.write("<img src=\"Images/gabbar.jpg\" title=\"Gabbar\" style=\"width: 193px; height: 183px;\">\n");
      out.write("\n");
      out.write("<img src=\"Images/yariyaan.jpg\" title=\"Yaariyan\" style=\"width: 193px; height: 183px;\">\n");
      out.write("\n");
      out.write("<img src=\"Images/ragini.jpg\" title=\"Ragini MMS 2\" style=\"width: 193px; height: 183px;\">\n");
      out.write("\n");
      out.write("<img src=\"Images/queen.jpg\" title=\"Queen\" style=\"width: 193px; height: 183px;\">\n");
      out.write("\n");
      out.write("<img src=\"Images/skse.jpg\" title=\"Shaadi Ke Side Effects\" style=\"width: 193px; height: 183px;\">\n");
      out.write("\n");
      out.write("<img src=\"Images/bangbang.jpg\" title=\"Bang Bang\" style=\"width: 193px; height: 183px;\">");
      out.write("\n");
      out.write("    \t\t\t</marquee>\n");
      out.write("  \t\t\t</div>\n");
      out.write("\t\t</div>\n");
      out.write("\n");
      out.write("\t\t<div class=\"wrapper row4\">\n");
      out.write("                    <div id=\"container\" class=\"clear\">\n");
      out.write("                        <p style=\"color: red; font-weight: bold; font-size: 14px;\" id=\"msg\">\n");
      out.write("                        ");

                        if(request.getAttribute("msg")!=null)
                        {
                            
      out.write("\n");
      out.write("                            ");
      out.print(request.getAttribute("msg"));
      out.write("\n");
      out.write("                            ");

                            request.setAttribute("msg", null);
                        }
                        
      out.write("\n");
      out.write("                        </p>\n");
      out.write("    \t\t\t<div id=\"homepage\" style=\"font-size: 14px;\">\n");
      out.write("                            <form action=\"feedback.jsp\" onsubmit=\"return checkFill();\" method=\"POST\">\n");
      out.write("                                <table border=\"0\" cellpadding=\"10px\" style=\"margin-left:auto; margin-right:auto;\">\n");
      out.write("                    <thead>\n");
      out.write("                        <tr>\n");
      out.write("                            <th colspan=\"2\">Feedback</th>\n");
      out.write("                        </tr>\n");
      out.write("                    </thead>\n");
      out.write("                    <tbody>\n");
      out.write("                        <tr>\n");
      out.write("                            <td>From</td>\n");
      out.write("                            <td><input type=\"text\" name=\"from\" id=\"from\" value=\"\" size=\"30\" /></td>\n");
      out.write("                        </tr>\n");
      out.write("                        <tr>\n");
      out.write("                            <td>Email</td>\n");
      out.write("                            <td><input type=\"email\" name=\"email\" id=\"email\" value=\"\" size=\"30\" /></td>\n");
      out.write("                        </tr>\n");
      out.write("                        <tr>\n");
      out.write("                            <td>Phone</td>\n");
      out.write("                            <td><input type=\"number\" name=\"phone\" id=\"phone\" value=\"\" size=\"30\" /></td>\n");
      out.write("                        </tr>\n");
      out.write("                        <tr>\n");
      out.write("                            <td>Subject</td>\n");
      out.write("                            <td><input type=\"text\" name=\"subject\" id=\"subject\" value=\"\" size=\"30\" /></td>\n");
      out.write("                        </tr>\n");
      out.write("                        <tr>\n");
      out.write("                            <td>Message</td>\n");
      out.write("                            <td><textarea name=\"message\" id=\"message\" rows=\"5\" cols=\"20\" maxlength=\"200\"></textarea></td>\n");
      out.write("                        </tr>\n");
      out.write("                        <tr>\n");
      out.write("                            <td colspan=\"2\" style=\"text-align:center;\">\n");
      out.write("                                <input name=\"submit\" type=\"submit\" value=\"Submit\">&nbsp;&nbsp;&nbsp;\n");
      out.write("                        \t<input name=\"reset\" type=\"reset\" value=\"Reset\">\n");
      out.write("                            </td>\n");
      out.write("                        </tr>\n");
      out.write("                    </tbody>\n");
      out.write("                    </table>\n");
      out.write("                            </form>\n");
      out.write("    \t\t\t</div>\n");
      out.write("  \t\t\t</div>\n");
      out.write("\t\t</div>\n");
      out.write("\n");
      out.write("\t\t<div class=\"wrapper\">\n");
      out.write("  \t\t\t<div id=\"copyright\" class=\"clear\">\n");
      out.write("    \t\t\t<p class=\"fl_left\">Copyright &copy; 2014 - All Rights Reserved - </p>\n");
      out.write("    \t\t\t<p class=\"fl_right\">Developed & Designed by Ashwini, Keshav and Prathmesh</p>\n");
      out.write("  \t\t\t</div>\n");
      out.write("\t\t</div>\n");
      out.write("        \n");
      out.write("    </div>\n");
      out.write("    ");
 
    if(session.getAttribute("user")!=null && user.getRole()!=null && user.getRole().equalsIgnoreCase("User")) { 
    
      out.write("                    \n");
      out.write("    <script type=\"text/javascript\">\n");
      out.write("        document.getElementById(\"from\").value = \"");
      out.print(user.getName());
      out.write("\";\n");
      out.write("        document.getElementById(\"email\").value= \"");
      out.print(user.getUserName()+"@");
      out.write("\";\n");
      out.write("        document.getElementById(\"from\").readOnly = true;\n");
      out.write("    </script>\n");
      out.write("    ");

    } else if(session.getAttribute("user")!=null && user.getRole()!=null && user.getRole().equalsIgnoreCase("Admin")) {
        response.sendRedirect("adminfeedback.jsp");
    }
    
      out.write("\n");
      out.write("</body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}

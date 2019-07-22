package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import oms.dao.FeedbackDao;
import oms.dto.Feedback;
import java.util.ArrayList;

public final class adminfeedback_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");

    response.setHeader("Cache-Control", "no-cache");    //Doesnot allow to store in cache memory.
    response.setHeader("Cache-Control", "no-storage");  //Doesonot allow to store in Temp folder.

      out.write('\n');
      oms.dto.User user = null;
      synchronized (session) {
        user = (oms.dto.User) _jspx_page_context.getAttribute("user", PageContext.SESSION_SCOPE);
        if (user == null){
          user = new oms.dto.User();
          _jspx_page_context.setAttribute("user", user, PageContext.SESSION_SCOPE);
        }
      }
      out.write('\n');
 
    if(session.getAttribute("user")!=null && user.getRole()!=null && user.getRole().equalsIgnoreCase("Admin")) { 

        String bt = request.getParameter("mailBt");
        if(bt!=null && bt.equals("Mail")) {
            request.setAttribute("msg", "Mail Sent Successfully.");
            String mailTo[] = request.getParameterValues("chkMailTo");
            String message = request.getParameter("mailMsg");
            for(String email : mailTo) {
                Feedback fb = new Feedback();
                fb.setEmail(email);
                try{
                    new FeedbackDao().emailmsg(fb,message);
                }
                catch (Exception ex) {
                    request.setAttribute("msg", "Mail not sent.");
                    ex.printStackTrace();
                }
                System.out.println(email+"\t"+message);
            }
            
        }

      out.write("\n");
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
      out.write("                        var mailMsg = document.getElementsByName(\"mailMsg\")[0].value.trim();\n");
      out.write("                        var mailTo = false;\n");
      out.write("                        var chkMailTo = document.getElementsByName(\"chkMailTo\");\n");
      out.write("                        for(var x in chkMailTo)\n");
      out.write("                        {\n");
      out.write("                            alert(x.checked);\n");
      out.write("                            if(x.checked == true)\n");
      out.write("                            {\n");
      out.write("                                mailTo = true;\n");
      out.write("                                break;\n");
      out.write("                            }\n");
      out.write("                        }\n");
      out.write("                        if (mailMsg == null || mailMsg == \"\" || mailTo == false)\n");
      out.write("                        {\n");
      out.write("                            document.getElementById(\"msg\").innerHTML = \"Required Details not defined.\";\n");
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
      out.write("     \t \t\t\t\t<li><a href=\"home.jsp\">Home</a></li>\n");
      out.write("                                        <li><a href=\"adminupload.jsp\">Upload</a></li>\n");
      out.write("    \t  \t\t\t\t<li><a href=\"admindelete.jsp\">Delete</a></li>\n");
      out.write("      \t\t\t\t\t<li class=\"active\"><a href=\"adminfeedback.jsp\">Feedback</a></li>\n");
      out.write("      \t\t\t\t\t<li><a href=\"account.jsp\">My Account</a></li>\n");
      out.write("      \t\t\t\t\t<li class=\"last\"><a href=\"logout1.jsp\">Logout</a></li>\n");
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
      out.write("    \t\t\t<div id=\"homepage\">\n");
      out.write("                            <p style=\"color: red; font-weight: bold; font-size: 14px;\" id=\"msg\">\n");
      out.write("                            ");

                            if(request.getAttribute("msg")!=null)
                            {
                                
      out.write("\n");
      out.write("                                ");
      out.print(request.getAttribute("msg"));
      out.write("\n");
      out.write("                                ");

                                request.setAttribute("msg", null);
                            }
                            
      out.write("\n");
      out.write("                            </p>\n");
      out.write("                            <form onsubmit=\"return checkFill();\" method=\"POST\" action=\"adminfeedback.jsp\">\n");
      out.write("                            <table style=\"margin-left: auto; margin-right: auto; font-size: 14px;\">\n");
      out.write("                                     <thead>\n");
      out.write("                                     <tr>\n");
      out.write("                                         <th>DATE</th>\n");
      out.write("                                         <th>FROM</th>\n");
      out.write("                                         <th>EMAIL</th>\n");
      out.write("                                         <th>PHONE</th>\n");
      out.write("                                         <th>SUBJECT</th>\n");
      out.write("                                         <th>MESSAGE</th>\n");
      out.write("                                         <th>MAIL</th>\n");
      out.write("                                     </tr>\n");
      out.write("                                     </thead>\n");
      out.write("                                     <tbody>\n");
      out.write("                                     ");

                                        int i=1;
                                        ArrayList<Feedback> al = new FeedbackDao().getAllFeedbacks();
                                        for(Feedback f : al) {
                                            if(i%2==0) {
                                            
      out.write("\n");
      out.write("                                     <tr style=\"background-color: white\">\n");
      out.write("                                             ");

                                             } else {
                                             
      out.write("  \n");
      out.write("                                     <tr>\n");
      out.write("                                             ");

                                             }
                                             i++;
                                             
      out.write("\n");
      out.write("                                         <td style=\"text-align: left;\"> ");
      out.print( f.getDate() );
      out.write(" </td>\n");
      out.write("                                         <td style=\"text-align: left;\"> ");
      out.print( f.getFrom() );
      out.write(" </td>\n");
      out.write("                                         <td style=\"text-align: left;\"> ");
      out.print( f.getEmail() );
      out.write(" </td>\n");
      out.write("                                         <td> ");
      out.print( f.getPhone() );
      out.write(" </td>\n");
      out.write("                                         <td style=\"text-align: left;\"> ");
      out.print( f.getSubject() );
      out.write(" </td>\n");
      out.write("                                         <td style=\"text-align: left;\"> ");
      out.print( f.getMessage() );
      out.write(" </td>\n");
      out.write("                                         <td><input type=\"checkbox\" name=\"chkMailTo\" value=\"");
      out.print( f.getEmail() );
      out.write("\" /></td>\n");
      out.write("\n");
      out.write("                                         \n");
      out.write("                                     </tr>\n");
      out.write("                                     ");

                                     }
                                     
      out.write("\n");
      out.write("                                     \n");
      out.write("                                     </tbody>\n");
      out.write("                                 </table>\n");
      out.write("                                 <p style=\"text-align: center;\">\n");
      out.write("                                     <textarea style=\"width: 500px; height: 200px; font-size: 18px; \" name=\"mailMsg\">Thank You for your feedback.</textarea>\n");
      out.write("                                     <br/><br/><input type=\"submit\" name=\"mailBt\" value=\"Mail\" style=\"font-size: 20px;\" />\n");
      out.write("                                 </p>\n");
      out.write("                                 </form>\n");
      out.write("    \t\t\t</div>\n");
      out.write("                    </div>\n");
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
      out.write("\t</body>\n");
      out.write("</html>\n");

    } else {
        response.sendRedirect("logout1.jsp");
    }

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

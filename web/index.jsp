<%-- <%@page import="java.io.File"%>
<%@page import="java.util.List"%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.*"%>
<%@page import="oms.conn.MyConnection"%>
<%@page import="org.apache.commons.fileupload.*" %>
<%@page import="org.apache.commons.io.*" %>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
 /*   Connection con = new MyConnection().getConnection();
    PreparedStatement ps = con.prepareStatement("Select data from songs");
    ResultSet rs = ps.executeQuery();
    rs.next();
    Blob bl = rs.getBlob("data");
    byte[] file = bl.getBytes(1, (int) bl.length());
//    response.setContentType("audio/mpeg3;audio/x-mpeg-3;video/mpeg;video/x-mpeg;image/jpeg");
    response.setContentType("audio/mpeg");
    response.addHeader("Content-Disposition", "attachment; filename= abcde");
    response.setContentLength((int) bl.length());
    ServletOutputStream out1 = null;

    try{
        out1 = response.getOutputStream();
        out1.write(file);
        out1.flush();
    } catch (IOException e) {
        // TODO Auto-generated catch block
        e.printStackTrace();
    } finally {
        out1.close();
        out1.flush();
    } */
    
%>
    
<%
             FileItemFactory factory = new DiskFileItemFactory();
             ServletFileUpload upload = new ServletFileUpload(factory);
             Iterator<FileItem> iterator = upload.parseRequest(request).iterator();
             File uploadedFile;
             String dirPath="F:\\fileuploads";
             while (iterator.hasNext()) {

                    FileItem item = iterator.next();
                    if (!item.isFormField()) {

                        String fileNameWithExt = item.getName();

                        File filePath = new File(dirPath);

                        if (!filePath.exists()) {
                            filePath.mkdirs();
                        }

                        uploadedFile = new File(dirPath + "/" + fileNameWithExt);
                        item.write(uploadedFile);                  
                    }
                    else {
                        String otherFieldName = item.getFieldName();
                        String otherFieldValue = item.getString();
                        System.out.println(otherFieldName+otherFieldValue);
                    }
               }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html> --%>

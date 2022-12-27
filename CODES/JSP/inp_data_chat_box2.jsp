<%@ page import="java.sql.*"%>
<%@ page import = "java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import = "javax.servlet.http.*" %>
<%@ page import = "org.apache.commons.fileupload.*" %>
<%@ page import = "org.apache.commons.fileupload.disk.*" %>
<%@ page import = "org.apache.commons.fileupload.servlet.*" %>
<%@ page import = "org.apache.commons.io.output.*" %>
<html>
<head>
 <title>Notification</title>
</head>
<body>

<%
 try
 {
    
    String chat_id = request.getParameter("chat_id");
    String message1 = request.getParameter("msg");
    String message2 = request.getParameter("msg2");
    String id1 = (String)session.getAttribute("userid");

    String message = message1 + "\n" + message2;

    Connection conn11 = null;
   ResultSet rs11 = null;
   Statement stmt11 = null;
   Class.forName("com.mysql.jdbc.Driver").newInstance();
   conn11 = DriverManager.getConnection("jdbc:mysql://localhost:3306/apnaroom","root","");
   stmt11 = conn11.createStatement();
   
   int status = stmt11.executeUpdate("UPDATE `chat_box` SET `message` = '"+message+"' WHERE `chat_box`.`chat_id` = '"+chat_id+"'");


    if(status!=0)
    {
     response.sendRedirect("chat_box.jsp");
    }
    else
    {
      response.sendRedirect("notification.jsp");
    }


}
catch(Exception e)
{
      out.println("Exception :- "+e);
}
%>


</body>
</html>